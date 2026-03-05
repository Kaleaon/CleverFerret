package com.cleverferret.v2.core.ui.tokens

object DesignTokensV1 {
    val SPACING_DP = mapOf(
        "space.0" to 0, "space.1" to 4, "space.2" to 8, "space.3" to 12, "space.4" to 16,
        "space.5" to 20, "space.6" to 24, "space.8" to 32, "space.10" to 40, "space.12" to 48, "space.16" to 64,
    )

    data class MotionDuration(val fastMs: Int, val normalMs: Int, val slowMs: Int)
    data class ContrastTargets(val bodyTextMin: Double, val largeTextMin: Double, val interactiveMin: Double, val focusIndicatorMin: Double)

    val MOTION_DURATION = MotionDuration(100, 200, 320)
    val CONTRAST_TARGETS = ContrastTargets(4.5, 3.0, 3.0, 3.0)
}
