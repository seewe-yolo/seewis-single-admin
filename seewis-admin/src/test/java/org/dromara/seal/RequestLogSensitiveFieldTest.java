package org.dromara.seal;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.dromara.common.core.constant.SystemConstants;
import org.dromara.common.web.interceptor.PlusWebInvokeTimeInterceptor;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.jupiter.api.Assertions.*;

@Tag("dev")
class RequestLogSensitiveFieldTest {

    @Test
    void removesMiniappLoginCodesFromRequestLogs() throws Exception {
        var body = new ObjectMapper().readTree("{\"xcxCode\":\"one-time-code\",\"phoneCode\":\"phone-auth-code\",\"clientId\":\"public-client\"}");

        ReflectionTestUtils.invokeMethod(new PlusWebInvokeTimeInterceptor(), "removeSensitiveFields",
            body, SystemConstants.EXCLUDE_PROPERTIES);

        assertFalse(body.has("xcxCode"));
        assertFalse(body.has("phoneCode"));
        assertEquals("public-client", body.get("clientId").asText());
    }
}
