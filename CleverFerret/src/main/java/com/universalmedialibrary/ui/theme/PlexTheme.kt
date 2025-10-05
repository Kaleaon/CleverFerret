package com.universalmedialibrary.ui.theme

import androidx.compose.runtime.Composable

/**
 * Legacy PlexTheme - now redirects to CleverFerretTheme
 * Kept for backward compatibility with existing code
 * 
 * @deprecated Use CleverFerretTheme instead for more theme options
 */
@Deprecated(
    message = "Use CleverFerretTheme instead",
    replaceWith = ReplaceWith(
        "CleverFerretTheme(palette = ThemePalette.NAVY_GOLD, darkTheme = darkTheme, dynamicColor = dynamicColor, content = content)",
        "com.universalmedialibrary.ui.theme.CleverFerretTheme",
        "com.universalmedialibrary.ui.theme.ThemePalette"
    )
)
@Composable
fun PlexTheme(
    darkTheme: Boolean = true,
    dynamicColor: Boolean = false,
    content: @Composable () -> Unit
) {
    // Redirect to new theme system
    CleverFerretTheme(
        palette = ThemePalette.NAVY_GOLD,
        darkTheme = darkTheme,
        dynamicColor = dynamicColor,
        content = content
    )
}
