package com.universalmedialibrary.ui.theme

import android.app.Activity
import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.dynamicDarkColorScheme
import androidx.compose.material3.dynamicLightColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat

/**
 * Defines the brand colors for the CleverFerret application.
 */
private val CleverFerretBlue = Color(0xFF1976D2)
private val CleverFerretBlueVariant = Color(0xFF1565C0)
private val CleverFerretAccent = Color(0xFFFF6B73)
private val CleverFerretAccentVariant = Color(0xFFFF5722)

/**
 * The light color scheme for the CleverFerret theme.
 */
private val LightColorScheme = lightColorScheme(
    primary = CleverFerretBlue,
    onPrimary = Color.White,
    primaryContainer = Color(0xFFE3F2FD),
    onPrimaryContainer = Color(0xFF0D47A1),

    secondary = CleverFerretAccent,
    onSecondary = Color.White,
    secondaryContainer = Color(0xFFFFEBEE),
    onSecondaryContainer = Color(0xFFB71C1C),

    tertiary = Color(0xFF6A1B9A),
    onTertiary = Color.White,
    tertiaryContainer = Color(0xFFF3E5F5),
    onTertiaryContainer = Color(0xFF4A148C),

    error = Color(0xFFD32F2F),
    onError = Color.White,
    errorContainer = Color(0xFFFFCDD2),
    onErrorContainer = Color(0xFFB71C1C),

    background = Color(0xFFFAFAFA),
    onBackground = Color(0xFF1C1B1F),
    surface = Color.White,
    onSurface = Color(0xFF1C1B1F),
    surfaceVariant = Color(0xFFF5F5F5),
    onSurfaceVariant = Color(0xFF757575),

    outline = Color(0xFF79747E),
    outlineVariant = Color(0xFFCAC4D0)
)

/**
 * The dark color scheme for the CleverFerret theme.
 */
private val DarkColorScheme = darkColorScheme(
    primary = Color(0xFF90CAF9),
    onPrimary = Color(0xFF0D47A1),
    primaryContainer = Color(0xFF1565C0),
    onPrimaryContainer = Color(0xFFE3F2FD),

    secondary = Color(0xFFFFAB91),
    onSecondary = Color(0xFFD84315),
    secondaryContainer = Color(0xFFFF5722),
    onSecondaryContainer = Color(0xFFFFE0B2),

    tertiary = Color(0xFFCE93D8),
    onTertiary = Color(0xFF4A148C),
    tertiaryContainer = Color(0xFF7B1FA2),
    onTertiaryContainer = Color(0xFFF8BBD9),

    error = Color(0xFFEF5350),
    onError = Color(0xFFFFFFFF),
    errorContainer = Color(0xFFD32F2F),
    onErrorContainer = Color(0xFFFFCDD2),

    background = Color(0xFF121212),
    onBackground = Color(0xFFE0E0E0),
    surface = Color(0xFF1E1E1E),
    onSurface = Color(0xFFE0E0E0),
    surfaceVariant = Color(0xFF2C2C2C),
    onSurfaceVariant = Color(0xFFBDBDBD),

    outline = Color(0xFF938F99),
    outlineVariant = Color(0xFF49454F)
)

/**
 * The main theme for the CleverFerret application, based on Material Design 3.
 *
 * This composable function applies the appropriate color scheme (light/dark, dynamic/static)
 * and typography to the entire app content. It also handles system UI theming, such as
 * the status bar color.
 *
 * @param darkTheme Whether the dark theme should be used. Defaults to the system setting.
 * @param dynamicColor Whether to use dynamic colors on Android 12+ devices. Defaults to true.
 * @param content The composable content to which the theme will be applied.
 */
@Composable
fun PlexTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    // Dynamic color is available on Android 12+
    dynamicColor: Boolean = true,
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        // Use dynamic colors on Android 12+ if enabled
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }
        // Use CleverFerret brand colors for older Android versions
        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }

    // Update system UI colors
    val view = LocalView.current
    if (!view.isInEditMode) {
        SideEffect {
            val window = (view.context as Activity).window
            window.statusBarColor = colorScheme.primary.toArgb()
            WindowCompat.getInsetsController(window, view).isAppearanceLightStatusBars = !darkTheme
        }
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = CleverFerretTypography,
        content = content
    )
}

/**
 * An object containing custom, non-Material theme colors used for specific UI elements
 * throughout the CleverFerret application.
 */
object CleverFerretColors {
    /** Color for book-related UI elements. */
    val BookAccent = Color(0xFF4CAF50)

    /** Color for music-related UI elements. */
    val MusicAccent = Color(0xFF9C27B0)

    /** Color for movie/video-related UI elements. */
    val MovieAccent = Color(0xFFFF5722)

    /** Color for document-related UI elements. */
    val DocumentAccent = Color(0xFF607D8B)

    /** Color for podcast-related UI elements. */
    val PodcastAccent = Color(0xFFFFC107)

    /** Color for magazine-related UI elements. */
    val MagazineAccent = Color(0xFF795548)

    /** Color for completed progress indicators. */
    val ProgressComplete = Color(0xFF4CAF50)
    /** Color for in-progress indicators. */
    val ProgressInProgress = Color(0xFF2196F3)
    /** Color for items that have not been started. */
    val ProgressNotStarted = Color(0xFF9E9E9E)

    /** Color used for star ratings. */
    val RatingGold = Color(0xFFFFC107)
    /** Color used for favorite icons. */
    val FavoriteRed = Color(0xFFE91E63)

    /** Color for online status indicators. */
    val StatusOnline = Color(0xFF4CAF50)
    /** Color for offline status indicators. */
    val StatusOffline = Color(0xFF9E9E9E)
    /** Color for error status indicators. */
    val StatusError = Color(0xFFE91E63)
    /** Color for warning status indicators. */
    val StatusWarning = Color(0xFFFF9800)
}

/**
 * A composable helper function that returns a specific color based on the media type.
 * This ensures consistent color-coding for different media across the app.
 *
 * @param mediaType The type of media.
 * @return The corresponding accent [Color].
 */
@Composable
fun getMediaTypeColor(mediaType: com.universalmedialibrary.data.MediaType): Color {
    return when (mediaType) {
        com.universalmedialibrary.data.MediaType.BOOK -> CleverFerretColors.BookAccent
        com.universalmedialibrary.data.MediaType.MUSIC -> CleverFerretColors.MusicAccent
        com.universalmedialibrary.data.MediaType.MOVIE -> CleverFerretColors.MovieAccent
        com.universalmedialibrary.data.MediaType.DOCUMENT -> CleverFerretColors.DocumentAccent
        com.universalmedialibrary.data.MediaType.PODCAST -> CleverFerretColors.PodcastAccent
        com.universalmedialibrary.data.MediaType.MAGAZINE -> CleverFerretColors.MagazineAccent
        else -> MaterialTheme.colorScheme.primary
    }
}