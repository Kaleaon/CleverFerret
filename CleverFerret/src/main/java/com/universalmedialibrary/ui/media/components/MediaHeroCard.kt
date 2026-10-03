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
 * Large hero card for featured content
 * Spans full width with backdrop and overlay info
 */
@Composable
fun MediaHeroCard(
    item: MediaItem,
    onClick: () -> Unit,
    onPlayClick: (() -> Unit)? = null,
    modifier: Modifier = Modifier,
    height: Dp = MediaSizes.HeroHeight
) {
    Box(
        modifier = modifier
            .fillMaxWidth()
            .height(height)
            .clickable(onClick = onClick)
    ) {
        // Backdrop
        if (item.backdropUrl != null || item.imageUrl != null) {
            AsyncImage(
                model = MediaImageModels.resolve(item.backdropUrl ?: item.imageUrl),
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
                        Brush.linearGradient(
                            colors = listOf(
                                item.mediaType.color.copy(alpha = 0.3f),
                                MediaColors.Background
                            )
                        )
                    )
            )
        }
        
        // Gradient overlays
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(MediaColors.Gradients.heroOverlay)
        )
        
        // Content
        Column(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(MediaSpacing.XL)
                .fillMaxWidth(0.6f)
        ) {
            // Media type badge
            Surface(
                shape = RoundedCornerShape(MediaCorners.XS),
                color = item.mediaType.color.copy(alpha = 0.2f)
            ) {
                Row(
                    modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XXS),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS)
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = "Media type: ${item.mediaType.name}",
                        modifier = Modifier.size(MediaSizes.IconXS),
                        tint = item.mediaType.color
                    )
                    Text(
                        text = item.mediaType.name.replace("_", " "),
                        style = MediaTypography.LabelSmall,
                        color = item.mediaType.color
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            // Title
            Text(
                text = item.title,
                style = MediaTypography.Hero,
                color = MediaColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis
            )
            
            // Metadata row
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
            ) {
                item.year?.let { year ->
                    Text(
                        text = year.toString(),
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextSecondary
                    )
                }
                
                item.rating?.let { rating ->
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.Star,
                            contentDescription = "Rating",
                            modifier = Modifier.size(MediaSizes.IconSM),
                            tint = MediaColors.Warning
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.XXS))
                        Text(
                            text = "%.1f".format(rating),
                            style = MediaTypography.BodyMedium,
                            color = MediaColors.TextSecondary
                        )
                    }
                }
                
                item.duration?.let { duration ->
                    Text(
                        text = duration,
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextSecondary
                    )
                }
            }
            
            // Subtitle/Description
            item.subtitle?.let { subtitle ->
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Text(
                    text = subtitle,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextSecondary,
                    maxLines = 3,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            // Action buttons
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
            
            Row(horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)) {
                // Play button
                if (onPlayClick != null) {
                    Button(
                        onClick = onPlayClick,
                        colors = ButtonDefaults.buttonColors(
                            containerColor = MediaColors.AccentPrimary,
                            contentColor = MediaColors.TextOnAccent
                        ),
                        shape = RoundedCornerShape(MediaCorners.Button)
                    ) {
                        Icon(
                            imageVector = Icons.Default.PlayArrow,
                            contentDescription = if (item.progress > 0) "Continue playing" else "Play",
                            modifier = Modifier.size(MediaSizes.IconMD)
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.SM))
                        Text(
                            text = if (item.progress > 0) "Continue" else "Play",
                            style = MediaTypography.LabelLarge
                        )
                    }
                }
                
                // More info button
                OutlinedButton(
                    onClick = onClick,
                    colors = ButtonDefaults.outlinedButtonColors(
                        contentColor = MediaColors.TextPrimary
                    ),
                    border = BorderStroke(1.dp, MediaColors.Border),
                    shape = RoundedCornerShape(MediaCorners.Button)
                ) {
                    Icon(
                        imageVector = Icons.Default.Info,
                        contentDescription = "More information",
                        modifier = Modifier.size(MediaSizes.IconMD)
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    Text(
                        text = "More Info",
                        style = MediaTypography.LabelLarge
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
                    .height(MediaSizes.ProgressHeightThick)
                    .align(Alignment.BottomCenter),
                color = progressColor,
                trackColor = progressTrackColor
            )
        }
    }
}
