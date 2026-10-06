package com.universalmedialibrary.ui.media.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.Spring
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.spring
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.scaleIn
import androidx.compose.animation.scaleOut
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsHoveredAsState
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Image
import androidx.compose.material.icons.filled.Info
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.components.accessibleClickable
import com.universalmedialibrary.ui.media.theme.MediaColors
import com.universalmedialibrary.ui.media.theme.MediaCorners
import com.universalmedialibrary.ui.media.theme.MediaElevation
import com.universalmedialibrary.ui.media.theme.MediaSizes
import com.universalmedialibrary.ui.media.theme.MediaSpacing
import com.universalmedialibrary.ui.media.theme.MediaTypography

/**
 * Layout variants for the unified canonical media card
 */
enum class CanonicalCardVariant {
    POSTER,
    SQUARE,
    WIDE,
    HERO,
    COMPACT_LIST
}

/**
 * Canonical media card component unifying poster, square, wide, hero, and compact list
 * layout variants across all media browsing screens.
 */
@Composable
fun CanonicalMediaCard(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    variant: CanonicalCardVariant = CanonicalCardVariant.POSTER,
    onPlayClick: (() -> Unit)? = null,
    showProgress: Boolean = true,
    showBadges: Boolean = true,
    showOverlayInfo: Boolean = true,
    cardWidth: Dp = when (variant) {
        CanonicalCardVariant.POSTER -> MediaSizes.CardMedium
        CanonicalCardVariant.SQUARE -> MediaSizes.CardMedium
        CanonicalCardVariant.WIDE -> MediaSizes.CardXLarge
        CanonicalCardVariant.HERO -> Dp.Unspecified
        CanonicalCardVariant.COMPACT_LIST -> Dp.Unspecified
    }
) {
    when (variant) {
        CanonicalCardVariant.POSTER -> PosterLayout(item, onClick, modifier, cardWidth, showProgress, showBadges)
        CanonicalCardVariant.SQUARE -> SquareLayout(item, onClick, modifier, cardWidth, showOverlayInfo)
        CanonicalCardVariant.WIDE -> WideLayout(item, onClick, modifier, cardWidth, showOverlayInfo, showProgress)
        CanonicalCardVariant.HERO -> HeroLayout(item, onClick, onPlayClick, modifier)
        CanonicalCardVariant.COMPACT_LIST -> CompactListLayout(item, onClick, modifier, showProgress)
    }
}

/**
 * Convenience overload for direct title/image card parameters for backward compatibility.
 */
@Composable
fun CanonicalMediaCard(
    title: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    subtitle: String? = null,
    imageUrl: String? = null,
    progress: Float? = null,
    badge: String? = null,
    mediaType: String? = null,
    variant: CanonicalCardVariant = CanonicalCardVariant.POSTER
) {
    val mappedMediaType = mediaType?.let { MediaType.fromRouteName(it) } ?: MediaType.UNKNOWN
    val item = MediaItem(
        id = title,
        title = title,
        subtitle = subtitle,
        imageUrl = imageUrl,
        progress = progress ?: 0f,
        mediaType = mappedMediaType,
        isNew = badge == "NEW"
    )
    CanonicalMediaCard(
        item = item,
        onClick = onClick,
        modifier = modifier,
        variant = variant,
        showProgress = progress != null
    )
}

// =============================================================================
// LAYOUT IMPLEMENTATIONS
// =============================================================================

