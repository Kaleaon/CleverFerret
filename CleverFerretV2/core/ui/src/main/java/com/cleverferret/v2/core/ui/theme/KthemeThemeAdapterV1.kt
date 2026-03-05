package com.cleverferret.v2.core.ui.theme

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

    data class SemanticTheme(
        val id: String,
        val dark: Boolean,
        val semanticColors: Map<String, String>,
        val passthroughRoles: Map<String, String>,
    )

    fun adapt(snapshot: KthemeSnapshot): SemanticTheme {
        val semantic = linkedMapOf(
            "color.action.primary" to snapshot.primary,
            "color.content.inverse" to snapshot.onPrimary,
            "color.surface.background" to snapshot.background,
            "color.content.primary" to snapshot.onBackground,
            "color.surface.elevated" to snapshot.surface,
            "color.content.secondary" to snapshot.onSurface,
            "color.border.default" to snapshot.outline,
            "color.state.error" to snapshot.error,
            "color.content.error" to snapshot.onError,
        )
        return SemanticTheme(snapshot.id, snapshot.darkMode, semantic.toMap(), snapshot.passthroughRoles.toMap())
    }
}
