package com.cleverferret.v2.core.network.resilience

import com.cleverferret.v2.core.common.error.AppError
import kotlin.random.Random
import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class JitteredExponentialRetryPolicyTest {

    @Test
    fun `retries transient transport errors`() {
        val policy = JitteredExponentialRetryPolicy(random = Random(42))

        assertTrue(policy.shouldRetry(AppError.TransportFailure("timeout", 503, timeout = true), attempt = 1))
        assertFalse(policy.shouldRetry(AppError.AuthenticationFailure("auth", "opds"), attempt = 1))
    }

    @Test
    fun `uses bounded jittered exponential backoff`() {
        val policy = JitteredExponentialRetryPolicy(baseDelayMillis = 100, maxDelayMillis = 400, jitterRatio = 0.25, random = Random(1))
        val delay = policy.delayMillis(attempt = 3)

        assertTrue(delay in 300L..500L)
    }
}
