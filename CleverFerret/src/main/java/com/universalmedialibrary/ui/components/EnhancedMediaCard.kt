package com.universalmedialibrary.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.data.repository.MediaItemWithMetadata
import kotlin.math.log10
import kotlin.math.pow

/**
 * Enhanced media card with rich visual presentation
 * Displays cover art, metadata, progress, and quick actions
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedMediaCard(
    item: MediaItemWithMetadata,
    onClick: () -> Unit,
    onLongClick: (() -> Unit)? = null,
    showProgress: Boolean = true,
    showQuickActions: Boolean = true,
    modifier: Modifier = Modifier,
    onToggleFavorite: (() -> Unit)? = null
) {
    var showMenu by remember { mutableStateOf(false) }

    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(16.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column {
            // Cover art section
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp)
            ) {
                if (item.coverUrl != null) {
                    AsyncImage(
                    
                        model = item.coverUrl,
                        contentDescription = "Cover",
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    // Gradient placeholder based on media type
                    val colors = getGradientForMediaType(item.mediaItem.mediaType)
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(Brush.linearGradient(colors)),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = getIconForMediaType(item.mediaItem.mediaType),
                            contentDescription = "Media image",
                            modifier = Modifier.size(72.dp),
                            tint = Color.White.copy(alpha = 0.6f)
                        )
                    }
                }

                // Media type badge
                Surface(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(12.dp),
                    shape = RoundedCornerShape(8.dp),
                    color = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.9f)
                ) {
                    Text(
                        text = item.mediaItem.mediaType.lowercase().replaceFirstChar { it.uppercase() },
                        modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
                        style = MaterialTheme.typography.labelSmall,
                        fontWeight = FontWeight.SemiBold
                    )
                }

                // Rating badge (if available)
                item.rating?.let { rating ->
                    Surface(
                        modifier = Modifier
                            .align(Alignment.TopStart)
                            .padding(12.dp),
                        shape = RoundedCornerShape(8.dp),
                        color = Color(0xFFFFD700).copy(alpha = 0.9f)
                    ) {
                        Row(
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(4.dp)
                        ) {
                            Icon(
                                Icons.Default.Star,
                                contentDescription = "Media image",
                                modifier = Modifier.size(14.dp),
                                tint = Color.Black
                            )
                            Text(
                                text = String.format(java.util.Locale.US, "%.1f", rating),
                                style = MaterialTheme.typography.labelSmall,
                                color = Color.Black,
                                fontWeight = FontWeight.Bold
                            )
                        }
                    }
                }

                if (onToggleFavorite != null) {
                    val isFavorite = item.mediaItem.isFavorite || item.metadata?.isFavorite == true
                    IconButton(
                        onClick = onToggleFavorite,
                        modifier = Modifier
                            .align(Alignment.BottomEnd)
                            .padding(12.dp)
                            .size(40.dp)
                            .background(
                                MaterialTheme.colorScheme.surface.copy(alpha = 0.8f),
                                CircleShape
                            )
                    ) {
                        Icon(
                            imageVector = if (isFavorite) Icons.Default.Favorite else Icons.Outlined.FavoriteBorder,
                            contentDescription = if (isFavorite) "Unfavorite" else "Favorite",
                            tint = if (isFavorite) MaterialTheme.colorScheme.error else MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }

            // Content section
            Column(
                modifier = Modifier.padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // Title
                Text(
                    text = item.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                // Metadata row (year, file size, etc.)
                Row(
                    horizontalArrangement = Arrangement.spacedBy(12.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    item.year?.let { year ->
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(4.dp)
                        ) {
                            Icon(
                                Icons.Default.CalendarToday,
                                contentDescription = "Media image",
                                modifier = Modifier.size(14.dp),
                                tint = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Text(
                                text = year.toString(),
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }

                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        Icon(
                            Icons.Default.Storage,
                            contentDescription = "Media image",
                            modifier = Modifier.size(14.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Text(
                            text = formatFileSize(item.mediaItem.fileSize),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    if (item.mediaItem.hasMetadata) {
                        Icon(
                            Icons.Default.CloudDone,
                            contentDescription = "Has metadata",
                            modifier = Modifier.size(14.dp),
                            tint = Color(0xFF4CAF50)
                        )
                    }
                }

                // Summary (if available)
                item.summary?.let { summary ->
                    Text(
                        text = summary,
                        style = MaterialTheme.typography.bodySmall,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                // Quick actions (if enabled)
                if (showQuickActions) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        FilledTonalButton(
                            onClick = onClick,
                            modifier = Modifier.weight(1f)
                        ) {
                            Icon(
                                Icons.Default.PlayArrow,
                                contentDescription = "Media image",
                                modifier = Modifier.size(18.dp)
                            )
                            Spacer(modifier = Modifier.width(4.dp))
                            Text("Open")
                        }

                        IconButton(onClick = { showMenu = true }) {
                            Icon(Icons.Default.MoreVert, contentDescription = "More")
                        }

                        DropdownMenu(
                            expanded = showMenu,
                            onDismissRequest = { showMenu = false }
                        ) {
                            DropdownMenuItem(
                                text = { Text("Add to Collection") },
                                onClick = {
                                    showMenu = false
                                    // Trigger add to collection
                                },
                                leadingIcon = {
                                    Icon(Icons.Default.PlaylistAdd, contentDescription = "Add to playlist")
                                }
                            )
                            DropdownMenuItem(
                                text = { Text("Share") },
                                onClick = {
                                    showMenu = false
                                    // Trigger share
                                },
                                leadingIcon = {
                                    Icon(Icons.Default.Share, contentDescription = "Share")
                                }
                            )
                            DropdownMenuItem(
                                text = { Text("Details") },
                                onClick = {
                                    showMenu = false
                                    onClick()
                                },
                                leadingIcon = {
                                    Icon(Icons.Default.Info, contentDescription = "Info")
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}

/**
 * Compact media card for lists and grids
 */
