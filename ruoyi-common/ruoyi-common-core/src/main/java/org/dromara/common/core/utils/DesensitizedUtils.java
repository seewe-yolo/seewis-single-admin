package org.dromara.common.core.utils;

import cn.hutool.core.util.DesensitizedUtil;
import cn.hutool.core.util.StrUtil;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * 脱敏工具类
 *
 * @author AprilWind
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class DesensitizedUtils extends DesensitizedUtil {

    /**
     * 灵活脱敏方法
     *
     * @param value         原始字符串
     * @param prefixVisible 前面可见长度
     * @param suffixVisible 后面可见长度
     * @param maskLength    中间掩码长度（固定显示多少 *，如果总长度不足则自动缩减）
     * @return 脱敏后字符串
     */
    public static String mask(String value, int prefixVisible, int suffixVisible, int maskLength) {
        if (StrUtil.isBlank(value)) {
            return value;
        }

        int len = value.length();

        // 总长度小于等于前后可见长度 → 全部掩码
        if (len <= prefixVisible + suffixVisible) {
            return StrUtil.repeat('*', len);
        }

        String prefix = value.substring(0, prefixVisible);
        String suffix = value.substring(len - suffixVisible);
        // 中间可用于脱敏的最大长度
        int middleLen = len - prefixVisible - suffixVisible;
        // 实际掩码长度 至少脱敏 1 位
        int actualMaskLen = Math.max(1, Math.min(maskLength, middleLen));
        return prefix + StrUtil.repeat('*', actualMaskLen) + suffix;
    }

}
