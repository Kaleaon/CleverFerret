package com.universalmedialibrary.ui.theme

import androidx.compose.material3.darkColorScheme
import androidx.compose.ui.graphics.Color

/**
 * Unified Theme System - 12 Themes Shared Between PWA and Android
 *
 * These themes are designed to match exactly between web and mobile platforms.
 * Color values are synchronized with pwa-demo/src/themes/unified-themes.ts
 */

enum class UnifiedThemePalette {
    // Original 6 themes
    NAVY_GOLD,
    EMERALD_SILVER,
    ROYAL_BRONZE,
    MIDNIGHT_AMBER,
    OBSIDIAN_CRIMSON,
    SLATE_CYAN,
    // New 6 themes (matching Android originals)
    ROYAL_SILVER,
    FOREST_COPPER,
    BURGUNDY_ROSE_GOLD,
    CHARCOAL_CHAMPAGNE,
    SLATE_GUNMETAL,
    DEEP_PURPLE_PLATINUM
}

// Theme 1: Navy & Gold (Classic Plex-inspired)
object NavyGoldUnified {
    private val Gold = Color(0xFFD4AF37)
    private val GoldLight = Color(0xFFE0C25E)
    private val GoldDark = Color(0xFFA6862A)
    private val NavyDeep = Color(0xFF0A1630)
    private val NavyPaper = Color(0xFF0D1B36)
    private val NavyAccent = Color(0xFF0F2346)

    val darkScheme = darkColorScheme(
        primary = Gold,
        onPrimary = NavyDeep,
        primaryContainer = GoldDark,
        onPrimaryContainer = GoldLight,
        secondary = NavyAccent,
        onSecondary = Color(0xFFE6EAF2),
        background = NavyDeep,
        onBackground = Color(0xFFE6EAF2),
        surface = NavyPaper,
        onSurface = Color(0xFFE6EAF2),
        surfaceVariant = Color(0xFF1B2B4D),
        onSurfaceVariant = Color(0xFFB3BFD6)
    )
}

// Theme 2: Emerald & Silver (Nature-inspired)
object EmeraldSilverUnified {
    private val Silver = Color(0xFFC0C0C0)
    private val SilverLight = Color(0xFFD4D4D4)
    private val SilverDark = Color(0xFFA0A0A0)
    private val EmeraldDeep = Color(0xFF0A1F14)
    private val EmeraldPaper = Color(0xFF0D2618)

    val darkScheme = darkColorScheme(
        primary = Silver,
        onPrimary = EmeraldDeep,
        primaryContainer = SilverDark,
        onPrimaryContainer = SilverLight,
        secondary = Color(0xFF0D2818),
        onSecondary = Color(0xFFE8F5ED),
        background = EmeraldDeep,
        onBackground = Color(0xFFE8F5ED),
        surface = EmeraldPaper,
        onSurface = Color(0xFFE8F5ED),
        surfaceVariant = Color(0xFF1A3D28),
        onSurfaceVariant = Color(0xFFB3D9C3)
    )
}

// Theme 3: Royal & Bronze (Regal)
object RoyalBronzeUnified {
    private val Bronze = Color(0xFFCD7F32)
    private val BronzeLight = Color(0xFFD99952)
    private val BronzeDark = Color(0xFFA86428)
    private val PurpleDeep = Color(0xFF1A0A30)
    private val PurplePaper = Color(0xFF220D40)

    val darkScheme = darkColorScheme(
        primary = Bronze,
        onPrimary = PurpleDeep,
        primaryContainer = BronzeDark,
        onPrimaryContainer = BronzeLight,
        secondary = Color(0xFF2D1550),
        onSecondary = Color(0xFFF0E6FF),
        background = PurpleDeep,
        onBackground = Color(0xFFF0E6FF),
        surface = PurplePaper,
        onSurface = Color(0xFFF0E6FF),
        surfaceVariant = Color(0xFF3D1F5C),
        onSurfaceVariant = Color(0xFFD0B3E6)
    )
}

