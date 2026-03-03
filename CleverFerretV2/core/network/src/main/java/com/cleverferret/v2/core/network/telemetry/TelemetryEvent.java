package com.cleverferret.v2.core.network.telemetry;

import java.time.Instant;
import java.util.Map;

/**
 * Unified telemetry event schema for outbound integrations.
 */
public record TelemetryEvent(
        String schemaVersion,
        String eventName,
        String integration,
        String operation,
        String requestId,
        Instant timestamp,
        boolean success,
        String errorType,
        String userFacingState,
        Map<String, String> attributes
) {
    public static final String SCHEMA_VERSION = "v1";
}
