package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

/**
 * The primary gold color used in the Plex theme.
 */
private val PlexGold = Color(0xFFE5A00D)
/**
 * A lighter variant of the Plex gold color.
 */
private val PlexGoldLight = Color(0xFFF4B942)
/**
 * A darker variant of the Plex gold color.
 */
private val PlexGoldDark = Color(0xFFCC8F00)
/**
 * The main background color for the dark theme.
 */
private val PlexDarkBackground = Color(0xFF1A1A1A)
/**
 * The surface color for components like cards in the dark theme.
 */
private val PlexDarkSurface = Color(0xFF1F2326)
/**
 * A variant of the surface color for the dark theme.
 */
private val PlexDarkSurfaceVariant = Color(0xFF2D3136)
/**
 * The primary text color for the dark theme.
 */
private val PlexTextPrimary = Color(0xFFFFFFFF)
/**
 * The secondary text color for the dark theme.
 */
private val PlexTextSecondary = Color(0xFFB3B3B3)

/**
 * The dark color scheme for the Plex-inspired theme.
 */
private val PlexDarkColorScheme = darkColorScheme(
    primary = PlexGold,
    onPrimary = Color.Black,
    primaryContainer = PlexGoldDark,
    onPrimaryContainer = Color.Black,

    secondary = PlexDarkSurfaceVariant,
    onSecondary = PlexTextPrimary,
    secondaryContainer = PlexDarkSurfaceVariant,
    onSecondaryContainer = PlexTextPrimary,

    tertiary = PlexGoldLight,
    onTertiary = Color.Black,

    background = PlexDarkBackground,
    onBackground = PlexTextPrimary,

    surface = PlexDarkSurface,
    onSurface = PlexTextPrimary,
    surfaceVariant = PlexDarkSurfaceVariant,
    onSurfaceVariant = PlexTextSecondary,

    error = Color(0xFFDC3545),
    onError = Color.White,

    outline = PlexDarkSurfaceVariant,
    outlineVariant = Color(0xFF3A3F44),
)

/**
 * A fallback light color scheme. While the Plex aesthetic is primarily dark,
 * this provides a light theme option.
 */
private val PlexLightColorScheme = lightColorScheme(
    primary = PlexGoldDark,
    onPrimary = Color.White,
    primaryContainer = PlexGoldLight,
    onPrimaryContainer = Color.Black,

    secondary = Color(0xFF6C757D),
    onSecondary = Color.White,
    secondaryContainer = Color(0xFFE9ECEF),
    onSecondaryContainer = Color(0xFF495057),

    background = Color(0xFFFFFBFE),
    onBackground = Color(0xFF1C1B1F),

    surface = Color(0xFFFFFBFE),
    onSurface = Color(0xFF1C1B1F),
    surfaceVariant = Color(0xFFE7E0EC),
    onSurfaceVariant = Color(0xFF49454F),

    error = Color(0xFFBA1A1A),
    onError = Color.White,
)

/**
 * The main theme for the application, inspired by the Plex aesthetic.
 * It enforces a dark theme by default to maintain brand consistency.
 *
 * @param darkTheme Whether to use the dark theme. Defaults to `true`.
 * @param dynamicColor Whether to use dynamic colors. Defaults to `false` to maintain brand colors.
 * @param content The composable content to which the theme will be applied.
 */
@Composable
fun PlexTheme(
    darkTheme: Boolean = true, // Force dark theme by default for Plex aesthetic
    dynamicColor: Boolean = false, // Disable dynamic color to maintain Plex branding
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        darkTheme -> PlexDarkColorScheme
        else -> PlexLightColorScheme
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = PlexTypography,
        content = content
    )
}

/**
 * Defines the typography for the Plex-inspired theme.
 * This sets the color of the default Material typography to match the Plex theme.
 */
private val PlexTypography = Typography(
    displayLarge = Typography().displayLarge.copy(
        color = PlexTextPrimary
    ),
    displayMedium = Typography().displayMedium.copy(
        color = PlexTextPrimary
    ),
    displaySmall = Typography().displaySmall.copy(
        color = PlexTextPrimary
    ),
    headlineLarge = Typography().headlineLarge.copy(
        color = PlexTextPrimary
    ),
    headlineMedium = Typography().headlineMedium.copy(
        color = PlexTextPrimary
    ),
    headlineSmall = Typography().headlineSmall.copy(
        color = PlexTextPrimary
    ),
    titleLarge = Typography().titleLarge.copy(
        color = PlexTextPrimary
    ),
    titleMedium = Typography().titleMedium.copy(
        color = PlexTextPrimary
    ),
    titleSmall = Typography().titleSmall.copy(
        color = PlexTextPrimary
    ),
    bodyLarge = Typography().bodyLarge.copy(
        color = PlexTextPrimary
    ),
    bodyMedium = Typography().bodyMedium.copy(
        color = PlexTextSecondary
    ),
    bodySmall = Typography().bodySmall.copy(
        color = PlexTextSecondary
    ),
    labelLarge = Typography().labelLarge.copy(
        color = PlexTextPrimary
    ),
    labelMedium = Typography().labelMedium.copy(
        color = PlexTextSecondary
    ),
    labelSmall = Typography().labelSmall.copy(
        color = PlexTextSecondary
    )
)