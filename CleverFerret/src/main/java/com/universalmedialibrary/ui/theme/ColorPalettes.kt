package com.universalmedialibrary.ui.theme

import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.ui.graphics.Color

/**
 * Beautiful themeable color palettes with metallic accents
 * Each palette is carefully designed with complementary metallic colors
 */

// Navy + Gold (Default - Elegant and Professional)
object NavyGoldPalette {
    // Navy blues
    val NavyDeep = Color(0xFF0A1630)
    val NavyMedium = Color(0xFF0D1B36)
    val NavyLight = Color(0xFF1B2B4D)
    val NavyAccent = Color(0xFF2A4073)

    // Text colors
    val TextPrimary = Color(0xFFE6EAF2)
    val TextSecondary = Color(0xFFB3BFD6)

    val darkScheme = darkColorScheme(
        primary = MetallicGold.Primary,
        onPrimary = NavyDeep,
        primaryContainer = MetallicGold.Dark,
        onPrimaryContainer = MetallicGold.Highlight,

        secondary = MetallicGold.Burnished,
        onSecondary = NavyDeep,
        secondaryContainer = NavyLight,
        onSecondaryContainer = MetallicGold.Light,

        tertiary = MetallicGold.Rose,
        onTertiary = NavyDeep,
        tertiaryContainer = MetallicGold.Medium,
        onTertiaryContainer = TextPrimary,

        background = NavyDeep,
        onBackground = TextPrimary,

        surface = NavyMedium,
        onSurface = TextPrimary,
        surfaceVariant = NavyLight,
        onSurfaceVariant = TextSecondary,

        surfaceTint = MetallicGold.Primary,

        error = Color(0xFFDC3545),
        onError = Color.White,
        errorContainer = Color(0xFF93000A),
        onErrorContainer = Color(0xFFFFDAD6),

        outline = NavyAccent,
        outlineVariant = Color(0xFF25385F),
    )

    val lightScheme = lightColorScheme(
        primary = MetallicGold.Dark,
        onPrimary = Color.White,
        primaryContainer = MetallicGold.Light,
        onPrimaryContainer = NavyDeep,

        secondary = NavyMedium,
        onSecondary = Color.White,
        secondaryContainer = Color(0xFFD8DFEF),
        onSecondaryContainer = NavyDeep,

        tertiary = MetallicGold.Medium,
        onTertiary = Color.White,

        background = Color(0xFFF7F9FD),
        onBackground = NavyDeep,

        surface = Color.White,
        onSurface = NavyDeep,
        surfaceVariant = Color(0xFFE2E8F4),
        onSurfaceVariant = NavyMedium,

        surfaceTint = MetallicGold.Primary,

        error = Color(0xFFBA1A1A),
        onError = Color.White,
    )
}

// Royal Purple + Silver (Regal and Modern)
object RoyalSilverPalette {
    val PurpleDeep = Color(0xFF1A0F2E)
    val PurpleMedium = Color(0xFF2D1B4E)
    val PurpleLight = Color(0xFF4A2C6D)
    val PurpleAccent = Color(0xFF6B4BA3)

    val TextPrimary = Color(0xFFF0ECF5)
    val TextSecondary = Color(0xFFD1C4E0)

    val darkScheme = darkColorScheme(
        primary = MetallicSilver.Primary,
        onPrimary = PurpleDeep,
        primaryContainer = MetallicSilver.Dark,
        onPrimaryContainer = MetallicSilver.Highlight,

        secondary = PurpleAccent,
        onSecondary = Color.White,
        secondaryContainer = PurpleMedium,
        onSecondaryContainer = MetallicSilver.Light,

        tertiary = MetallicSilver.Platinum,
        onTertiary = PurpleDeep,

        background = PurpleDeep,
        onBackground = TextPrimary,

        surface = PurpleMedium,
        onSurface = TextPrimary,
        surfaceVariant = PurpleLight,
        onSurfaceVariant = TextSecondary,

        surfaceTint = MetallicSilver.Primary,

        outline = PurpleAccent,
    )

