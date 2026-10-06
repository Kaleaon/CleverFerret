package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.runtime.staticCompositionLocalOf
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

/**
 * Single Theme Entry Point for CleverFerret
 * 
 * Combines metallic effects, Material M3 palettes, and Ancient Architect theme systems.
 */

// ============================================================================
// METALLIC THEME VARIANTS & COLORS
// ============================================================================

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
    val GoldRoyalBlue = Color(0xFF0A1630)
    val Bronze = Color(0xFFCD7F32)
    val Copper = Color(0xFFB87333)
    val Platinum = Color(0xFFE5E4E2)
    val RoseGold = Color(0xFFB76E79)
    val Titanium = Color(0xFF878681)
    val Chrome = Color(0xFFE8E8E8)
    val Cobalt = Color(0xFF0047AB)
    
    // Metallic Highlights
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
        else -> CleverFerretColors.BookGreen
    }
}

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
        UnifiedThemePalette.PAPER_INK -> MetallicThemeVariant.TITANIUM
    }
}

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
        UnifiedThemePalette.PAPER_INK -> PaperInkUnified.lightScheme
    }
}

// ============================================================================
// ANCIENT ARCHITECT DEFINITIONS
// ============================================================================

object StoneColors {
    val DarkSlate = Color(0xFF1A1D23)
    val GraniteGray = Color(0xFF2D3139)
    val StoneLight = Color(0xFF3F4451)
    val CarvedStone = Color(0xFF52575F)
    val MarbleLight = Color(0xFFE8E8E8)
    val Obsidian = Color(0xFF0B1215)
}

object MetallicColors {
    val AncientBronze = Color(0xFFCD7F32)
    val CopperGlow = Color(0xFFB87333)
    val TarnishedGold = Color(0xFFC5A572)
    val PatinaGreen = Color(0xFF4A7C59)
    val BronzeLight = Color(0xFFE8A87C)
    val BronzeDark = Color(0xFF8B5A2B)
    val CopperLight = Color(0xFFD4A574)
    val CopperDark = Color(0xFF8B5A3C)
}

object CrystalColors {
    val AncientCyan = Color(0xFF00CED1)
    val CrystalBlue = Color(0xFF4682B4)
    val AmberEnergy = Color(0xFFFFB347)
    val RubyAlert = Color(0xFFE0115F)
    val CyanDim = Color(0xFF006B6D)
    val BlueDim = Color(0xFF23415A)
    val AmberDim = Color(0xFF7F5923)
    val RubyDim = Color(0xFF70082F)
}

object AccentColors {
    val EmeraldInlay = Color(0xFF50C878)
    val SapphireDeep = Color(0xFF0F52BA)
    val TopazWarm = Color(0xFFFFAA33)
    val GarnetRich = Color(0xFF8B0000)
}

enum class AncientArchitectVariant {
    ANCIENT_BRONZE,
    SILVER_ARCHITECT,
    OBSIDIAN_TECH
}

data class AncientArchitectColorScheme(
    val variant: AncientArchitectVariant,
    val stone: StoneColorSet,
    val metal: MetalColorSet,
    val crystal: CrystalColorSet,
    val accent: AccentColorSet
)

data class StoneColorSet(
    val background: Color,
    val surface: Color,
    val elevated: Color,
    val border: Color,
    val text: Color,
    val shadow: Color
)

data class MetalColorSet(
    val primary: Color,
    val primaryLight: Color,
    val primaryDark: Color,
    val secondary: Color,
    val secondaryLight: Color,
    val secondaryDark: Color
)

data class CrystalColorSet(
    val primary: Color,
    val secondary: Color,
    val warning: Color,
    val error: Color,
    val primaryDim: Color,
    val secondaryDim: Color
)

data class AccentColorSet(
    val success: Color,
    val info: Color,
    val warning: Color,
    val error: Color
)

