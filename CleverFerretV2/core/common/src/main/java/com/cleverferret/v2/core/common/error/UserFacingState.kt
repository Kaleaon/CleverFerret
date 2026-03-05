package com.cleverferret.v2.core.common.error


enum class UserFacingState {
    RETRYING,
    UNAVAILABLE,
    AUTH_REQUIRED,
    PERMISSION_DENIED,
    RATE_LIMITED,
    DATA_UNREADABLE,
    TEMPORARILY_DEGRADED,
    UNKNOWN_ERROR
}
