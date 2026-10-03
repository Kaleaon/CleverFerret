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
 * Wide card with 16:9 aspect ratio
 * Used for video thumbnails, episodes, chapters
 */
@Composable
fun MediaWideCard(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    width: Dp = MediaSizes.CardXLarge,
    showOverlayInfo: Boolean = true
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = when {
            isPressed -> 0.98f
            isHovered -> 1.02f
            else -> 1f
        },
        label = "wide_scale"
    )
    
    Box(
        modifier = modifier
            .width(width)
            .aspectRatio(MediaSizes.WidescreenAspectRatio)
            .scale(scale)
            .shadow(MediaElevation.SM, RoundedCornerShape(MediaCorners.Card))
            .clip(RoundedCornerShape(MediaCorners.Card))
            .background(MediaColors.BackgroundSurface)
            .clickable(
                interactionSource = interactionSource,
                indication = null,
                onClick = onClick
            )
    ) {
        // Backdrop image
        if (item.backdropUrl != null || item.imageUrl != null) {
            AsyncImage(
                model = MediaImageModels.resolve(item.backdropUrl ?: item.imageUrl),
                contentDescription = item.title,
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop,
                placeholder = painterResource(MediaImageModels.PlaceholderRes),
                error = painterResource(MediaImageModels.ErrorRes)
            )
        }
        
        // Gradient overlay
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent,
                            MediaColors.Background.copy(alpha = 0.8f)
                        ),
                        startY = 0.3f
                    )
                )
        )
        
        // Info overlay
        if (showOverlayInfo) {
            Column(
                modifier = Modifier
                    .align(Alignment.BottomStart)
                    .padding(MediaSpacing.MD)
            ) {
                Text(
                    text = item.title,
                    style = MediaTypography.TitleSmall,
                    color = MediaColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                item.subtitle?.let { subtitle ->
                    Spacer(modifier = Modifier.height(MediaSpacing.XXS))
                    Text(
                        text = subtitle,
                        style = MediaTypography.BodySmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
        }
        
        // Progress bar
        if (item.progress > 0) {
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
        
        // Duration badge
        item.duration?.let { duration ->
            Surface(
                modifier = Modifier
                    .align(Alignment.TopEnd)
                    .padding(MediaSpacing.SM),
                shape = RoundedCornerShape(MediaCorners.XS),
                color = Color.Black.copy(alpha = 0.7f)
            ) {
                Text(
                    text = duration,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextPrimary,
                    modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XXS)
                )
            }
        }
        
        // Play button
        AnimatedVisibility(
            visible = isHovered,
            enter = scaleIn() + fadeIn(),
            exit = scaleOut() + fadeOut(),
            modifier = Modifier.align(Alignment.Center)
        ) {
            PlayButton(onClick = onClick, size = 56.dp)
        }
    }
}
