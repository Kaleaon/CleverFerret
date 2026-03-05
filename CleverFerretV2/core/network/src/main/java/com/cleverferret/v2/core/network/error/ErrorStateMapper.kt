package com.cleverferret.v2.core.network.error

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState

object ErrorStateMapper {
    fun toUserFacingState(error: AppError): UserFacingState = when (error) {
        is AppError.TransportFailure -> UserFacingState.RETRYING
        is AppError.ParsingFailure -> UserFacingState.DATA_UNREADABLE
        is AppError.AuthenticationFailure -> UserFacingState.AUTH_REQUIRED
        is AppError.AuthorizationFailure -> UserFacingState.PERMISSION_DENIED
        is AppError.RateLimitFailure -> UserFacingState.RATE_LIMITED
        is AppError.CircuitBreakerOpen, is AppError.Throttled -> UserFacingState.TEMPORARILY_DEGRADED
        is AppError.ExternalServiceFailure -> UserFacingState.UNAVAILABLE
        is AppError.UnknownFailure -> UserFacingState.UNKNOWN_ERROR
    }
}
