package com.cleverferret.core.designsystem.theme

import com.cleverferret.core.designsystem.tokens.DesignTokensV1

object KthemeThemeAdapterV1 {
    data class LiveRegionPolicy(
        val mode: String = "polite",
        val atomic: Boolean = true,
        val relevant: String = "all",
    ) {
        fun toComposeLiveRegionMode(): androidx.compose.ui.semantics.LiveRegionMode {
            return when (mode.lowercase()) {
                "assertive" -> androidx.compose.ui.semantics.LiveRegionMode.Assertive
                "off" -> androidx.compose.ui.semantics.LiveRegionMode.Polite
                else -> androidx.compose.ui.semantics.LiveRegionMode.Polite
            }
        }
    }

    data class KthemeSnapshot(
        val id: String,
        val darkMode: Boolean = false,
        val primary: String? = null,
        val onPrimary: String? = null,
        val background: String? = null,
        val onBackground: String? = null,
        val surface: String? = null,
        val onSurface: String? = null,
        val outline: String? = null,
        val error: String? = null,
        val onError: String? = null,
        val liveRegion: LiveRegionPolicy = LiveRegionPolicy(),
        val passthroughRoles: Map<String, String> = emptyMap(),
    )

    enum class SemanticRole(val token: String) {
        ACTION_PRIMARY(DesignTokensV1.ColorRoles.ACTION_PRIMARY),
        ACTION_SECONDARY(DesignTokensV1.ColorRoles.ACTION_SECONDARY),
        CONTENT_INVERSE(DesignTokensV1.ColorRoles.CONTENT_INVERSE),
        SURFACE_BACKGROUND(DesignTokensV1.ColorRoles.SURFACE_BACKGROUND),
        CONTENT_PRIMARY(DesignTokensV1.ColorRoles.CONTENT_PRIMARY),
        SURFACE_ELEVATED(DesignTokensV1.ColorRoles.SURFACE_ELEVATED),
        SURFACE_VARIANT(DesignTokensV1.ColorRoles.SURFACE_VARIANT),
        CONTENT_SECONDARY(DesignTokensV1.ColorRoles.CONTENT_SECONDARY),
        CONTENT_TERTIARY(DesignTokensV1.ColorRoles.CONTENT_TERTIARY),
        BORDER_DEFAULT(DesignTokensV1.ColorRoles.BORDER_DEFAULT),
        STATE_ERROR(DesignTokensV1.ColorRoles.STATE_ERROR),
        CONTENT_ERROR(DesignTokensV1.ColorRoles.CONTENT_ERROR),
        STATE_SUCCESS(DesignTokensV1.ColorRoles.STATE_SUCCESS),
        STATE_WARNING(DesignTokensV1.ColorRoles.STATE_WARNING),
    }

    data class SemanticTheme(
        val id: String,
        val dark: Boolean,
        val semanticColors: Map<String, String>,
        val passthroughRoles: Map<String, String>,
        val liveRegion: LiveRegionPolicy = LiveRegionPolicy(),
    ) {
        fun color(role: SemanticRole): String = requireNotNull(semanticColors[role.token]) {
            "Missing semantic role ${role.token} in theme '$id'"
        }

        fun color(roleToken: String): String = requireNotNull(semanticColors[roleToken] ?: passthroughRoles[roleToken]) {
            "Missing semantic role '$roleToken' in theme '$id'"
        }
    }

