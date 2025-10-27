package com.universalmedialibrary.ui.music

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.metadata.EnhancedTrackMetadata
import com.universalmedialibrary.services.music.TrackInfo

/**
 * Enhanced Track Info Components
 * 
 * Displays all 25+ metadata fields from EnhancedMetadataService
 * Includes audio quality badges, technical details, and expandable sections
 */

/**
 * Audio Quality Badge
 * Shows bitrate quality with color coding
 */
@Composable
fun AudioQualityBadge(
    metadata: EnhancedTrackMetadata?,
    modifier: Modifier = Modifier
) {
    if (metadata?.bitrate != null) {
        val (color, label) = when {
            metadata.bitrate >= 320000 -> MaterialTheme.colorScheme.primary to "HQ"
            metadata.bitrate >= 192000 -> MaterialTheme.colorScheme.secondary to "MQ"
            metadata.bitrate >= 128000 -> MaterialTheme.colorScheme.tertiary to "SQ"
            else -> MaterialTheme.colorScheme.error to "LQ"
        }
        
        Surface(
            modifier = modifier,
            color = color,
            shape = RoundedCornerShape(4.dp)
        ) {
            Text(
                text = label,
                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onPrimary,
                fontWeight = FontWeight.Bold
            )
        }
    }
}

/**
 * Enhanced Track Info Section with all metadata
 */
@Composable
fun EnhancedTrackInfoSection(
    track: TrackInfo,
    metadata: EnhancedTrackMetadata?,
    modifier: Modifier = Modifier,
    onShowDetails: () -> Unit = {}
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Title with audio quality badge
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.Center
        ) {
            Text(
                text = metadata?.displayTitle ?: track.title,
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                textAlign = androidx.compose.ui.text.style.TextAlign.Center,
                modifier = Modifier.weight(1f, fill = false)
            )
            Spacer(modifier = Modifier.width(8.dp))
            AudioQualityBadge(metadata = metadata)
        }
        
        Spacer(modifier = Modifier.height(8.dp))
        
        // Artist
        Text(
            text = metadata?.displayArtist ?: track.artist ?: "Unknown Artist",
            style = MaterialTheme.typography.titleMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
        
        // Album
        if (metadata?.album != null || track.album != null) {
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = metadata?.displayAlbum ?: track.album ?: "",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f),
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
        
        // Composer (if available)
        if (metadata?.composer != null) {
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = "Composer: ${metadata.composer}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f),
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
        
        // Technical info row
        if (metadata != null) {
            Spacer(modifier = Modifier.height(8.dp))
            Row(
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Bitrate
                if (metadata.bitrate != null) {
                    TechnicalInfoChip(
                        label = "${metadata.bitrate / 1000} kbps",
                        icon = Icons.Default.GraphicEq
                    )
                }
                
                // Sample rate
                if (metadata.sampleRate != null) {
                    TechnicalInfoChip(
                        label = "${metadata.sampleRate / 1000} kHz",
                        icon = Icons.Default.Speed
                    )
                }
                
                // Track number
                if (metadata.trackPositionString != null) {
                    TechnicalInfoChip(
                        label = "#${metadata.trackPositionString}",
                        icon = Icons.Default.MusicNote
                    )
                }
            }
        }
        
        // Show more details button
        Spacer(modifier = Modifier.height(8.dp))
        TextButton(onClick = onShowDetails) {
            Text("View Details")
            Icon(
                Icons.Default.Info,
                contentDescription = null,
                modifier = Modifier.size(16.dp).padding(start = 4.dp)
            )
        }
    }
}

/**
 * Technical Info Chip
 */
