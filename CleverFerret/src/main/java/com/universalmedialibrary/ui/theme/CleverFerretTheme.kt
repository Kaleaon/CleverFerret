package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.staticCompositionLocalOf
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

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

/**
 * Get metallic effect for a theme palette
 */
private fun getMetallicEffectForTheme(palette: ThemePalette): MetallicGradient {
    return when (palette) {
        ThemePalette.NAVY_GOLD -> MetallicEffects.Gold
        ThemePalette.EMERALD_SILVER -> MetallicEffects.Silver
        ThemePalette.ROYAL_BRONZE -> MetallicEffects.Copper
        ThemePalette.MIDNIGHT_AMBER -> MetallicEffects.Gold
        ThemePalette.OBSIDIAN_CRIMSON -> MetallicEffects.Copper
        ThemePalette.SLATE_CYAN -> MetallicEffects.Gunmetal
        ThemePalette.ROYAL_SILVER -> MetallicEffects.Silver
        ThemePalette.FOREST_COPPER -> MetallicEffects.Copper
        ThemePalette.BURGUNDY_ROSE_GOLD -> MetallicEffects.RoseGold
        ThemePalette.CHARCOAL_CHAMPAGNE -> MetallicEffects.Champagne
        ThemePalette.SLATE_GUNMETAL -> MetallicEffects.Gunmetal
        ThemePalette.DEEP_PURPLE_PLATINUM -> MetallicEffects.Silver
        ThemePalette.PAPER_INK -> MetallicGradient(
            base = Color(0xFF2C2C2C),
            highlight = Color(0xFF454545),
            shadow = Color(0xFF1A1A1A),
            shimmer = Color(0xFFF0F0EB)
        )
        ThemePalette.COPPER_BRONZE -> MetallicEffects.Copper
        ThemePalette.AMBER_GOLD -> MetallicEffects.Gold
        ThemePalette.ROSE_BRASS -> MetallicEffects.RoseGold
        ThemePalette.STEEL_TITANIUM -> MetallicEffects.Silver
        ThemePalette.PLATINUM_SILVER -> MetallicEffects.Silver
        ThemePalette.COBALT_CHROME -> MetallicEffects.Silver
        ThemePalette.ANCIENT_BRONZE -> MetallicEffects.Copper
        ThemePalette.SILVER_ARCHITECT -> MetallicEffects.Silver
        ThemePalette.OBSIDIAN_TECH -> MetallicEffects.Gunmetal
    }
}