// Theme 4: Midnight & Amber (Sophisticated night)
object MidnightAmberUnified {
    private val Amber = Color(0xFFFFBF00)
    private val AmberLight = Color(0xFFFFD14D)
    private val AmberDark = Color(0xFFCC9900)
    private val MidnightDeep = Color(0xFF0C1824)
    private val MidnightPaper = Color(0xFF15202E)

    val darkScheme = darkColorScheme(
        primary = Amber,
        onPrimary = MidnightDeep,
        primaryContainer = AmberDark,
        onPrimaryContainer = AmberLight,
        secondary = Color(0xFF1A2332),
        onSecondary = Color(0xFFE8EEF5),
        background = MidnightDeep,
        onBackground = Color(0xFFE8EEF5),
        surface = MidnightPaper,
        onSurface = Color(0xFFE8EEF5),
        surfaceVariant = Color(0xFF253447),
        onSurfaceVariant = Color(0xFFB8C5D6)
    )
}

// Theme 5: Obsidian & Crimson (Bold dramatic)
object ObsidianCrimsonUnified {
    private val Crimson = Color(0xFFDC143C)
    private val CrimsonLight = Color(0xFFE5395F)
    private val CrimsonDark = Color(0xFFB00F30)
    private val ObsidianDeep = Color(0xFF0A0A0A)
    private val ObsidianPaper = Color(0xFF141414)

    val darkScheme = darkColorScheme(
        primary = Crimson,
        onPrimary = ObsidianDeep,
        primaryContainer = CrimsonDark,
        onPrimaryContainer = CrimsonLight,
        secondary = Color(0xFF262626),
        onSecondary = Color(0xFFF5F5F5),
        background = ObsidianDeep,
        onBackground = Color(0xFFF5F5F5),
        surface = ObsidianPaper,
        onSurface = Color(0xFFF5F5F5),
        surfaceVariant = Color(0xFF2D2D2D),
        onSurfaceVariant = Color(0xFFD0D0D0)
    )
}

// Theme 6: Slate & Cyan (Cool modern)
object SlateCyanUnified {
    private val Cyan = Color(0xFF00D9FF)
    private val CyanLight = Color(0xFF4DE2FF)
    private val CyanDark = Color(0xFF00A8CC)
    private val SlateDeep = Color(0xFF1A1F24)
    private val SlatePaper = Color(0xFF232930)

    val darkScheme = darkColorScheme(
        primary = Cyan,
        onPrimary = SlateDeep,
        primaryContainer = CyanDark,
        onPrimaryContainer = CyanLight,
        secondary = Color(0xFF2A333D),
        onSecondary = Color(0xFFE8F0F5),
        background = SlateDeep,
        onBackground = Color(0xFFE8F0F5),
        surface = SlatePaper,
        onSurface = Color(0xFFE8F0F5),
        surfaceVariant = Color(0xFF3D4854),
        onSurfaceVariant = Color(0xFFB8CAD6)
    )
}

// Theme 7: Royal Silver (Matching original Android)
object RoyalSilverUnified {
    private val Silver = Color(0xFFC0C0C0)
    private val SilverLight = Color(0xFFE0E0E0)
    private val SilverDark = Color(0xFF9A9A9A)
    private val RoyalDeep = Color(0xFF1A1535)
    private val RoyalPaper = Color(0xFF211A40)

    val darkScheme = darkColorScheme(
        primary = Silver,
        onPrimary = RoyalDeep,
        primaryContainer = SilverDark,
        onPrimaryContainer = SilverLight,
        secondary = Color(0xFF2A1F50),
        onSecondary = Color(0xFFF0EBFF),
        background = RoyalDeep,
        onBackground = Color(0xFFF0EBFF),
        surface = RoyalPaper,
        onSurface = Color(0xFFF0EBFF),
        surfaceVariant = Color(0xFF3D2F5C),
        onSurfaceVariant = Color(0xFFC8BFE6)
    )
}

