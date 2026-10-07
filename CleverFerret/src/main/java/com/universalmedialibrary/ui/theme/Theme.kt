package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.LocalIndication
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.ProvidableCompositionLocal
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.staticCompositionLocalOf
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.cleverferret.core.designsystem.theme.KthemeThemeAdapterV1
import com.cleverferret.core.designsystem.theme.LocalSemanticTheme
import com.universalmedialibrary.ui.media.theme.MediaMotion



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
// ANCIENT ARCHITECT THEME
// ============================================================================



/**
 * Ancient Architect Theme - Combining Art Deco, Dwarven, Frank Lloyd Wright, and Stargate Atlantis aesthetics
 * 
 * This theme creates a unique fusion of:
 * - Art Deco's geometric luxury and metallic accents
 * - Dwarven architecture's stone and metalwork
 * - Frank Lloyd Wright's organic geometry and craftsmanship
 * - Stargate Atlantis's ancient technology and glowing elements
 */

// ============================================================================
// COLOR DEFINITIONS
// ============================================================================

/**
 * Stone Foundation Colors - The base layer representing carved stone
 */
object StoneColors {
    val DarkSlate = Color(0xFF1A1D23)      // Background
    val GraniteGray = Color(0xFF2D3139)    // Surface
    val StoneLight = Color(0xFF3F4451)     // Elevated Surface
    val CarvedStone = Color(0xFF52575F)    // Borders
    val MarbleLight = Color(0xFFE8E8E8)    // Text
    val Obsidian = Color(0xFF0B1215)       // Deep shadows
}

/**
 * Metallic Accent Colors - Representing crafted metalwork
 */
object MetallicColors {
    val AncientBronze = Color(0xFFCD7F32)  // Primary actions
    val CopperGlow = Color(0xFFB87333)     // Highlights
    val TarnishedGold = Color(0xFFC5A572)  // Secondary actions
    val PatinaGreen = Color(0xFF4A7C59)    // Success states
    
    // Gradient stops for metallic effects
    val BronzeLight = Color(0xFFE8A87C)
    val BronzeDark = Color(0xFF8B5A2B)
    val CopperLight = Color(0xFFD4A574)
    val CopperDark = Color(0xFF8B5A3C)
}

/**
 * Crystalline Technology Colors - Glowing energy states
 */
object CrystalColors {
    val AncientCyan = Color(0xFF00CED1)    // Primary glow
    val CrystalBlue = Color(0xFF4682B4)    // Secondary glow
    val AmberEnergy = Color(0xFFFFB347)    // Warning/Alert
    val RubyAlert = Color(0xFFE0115F)      // Error states
    
    // Dimmed versions for inactive states
    val CyanDim = Color(0xFF006B6D)
    val BlueDim = Color(0xFF23415A)
    val AmberDim = Color(0xFF7F5923)
    val RubyDim = Color(0xFF70082F)
}

/**
 * Accent Colors - Decorative and semantic colors
 */
object AccentColors {
    val EmeraldInlay = Color(0xFF50C878)   // Success
    val SapphireDeep = Color(0xFF0F52BA)   // Info
    val TopazWarm = Color(0xFFFFAA33)      // Warning
    val GarnetRich = Color(0xFF8B0000)     // Error
}

// ============================================================================
// THEME VARIANTS
// ============================================================================

/**
 * Theme variant definitions
 */
enum class AncientArchitectVariant {
    ANCIENT_BRONZE,    // Default: Bronze/copper with warm tones
    SILVER_ARCHITECT,  // Silver/platinum with cool tones
    OBSIDIAN_TECH     // Dark metallics with purple/cyan
}

/**
 * Color scheme for Ancient Architect theme
 */
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

// ============================================================================
// THEME VARIANT IMPLEMENTATIONS
// ============================================================================

/**
 * Ancient Bronze variant (Default)
 */
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

/**
 * Silver Architect variant
 */
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
        primary = Color(0xFFC0C0C0),        // Silver
        primaryLight = Color(0xFFE8E8E8),   // Bright silver
        primaryDark = Color(0xFF808080),    // Dark silver
        secondary = Color(0xFFB0B0B0),      // Platinum
        secondaryLight = Color(0xFFD8D8D8),
        secondaryDark = Color(0xFF707070)
    ),
    crystal = CrystalColorSet(
        primary = Color(0xFF4DA6FF),        // Cool blue
        secondary = Color(0xFF80B3FF),      // Light blue
        warning = Color(0xFFFFCC80),        // Soft amber
        error = Color(0xFFFF6B9D),          // Soft red
        primaryDim = Color(0xFF265380),
        secondaryDim = Color(0xFF405980)
    ),
    accent = AccentColorSet(
        success = Color(0xFF66CDAA),        // Aquamarine
        info = Color(0xFF4682B4),           // Steel blue
        warning = Color(0xFFFFB366),        // Peach
        error = Color(0xFFDC143C)           // Crimson
    )
)

