package com.cleverferret.v2.core.common.error

sealed interface AppError {
    val message: String

    data class TransportFailure(override val message: String, val httpStatus: Int, val timeout: Boolean) : AppError
    data class ParsingFailure(override val message: String, val payloadType: String) : AppError
    data class AuthenticationFailure(override val message: String, val provider: String) : AppError
    data class AuthorizationFailure(override val message: String, val provider: String) : AppError
    data class RateLimitFailure(override val message: String, val provider: String, val retryAfterMillis: Long) : AppError
    data class CircuitBreakerOpen(override val message: String, val integration: String) : AppError
    data class Throttled(override val message: String, val integration: String) : AppError
    data class ExternalServiceFailure(override val message: String, val provider: String, val errorCode: String) : AppError
    data class UnknownFailure(override val message: String, val cause: Throwable) : AppError
}
