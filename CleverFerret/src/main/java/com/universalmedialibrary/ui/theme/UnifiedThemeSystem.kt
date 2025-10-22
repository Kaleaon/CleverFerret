package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.ui.graphics.Color

/**
 * Unified Theme System for CleverFerret
 * 
 * Combines 12 traditional metallic themes with the new Ancient Architect theme system.
 * Provides seamless switching between all 15 theme variants:
 * - 12 Unified themes (Navy Gold, Emerald Silver, etc.)
 * - 3 Ancient Architect variants (Ancient Bronze, Silver Architect, Obsidian Tech)
 */

/**
 * Master theme enum including all available themes
 */
enum class CleverFerretTheme {
    // Unified Themes (12)
    NAVY_GOLD,
    EMERALD_SILVER,
    ROYAL_BRONZE,
    MIDNIGHT_AMBER,
    OBSIDIAN_CRIMSON,
    SLATE_CYAN,
    ROYAL_SILVER,
    FOREST_COPPER,
    BURGUNDY_ROSE_GOLD,
    CHARCOAL_CHAMPAGNE,
    SLATE_GUNMETAL,
    DEEP_PURPLE_PLATINUM,
    
    // Ancient Architect Variants (3)
    ANCIENT_BRONZE,
    SILVER_ARCHITECT,
    OBSIDIAN_TECH
}

/**
 * Theme configuration data class
 */
data class ThemeConfig(
    val displayName: String,
    val description: String,
    val category: ThemeCategory,
    val hasGeometricPatterns: Boolean = false,
    val hasMetallicShimmer: Boolean = true,
    val hasCrystalGlow: Boolean = false
)

/**
 * Theme categories for organization
 */
enum class ThemeCategory {
    CLASSIC,           // Original unified themes
    ARCHITECTURAL,     // Ancient Architect themes
    METALLIC,          // Pure metallic themes
    NATURE,            // Nature-inspired themes
    BOLD               // Bold/dramatic themes
}

/**
 * Get theme configuration
 */
fun CleverFerretTheme.getConfig(): ThemeConfig {
    return when (this) {
        CleverFerretTheme.NAVY_GOLD -> ThemeConfig(
            displayName = "Navy & Gold",
            description = "Classic Plex-inspired elegance",
            category = ThemeCategory.CLASSIC
        )
        CleverFerretTheme.EMERALD_SILVER -> ThemeConfig(
            displayName = "Emerald & Silver",
            description = "Nature-inspired sophistication",
            category = ThemeCategory.NATURE
        )
        CleverFerretTheme.ROYAL_BRONZE -> ThemeConfig(
            displayName = "Royal & Bronze",
            description = "Regal luxury",
            category = ThemeCategory.CLASSIC
        )
        CleverFerretTheme.MIDNIGHT_AMBER -> ThemeConfig(
            displayName = "Midnight & Amber",
            description = "Sophisticated night theme",
            category = ThemeCategory.CLASSIC
        )
        CleverFerretTheme.OBSIDIAN_CRIMSON -> ThemeConfig(
            displayName = "Obsidian & Crimson",
            description = "Bold dramatic contrast",
            category = ThemeCategory.BOLD
        )
        CleverFerretTheme.SLATE_CYAN -> ThemeConfig(
            displayName = "Slate & Cyan",
            description = "Cool modern aesthetic",
            category = ThemeCategory.CLASSIC
        )
        CleverFerretTheme.ROYAL_SILVER -> ThemeConfig(
            displayName = "Royal Silver",
            description = "Regal and modern",
            category = ThemeCategory.METALLIC
        )
        CleverFerretTheme.FOREST_COPPER -> ThemeConfig(
            displayName = "Forest & Copper",
            description = "Natural warmth",
            category = ThemeCategory.NATURE
        )
        CleverFerretTheme.BURGUNDY_ROSE_GOLD -> ThemeConfig(
            displayName = "Burgundy & Rose Gold",
            description = "Luxurious elegance",
            category = ThemeCategory.CLASSIC
        )
        CleverFerretTheme.CHARCOAL_CHAMPAGNE -> ThemeConfig(
            displayName = "Charcoal & Champagne",
            description = "Sophisticated subtlety",
            category = ThemeCategory.METALLIC
        )
        CleverFerretTheme.SLATE_GUNMETAL -> ThemeConfig(
            displayName = "Slate & Gunmetal",
            description = "Modern industrial",
            category = ThemeCategory.METALLIC
        )
        CleverFerretTheme.DEEP_PURPLE_PLATINUM -> ThemeConfig(
            displayName = "Deep Purple & Platinum",
            description = "Royal modern luxury",
            category = ThemeCategory.CLASSIC
        )
        CleverFerretTheme.ANCIENT_BRONZE -> ThemeConfig(
            displayName = "Ancient Bronze",
            description = "Art Deco meets Dwarven architecture",
            category = ThemeCategory.ARCHITECTURAL,
            hasGeometricPatterns = true,
            hasMetallicShimmer = true,
            hasCrystalGlow = true
        )
        CleverFerretTheme.SILVER_ARCHITECT -> ThemeConfig(
            displayName = "Silver Architect",
            description = "Frank Lloyd Wright inspired",
            category = ThemeCategory.ARCHITECTURAL,
            hasGeometricPatterns = true,
            hasMetallicShimmer = true,
            hasCrystalGlow = true
        )
        CleverFerretTheme.OBSIDIAN_TECH -> ThemeConfig(
            displayName = "Obsidian Tech",
            description = "Stargate Atlantis meets ancient tech",
            category = ThemeCategory.ARCHITECTURAL,
            hasGeometricPatterns = true,
            hasMetallicShimmer = true,
            hasCrystalGlow = true
        )
    }
}

