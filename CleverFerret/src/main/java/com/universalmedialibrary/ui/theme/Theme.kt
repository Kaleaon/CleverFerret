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
 * CleverFerret Universal Media Library Theme System
 * 
 * Implements Material Design 3 theming with dynamic color support for Android 12+.
 * Provides a modern, accessible, and visually appealing interface that adapts to
 * user preferences and system settings.
 * 
 * ## Theme Features:
 * - **Material Design 3**: Latest Material Design specifications
 * - **Dynamic Colors**: Adapts to system wallpaper colors on Android 12+
 * - **Dark Mode Support**: Automatic dark/light theme switching
 * - **Accessibility**: High contrast ratios and readable typography
 * - **Brand Colors**: CleverFerret brand integration with Material You
 * 
 * ## Color Psychology:
 * - **Primary**: Deep blue for trust and reliability in media management
 * - **Secondary**: Warm accent colors for engaging media interaction
 * - **Tertiary**: Subtle colors for metadata and supporting information
 * - **Surface**: Adaptive backgrounds for comfortable reading/viewing
 * 
 * @author CleverFerret Development Team
 * @since Version 1.2-enhanced
 */

// CleverFerret Brand Colors
private val CleverFerretBlue = Color(0xFF1976D2)
private val CleverFerretBlueVariant = Color(0xFF1565C0)
private val CleverFerretAccent = Color(0xFF FF6B73)
private val CleverFerretAccentVariant = Color(0xFFFF5722)

// Light Theme Color Scheme
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

// Dark Theme Color Scheme
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
 * CleverFerret app theme with Material Design 3
 * 
 * Provides comprehensive theming for the CleverFerret universal media library
 * application with support for dynamic colors, dark mode, and accessibility.
 * 
 * ## Dynamic Color Support:
 * - Android 12+: Uses system wallpaper-derived colors for personalization
 * - Android 11 and below: Uses CleverFerret brand colors for consistency
 * 
 * ## Accessibility Features:
 * - High contrast color ratios meeting WCAG guidelines
 * - Readable typography with appropriate sizing and spacing
 * - Clear visual hierarchy for media library navigation
 * - Support for system accessibility settings
 * 
 * ## Status Bar Integration:
 * - Automatic status bar color matching for immersive experience
 * - Proper contrast for status bar content visibility
 * - Edge-to-edge design support for modern Android versions
 * 
 * @param darkTheme Whether to use dark theme colors. Defaults to system preference.
 * @param dynamicColor Whether to use dynamic colors on Android 12+. Defaults to true.
 * @param content Composable content to be themed
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
 * CleverFerret-specific color extensions for specialized UI elements
 */
object CleverFerretColors {
    /** Color for book-related UI elements */
    val BookAccent = Color(0xFF4CAF50)
    
    /** Color for music-related UI elements */
    val MusicAccent = Color(0xFF9C27B0)
    
    /** Color for movie/video-related UI elements */ 
    val MovieAccent = Color(0xFFFF5722)
    
    /** Color for document-related UI elements */
    val DocumentAccent = Color(0xFF607D8B)
    
    /** Color for podcast-related UI elements */
    val PodcastAccent = Color(0xFFFFC107)
    
    /** Color for magazine-related UI elements */
    val MagazineAccent = Color(0xFF795548)
    
    /** Color for progress indicators */
    val ProgressComplete = Color(0xFF4CAF50)
    val ProgressInProgress = Color(0xFF2196F3)
    val ProgressNotStarted = Color(0xFF9E9E9E)
    
    /** Color for ratings and favorites */
    val RatingGold = Color(0xFFFFC107)
    val FavoriteRed = Color(0xFFE91E63)
    
    /** Color for status indicators */
    val StatusOnline = Color(0xFF4CAF50)
    val StatusOffline = Color(0xFF9E9E9E)
    val StatusError = Color(0xFFE91E63)
    val StatusWarning = Color(0xFFFF9800)
}

/**
 * Media type specific color helper
 * 
 * Provides consistent color theming across the app for different media types.
 * Helps users quickly identify and categorize their media content.
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