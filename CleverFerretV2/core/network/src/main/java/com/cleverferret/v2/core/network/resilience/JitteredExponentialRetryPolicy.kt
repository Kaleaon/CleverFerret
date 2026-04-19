package com.cleverferret.v2.core.network.resilience

import com.cleverferret.v2.core.common.error.AppError
import kotlin.math.max
import kotlin.math.min
import kotlin.math.pow
import kotlin.random.Random

class JitteredExponentialRetryPolicy(
    private val retryMaxAttempts: Int = 4,
    private val baseDelayMillis: Long = 200L,
    private val maxDelayMillis: Long = 2_000L,
    private val jitterRatio: Double = 0.25,
    private val random: Random = Random.Default,
) : RetryPolicy {

    override fun shouldRetry(error: AppError, attempt: Int): Boolean {
        if (attempt >= retryMaxAttempts) return false
        return when (error) {
            is AppError.TransportFailure -> error.timeout || error.httpStatus in setOf(408, 429, 500, 502, 503, 504)
            is AppError.RateLimitFailure -> true
            is AppError.ExternalServiceFailure -> true
            else -> false
        }
    }

    override fun delayMillis(attempt: Int): Long {
        val exponent = max(0, attempt - 1)
        val exponentialDelay = (baseDelayMillis * 2.0.pow(exponent)).toLong().coerceAtLeast(baseDelayMillis)
        val boundedDelay = min(maxDelayMillis, exponentialDelay)
        val jitterWindow = (boundedDelay * jitterRatio).toLong().coerceAtLeast(1L)
        val jitter = random.nextLong(from = -jitterWindow, until = jitterWindow + 1)
        return (boundedDelay + jitter).coerceAtLeast(1L)
    }

    override fun maxAttempts(): Int = retryMaxAttempts
}