// Theme 8: Forest Copper
object ForestCopperUnified {
    private val Copper = Color(0xFFB87333)
    private val CopperLight = Color(0xFFD4965A)
    private val CopperDark = Color(0xFF935E29)
    private val ForestDeep = Color(0xFF0D1F0D)
    private val ForestPaper = Color(0xFF152915)

    val darkScheme = darkColorScheme(
        primary = Copper,
        onPrimary = ForestDeep,
        primaryContainer = CopperDark,
        onPrimaryContainer = CopperLight,
        secondary = Color(0xFF1A3D1A),
        onSecondary = Color(0xFFE8F5E8),
        background = ForestDeep,
        onBackground = Color(0xFFE8F5E8),
        surface = ForestPaper,
        onSurface = Color(0xFFE8F5E8),
        surfaceVariant = Color(0xFF2A4D2A),
        onSurfaceVariant = Color(0xFFB8D9B8)
    )
}

// Theme 9: Burgundy & Rose Gold
object BurgundyRoseGoldUnified {
    private val RoseGold = Color(0xFFB76E79)
    private val RoseGoldLight = Color(0xFFD4969E)
    private val RoseGoldDark = Color(0xFF93575F)
    private val BurgundyDeep = Color(0xFF2D0F1A)
    private val BurgundyPaper = Color(0xFF3D1525)

    val darkScheme = darkColorScheme(
        primary = RoseGold,
        onPrimary = BurgundyDeep,
        primaryContainer = RoseGoldDark,
        onPrimaryContainer = RoseGoldLight,
        secondary = Color(0xFF4D1A2A),
        onSecondary = Color(0xFFFFE6ED),
        background = BurgundyDeep,
        onBackground = Color(0xFFFFE6ED),
        surface = BurgundyPaper,
        onSurface = Color(0xFFFFE6ED),
        surfaceVariant = Color(0xFF5C2A3D),
        onSurfaceVariant = Color(0xFFE6C0CC)
    )
}

// Theme 10: Charcoal Champagne
object CharcoalChampagneUnified {
    private val Champagne = Color(0xFFF7E7CE)
    private val ChampagneLight = Color(0xFFFFF5E6)
    private val ChampagneDark = Color(0xFFC5B8A5)
    private val CharcoalDeep = Color(0xFF1F1F1F)
    private val CharcoalPaper = Color(0xFF2A2A2A)

    val darkScheme = darkColorScheme(
        primary = Champagne,
        onPrimary = CharcoalDeep,
        primaryContainer = ChampagneDark,
        onPrimaryContainer = ChampagneLight,
        secondary = Color(0xFF3D3D3D),
        onSecondary = Color(0xFFF5F5F5),
        background = CharcoalDeep,
        onBackground = Color(0xFFF5F5F5),
        surface = CharcoalPaper,
        onSurface = Color(0xFFF5F5F5),
        surfaceVariant = Color(0xFF3D3D3D),
        onSurfaceVariant = Color(0xFFD0D0D0)
    )
}

// Theme 11: Slate Gunmetal
object SlateGunmetalUnified {
    private val Gunmetal = Color(0xFF8F9CA8)
    private val GunmetalLight = Color(0xFFB0BDC9)
    private val GunmetalDark = Color(0xFF6F7D87)
    private val SlateDeep = Color(0xFF1A2029)
    private val SlatePaper = Color(0xFF232C38)

    val darkScheme = darkColorScheme(
        primary = Gunmetal,
        onPrimary = SlateDeep,
        primaryContainer = GunmetalDark,
        onPrimaryContainer = GunmetalLight,
        secondary = Color(0xFF2D3844),
        onSecondary = Color(0xFFE6ECF2),
        background = SlateDeep,
        onBackground = Color(0xFFE6ECF2),
        surface = SlatePaper,
        onSurface = Color(0xFFE6ECF2),
        surfaceVariant = Color(0xFF3D4854),
        onSurfaceVariant = Color(0xFFB8C5D6)
    )
}

