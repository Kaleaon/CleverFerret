package com.cleverferret.v2.core.network.plex

import com.cleverferret.v2.core.auth.AuthSessionManager
import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult

interface SafeLogger {
    fun info(message: String)
    fun warn(message: String)
}

object TokenRedactor {
    private val tokenPattern = Regex("(?i)(token=|bearer\\s+)([a-z0-9._-]+)")

    fun sanitize(message: String): String = tokenPattern.replace(message) { match ->
        "${match.groupValues[1]}[REDACTED]"
    }
}

class AuthenticatedPlexRequestExecutor(
    private val sessionManager: AuthSessionManager,
    private val logger: SafeLogger,
) {
    fun <T> execute(operationName: String, operation: (String) -> IntegrationResult<T>): IntegrationResult<T> {
        val tokenResult = sessionManager.getValidAccessToken()
        if (tokenResult is IntegrationResult.Failure) return tokenResult

        val token = (tokenResult as IntegrationResult.Success<String>).value
        val firstAttempt = operation(token)
        if (firstAttempt !is IntegrationResult.Failure || firstAttempt.error !is AppError.AuthenticationFailure) {
            return firstAttempt
        }

        logger.warn(TokenRedactor.sanitize("$operationName failed: token expired, attempting refresh"))
        val refreshed = sessionManager.getValidAccessToken()
        if (refreshed is IntegrationResult.Failure) {
            logger.warn(TokenRedactor.sanitize("$operationName refresh failed: ${refreshed.error.message}"))
            return refreshed
        }

        logger.info(TokenRedactor.sanitize("$operationName retrying after refresh"))
        return operation((refreshed as IntegrationResult.Success<String>).value)
    }

    companion object {
        fun authenticationFailure(message: String = "Token expired"): IntegrationResult.Failure =
            IntegrationResult.Failure(
                AppError.AuthenticationFailure(message, "plex"),
                UserFacingState.AUTH_REQUIRED,
            )
    }
}
