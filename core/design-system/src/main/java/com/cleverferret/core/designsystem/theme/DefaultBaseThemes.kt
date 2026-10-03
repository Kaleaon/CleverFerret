package com.cleverferret.core.designsystem.theme

import com.cleverferret.core.designsystem.tokens.DesignTokensV1

object DefaultBaseThemes {
    val LIGHT_BASE = KthemeThemeAdapterV1.KthemeSnapshot(
        id = "default-light",
        darkMode = false,
        primary = "#0061A4",
        onPrimary = "#FFFFFF",
        background = "#FEF7FF",
        onBackground = "#1D1B20",
        surface = "#FEF7FF",
        onSurface = "#1D1B20",
        outline = "#79747E",
        error = "#B3261E",
        onError = "#FFFFFF",
        passthroughRoles = mapOf(
            DesignTokensV1.ColorRoles.ACTION_SECONDARY to "#4A6267",
            DesignTokensV1.ColorRoles.SURFACE_VARIANT to "#E7E0EC",
            DesignTokensV1.ColorRoles.CONTENT_TERTIARY to "#49454F",
            DesignTokensV1.ColorRoles.STATE_SUCCESS to "#2E7D32",
            DesignTokensV1.ColorRoles.STATE_WARNING to "#ED6C02"
        )
    )

    val DARK_BASE = KthemeThemeAdapterV1.KthemeSnapshot(
        id = "default-dark",
        darkMode = true,
        primary = "#D0BCFF",
        onPrimary = "#381E72",
        background = "#141218",
        onBackground = "#E6E1E5",
        surface = "#141218",
        onSurface = "#E6E1E5",
        outline = "#938F99",
        error = "#F2B8B5",
        onError = "#601410",
        passthroughRoles = mapOf(
            DesignTokensV1.ColorRoles.ACTION_SECONDARY to "#CCC2DC",
            DesignTokensV1.ColorRoles.SURFACE_VARIANT to "#49454F",
            DesignTokensV1.ColorRoles.CONTENT_TERTIARY to "#CAC4D0",
            DesignTokensV1.ColorRoles.STATE_SUCCESS to "#81C784",
            DesignTokensV1.ColorRoles.STATE_WARNING to "#FFB74D"
        )
    )
}
