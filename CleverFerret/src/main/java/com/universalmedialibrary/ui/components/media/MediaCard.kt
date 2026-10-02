package com.universalmedialibrary.ui.components.media

import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsHoveredAsState
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.TrendingUp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Shape
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import coil.compose.AsyncImage
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.ContentFilterHelper
import com.universalmedialibrary.services.ContentStatus
import com.universalmedialibrary.ui.components.AppCornerRadius
import com.universalmedialibrary.ui.components.AppElevation
import com.universalmedialibrary.ui.components.AppSizes
import com.universalmedialibrary.ui.components.AppSpacing
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.components.pin.PinChallenge
import com.universalmedialibrary.ui.icons.PhosphorIcons
import com.universalmedialibrary.ui.theme.*

/**
 * Consolidated Library Data Models
 */
data class LibraryItem(
    val id: Int = 0,
    val name: String = "",
    val type: LibraryType = LibraryType.BOOK,
    val itemCount: Int = 0,
    val isActive: Boolean = true,
    val lastSyncTime: String = "Updated today"
)

enum class LibraryType {
    BOOK, MOVIE, MUSIC, PODCAST, MAGAZINE, DOCUMENT
}

/**
 * Structured Data Model for MediaCard
 */
data class MediaCardData(
    val id: String? = null,
    val title: String = "",
    val subtitle: String? = null,
    val description: String? = null,
    val imageUrl: String? = null,
    val progress: Float? = null,
    val rating: String? = null,
    val badge: String? = null,
    val mediaType: String? = null,
    val itemCount: Int? = null,
    val isActive: Boolean = false,
    val lastSyncTime: String? = null,
    val value: String? = null,
    val label: String? = null,
    val trend: String? = null,
    val trendUp: Boolean = true,
    val icon: ImageVector? = null,
    val actionLabel: String? = null,
    val contentRating: String? = null,
    val isRestricted: Boolean = false,
    val isLocked: Boolean = false,
    val isBlocked: Boolean = false
)

enum class MediaCardStyle {
    STANDARD,      // Poster/Media card
    GRID_ITEM,     // Aspect ratio item
    LIBRARY,       // Library card style
    STATS,         // Statistics card
    FEATURE,       // Feature card with action
    STATE_ERROR,   // Error state card
    STATE_LOADING, // Loading state card
    STATE_EMPTY,   // Empty state card
    BANNER,        // Info banner card
    SECTION_HEADER,// Section header
    CUSTOM         // Custom content slot
}

enum class MediaCardDecoration {
    NONE,
    METALLIC,          // Metallic gradient & shimmer
    GLASS,             // Glass effect
    ELEVATED_LIGHT,    // Dynamic spotlight lighting
    EMBOSSED,          // Embossed 3D effect
    PATTERNED,         // Geometric pattern background
    GLOWING,           // Crystal glow effect
    GRADIENT_OVERLAY,  // Subtle gradient overlay
    ART_DECO           // Ancient Architect stepped borders & corner decorations
}

/**
 * Primary Unified MediaCard Composable
 */
