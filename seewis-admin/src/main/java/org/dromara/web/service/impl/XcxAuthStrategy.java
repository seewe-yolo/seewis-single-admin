package org.dromara.web.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.stp.parameter.SaLoginParameter;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.constant.SystemConstants;
import org.dromara.common.core.domain.model.XcxLoginBody;
import org.dromara.common.core.domain.model.XcxLoginUser;
import org.dromara.common.core.enums.UserType;
import org.dromara.common.core.exception.ServiceException;
import org.dromara.common.core.exception.user.UserException;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.core.utils.ValidatorUtils;
import org.dromara.common.json.utils.JsonUtils;
import org.dromara.common.redis.utils.RedisUtils;
import org.dromara.common.satoken.utils.LoginHelper;
import org.dromara.system.domain.SysUser;
import org.dromara.system.domain.bo.SysSocialBo;
import org.dromara.system.domain.bo.SysUserBo;
import org.dromara.system.domain.vo.SysClientVo;
import org.dromara.system.domain.vo.SysUserVo;
import org.dromara.system.domain.vo.SysSocialVo;
import org.dromara.system.mapper.SysUserMapper;
import org.dromara.system.service.ISysSocialService;
import org.dromara.system.service.ISysUserService;
import org.dromara.web.domain.vo.LoginVo;
import org.dromara.web.service.IAuthStrategy;
import org.dromara.web.service.SysLoginService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestClient;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.Duration;
import java.util.List;
import java.util.Map;

/**
 * 小程序认证策略
 *
 * @author Michelle.Chung
 */
@Slf4j
@Service("xcx" + IAuthStrategy.BASE_NAME)
@RequiredArgsConstructor
public class XcxAuthStrategy implements IAuthStrategy {

    private static final String SOCIAL_SOURCE = "wechat_mp";
    private static final String ACCESS_TOKEN_CACHE_KEY_PREFIX = "wechat:miniapp:access_token:";

    private final SysLoginService loginService;
    private final SysUserMapper userMapper;
    private final ISysSocialService socialService;
    private final ISysUserService userService;
    private final RestClient restClient = RestClient.create();

    @Value("${wechat.miniapp.app-id:}")
    private String configuredAppId;

    @Value("${wechat.miniapp.app-secret:}")
    private String appSecret;

    @Override
    public LoginVo login(String body, SysClientVo client) {
        XcxLoginBody loginBody = JsonUtils.parseObject(body, XcxLoginBody.class);
        ValidatorUtils.validate(loginBody);
        // xcxCode 为 小程序调用 wx.login 授权后获取
        String xcxCode = loginBody.getXcxCode();
        String appid = StringUtils.blankToDefault(configuredAppId, loginBody.getAppid());
        if (StringUtils.isBlank(appid) || StringUtils.isBlank(appSecret)) {
            throw new ServiceException("微信小程序 AppID 或 AppSecret 未配置");
        }
        if (StringUtils.isNotBlank(loginBody.getAppid()) && !StringUtils.equals(appid, loginBody.getAppid())) {
            throw new ServiceException("微信小程序 AppID 不匹配");
        }

        WechatSession session = requestSession(appid, xcxCode);
        String phoneNumber = requestPhoneNumber(getAccessToken(appid), loginBody.getPhoneCode());
        SysUserVo user = loadUser(session.openid(), phoneNumber, session.unionid());
        // 此处可根据登录用户的数据不同 自行创建 loginUser 属性不够用继承扩展就行了
        XcxLoginUser loginUser = new XcxLoginUser();
        loginUser.setUserId(user.getUserId());
        loginUser.setUsername(user.getUserName());
        loginUser.setNickname(user.getNickName());
        loginUser.setUserType(user.getUserType());
        loginUser.setClientKey(client.getClientKey());
        loginUser.setDeviceType(client.getDeviceType());
        loginUser.setOpenid(session.openid());

        SaLoginParameter model = new SaLoginParameter();
        model.setDeviceType(client.getDeviceType());
        // 自定义分配 不同用户体系 不同 token 授权时间 不设置默认走全局 yml 配置
        // 例如: 后台用户30分钟过期 app用户1天过期
        model.setTimeout(client.getTimeout());
        model.setActiveTimeout(client.getActiveTimeout());
        model.setExtra(LoginHelper.CLIENT_KEY, client.getClientId());
        // 生成token
        LoginHelper.login(loginUser, model);

        LoginVo loginVo = new LoginVo();
        loginVo.setAccessToken(StpUtil.getTokenValue());
        loginVo.setExpireIn(StpUtil.getTokenTimeout());
        loginVo.setClientId(client.getClientId());
        loginVo.setOpenid(session.openid());
        return loginVo;
    }

