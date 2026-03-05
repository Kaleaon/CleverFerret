package com.cleverferret.v2.core.network.telemetry

import java.time.Instant

data class TelemetryEvent(
    val schemaVersion: String,
    val eventName: String,
    val integration: String,
    val operation: String,
    val requestId: String,
    val timestamp: Instant,
    val success: Boolean,
    val errorType: String?,
    val userFacingState: String?,
    val attributes: Map<String, String>,
) {
    companion object { const val SCHEMA_VERSION: String = "v1" }
}