@Composable
fun MediaCard(
    modifier: Modifier = Modifier,
    data: MediaCardData = MediaCardData(),
    style: MediaCardStyle = MediaCardStyle.STANDARD,
    decoration: MediaCardDecoration = MediaCardDecoration.NONE,
    elevation: Dp = AppElevation.Small,
    shape: Shape = RoundedCornerShape(AppCornerRadius.Medium),
    onClick: (() -> Unit)? = null,
    onActionClick: (() -> Unit)? = null,
    contentFilterHelper: ContentFilterHelper? = null,
    parentalControlsSettings: ParentalControlsSettings? = null,
    content: (@Composable ColumnScope.() -> Unit)? = null
) {
    when (style) {
        MediaCardStyle.STANDARD -> StandardMediaCardContent(
            data = data,
            decoration = decoration,
            elevation = elevation,
            shape = shape,
            onClick = onClick,
            modifier = modifier
        )
        MediaCardStyle.GRID_ITEM -> GridMediaCardContent(
            data = data,
            onClick = onClick,
            modifier = modifier
        )
        MediaCardStyle.LIBRARY -> LibraryMediaCardContent(
            data = data,
            onClick = onClick,
            modifier = modifier
        )
        MediaCardStyle.STATS -> StatsCardContent(
            data = data,
            onClick = onClick,
            modifier = modifier
        )
        MediaCardStyle.FEATURE -> FeatureCardContent(
            data = data,
            onActionClick = onActionClick ?: onClick ?: {},
            modifier = modifier
        )
        MediaCardStyle.STATE_ERROR -> ErrorStateCardContent(
            data = data,
            onRetry = onActionClick ?: onClick ?: {},
            modifier = modifier
        )
        MediaCardStyle.STATE_LOADING -> LoadingStateCardContent(
            data = data,
            modifier = modifier
        )
        MediaCardStyle.STATE_EMPTY -> EmptyStateCardContent(
            data = data,
            onActionClick = onActionClick ?: onClick ?: {},
            modifier = modifier
        )
        MediaCardStyle.BANNER -> BannerCardContent(
            data = data,
            modifier = modifier
        )
        MediaCardStyle.SECTION_HEADER -> SectionHeaderContent(
            title = data.title,
            actionLabel = data.actionLabel,
            onActionClick = onActionClick,
            modifier = modifier
        )
        MediaCardStyle.CUSTOM -> CustomCardContent(
            decoration = decoration,
            elevation = elevation,
            shape = shape,
            onClick = onClick,
            modifier = modifier,
            content = content ?: {}
        )
    }
}

// =============================================================================
// CONVENIENCE COMPOSABLE OVERLOADS & HELPER CALLS
// =============================================================================

@Composable
fun MediaCard(
    library: LibraryItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    MediaCard(
        data = MediaCardData(
            id = library.id.toString(),
            title = library.name,
            subtitle = "${library.type.name.lowercase().replaceFirstChar { if (it.isLowerCase()) it.titlecase() else it.toString() }} library",
            itemCount = library.itemCount,
            isActive = library.isActive,
            lastSyncTime = library.lastSyncTime,
            mediaType = library.type.name
        ),
        style = MediaCardStyle.LIBRARY,
        onClick = onClick,
        modifier = modifier
    )
}

