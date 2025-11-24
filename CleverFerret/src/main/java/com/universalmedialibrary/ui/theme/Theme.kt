package com.universalmedialibrary.ui.theme

import androidx.compose.material3.ColorScheme
import androidx.compose.ui.graphics.Color

/**
 * Enhanced Theme System for CleverFerret
 * 
 * Combines existing metallic effects with comprehensive Material You support
 * and media-type-specific colors.
 */

/**
 * Metallic Theme Variants
 */
enum class MetallicThemeVariant {
    SILVER,
    GOLD,
    GOLD_ROYAL_BLUE,
    BRONZE,
    COPPER,
    PLATINUM,
    ROSE_GOLD,
    TITANIUM,
    CHROME,
    COBALT
}

/**
 * Media-type-specific colors for consistent UI
 */
object CleverFerretColors {
    // Media Type Colors
    val BookGreen = Color(0xFF4CAF50)
    val MovieBlue = Color(0xFF2196F3)
    val MusicPurple = Color(0xFF9C27B0)
    val TVShowOrange = Color(0xFFFF9800)
    val PodcastRed = Color(0xFFF44336)
    val AudiobookTeal = Color(0xFF009688)
    val ComicYellow = Color(0xFFFFEB3B)
    val RadioCyan = Color(0xFF00BCD4)
    val MagazineIndigo = Color(0xFF3F51B5)
    val NewsAmber = Color(0xFFFFC107)
    val FanfictionPink = Color(0xFFE91E63)
    
    // Metallic Theme Colors
    val Silver = Color(0xFFC0C0C0)
    val Gold = Color(0xFFD4AF37)
    val GoldRoyalBlue = Color(0xFF0A1630) // Navy background for Gold accent
    val Bronze = Color(0xFFCD7F32)
    val Copper = Color(0xFFB87333)
    val Platinum = Color(0xFFE5E4E2)
    val RoseGold = Color(0xFFB76E79)
    val Titanium = Color(0xFF878681)
    val Chrome = Color(0xFFE8E8E8)
    val Cobalt = Color(0xFF0047AB)
    
    // Metallic Highlights (shimmer effects)
    val SilverHighlight = Color(0xFFF5F5F5)
    val GoldHighlight = Color(0xFFFFD700)
    val BronzeHighlight = Color(0xFFD99952)
    val CopperHighlight = Color(0xFFE8B4A0)
    val PlatinumHighlight = Color(0xFFF5F5F5)
    val RoseGoldHighlight = Color(0xFFE5BE8A)
    val TitaniumHighlight = Color(0xFFBDBBB8)
    val ChromeHighlight = Color(0xFFFFFFFF)
    val CobaltHighlight = Color(0xFF0066CC)
}

/**
 * Extension function to get color for a media type
 */
fun String.getMediaTypeColor(): Color {
    return when (this.uppercase()) {
        "BOOK", "EBOOK" -> CleverFerretColors.BookGreen
        "MOVIE" -> CleverFerretColors.MovieBlue
        "MUSIC", "MUSIC_TRACK", "ALBUM" -> CleverFerretColors.MusicPurple
        "TV_SHOW", "TV", "SERIES" -> CleverFerretColors.TVShowOrange
        "PODCAST" -> CleverFerretColors.PodcastRed
        "AUDIOBOOK" -> CleverFerretColors.AudiobookTeal
        "COMIC", "MANGA" -> CleverFerretColors.ComicYellow
        "RADIO" -> CleverFerretColors.RadioCyan
        "MAGAZINE" -> CleverFerretColors.MagazineIndigo
        "NEWS" -> CleverFerretColors.NewsAmber
        "FANFICTION" -> CleverFerretColors.FanfictionPink
        else -> CleverFerretColors.BookGreen // Default fallback
    }
}

/**
 * Get metallic colors for a theme variant
 */
