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
 * Unified media item model for cards
 */
data class MediaItem(
    val id: String,
    val title: String,
    val subtitle: String? = null,
    val imageUrl: String? = null,
    val backdropUrl: String? = null,
    val progress: Float = 0f,           // 0.0 to 1.0
    val rating: Float? = null,          // 1.0 to 10.0
    val year: Int? = null,
    val duration: String? = null,
    val remainingTimeText: String? = null,
    val mediaType: MediaType = MediaType.UNKNOWN,
    val badges: List<MediaBadge> = emptyList(),
    val isNew: Boolean = false,
    val isUnwatched: Boolean = false
)

@Composable
private fun mediaProgressColors(): Pair<Color, Color> {
    val scheme = MaterialTheme.colorScheme
    return scheme.primary to scheme.surfaceContainerHighest
}

enum class MediaType(val color: Color, val icon: ImageVector) {
    BOOK(MediaColors.MediaTypes.Book, Icons.Default.MenuBook),
    AUDIOBOOK(MediaColors.MediaTypes.Audiobook, Icons.Default.Headphones),
    COMIC(MediaColors.MediaTypes.Comic, Icons.Default.AutoStories),
    MUSIC(MediaColors.MediaTypes.Music, Icons.Default.MusicNote),
    PODCAST(MediaColors.MediaTypes.Podcast, Icons.Default.Podcasts),
    MOVIE(MediaColors.MediaTypes.Movie, Icons.Default.Movie),
    TV_SHOW(MediaColors.MediaTypes.TvShow, Icons.Default.Tv),
    RADIO(MediaColors.MediaTypes.Radio, Icons.Default.Radio),
    DOCUMENT(MediaColors.MediaTypes.Document, Icons.Default.Description),
    FANFICTION(MediaColors.MediaTypes.Fanfiction, Icons.Default.Edit),
    NEWS(MediaColors.MediaTypes.News, Icons.Default.Newspaper),
    UNKNOWN(MediaColors.TextTertiary, Icons.Default.QuestionMark);
    
    companion object {
        fun fromRouteName(routeName: String): MediaType = when (routeName) {
            "book" -> BOOK
            "audiobook" -> AUDIOBOOK
            "comic" -> COMIC
            "music" -> MUSIC
            "podcast" -> PODCAST
            "movie" -> MOVIE
            "tv_show" -> TV_SHOW
            "radio" -> RADIO
            "document" -> DOCUMENT
            "webfiction" -> FANFICTION
            "news" -> NEWS
            else -> UNKNOWN
        }
    }
}


// =============================================================================
// SQUARE CARD (Music Albums, Podcasts)
// =============================================================================


// =============================================================================
// WIDE CARD (Video Thumbnails)
// =============================================================================


// =============================================================================
// HERO CARD (Featured Content)
// =============================================================================


// =============================================================================
// LIST ITEM (Compact View)
// =============================================================================

/**
 * Compact list item for dense views
 */
@Composable
fun MediaListItem(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    showImage: Boolean = true,
    showProgress: Boolean = true,
    trailing: @Composable (() -> Unit)? = null
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    
    Surface(
        modifier = modifier
            .fillMaxWidth()
            .clickable(
                interactionSource = interactionSource,
                indication = null,
                onClick = onClick
            ),
        color = if (isHovered) MediaColors.BackgroundHover else Color.Transparent,
        shape = RoundedCornerShape(MediaCorners.SM)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.SM),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Thumbnail
            if (showImage) {
                Box(
                    modifier = Modifier
                        .size(MediaSizes.ThumbnailSmall)
                        .clip(RoundedCornerShape(MediaCorners.XS))
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
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = "${item.mediaType.name} item",
                            modifier = Modifier
                                .size(24.dp)
                                .align(Alignment.Center),
                            tint = item.mediaType.color.copy(alpha = 0.5f)
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
            }
            
            // Content
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = item.title,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                item.subtitle?.let { subtitle ->
                    Text(
                        text = subtitle,
                        style = MediaTypography.BodySmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Progress bar
                if (showProgress && item.progress > 0) {
                    val (progressColor, progressTrackColor) = mediaProgressColors()
                    Spacer(modifier = Modifier.height(MediaSpacing.XS))
                    LinearProgressIndicator(
                        progress = { item.progress },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(2.dp),
                        color = progressColor,
                        trackColor = progressTrackColor
                    )
                }
            }
            
            // Trailing content
            trailing?.invoke()
        }
    }
}

// =============================================================================
// CAROUSEL ROW
// =============================================================================

/**
 * Horizontal carousel row with section header
 */
