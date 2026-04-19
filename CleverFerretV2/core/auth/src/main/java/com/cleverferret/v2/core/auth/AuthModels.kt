package com.cleverferret.v2.core.auth

data class AuthTokens(
    val accessToken: String,
    val refreshToken: String?,
    val expiresAtEpochMillis: Long,
) {
    fun isExpired(nowEpochMillis: Long): Boolean = nowEpochMillis >= expiresAtEpochMillis
}

data class DevicePinChallenge(
    val deviceCode: String,
    val userCode: String,
    val verificationUri: String,
    val expiresAtEpochMillis: Long,
    val pollIntervalSeconds: Int,
)

data class AuthSessionState(
    val connectedAccountId: String,
    val connectedAtEpochMillis: Long,
    val lastHealthCheckEpochMillis: Long,
    val healthy: Boolean,
)