    val lightScheme = lightColorScheme(
        primary = PurpleMedium,
        onPrimary = Color.White,
        primaryContainer = Color(0xFFE8DEF8),
        onPrimaryContainer = PurpleDeep,

        secondary = MetallicSilver.Medium,
        onSecondary = Color.White,
        secondaryContainer = Color(0xFFE8E8F0),
        onSecondaryContainer = PurpleDeep,

        tertiary = PurpleAccent,
        onTertiary = Color.White,

        background = Color(0xFFFDF7FF),
        onBackground = PurpleDeep,

        surface = Color.White,
        onSurface = PurpleDeep,
        surfaceVariant = Color(0xFFE8DEF8),
        onSurfaceVariant = PurpleMedium,

        surfaceTint = MetallicSilver.Primary,

        error = Color(0xFFBA1A1A),
        onError = Color.White,
    )
}

// Forest Green + Copper (Natural and Warm)
object ForestCopperPalette {
    val GreenDeep = Color(0xFF0D1F12)
    val GreenMedium = Color(0xFF1A3520)
    val GreenLight = Color(0xFF2C4A33)
    val GreenAccent = Color(0xFF4A7C59)

    val TextPrimary = Color(0xFFE8F5E9)
    val TextSecondary = Color(0xFFC8E6C9)

    val darkScheme = darkColorScheme(
        primary = MetallicCopper.Primary,
        onPrimary = GreenDeep,
        primaryContainer = MetallicCopper.Dark,
        onPrimaryContainer = MetallicCopper.Highlight,

        secondary = MetallicCopper.Burnished,
        onSecondary = GreenDeep,
        secondaryContainer = GreenMedium,
        onSecondaryContainer = MetallicCopper.Light,

        tertiary = MetallicCopper.Rose,
        onTertiary = GreenDeep,

        background = GreenDeep,
        onBackground = TextPrimary,

        surface = GreenMedium,
        onSurface = TextPrimary,
        surfaceVariant = GreenLight,
        onSurfaceVariant = TextSecondary,

        surfaceTint = MetallicCopper.Primary,

        outline = GreenAccent,
    )

    val lightScheme = lightColorScheme(
        primary = GreenAccent,
        onPrimary = Color.White,
        primaryContainer = Color(0xFFD4E7D7),
        onPrimaryContainer = GreenDeep,

        secondary = MetallicCopper.Medium,
        onSecondary = Color.White,
        secondaryContainer = Color(0xFFFFE5D6),
        onSecondaryContainer = GreenDeep,

        tertiary = MetallicCopper.Rose,
        onTertiary = Color.White,

        background = Color(0xFFF5FFF6),
        onBackground = GreenDeep,

        surface = Color.White,
        onSurface = GreenDeep,
        surfaceVariant = Color(0xFFD4E7D7),
        onSurfaceVariant = GreenMedium,

        surfaceTint = MetallicCopper.Primary,

        error = Color(0xFFBA1A1A),
        onError = Color.White,
    )
}

// Burgundy + Rose Gold (Luxurious and Elegant)
object BurgundyRoseGoldPalette {
    val BurgundyDeep = Color(0xFF2B0D1A)
    val BurgundyMedium = Color(0xFF4A1629)
    val BurgundyLight = Color(0xFF6B2240)
    val BurgundyAccent = Color(0xFF8B3A5C)

    val TextPrimary = Color(0xFFFFF0F5)
    val TextSecondary = Color(0xFFFFD6E5)

    val darkScheme = darkColorScheme(
        primary = MetallicRoseGold.Primary,
        onPrimary = BurgundyDeep,
        primaryContainer = MetallicRoseGold.Dark,
        onPrimaryContainer = MetallicRoseGold.Highlight,

        secondary = MetallicRoseGold.Burnished,
        onSecondary = BurgundyDeep,
        secondaryContainer = BurgundyMedium,
        onSecondaryContainer = MetallicRoseGold.Light,

        tertiary = MetallicRoseGold.Light,
        onTertiary = BurgundyDeep,

        background = BurgundyDeep,
        onBackground = TextPrimary,

        surface = BurgundyMedium,
        onSurface = TextPrimary,
        surfaceVariant = BurgundyLight,
        onSurfaceVariant = TextSecondary,

        surfaceTint = MetallicRoseGold.Primary,

        outline = BurgundyAccent,
    )

