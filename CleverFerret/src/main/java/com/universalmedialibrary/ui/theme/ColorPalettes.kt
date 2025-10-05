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
}

// Theme palette enum for selection
enum class ThemePalette {
    NAVY_GOLD,
    ROYAL_SILVER,
    FOREST_COPPER,
    BURGUNDY_ROSE_GOLD,
    CHARCOAL_CHAMPAGNE,
    SLATE_GUNMETAL
}