@Composable
private fun TechnicalInfoChip(
    label: String,
    icon: ImageVector,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier,
        color = MaterialTheme.colorScheme.surfaceVariant,
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
            horizontalArrangement = Arrangement.spacedBy(4.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                icon,
                contentDescription = null,
                modifier = Modifier.size(14.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Text(
                text = label,
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

/**
 * Comprehensive Track Details Dialog
 * Shows all 25+ metadata fields
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TrackDetailsDialog(
    track: TrackInfo,
    metadata: EnhancedTrackMetadata?,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Track Information")
        },
        text = {
            LazyColumn(
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Basic Information
                item {
                    DetailSection(title = "Basic Information") {
                        DetailItem("Title", metadata?.displayTitle ?: track.title)
                        DetailItem("Artist", metadata?.displayArtist ?: track.artist)
                        DetailItem("Album", metadata?.displayAlbum ?: track.album)
                        if (metadata?.albumArtist != null) {
                            DetailItem("Album Artist", metadata.albumArtist)
                        }
                        if (metadata?.composer != null) {
                            DetailItem("Composer", metadata.composer)
                        }
                        if (metadata?.writer != null) {
                            DetailItem("Writer", metadata.writer)
                        }
                    }
                }
                
                // Track Details
                item {
                    DetailSection(title = "Track Details") {
                        if (metadata?.year != null) {
                            DetailItem("Year", metadata.year.toString())
                        }
                        if (metadata?.genre != null) {
                            DetailItem("Genre", metadata.genre)
                        }
                        if (metadata?.trackNumber != null) {
                            val trackText = if (metadata.trackTotal != null) {
                                "${metadata.trackNumber}/${metadata.trackTotal}"
                            } else {
                                metadata.trackNumber.toString()
                            }
                            DetailItem("Track #", trackText)
                        }
                        if (metadata?.discNumber != null) {
                            val discText = if (metadata.discTotal != null) {
                                "${metadata.discNumber}/${metadata.discTotal}"
                            } else {
                                metadata.discNumber.toString()
                            }
                            DetailItem("Disc #", discText)
                        }
                        if (metadata?.isCompilation == true) {
                            DetailItem("Type", "Compilation")
                        }
                    }
                }
                
                // Audio Quality
                item {
                    DetailSection(title = "Audio Quality") {
                        DetailItem("Quality", metadata?.audioQuality ?: "Unknown")
                        if (metadata?.bitrate != null) {
                            DetailItem("Bitrate", "${metadata.bitrate / 1000} kbps")
                        }
                        if (metadata?.sampleRate != null) {
                            DetailItem("Sample Rate", "${metadata.sampleRate} Hz")
                        }
                        if (metadata?.channels != null) {
                            val channelText = when (metadata.channels) {
                                1 -> "Mono"
                                2 -> "Stereo"
                                else -> "${metadata.channels} channels"
                            }
                            DetailItem("Channels", channelText)
                        }
                        if (metadata?.mimeType != null) {
                            DetailItem("Format", metadata.mimeType)
                        }
                    }
                }
                
                // File Information
                item {
                    DetailSection(title = "File Information") {
                        DetailItem("File Path", track.filePath)
                        if (metadata?.hasEmbeddedArt == true) {
                            val artSize = metadata.embeddedArtSize / 1024
                            DetailItem("Album Art", "Embedded ($artSize KB)")
                        }
                        DetailItem("Duration", formatDuration(track.duration))
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}

/**
 * Detail Section with title
 */
@Composable
private fun DetailSection(
    title: String,
    content: @Composable ColumnScope.() -> Unit
) {
    Column {
        Text(
            text = title,
            style = MaterialTheme.typography.titleSmall,
            fontWeight = FontWeight.Bold,
            color = MaterialTheme.colorScheme.primary
        )
        Spacer(modifier = Modifier.height(8.dp))
        Column(
            verticalArrangement = Arrangement.spacedBy(4.dp),
            content = content
        )
    }
}

/**
 * Detail Item (label: value)
 */
@Composable
private fun DetailItem(
    label: String,
    value: String?
) {
    if (value != null) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                text = "$label:",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.weight(0.4f)
            )
            Text(
                text = value,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurface,
                modifier = Modifier.weight(0.6f)
            )
        }
    }
}

/**
 * Format duration to MM:SS
 */
private fun formatDuration(milliseconds: Long): String {
    val seconds = milliseconds / 1000
    val minutes = seconds / 60
    val remainingSeconds = seconds % 60
    return String.format("%d:%02d", minutes, remainingSeconds)
}
