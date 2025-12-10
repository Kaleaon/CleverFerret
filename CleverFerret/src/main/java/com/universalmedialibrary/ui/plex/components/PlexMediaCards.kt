package com.universalmedialibrary.ui.plex.components

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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Media Card Components
 * 
 * A comprehensive set of beautiful media cards inspired by Plex's design:
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
data class PlexMediaItem(
    val id: String,
    val title: String,
    val subtitle: String? = null,
    val imageUrl: String? = null,
    val backdropUrl: String? = null,
    val progress: Float = 0f,           // 0.0 to 1.0
    val rating: Float? = null,          // 1.0 to 10.0
    val year: Int? = null,
    val duration: String? = null,
    val mediaType: PlexMediaType = PlexMediaType.UNKNOWN,
    val badges: List<PlexBadge> = emptyList(),
    val isNew: Boolean = false,
    val isUnwatched: Boolean = false
)

enum class PlexMediaType(val color: Color, val icon: ImageVector) {
    BOOK(PlexColors.MediaTypes.Book, Icons.Default.MenuBook),
    AUDIOBOOK(PlexColors.MediaTypes.Audiobook, Icons.Default.Headphones),
    COMIC(PlexColors.MediaTypes.Comic, Icons.Default.AutoStories),
    MUSIC(PlexColors.MediaTypes.Music, Icons.Default.MusicNote),
    PODCAST(PlexColors.MediaTypes.Podcast, Icons.Default.Podcasts),
    MOVIE(PlexColors.MediaTypes.Movie, Icons.Default.Movie),
    TV_SHOW(PlexColors.MediaTypes.TvShow, Icons.Default.Tv),
    RADIO(PlexColors.MediaTypes.Radio, Icons.Default.Radio),
    DOCUMENT(PlexColors.MediaTypes.Document, Icons.Default.Description),
    FANFICTION(PlexColors.MediaTypes.Fanfiction, Icons.Default.Edit),
    NEWS(PlexColors.MediaTypes.News, Icons.Default.Newspaper),
    UNKNOWN(PlexColors.TextTertiary, Icons.Default.QuestionMark);
    