@Composable
fun MediaCard(
    mediaItem: MediaItem,
    onClick: () -> Unit,
    contentFilterHelper: ContentFilterHelper,
    parentalControlsSettings: ParentalControlsSettings,
    modifier: Modifier = Modifier,
    isGrid: Boolean = false
) {
    var contentStatus by remember { mutableStateOf<ContentStatus?>(null) }
    var showPinDialog by remember { mutableStateOf(false) }

    LaunchedEffect(mediaItem.id, mediaItem.contentRating, mediaItem.mediaType) {
        contentStatus = contentFilterHelper.getContentStatus(
            rating = mediaItem.contentRating,
            mediaType = mediaItem.mediaType
        )
    }

    if (contentStatus == ContentStatus.Hidden) {
        return
    }

    val cardData = MediaCardData(
        id = mediaItem.id.toString(),
        title = mediaItem.title ?: "Untitled",
        subtitle = mediaItem.author ?: mediaItem.artist ?: mediaItem.mediaType ?: "",
        imageUrl = mediaItem.coverUrl ?: mediaItem.thumbnailUrl ?: mediaItem.artworkUrl,
        contentRating = mediaItem.contentRating,
        mediaType = mediaItem.mediaType,
        isLocked = contentStatus == ContentStatus.Locked,
        isBlocked = contentStatus == ContentStatus.Blocked
    )

    if (isGrid) {
        MediaCard(
            data = cardData,
            style = MediaCardStyle.GRID_ITEM,
            onClick = {
                when (contentStatus) {
                    ContentStatus.Locked -> showPinDialog = true
                    ContentStatus.Blocked -> {}
                    else -> onClick()
                }
            },
            modifier = modifier
        )
    } else {
        Card(
            modifier = modifier
                .fillMaxWidth()
                .clickable {
                    when (contentStatus) {
                        ContentStatus.Locked -> showPinDialog = true
                        ContentStatus.Blocked -> {}
                        else -> onClick()
                    }
                }
        ) {
            Column(modifier = Modifier.padding(AppSpacing.CardPadding)) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = cardData.title,
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            maxLines = 2,
                            overflow = TextOverflow.Ellipsis
                        )
                        if (cardData.subtitle?.isNotEmpty() == true) {
                            Text(
                                text = cardData.subtitle,
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }

                    if (cardData.isLocked) {
                        Icon(
                            Icons.Default.Lock,
                            contentDescription = "PIN Required",
                            tint = MaterialTheme.colorScheme.error,
                            modifier = Modifier.size(AppSizes.IconMedium)
                        )
                    } else if (cardData.isBlocked) {
                        Icon(
                            Icons.Default.VisibilityOff,
                            contentDescription = "Blocked",
                            tint = MaterialTheme.colorScheme.error,
                            modifier = Modifier.size(AppSizes.IconMedium)
                        )
                    }
                }

                if (cardData.contentRating != null) {
                    Spacer(modifier = Modifier.height(AppSpacing.ItemSpacing))
                    ContentRatingBadge(
                        rating = cardData.contentRating,
                        isRestricted = cardData.isLocked || cardData.isBlocked
                    )
                }

                if (cardData.isBlocked) {
                    Spacer(modifier = Modifier.height(AppSpacing.ItemSpacing))
                    Text(
                        text = "Parental controls are blocking this item.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.error
                    )
                }
            }
        }
    }

    if (showPinDialog) {
        PinAccessDialog(
            challenge = PinChallenge(
                title = mediaItem.title ?: "Content",
                rating = mediaItem.contentRating,
                mediaType = mediaItem.mediaType,
                description = "Enter your PIN to unlock this item."
            ),
            onDismiss = { showPinDialog = false },
            onAccessGranted = {
                showPinDialog = false
                onClick()
            },
            verifyPin = parentalControlsSettings::verifyPin
        )
    }
}

// =============================================================================
// INTERNAL CONTENT IMPLEMENTATIONS
// =============================================================================