    /**
     * Parses a Ktheme JSON snapshot string into a [KthemeSnapshot].
     */
    fun parseSnapshot(jsonString: String): KthemeSnapshot {
        val idMatch = Regex("\"id\"\\s*:\\s*\"([^\"]+)\"").find(jsonString)
        val id = idMatch?.groupValues?.get(1) ?: "custom-theme"

        val darkMatch = Regex("\"darkMode\"\\s*:\\s*(true|false)", RegexOption.IGNORE_CASE).find(jsonString)
        val darkMode = darkMatch?.groupValues?.get(1)?.lowercase() == "true"

        fun extractColor(key: String): String? {
            val pattern = Regex("\"$key\"\\s*:\\s*\"([^\"]+)\"")
            return pattern.find(jsonString)?.groupValues?.get(1)?.takeIf { it.isNotBlank() }
        }

        val modeMatch = Regex("\"mode\"\\s*:\\s*\"([^\"]+)\"").find(jsonString)
        val mode = modeMatch?.groupValues?.get(1) ?: "polite"

        val atomicMatch = Regex("\"atomic\"\\s*:\\s*(true|false)", RegexOption.IGNORE_CASE).find(jsonString)
        val atomic = atomicMatch?.groupValues?.get(1)?.lowercase() != "false"

        val relevantMatch = Regex("\"relevant\"\\s*:\\s*\"([^\"]+)\"").find(jsonString)
        val relevant = relevantMatch?.groupValues?.get(1) ?: "all"

        val liveRegionPolicy = LiveRegionPolicy(mode = mode, atomic = atomic, relevant = relevant)

        return KthemeSnapshot(
            id = id,
            darkMode = darkMode,
            primary = extractColor("primary"),
            onPrimary = extractColor("onPrimary"),
            background = extractColor("background"),
            onBackground = extractColor("onBackground"),
            surface = extractColor("surface"),
            onSurface = extractColor("onSurface"),
            outline = extractColor("outline"),
            error = extractColor("error"),
            onError = extractColor("onError"),
            liveRegion = liveRegionPolicy,
        )
    }

    /**
     * Adapts a [KthemeSnapshot] into a [SemanticTheme] with automatic fallback resolution.
     * Incomplete theme snapshots automatically inherit missing roles from base default themes.
     */
    fun adapt(snapshot: KthemeSnapshot): SemanticTheme {
        val base = if (snapshot.darkMode) DefaultBaseThemes.DARK_BASE else DefaultBaseThemes.LIGHT_BASE

        val primary = snapshot.primary?.takeIf { it.isNotBlank() } ?: base.primary!!
        val onPrimary = snapshot.onPrimary?.takeIf { it.isNotBlank() } ?: base.onPrimary!!
        val background = snapshot.background?.takeIf { it.isNotBlank() } ?: base.background!!
        val onBackground = snapshot.onBackground?.takeIf { it.isNotBlank() } ?: base.onBackground!!
        val surface = snapshot.surface?.takeIf { it.isNotBlank() } ?: base.surface!!
        val onSurface = snapshot.onSurface?.takeIf { it.isNotBlank() } ?: base.onSurface!!
        val outline = snapshot.outline?.takeIf { it.isNotBlank() } ?: base.outline!!
        val error = snapshot.error?.takeIf { it.isNotBlank() } ?: base.error!!
        val onError = snapshot.onError?.takeIf { it.isNotBlank() } ?: base.onError!!

        val semantic = linkedMapOf(
            DesignTokensV1.ColorRoles.ACTION_PRIMARY to primary,
            DesignTokensV1.ColorRoles.CONTENT_INVERSE to onPrimary,
            DesignTokensV1.ColorRoles.SURFACE_BACKGROUND to background,
            DesignTokensV1.ColorRoles.CONTENT_PRIMARY to onBackground,
            DesignTokensV1.ColorRoles.SURFACE_ELEVATED to surface,
            DesignTokensV1.ColorRoles.CONTENT_SECONDARY to onSurface,
            DesignTokensV1.ColorRoles.BORDER_DEFAULT to outline,
            DesignTokensV1.ColorRoles.STATE_ERROR to error,
            DesignTokensV1.ColorRoles.CONTENT_ERROR to onError,
        )

        // Merge extra base passthrough roles if not provided in snapshot
        base.passthroughRoles.forEach { (role, defaultColor) ->
            if (!semantic.containsKey(role)) {
                semantic[role] = snapshot.passthroughRoles[role]?.takeIf { it.isNotBlank() } ?: defaultColor
            }
        }

        snapshot.passthroughRoles.forEach { (role, value) ->
            if (value.isNotBlank() && !semantic.containsKey(role)) {
                semantic[role] = value
            }
        }

        return SemanticTheme(
            id = snapshot.id,
            dark = snapshot.darkMode,
            semanticColors = semantic.toMap(),
            passthroughRoles = snapshot.passthroughRoles.toMap(),
            liveRegion = snapshot.liveRegion,
        )
    }

    /**
     * Convenience method to parse JSON directly into a [SemanticTheme].
     */
    fun fromJson(jsonString: String): SemanticTheme = adapt(parseSnapshot(jsonString))
}
