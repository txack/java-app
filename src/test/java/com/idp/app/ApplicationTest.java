package com.idp.app;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Spring Boot application context tests.
 */
@SpringBootTest
class ApplicationTest {

    @Test
    void contextLoads() {
        assertTrue(true, "Application context should load successfully");
    }
}
