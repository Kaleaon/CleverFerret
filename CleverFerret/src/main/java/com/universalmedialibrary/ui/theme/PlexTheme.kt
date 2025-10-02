package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

// Navy + metallic gold palette
private val Gold = Color(0xFFD4AF37)
private val GoldLight = Color(0xFFE0C25E)
private val GoldDark = Color(0xFFA6862A)
private val NavyBackground = Color(0xFF0A1630)
private val NavySurface = Color(0xFF0D1B36)
private val NavySurfaceVariant = Color(0xFF1B2B4D)
private val TextPrimary = Color(0xFFE6EAF2)
private val TextSecondary = Color(0xFFB3BFD6)

// Dark color scheme (Plex-inspired)
private val NavyGoldDarkColorScheme = darkColorScheme(
    primary = Gold,
    onPrimary = NavyBackground,
    primaryContainer = GoldDark,
    onPrimaryContainer = NavyBackground,

    secondary = NavySurfaceVariant,
    onSecondary = TextPrimary,
    secondaryContainer = NavySurfaceVariant,
    onSecondaryContainer = TextPrimary,

    tertiary = GoldLight,
    onTertiary = NavyBackground,

    background = NavyBackground,
    onBackground = TextPrimary,

    surface = NavySurface,
    onSurface = TextPrimary,
    surfaceVariant = NavySurfaceVariant,
    onSurfaceVariant = TextSecondary,

    error = Color(0xFFDC3545),
    onError = Color.White,

    outline = NavySurfaceVariant,
    outlineVariant = Color(0xFF25385F),
)

// Light color scheme (fallback, though Plex is primarily dark)
private val NavyGoldLightColorScheme = lightColorScheme(
    primary = GoldDark,
    onPrimary = Color.White,
    primaryContainer = GoldLight,
    onPrimaryContainer = Color.Black,

    secondary = Color(0xFF29406E),
    onSecondary = Color.White,
    secondaryContainer = Color(0xFFD8DFEF),
    onSecondaryContainer = Color(0xFF0F2346),

    background = Color(0xFFF7F9FD),
    onBackground = Color(0xFF0A1630),

    surface = Color(0xFFFFFFFF),
    onSurface = Color(0xFF0A1630),
    surfaceVariant = Color(0xFFE2E8F4),
    onSurfaceVariant = Color(0xFF29406E),

    error = Color(0xFFBA1A1A),
    onError = Color.White,
)

@Composable
fun PlexTheme(
    darkTheme: Boolean = true, // Force dark theme by default for Plex aesthetic
    dynamicColor: Boolean = false, // Disable dynamic color to maintain Plex branding
    content: @Composable () -> Unit
) {
    val colorScheme = if (darkTheme) NavyGoldDarkColorScheme else NavyGoldLightColorScheme

    MaterialTheme(
        colorScheme = colorScheme,
        typography = PlexTypography,
        content = content
    )
}

// Plex-inspired typography
private val PlexTypography = Typography(
    displayLarge = Typography().displayLarge.copy(
        color = TextPrimary
    ),
    displayMedium = Typography().displayMedium.copy(
        color = TextPrimary
    ),
    displaySmall = Typography().displaySmall.copy(
        color = TextPrimary
    ),
    headlineLarge = Typography().headlineLarge.copy(
        color = TextPrimary
    ),
    headlineMedium = Typography().headlineMedium.copy(
        color = TextPrimary
    ),
    headlineSmall = Typography().headlineSmall.copy(
        color = TextPrimary
    ),
    titleLarge = Typography().titleLarge.copy(
        color = TextPrimary
    ),
    titleMedium = Typography().titleMedium.copy(
        color = TextPrimary
    ),
    titleSmall = Typography().titleSmall.copy(
        color = TextPrimary
    ),
    bodyLarge = Typography().bodyLarge.copy(
        color = TextPrimary
    ),
    bodyMedium = Typography().bodyMedium.copy(
        color = TextSecondary
    ),
    bodySmall = Typography().bodySmall.copy(
        color = TextSecondary
    ),
    labelLarge = Typography().labelLarge.copy(
        color = TextPrimary
    ),
    labelMedium = Typography().labelMedium.copy(
        color = TextSecondary
    ),
    labelSmall = Typography().labelSmall.copy(
        color = TextSecondary
    )
)
