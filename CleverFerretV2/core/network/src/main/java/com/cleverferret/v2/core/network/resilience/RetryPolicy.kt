package com.cleverferret.v2.core.network.resilience

import com.cleverferret.v2.core.common.error.AppError

interface RetryPolicy {
    fun shouldRetry(error: AppError, attempt: Int): Boolean
    fun delayMillis(attempt: Int): Long
    fun maxAttempts(): Int
}