/**
 * Main unified theme composable
 * 
 * @param theme The theme to apply
 * @param darkTheme Whether to use dark theme (only applies to some themes)
 * @param enableGeometricPatterns Enable geometric patterns (Ancient Architect only)
 * @param enableMetallicShimmer Enable shimmer effects
 * @param enableCrystalGlow Enable crystal glow effects (Ancient Architect only)
 * @param content The content to theme
 */
@Composable
fun UnifiedCleverFerretTheme(
    theme: CleverFerretTheme = CleverFerretTheme.NAVY_GOLD,
    darkTheme: Boolean = isSystemInDarkTheme(),
    enableGeometricPatterns: Boolean = true,
    enableMetallicShimmer: Boolean = true,
    enableCrystalGlow: Boolean = true,
    content: @Composable () -> Unit
) {
    // Determine if this is an Ancient Architect theme
    val isAncientArchitect = theme in listOf(
        CleverFerretTheme.ANCIENT_BRONZE,
        CleverFerretTheme.SILVER_ARCHITECT,
        CleverFerretTheme.OBSIDIAN_TECH
    )
    
    if (isAncientArchitect) {
        // Use Ancient Architect theme system
        val variant = when (theme) {
            CleverFerretTheme.ANCIENT_BRONZE -> AncientArchitectVariant.ANCIENT_BRONZE
            CleverFerretTheme.SILVER_ARCHITECT -> AncientArchitectVariant.SILVER_ARCHITECT
            CleverFerretTheme.OBSIDIAN_TECH -> AncientArchitectVariant.OBSIDIAN_TECH
            else -> AncientArchitectVariant.ANCIENT_BRONZE
        }
        
        AncientArchitectTheme(
            variant = variant,
            enableGeometricPatterns = enableGeometricPatterns,
            enableMetallicShimmer = enableMetallicShimmer,
            enableCrystalGlow = enableCrystalGlow,
            content = content
        )
    } else {
        // Use traditional unified theme system
        val colorScheme = getColorSchemeForTheme(theme, darkTheme)
        val metallicColors = getMetallicColorsForTheme(theme)
        
        MaterialTheme(
            colorScheme = colorScheme,
            typography = AncientArchitectTypography, // Use the same typography
            content = content
        )
    }
}

/**
 * Get color scheme for a traditional theme
 */
private fun getColorSchemeForTheme(theme: CleverFerretTheme, darkTheme: Boolean): ColorScheme {
    return when (theme) {
        CleverFerretTheme.NAVY_GOLD -> NavyGoldUnified.darkScheme
        CleverFerretTheme.EMERALD_SILVER -> EmeraldSilverUnified.darkScheme
        CleverFerretTheme.ROYAL_BRONZE -> RoyalBronzeUnified.darkScheme
        CleverFerretTheme.MIDNIGHT_AMBER -> MidnightAmberUnified.darkScheme
        CleverFerretTheme.OBSIDIAN_CRIMSON -> ObsidianCrimsonUnified.darkScheme
        CleverFerretTheme.SLATE_CYAN -> SlateCyanUnified.darkScheme
        CleverFerretTheme.ROYAL_SILVER -> RoyalSilverUnified.darkScheme
        CleverFerretTheme.FOREST_COPPER -> ForestCopperUnified.darkScheme
        CleverFerretTheme.BURGUNDY_ROSE_GOLD -> BurgundyRoseGoldUnified.darkScheme
        CleverFerretTheme.CHARCOAL_CHAMPAGNE -> CharcoalChampagneUnified.darkScheme
        CleverFerretTheme.SLATE_GUNMETAL -> SlateGunmetalUnified.darkScheme
        CleverFerretTheme.DEEP_PURPLE_PLATINUM -> DeepPurplePlatinumUnified.darkScheme
        else -> NavyGoldUnified.darkScheme // Fallback
    }
}

/**
 * Get metallic colors for a traditional theme
 */
