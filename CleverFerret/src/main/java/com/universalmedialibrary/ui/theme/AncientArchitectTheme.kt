package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.ui.graphics.Color

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
    
    // Convert to Material 3 ColorScheme
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
        LocalEnableCrystalGlow provides enableCrystalGlow
    ) {
        MaterialTheme(
            colorScheme = materialColorScheme,
            typography = AncientArchitectTypography,
            content = content
        )
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