/**
 * Obsidian Tech variant
 */
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
        primary = Color(0xFF4A4A4A),        // Dark gray metal
        primaryLight = Color(0xFF6A6A6A),
        primaryDark = Color(0xFF2A2A2A),
        secondary = Color(0xFF5A5A5A),
        secondaryLight = Color(0xFF7A7A7A),
        secondaryDark = Color(0xFF3A3A3A)
    ),
    crystal = CrystalColorSet(
        primary = Color(0xFF9D4EDD),        // Purple
        secondary = Color(0xFF00D9FF),      // Cyan
        warning = Color(0xFFFFAA00),        // Amber
        error = Color(0xFFFF006E),          // Magenta
        primaryDim = Color(0xFF4E276E),
        secondaryDim = Color(0xFF006C7F)
    ),
    accent = AccentColorSet(
        success = Color(0xFF7B68EE),        // Medium slate blue
        info = Color(0xFF00CED1),           // Dark turquoise
        warning = Color(0xFFFFB347),        // Pastel orange
        error = Color(0xFFFF1493)           // Deep pink
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

// ============================================================================
// THEME COMPOSABLE
// ============================================================================

/**
 * Ancient Architect Theme
 * 
 * @param variant The theme variant to use
 * @param enableGeometricPatterns Enable decorative geometric patterns
 * @param enableMetallicShimmer Enable shimmer animation on metallic elements
 * @param enableCrystalGlow Enable glow effects on crystalline elements
 * @param content The content to theme
 */
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
    
    val cfTheme = when (variant) {
        AncientArchitectVariant.ANCIENT_BRONZE -> CleverFerretTheme.ANCIENT_BRONZE
        AncientArchitectVariant.SILVER_ARCHITECT -> CleverFerretTheme.SILVER_ARCHITECT
        AncientArchitectVariant.OBSIDIAN_TECH -> CleverFerretTheme.OBSIDIAN_TECH
    }

    val materialColorScheme = KthemeBridge.resolveColorScheme(cfTheme, darkTheme = true)
    
    val themeId = variant.name.lowercase().replace('_', '-')
    val kthemeSnapshot = KthemeThemeAdapterV1.KthemeSnapshot(
        id = themeId,
        darkMode = true,
        primary = String.format("#%08X", materialColorScheme.primary.toArgb()),
        onPrimary = String.format("#%08X", materialColorScheme.onPrimary.toArgb()),
        background = String.format("#%08X", materialColorScheme.background.toArgb()),
        onBackground = String.format("#%08X", materialColorScheme.onBackground.toArgb()),
        surface = String.format("#%08X", materialColorScheme.surface.toArgb()),
        onSurface = String.format("#%08X", materialColorScheme.onSurface.toArgb()),
        outline = String.format("#%08X", materialColorScheme.outline.toArgb()),
        error = String.format("#%08X", materialColorScheme.error.toArgb()),
        onError = String.format("#%08X", materialColorScheme.onError.toArgb())
    )
    val semanticTheme = KthemeThemeAdapterV1.adapt(kthemeSnapshot)

    val configuration = androidx.compose.ui.platform.LocalConfiguration.current
    val reduceMotion = remember(configuration) { com.universalmedialibrary.ui.media.theme.MediaMotion.isReducedMotionEnabled() }

    CompositionLocalProvider(
        LocalSemanticTheme provides semanticTheme,
        LocalAncientArchitectColors provides ancientColors,
        LocalEnableGeometricPatterns provides enableGeometricPatterns,
        LocalEnableMetallicShimmer provides enableMetallicShimmer,
        LocalEnableCrystalGlow provides enableCrystalGlow,
        LocalIsAncientArchitect provides true,
        LocalReduceMotion provides reduceMotion
    ) {
        MaterialTheme(
            colorScheme = materialColorScheme,
            typography = AncientArchitectTypography,
        ) {
            CompositionLocalProvider(
                LocalIndication provides rememberFocusHighlightIndication(),
                content = content
            )
        }
    }
}

// ============================================================================
// HELPER EXTENSIONS
// ============================================================================

/**
 * Get the current Ancient Architect color scheme
 */
@Composable
fun ancientArchitectColors(): AncientArchitectColorScheme {
    return LocalAncientArchitectColors.current
}

/**
 * Check if geometric patterns are enabled
 */
@Composable
fun geometricPatternsEnabled(): Boolean {
    return LocalEnableGeometricPatterns.current
}

/**
 * Check if metallic shimmer is enabled
 */
@Composable
fun metallicShimmerEnabled(): Boolean {
    return LocalEnableMetallicShimmer.current
}

/**
 * Check if crystal glow is enabled
 */
@Composable
fun crystalGlowEnabled(): Boolean {
    return LocalEnableCrystalGlow.current
}

// ============================================================================
// CLEVERFERRET THEME
// ============================================================================



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