// Theme 12: Deep Purple & Platinum (NEW)
object DeepPurplePlatinumUnified {
    private val Platinum = Color(0xFFE5E4E2)
    private val PlatinumLight = Color(0xFFF5F4F2)
    private val PlatinumDark = Color(0xFFB8B7B5)
    private val PurpleDeep = Color(0xFF1A0F2E)
    private val PurplePaper = Color(0xFF24153D)

    val darkScheme = darkColorScheme(
        primary = Platinum,
        onPrimary = PurpleDeep,
        primaryContainer = PlatinumDark,
        onPrimaryContainer = PlatinumLight,
        secondary = Color(0xFF2E1A50),
        onSecondary = Color(0xFFF0EBFF),
        background = PurpleDeep,
        onBackground = Color(0xFFF0EBFF),
        surface = PurplePaper,
        onSurface = Color(0xFFF0EBFF),
        surfaceVariant = Color(0xFF3D2A5C),
        onSurfaceVariant = Color(0xFFD0C0E6)
    )
}

// Metallic effects for each theme
object UnifiedMetallicEffects {
    val Gold = listOf(Color(0xFFD4AF37), Color(0xFFFFD700), Color(0xFFFFC107))
    val Silver = listOf(Color(0xFFC0C0C0), Color(0xFFE0E0E0), Color(0xFFBDBDBD))
    val Bronze = listOf(Color(0xFFCD7F32), Color(0xFFB87333), Color(0xFFA0522D))
    val Amber = listOf(Color(0xFFFFBF00), Color(0xFFFFAA00), Color(0xFFFF9500))
    val Crimson = listOf(Color(0xFFDC143C), Color(0xFFC71585), Color(0xFFFF1493))
    val Cyan = listOf(Color(0xFF00D9FF), Color(0xFF00BCD4), Color(0xFF0097A7))
    val Copper = listOf(Color(0xFFB87333), Color(0xFFCD853F), Color(0xFFD2691E))
    val RoseGold = listOf(Color(0xFFB76E79), Color(0xFFC9949C), Color(0xFFE8B4BF))
    val Champagne = listOf(Color(0xFFF7E7CE), Color(0xFFEDD5B7), Color(0xFFE3C39D))
    val Gunmetal = listOf(Color(0xFF8F9CA8), Color(0xFF78909C), Color(0xFF607D8B))
    val Platinum = listOf(Color(0xFFE5E4E2), Color(0xFFF5F5F5), Color(0xFFEEEEEE))
}

// Helper function to get metallic effect by theme
fun getMetallicEffectForTheme(palette: UnifiedThemePalette): List<Color> {
    return when (palette) {
        UnifiedThemePalette.NAVY_GOLD -> UnifiedMetallicEffects.Gold
        UnifiedThemePalette.EMERALD_SILVER -> UnifiedMetallicEffects.Silver
        UnifiedThemePalette.ROYAL_BRONZE -> UnifiedMetallicEffects.Bronze
        UnifiedThemePalette.MIDNIGHT_AMBER -> UnifiedMetallicEffects.Amber
        UnifiedThemePalette.OBSIDIAN_CRIMSON -> UnifiedMetallicEffects.Crimson
        UnifiedThemePalette.SLATE_CYAN -> UnifiedMetallicEffects.Cyan
        UnifiedThemePalette.ROYAL_SILVER -> UnifiedMetallicEffects.Silver
        UnifiedThemePalette.FOREST_COPPER -> UnifiedMetallicEffects.Copper
        UnifiedThemePalette.BURGUNDY_ROSE_GOLD -> UnifiedMetallicEffects.RoseGold
        UnifiedThemePalette.CHARCOAL_CHAMPAGNE -> UnifiedMetallicEffects.Champagne
        UnifiedThemePalette.SLATE_GUNMETAL -> UnifiedMetallicEffects.Gunmetal
        UnifiedThemePalette.DEEP_PURPLE_PLATINUM -> UnifiedMetallicEffects.Platinum
    }
}