@Composable
private fun StandardMediaCardContent(
    data: MediaCardData,
    decoration: MediaCardDecoration,
    elevation: Dp,
    shape: Shape,
    onClick: (() -> Unit)?,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .width(AppSizes.CardWidth)
            .applyDecoration(decoration, elevation, shape)
            .then(
                if (onClick != null) Modifier.clickable { onClick() } else Modifier
            ),
        shape = shape,
        elevation = CardDefaults.cardElevation(defaultElevation = elevation)
    ) {
        Column {
            Box {
                if (data.imageUrl != null) {
                    AsyncImage(
                        model = data.imageUrl,
                        contentDescription = data.title,
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(AppSizes.CardImageHeight),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Surface(
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(AppSizes.CardImageHeight),
                        color = MaterialTheme.colorScheme.surfaceVariant
                    ) {
                        Box(contentAlignment = Alignment.Center) {
                            Icon(
                                Icons.Default.Image,
                                contentDescription = "Media image",
                                modifier = Modifier.size(AppSizes.IconHuge),
                                tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f)
                            )
                        }
                    }
                }

                if (data.badge != null) {
                    Surface(
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(AppSpacing.Small),
                        color = MaterialTheme.colorScheme.primaryContainer,
                        shape = RoundedCornerShape(AppCornerRadius.ExtraSmall)
                    ) {
                        Text(
                            text = data.badge,
                            modifier = Modifier.padding(horizontal = AppSpacing.Small, vertical = AppSpacing.ExtraSmall),
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }

                if (data.mediaType != null) {
                    Surface(
                        modifier = Modifier
                            .align(Alignment.BottomStart)
                            .padding(AppSpacing.Small),
                        color = MaterialTheme.colorScheme.surface.copy(alpha = 0.9f),
                        shape = CircleShape
                    ) {
                        Box(
                            modifier = Modifier.padding(AppSpacing.ExtraSmall),
                            contentAlignment = Alignment.Center
                        ) {
                            Icon(
                                getMediaTypeIcon(data.mediaType),
                                contentDescription = "Media type",
                                modifier = Modifier.size(AppSizes.IconSmall),
                                tint = MaterialTheme.colorScheme.primary
                            )
                        }
                    }
                }
            }

            Column(modifier = Modifier.padding(AppSpacing.CardPadding)) {
                Text(
                    text = data.title,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                if (data.subtitle != null) {
                    Spacer(modifier = Modifier.height(AppSpacing.ExtraSmall))
                    Text(
                        text = data.subtitle,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }

                if (data.progress != null) {
                    Spacer(modifier = Modifier.height(AppSpacing.Small))
                    LinearProgressIndicator(
                        progress = { data.progress.coerceIn(0f, 1f) },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(AppSpacing.ExtraSmall)
                            .clip(RoundedCornerShape(AppCornerRadius.ExtraSmall)),
                        color = MaterialTheme.colorScheme.primary,
                        trackColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun GridMediaCardContent(
    data: MediaCardData,
    onClick: (() -> Unit)?,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .aspectRatio(0.7f)
            .then(if (onClick != null) Modifier.clickable { onClick() } else Modifier),
        shape = RoundedCornerShape(AppCornerRadius.Medium),
        elevation = CardDefaults.cardElevation(defaultElevation = AppElevation.Small)
    ) {
        Box(modifier = Modifier.fillMaxSize()) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(AppSpacing.Small),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                if (data.isLocked || data.isBlocked) {
                    Icon(
                        if (data.isLocked) Icons.Default.Lock else Icons.Default.VisibilityOff,
                        contentDescription = "Restricted",
                        tint = MaterialTheme.colorScheme.error,
                        modifier = Modifier
                            .size(AppSizes.IconLarge)
                            .align(Alignment.End)
                    )
                } else {
                    Spacer(modifier = Modifier.height(AppSizes.IconLarge))
                }

                Column {
                    Text(
                        text = data.title,
                        style = MaterialTheme.typography.bodyMedium,
                        fontWeight = FontWeight.Medium,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )

                    if (data.contentRating != null) {
                        Spacer(modifier = Modifier.height(AppSpacing.ExtraSmall))
                        ContentRatingBadge(
                            rating = data.contentRating,
                            isRestricted = data.isLocked || data.isBlocked
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun LibraryMediaCardContent(
    data: MediaCardData,
    onClick: (() -> Unit)?,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .height(220.dp)
            .then(if (onClick != null) Modifier.clickable { onClick() } else Modifier),
        shape = RoundedCornerShape(AppCornerRadius.Small),
        elevation = CardDefaults.cardElevation(defaultElevation = AppElevation.Medium),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface),
        border = BorderStroke(1.dp, MaterialTheme.colorScheme.outlineVariant)
    ) {
        Column {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(120.dp)
                    .background(MaterialTheme.colorScheme.surfaceVariant),
                contentAlignment = Alignment.Center
            ) {
                val libType = try {
                    LibraryType.valueOf(data.mediaType ?: "BOOK")
                } catch (e: Exception) {
                    LibraryType.BOOK
                }
                Icon(
                    imageVector = getLibraryIcon(libType),
                    contentDescription = "${data.mediaType} library",
                    modifier = Modifier.size(AppSizes.AvatarMedium),
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(AppSpacing.ListItemHorizontalPadding)
                        .background(
                            MaterialTheme.colorScheme.scrim.copy(alpha = 0.5f),
                            RoundedCornerShape(AppCornerRadius.ExtraSmall)
                        )
                        .padding(horizontal = AppSpacing.Small, vertical = AppSpacing.ExtraSmall)
                ) {
                    Text(
                        text = "${data.itemCount ?: 0} items",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurface
                    )
                }

                if (data.isActive) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.TopStart)
                            .padding(AppSpacing.ListItemHorizontalPadding)
                            .size(AppSpacing.ItemSpacing)
                            .background(MaterialTheme.colorScheme.primary, CircleShape)
                    )
                }
            }

            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(AppSpacing.CardPadding)
            ) {
                Text(
                    text = data.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onSurface
                )

                Spacer(modifier = Modifier.height(AppSpacing.ExtraSmall))

                Text(
                    text = data.subtitle ?: "",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun StatsCardContent(
    data: MediaCardData,
    onClick: (() -> Unit)?,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.then(if (onClick != null) Modifier.clickable { onClick() } else Modifier),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(AppSpacing.CardPadding),
            horizontalArrangement = Arrangement.spacedBy(AppSpacing.ItemSpacing),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = data.icon ?: Icons.Default.Analytics,
                contentDescription = data.label ?: "Stat",
                modifier = Modifier.size(AppSizes.IconMedium),
                tint = MaterialTheme.colorScheme.onPrimaryContainer
            )

            Column {
                Text(
                    text = data.value ?: "",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )

                Text(
                    text = data.label ?: "",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
        }
    }
}

@Composable
private fun FeatureCardContent(
    data: MediaCardData,
    onActionClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(AppSpacing.CardPadding),
            verticalArrangement = Arrangement.spacedBy(AppSpacing.CardPadding)
        ) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(AppSpacing.CardPadding),
                verticalAlignment = Alignment.Top
            ) {
                Surface(
                    shape = RoundedCornerShape(AppCornerRadius.Medium),
                    color = MaterialTheme.colorScheme.primary
                ) {
                    Box(
                        modifier = Modifier.padding(AppSpacing.ItemSpacing),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            data.icon ?: Icons.Default.Star,
                            contentDescription = data.title,
                            tint = MaterialTheme.colorScheme.onPrimary,
                            modifier = Modifier.size(AppSizes.IconLarge)
                        )
                    }
                }

                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = data.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    if (data.description != null) {
                        Spacer(modifier = Modifier.height(AppSpacing.ExtraSmall))
                        Text(
                            text = data.description,
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                        )
                    }
                }
            }

            Button(
                onClick = onActionClick,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(data.actionLabel ?: "Get Started")
            }
        }
    }
}

@Composable
private fun ErrorStateCardContent(
    data: MediaCardData,
    onRetry: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .padding(AppSpacing.CardPadding),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(AppSpacing.Large),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(AppSpacing.CardPadding)
        ) {
            Icon(
                imageVector = Icons.Default.Error,
                contentDescription = "Error",
                modifier = Modifier.size(AppSizes.IconExtraLarge),
                tint = MaterialTheme.colorScheme.error
            )

            Text(
                text = data.title.ifEmpty { "Error" },
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onErrorContainer
            )

            if (data.description != null) {
                Text(
                    text = data.description,
                    style = MaterialTheme.typography.bodyMedium,
                    textAlign = TextAlign.Center,
                    color = MaterialTheme.colorScheme.onErrorContainer
                )
            }

            Button(
                onClick = onRetry,
                colors = ButtonDefaults.buttonColors(
                    containerColor = MaterialTheme.colorScheme.error
                )
            ) {
                Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                Spacer(modifier = Modifier.width(AppSpacing.Small))
                Text(data.actionLabel ?: "Retry")
            }
        }
    }
}

@Composable
private fun LoadingStateCardContent(
    data: MediaCardData,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .padding(AppSpacing.CardPadding),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(AppSpacing.Large),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(AppSpacing.CardPadding)
        ) {
            CircularProgressIndicator(
                modifier = Modifier.size(AppSizes.IconExtraLarge)
            )

            Text(
                text = data.description ?: data.title.ifEmpty { "Loading..." },
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Center,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun EmptyStateCardContent(
    data: MediaCardData,
    onActionClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .padding(AppSpacing.CardPadding),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(AppSpacing.ExtraLarge),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(AppSpacing.CardPadding)
        ) {
            Icon(
                imageVector = data.icon ?: Icons.Default.Inbox,
                contentDescription = data.title,
                modifier = Modifier.size(AppSizes.IconHuge),
                tint = MaterialTheme.colorScheme.primary
            )

            Text(
                text = data.title,
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                textAlign = TextAlign.Center,
                color = MaterialTheme.colorScheme.onSurface
            )

            if (data.description != null) {
                Text(
                    text = data.description,
                    style = MaterialTheme.typography.bodyMedium,
                    textAlign = TextAlign.Center,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            if (data.actionLabel != null) {
                Button(
                    onClick = onActionClick,
                    modifier = Modifier.fillMaxWidth(0.7f)
                ) {
                    Icon(Icons.Default.Add, contentDescription = "Add")
                    Spacer(modifier = Modifier.width(AppSpacing.Small))
                    Text(data.actionLabel)
                }
            }
        }
    }
}

@Composable
private fun BannerCardContent(
    data: MediaCardData,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .padding(horizontal = AppSpacing.CardPadding, vertical = AppSpacing.ItemSpacing),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(AppSpacing.CardPadding),
            horizontalArrangement = Arrangement.spacedBy(AppSpacing.ItemSpacing),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = data.icon ?: Icons.Default.Info,
                contentDescription = "Info",
                tint = MaterialTheme.colorScheme.onPrimaryContainer
            )

            Text(
                text = data.description ?: data.title,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onPrimaryContainer
            )
        }
    }
}

@Composable
private fun SectionHeaderContent(
    title: String,
    actionLabel: String?,
    onActionClick: (() -> Unit)?,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier
            .fillMaxWidth()
            .padding(horizontal = AppSpacing.CardPadding, vertical = AppSpacing.ItemSpacing),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = title,
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.SemiBold,
            color = MaterialTheme.colorScheme.onSurface
        )

        if (actionLabel != null && onActionClick != null) {
            TextButton(onClick = onActionClick) {
                Text(actionLabel)
            }
        }
    }
}

