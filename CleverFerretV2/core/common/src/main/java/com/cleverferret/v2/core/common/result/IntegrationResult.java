package com.cleverferret.v2.core.common.result;

import com.cleverferret.v2.core.common.error.AppError;
import com.cleverferret.v2.core.common.error.UserFacingState;

public sealed interface IntegrationResult<T> permits IntegrationResult.Success, IntegrationResult.Failure {

    record Success<T>(T value) implements IntegrationResult<T> {}

    record Failure<T>(AppError error, UserFacingState state) implements IntegrationResult<T> {}

    static <T> Success<T> success(T value) {
        return new Success<>(value);
    }

    static <T> Failure<T> failure(AppError error, UserFacingState state) {
        return new Failure<>(error, state);
    }
}
