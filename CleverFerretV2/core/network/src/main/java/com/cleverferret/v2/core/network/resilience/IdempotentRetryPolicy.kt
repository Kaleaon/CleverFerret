package com.cleverferret.v2.core.network.resilience

import com.cleverferret.v2.core.common.error.AppError
import kotlin.math.max
import kotlin.math.pow

class IdempotentRetryPolicy(
    private val retryMaxAttempts: Int = 4,
    private val baseDelayMillis: Long = 200L,
) : RetryPolicy {
    override fun shouldRetry(error: AppError, attempt: Int): Boolean =
        attempt < retryMaxAttempts && (error is AppError.TransportFailure || error is AppError.RateLimitFailure || error is AppError.ExternalServiceFailure)

    override fun delayMillis(attempt: Int): Long = (baseDelayMillis * 2.0.pow(max(0, attempt - 1))).toLong()
    override fun maxAttempts(): Int = retryMaxAttempts
}
