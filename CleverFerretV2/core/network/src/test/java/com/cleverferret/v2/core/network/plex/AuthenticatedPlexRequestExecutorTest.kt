package com.cleverferret.v2.core.network.plex

import com.cleverferret.v2.core.auth.AuthSessionManager
import com.cleverferret.v2.core.auth.AuthTokens
import com.cleverferret.v2.core.auth.InMemoryTokenStore
import com.cleverferret.v2.core.auth.TokenRefreshClient
import com.cleverferret.v2.core.common.result.IntegrationResult
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertIs
import kotlin.test.assertTrue

class AuthenticatedPlexRequestExecutorTest {
    @Test
    fun `retries once when token expires mid-request`() {
        val store = InMemoryTokenStore().apply {
            write(AuthTokens("token-a", "refresh", 9_999))
        }
        val sessionManager = AuthSessionManager(store, object : TokenRefreshClient {
            override fun refresh(refreshToken: String): IntegrationResult<AuthTokens> {
                return IntegrationResult.success(AuthTokens("token-b", "refresh-2", 9_999))
            }
        }) { 100 }

        val logs = mutableListOf<String>()
        val executor = AuthenticatedPlexRequestExecutor(sessionManager, object : SafeLogger {
            override fun info(message: String) { logs += message }
            override fun warn(message: String) { logs += message }
        })

        var calls = 0
        val result = executor.execute("plex.sync") { token ->
            calls++
            if (calls == 1) {
                AuthenticatedPlexRequestExecutor.authenticationFailure()
            } else {
                IntegrationResult.success("ok:$token")
            }
        }

        assertEquals(2, calls)
        assertEquals("ok:token-b", (result as IntegrationResult.Success).value)
        assertTrue(logs.any { it.contains("retrying after refresh") })
    }

    @Test
    fun `token redactor strips leaked token values from logs`() {
        val message = "request failed token=abc123 bearer qwerty"
        val sanitized = TokenRedactor.sanitize(message)

        assertTrue("abc123" !in sanitized)
        assertTrue("qwerty" !in sanitized)
        assertTrue("[REDACTED]" in sanitized)
    }
}
