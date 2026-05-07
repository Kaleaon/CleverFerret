package com.cleverferret.v2.app.navigation

/**
 * Stable navigation destination contract used by all surfaces (phone/tablet/desktop/auto).
 */
data class AppDestination(
    val route: String,
    val title: String,
    val supportsSearch: Boolean = false,
)
