package com.cleverferret.v2.core.common.result

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState

sealed interface IntegrationResult<out T> {
    data class Success<T>(val value: T) : IntegrationResult<T>
    data class Failure(val error: AppError, val state: UserFacingState) : IntegrationResult<Nothing>

    companion object {
        fun <T> success(value: T): IntegrationResult<T> = Success(value)
        fun failure(error: AppError, state: UserFacingState): IntegrationResult<Nothing> = Failure(error, state)
    }
}
