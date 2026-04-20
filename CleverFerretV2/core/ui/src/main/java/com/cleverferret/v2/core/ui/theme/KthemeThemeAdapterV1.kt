package com.cleverferret.v2.core.ui.theme

import com.cleverferret.v2.core.ui.tokens.DesignTokensV1

object KthemeThemeAdapterV1 {
    data class KthemeSnapshot(
        val id: String,
        val darkMode: Boolean,
        val primary: String,
        val onPrimary: String,
        val background: String,
        val onBackground: String,
        val surface: String,
        val onSurface: String,
        val outline: String,
        val error: String,
        val onError: String,
        val passthroughRoles: Map<String, String>,
    )

    enum class SemanticRole(val token: String) {
        ACTION_PRIMARY(DesignTokensV1.ColorRoles.ACTION_PRIMARY),
        CONTENT_INVERSE(DesignTokensV1.ColorRoles.CONTENT_INVERSE),
        SURFACE_BACKGROUND(DesignTokensV1.ColorRoles.SURFACE_BACKGROUND),
        CONTENT_PRIMARY(DesignTokensV1.ColorRoles.CONTENT_PRIMARY),
        SURFACE_ELEVATED(DesignTokensV1.ColorRoles.SURFACE_ELEVATED),
        CONTENT_SECONDARY(DesignTokensV1.ColorRoles.CONTENT_SECONDARY),
        BORDER_DEFAULT(DesignTokensV1.ColorRoles.BORDER_DEFAULT),
        STATE_ERROR(DesignTokensV1.ColorRoles.STATE_ERROR),
        CONTENT_ERROR(DesignTokensV1.ColorRoles.CONTENT_ERROR),
    }

    data class SemanticTheme(
        val id: String,
        val dark: Boolean,
        val semanticColors: Map<String, String>,
        val passthroughRoles: Map<String, String>,
    ) {
        fun color(role: SemanticRole): String = requireNotNull(semanticColors[role.token]) {
            "Missing semantic role ${role.token} in theme '$id'"
        }
    }

    /**
     * Feature UI modules consume only SemanticTheme, never KthemeSnapshot palette fields.
     */
    fun adapt(snapshot: KthemeSnapshot): SemanticTheme {
        val semantic = linkedMapOf(
            DesignTokensV1.ColorRoles.ACTION_PRIMARY to snapshot.primary,
            DesignTokensV1.ColorRoles.CONTENT_INVERSE to snapshot.onPrimary,
            DesignTokensV1.ColorRoles.SURFACE_BACKGROUND to snapshot.background,
            DesignTokensV1.ColorRoles.CONTENT_PRIMARY to snapshot.onBackground,
            DesignTokensV1.ColorRoles.SURFACE_ELEVATED to snapshot.surface,
            DesignTokensV1.ColorRoles.CONTENT_SECONDARY to snapshot.onSurface,
            DesignTokensV1.ColorRoles.BORDER_DEFAULT to snapshot.outline,
            DesignTokensV1.ColorRoles.STATE_ERROR to snapshot.error,
            DesignTokensV1.ColorRoles.CONTENT_ERROR to snapshot.onError,
        )
        return SemanticTheme(snapshot.id, snapshot.darkMode, semantic.toMap(), snapshot.passthroughRoles.toMap())
    }
}
