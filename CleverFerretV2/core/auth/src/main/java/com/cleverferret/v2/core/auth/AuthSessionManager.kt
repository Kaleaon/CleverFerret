package com.cleverferret.v2.core.auth

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult

class AuthSessionManager(
    private val tokenStore: TokenStore,
    private val refreshClient: TokenRefreshClient,
    private val nowEpochMillis: () -> Long,
) {
    fun beginDevicePinFlow(client: DevicePinAuthClient): IntegrationResult<DevicePinChallenge> =
        client.startDevicePinFlow()

    fun completeDevicePinFlow(client: DevicePinAuthClient, deviceCode: String): IntegrationResult<AuthTokens> {
        val result = client.pollForAccessToken(deviceCode)
        if (result is IntegrationResult.Success<AuthTokens>) {
            tokenStore.write(result.value)
        }
        return result
    }

    fun getValidAccessToken(): IntegrationResult<String> {
        val tokens = tokenStore.read()
            ?: return IntegrationResult.failure(
                AppError.AuthenticationFailure("No active session", "plex"),
                UserFacingState.AUTH_REQUIRED,
            )

        if (!tokens.isExpired(nowEpochMillis())) {
            return IntegrationResult.success(tokens.accessToken)
        }

        val refreshToken = tokens.refreshToken
            ?: return IntegrationResult.failure(
                AppError.AuthenticationFailure("Session expired and refresh token is missing", "plex"),
                UserFacingState.AUTH_REQUIRED,
            )

        return when (val refreshResult = refreshClient.refresh(refreshToken)) {
            is IntegrationResult.Success<AuthTokens> -> {
                tokenStore.write(refreshResult.value)
                IntegrationResult.success(refreshResult.value.accessToken)
            }
            is IntegrationResult.Failure -> {
                tokenStore.clear()
                refreshResult
            }
        }
    }

    fun signOut(onLocalRevocation: () -> Unit, sensitiveCache: SensitiveCache) {
        tokenStore.clear()
        onLocalRevocation()
        sensitiveCache.clearSensitiveData()
    }
}