fun getMetallicColorsForVariant(variant: MetallicThemeVariant): MetallicGradient {
    return when (variant) {
        MetallicThemeVariant.SILVER -> MetallicGradient(
            base = CleverFerretColors.Silver,
            highlight = CleverFerretColors.SilverHighlight,
            shadow = Color(0xFF505050),
            shimmer = CleverFerretColors.Platinum
        )
        MetallicThemeVariant.GOLD -> MetallicGradient(
            base = CleverFerretColors.Gold,
            highlight = CleverFerretColors.GoldHighlight,
            shadow = Color(0xFF856D34),
            shimmer = Color(0xFFFFF8DC)
        )
        MetallicThemeVariant.GOLD_ROYAL_BLUE -> MetallicGradient(
            base = CleverFerretColors.Gold,
            highlight = CleverFerretColors.GoldHighlight,
            shadow = CleverFerretColors.GoldRoyalBlue,
            shimmer = Color(0xFFFFF8DC)
        )
        MetallicThemeVariant.BRONZE -> MetallicGradient(
            base = CleverFerretColors.Bronze,
            highlight = CleverFerretColors.BronzeHighlight,
            shadow = Color(0xFF6B4423),
            shimmer = Color(0xFFF0D9C0)
        )
        MetallicThemeVariant.COPPER -> MetallicGradient(
            base = CleverFerretColors.Copper,
            highlight = CleverFerretColors.CopperHighlight,
            shadow = Color(0xFF6B3410),
            shimmer = Color(0xFFF2D2B0)
        )
        MetallicThemeVariant.PLATINUM -> MetallicGradient(
            base = CleverFerretColors.Platinum,
            highlight = CleverFerretColors.PlatinumHighlight,
            shadow = Color(0xFF9E9E9E),
            shimmer = Color(0xFFFFFFFF)
        )
        MetallicThemeVariant.ROSE_GOLD -> MetallicGradient(
            base = CleverFerretColors.RoseGold,
            highlight = CleverFerretColors.RoseGoldHighlight,
            shadow = Color(0xFF7D4A52),
            shimmer = Color(0xFFF5D5D8)
        )
        MetallicThemeVariant.TITANIUM -> MetallicGradient(
            base = CleverFerretColors.Titanium,
            highlight = CleverFerretColors.TitaniumHighlight,
            shadow = Color(0xFF4A4A48),
            shimmer = Color(0xFFD0CFCC)
        )
        MetallicThemeVariant.CHROME -> MetallicGradient(
            base = CleverFerretColors.Chrome,
            highlight = CleverFerretColors.ChromeHighlight,
            shadow = Color(0xFF9E9E9E),
            shimmer = Color(0xFFFFFFFF)
        )
        MetallicThemeVariant.COBALT -> MetallicGradient(
            base = CleverFerretColors.Cobalt,
            highlight = CleverFerretColors.CobaltHighlight,
            shadow = Color(0xFF002A66),
            shimmer = Color(0xFF66A3D2)
        )
    }
}

/**
 * Map UnifiedThemePalette to MetallicThemeVariant for compatibility
 */
fun UnifiedThemePalette.toMetallicVariant(): MetallicThemeVariant {
    return when (this) {
        UnifiedThemePalette.NAVY_GOLD -> MetallicThemeVariant.GOLD_ROYAL_BLUE
        UnifiedThemePalette.EMERALD_SILVER -> MetallicThemeVariant.SILVER
        UnifiedThemePalette.ROYAL_BRONZE -> MetallicThemeVariant.BRONZE
        UnifiedThemePalette.MIDNIGHT_AMBER -> MetallicThemeVariant.GOLD
        UnifiedThemePalette.OBSIDIAN_CRIMSON -> MetallicThemeVariant.COPPER
        UnifiedThemePalette.SLATE_CYAN -> MetallicThemeVariant.TITANIUM
        UnifiedThemePalette.ROYAL_SILVER -> MetallicThemeVariant.SILVER
        UnifiedThemePalette.FOREST_COPPER -> MetallicThemeVariant.COPPER
        UnifiedThemePalette.BURGUNDY_ROSE_GOLD -> MetallicThemeVariant.ROSE_GOLD
        UnifiedThemePalette.CHARCOAL_CHAMPAGNE -> MetallicThemeVariant.GOLD
        UnifiedThemePalette.SLATE_GUNMETAL -> MetallicThemeVariant.TITANIUM
        UnifiedThemePalette.DEEP_PURPLE_PLATINUM -> MetallicThemeVariant.PLATINUM
    }
}

/**
 * Get ColorScheme for a UnifiedThemePalette (maintains compatibility)
 */
fun UnifiedThemePalette.getColorScheme(darkTheme: Boolean = true): ColorScheme {
    return when (this) {
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
}