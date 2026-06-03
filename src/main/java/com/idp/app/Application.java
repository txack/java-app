package com.idp.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * Main Spring Boot Application entry point.
 *
 * Application: java-otel-test
 * Description: Java app with otel
 */
@SpringBootApplication
@ComponentScan(basePackages = {"com.idp.app"})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
