package com.universalmedialibrary.ui.media.theme

import androidx.compose.animation.core.*
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.R

/**
 * CleverFerret Media-Centric Design System
 * 
 * A sophisticated, media-centric design system inspired by premium media apps's dark,
 * elegant aesthetic with rich accent colors and cinematic feel.
 */

// =============================================================================
// COLOR PALETTE
// =============================================================================

/**
 * Core media-centric color palette
 * Dark backgrounds with warm gold/orange accents for a premium feel
 */
object MediaColors {
    // Primary Background Layers (darkest to lightest)
    val Background = Color(0xFF1F1F1F)           // Main background
    val BackgroundElevated = Color(0xFF282828)   // Cards, dialogs
    val BackgroundSurface = Color(0xFF323232)    // Elevated surfaces
    val BackgroundHover = Color(0xFF3D3D3D)      // Interactive hover states
    val BackgroundPressed = Color(0xFF484848)    // Pressed states
    
    // Accent Colors - Plex Gold/Orange Theme
    val AccentPrimary = Color(0xFFE5A00D)        // Primary gold accent
    val AccentSecondary = Color(0xFFF5B82E)      // Secondary lighter gold
    val AccentTertiary = Color(0xFFCC8A00)       // Darker gold
    val AccentGlow = Color(0xFFFFD54F)           // Highlight/glow effects
    
    // Alternative Accent Themes
    object Themes {
        val MediaGold = AccentPrimary
        val FerretOrange = Color(0xFFFF6D00)
        val NetflixRed = Color(0xFFE50914)
        val SpotifyGreen = Color(0xFF1DB954)
        val PrimeBlue = Color(0xFF00A8E1)
        val DisneyBlue = Color(0xFF113CCF)
        val HBOPurple = Color(0xFF8800CC)
        val AppleWhite = Color(0xFFF5F5F7)
    }
    
    // Text Colors
    val TextPrimary = Color(0xFFFFFFFF)          // Primary text
    val TextSecondary = Color(0xFFB3B3B3)        // Secondary/subtitle text
    val TextTertiary = Color(0xFF808080)         // Muted text
    val TextDisabled = Color(0xFF5A5A5A)         // Disabled text
    val TextOnAccent = Color(0xFF000000)         // Text on accent backgrounds
    
    // Media Type Colors (for categorization)
    object MediaTypes {
        val Book = Color(0xFF4CAF50)              // Green for books
        val Audiobook = Color(0xFF00BCD4)         // Cyan for audiobooks
        val Comic = Color(0xFFFFEB3B)             // Yellow for comics
        val Music = Color(0xFF9C27B0)             // Purple for music
        val Podcast = Color(0xFFFF5722)           // Deep orange for podcasts
        val Movie = Color(0xFF2196F3)             // Blue for movies
        val TvShow = Color(0xFFFF9800)            // Orange for TV shows
        val Radio = Color(0xFF00BCD4)             // Cyan for radio
        val Document = Color(0xFF607D8B)          // Blue-gray for documents
        val Fanfiction = Color(0xFFE91E63)        // Pink for fanfiction
        val News = Color(0xFFFFC107)              // Amber for news
    }
    
    // Status Colors
    val Success = Color(0xFF4CAF50)
    val Warning = Color(0xFFFFC107)
    val Error = Color(0xFFF44336)
    val Info = Color(0xFF2196F3)
    
    // Progress Colors
    val ProgressBackground = Color(0xFF3D3D3D)
    val ProgressForeground = AccentPrimary
    val ProgressUnwatched = Color(0xFF666666)
    
    // Border & Divider Colors
    val Border = Color(0xFF404040)
    val BorderFocused = AccentPrimary
    val Divider = Color(0xFF333333)
    
    // Gradient Backgrounds
    object Gradients {
        val backgroundFade = Brush.verticalGradient(
            colors = listOf(
                Color.Transparent,
                Background.copy(alpha = 0.7f),
                Background
            )
        )
        
