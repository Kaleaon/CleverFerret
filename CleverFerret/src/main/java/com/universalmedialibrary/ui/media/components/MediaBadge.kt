package com.universalmedialibrary.ui.media.components

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsHoveredAsState
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Media Card Components
 * 
 * A comprehensive set of beautiful media cards inspired by premium media apps's design:
 * - Poster cards (books, movies, TV shows)
 * - Square cards (music albums, podcasts)
 * - Wide cards (video thumbnails)
 * - Hero cards (featured content)
 * - List items (compact views)
 * - Carousel rows
 * 
 * Features:
 * - Smooth hover/press animations
 * - Progress indicators
 * - Badges (new, unwatched, etc.)
 * - Media type color coding
 * - Shimmer loading states
 */

// =============================================================================
// DATA MODELS
// =============================================================================

data class MediaBadge(
    val text: String,
    val color: Color = MediaColors.AccentPrimary,
    val icon: ImageVector? = null
)

// =============================================================================
// POSTER CARD (Books, Movies, TV Shows)
// =============================================================================

/**
 * Standard poster card with 2:3 aspect ratio
 * Used for books, movies, TV shows, etc.
 */
@Composable
fun MediaPosterCard(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    width: Dp = MediaSizes.CardMedium,
    showTitle: Boolean = true,
    showSubtitle: Boolean = true,
    showProgress: Boolean = true
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = when {
            isPressed -> 0.95f
            isHovered -> 1.03f
            else -> 1f
        },
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessMediumLow
        ),
        label = "poster_scale"
    )
    
    val elevation by animateDpAsState(
        targetValue = if (isHovered) MediaElevation.LG else MediaElevation.SM,
        label = "poster_elevation"
    )
    
    Column(
        modifier = modifier
            .width(width)
            .scale(scale)
            .clickable(
                interactionSource = interactionSource,
                indication = null,
                onClick = onClick
            )
    ) {
        // Image container with aspect ratio
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(MediaSizes.PosterAspectRatio)
                .shadow(elevation, RoundedCornerShape(MediaCorners.Card))
                .clip(RoundedCornerShape(MediaCorners.Card))
                .background(MediaColors.BackgroundSurface)
        ) {
            // Cover image
            if (item.imageUrl != null) {
                AsyncImage(
                    model = MediaImageModels.resolve(item.imageUrl),
                    contentDescription = item.title,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop,
                    placeholder = painterResource(MediaImageModels.PlaceholderRes),
                    error = painterResource(MediaImageModels.ErrorRes)
                )
            } else {
                // Placeholder
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(
                            Brush.verticalGradient(
                                colors = listOf(
                                    item.mediaType.color.copy(alpha = 0.3f),
                                    item.mediaType.color.copy(alpha = 0.1f)
                                )
                            )
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = "${item.mediaType.name} placeholder",
                        modifier = Modifier.size(width * 0.3f),
                        tint = item.mediaType.color.copy(alpha = 0.5f)
                    )
                }
            }
            
            // Hover overlay
            if (isHovered) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(MediaColors.AccentPrimary.copy(alpha = 0.1f))
                )
            }
            
            // Progress bar
            if (showProgress && item.progress > 0) {
                val (progressColor, progressTrackColor) = mediaProgressColors()
                LinearProgressIndicator(
                    progress = { item.progress },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(MediaSizes.ProgressHeight)
                        .align(Alignment.BottomCenter),
                    color = progressColor,
                    trackColor = progressTrackColor
                )
            }
            
            // Badges
            if (item.badges.isNotEmpty() || item.isNew || item.isUnwatched) {
                CardBadges(
                    item = item,
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(MediaSpacing.XS)
                )
            }
            
            // Rating badge
            item.rating?.let { rating ->
                RatingBadge(
                    rating = rating,
                    modifier = Modifier
                        .align(Alignment.TopStart)
                        .padding(MediaSpacing.XS)
                )
            }
            
            // Play button on hover
            if (isHovered) {
                Box(modifier = Modifier.align(Alignment.Center)) {
                    PlayButton(onClick = onClick)
                }
            }
        }
        
        // Title and subtitle
        if (showTitle) {
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            Text(
                text = item.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            if (showSubtitle && item.subtitle != null) {
                Text(
                    text = item.subtitle,
                    style = MediaTypography.BodySmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}
