package com.cleverferret.v2.core.network.resilience

import com.cleverferret.v2.core.common.error.AppError

class RetryExecutor(
    private val retryPolicy: RetryPolicy,
    private val sleep: (Long) -> Unit = { Thread.sleep(it) },
) {
    fun <T> execute(block: () -> T): T {
        var attempt = 1
        var lastError: AppError? = null

        while (attempt <= retryPolicy.maxAttempts()) {
            try {
                return block()
            } catch (error: AppErrorException) {
                lastError = error.error
                if (!retryPolicy.shouldRetry(error.error, attempt) || attempt == retryPolicy.maxAttempts()) {
                    throw error
                }
                sleep(retryPolicy.delayMillis(attempt))
                attempt += 1
            }
        }

        throw AppErrorException(lastError ?: AppError.UnknownFailure("Retry failed", IllegalStateException("No AppError emitted")))
    }
}

class AppErrorException(val error: AppError) : RuntimeException(error.message)
