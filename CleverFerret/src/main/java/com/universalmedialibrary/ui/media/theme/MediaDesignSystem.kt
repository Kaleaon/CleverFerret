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
    /**
     * Alternative accent colors (static). These are used by optional accent-only themes
     * and should not be treated as the primary theme system.
     */
    object Themes {
        val MediaGold = Color(0xFFE5A00D)
        val FerretOrange = Color(0xFFFF6D00)
        val NetflixRed = Color(0xFFE50914)
        val SpotifyGreen = Color(0xFF1DB954)
        val PrimeBlue = Color(0xFF00A8E1)
        val DisneyBlue = Color(0xFF113CCF)
        val HBOPurple = Color(0xFF8800CC)
        val AppleWhite = Color(0xFFF5F5F7)
    }

    // -------------------------------------------------------------------------
    // Theme-synced tokens (non-composable to keep call-sites simple)
    //
    // These are updated from the current MaterialTheme via [SyncWithMaterialTheme].
    // This avoids sprinkling MaterialTheme everywhere while still allowing the app-wide
    // UnifiedCleverFerretTheme palette to drive the media UI.
    // -------------------------------------------------------------------------

    var Background by mutableStateOf(Color(0xFF1F1F1F))
        private set
    var BackgroundElevated by mutableStateOf(Color(0xFF282828))
        private set
    var BackgroundSurface by mutableStateOf(Color(0xFF323232))
        private set
    var BackgroundHover by mutableStateOf(Color(0xFF3D3D3D))
        private set
    var BackgroundPressed by mutableStateOf(Color(0xFF484848))
        private set

    var AccentPrimary by mutableStateOf(Themes.MediaGold)
        private set
    var AccentSecondary by mutableStateOf(Color(0xFFF5B82E))
        private set
    var AccentTertiary by mutableStateOf(Color(0xFFCC8A00))
        private set
    var AccentGlow by mutableStateOf(Color(0xFFFFD54F))
        private set

    var TextPrimary by mutableStateOf(Color(0xFFFFFFFF))
        private set
    var TextSecondary by mutableStateOf(Color(0xFFB3B3B3))
        private set
    var TextTertiary by mutableStateOf(Color(0xFF808080))
        private set
    var TextDisabled by mutableStateOf(Color(0xFF5A5A5A))
        private set
    var TextOnAccent by mutableStateOf(Color(0xFF000000))
        private set
    
    // Media Type Colors (for categorization)
    object MediaTypes {
        // User request: remove per-segment bright rainbow colors.
        // Keep a single coherent accent across the app chrome.
        val Book: Color get() = AccentPrimary
        val Audiobook: Color get() = AccentPrimary
        val Comic: Color get() = AccentPrimary
        val Music: Color get() = AccentPrimary
        val Podcast: Color get() = AccentPrimary
        val Movie: Color get() = AccentPrimary
        val TvShow: Color get() = AccentPrimary
        val Radio: Color get() = AccentPrimary
        val Document: Color get() = AccentPrimary
        val Fanfiction: Color get() = AccentPrimary
        val News: Color get() = AccentPrimary
    }
    
    // Status Colors
    val Success: Color = Color(0xFF4CAF50)
    val Warning: Color = Color(0xFFFFC107)
    val Info: Color = Color(0xFF2196F3)
    var Error by mutableStateOf(Color(0xFFF44336))
        private set
    
    // Progress Colors
    var ProgressBackground by mutableStateOf(Color(0xFF3D3D3D))
        private set
    val ProgressForeground: Color get() = AccentPrimary
    var ProgressUnwatched by mutableStateOf(Color(0xFF666666))
        private set
    
    // Border & Divider Colors
    var Border by mutableStateOf(Color(0xFF404040))
        private set
    val BorderFocused: Color get() = AccentPrimary
    var Divider by mutableStateOf(Color(0xFF333333))
        private set
    
    // Gradient Backgrounds
    object Gradients {
        val backgroundFade: Brush
            get() = Brush.verticalGradient(
                colors = listOf(
                    Color.Transparent,
                    Background.copy(alpha = 0.7f),
                    Background
                )
            )

        val cardHover: Brush
            get() = Brush.verticalGradient(
                colors = listOf(
                    Color.Transparent,
                    AccentPrimary.copy(alpha = 0.1f)
                )
            )

        val heroOverlay: Brush
            get() = Brush.verticalGradient(
                colors = listOf(
                    Color.Transparent,
                    Background.copy(alpha = 0.3f),
                    Background.copy(alpha = 0.8f),
                    Background
                ),
                startY = 0f,
                endY = Float.POSITIVE_INFINITY
            )

        val shimmer: Brush
            get() = Brush.horizontalGradient(
                colors = listOf(
                    BackgroundElevated,
                    BackgroundSurface,
                    BackgroundElevated
                )
            )
    }

    private fun updateFromColorScheme(scheme: ColorScheme) {
        Background = scheme.background
        BackgroundElevated = scheme.surface
        BackgroundSurface = scheme.surfaceVariant
        BackgroundHover = scheme.surfaceVariant.copy(alpha = 0.9f)
        BackgroundPressed = scheme.surfaceVariant.copy(alpha = 0.8f)

        AccentPrimary = scheme.primary
        AccentSecondary = scheme.secondary
        AccentTertiary = scheme.primaryContainer
        AccentGlow = scheme.primary.copy(alpha = 0.35f)

        TextPrimary = scheme.onBackground
        TextSecondary = scheme.onSurfaceVariant
        TextTertiary = scheme.onSurfaceVariant.copy(alpha = 0.75f)
        TextDisabled = scheme.onSurfaceVariant.copy(alpha = 0.45f)
        TextOnAccent = scheme.onPrimary

        Error = scheme.error

        Border = scheme.outline
        Divider = scheme.outlineVariant
        ProgressBackground = scheme.surfaceVariant
        ProgressUnwatched = scheme.onSurfaceVariant.copy(alpha = 0.55f)
    }

    @Composable
    fun SyncWithMaterialTheme() {
        val scheme = MaterialTheme.colorScheme
        SideEffect {
            updateFromColorScheme(scheme)
        }
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
        letterSpacing = 0.sp
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
private val DefaultMediaDarkColorScheme = darkColorScheme(
    primary = Color(0xFFE5A00D),
    onPrimary = Color(0xFF000000),
    primaryContainer = Color(0xFFCC8A00),
    onPrimaryContainer = Color(0xFFFFFFFF),

    secondary = Color(0xFFF5B82E),
    onSecondary = Color(0xFF000000),
    secondaryContainer = Color(0xFF323232),
    onSecondaryContainer = Color(0xFFFFFFFF),

    tertiary = Color(0xFFE5A00D),
    onTertiary = Color(0xFF000000),
    tertiaryContainer = Color(0xFF323232),
    onTertiaryContainer = Color(0xFFFFFFFF),

    background = Color(0xFF1F1F1F),
    onBackground = Color(0xFFFFFFFF),

    surface = Color(0xFF282828),
    onSurface = Color(0xFFFFFFFF),
    surfaceVariant = Color(0xFF323232),
    onSurfaceVariant = Color(0xFFB3B3B3),

    surfaceTint = Color(0xFFE5A00D),
    inverseSurface = Color(0xFFFFFFFF),
    inverseOnSurface = Color(0xFF1F1F1F),
    inversePrimary = Color(0xFFCC8A00),

    error = Color(0xFFF44336),
    onError = Color(0xFFFFFFFF),
    errorContainer = Color(0xFFF44336).copy(alpha = 0.2f),
    onErrorContainer = Color(0xFFF44336),

    outline = Color(0xFF404040),
    outlineVariant = Color(0xFF333333),
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
        primary = MediaColors.Themes.MediaGold,
        secondary = Color(0xFFF5B82E),
        tertiary = Color(0xFFCC8A00),
        glow = Color(0xFFFFD54F)
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
            // Keep this helper non-composable; fall back to a static accent.
            primary = customColor ?: MediaColors.Themes.MediaGold,
            secondary = (customColor ?: MediaColors.Themes.MediaGold).copy(alpha = 0.8f),
            tertiary = (customColor ?: MediaColors.Themes.MediaGold).copy(alpha = 0.6f),
            glow = (customColor ?: MediaColors.Themes.MediaGold).copy(alpha = 0.4f)
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
        DefaultMediaDarkColorScheme.copy(
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
