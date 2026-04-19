package com.cleverferret.v2.core.auth

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.result.IntegrationResult
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertIs
import kotlin.test.assertNull
import kotlin.test.assertTrue

class AuthSessionManagerTest {
    @Test
    fun `auth success stores token and returns access token`() {
        val store = InMemoryTokenStore()
        val refreshClient = object : TokenRefreshClient {
            override fun refresh(refreshToken: String) = IntegrationResult.success(
                AuthTokens("refreshed", "refresh", expiresAtEpochMillis = 9_999),
            )
        }
        val manager = AuthSessionManager(store, refreshClient) { 1_000 }
        val deviceClient = object : DevicePinAuthClient {
            override fun startDevicePinFlow() = IntegrationResult.success(DevicePinChallenge("d","u","https://verify",3_000,5))
            override fun pollForAccessToken(deviceCode: String) = IntegrationResult.success(AuthTokens("access", "refresh", 2_000))
        }

        manager.completeDevicePinFlow(deviceClient, "d")
        val token = manager.getValidAccessToken()

        assertEquals("access", (token as IntegrationResult.Success).value)
    }

    @Test
    fun `expired token refreshes`() {
        val store = InMemoryTokenStore().apply {
            write(AuthTokens("expired", "refresh-token", expiresAtEpochMillis = 10))
        }
        val manager = AuthSessionManager(store, object : TokenRefreshClient {
            override fun refresh(refreshToken: String) = IntegrationResult.success(
                AuthTokens("fresh", "refresh-token-2", expiresAtEpochMillis = 10_000),
            )
        }) { 100 }

        val token = manager.getValidAccessToken()

        assertEquals("fresh", (token as IntegrationResult.Success).value)
        assertEquals("fresh", store.read()?.accessToken)
    }

    @Test
    fun `refresh failure clears credentials`() {
        val store = InMemoryTokenStore().apply {
            write(AuthTokens("expired", "bad-refresh", expiresAtEpochMillis = 10))
        }
        val manager = AuthSessionManager(store, object : TokenRefreshClient {
            override fun refresh(refreshToken: String) = IntegrationResult.failure(
                AppError.AuthenticationFailure("refresh failed", "plex"),
                com.cleverferret.v2.core.common.error.UserFacingState.AUTH_REQUIRED,
            )
        }) { 100 }

        val result = manager.getValidAccessToken()

        assertIs<IntegrationResult.Failure>(result)
        assertNull(store.read())
    }

    @Test
    fun `sign out clears token and cache`() {
        val store = InMemoryTokenStore().apply { write(AuthTokens("access", "refresh", 1000)) }
        var localRevoked = false
        var sensitiveCleared = false
        val manager = AuthSessionManager(store, object : TokenRefreshClient {
            override fun refresh(refreshToken: String): IntegrationResult<AuthTokens> = error("unused")
        }) { 0 }

        manager.signOut(onLocalRevocation = { localRevoked = true }, sensitiveCache = object : SensitiveCache {
            override fun clearSensitiveData() {
                sensitiveCleared = true
            }
        })

        assertNull(store.read())
        assertTrue(localRevoked)
        assertTrue(sensitiveCleared)
    }
}