    val lightScheme = lightColorScheme(
        primary = BurgundyAccent,
        onPrimary = Color.White,
        primaryContainer = Color(0xFFFFD9E4),
        onPrimaryContainer = BurgundyDeep,

        secondary = MetallicRoseGold.Medium,
        onSecondary = Color.White,
        secondaryContainer = Color(0xFFFFE4E8),
        onSecondaryContainer = BurgundyDeep,

        tertiary = MetallicRoseGold.Light,
        onTertiary = BurgundyDeep,

        background = Color(0xFFFFF8FA),
        onBackground = BurgundyDeep,

        surface = Color.White,
        onSurface = BurgundyDeep,
        surfaceVariant = Color(0xFFFFD9E4),
        onSurfaceVariant = BurgundyMedium,

        surfaceTint = MetallicRoseGold.Primary,

        error = Color(0xFFBA1A1A),
        onError = Color.White,
    )
}

// Charcoal + Champagne Gold (Sophisticated and Subtle)
object CharcoalChampagnePalette {
    val CharcoalDeep = Color(0xFF1C1C1E)
    val CharcoalMedium = Color(0xFF2C2C2E)
    val CharcoalLight = Color(0xFF3A3A3C)
    val CharcoalAccent = Color(0xFF48484A)

    val TextPrimary = Color(0xFFF2F2F7)
    val TextSecondary = Color(0xFFE5E5EA)

    val darkScheme = darkColorScheme(
        primary = MetallicChampagne.Primary,
        onPrimary = CharcoalDeep,
        primaryContainer = MetallicChampagne.Dark,
        onPrimaryContainer = CharcoalDeep,

        secondary = MetallicChampagne.Burnished,
        onSecondary = CharcoalDeep,
        secondaryContainer = CharcoalMedium,
        onSecondaryContainer = MetallicChampagne.Light,

        tertiary = MetallicGold.Burnished,
        onTertiary = CharcoalDeep,

        background = CharcoalDeep,
        onBackground = TextPrimary,

        surface = CharcoalMedium,
        onSurface = TextPrimary,
        surfaceVariant = CharcoalLight,
        onSurfaceVariant = TextSecondary,

        surfaceTint = MetallicChampagne.Primary,

        outline = CharcoalAccent,
    )

    val lightScheme = lightColorScheme(
        primary = CharcoalAccent,
        onPrimary = Color.White,
        primaryContainer = Color(0xFFF5F5DC),
        onPrimaryContainer = CharcoalDeep,

        secondary = MetallicChampagne.Medium,
        onSecondary = CharcoalDeep,
        secondaryContainer = Color(0xFFFFF8DC),
        onSecondaryContainer = CharcoalDeep,

        tertiary = MetallicGold.Medium,
        onTertiary = Color.White,

        background = Color(0xFFFAFAFA),
        onBackground = CharcoalDeep,

        surface = Color.White,
        onSurface = CharcoalDeep,
        surfaceVariant = Color(0xFFF5F5F5),
        onSurfaceVariant = CharcoalMedium,

        surfaceTint = MetallicChampagne.Primary,

        error = Color(0xFFBA1A1A),
        onError = Color.White,
    )
}

// Slate + Gunmetal (Modern and Industrial)
object SlateGunmetalPalette {
    val SlateDeep = Color(0xFF0F1419)
    val SlateMedium = Color(0xFF1A232B)
    val SlateLight = Color(0xFF2D3945)
    val SlateAccent = Color(0xFF3E4F5E)

    val TextPrimary = Color(0xFFECF0F5)
    val TextSecondary = Color(0xFFCFD8E0)

    val darkScheme = darkColorScheme(
        primary = MetallicGunmetal.Highlight,
        onPrimary = SlateDeep,
        primaryContainer = MetallicGunmetal.Medium,
        onPrimaryContainer = MetallicGunmetal.Highlight,

        secondary = MetallicSilver.Medium,
        onSecondary = SlateDeep,
        secondaryContainer = SlateMedium,
        onSecondaryContainer = MetallicSilver.Light,

        tertiary = MetallicGunmetal.Burnished,
        onTertiary = Color.White,

        background = SlateDeep,
        onBackground = TextPrimary,

        surface = SlateMedium,
        onSurface = TextPrimary,
        surfaceVariant = SlateLight,
        onSurfaceVariant = TextSecondary,

        surfaceTint = MetallicGunmetal.Highlight,

        outline = SlateAccent,
    )

