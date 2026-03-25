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
        TelemetryEvent(TelemetryEvent.SCHEMA_VERSION, params.eventName, params.integration, params.operation, params.requestId, Instant.now(), true, null, null, params.attributes)

    fun failure(params: FailureParams): TelemetryEvent =
        TelemetryEvent(TelemetryEvent.SCHEMA_VERSION, params.eventName, params.integration, params.operation, params.requestId, Instant.now(), false, params.error::class.simpleName, params.state.name, params.attributes)
}