@Composable
fun <T> MediaCarouselRow(
    title: String,
    items: List<T>,
    onSeeAllClick: (() -> Unit)? = null,
    modifier: Modifier = Modifier,
    itemContent: @Composable (T) -> Unit
) {
    Column(modifier = modifier.fillMaxWidth()) {
        // Header
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = MediaSpacing.ScreenHorizontal),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = title,
                style = MediaTypography.TitleMedium,
                color = MediaColors.TextPrimary
            )
            
            if (onSeeAllClick != null) {
                TextButton(onClick = onSeeAllClick) {
                    Text(
                        text = "See All",
                        style = MediaTypography.LabelMedium,
                        color = MediaColors.AccentPrimary
                    )
                    Icon(
                        imageVector = Icons.Default.ChevronRight,
                        contentDescription = "See all $title",
                        modifier = Modifier.size(MediaSizes.IconSM),
                        tint = MediaColors.AccentPrimary
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        // Items
        LazyRow(
            contentPadding = PaddingValues(horizontal = MediaSpacing.ScreenHorizontal),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            items(items) { item ->
                itemContent(item)
            }
        }
    }
}

// =============================================================================
// HELPER COMPONENTS
// =============================================================================

@Composable
private fun CardBadges(
    item: MediaItem,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.End,
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.XXS)
    ) {
        if (item.isNew) {
            BadgeChip(text = "NEW", color = MediaColors.AccentPrimary)
        }
        
        if (item.isUnwatched) {
            Box(
                modifier = Modifier
                    .size(12.dp)
                    .clip(CircleShape)
                    .background(MediaColors.AccentPrimary)
            )
        }
        
        item.badges.forEach { badge ->
            BadgeChip(
                text = badge.text,
                color = badge.color,
                icon = badge.icon
            )
        }
    }
}

@Composable
private fun BadgeChip(
    text: String,
    color: Color,
    icon: ImageVector? = null
) {
    Surface(
        shape = RoundedCornerShape(MediaCorners.XS),
        color = color.copy(alpha = 0.9f)
    ) {
        Row(
            modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(2.dp)
        ) {
            if (icon != null) {
                Icon(
                    imageVector = icon,
                    contentDescription = text,
                    modifier = Modifier.size(10.dp),
                    tint = Color.White
                )
            }
            Text(
                text = text,
                style = MediaTypography.Badge,
                color = Color.White
            )
        }
    }
}

@Composable
private fun RatingBadge(
    rating: Float,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(MediaCorners.XS),
        color = Color.Black.copy(alpha = 0.7f)
    ) {
        Row(
            modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = Icons.Default.Star,
                contentDescription = "Rating",
                modifier = Modifier.size(12.dp),
                tint = MediaColors.Warning
            )
            Spacer(modifier = Modifier.width(2.dp))
            Text(
                text = "%.1f".format(rating),
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextPrimary
            )
        }
    }
}

@Composable
private fun PlayButton(
    onClick: () -> Unit,
    size: Dp = 48.dp
) {
    Surface(
        modifier = Modifier
            .size(size)
            .shadow(MediaElevation.MD, CircleShape),
        shape = CircleShape,
        color = MediaColors.AccentPrimary,
        onClick = onClick
    ) {
        Icon(
            imageVector = Icons.Default.PlayArrow,
            contentDescription = "Play",
            modifier = Modifier
                .padding(size * 0.2f)
                .fillMaxSize(),
            tint = MediaColors.TextOnAccent
        )
    }
}

// =============================================================================
// LOADING STATES
// =============================================================================

/**
 * Shimmer loading placeholder for poster cards
 */
@Composable
fun MediaPosterCardSkeleton(
    modifier: Modifier = Modifier,
    width: Dp = MediaSizes.CardMedium
) {
    val shimmerColors = listOf(
        MediaColors.BackgroundElevated,
        MediaColors.BackgroundSurface,
        MediaColors.BackgroundElevated
    )
    
    val transition = rememberInfiniteTransition(label = "shimmer")
    val translateAnim by transition.animateFloat(
        initialValue = 0f,
        targetValue = 1000f,
        animationSpec = infiniteRepeatable(
            animation = tween(1200, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "shimmer_translate"
    )
    
    val brush = Brush.linearGradient(
        colors = shimmerColors,
        start = androidx.compose.ui.geometry.Offset(translateAnim - 500f, 0f),
        end = androidx.compose.ui.geometry.Offset(translateAnim, 0f)
    )
    
    Column(modifier = modifier.width(width)) {
        // Image placeholder
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(MediaSizes.PosterAspectRatio)
                .clip(RoundedCornerShape(MediaCorners.Card))
                .background(brush)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        // Title placeholder
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(16.dp)
                .clip(RoundedCornerShape(MediaCorners.XS))
                .background(brush)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        
        // Subtitle placeholder
        Box(
            modifier = Modifier
                .fillMaxWidth(0.7f)
                .height(12.dp)
                .clip(RoundedCornerShape(MediaCorners.XS))
                .background(brush)
        )
    }
}
