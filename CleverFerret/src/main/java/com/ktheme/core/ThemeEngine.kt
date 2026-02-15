package com.ktheme.core

import com.ktheme.models.Theme

/**
 * Ktheme Engine - lightweight local copy used by CleverFerret.
 */
class ThemeEngine {
    private val themes = mutableMapOf<String, Theme>()
    private var activeTheme: Theme? = null

    fun registerTheme(theme: Theme) {
        themes[theme.metadata.id] = theme
    }

    fun getTheme(id: String): Theme? = themes[id]

    fun getAllThemes(): List<Theme> = themes.values.toList()

    fun setActiveTheme(id: String) {
        activeTheme = themes[id] ?: throw IllegalArgumentException("Theme not found: $id")
    }

    fun getActiveTheme(): Theme? = activeTheme
}