fun ancientBronzeColors() = AncientArchitectColorScheme(
    variant = AncientArchitectVariant.ANCIENT_BRONZE,
    stone = StoneColorSet(
        background = StoneColors.DarkSlate,
        surface = StoneColors.GraniteGray,
        elevated = StoneColors.StoneLight,
        border = StoneColors.CarvedStone,
        text = StoneColors.MarbleLight,
        shadow = StoneColors.Obsidian
    ),
    metal = MetalColorSet(
        primary = MetallicColors.AncientBronze,
        primaryLight = MetallicColors.BronzeLight,
        primaryDark = MetallicColors.BronzeDark,
        secondary = MetallicColors.CopperGlow,
        secondaryLight = MetallicColors.CopperLight,
        secondaryDark = MetallicColors.CopperDark
    ),
    crystal = CrystalColorSet(
        primary = CrystalColors.AncientCyan,
        secondary = CrystalColors.CrystalBlue,
        warning = CrystalColors.AmberEnergy,
        error = CrystalColors.RubyAlert,
        primaryDim = CrystalColors.CyanDim,
        secondaryDim = CrystalColors.BlueDim
    ),
    accent = AccentColorSet(
        success = AccentColors.EmeraldInlay,
        info = AccentColors.SapphireDeep,
        warning = AccentColors.TopazWarm,
        error = AccentColors.GarnetRich
    )
)

fun silverArchitectColors() = AncientArchitectColorScheme(
    variant = AncientArchitectVariant.SILVER_ARCHITECT,
    stone = StoneColorSet(
        background = Color(0xFF1A1C20),
        surface = Color(0xFF2A2D33),
        elevated = Color(0xFF3A3E46),
        border = Color(0xFF4A4E56),
        text = Color(0xFFE8E8E8),
        shadow = Color(0xFF0A0C10)
    ),
    metal = MetalColorSet(
        primary = Color(0xFFC0C0C0),
        primaryLight = Color(0xFFE8E8E8),
        primaryDark = Color(0xFF808080),
        secondary = Color(0xFFB0B0B0),
        secondaryLight = Color(0xFFD8D8D8),
        secondaryDark = Color(0xFF707070)
    ),
    crystal = CrystalColorSet(
        primary = Color(0xFF4DA6FF),
        secondary = Color(0xFF80B3FF),
        warning = Color(0xFFFFCC80),
        error = Color(0xFFFF6B9D),
        primaryDim = Color(0xFF265380),
        secondaryDim = Color(0xFF405980)
    ),
    accent = AccentColorSet(
        success = Color(0xFF66CDAA),
        info = Color(0xFF4682B4),
        warning = Color(0xFFFFB366),
        error = Color(0xFFDC143C)
    )
)

fun obsidianTechColors() = AncientArchitectColorScheme(
    variant = AncientArchitectVariant.OBSIDIAN_TECH,
    stone = StoneColorSet(
        background = Color(0xFF0D0F14),
        surface = Color(0xFF1A1D23),
        elevated = Color(0xFF252931),
        border = Color(0xFF35383F),
        text = Color(0xFFE0E0E0),
        shadow = Color(0xFF000000)
    ),
    metal = MetalColorSet(
        primary = Color(0xFF4A4A4A),
        primaryLight = Color(0xFF6A6A6A),
        primaryDark = Color(0xFF2A2A2A),
        secondary = Color(0xFF5A5A5A),
        secondaryLight = Color(0xFF7A7A7A),
        secondaryDark = Color(0xFF3A3A3A)
    ),
    crystal = CrystalColorSet(
        primary = Color(0xFF9D4EDD),
        secondary = Color(0xFF00D9FF),
        warning = Color(0xFFFFAA00),
        error = Color(0xFFFF006E),
        primaryDim = Color(0xFF4E276E),
        secondaryDim = Color(0xFF006C7F)
    ),
    accent = AccentColorSet(
        success = Color(0xFF7B68EE),
        info = Color(0xFF00CED1),
        warning = Color(0xFFFFB347),
        error = Color(0xFFFF1493)
    )
)

// ============================================================================
// COMPOSITION LOCALS
// ============================================================================

val LocalAncientArchitectColors = compositionLocalOf { ancientBronzeColors() }
val LocalEnableGeometricPatterns = compositionLocalOf { true }
val LocalEnableMetallicShimmer = compositionLocalOf { true }
val LocalEnableCrystalGlow = compositionLocalOf { true }
val LocalIsAncientArchitect = compositionLocalOf { false }
val LocalMetallicGradient = staticCompositionLocalOf { MetallicEffects.Gold }

