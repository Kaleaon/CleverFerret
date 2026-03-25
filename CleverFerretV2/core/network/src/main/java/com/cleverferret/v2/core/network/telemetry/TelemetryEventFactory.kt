package com.cleverferret.v2.core.network.telemetry

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import java.time.Instant

object TelemetryEventFactory {

    data class SuccessParams(
        val eventName: String,
        val integration: String,
        val operation: String,
        val requestId: String,
        val attributes: Map<String, String>
    )

    data class FailureParams(
        val eventName: String,
        val integration: String,
        val operation: String,
        val requestId: String,
        val error: AppError,
        val state: UserFacingState,
        val attributes: Map<String, String>
    )

    fun success(params: SuccessParams): TelemetryEvent =
        TelemetryEvent(
            schemaVersion = TelemetryEvent.SCHEMA_VERSION,
            eventName = params.eventName,
            integration = params.integration,
            operation = params.operation,
            requestId = params.requestId,
            timestamp = Instant.now(),
            success = true,
            errorType = null,
            userFacingState = null,
            attributes = params.attributes
        )

    fun failure(params: FailureParams): TelemetryEvent =
        TelemetryEvent(
            schemaVersion = TelemetryEvent.SCHEMA_VERSION,
            eventName = params.eventName,
            integration = params.integration,
            operation = params.operation,
            requestId = params.requestId,
            timestamp = Instant.now(),
            success = false,
            errorType = params.error::class.simpleName,
            userFacingState = params.state.name,
            attributes = params.attributes
        )
}