        val cardHover = Brush.verticalGradient(
            colors = listOf(
                Color.Transparent,
                AccentPrimary.copy(alpha = 0.1f)
            )
        )
        
        val heroOverlay = Brush.verticalGradient(
            colors = listOf(
                Color.Transparent,
                Background.copy(alpha = 0.3f),
                Background.copy(alpha = 0.8f),
                Background
            ),
            startY = 0f,
            endY = Float.POSITIVE_INFINITY
        )
        
        val shimmer = Brush.horizontalGradient(
            colors = listOf(
                BackgroundElevated,
                BackgroundSurface,
                BackgroundElevated
            )
        )
    }
}

// =============================================================================
// TYPOGRAPHY
// =============================================================================

/**
 * media-centric typography system
 * Clean, readable fonts optimized for media titles and descriptions
 */
object MediaTypography {
    
    // Font sizes following Plex's scale
    object Sizes {
        val Hero = 48.sp
        val Title = 32.sp
        val Headline = 24.sp
        val Subheadline = 20.sp
        val Body = 16.sp
        val BodySmall = 14.sp
        val Caption = 12.sp
        val Label = 11.sp
        val Micro = 10.sp
    }
    
    // Line heights
    object LineHeights {
        val Tight = 1.1f
        val Normal = 1.4f
        val Relaxed = 1.6f
    }
    
    // Font weights
    object Weights {
        val Thin = FontWeight.W200
        val Light = FontWeight.W300
        val Regular = FontWeight.W400
        val Medium = FontWeight.W500
        val SemiBold = FontWeight.W600
        val Bold = FontWeight.W700
        val Black = FontWeight.W900
    }
    
    // Text styles
    val Hero = TextStyle(
        fontSize = Sizes.Hero,
        fontWeight = Weights.Bold,
        lineHeight = 56.sp,
        letterSpacing = (-1).sp
    )
    
    val TitleLarge = TextStyle(
        fontSize = Sizes.Title,
        fontWeight = Weights.Bold,
        lineHeight = 40.sp,
        letterSpacing = (-0.5).sp
    )
    
    val TitleMedium = TextStyle(
        fontSize = Sizes.Headline,
        fontWeight = Weights.SemiBold,
        lineHeight = 32.sp,
        letterSpacing = 0.sp
    )
    
    val TitleSmall = TextStyle(
        fontSize = Sizes.Subheadline,
        fontWeight = Weights.Medium,
        lineHeight = 28.sp,
        letterSpacing = 0.sp
    )
    
    val BodyLarge = TextStyle(
        fontSize = Sizes.Body,
        fontWeight = Weights.Regular,
        lineHeight = 24.sp,
        letterSpacing = 0.sp
    )
    
    val BodyMedium = TextStyle(
        fontSize = Sizes.BodySmall,
        fontWeight = Weights.Regular,
        lineHeight = 20.sp,
        letterSpacing = 0.sp
    )
    
    val BodySmall = TextStyle(
        fontSize = Sizes.Caption,
        fontWeight = Weights.Regular,
        lineHeight = 16.sp,
        letterSpacing = 0.sp
    )
    
    val LabelLarge = TextStyle(
        fontSize = Sizes.BodySmall,
        fontWeight = Weights.Medium,
        lineHeight = 20.sp,
        letterSpacing = 0.5.sp
    )
    
    val LabelMedium = TextStyle(
        fontSize = Sizes.Caption,
        fontWeight = Weights.Medium,
        lineHeight = 16.sp,
        letterSpacing = 0.5.sp
    )
    
    val LabelSmall = TextStyle(
        fontSize = Sizes.Label,
        fontWeight = Weights.Medium,
        lineHeight = 14.sp,
        letterSpacing = 0.5.sp
    )
    
    val Metadata = TextStyle(
        fontSize = Sizes.Caption,
        fontWeight = Weights.Regular,
        lineHeight = 16.sp,
        letterSpacing = 0.sp,
        color = MediaColors.TextSecondary
    )
    
    val Badge = TextStyle(
        fontSize = Sizes.Micro,
        fontWeight = Weights.Bold,
        lineHeight = 12.sp,
        letterSpacing = 0.5.sp
    )
}

