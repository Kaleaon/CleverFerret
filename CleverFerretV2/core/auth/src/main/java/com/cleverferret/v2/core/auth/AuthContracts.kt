package com.cleverferret.v2.core.auth

import com.cleverferret.v2.core.common.result.IntegrationResult

interface TokenStore {
    fun read(): AuthTokens?
    fun write(tokens: AuthTokens)
    fun clear()
}

interface SensitiveCache {
    fun clearSensitiveData()
}

interface DevicePinAuthClient {
    fun startDevicePinFlow(): IntegrationResult<DevicePinChallenge>
    fun pollForAccessToken(deviceCode: String): IntegrationResult<AuthTokens>
}

interface TokenRefreshClient {
    fun refresh(refreshToken: String): IntegrationResult<AuthTokens>
}