    companion object {
        fun fromRouteName(routeName: String): PlexMediaType = when (routeName) {
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

data class PlexBadge(
    val text: String,
    val color: Color = PlexColors.AccentPrimary,
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
fun PlexPosterCard(
    item: PlexMediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    width: Dp = PlexSizes.CardMedium,
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
        targetValue = if (isHovered) PlexElevation.LG else PlexElevation.SM,
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
                .aspectRatio(PlexSizes.PosterAspectRatio)
                .shadow(elevation, RoundedCornerShape(PlexCorners.Card))
                .clip(RoundedCornerShape(PlexCorners.Card))
                .background(PlexColors.BackgroundSurface)
        ) {
            // Cover image
            if (item.imageUrl != null) {
                AsyncImage(
                    model = item.imageUrl,
                    contentDescription = item.title,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
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
                        contentDescription = null,
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
                        .background(PlexColors.AccentPrimary.copy(alpha = 0.1f))
                )
            }
            
            // Progress bar
            if (showProgress && item.progress > 0) {
                LinearProgressIndicator(
                    progress = { item.progress },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(PlexSizes.ProgressHeight)
                        .align(Alignment.BottomCenter),
                    color = PlexColors.AccentPrimary,
                    trackColor = PlexColors.ProgressBackground
                )
            }
            
            // Badges
            if (item.badges.isNotEmpty() || item.isNew || item.isUnwatched) {
                CardBadges(
                    item = item,
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(PlexSpacing.XS)
                )
            }
            
            // Rating badge
            item.rating?.let { rating ->
                RatingBadge(
                    rating = rating,
                    modifier = Modifier
                        .align(Alignment.TopStart)
                        .padding(PlexSpacing.XS)
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
            Spacer(modifier = Modifier.height(PlexSpacing.SM))
            
            Text(
                text = item.title,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            if (showSubtitle && item.subtitle != null) {
                Text(
                    text = item.subtitle,
                    style = PlexTypography.BodySmall,
                    color = PlexColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

// =============================================================================
// SQUARE CARD (Music Albums, Podcasts)
// =============================================================================

/**
 * Square card with 1:1 aspect ratio
 * Used for music albums, podcasts, radio stations
 */
@Composable
fun PlexSquareCard(
    item: PlexMediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    size: Dp = PlexSizes.CardMedium,
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
                .shadow(PlexElevation.SM, RoundedCornerShape(PlexCorners.Card))
                .clip(RoundedCornerShape(PlexCorners.Card))
                .background(PlexColors.BackgroundSurface)
        ) {
            if (item.imageUrl != null) {
                AsyncImage(
                    model = item.imageUrl,
                    contentDescription = item.title,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
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
                        contentDescription = null,
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
                        .padding(PlexSpacing.XS),
                    shape = RoundedCornerShape(PlexCorners.XS),
                    color = Color.Black.copy(alpha = 0.7f)
                ) {
                    Text(
                        text = duration,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextPrimary,
                        modifier = Modifier.padding(horizontal = PlexSpacing.XS, vertical = 2.dp)
                    )
                }
            }
        }
        
        if (showTitle) {
            Spacer(modifier = Modifier.height(PlexSpacing.SM))
            
            Text(
                text = item.title,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            if (showSubtitle && item.subtitle != null) {
                Text(
                    text = item.subtitle,
                    style = PlexTypography.BodySmall,
                    color = PlexColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

// =============================================================================
// WIDE CARD (Video Thumbnails)
// =============================================================================

/**
 * Wide card with 16:9 aspect ratio
 * Used for video thumbnails, episodes, chapters
 */
@Composable
fun PlexWideCard(
    item: PlexMediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    width: Dp = PlexSizes.CardXLarge,
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
            .aspectRatio(PlexSizes.WidescreenAspectRatio)
            .scale(scale)
            .shadow(PlexElevation.SM, RoundedCornerShape(PlexCorners.Card))
            .clip(RoundedCornerShape(PlexCorners.Card))
            .background(PlexColors.BackgroundSurface)
            .clickable(
                interactionSource = interactionSource,
                indication = null,
                onClick = onClick
            )
    ) {
        // Backdrop image
        if (item.backdropUrl != null || item.imageUrl != null) {
            AsyncImage(
                model = item.backdropUrl ?: item.imageUrl,
                contentDescription = item.title,
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop
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
                            PlexColors.Background.copy(alpha = 0.8f)
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
                    .padding(PlexSpacing.MD)
            ) {
                Text(
                    text = item.title,
                    style = PlexTypography.TitleSmall,
                    color = PlexColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                item.subtitle?.let { subtitle ->
                    Spacer(modifier = Modifier.height(PlexSpacing.XXS))
                    Text(
                        text = subtitle,
                        style = PlexTypography.BodySmall,
                        color = PlexColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
        }
        
        // Progress bar
        if (item.progress > 0) {
            LinearProgressIndicator(
                progress = { item.progress },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(PlexSizes.ProgressHeight)
                    .align(Alignment.BottomCenter),
                color = PlexColors.AccentPrimary,
                trackColor = PlexColors.ProgressBackground
            )
        }
        
        // Duration badge
        item.duration?.let { duration ->
            Surface(
                modifier = Modifier
                    .align(Alignment.TopEnd)
                    .padding(PlexSpacing.SM),
                shape = RoundedCornerShape(PlexCorners.XS),
                color = Color.Black.copy(alpha = 0.7f)
            ) {
                Text(
                    text = duration,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextPrimary,
                    modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = PlexSpacing.XXS)
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

// =============================================================================
// HERO CARD (Featured Content)
// =============================================================================

/**
 * Large hero card for featured content
 * Spans full width with backdrop and overlay info
 */
@Composable
fun PlexHeroCard(
    item: PlexMediaItem,
    onClick: () -> Unit,
    onPlayClick: (() -> Unit)? = null,
    modifier: Modifier = Modifier,
    height: Dp = PlexSizes.HeroHeight
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
                model = item.backdropUrl ?: item.imageUrl,
                contentDescription = item.title,
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop
            )
        } else {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(
                        Brush.linearGradient(
                            colors = listOf(
                                item.mediaType.color.copy(alpha = 0.3f),
                                PlexColors.Background
                            )
                        )
                    )
            )
        }
        
        // Gradient overlays
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(PlexColors.Gradients.heroOverlay)
        )
        
        // Content
        Column(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(PlexSpacing.XL)
                .fillMaxWidth(0.6f)
        ) {
            // Media type badge
            Surface(
                shape = RoundedCornerShape(PlexCorners.XS),
                color = item.mediaType.color.copy(alpha = 0.2f)
            ) {
                Row(
                    modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = PlexSpacing.XXS),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.XS)
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = null,
                        modifier = Modifier.size(PlexSizes.IconXS),
                        tint = item.mediaType.color
                    )
                    Text(
                        text = item.mediaType.name.replace("_", " "),
                        style = PlexTypography.LabelSmall,
                        color = item.mediaType.color
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.SM))
            
            // Title
            Text(
                text = item.title,
                style = PlexTypography.Hero,
                color = PlexColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis
            )
            
            // Metadata row
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
            ) {
                item.year?.let { year ->
                    Text(
                        text = year.toString(),
                        style = PlexTypography.BodyMedium,
                        color = PlexColors.TextSecondary
                    )
                }
                
                item.rating?.let { rating ->
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.Star,
                            contentDescription = null,
                            modifier = Modifier.size(PlexSizes.IconSM),
                            tint = PlexColors.Warning
                        )
                        Spacer(modifier = Modifier.width(PlexSpacing.XXS))
                        Text(
                            text = "%.1f".format(rating),
                            style = PlexTypography.BodyMedium,
                            color = PlexColors.TextSecondary
                        )
                    }
                }
                
                item.duration?.let { duration ->
                    Text(
                        text = duration,
                        style = PlexTypography.BodyMedium,
                        color = PlexColors.TextSecondary
                    )
                }
            }
            
            // Subtitle/Description
            item.subtitle?.let { subtitle ->
                Spacer(modifier = Modifier.height(PlexSpacing.SM))
                Text(
                    text = subtitle,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextSecondary,
                    maxLines = 3,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            // Action buttons
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
            
            Row(horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)) {
                // Play button
                if (onPlayClick != null) {
                    Button(
                        onClick = onPlayClick,
                        colors = ButtonDefaults.buttonColors(
                            containerColor = PlexColors.AccentPrimary,
                            contentColor = PlexColors.TextOnAccent
                        ),
                        shape = RoundedCornerShape(PlexCorners.Button)
                    ) {
                        Icon(
                            imageVector = Icons.Default.PlayArrow,
                            contentDescription = null,
                            modifier = Modifier.size(PlexSizes.IconMD)
                        )
                        Spacer(modifier = Modifier.width(PlexSpacing.SM))
                        Text(
                            text = if (item.progress > 0) "Continue" else "Play",
                            style = PlexTypography.LabelLarge
                        )
                    }
                }
                
                // More info button
                OutlinedButton(
                    onClick = onClick,
                    colors = ButtonDefaults.outlinedButtonColors(
                        contentColor = PlexColors.TextPrimary
                    ),
                    border = BorderStroke(1.dp, PlexColors.Border),
                    shape = RoundedCornerShape(PlexCorners.Button)
                ) {
                    Icon(
                        imageVector = Icons.Default.Info,
                        contentDescription = null,
                        modifier = Modifier.size(PlexSizes.IconMD)
                    )
                    Spacer(modifier = Modifier.width(PlexSpacing.SM))
                    Text(
                        text = "More Info",
                        style = PlexTypography.LabelLarge
                    )
                }
            }
        }
        
        // Progress bar
        if (item.progress > 0) {
            LinearProgressIndicator(
                progress = { item.progress },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(PlexSizes.ProgressHeightThick)
                    .align(Alignment.BottomCenter),
                color = PlexColors.AccentPrimary,
                trackColor = PlexColors.ProgressBackground
            )
        }
    }
}

// =============================================================================
// LIST ITEM (Compact View)
// =============================================================================

/**
 * Compact list item for dense views
 */
@Composable
fun PlexListItem(
    item: PlexMediaItem,
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
        color = if (isHovered) PlexColors.BackgroundHover else Color.Transparent,
        shape = RoundedCornerShape(PlexCorners.SM)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(PlexSpacing.SM),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Thumbnail
            if (showImage) {
                Box(
                    modifier = Modifier
                        .size(PlexSizes.ThumbnailSmall)
                        .clip(RoundedCornerShape(PlexCorners.XS))
                        .background(PlexColors.BackgroundSurface)
                ) {
                    if (item.imageUrl != null) {
                        AsyncImage(
                            model = item.imageUrl,
                            contentDescription = null,
                            modifier = Modifier.fillMaxSize(),
                            contentScale = ContentScale.Crop
                        )
                    } else {
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = null,
                            modifier = Modifier
                                .size(24.dp)
                                .align(Alignment.Center),
                            tint = item.mediaType.color.copy(alpha = 0.5f)
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(PlexSpacing.MD))
            }
            
            // Content
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = item.title,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                item.subtitle?.let { subtitle ->
                    Text(
                        text = subtitle,
                        style = PlexTypography.BodySmall,
                        color = PlexColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Progress bar
                if (showProgress && item.progress > 0) {
                    Spacer(modifier = Modifier.height(PlexSpacing.XS))
                    LinearProgressIndicator(
                        progress = { item.progress },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(2.dp),
                        color = PlexColors.AccentPrimary,
                        trackColor = PlexColors.ProgressBackground
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
fun <T> PlexCarouselRow(
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
                .padding(horizontal = PlexSpacing.ScreenHorizontal),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = title,
                style = PlexTypography.TitleMedium,
                color = PlexColors.TextPrimary
            )
            
            if (onSeeAllClick != null) {
                TextButton(onClick = onSeeAllClick) {
                    Text(
                        text = "See All",
                        style = PlexTypography.LabelMedium,
                        color = PlexColors.AccentPrimary
                    )
                    Icon(
                        imageVector = Icons.Default.ChevronRight,
                        contentDescription = null,
                        modifier = Modifier.size(PlexSizes.IconSM),
                        tint = PlexColors.AccentPrimary
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.height(PlexSpacing.MD))
        
        // Items
        LazyRow(
            contentPadding = PaddingValues(horizontal = PlexSpacing.ScreenHorizontal),
            horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
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
    item: PlexMediaItem,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.End,
        verticalArrangement = Arrangement.spacedBy(PlexSpacing.XXS)
    ) {
        if (item.isNew) {
            BadgeChip(text = "NEW", color = PlexColors.AccentPrimary)
        }
        
        if (item.isUnwatched) {
            Box(
                modifier = Modifier
                    .size(12.dp)
                    .clip(CircleShape)
                    .background(PlexColors.AccentPrimary)
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
        shape = RoundedCornerShape(PlexCorners.XS),
        color = color.copy(alpha = 0.9f)
    ) {
        Row(
            modifier = Modifier.padding(horizontal = PlexSpacing.XS, vertical = 2.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(2.dp)
        ) {
            if (icon != null) {
                Icon(
                    imageVector = icon,
                    contentDescription = null,
                    modifier = Modifier.size(10.dp),
                    tint = Color.White
                )
            }
            Text(
                text = text,
                style = PlexTypography.Badge,
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
        shape = RoundedCornerShape(PlexCorners.XS),
        color = Color.Black.copy(alpha = 0.7f)
    ) {
        Row(
            modifier = Modifier.padding(horizontal = PlexSpacing.XS, vertical = 2.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = Icons.Default.Star,
                contentDescription = null,
                modifier = Modifier.size(12.dp),
                tint = PlexColors.Warning
            )
            Spacer(modifier = Modifier.width(2.dp))
            Text(
                text = "%.1f".format(rating),
                style = PlexTypography.LabelSmall,
                color = PlexColors.TextPrimary
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
            .shadow(PlexElevation.MD, CircleShape),
        shape = CircleShape,
        color = PlexColors.AccentPrimary,
        onClick = onClick
    ) {
        Icon(
            imageVector = Icons.Default.PlayArrow,
            contentDescription = "Play",
            modifier = Modifier
                .padding(size * 0.2f)
                .fillMaxSize(),
            tint = PlexColors.TextOnAccent
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
fun PlexPosterCardSkeleton(
    modifier: Modifier = Modifier,
    width: Dp = PlexSizes.CardMedium
) {
    val shimmerColors = listOf(
        PlexColors.BackgroundElevated,
        PlexColors.BackgroundSurface,
        PlexColors.BackgroundElevated
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
                .aspectRatio(PlexSizes.PosterAspectRatio)
                .clip(RoundedCornerShape(PlexCorners.Card))
                .background(brush)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        // Title placeholder
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(16.dp)
                .clip(RoundedCornerShape(PlexCorners.XS))
                .background(brush)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.XS))
        
        // Subtitle placeholder
        Box(
            modifier = Modifier
                .fillMaxWidth(0.7f)
                .height(12.dp)
                .clip(RoundedCornerShape(PlexCorners.XS))
                .background(brush)
        )
    }
}
