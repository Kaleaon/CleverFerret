package com.cleverferret.v2.core.network.error;

import com.cleverferret.v2.core.common.error.AppError;
import com.cleverferret.v2.core.common.error.UserFacingState;

/**
 * Centralized mapping from low-level failures to user-visible states.
 */
public final class ErrorStateMapper {
    private ErrorStateMapper() {}

    public static UserFacingState toUserFacingState(AppError error) {
        if (error instanceof AppError.TransportFailure) {
            return UserFacingState.RETRYING;
        }
        if (error instanceof AppError.ParsingFailure) {
            return UserFacingState.DATA_UNREADABLE;
        }
        if (error instanceof AppError.AuthenticationFailure) {
            return UserFacingState.AUTH_REQUIRED;
        }
        if (error instanceof AppError.AuthorizationFailure) {
            return UserFacingState.PERMISSION_DENIED;
        }
        if (error instanceof AppError.RateLimitFailure) {
            return UserFacingState.RATE_LIMITED;
        }
        if (error instanceof AppError.CircuitBreakerOpen || error instanceof AppError.Throttled) {
            return UserFacingState.TEMPORARILY_DEGRADED;
        }
        if (error instanceof AppError.ExternalServiceFailure) {
            return UserFacingState.UNAVAILABLE;
        }
        return UserFacingState.UNKNOWN_ERROR;
    }
}