@Composable
private fun CustomCardContent(
    decoration: MediaCardDecoration,
    elevation: Dp,
    shape: Shape,
    onClick: (() -> Unit)?,
    modifier: Modifier = Modifier,
    content: @Composable ColumnScope.() -> Unit
) {
    Card(
        modifier = modifier
            .applyDecoration(decoration, elevation, shape)
            .then(
                if (onClick != null) Modifier.clickable { onClick() } else Modifier
            ),
        shape = shape,
        elevation = CardDefaults.cardElevation(defaultElevation = elevation)
    ) {
        Column(
            modifier = Modifier.padding(AppSpacing.CardPadding),
            content = content
        )
    }
}

// =============================================================================
// HELPER UTILITIES & DECORATION MODIFIERS
// =============================================================================

@Composable
fun ContentRatingBadge(
    rating: String,
    isRestricted: Boolean,
    modifier: Modifier = Modifier
) {
    val backgroundColor = if (isRestricted) {
        MaterialTheme.colorScheme.errorContainer
    } else {
        MaterialTheme.colorScheme.secondaryContainer
    }

    val textColor = if (isRestricted) {
        MaterialTheme.colorScheme.onErrorContainer
    } else {
        MaterialTheme.colorScheme.onSecondaryContainer
    }

    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(AppCornerRadius.Small),
        color = backgroundColor
    ) {
        Row(
            modifier = Modifier.padding(horizontal = AppSpacing.Small, vertical = AppSpacing.ExtraSmall),
            horizontalArrangement = Arrangement.spacedBy(AppSpacing.ExtraSmall),
            verticalAlignment = Alignment.CenterVertically
        ) {
            if (isRestricted) {
                Icon(
                    Icons.Default.Lock,
                    contentDescription = "Restricted",
                    tint = textColor,
                    modifier = Modifier.size(AppSizes.IconSmall)
                )
            }
            Text(
                text = rating,
                style = MaterialTheme.typography.labelSmall,
                color = textColor,
                fontWeight = FontWeight.Bold
            )
        }
    }
}

