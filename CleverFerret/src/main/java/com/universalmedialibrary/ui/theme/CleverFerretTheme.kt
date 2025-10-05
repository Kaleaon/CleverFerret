package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.staticCompositionLocalOf
import androidx.compose.ui.text.font.FontWeight

/**
 * CleverFerret Theme System with Metallic Accents
 *
 * Features:
 * - Multiple beautiful color palettes
 * - Metallic accents (Gold, Silver, Copper, Rose Gold, etc.)
 * - Dark and light modes
 * - Fully themeable
 * - Material Design 3 compatible
 */

// Local composition for metallic effects
val LocalMetallicGradient = staticCompositionLocalOf { MetallicEffects.Gold }

@Composable
fun CleverFerretTheme(
    palette: ThemePalette = ThemePalette.NAVY_GOLD,
    darkTheme: Boolean = true,
    dynamicColor: Boolean = false, // Disable to maintain custom branding
    content: @Composable () -> Unit
) {
    // Map old enum to unified enum for backward compatibility
    val unifiedPalette = when (palette) {
        ThemePalette.NAVY_GOLD -> UnifiedThemePalette.NAVY_GOLD
        ThemePalette.ROYAL_SILVER -> UnifiedThemePalette.ROYAL_SILVER
        ThemePalette.FOREST_COPPER -> UnifiedThemePalette.FOREST_COPPER
        ThemePalette.BURGUNDY_ROSE_GOLD -> UnifiedThemePalette.BURGUNDY_ROSE_GOLD
        ThemePalette.CHARCOAL_CHAMPAGNE -> UnifiedThemePalette.CHARCOAL_CHAMPAGNE
        ThemePalette.SLATE_GUNMETAL -> UnifiedThemePalette.SLATE_GUNMETAL
    }

    CleverFerretUnifiedTheme(
        palette = unifiedPalette,
        darkTheme = darkTheme,
        dynamicColor = dynamicColor,
        content = content
    )
}

@Composable
fun CleverFerretUnifiedTheme(
    palette: UnifiedThemePalette = UnifiedThemePalette.NAVY_GOLD,
    darkTheme: Boolean = true,
    dynamicColor: Boolean = false,
    content: @Composable () -> Unit
) {
    val colorScheme = when (palette) {
        UnifiedThemePalette.NAVY_GOLD -> NavyGoldUnified.darkScheme
        UnifiedThemePalette.EMERALD_SILVER -> EmeraldSilverUnified.darkScheme
        UnifiedThemePalette.ROYAL_BRONZE -> RoyalBronzeUnified.darkScheme
        UnifiedThemePalette.MIDNIGHT_AMBER -> MidnightAmberUnified.darkScheme
        UnifiedThemePalette.OBSIDIAN_CRIMSON -> ObsidianCrimsonUnified.darkScheme
        UnifiedThemePalette.SLATE_CYAN -> SlateCyanUnified.darkScheme
        UnifiedThemePalette.ROYAL_SILVER -> RoyalSilverUnified.darkScheme
        UnifiedThemePalette.FOREST_COPPER -> ForestCopperUnified.darkScheme
        UnifiedThemePalette.BURGUNDY_ROSE_GOLD -> BurgundyRoseGoldUnified.darkScheme
        UnifiedThemePalette.CHARCOAL_CHAMPAGNE -> CharcoalChampagneUnified.darkScheme
        UnifiedThemePalette.SLATE_GUNMETAL -> SlateGunmetalUnified.darkScheme
        UnifiedThemePalette.DEEP_PURPLE_PLATINUM -> DeepPurplePlatinumUnified.darkScheme
    }

    val metallicGradient = getMetallicEffectForTheme(palette)

    CompositionLocalProvider(LocalMetallicGradient provides metallicGradient) {
        MaterialTheme(
            colorScheme = colorScheme,
            typography = CleverFerretTypography,
            content = content
        )
    }
}

// Backward compatibility alias
@Composable
fun PlexTheme(
    darkTheme: Boolean = true,
    dynamicColor: Boolean = false,
    content: @Composable () -> Unit
) {
    CleverFerretTheme(
        palette = ThemePalette.NAVY_GOLD,
        darkTheme = darkTheme,
        dynamicColor = dynamicColor,
        content = content
    )
}

// Beautiful typography with proper hierarchy
private val CleverFerretTypography = Typography(
    // Display styles - for hero sections
    displayLarge = Typography().displayLarge.copy(
        fontWeight = FontWeight.Bold,
        letterSpacing = androidx.compose.ui.unit.sp(-0.5)
    ),
    displayMedium = Typography().displayMedium.copy(
        fontWeight = FontWeight.Bold,
        letterSpacing = androidx.compose.ui.unit.sp(-0.25)
    ),
    displaySmall = Typography().displaySmall.copy(
        fontWeight = FontWeight.SemiBold,
        letterSpacing = androidx.compose.ui.unit.sp(0)
    ),

    // Headline styles - for section headers
    headlineLarge = Typography().headlineLarge.copy(
        fontWeight = FontWeight.Bold,
        letterSpacing = androidx.compose.ui.unit.sp(-0.25)
    ),
    headlineMedium = Typography().headlineMedium.copy(
        fontWeight = FontWeight.Bold,
        letterSpacing = androidx.compose.ui.unit.sp(0)
    ),
    headlineSmall = Typography().headlineSmall.copy(
        fontWeight = FontWeight.SemiBold,
        letterSpacing = androidx.compose.ui.unit.sp(0)
    ),

    // Title styles - for cards and list items
    titleLarge = Typography().titleLarge.copy(
        fontWeight = FontWeight.SemiBold,
        letterSpacing = androidx.compose.ui.unit.sp(0)
    ),
    titleMedium = Typography().titleMedium.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = androidx.compose.ui.unit.sp(0.15)
    ),
    titleSmall = Typography().titleSmall.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = androidx.compose.ui.unit.sp(0.1)
    ),

    // Body styles - for paragraphs and content
    bodyLarge = Typography().bodyLarge.copy(
        fontWeight = FontWeight.Normal,
        letterSpacing = androidx.compose.ui.unit.sp(0.5)
    ),
    bodyMedium = Typography().bodyMedium.copy(
        fontWeight = FontWeight.Normal,
        letterSpacing = androidx.compose.ui.unit.sp(0.25)
    ),
    bodySmall = Typography().bodySmall.copy(
        fontWeight = FontWeight.Normal,
        letterSpacing = androidx.compose.ui.unit.sp(0.4)
    ),

    // Label styles - for buttons and small text
    labelLarge = Typography().labelLarge.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = androidx.compose.ui.unit.sp(0.5)
    ),
    labelMedium = Typography().labelMedium.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = androidx.compose.ui.unit.sp(0.5)
    ),
    labelSmall = Typography().labelSmall.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = androidx.compose.ui.unit.sp(0.5)
    )
)