    val lightScheme = lightColorScheme(
        primary = SlateAccent,
        onPrimary = Color.White,
        primaryContainer = Color(0xFFE3E8EE),
        onPrimaryContainer = SlateDeep,

        secondary = MetallicSilver.Medium,
        onSecondary = Color.White,
        secondaryContainer = Color(0xFFECF0F5),
        onSecondaryContainer = SlateDeep,

        tertiary = MetallicGunmetal.Medium,
        onTertiary = Color.White,

        background = Color(0xFFF8FAFB),
        onBackground = SlateDeep,

        surface = Color.White,
        onSurface = SlateDeep,
        surfaceVariant = Color(0xFFE3E8EE),
        onSurfaceVariant = SlateMedium,

        surfaceTint = MetallicGunmetal.Highlight,

        error = Color(0xFFBA1A1A),
        onError = Color.White,
    )
}

// Theme palette enum for selection
enum class ThemePalette {
    // Unified cross-platform themes
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
    PAPER_INK,
    // Warm Metallic Themes
    COPPER_BRONZE,
    AMBER_GOLD,
    ROSE_BRASS,
    // Cool Metallic Themes
    STEEL_TITANIUM,
    PLATINUM_SILVER,
    COBALT_CHROME,
    // Ancient Architect Themes
    ANCIENT_BRONZE,
    SILVER_ARCHITECT,
    OBSIDIAN_TECH;
    
    // Convert ThemePalette to CleverFerretTheme
    fun toCleverFerretTheme(): com.universalmedialibrary.ui.theme.CleverFerretTheme {
        return when (this) {
            NAVY_GOLD -> com.universalmedialibrary.ui.theme.CleverFerretTheme.NAVY_GOLD
            EMERALD_SILVER -> com.universalmedialibrary.ui.theme.CleverFerretTheme.EMERALD_SILVER
            ROYAL_BRONZE -> com.universalmedialibrary.ui.theme.CleverFerretTheme.ROYAL_BRONZE
            MIDNIGHT_AMBER -> com.universalmedialibrary.ui.theme.CleverFerretTheme.MIDNIGHT_AMBER
            OBSIDIAN_CRIMSON -> com.universalmedialibrary.ui.theme.CleverFerretTheme.OBSIDIAN_CRIMSON
            SLATE_CYAN -> com.universalmedialibrary.ui.theme.CleverFerretTheme.SLATE_CYAN
            ROYAL_SILVER -> com.universalmedialibrary.ui.theme.CleverFerretTheme.ROYAL_SILVER
            FOREST_COPPER -> com.universalmedialibrary.ui.theme.CleverFerretTheme.FOREST_COPPER
            BURGUNDY_ROSE_GOLD -> com.universalmedialibrary.ui.theme.CleverFerretTheme.BURGUNDY_ROSE_GOLD
            CHARCOAL_CHAMPAGNE -> com.universalmedialibrary.ui.theme.CleverFerretTheme.CHARCOAL_CHAMPAGNE
            SLATE_GUNMETAL -> com.universalmedialibrary.ui.theme.CleverFerretTheme.SLATE_GUNMETAL
            DEEP_PURPLE_PLATINUM -> com.universalmedialibrary.ui.theme.CleverFerretTheme.DEEP_PURPLE_PLATINUM
            PAPER_INK -> com.universalmedialibrary.ui.theme.CleverFerretTheme.PAPER_INK
            COPPER_BRONZE -> com.universalmedialibrary.ui.theme.CleverFerretTheme.COPPER_BRONZE
            AMBER_GOLD -> com.universalmedialibrary.ui.theme.CleverFerretTheme.AMBER_GOLD
            ROSE_BRASS -> com.universalmedialibrary.ui.theme.CleverFerretTheme.ROSE_BRASS
            STEEL_TITANIUM -> com.universalmedialibrary.ui.theme.CleverFerretTheme.STEEL_TITANIUM
            PLATINUM_SILVER -> com.universalmedialibrary.ui.theme.CleverFerretTheme.PLATINUM_SILVER
            COBALT_CHROME -> com.universalmedialibrary.ui.theme.CleverFerretTheme.COBALT_CHROME
            ANCIENT_BRONZE -> com.universalmedialibrary.ui.theme.CleverFerretTheme.ANCIENT_BRONZE
            SILVER_ARCHITECT -> com.universalmedialibrary.ui.theme.CleverFerretTheme.SILVER_ARCHITECT
            OBSIDIAN_TECH -> com.universalmedialibrary.ui.theme.CleverFerretTheme.OBSIDIAN_TECH
        }
    }
}