    private SysUserVo loadUser(String openid, String phoneNumber, String unionId) {
        String authId = SOCIAL_SOURCE + openid;
        List<SysSocialVo> bindings = socialService.selectByAuthId(authId);
        SysUserVo user = bindings.isEmpty() ? null : userMapper.selectVoById(bindings.get(0).getUserId());
        if (ObjectUtil.isNull(user) && StringUtils.isNotBlank(phoneNumber)) {
            List<SysUserVo> users = userMapper.selectVoList(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getPhonenumber, phoneNumber));
            if (users.size() > 1) {
                throw new ServiceException("该手机号关联了多个系统用户，无法登录");
            }
            user = users.isEmpty() ? registerUser(phoneNumber) : users.get(0);
            bindUser(user, authId, openid, unionId);
        }
        if (ObjectUtil.isNull(user)) {
            throw new UserException("user.not.exists", StringUtils.isBlank(phoneNumber) ? "微信小程序用户" : "微信小程序手机号");
        }
        if (SystemConstants.DISABLE.equals(user.getStatus())) {
            throw new UserException("user.blocked", user.getUserName());
        }
        return user;
    }

    private SysUserVo registerUser(String phoneNumber) {
        String username = buildUsername(phoneNumber);
        SysUserBo user = new SysUserBo();
        user.setUserName(username);
        user.setNickName(username);
        user.setPhonenumber(phoneNumber);
        user.setUserType(UserType.APP_USER.getUserType());
        user.setStatus(SystemConstants.NORMAL);
        if (!userService.registerUser(user)) {
            throw new ServiceException("微信小程序用户注册失败");
        }
        SysUserVo registered = userMapper.selectVoOne(new LambdaQueryWrapper<SysUser>()
            .eq(SysUser::getUserName, username));
        if (ObjectUtil.isNull(registered)) {
            throw new ServiceException("微信小程序用户注册失败");
        }
        return registered;
    }

    private String buildUsername(String phoneNumber) {
        String suffix = phoneNumber.substring(phoneNumber.length() - 4);
        String username;
        do {
            username = "wx_" + RandomUtil.randomString("abcdefghijklmnopqrstuvwxyz", 4) + "_" + suffix;
        } while (userMapper.exists(new LambdaQueryWrapper<SysUser>().eq(SysUser::getUserName, username)));
        return username;
    }

    private void bindUser(SysUserVo user, String authId, String openid, String unionId) {
        SysSocialBo binding = new SysSocialBo();
        binding.setUserId(user.getUserId());
        binding.setAuthId(authId);
        binding.setSource(SOCIAL_SOURCE);
        binding.setOpenId(openid);
        binding.setUnionId(unionId);
        binding.setUserName(user.getUserName());
        binding.setNickName(user.getNickName());
        binding.setAccessToken("wechat-miniapp");
        socialService.insertByBo(binding);
    }

    private WechatSession requestSession(String appid, String code) {
        String response = restClient.get().uri(uriBuilder -> uriBuilder
            .scheme("https")
            .host("api.weixin.qq.com")
            .path("/sns/jscode2session")
            .queryParam("appid", appid)
            .queryParam("secret", appSecret)
            .queryParam("js_code", code)
            .queryParam("grant_type", "authorization_code")
            .build()).retrieve().body(String.class);
        WechatSession session = JsonUtils.parseObject(response, WechatSession.class);
        checkWechatResponse(session.errcode(), session.errmsg());
        if (StringUtils.isBlank(session.openid())) {
            throw new ServiceException("微信登录未返回 openid");
        }
        return session;
    }

    private String getAccessToken(String appid) {
        String cacheKey = ACCESS_TOKEN_CACHE_KEY_PREFIX + appid;
        String cached = RedisUtils.getCacheObject(cacheKey);
        if (StringUtils.isNotBlank(cached)) {
            return cached;
        }
        String response = restClient.get().uri(uriBuilder -> uriBuilder
            .scheme("https")
            .host("api.weixin.qq.com")
            .path("/cgi-bin/token")
            .queryParam("appid", appid)
            .queryParam("secret", appSecret)
            .queryParam("grant_type", "client_credential")
            .build()).retrieve().body(String.class);
        WechatAccessToken token = JsonUtils.parseObject(response, WechatAccessToken.class);
        checkWechatResponse(token.errcode(), token.errmsg());
        if (StringUtils.isBlank(token.access_token())) {
            throw new ServiceException("微信接口未返回 access_token");
        }
        int expiresIn = token.expires_in() == null ? 7200 : token.expires_in();
        RedisUtils.setCacheObject(cacheKey, token.access_token(),
            Duration.ofSeconds(Math.max(expiresIn - 60, 60)));
        return token.access_token();
    }

    private String requestPhoneNumber(String accessToken, String phoneCode) {
        String response = restClient.post().uri(uriBuilder -> uriBuilder
                .scheme("https")
                .host("api.weixin.qq.com")
                .path("/wxa/business/getuserphonenumber")
                .queryParam("access_token", accessToken)
                .build())
            .contentType(MediaType.APPLICATION_JSON)
            .body(Map.of("code", phoneCode))
            .retrieve().body(String.class);
        WechatPhoneResponse phone = JsonUtils.parseObject(response, WechatPhoneResponse.class);
        checkWechatResponse(phone.errcode(), phone.errmsg());
        if (phone.phone_info() == null || StringUtils.isBlank(phone.phone_info().phoneNumber())) {
            throw new ServiceException("微信接口未返回手机号");
        }
        return phone.phone_info().phoneNumber();
    }

    private void checkWechatResponse(Integer errcode, String errmsg) {
        if (errcode != null && errcode != 0) {
            throw new ServiceException("微信接口调用失败: " + errmsg);
        }
    }

    private record WechatSession(String openid, String unionid, Integer errcode, String errmsg) {}

    private record WechatAccessToken(String access_token, Integer expires_in, Integer errcode, String errmsg) {}

    private record WechatPhoneResponse(@JsonProperty("phone_info") WechatPhoneInfo phone_info,
                                       Integer errcode, String errmsg) {}

    private record WechatPhoneInfo(@JsonProperty("phoneNumber") String phoneNumber) {}

}