@Composable
private fun Modifier.applyDecoration(
    decoration: MediaCardDecoration,
    elevation: Dp,
    shape: Shape
): Modifier {
    return when (decoration) {
        MediaCardDecoration.NONE -> this.depthShadow(elevation = elevation)
        MediaCardDecoration.METALLIC -> {
            val metallic = metallicColors()
            this.metallicGradient(metallic)
                .metallicShimmer(enabled = metallicShimmerEnabled(), baseColor = metallic.base, highlightColor = metallic.highlight)
                .depthShadow(elevation = elevation)
        }
        MediaCardDecoration.GLASS -> {
            this.glassEffect(backgroundColor = MaterialTheme.colorScheme.surface, alpha = 0.7f)
        }
        MediaCardDecoration.ELEVATED_LIGHT -> {
            this.advancedLighting(
                ambientColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.05f),
                spotlightColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.15f)
            )
        }
        MediaCardDecoration.EMBOSSED -> {
            val metallic = metallicColors()
            this.embossedEffect(
                lightColor = metallic.highlight.copy(alpha = 0.4f),
                shadowColor = metallic.shadow.copy(alpha = 0.4f),
                depth = AppElevation.Small
            )
        }
        MediaCardDecoration.PATTERNED -> {
            this.geometricPattern(
                patternColor = MaterialTheme.colorScheme.onSurface,
                patternType = PatternType.SUBTLE_GRID,
                alpha = 0.05f
            ).depthShadow(elevation = elevation)
        }
        MediaCardDecoration.GLOWING -> {
            this.crystalGlow(
                enabled = crystalGlowEnabled(),
                glowColor = MaterialTheme.colorScheme.primary,
                intensity = 0.2f
            ).depthShadow(elevation = elevation)
        }
        MediaCardDecoration.GRADIENT_OVERLAY -> {
            this.gradientOverlay(
                gradient = listOf(MaterialTheme.colorScheme.primary, MaterialTheme.colorScheme.secondary),
                angle = 135f,
                alpha = 0.15f
            ).depthShadow(elevation = elevation)
        }
        MediaCardDecoration.ART_DECO -> {
            val ancientColors = ancientArchitectColors()
            this.drawBehind {
                if (geometricPatternsEnabled()) {
                    with(AncientArchitectPatterns) {
                        drawDiamondGrid(
                            color = ancientColors.stone.text,
                            alpha = 0.03f,
                            cellSize = 40f
                        )
                        drawCornerDecorations(
                            color = ancientColors.metal.primary,
                            alpha = 0.6f,
                            size = 16f
                        )
                    }
                }
            }.border(
                width = AppElevation.Small,
                brush = Brush.linearGradient(
                    colors = listOf(
                        ancientColors.metal.primaryLight,
                        ancientColors.metal.primary,
                        ancientColors.metal.primaryDark
                    )
                ),
                shape = shape
            )
        }
    }
}

private fun getMediaTypeIcon(mediaType: String): ImageVector {
    return when (mediaType.uppercase()) {
        "BOOK", "EBOOK" -> Icons.AutoMirrored.Filled.MenuBook
        "AUDIO", "MUSIC" -> Icons.Default.MusicNote
        "VIDEO", "MOVIE" -> Icons.Default.Movie
        "PODCAST" -> Icons.Default.Podcasts
        "COMIC" -> Icons.Default.AutoStories
        else -> Icons.Default.Inventory
    }
}

private fun getLibraryIcon(type: LibraryType): ImageVector {
    return when (type) {
        LibraryType.BOOK -> PhosphorIcons.Book
        LibraryType.MOVIE -> PhosphorIcons.FilmStrip
        LibraryType.MUSIC -> PhosphorIcons.MusicNote
        LibraryType.PODCAST -> PhosphorIcons.Microphone
        LibraryType.MAGAZINE -> PhosphorIcons.Newspaper
        LibraryType.DOCUMENT -> PhosphorIcons.FileText
    }
}