// =============================================================================
// SPACING & DIMENSIONS
// =============================================================================

/**
 * Consistent spacing system
 */
object MediaSpacing {
    // Base unit = 4dp
    val XXS = 2.dp
    val XS = 4.dp
    val SM = 8.dp
    val MD = 12.dp
    val LG = 16.dp
    val XL = 24.dp
    val XXL = 32.dp
    val XXXL = 48.dp
    val Huge = 64.dp
    
    // Screen padding
    val ScreenHorizontal = 20.dp
    val ScreenVertical = 16.dp
    
    // Card spacing
    val CardPadding = MD
    val CardGap = SM
    
    // Section spacing
    val SectionGap = XL
    val SectionPadding = LG
    
    // List spacing
    val ListItemGap = SM
    val ListSectionGap = LG
    
    // Grid spacing
    val GridGap = MD
    val GridItemGap = SM
}

/**
 * Consistent sizing
 */
object MediaSizes {
    // Navigation
    val SidebarWidth = 240.dp
    val SidebarCollapsedWidth = 72.dp
    val BottomBarHeight = 80.dp
    val TopBarHeight = 64.dp
    
    // Cards
    val CardSmall = 120.dp
    val CardMedium = 160.dp
    val CardLarge = 200.dp
    val CardXLarge = 280.dp
    
    // Card aspect ratios
    val PosterAspectRatio = 2f / 3f        // Movie/TV posters
    val CoverAspectRatio = 3f / 4f         // Book covers
    val SquareAspectRatio = 1f             // Album art
    val WidescreenAspectRatio = 16f / 9f   // Video thumbnails
    val BannerAspectRatio = 3f / 1f        // Wide banners
    
    // Icons
    val IconXS = 16.dp
    val IconSM = 20.dp
    val IconMD = 24.dp
    val IconLG = 32.dp
    val IconXL = 48.dp
    val IconHuge = 64.dp
    
    // Buttons
    val ButtonHeightSmall = 32.dp
    val ButtonHeightMedium = 40.dp
    val ButtonHeightLarge = 48.dp
    val ButtonHeightXLarge = 56.dp
    
    // Avatars
    val AvatarSmall = 32.dp
    val AvatarMedium = 48.dp
    val AvatarLarge = 64.dp
    
    // Thumbnails
    val ThumbnailSmall = 48.dp
    val ThumbnailMedium = 64.dp
    val ThumbnailLarge = 80.dp
    
    // Progress
    val ProgressHeight = 3.dp
    val ProgressHeightThick = 6.dp
    
    // Hero sections
    val HeroHeight = 400.dp
    val HeroHeightCompact = 280.dp
    
    // Mini player
    val MiniPlayerHeight = 72.dp
}

/**
 * Corner radii
 */
object MediaCorners {
    val None = 0.dp
    val XS = 4.dp
    val SM = 8.dp
    val MD = 12.dp
    val LG = 16.dp
    val XL = 24.dp
    val Full = 999.dp
    
    // Specific components
    val Card = SM
    val Button = SM
    val Dialog = LG
    val BottomSheet = XL
    val Chip = Full
    val SearchBar = Full
}

/**
 * Elevation/shadow levels
 */
object MediaElevation {
    val None = 0.dp
    val XS = 1.dp
    val SM = 2.dp
    val MD = 4.dp
    val LG = 8.dp
    val XL = 16.dp
    val XXL = 24.dp
}

// =============================================================================
// ANIMATION
// =============================================================================

/**
 * Animation constants and specs
 */
object MediaAnimations {
    // Durations
    object Duration {
        const val Instant = 0
        const val Fast = 150
        const val Normal = 250
        const val Slow = 400
        const val Slower = 600
        const val Slowest = 1000
    }
    
    // Easing curves
    val EaseOut = FastOutSlowInEasing
    val EaseIn = FastOutLinearInEasing
    val EaseInOut = LinearOutSlowInEasing
    val SpringSpec: SpringSpec<Float> = spring(
        dampingRatio = androidx.compose.animation.core.Spring.DampingRatioMediumBouncy,
        stiffness = androidx.compose.animation.core.Spring.StiffnessLow
    )
    
