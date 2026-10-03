package com.cleverferret.v2.core.network.resilience

import com.cleverferret.v2.core.common.error.AppError

class NonIdempotentRetryPolicy : RetryPolicy {
    override fun shouldRetry(error: AppError, attempt: Int): Boolean =
        attempt < 2 && error is AppError.TransportFailure && error.timeout

    override fun delayMillis(attempt: Int): Long = 150L
    override fun maxAttempts(): Int = 2
}
