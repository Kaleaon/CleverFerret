package com.cleverferret.v2.core.network.telemetry

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import java.time.Instant

object TelemetryEventFactory {
    fun success(eventName: String, integration: String, operation: String, requestId: String, attributes: Map<String, String>): TelemetryEvent =
        TelemetryEvent(TelemetryEvent.SCHEMA_VERSION, eventName, integration, operation, requestId, Instant.now(), true, null, null, attributes)

    fun failure(eventName: String, integration: String, operation: String, requestId: String, error: AppError, state: UserFacingState, attributes: Map<String, String>): TelemetryEvent =
        TelemetryEvent(TelemetryEvent.SCHEMA_VERSION, eventName, integration, operation, requestId, Instant.now(), false, error::class.simpleName, state.name, attributes)
}
