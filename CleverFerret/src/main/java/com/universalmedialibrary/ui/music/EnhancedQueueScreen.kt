package com.universalmedialibrary.ui.music

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.music.TrackInfo
import org.burnoutcrew.reorderable.*

/**
 * Enhanced Queue Management Screen
 * 
 * Features:
 * - Drag and drop reordering
 * - Swipe to remove
 * - Jump to track
 * - Clear queue
 * - Shuffle queue
 * - Queue statistics
 */

@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun EnhancedQueueScreen(
    queue: List<TrackInfo>,
    currentTrackId: String?,
    currentIndex: Int,
    onTrackClick: (Int) -> Unit,
    onRemoveTrack: (Int) -> Unit,
    onMoveTrack: (Int, Int) -> Unit,
    onClearQueue: () -> Unit,
    onShuffleQueue: () -> Unit,
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showClearConfirmation by remember { mutableStateOf(false) }
    val reorderableState = rememberReorderableLazyListState(
        onMove = { from, to ->
            onMoveTrack(from.index, to.index)
        }
    )
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text("Queue")
                        Text(
                            text = "${queue.size} tracks • ${formatTotalDuration(queue)}",
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    // Shuffle queue
                    IconButton(onClick = onShuffleQueue) {
                        Icon(Icons.Default.Shuffle, "Shuffle Queue")
                    }
                    
                    // Clear queue
                    IconButton(onClick = { showClearConfirmation = true }) {
                        Icon(Icons.Default.Delete, "Clear Queue")
                    }
                }
            )
        }
    ) { paddingValues ->
        
        if (queue.isEmpty()) {
            // Empty queue state
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.Center
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Icon(
                        Icons.Default.QueueMusic,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        "Queue is empty",
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        "Add songs to get started",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f)
                    )
                }
            }
        } else {
            LazyColumn(
                state = reorderableState.listState,
                modifier = modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .reorderable(reorderableState),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                itemsIndexed(
                    items = queue,
                    key = { _, track -> track.id }
                ) { index, track ->
                    ReorderableItem(reorderableState, key = track.id) { isDragging ->
                        val elevation by animateDpAsState(if (isDragging) 8.dp else 0.dp)
                        
                        QueueTrackItem(
                            track = track,
                            index = index,
                            isCurrentTrack = track.id == currentTrackId,
                            onTrackClick = { onTrackClick(index) },
                            onRemove = { onRemoveTrack(index) },
                            modifier = Modifier
                                .animateItemPlacement()
                                .detectReorderAfterLongPress(reorderableState)
                        )
                    }
                }
            }
        }
        
        // Clear confirmation dialog
        if (showClearConfirmation) {
            AlertDialog(
                onDismissRequest = { showClearConfirmation = false },
                title = { Text("Clear Queue?") },
                text = { Text("This will remove all ${queue.size} tracks from the queue.") },
                confirmButton = {
                    TextButton(
                        onClick = {
                            onClearQueue()
                            showClearConfirmation = false
                        }
                    ) {
                        Text("Clear")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showClearConfirmation = false }) {
                        Text("Cancel")
                    }
                }
            )
        }
    }
}

/**
 * Queue Track Item with reorder and remove
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun QueueTrackItem(
    track: TrackInfo,
    index: Int,
    isCurrentTrack: Boolean,
    onTrackClick: () -> Unit,
    onRemove: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = if (isCurrentTrack)
                MaterialTheme.colorScheme.primaryContainer
            else
                MaterialTheme.colorScheme.surface
        ),
        onClick = onTrackClick
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Track number / drag handle
            Box(
                modifier = Modifier
                    .size(40.dp)
                    .background(
                        color = if (isCurrentTrack)
                            MaterialTheme.colorScheme.primary
                        else
                            MaterialTheme.colorScheme.surfaceVariant,
                        shape = CircleShape
                    ),
                contentAlignment = Alignment.Center
            ) {
                if (isCurrentTrack) {
                    Icon(
                        Icons.Default.PlayArrow,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.onPrimary,
                        modifier = Modifier.size(20.dp)
                    )
                } else {
                    Text(
                        text = "${index + 1}",
                        style = MaterialTheme.typography.labelMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        fontWeight = FontWeight.Bold
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(12.dp))
            
            // Track info
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = track.title,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = if (isCurrentTrack) FontWeight.Bold else FontWeight.Normal,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                if (track.artist != null) {
                    Text(
                        text = track.artist,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
            
            // Duration
            Text(
                text = formatDuration(track.duration),
                style = MaterialTheme.typography.labelMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.width(8.dp))
            
            // Remove button
            IconButton(
                onClick = onRemove,
                modifier = Modifier.size(36.dp)
            ) {
                Icon(
                    Icons.Default.Close,
                    contentDescription = "Remove",
                    modifier = Modifier.size(20.dp)
                )
            }
            
            // Drag handle
            Icon(
                Icons.Default.DragHandle,
                contentDescription = "Drag to reorder",
                modifier = Modifier.size(24.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

/**
 * Format total duration of queue
 */
private fun formatTotalDuration(tracks: List<TrackInfo>): String {
    val totalSeconds = tracks.sumOf { it.duration } / 1000
    val hours = totalSeconds / 3600
    val minutes = (totalSeconds % 3600) / 60
    
    return if (hours > 0) {
        "${hours}h ${minutes}m"
    } else {
        "${minutes}m"
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

@androidx.compose.ui.tooling.preview.Preview
@Composable
private fun QueueTrackItemPreview() {
    MaterialTheme {
        QueueTrackItem(
            track = TrackInfo(
                id = "1",
                title = "Sample Song",
                artist = "Sample Artist",
                album = "Sample Album",
                duration = 210000,
                filePath = "/path/to/song.mp3",
                albumArtUrl = null
            ),
            index = 0,
            isCurrentTrack = true,
            onTrackClick = {},
            onRemove = {}
        )
    }
}