    // Transition specs
    val fadeSpec = tween<Float>(
        durationMillis = Duration.Normal,
        easing = EaseOut
    )
    
    val slideSpec = tween<Float>(
        durationMillis = Duration.Normal,
        easing = EaseOut
    )
    
    val scaleSpec: SpringSpec<Float> = spring(
        dampingRatio = androidx.compose.animation.core.Spring.DampingRatioMediumBouncy,
        stiffness = androidx.compose.animation.core.Spring.StiffnessMediumLow
    )
}

// =============================================================================
// THEME COMPOSITION
// =============================================================================

/**
 * Material 3 color scheme based on Plex design
 */
val MediaDarkColorScheme = darkColorScheme(
    primary = MediaColors.AccentPrimary,
    onPrimary = MediaColors.TextOnAccent,
    primaryContainer = MediaColors.AccentTertiary,
    onPrimaryContainer = MediaColors.TextPrimary,
    
    secondary = MediaColors.AccentSecondary,
    onSecondary = MediaColors.TextOnAccent,
    secondaryContainer = MediaColors.BackgroundSurface,
    onSecondaryContainer = MediaColors.TextPrimary,
    
    tertiary = MediaColors.MediaTypes.Book,
    onTertiary = MediaColors.TextOnAccent,
    tertiaryContainer = MediaColors.BackgroundSurface,
    onTertiaryContainer = MediaColors.TextPrimary,
    
    background = MediaColors.Background,
    onBackground = MediaColors.TextPrimary,
    
    surface = MediaColors.BackgroundElevated,
    onSurface = MediaColors.TextPrimary,
    surfaceVariant = MediaColors.BackgroundSurface,
    onSurfaceVariant = MediaColors.TextSecondary,
    
    surfaceTint = MediaColors.AccentPrimary,
    inverseSurface = MediaColors.TextPrimary,
    inverseOnSurface = MediaColors.Background,
    inversePrimary = MediaColors.AccentTertiary,
    
    error = MediaColors.Error,
    onError = MediaColors.TextPrimary,
    errorContainer = MediaColors.Error.copy(alpha = 0.2f),
    onErrorContainer = MediaColors.Error,
    
    outline = MediaColors.Border,
    outlineVariant = MediaColors.Divider,
    scrim = Color.Black.copy(alpha = 0.6f)
)

/**
 * Plex-themed shapes
 */
val MediaShapes = Shapes(
    extraSmall = androidx.compose.foundation.shape.RoundedCornerShape(MediaCorners.XS),
    small = androidx.compose.foundation.shape.RoundedCornerShape(MediaCorners.SM),
    medium = androidx.compose.foundation.shape.RoundedCornerShape(MediaCorners.MD),
    large = androidx.compose.foundation.shape.RoundedCornerShape(MediaCorners.LG),
    extraLarge = androidx.compose.foundation.shape.RoundedCornerShape(MediaCorners.XL)
)

// =============================================================================
// THEME PROVIDER
// =============================================================================

/**
 * Local composition for accessing Plex theme colors
 */
val LocalMediaColors = staticCompositionLocalOf { MediaColors }

/**
 * Accent theme configuration
 */
enum class MediaAccentTheme {
    MEDIA_GOLD,
    FERRET_ORANGE,
    NETFLIX_RED,
    SPOTIFY_GREEN,
    PRIME_BLUE,
    DISNEY_BLUE,
    HBO_PURPLE,
    CUSTOM
}

@Immutable
data class MediaAccentColors(
    val primary: Color,
    val secondary: Color,
    val tertiary: Color,
    val glow: Color
)

val LocalMediaAccent = staticCompositionLocalOf {
    MediaAccentColors(
        primary = MediaColors.AccentPrimary,
        secondary = MediaColors.AccentSecondary,
        tertiary = MediaColors.AccentTertiary,
        glow = MediaColors.AccentGlow
    )
}

