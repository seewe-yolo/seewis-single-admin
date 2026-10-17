package org.dromara.web.service.impl;

import cn.hutool.extra.spring.SpringUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpServer;
import org.dromara.common.core.exception.ServiceException;
import org.dromara.common.core.utils.SpringUtils;
import org.dromara.common.json.utils.JsonUtils;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.client.RestClient;

import java.net.InetSocketAddress;
import java.net.URI;
import java.nio.charset.StandardCharsets;

import static org.junit.jupiter.api.Assertions.*;

/** 使用本地 HTTP 服务验证传输报文和 HTTP 错误处理。 */
@Tag("dev")
class XcxAuthStrategyTest {
    private static Object previousBeanFactory;
    private final XcxAuthStrategy strategy = new XcxAuthStrategy(null, null, null, null, null);
    private HttpServer server;
    private Headers requestHeaders;
    private byte[] requestBody;
    private int responseStatus = 200;
    private String responseBody = "{\"errcode\":0,\"phone_info\":{\"phoneNumber\":\"13800000000\"}}";

    @BeforeAll
    static void initializeJsonUtils() {
        previousBeanFactory = ReflectionTestUtils.getField(SpringUtil.class, "beanFactory");
        var factory = new DefaultListableBeanFactory();
        factory.registerSingleton("objectMapper", new ObjectMapper());
        new SpringUtils().postProcessBeanFactory(factory);
        JsonUtils.getObjectMapper();
    }

    @AfterAll
    static void restoreBeanFactory() {
        ReflectionTestUtils.setField(SpringUtil.class, "beanFactory", previousBeanFactory);
    }

    @BeforeEach
    void startServer() throws Exception {
        server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        server.createContext("/wxa/business/getuserphonenumber", exchange -> {
            requestHeaders = exchange.getRequestHeaders();
            requestBody = exchange.getRequestBody().readAllBytes();
            byte[] response = responseBody.getBytes(StandardCharsets.UTF_8);
            exchange.getResponseHeaders().set("Content-Type", "application/json");
            exchange.sendResponseHeaders(responseStatus, response.length);
            try (var output = exchange.getResponseBody()) {
                output.write(response);
            }
        });
        server.start();
        var factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(2000);
        factory.setReadTimeout(2000);
        RestClient client = RestClient.builder().requestFactory((uri, method) -> factory.createRequest(
            URI.create("http://127.0.0.1:" + server.getAddress().getPort() + uri.getRawPath()), method)).build();
        ReflectionTestUtils.setField(strategy, "restClient", client);
    }

    @AfterEach
    void stopServer() {
        if (server != null) server.stop(0);
    }

    @Test
    void sendsFixedLengthUtf8JsonWithoutChunkedEncoding() {
        String phone = ReflectionTestUtils.invokeMethod(strategy, "requestPhoneNumber", "test-token", "测试-code");
        assertEquals("13800000000", phone);
        assertEquals("{\"code\":\"测试-code\"}", new String(requestBody, StandardCharsets.UTF_8));
        assertEquals(String.valueOf(requestBody.length), requestHeaders.getFirst("Content-Length"));
        assertNull(requestHeaders.getFirst("Transfer-Encoding"));
        assertEquals("application/json", requestHeaders.getFirst("Content-Type"));
    }

    @Test
    void convertsHttp412ToBusinessErrorWithoutLeakingResponseOrCredentials() {
        responseStatus = 412;
        responseBody = "sensitive-upstream-response";
        ServiceException error = assertThrows(ServiceException.class, () ->
            ReflectionTestUtils.invokeMethod(strategy, "requestPhoneNumber", "secret-token", "secret-code"));
        assertEquals("微信手机号接口请求失败（HTTP 412），请稍后重新授权", error.getMessage());
        assertNull(error.getCause());
    }

    @Test
    void stillRejectsWechatBusinessErrors() {
        responseBody = "{\"errcode\":40029,\"errmsg\":\"invalid code\"}";
        ServiceException error = assertThrows(ServiceException.class, () ->
            ReflectionTestUtils.invokeMethod(strategy, "requestPhoneNumber", "test-token", "expired-code"));
        assertEquals("微信接口调用失败: invalid code", error.getMessage());
    }
}
