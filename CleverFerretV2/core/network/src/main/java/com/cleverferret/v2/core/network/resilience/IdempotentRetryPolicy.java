package com.cleverferret.v2.core.network.resilience;

import com.cleverferret.v2.core.common.error.AppError;

public final class IdempotentRetryPolicy implements RetryPolicy {
    private final int maxAttempts;
    private final long baseDelayMillis;

    public IdempotentRetryPolicy() {
        this(4, 200L);
    }

    public IdempotentRetryPolicy(int maxAttempts, long baseDelayMillis) {
        this.maxAttempts = maxAttempts;
        this.baseDelayMillis = baseDelayMillis;
    }

    @Override
    public boolean shouldRetry(AppError error, int attempt) {
        if (attempt >= maxAttempts) {
            return false;
        }
        return error instanceof AppError.TransportFailure
                || error instanceof AppError.RateLimitFailure
                || error instanceof AppError.ExternalServiceFailure;
    }

    @Override
    public long delayMillis(int attempt) {
        return (long) (baseDelayMillis * Math.pow(2, Math.max(0, attempt - 1)));
    }

    @Override
    public int maxAttempts() {
        return maxAttempts;
    }
}
