package com.cleverferret.v2.core.network.resilience;

import com.cleverferret.v2.core.common.error.AppError;

public final class NonIdempotentRetryPolicy implements RetryPolicy {
    @Override
    public boolean shouldRetry(AppError error, int attempt) {
        return attempt < 2 && error instanceof AppError.TransportFailure transportFailure && transportFailure.timeout();
    }

    @Override
    public long delayMillis(int attempt) {
        return 150L;
    }

    @Override
    public int maxAttempts() {
        return 2;
    }
}