private fun getMetallicColorsForTheme(theme: CleverFerretTheme): MetallicGradient {
    return when (theme) {
        CleverFerretTheme.NAVY_GOLD -> MetallicGradient(
            base = Color(0xFFD4AF37),
            highlight = Color(0xFFFFD700),
            shadow = Color(0xFF856D34),
            shimmer = Color(0xFFFFF8DC)
        )
        CleverFerretTheme.EMERALD_SILVER -> MetallicGradient(
            base = Color(0xFFC0C0C0),
            highlight = Color(0xFFE0E0E0),
            shadow = Color(0xFF808080),
            shimmer = Color(0xFFF5F5F5)
        )
        CleverFerretTheme.ROYAL_BRONZE -> MetallicGradient(
            base = Color(0xFFCD7F32),
            highlight = Color(0xFFD99952),
            shadow = Color(0xFF8B5A2B),
            shimmer = Color(0xFFF0D9C0)
        )
        CleverFerretTheme.MIDNIGHT_AMBER -> MetallicGradient(
            base = Color(0xFFFFBF00),
            highlight = Color(0xFFFFD700),
            shadow = Color(0xFFCC9900),
            shimmer = Color(0xFFFFF8DC)
        )
        CleverFerretTheme.OBSIDIAN_CRIMSON -> MetallicGradient(
            base = Color(0xFFDC143C),
            highlight = Color(0xFFE5395F),
            shadow = Color(0xFFB00F30),
            shimmer = Color(0xFFFFB3C1)
        )
        CleverFerretTheme.SLATE_CYAN -> MetallicGradient(
            base = Color(0xFF00D9FF),
            highlight = Color(0xFF4DE2FF),
            shadow = Color(0xFF00A8CC),
            shimmer = Color(0xFFB3F5FF)
        )
        CleverFerretTheme.ROYAL_SILVER -> MetallicGradient(
            base = Color(0xFFC0C0C0),
            highlight = Color(0xFFE0E0E0),
            shadow = Color(0xFF9A9A9A),
            shimmer = Color(0xFFF5F5F5)
        )
        CleverFerretTheme.FOREST_COPPER -> MetallicGradient(
            base = Color(0xFFB87333),
            highlight = Color(0xFFD4965A),
            shadow = Color(0xFF935E29),
            shimmer = Color(0xFFF2D2B0)
        )
        CleverFerretTheme.BURGUNDY_ROSE_GOLD -> MetallicGradient(
            base = Color(0xFFB76E79),
            highlight = Color(0xFFD4969E),
            shadow = Color(0xFF93575F),
            shimmer = Color(0xFFF5D5D8)
        )
        CleverFerretTheme.CHARCOAL_CHAMPAGNE -> MetallicGradient(
            base = Color(0xFFF7E7CE),
            highlight = Color(0xFFFFF5E6),
            shadow = Color(0xFFC5B8A5),
            shimmer = Color(0xFFFFFFFF)
        )
        CleverFerretTheme.SLATE_GUNMETAL -> MetallicGradient(
            base = Color(0xFF8F9CA8),
            highlight = Color(0xFFB0BDC9),
            shadow = Color(0xFF6F7D87),
            shimmer = Color(0xFFD0DFEB)
        )
        CleverFerretTheme.DEEP_PURPLE_PLATINUM -> MetallicGradient(
            base = Color(0xFFE5E4E2),
            highlight = Color(0xFFF5F4F2),
            shadow = Color(0xFFB8B7B5),
            shimmer = Color(0xFFFFFFFF)
        )
        else -> MetallicGradient(
            base = Color(0xFFD4AF37),
            highlight = Color(0xFFFFD700),
            shadow = Color(0xFF856D34),
            shimmer = Color(0xFFFFF8DC)
        )
    }
}

/**
 * Data class for metallic gradient effects
 */
data class MetallicGradient(
    val base: Color,
    val highlight: Color,
    val shadow: Color,
    val shimmer: Color
)

/**
 * Composition local for metallic colors
 */
val LocalMetallicColors = compositionLocalOf {
    MetallicGradient(
        base = Color(0xFFD4AF37),
        highlight = Color(0xFFFFD700),
        shadow = Color(0xFF856D34),
        shimmer = Color(0xFFFFF8DC)
    )
}

/**
 * Access current metallic colors
 */
@Composable
fun metallicColors(): MetallicGradient {
    return LocalMetallicColorsInternal.current
}

/**
 * Helper extension to check if theme is Ancient Architect
 */
fun CleverFerretTheme.isAncientArchitect(): Boolean {
    return this in listOf(
        CleverFerretTheme.ANCIENT_BRONZE,
        CleverFerretTheme.SILVER_ARCHITECT,
        CleverFerretTheme.OBSIDIAN_TECH
    )
}

/**
 * Helper to get theme by index (for preference storage)
 */
fun Int.toCleverFerretTheme(): CleverFerretTheme {
    return CleverFerretTheme.entries.getOrNull(this) ?: CleverFerretTheme.NAVY_GOLD
}

/**
 * Helper to get index from theme (for preference storage)
 */
fun CleverFerretTheme.toIndex(): Int {
    return CleverFerretTheme.entries.indexOf(this)
}
