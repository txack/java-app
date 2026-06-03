# Production image for Java Spring Boot application
# Expects pre-built JAR in target/ (built by CI pipeline)
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# Security: create non-root user
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Download OpenTelemetry Java Agent
ARG OTEL_AGENT_VERSION=2.12.0
ADD --chmod=644 https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v${OTEL_AGENT_VERSION}/opentelemetry-javaagent.jar /app/opentelemetry-javaagent.jar

# Copy pre-built JAR from CI build output
COPY target/*.jar app.jar

# Set ownership
RUN chown -R appuser:appuser /app

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD java -cp app.jar org.springframework.boot.loader.JarLauncher &> /dev/null || exit 1

# Expose port
EXPOSE 8080

# Switch to non-root user
USER appuser

# Run with OTel Java Agent
ENTRYPOINT ["java", "-javaagent:/app/opentelemetry-javaagent.jar", "-jar", "app.jar"]
