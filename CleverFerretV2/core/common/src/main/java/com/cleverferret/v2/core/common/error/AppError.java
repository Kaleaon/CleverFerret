package com.cleverferret.v2.core.common.error;

/**
 * Sealed, transport-agnostic error hierarchy shared by integrations.
 */
public sealed interface AppError permits
        AppError.TransportFailure,
        AppError.ParsingFailure,
        AppError.AuthenticationFailure,
        AppError.AuthorizationFailure,
        AppError.RateLimitFailure,
        AppError.CircuitBreakerOpen,
        AppError.Throttled,
        AppError.ExternalServiceFailure,
        AppError.UnknownFailure {

    String message();

    record TransportFailure(String message, int httpStatus, boolean timeout) implements AppError {}

    record ParsingFailure(String message, String payloadType) implements AppError {}

    record AuthenticationFailure(String message, String provider) implements AppError {}

    record AuthorizationFailure(String message, String provider) implements AppError {}

    record RateLimitFailure(String message, String provider, long retryAfterMillis) implements AppError {}

    record CircuitBreakerOpen(String message, String integration) implements AppError {}

    record Throttled(String message, String integration) implements AppError {}

    record ExternalServiceFailure(String message, String provider, String errorCode) implements AppError {}

    record UnknownFailure(String message, Throwable cause) implements AppError {}
}