@Composable
fun CleverFerretTheme(
    palette: ThemePalette = ThemePalette.NAVY_GOLD,
    darkTheme: Boolean = true,
    dynamicColor: Boolean = false, // Disable to maintain custom branding
    content: @Composable () -> Unit
) {
    // Map old enum to new unified theme system
    val theme = when (palette) {
        ThemePalette.NAVY_GOLD -> CleverFerretTheme.NAVY_GOLD
        ThemePalette.EMERALD_SILVER -> CleverFerretTheme.EMERALD_SILVER
        ThemePalette.ROYAL_BRONZE -> CleverFerretTheme.ROYAL_BRONZE
        ThemePalette.MIDNIGHT_AMBER -> CleverFerretTheme.MIDNIGHT_AMBER
        ThemePalette.OBSIDIAN_CRIMSON -> CleverFerretTheme.OBSIDIAN_CRIMSON
        ThemePalette.SLATE_CYAN -> CleverFerretTheme.SLATE_CYAN
        ThemePalette.ROYAL_SILVER -> CleverFerretTheme.ROYAL_SILVER
        ThemePalette.FOREST_COPPER -> CleverFerretTheme.FOREST_COPPER
        ThemePalette.BURGUNDY_ROSE_GOLD -> CleverFerretTheme.BURGUNDY_ROSE_GOLD
        ThemePalette.CHARCOAL_CHAMPAGNE -> CleverFerretTheme.CHARCOAL_CHAMPAGNE
        ThemePalette.SLATE_GUNMETAL -> CleverFerretTheme.SLATE_GUNMETAL
        ThemePalette.DEEP_PURPLE_PLATINUM -> CleverFerretTheme.DEEP_PURPLE_PLATINUM
        ThemePalette.PAPER_INK -> CleverFerretTheme.PAPER_INK
        ThemePalette.COPPER_BRONZE -> CleverFerretTheme.COPPER_BRONZE
        ThemePalette.AMBER_GOLD -> CleverFerretTheme.AMBER_GOLD
        ThemePalette.ROSE_BRASS -> CleverFerretTheme.ROSE_BRASS
        ThemePalette.STEEL_TITANIUM -> CleverFerretTheme.STEEL_TITANIUM
        ThemePalette.PLATINUM_SILVER -> CleverFerretTheme.PLATINUM_SILVER
        ThemePalette.COBALT_CHROME -> CleverFerretTheme.COBALT_CHROME
        ThemePalette.ANCIENT_BRONZE -> CleverFerretTheme.ANCIENT_BRONZE
        ThemePalette.SILVER_ARCHITECT -> CleverFerretTheme.SILVER_ARCHITECT
        ThemePalette.OBSIDIAN_TECH -> CleverFerretTheme.OBSIDIAN_TECH
    }

    UnifiedCleverFerretTheme(
        theme = theme,
        darkTheme = darkTheme,
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
        UnifiedThemePalette.PAPER_INK -> PaperInkUnified.lightScheme
    }

    val metallicColors = getMetallicEffectForTheme(palette)
    val metallicGradient = if (metallicColors.isNotEmpty() && metallicColors.size >= 3) {
        MetallicGradient(
            base = metallicColors[0],
            highlight = metallicColors[1],
            shadow = metallicColors[2],
            shimmer = metallicColors.getOrNull(3)
        )
    } else {
        MetallicEffects.Gold
    }

    CompositionLocalProvider(LocalMetallicGradient provides metallicGradient) {
        MaterialTheme(
            colorScheme = colorScheme,
            typography = CleverFerretTypography,
            content = content
        )
    }
}

// Beautiful typography with proper hierarchy
private val CleverFerretTypography = Typography(
    // Display styles - for hero sections
    displayLarge = Typography().displayLarge.copy(
        fontWeight = FontWeight.Bold,
        letterSpacing = (-0.5).sp
    ),
    displayMedium = Typography().displayMedium.copy(
        fontWeight = FontWeight.Bold,
        letterSpacing = (-0.25).sp
    ),
    displaySmall = Typography().displaySmall.copy(
        fontWeight = FontWeight.SemiBold,
        letterSpacing = 0.sp
    ),

    // Headline styles - for section headers
    headlineLarge = Typography().headlineLarge.copy(
        fontWeight = FontWeight.Bold,
        letterSpacing = (-0.25).sp
    ),
    headlineMedium = Typography().headlineMedium.copy(
        fontWeight = FontWeight.Bold,
        letterSpacing = 0.sp
    ),
    headlineSmall = Typography().headlineSmall.copy(
        fontWeight = FontWeight.SemiBold,
        letterSpacing = 0.sp
    ),

    // Title styles - for cards and list items
    titleLarge = Typography().titleLarge.copy(
        fontWeight = FontWeight.SemiBold,
        letterSpacing = 0.sp
    ),
    titleMedium = Typography().titleMedium.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = 0.15.sp
    ),
    titleSmall = Typography().titleSmall.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = 0.1.sp
    ),

    // Body styles - for paragraphs and content
    bodyLarge = Typography().bodyLarge.copy(
        fontWeight = FontWeight.Normal,
        letterSpacing = 0.5.sp
    ),
    bodyMedium = Typography().bodyMedium.copy(
        fontWeight = FontWeight.Normal,
        letterSpacing = 0.25.sp
    ),
    bodySmall = Typography().bodySmall.copy(
        fontWeight = FontWeight.Normal,
        letterSpacing = 0.4.sp
    ),

    // Label styles - for buttons and small text
    labelLarge = Typography().labelLarge.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = 0.5.sp
    ),
    labelMedium = Typography().labelMedium.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = 0.5.sp
    ),
    labelSmall = Typography().labelSmall.copy(
        fontWeight = FontWeight.Medium,
        letterSpacing = 0.5.sp
    )
)
