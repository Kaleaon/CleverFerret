package com.cleverferret.core.designsystem.theme

import com.cleverferret.core.designsystem.tokens.DesignTokensV1
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json

object KthemeThemeAdapterV1 {

    private val jsonSerializer = Json {
        ignoreUnknownKeys = true
        isLenient = true
        coerceInputValues = true
    }

    @Serializable
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

    @Serializable
    data class KthemeSnapshot(
        val id: String = "custom-theme",
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

    @Serializable
    private data class KthemeMetadataDto(
        val id: String? = null
    )

    @Serializable
    private data class KthemeColorSchemeDto(
        val primary: String? = null,
        val onPrimary: String? = null,
        val background: String? = null,
        val onBackground: String? = null,
        val surface: String? = null,
        val onSurface: String? = null,
        val outline: String? = null,
        val error: String? = null,
        val onError: String? = null,
    )

    @Serializable
    private data class KthemeAccessibilityDto(
        val liveRegion: LiveRegionPolicy? = null
    )

    @Serializable
    private data class KthemeLayoutDto(
        val accessibility: KthemeAccessibilityDto? = null
    )

    @Serializable
    private data class KthemeAdaptationDto(
        val layout: KthemeLayoutDto? = null
    )

    @Serializable
    private data class ThemeJsonDto(
        val id: String? = null,
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
        val liveRegion: LiveRegionPolicy? = null,
        val passthroughRoles: Map<String, String> = emptyMap(),
        val metadata: KthemeMetadataDto? = null,
        val colorScheme: KthemeColorSchemeDto? = null,
        val adaptation: KthemeAdaptationDto? = null,
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
     * Parses a Ktheme JSON snapshot string into a [KthemeSnapshot] using kotlinx.serialization.
     */
    fun parseSnapshot(jsonString: String): KthemeSnapshot {
        if (jsonString.isBlank()) return KthemeSnapshot()

        return try {
            val dto = jsonSerializer.decodeFromString<ThemeJsonDto>(jsonString)
            val themeId = dto.metadata?.id ?: dto.id ?: "custom-theme"
            val liveRegionPolicy = dto.adaptation?.layout?.accessibility?.liveRegion
                ?: dto.liveRegion
                ?: LiveRegionPolicy()

            KthemeSnapshot(
                id = themeId,
                darkMode = dto.darkMode,
                primary = dto.colorScheme?.primary ?: dto.primary,
                onPrimary = dto.colorScheme?.onPrimary ?: dto.onPrimary,
                background = dto.colorScheme?.background ?: dto.background,
                onBackground = dto.colorScheme?.onBackground ?: dto.onBackground,
                surface = dto.colorScheme?.surface ?: dto.surface,
                onSurface = dto.colorScheme?.onSurface ?: dto.onSurface,
                outline = dto.colorScheme?.outline ?: dto.outline,
                error = dto.colorScheme?.error ?: dto.error,
                onError = dto.colorScheme?.onError ?: dto.onError,
                liveRegion = liveRegionPolicy,
                passthroughRoles = dto.passthroughRoles
            )
        } catch (e: Exception) {
            KthemeSnapshot()
        }
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
