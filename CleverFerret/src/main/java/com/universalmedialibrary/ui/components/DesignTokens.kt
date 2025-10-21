package com.universalmedialibrary.ui.components

import androidx.compose.ui.unit.dp

/**
 * Design Tokens for consistent spacing and sizing across the app
 * Following Material 3 guidelines
 */
object AppSpacing {
    // Standard spacing scale (8dp base)
    val ExtraSmall = 4.dp
    val Small = 8.dp
    val Medium = 16.dp
    val Large = 24.dp
    val ExtraLarge = 32.dp
    val ExtraExtraLarge = 48.dp
    
    // Specific use cases
    val CardPadding = Medium
    val ScreenPadding = Medium
    val SectionSpacing = Large
    val ItemSpacing = Small
    val ContentPadding = Medium
    val DialogPadding = Large
    
    // List item spacing
    val ListItemVerticalPadding = 12.dp
    val ListItemHorizontalPadding = Medium
    val ListItemSpacing = Small
}

object AppSizes {
    // Icon sizes
    val IconSmall = 16.dp
    val IconMedium = 24.dp
    val IconLarge = 32.dp
    val IconExtraLarge = 48.dp
    val IconHuge = 64.dp
    
    // Thumbnail sizes
    val ThumbnailSmall = 56.dp
    val ThumbnailMedium = 80.dp
    val ThumbnailLarge = 120.dp
    
    // Card sizes
    val CardWidth = 160.dp
    val CardHeight = 240.dp
    val CardImageHeight = 200.dp
    
    // Button heights
    val ButtonHeight = 48.dp
    val ButtonHeightSmall = 40.dp
    val ButtonHeightLarge = 56.dp
    
    // Avatar sizes
    val AvatarSmall = 32.dp
    val AvatarMedium = 40.dp
    val AvatarLarge = 56.dp
    
    // FAB sizes
    val FabSmall = 40.dp
    val FabMedium = 56.dp
    val FabLarge = 96.dp
}

object AppElevation {
    val None = 0.dp
    val Small = 2.dp
    val Medium = 4.dp
    val Large = 8.dp
    val ExtraLarge = 12.dp
}

object AppCornerRadius {
    val ExtraSmall = 4.dp
    val Small = 8.dp
    val Medium = 12.dp
    val Large = 16.dp
    val ExtraLarge = 24.dp
    val Full = 9999.dp
}

/**
 * Animation durations in milliseconds
 */
object AppAnimations {
    const val Fast = 150
    const val Normal = 300
    const val Slow = 500
    const val VerySlow = 800
    
    // Specific animations
    const val FadeIn = Normal
    const val SlideIn = Normal
    const val ScaleIn = Normal
    const val Shimmer = 1200
    const val Pulse = 1000
}

/**
 * Opacity values for consistent transparency
 */
object AppOpacity {
    const val Disabled = 0.38f
    const val Inactive = 0.6f
    const val Active = 1f
    const val Hover = 0.08f
    const val Focus = 0.12f
    const val Selected = 0.16f
    const val Pressed = 0.12f
}

/**
 * Common aspect ratios
 */
object AppAspectRatio {
    const val Square = 1f
    const val Book = 0.67f  // 2:3
    const val Photo = 1.5f  // 3:2
    const val Video = 1.78f // 16:9
    const val Wide = 2.35f  // Cinemascope
}

/**
 * Typography weights for consistency
 */
object AppTextWeight {
    const val Light = 300
    const val Normal = 400
    const val Medium = 500
    const val SemiBold = 600
    const val Bold = 700
}

/**
 * Z-index layers for consistent stacking
 */
object AppZIndex {
    const val Background = 0
    const val Content = 1
    const val Overlay = 2
    const val Dialog = 3
    const val Dropdown = 4
    const val Tooltip = 5
    const val Snackbar = 6
}