// ============================================================================
// HELPER EXTENSIONS
// ============================================================================

@Composable
fun ancientArchitectColors(): AncientArchitectColorScheme = LocalAncientArchitectColors.current

@Composable
fun geometricPatternsEnabled(): Boolean = LocalEnableGeometricPatterns.current

@Composable
fun metallicShimmerEnabled(): Boolean = LocalEnableMetallicShimmer.current

@Composable
fun crystalGlowEnabled(): Boolean = LocalEnableCrystalGlow.current

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

// ============================================================================
// TYPOGRAPHY
// ============================================================================

val CleverFerretTypography = Typography(
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

// ============================================================================
// MAIN THEME COMPOSABLES
// ============================================================================

@Composable
fun AncientArchitectTheme(
    variant: AncientArchitectVariant = AncientArchitectVariant.ANCIENT_BRONZE,
    enableGeometricPatterns: Boolean = true,
    enableMetallicShimmer: Boolean = true,
    enableCrystalGlow: Boolean = true,
    content: @Composable () -> Unit
) {
    val ancientColors = when (variant) {
        AncientArchitectVariant.ANCIENT_BRONZE -> ancientBronzeColors()
        AncientArchitectVariant.SILVER_ARCHITECT -> silverArchitectColors()
        AncientArchitectVariant.OBSIDIAN_TECH -> obsidianTechColors()
    }
    
    val materialColorScheme = darkColorScheme(
        primary = ancientColors.metal.primary,
        onPrimary = Color.Black,
        primaryContainer = ancientColors.metal.primaryDark,
        onPrimaryContainer = ancientColors.metal.primaryLight,
        secondary = ancientColors.metal.secondary,
        onSecondary = Color.Black,
        secondaryContainer = ancientColors.metal.secondaryDark,
        onSecondaryContainer = ancientColors.metal.secondaryLight,
        tertiary = ancientColors.crystal.primary,
        onTertiary = Color.Black,
        tertiaryContainer = ancientColors.crystal.primaryDim,
        onTertiaryContainer = ancientColors.crystal.primary,
        background = ancientColors.stone.background,
        onBackground = ancientColors.stone.text,
        surface = ancientColors.stone.surface,
        onSurface = ancientColors.stone.text,
        surfaceVariant = ancientColors.stone.elevated,
        onSurfaceVariant = ancientColors.stone.text.copy(alpha = 0.8f),
        surfaceTint = ancientColors.crystal.primary,
        inverseSurface = ancientColors.stone.text,
        inverseOnSurface = ancientColors.stone.background,
        error = ancientColors.accent.error,
        onError = Color.White,
        errorContainer = ancientColors.crystal.error,
        onErrorContainer = Color.White,
        outline = ancientColors.stone.border,
        outlineVariant = ancientColors.stone.border.copy(alpha = 0.5f),
        scrim = ancientColors.stone.shadow.copy(alpha = 0.5f)
    )
    
    CompositionLocalProvider(
        LocalAncientArchitectColors provides ancientColors,
        LocalEnableGeometricPatterns provides enableGeometricPatterns,
        LocalEnableMetallicShimmer provides enableMetallicShimmer,
        LocalEnableCrystalGlow provides enableCrystalGlow,
        LocalIsAncientArchitect provides true
    ) {
        MaterialTheme(
            colorScheme = materialColorScheme,
            typography = AncientArchitectTypography,
            content = content
        )
    }
}

@Composable
fun CleverFerretTheme(
    palette: ThemePalette = ThemePalette.NAVY_GOLD,
    darkTheme: Boolean = true,
    dynamicColor: Boolean = false,
    content: @Composable () -> Unit
) {
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

    val metallicGradient = getMetallicColorsForVariant(palette.toMetallicVariant())

    CompositionLocalProvider(LocalMetallicGradient provides metallicGradient) {
        MaterialTheme(
            colorScheme = colorScheme,
            typography = CleverFerretTypography,
            content = content
        )
    }
}
