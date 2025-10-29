package com.universalmedialibrary.ui.components

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material.icons.filled.VisibilityOff
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.ContentFilterHelper
import com.universalmedialibrary.services.ContentStatus
import kotlinx.coroutines.launch

/**
 * Media card component with parental controls integration
 * 
 * Features:
 * - Automatically filters based on parental controls
 * - Shows lock icon for PIN-protected content
 * - Handles PIN verification before opening
 * - Respects hide/block settings
 */
@Composable
fun FilteredMediaCard(
    mediaItem: MediaItem,
    onClick: () -> Unit,
    contentFilterHelper: ContentFilterHelper,
    parentalControlsSettings: ParentalControlsSettings,
    modifier: Modifier = Modifier
) {
    var contentStatus by remember { mutableStateOf<ContentStatus?>(null) }
    var showPinDialog by remember { mutableStateOf(false) }
    val scope = rememberCoroutineScope()

    // Check content status
    LaunchedEffect(mediaItem.id, mediaItem.contentRating) {
        contentStatus = contentFilterHelper.getContentStatus(mediaItem.contentRating)
    }

    // Don't show if hidden
    if (contentStatus == ContentStatus.Hidden) {
        return
    }

    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable {
                when (contentStatus) {
                    ContentStatus.Locked -> {
                        showPinDialog = true
                    }
                    ContentStatus.Blocked -> {
                        // Show blocked message (don't open)
                    }
                    else -> {
                        onClick()
                    }
                }
            }
    ) {
        Column(modifier = Modifier.padding(12.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = mediaItem.title ?: "Untitled",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    if (mediaItem.author != null) {
                        Text(
                            text = mediaItem.author ?: "",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                // Status indicators
                when (contentStatus) {
                    ContentStatus.Locked -> {
                        Icon(
                            Icons.Default.Lock,
                            contentDescription = "PIN Required",
                            tint = MaterialTheme.colorScheme.error,
                            modifier = Modifier.size(24.dp)
                        )
                    }
                    ContentStatus.Blocked -> {
                        Icon(
                            Icons.Default.VisibilityOff,
                            contentDescription = "Blocked",
                            tint = MaterialTheme.colorScheme.error,
                            modifier = Modifier.size(24.dp)
                        )
                    }
                    else -> {}
                }
            }

            // Content rating badge
            if (mediaItem.contentRating != null) {
                Spacer(modifier = Modifier.height(8.dp))
                ContentRatingBadge(
                    rating = mediaItem.contentRating ?: "",
                    isRestricted = contentStatus == ContentStatus.Locked || contentStatus == ContentStatus.Blocked
                )
            }

            // Blocked message
            if (contentStatus == ContentStatus.Blocked) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "This content is blocked by parental controls",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.error
                )
            }
        }
    }

    // PIN dialog
    if (showPinDialog) {
        PinAccessDialog(
            contentTitle = mediaItem.title ?: "content",
            contentRating = mediaItem.contentRating,
            onDismiss = { showPinDialog = false },
            onAccessGranted = {
                showPinDialog = false
                onClick()
            },
            parentalControlsSettings = parentalControlsSettings
        )
    }
}

/**
 * Content rating badge
 */
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
        shape = MaterialTheme.shapes.small,
        color = backgroundColor
    ) {
        Row(
            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
            horizontalArrangement = Arrangement.spacedBy(4.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            if (isRestricted) {
                Icon(
                    Icons.Default.Lock,
                    contentDescription = null,
                    tint = textColor,
                    modifier = Modifier.size(14.dp)
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

/**
 * Grid item variant for media cards
 */
@Composable
fun FilteredMediaGridItem(
    mediaItem: MediaItem,
    onClick: () -> Unit,
    contentFilterHelper: ContentFilterHelper,
    parentalControlsSettings: ParentalControlsSettings,
    modifier: Modifier = Modifier
) {
    var contentStatus by remember { mutableStateOf<ContentStatus?>(null) }
    var showPinDialog by remember { mutableStateOf(false) }

    // Check content status
    LaunchedEffect(mediaItem.id, mediaItem.contentRating) {
        contentStatus = contentFilterHelper.getContentStatus(mediaItem.contentRating)
    }

    // Don't show if hidden
    if (contentStatus == ContentStatus.Hidden) {
        return
    }

    Card(
        modifier = modifier
            .aspectRatio(0.7f)
            .clickable {
                when (contentStatus) {
                    ContentStatus.Locked -> {
                        showPinDialog = true
                    }
                    ContentStatus.Blocked -> {
                        // Show blocked message
                    }
                    else -> {
                        onClick()
                    }
                }
            }
    ) {
        Box(modifier = Modifier.fillMaxSize()) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(8.dp),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                // Lock icon at top
                if (contentStatus == ContentStatus.Locked || contentStatus == ContentStatus.Blocked) {
                    Icon(
                        if (contentStatus == ContentStatus.Locked) Icons.Default.Lock else Icons.Default.VisibilityOff,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.error,
                        modifier = Modifier
                            .size(32.dp)
                            .align(Alignment.End)
                    )
                } else {
                    Spacer(modifier = Modifier.height(32.dp))
                }

                // Content info
                Column {
                    Text(
                        text = mediaItem.title ?: "Untitled",
                        style = MaterialTheme.typography.bodyMedium,
                        fontWeight = FontWeight.Medium,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    if (mediaItem.contentRating != null) {
                        Spacer(modifier = Modifier.height(4.dp))
                        ContentRatingBadge(
                            rating = mediaItem.contentRating ?: "",
                            isRestricted = contentStatus == ContentStatus.Locked || contentStatus == ContentStatus.Blocked
                        )
                    }
                }
            }
        }
    }

    // PIN dialog
    if (showPinDialog) {
        PinAccessDialog(
            contentTitle = mediaItem.title ?: "content",
            contentRating = mediaItem.contentRating,
            onDismiss = { showPinDialog = false },
            onAccessGranted = {
                showPinDialog = false
                onClick()
            },
            parentalControlsSettings = parentalControlsSettings
        )
    }
}
