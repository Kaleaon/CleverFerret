package com.cleverferret.v2.core.ui.tokens

object DesignTokensV1 {
    object ColorRoles {
        const val ACTION_PRIMARY = "color.action.primary"
        const val CONTENT_INVERSE = "color.content.inverse"
        const val SURFACE_BACKGROUND = "color.surface.background"
        const val CONTENT_PRIMARY = "color.content.primary"
        const val SURFACE_ELEVATED = "color.surface.elevated"
        const val CONTENT_SECONDARY = "color.content.secondary"
        const val BORDER_DEFAULT = "color.border.default"
        const val STATE_ERROR = "color.state.error"
        const val CONTENT_ERROR = "color.content.error"
    }

    object TypographyRoles {
        const val DISPLAY_L = "type.display.l"
        const val HEADLINE_M = "type.headline.m"
        const val TITLE_M = "type.title.m"
        const val BODY_M = "type.body.m"
        const val LABEL_M = "type.label.m"
    }

    val SPACING_DP = linkedMapOf(
        "space.0" to 0,
        "space.1" to 4,
        "space.2" to 8,
        "space.3" to 12,
        "space.4" to 16,
        "space.5" to 20,
        "space.6" to 24,
        "space.8" to 32,
        "space.10" to 40,
        "space.12" to 48,
        "space.16" to 64,
    )

    val RADIUS_DP = linkedMapOf(
        "radius.s" to 4,
        "radius.m" to 8,
        "radius.l" to 12,
        "radius.xl" to 16,
        "radius.full" to 999,
    )

    data class MotionDuration(val fastMs: Int, val normalMs: Int, val slowMs: Int)
    data class ContrastTargets(
        val bodyTextMin: Double,
        val largeTextMin: Double,
        val interactiveMin: Double,
        val focusIndicatorMin: Double,
    )

    val MOTION_DURATION = MotionDuration(100, 200, 320)
    val CONTRAST_TARGETS = ContrastTargets(4.5, 3.0, 3.0, 3.0)

    fun spacing(name: String): Int = requireNotNull(SPACING_DP[name]) { "Unknown spacing token: $name" }

    fun radius(name: String): Int = requireNotNull(RADIUS_DP[name]) { "Unknown radius token: $name" }
}
