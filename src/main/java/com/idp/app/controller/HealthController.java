package com.idp.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Health check and info endpoints.
 */
@RestController
public class HealthController {

    private static final Logger logger = LoggerFactory.getLogger(HealthController.class);

    @Value("${spring.profiles.active:development}")
    private String environment;

    /**
     * Root endpoint with service information and available endpoints.
     *
     * @return Service info response
     */
    @GetMapping("/")
    public ResponseEntity<Map<String, Object>> root() {
        logger.debug("Root endpoint accessed");
        Map<String, Object> response = new LinkedHashMap<>();
        response.put("service", "idp-java-otel-test");
        response.put("message", "Welcome to idp-java-otel-test");
        response.put("environment", environment);

        Map<String, String> endpoints = new LinkedHashMap<>();
        endpoints.put("api", "/api/v1/info");
        endpoints.put("health", "/api/v1/health");
        endpoints.put("docs", "/swagger-ui.html");
        endpoints.put("redoc", "/redoc");
        endpoints.put("metrics", "/actuator/prometheus");
        response.put("endpoints", endpoints);

        return ResponseEntity.ok(response);
    }

    /**
     * Health check endpoint.
     *
     * @return Health status response
     */
    @GetMapping("/api/v1/health")
    public ResponseEntity<Map<String, Object>> health() {
        logger.debug("Health check requested");
        Map<String, Object> response = new HashMap<>();
        response.put("status", "UP");
        response.put("service", "idp-java-otel-test");
        return ResponseEntity.ok(response);
    }

    /**
     * Application info endpoint.
     *
     * @return Application info
     */
    @GetMapping("/api/v1/info")
    public ResponseEntity<Map<String, Object>> info() {
        logger.debug("Info requested");
        Map<String, Object> response = new HashMap<>();
        response.put("name", "idp-java-otel-test");
        response.put("description", "Java app with otel");
        response.put("version", "0.0.1");
        return ResponseEntity.ok(response);
    }
}
