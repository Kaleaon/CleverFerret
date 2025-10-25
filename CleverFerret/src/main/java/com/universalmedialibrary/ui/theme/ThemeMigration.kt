package com.universalmedialibrary.ui.theme

/**
 * Theme Migration Helper
 * 
 * Helps migrate from old theme systems to the new unified system
 */

/**
 * Migrate from old ThemePalette to new CleverFerretTheme
 */
fun ThemePalette.toCleverFerretTheme(): CleverFerretTheme {
    return when (this) {
        ThemePalette.NAVY_GOLD -> CleverFerretTheme.NAVY_GOLD
        ThemePalette.ROYAL_SILVER -> CleverFerretTheme.ROYAL_SILVER
        ThemePalette.FOREST_COPPER -> CleverFerretTheme.FOREST_COPPER
        ThemePalette.BURGUNDY_ROSE_GOLD -> CleverFerretTheme.BURGUNDY_ROSE_GOLD
        ThemePalette.CHARCOAL_CHAMPAGNE -> CleverFerretTheme.CHARCOAL_CHAMPAGNE
        ThemePalette.SLATE_GUNMETAL -> CleverFerretTheme.SLATE_GUNMETAL
    }
}

/**
 * Migrate from old UnifiedThemePalette to new CleverFerretTheme
 */
fun UnifiedThemePalette.toCleverFerretTheme(): CleverFerretTheme {
    return when (this) {
        UnifiedThemePalette.NAVY_GOLD -> CleverFerretTheme.NAVY_GOLD
        UnifiedThemePalette.EMERALD_SILVER -> CleverFerretTheme.EMERALD_SILVER
        UnifiedThemePalette.ROYAL_BRONZE -> CleverFerretTheme.ROYAL_BRONZE
        UnifiedThemePalette.MIDNIGHT_AMBER -> CleverFerretTheme.MIDNIGHT_AMBER
        UnifiedThemePalette.OBSIDIAN_CRIMSON -> CleverFerretTheme.OBSIDIAN_CRIMSON
        UnifiedThemePalette.SLATE_CYAN -> CleverFerretTheme.SLATE_CYAN
        UnifiedThemePalette.ROYAL_SILVER -> CleverFerretTheme.ROYAL_SILVER
        UnifiedThemePalette.FOREST_COPPER -> CleverFerretTheme.FOREST_COPPER
        UnifiedThemePalette.BURGUNDY_ROSE_GOLD -> CleverFerretTheme.BURGUNDY_ROSE_GOLD
        UnifiedThemePalette.CHARCOAL_CHAMPAGNE -> CleverFerretTheme.CHARCOAL_CHAMPAGNE
        UnifiedThemePalette.SLATE_GUNMETAL -> CleverFerretTheme.SLATE_GUNMETAL
        UnifiedThemePalette.DEEP_PURPLE_PLATINUM -> CleverFerretTheme.DEEP_PURPLE_PLATINUM
    }
}

/**
 * Migrate from AncientArchitectVariant to CleverFerretTheme
 */
fun AncientArchitectVariant.toCleverFerretTheme(): CleverFerretTheme {
    return when (this) {
        AncientArchitectVariant.ANCIENT_BRONZE -> CleverFerretTheme.ANCIENT_BRONZE
        AncientArchitectVariant.SILVER_ARCHITECT -> CleverFerretTheme.SILVER_ARCHITECT
        AncientArchitectVariant.OBSIDIAN_TECH -> CleverFerretTheme.OBSIDIAN_TECH
    }
}

/**
 * Get all available themes as a list
 */
fun getAllThemes(): List<CleverFerretTheme> {
    return CleverFerretTheme.entries
}

/**
 * Get themes by category
 */
fun getThemesByCategory(category: ThemeCategory): List<CleverFerretTheme> {
    return CleverFerretTheme.entries.filter { it.getConfig().category == category }
}

/**
 * Get default theme
 */
fun getDefaultTheme(): CleverFerretTheme {
    return CleverFerretTheme.NAVY_GOLD
}

/**
 * Theme preference key for SharedPreferences
 */
const val THEME_PREFERENCE_KEY = "cleverferret_theme_v2"

/**
 * Save theme preference (returns index for storage)
 */
fun CleverFerretTheme.toPreferenceValue(): Int {
    return this.toIndex()
}

/**
 * Load theme preference (from index)
 */
fun Int.toThemeFromPreference(): CleverFerretTheme {
    return this.toCleverFerretTheme()
}