@Composable
fun CompactMediaCard(
    item: MediaItemWithMetadata,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .width(160.dp)
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(12.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column {
            // Cover section
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(220.dp)
            ) {
                if (item.coverUrl != null) {
                    AsyncImage(
                    
                        model = item.coverUrl,
                        contentDescription = "Cover",
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    val colors = getGradientForMediaType(item.mediaItem.mediaType)
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(Brush.linearGradient(colors)),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = getIconForMediaType(item.mediaItem.mediaType),
                            contentDescription = "Media image",
                            modifier = Modifier.size(48.dp),
                            tint = Color.White.copy(alpha = 0.6f)
                        )
                    }
                }

                // Rating (if available)
                item.rating?.let { rating ->
                    Surface(
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(8.dp),
                        shape = CircleShape,
                        color = Color(0xFFFFD700)
                    ) {
                        Text(
                            text = String.format(java.util.Locale.US, "%.1f", rating),
                            modifier = Modifier.padding(6.dp),
                            style = MaterialTheme.typography.labelSmall,
                            fontWeight = FontWeight.Bold,
                            color = Color.Black
                        )
                    }
                }
            }

            // Title
            Column(
                modifier = Modifier.padding(12.dp)
            ) {
                Text(
                    text = item.title,
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                item.year?.let { year ->
                    Text(
                        text = year.toString(),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

private fun getGradientForMediaType(mediaType: String): List<Color> {
    return when (mediaType.uppercase()) {
        "BOOK" -> listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))
        "MUSIC" -> listOf(Color(0xFF4A148C), Color(0xFF9C27B0))
        "MOVIE", "VIDEO" -> listOf(Color(0xFF0D47A1), Color(0xFF2196F3))
        "COMIC" -> listOf(Color(0xFFE65100), Color(0xFFFF9800))
        "PODCAST" -> listOf(Color(0xFF0D1F12), Color(0xFF4A7C59))
        else -> listOf(Color(0xFF37474F), Color(0xFF78909C))
    }
}

private fun getIconForMediaType(mediaType: String): androidx.compose.ui.graphics.vector.ImageVector {
    return when (mediaType.uppercase()) {
        "BOOK" -> Icons.Default.Book
        "MUSIC" -> Icons.Default.MusicNote
        "MOVIE", "VIDEO" -> Icons.Default.Movie
        "COMIC" -> Icons.Default.AutoStories
        "PODCAST" -> Icons.Default.Podcasts
        else -> Icons.Default.InsertDriveFile
    }
}

private fun formatFileSize(bytes: Long): String {
    if (bytes <= 0) return "0 B"
    val units = arrayOf("B", "KB", "MB", "GB", "TB")
    val digitGroups = (log10(bytes.toDouble()) / log10(1024.0)).toInt().coerceIn(0, units.lastIndex)
    return String.format(
        java.util.Locale.US,
        "%.1f %s",
        bytes / 1024.0.pow(digitGroups.toDouble()),
        units[digitGroups]
    )
}
