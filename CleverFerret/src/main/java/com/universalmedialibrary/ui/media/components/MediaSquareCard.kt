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

/**
 * Square card with 1:1 aspect ratio
 * Used for music albums, podcasts, radio stations
 */
@Composable
fun MediaSquareCard(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    size: Dp = MediaSizes.CardMedium,
    showTitle: Boolean = true,
    showSubtitle: Boolean = true
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
        label = "square_scale"
    )
    
    Column(
        modifier = modifier
            .width(size)
            .scale(scale)
            .clickable(
                interactionSource = interactionSource,
                indication = null,
                onClick = onClick
            )
    ) {
        Box(
            modifier = Modifier
                .size(size)
                .shadow(MediaElevation.SM, RoundedCornerShape(MediaCorners.Card))
                .clip(RoundedCornerShape(MediaCorners.Card))
                .background(MediaColors.BackgroundSurface)
        ) {
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
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(
                            Brush.radialGradient(
                                colors = listOf(
                                    item.mediaType.color.copy(alpha = 0.4f),
                                    item.mediaType.color.copy(alpha = 0.1f)
                                )
                            )
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = "${item.mediaType.name} placeholder",
                        modifier = Modifier.size(size * 0.4f),
                        tint = item.mediaType.color.copy(alpha = 0.6f)
                    )
                }
            }
            
            // Hover play button
            if (isHovered) {
                Box(modifier = Modifier.align(Alignment.Center)) {
                    PlayButton(onClick = onClick)
                }
            }
            
            // Duration badge (bottom right)
            item.duration?.let { duration ->
                Surface(
                    modifier = Modifier
                        .align(Alignment.BottomEnd)
                        .padding(MediaSpacing.XS),
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = Color.Black.copy(alpha = 0.7f)
                ) {
                    Text(
                        text = duration,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextPrimary,
                        modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp)
                    )
                }
            }
        }
        
        if (showTitle) {
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            Text(
                text = item.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 1,
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
