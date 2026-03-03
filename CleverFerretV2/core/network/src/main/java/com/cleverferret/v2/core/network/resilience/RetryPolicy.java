package com.cleverferret.v2.core.network.resilience;

import com.cleverferret.v2.core.common.error.AppError;

public interface RetryPolicy {
    boolean shouldRetry(AppError error, int attempt);

    long delayMillis(int attempt);

    int maxAttempts();
}