@Composable
private fun PosterLayout(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier,
    width: Dp,
    showProgress: Boolean,
    showBadges: Boolean
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

    val widthModifier = if (width != Dp.Unspecified) Modifier.width(width) else Modifier

    Column(
        modifier = modifier
            .then(widthModifier)
            .scale(scale)
            .accessibleClickable(
                interactionSource = interactionSource,
                shape = RoundedCornerShape(MediaCorners.Card),
                onClick = onClick
            )
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(MediaSizes.PosterAspectRatio)
                .shadow(MediaElevation.SM, RoundedCornerShape(MediaCorners.Card))
                .clip(RoundedCornerShape(MediaCorners.Card))
                .background(MaterialTheme.colorScheme.surfaceVariant)
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
                            Brush.linearGradient(
                                colors = listOf(
                                    item.mediaType.color.copy(alpha = 0.3f),
                                    MaterialTheme.colorScheme.surfaceVariant
                                )
                            )
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = item.title,
                        modifier = Modifier.size(48.dp),
                        tint = item.mediaType.color.copy(alpha = 0.6f)
                    )
                }
            }

            if (showBadges) {
                CardBadges(
                    item = item,
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(MediaSpacing.XS)
                )
            }

            if (item.rating != null) {
                RatingBadge(
                    rating = item.rating,
                    modifier = Modifier
                        .align(Alignment.BottomStart)
                        .padding(MediaSpacing.XS)
                )
            }

            if (isHovered) {
                Box(modifier = Modifier.align(Alignment.Center)) {
                    PlayButton(onClick = onClick)
                }
            }

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
        }

        Spacer(modifier = Modifier.height(MediaSpacing.SM))

        Text(
            text = item.title,
            style = MediaTypography.BodyMedium,
            color = MaterialTheme.colorScheme.onSurface,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis,
            fontWeight = FontWeight.Medium
        )

        item.subtitle?.let { subtitle ->
            Spacer(modifier = Modifier.height(MediaSpacing.XXS))
            Text(
                text = subtitle,
                style = MediaTypography.BodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

@Composable
private fun SquareLayout(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier,
    size: Dp,
    showTitle: Boolean
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
        label = "square_scale"
    )

    val sizeModifier = if (size != Dp.Unspecified) Modifier.width(size) else Modifier

    Column(
        modifier = modifier
            .then(sizeModifier)
            .scale(scale)
            .accessibleClickable(
                interactionSource = interactionSource,
                shape = RoundedCornerShape(MediaCorners.Card),
                onClick = onClick
            )
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(1f)
                .shadow(MediaElevation.SM, RoundedCornerShape(MediaCorners.Card))
                .clip(RoundedCornerShape(MediaCorners.Card))
                .background(MaterialTheme.colorScheme.surfaceVariant)
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
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = item.title,
                        modifier = Modifier.size(48.dp),
                        tint = item.mediaType.color.copy(alpha = 0.6f)
                    )
                }
            }

            if (isHovered) {
                Box(modifier = Modifier.align(Alignment.Center)) {
                    PlayButton(onClick = onClick)
                }
            }
        }

        if (showTitle) {
            Spacer(modifier = Modifier.height(MediaSpacing.SM))

            Text(
                text = item.title,
                style = MediaTypography.BodyMedium,
                color = MaterialTheme.colorScheme.onSurface,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )

            item.subtitle?.let { subtitle ->
                Text(
                    text = subtitle,
                    style = MediaTypography.BodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

@Composable
private fun WideLayout(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier,
    width: Dp,
    showOverlayInfo: Boolean,
    showProgress: Boolean
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()

    val widthModifier = if (width != Dp.Unspecified) Modifier.width(width) else Modifier

    Box(
        modifier = modifier
            .then(widthModifier)
            .aspectRatio(MediaSizes.WidescreenAspectRatio)
            .shadow(MediaElevation.SM, RoundedCornerShape(MediaCorners.Card))
            .clip(RoundedCornerShape(MediaCorners.Card))
            .background(MaterialTheme.colorScheme.surfaceVariant)
            .accessibleClickable(
                interactionSource = interactionSource,
                shape = RoundedCornerShape(MediaCorners.Card),
                onClick = onClick
            )
    ) {
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

        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent,
                            MaterialTheme.colorScheme.scrim.copy(alpha = 0.8f)
                        ),
                        startY = 0.3f
                    )
                )
        )

        if (showOverlayInfo) {
            Column(
                modifier = Modifier
                    .align(Alignment.BottomStart)
                    .padding(MediaSpacing.MD)
            ) {
                Text(
                    text = item.title,
                    style = MediaTypography.TitleSmall,
                    color = Color.White,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                item.subtitle?.let { subtitle ->
                    Spacer(modifier = Modifier.height(MediaSpacing.XXS))
                    Text(
                        text = subtitle,
                        style = MediaTypography.BodySmall,
                        color = Color.White.copy(alpha = 0.8f),
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
        }

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
    }
}

@Composable
private fun HeroLayout(
    item: MediaItem,
    onClick: () -> Unit,
    onPlayClick: (() -> Unit)?,
    modifier: Modifier
) {
    Box(
        modifier = modifier
            .fillMaxWidth()
            .height(MediaSizes.HeroHeight)
            .clickable(onClick = onClick)
    ) {
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

        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent,
                            MaterialTheme.colorScheme.background
                        )
                    )
                )
        )

        Column(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(MediaSpacing.XL)
                .fillMaxWidth(0.7f)
        ) {
            Text(
                text = item.title,
                style = MediaTypography.Hero,
                color = MaterialTheme.colorScheme.onBackground,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis
            )

            item.subtitle?.let { subtitle ->
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Text(
                    text = subtitle,
                    style = MediaTypography.BodyMedium,
                    color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.8f),
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
            }

            Spacer(modifier = Modifier.height(MediaSpacing.LG))

            Row(horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)) {
                if (onPlayClick != null) {
                    Button(
                        onClick = onPlayClick,
                        colors = ButtonDefaults.buttonColors(
                            containerColor = MaterialTheme.colorScheme.primary,
                            contentColor = MaterialTheme.colorScheme.onPrimary
                        )
                    ) {
                        Icon(Icons.Default.PlayArrow, contentDescription = "Play")
                        Spacer(modifier = Modifier.width(MediaSpacing.SM))
                        Text("Play")
                    }
                }

                OutlinedButton(onClick = onClick) {
                    Icon(Icons.Default.Info, contentDescription = "Info")
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    Text("Info")
                }
            }
        }
    }
}

@Composable
private fun CompactListLayout(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier,
    showProgress: Boolean
) {
    MediaListItem(
        item = item,
        onClick = onClick,
        modifier = modifier,
        showProgress = showProgress
    )
}