/**
 * Get accent colors for a theme
 */
fun getAccentColors(theme: MediaAccentTheme, customColor: Color? = null): MediaAccentColors {
    return when (theme) {
        MediaAccentTheme.MEDIA_GOLD -> MediaAccentColors(
            primary = MediaColors.Themes.MediaGold,
            secondary = Color(0xFFF5B82E),
            tertiary = Color(0xFFCC8A00),
            glow = Color(0xFFFFD54F)
        )
        MediaAccentTheme.FERRET_ORANGE -> MediaAccentColors(
            primary = MediaColors.Themes.FerretOrange,
            secondary = Color(0xFFFF8A50),
            tertiary = Color(0xFFE65100),
            glow = Color(0xFFFFAB40)
        )
        MediaAccentTheme.NETFLIX_RED -> MediaAccentColors(
            primary = MediaColors.Themes.NetflixRed,
            secondary = Color(0xFFFF4444),
            tertiary = Color(0xFFB20000),
            glow = Color(0xFFFF6666)
        )
        MediaAccentTheme.SPOTIFY_GREEN -> MediaAccentColors(
            primary = MediaColors.Themes.SpotifyGreen,
            secondary = Color(0xFF1ED760),
            tertiary = Color(0xFF0D9E40),
            glow = Color(0xFF4AE17D)
        )
        MediaAccentTheme.PRIME_BLUE -> MediaAccentColors(
            primary = MediaColors.Themes.PrimeBlue,
            secondary = Color(0xFF33B5E5),
            tertiary = Color(0xFF007BB8),
            glow = Color(0xFF66D9FF)
        )
        MediaAccentTheme.DISNEY_BLUE -> MediaAccentColors(
            primary = MediaColors.Themes.DisneyBlue,
            secondary = Color(0xFF2255FF),
            tertiary = Color(0xFF0A2A99),
            glow = Color(0xFF5577FF)
        )
        MediaAccentTheme.HBO_PURPLE -> MediaAccentColors(
            primary = MediaColors.Themes.HBOPurple,
            secondary = Color(0xFFAA33FF),
            tertiary = Color(0xFF6600AA),
            glow = Color(0xFFCC66FF)
        )
        MediaAccentTheme.CUSTOM -> MediaAccentColors(
            primary = customColor ?: MediaColors.AccentPrimary,
            secondary = (customColor ?: MediaColors.AccentPrimary).copy(alpha = 0.8f),
            tertiary = (customColor ?: MediaColors.AccentPrimary).copy(alpha = 0.6f),
            glow = (customColor ?: MediaColors.AccentPrimary).copy(alpha = 0.4f)
        )
    }
}

/**
 * Plex Theme composable with accent customization
 * 
 * Note: Use MediaTheme from MediaThemes.kt for full theme preset support.
 * This function provides accent color customization on top of the base dark theme.
 */
@Composable
fun MediaAccentTheme(
    accentTheme: MediaAccentTheme = MediaAccentTheme.MEDIA_GOLD,
    customAccent: Color? = null,
    content: @Composable () -> Unit
) {
    val accentColors = remember(accentTheme, customAccent) {
        getAccentColors(accentTheme, customAccent)
    }
    
    val colorScheme = remember(accentColors) {
        MediaDarkColorScheme.copy(
            primary = accentColors.primary,
            onPrimary = if (accentColors.primary.luminance() > 0.5f) 
                Color.Black else Color.White,
            primaryContainer = accentColors.tertiary,
            secondary = accentColors.secondary
        )
    }
    
    CompositionLocalProvider(
        LocalMediaColors provides MediaColors,
        LocalMediaAccent provides accentColors
    ) {
        MaterialTheme(
            colorScheme = colorScheme,
            shapes = MediaShapes,
            content = content
        )
    }
}

/**
 * Helper extension to calculate luminance
 */
private fun Color.luminance(): Float {
    val r = red
    val g = green
    val b = blue
    return 0.299f * r + 0.587f * g + 0.114f * b
}
