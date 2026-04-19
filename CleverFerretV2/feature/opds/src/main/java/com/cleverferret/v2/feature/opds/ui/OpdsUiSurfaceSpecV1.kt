package com.cleverferret.v2.feature.opds.ui

/**
 * Declarative UI spec for OPDS surfaces consumed by Compose layer.
 *
 * Keeps design-system wiring explicit without coupling this module to Android UI runtime.
 */
data class OpdsUiSurfaceSpecV1(
    val errorDialogComponent: String = "ErrorDialog",
    val errorColorToken: String = "color.state.error",
    val loadingPlaceholderComponent: String = "StatCard",
    val loadingSpacingToken: String = "space.4",
    val loadingRadiusToken: String = "radius.md",
    val loadingMotionToken: String = "motion.duration.normal",
)
