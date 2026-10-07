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

import androidx.compose.runtime.ProvidableCompositionLocal
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.runtime.remember
import androidx.compose.ui.platform.LocalConfiguration
import com.universalmedialibrary.ui.media.theme.MediaMotion

// Local composition for metallic effects
val LocalMetallicGradient = staticCompositionLocalOf { MetallicEffects.Gold }

// Local composition for reduced motion preference
val LocalReduceMotion: ProvidableCompositionLocal<Boolean> = compositionLocalOf {
    MediaMotion.isReducedMotionEnabled()
}

/**
 * Get metallic effect for a theme palette
 */
private fun getMetallicEffectForTheme(palette: CleverFerretTheme): MetallicGradient {
    return when (palette) {
        CleverFerretTheme.NAVY_GOLD -> MetallicEffects.Gold
        CleverFerretTheme.EMERALD_SILVER -> MetallicEffects.Silver
        CleverFerretTheme.ROYAL_BRONZE -> MetallicEffects.Copper
        CleverFerretTheme.MIDNIGHT_AMBER -> MetallicEffects.Gold
        CleverFerretTheme.OBSIDIAN_CRIMSON -> MetallicEffects.Copper
        CleverFerretTheme.SLATE_CYAN -> MetallicEffects.Gunmetal
        CleverFerretTheme.ROYAL_SILVER -> MetallicEffects.Silver
        CleverFerretTheme.FOREST_COPPER -> MetallicEffects.Copper
        CleverFerretTheme.BURGUNDY_ROSE_GOLD -> MetallicEffects.RoseGold
        CleverFerretTheme.CHARCOAL_CHAMPAGNE -> MetallicEffects.Champagne
        CleverFerretTheme.SLATE_GUNMETAL -> MetallicEffects.Gunmetal
        CleverFerretTheme.DEEP_PURPLE_PLATINUM -> MetallicEffects.Silver
        CleverFerretTheme.PAPER_INK -> MetallicGradient(
            base = Color(0xFF2C2C2C),
            highlight = Color(0xFF454545),
            shadow = Color(0xFF1A1A1A),
            shimmer = Color(0xFFF0F0EB)
        )
        CleverFerretTheme.COPPER_BRONZE -> MetallicEffects.Copper
        CleverFerretTheme.AMBER_GOLD -> MetallicEffects.Gold
        CleverFerretTheme.ROSE_BRASS -> MetallicEffects.RoseGold
        CleverFerretTheme.STEEL_TITANIUM -> MetallicEffects.Silver
        CleverFerretTheme.PLATINUM_SILVER -> MetallicEffects.Silver
        CleverFerretTheme.COBALT_CHROME -> MetallicEffects.Silver
        CleverFerretTheme.ANCIENT_BRONZE -> MetallicEffects.Copper
        CleverFerretTheme.SILVER_ARCHITECT -> MetallicEffects.Silver
        CleverFerretTheme.OBSIDIAN_TECH -> MetallicEffects.Gunmetal
    }
}

@Composable
fun CleverFerretTheme(
    palette: CleverFerretTheme = CleverFerretTheme.NAVY_GOLD,
    darkTheme: Boolean = true,
    dynamicColor: Boolean = false, // Disable to maintain custom branding
    content: @Composable () -> Unit
) {
    UnifiedCleverFerretTheme(
        theme = palette,
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

    val configuration = LocalConfiguration.current
    val reduceMotion = remember(configuration) { MediaMotion.isReducedMotionEnabled() }

    CompositionLocalProvider(
        LocalMetallicGradient provides metallicGradient,
        LocalReduceMotion provides reduceMotion
    ) {
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
