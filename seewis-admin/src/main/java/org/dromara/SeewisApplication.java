package org.dromara;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.metrics.buffering.BufferingApplicationStartup;
import org.springframework.core.env.Environment;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 启动程序
 *
 * @author Lion Li
 */

@Slf4j
@RequiredArgsConstructor
@SpringBootApplication
public class SeewisApplication implements ApplicationRunner {

    private final Environment environment;

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(SeewisApplication.class);
        application.setApplicationStartup(new BufferingApplicationStartup(2048));
        application.run(args);
    }

    @Override
    public void run(ApplicationArguments args) {
        String port = environment.getProperty("local.server.port",
            environment.getProperty("server.port", "8080"));
        String contextPath = environment.getProperty("server.servlet.context-path", "");
        String apiDocsPath = environment.getProperty("springdoc.api-docs.path", "/v3/api-docs");
        if ("/".equals(contextPath)) {
            contextPath = "";
        }
        if (!apiDocsPath.startsWith("/")) {
            apiDocsPath = "/" + apiDocsPath;
        }

        String host = "localhost";
        try {
            host = InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException e) {
            log.warn("获取本机地址失败，使用 localhost 作为服务地址", e);
        }

        String serviceUrl = "http://" + host + ":" + port + contextPath;
        log.info("Seewis-single-admin 启动成功，服务地址：{}", serviceUrl);
        log.info("API 文档地址：{}{}", serviceUrl, apiDocsPath);
    }
}
