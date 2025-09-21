package com.universalmedialibrary.ui.theme

import android.app.Activity
import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat

/**
 * CleverFerret Professional Theme with Deep Navy Blue and Deep Gold Accents
 * 
 * Implements a sophisticated color scheme with:
 * - Deep Navy Blue primary colors for professional appearance
 * - Deep Gold accent colors for premium feel
 * - High contrast for accessibility
 * - Modern Material Design 3 implementation
 */

// CleverFerret Professional Color Palette
private val DeepNavyBlue = Color(0xFF0A1628)           // Primary deep navy
private val NavyBlue = Color(0xFF1E3A5F)               // Lighter navy for containers
private val NavyBlueMedium = Color(0xFF2E4A6F)         // Medium navy for surfaces
private val NavyBlueLight = Color(0xFF3E5A7F)          // Light navy for variants

private val DeepGold = Color(0xFFB8860B)               // Deep gold primary
private val Gold = Color(0xFFDAA520)                   // Standard gold
private val GoldLight = Color(0xFFFFD700)              // Light gold for highlights
private val GoldDark = Color(0xFF996F00)               // Dark gold for containers

// Light Theme Color Scheme (Professional Navy & Gold)
private val CleverFerretLightColorScheme = lightColorScheme(
    primary = NavyBlue,
    onPrimary = Color.White,
    primaryContainer = Color(0xFFE8F1FF),
    onPrimaryContainer = DeepNavyBlue,
    
    secondary = DeepGold,
    onSecondary = Color.White,
    secondaryContainer = Color(0xFFFFF8DC),
    onSecondaryContainer = GoldDark,
    
    tertiary = Color(0xFF6B4226),
    onTertiary = Color.White,
    tertiaryContainer = Color(0xFFF2DCC8),
    onTertiaryContainer = Color(0xFF3D2512),
    
    error = Color(0xFFBA1A1A),
    onError = Color.White,
    errorContainer = Color(0xFFFFDAD6),
    onErrorContainer = Color(0xFF410002),
    
    background = Color(0xFFFCFCFF),
    onBackground = Color(0xFF1A1C1E),
    surface = Color.White,
    onSurface = Color(0xFF1A1C1E),
    surfaceVariant = Color(0xFFE0E2EC),
    onSurfaceVariant = Color(0xFF43474E),
    
    outline = Color(0xFF74777F),
    outlineVariant = Color(0xFFC4C6D0)
)

// Dark Theme Color Scheme (Professional Navy & Gold)
private val CleverFerretDarkColorScheme = darkColorScheme(
    primary = Gold,
    onPrimary = DeepNavyBlue,
    primaryContainer = NavyBlue,
    onPrimaryContainer = GoldLight,
    
    secondary = DeepGold,
    onSecondary = Color.Black,
    secondaryContainer = GoldDark,
    onSecondaryContainer = GoldLight,
    
    tertiary = Color(0xFFD4B896),
    onTertiary = Color(0xFF3D2512),
    tertiaryContainer = Color(0xFF553B26),
    onTertiaryContainer = Color(0xFFF2DCC8),
    
    error = Color(0xFFFFB4AB),
    onError = Color(0xFF690005),
    errorContainer = Color(0xFF93000A),
    onErrorContainer = Color(0xFFFFDAD6),
    
    background = DeepNavyBlue,
    onBackground = Color(0xFFE2E2E9),
    surface = Color(0xFF101418),
    onSurface = Color(0xFFE2E2E9),
    surfaceVariant = NavyBlueMedium,
    onSurfaceVariant = Color(0xFFC4C6D0),
    
    outline = Color(0xFF8E9199),
    outlineVariant = Color(0xFF43474E)
)

/**
 * CleverFerret Professional Theme
 * 
 * Provides a sophisticated theming system with deep navy blue and gold accents
 * for a professional media library application.
 * 
 * Features:
 * - Deep navy blue primary colors for trust and professionalism
 * - Deep gold accents for premium feel and important highlights
 * - High contrast ratios for accessibility
 * - Proper Material Design 3 implementation
 * - Consistent branding across all screens
 */
@Composable
fun CleverFerretTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    dynamicColor: Boolean = false, // Disabled to maintain consistent branding
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }
        darkTheme -> CleverFerretDarkColorScheme
        else -> CleverFerretLightColorScheme
    }
    
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
 * CleverFerret Enhanced Typography
 */
val CleverFerretTypography = Typography(
    displayLarge = Typography().displayLarge.copy(
        fontFamily = androidx.compose.ui.text.font.FontFamily.Default
    ),
    displayMedium = Typography().displayMedium.copy(
        fontFamily = androidx.compose.ui.text.font.FontFamily.Default
    ),
    displaySmall = Typography().displaySmall.copy(
        fontFamily = androidx.compose.ui.text.font.FontFamily.Default
    ),
    headlineLarge = Typography().headlineLarge.copy(
        fontFamily = androidx.compose.ui.text.font.FontFamily.Default
    ),
    headlineMedium = Typography().headlineMedium.copy(
        fontFamily = androidx.compose.ui.text.font.FontFamily.Default
    ),
    headlineSmall = Typography().headlineSmall.copy(
        fontFamily = androidx.compose.ui.text.font.FontFamily.Default
    )
)

/**
 * CleverFerret Professional Colors for specialized elements
 */
object CleverFerretProfessionalColors {
    // Primary palette
    val DeepNavy = DeepNavyBlue
    val Navy = NavyBlue
    val NavyMedium = NavyBlueMedium
    val NavyLight = NavyBlueLight
    
    // Gold palette
    val DeepGold = com.universalmedialibrary.ui.theme.DeepGold
    val Gold = com.universalmedialibrary.ui.theme.Gold
    val GoldLight = com.universalmedialibrary.ui.theme.GoldLight
    val GoldDark = com.universalmedialibrary.ui.theme.GoldDark
    
    // Status colors with navy/gold theme
    val Success = Color(0xFF2E7D0F)
    val Warning = Color(0xFFB8860B)
    val Error = Color(0xFF8B1538)
    val Info = NavyBlue
    
    // Media type colors (navy/gold variations)
    val BookAccent = Color(0xFF2E5984)
    val MusicAccent = Color(0xFF7B6F47)
    val MovieAccent = Color(0xFF8B4513)
    val DocumentAccent = Color(0xFF4A5568)
    val PodcastAccent = DeepGold
    val MagazineAccent = Color(0xFF6B4423)
}