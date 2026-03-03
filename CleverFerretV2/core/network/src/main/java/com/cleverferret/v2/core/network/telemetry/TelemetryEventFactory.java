package com.cleverferret.v2.core.network.telemetry;

import com.cleverferret.v2.core.common.error.AppError;
import com.cleverferret.v2.core.common.error.UserFacingState;

import java.time.Instant;
import java.util.Map;

public final class TelemetryEventFactory {
    private TelemetryEventFactory() {}

    public static TelemetryEvent success(
            String eventName,
            String integration,
            String operation,
            String requestId,
            Map<String, String> attributes
    ) {
        return new TelemetryEvent(
                TelemetryEvent.SCHEMA_VERSION,
                eventName,
                integration,
                operation,
                requestId,
                Instant.now(),
                true,
                null,
                null,
                attributes
        );
    }

    public static TelemetryEvent failure(
            String eventName,
            String integration,
            String operation,
            String requestId,
            AppError error,
            UserFacingState state,
            Map<String, String> attributes
    ) {
        return new TelemetryEvent(
                TelemetryEvent.SCHEMA_VERSION,
                eventName,
                integration,
                operation,
                requestId,
                Instant.now(),
                false,
                error.getClass().getSimpleName(),
                state.name(),
                attributes
        );
    }
}
