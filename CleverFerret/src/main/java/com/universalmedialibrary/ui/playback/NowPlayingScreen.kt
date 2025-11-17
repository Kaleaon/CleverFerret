package com.universalmedialibrary.ui.playback

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.Playlist
import com.universalmedialibrary.data.local.entity.QueueItem
import com.universalmedialibrary.services.playback.UnifiedPlaybackState
import com.universalmedialibrary.ui.icons.PhosphorIcons
import java.util.Locale

/**
 * Unified Now Playing Screen
 *
 * Displays the current playing item and queue for all media types.
 * Supports music, audiobooks, TTS, podcasts, and video with
 * unified controls and queue management.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
    fun NowPlayingScreen(
        viewModel: NowPlayingViewModel = hiltViewModel(),
        onNavigateBack: () -> Unit = {}
    ) {
    val playbackState by viewModel.playbackState.collectAsState()
    val currentItem by viewModel.currentItem.collectAsState()
    val queueItems by viewModel.queueItems.collectAsState()
    val currentQueue by viewModel.currentQueue.collectAsState()
    val playlists by viewModel.availablePlaylists.collectAsState()
    
    var showPlaylistDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        text = currentQueue?.displayName ?: "Now Playing",
                        fontWeight = FontWeight.Medium
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.toggleQueue() }) {
                        Icon(PhosphorIcons.QueueMusic, contentDescription = "Show Queue")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Current playing item display
            currentItem?.let { item ->
                CurrentPlayingItem(
                    item = item,
                    playbackState = playbackState,
                    onPlayPause = viewModel::togglePlayPause,
                    onSkipNext = viewModel::skipToNext,
                    onSkipPrevious = viewModel::skipToPrevious,
                    onSeek = viewModel::seekTo,
                    onSpeedChange = viewModel::setPlaybackSpeed,
                    onThumbsUp = { viewModel.likeCurrentTrack() },
                    onAddToPlaylist = { showPlaylistDialog = true }
                )
            }

            HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp))

            // Queue display
            QueueDisplay(
                queueItems = queueItems,
                currentItem = currentItem,
                onItemClick = viewModel::playQueueItem,
                onItemRemove = viewModel::removeFromQueue
            )
        }
    }
    
    if (showPlaylistDialog && currentItem != null) {
        PlaylistSelectionDialog(
            playlists = playlists,
            currentItem = currentItem,
            onDismiss = { showPlaylistDialog = false },
            onPlaylistSelected = { playlistId ->
                viewModel.addCurrentTrackToPlaylist(playlistId)
                showPlaylistDialog = false
            },
            onCreatePlaylist = { name ->
                viewModel.createPlaylistWithCurrentTrack(name)
                showPlaylistDialog = false
            }
        )
    }
}

@Composable
private fun CurrentPlayingItem(
    item: QueueItem,
    playbackState: UnifiedPlaybackState,
    onPlayPause: () -> Unit,
    onSkipNext: () -> Unit,
    onSkipPrevious: () -> Unit,
    onSeek: (Long) -> Unit,
    onSpeedChange: (Float) -> Unit,
    onThumbsUp: () -> Unit,
    onAddToPlaylist: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            // Title and metadata
            Text(
                text = item.title,
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis
            )

            item.artist?.let { artist ->
                Text(
                    text = artist,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(top = 4.dp)
                )
            }

            item.album?.let { album ->
                Text(
                    text = album,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(top = 2.dp)
                )
            }

            // Progress bar
            Spacer(modifier = Modifier.height(16.dp))

            val progress = if (playbackState.duration > 0) {
                playbackState.currentPositionMs.toFloat() / playbackState.duration.toFloat()
            } else 0f

            Slider(
                value = progress,
                onValueChange = { newProgress ->
                    val newPosition = (newProgress * playbackState.duration).toLong()
                    onSeek(newPosition)
                },
                modifier = Modifier.fillMaxWidth()
            )

            // Time display
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = formatTime(playbackState.currentPositionMs),
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    text = formatTime(playbackState.duration),
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Playback controls
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically
            ) {
                IconButton(onClick = onThumbsUp) {
                    Icon(
                        Icons.Default.ThumbUp,
                        contentDescription = "Like",
                        tint = MaterialTheme.colorScheme.primary
                    )
                }
                // Shuffle/Repeat would need to be added to viewModel interface
                
                IconButton(onClick = onSkipPrevious) {
                    Icon(Icons.Default.ArrowBack, contentDescription = "Previous")
                }

                FloatingActionButton(
                    onClick = onPlayPause,
                    containerColor = MaterialTheme.colorScheme.primary
                ) {
                    Icon(
                        if (playbackState.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = if (playbackState.isPlaying) "Pause" else "Play"
                    )
                }

                IconButton(onClick = onSkipNext) {
                    Icon(Icons.Default.ArrowForward, contentDescription = "Next")
                }
                IconButton(onClick = onAddToPlaylist) {
                    Icon(
                        Icons.Default.PlaylistAdd,
                        contentDescription = "Add to playlist",
                        tint = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Playback speed control for audiobooks and TTS
            if (item.mediaType in listOf("AUDIOBOOK", "TTS", "PODCAST")) {
                Spacer(modifier = Modifier.height(8.dp))

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Speed: ${String.format(Locale.getDefault(), "%.1fx", playbackState.playbackSpeed)}",
                        style = MaterialTheme.typography.bodyMedium
                    )

                    Row {
                        TextButton(onClick = { onSpeedChange(0.75f) }) {
                            Text("0.75x")
                        }
                        TextButton(onClick = { onSpeedChange(1.0f) }) {
                            Text("1x")
                        }
                        TextButton(onClick = { onSpeedChange(1.25f) }) {
                            Text("1.25x")
                        }
                        TextButton(onClick = { onSpeedChange(1.5f) }) {
                            Text("1.5x")
                        }
                        TextButton(onClick = { onSpeedChange(2.0f) }) {
                            Text("2x")
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun QueueDisplay(
    queueItems: List<QueueItem>,
    currentItem: QueueItem?,
    onItemClick: (Long) -> Unit,
    onItemRemove: (Long) -> Unit
) {
    Column(
        modifier = Modifier.fillMaxWidth()
    ) {
        Text(
            text = "Queue (${queueItems.size} items)",
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.Medium,
            modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp)
        )

        LazyColumn {
            itemsIndexed(queueItems) { index, item ->
                QueueItemCard(
                    item = item,
                    isCurrentlyPlaying = item.queueItemId == currentItem?.queueItemId,
                    position = index + 1,
                    onClick = { onItemClick(item.queueItemId) },
                    onRemove = { onItemRemove(item.queueItemId) }
                )
            }
        }
    }
}

@Composable
private fun QueueItemCard(
    item: QueueItem,
    isCurrentlyPlaying: Boolean,
    position: Int,
    onClick: () -> Unit,
    onRemove: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 4.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (isCurrentlyPlaying)
                MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
            else MaterialTheme.colorScheme.surface
        ),
        onClick = onClick
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = position.toString(),
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.width(24.dp)
            )

            Spacer(modifier = Modifier.width(12.dp))

            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = item.title,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = if (isCurrentlyPlaying) FontWeight.Bold else FontWeight.Normal,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                item.artist?.let { artist ->
                    Text(
                        text = artist,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }

            // Media type indicator
            val mediaTypeIcon = when (item.mediaType) {
                "MUSIC" -> Icons.Default.PlayArrow
                "AUDIOBOOK" -> Icons.Default.PlayArrow
                "TTS" -> Icons.Default.PlayArrow
                "PODCAST" -> Icons.Default.PlayArrow
                "VIDEO" -> Icons.Default.PlayArrow
                else -> Icons.Default.PlayArrow
            }

            Icon(
                imageVector = mediaTypeIcon,
                contentDescription = item.mediaType,
                tint = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.size(20.dp)
            )

            IconButton(onClick = onRemove) {
                Icon(
                    Icons.Default.Close,
                    contentDescription = "Remove from queue",
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

/**
 * Format time in milliseconds to MM:SS format
 */
private fun formatTime(timeMs: Long): String {
    val totalSeconds = timeMs / 1000
    val minutes = totalSeconds / 60
    val seconds = totalSeconds % 60
    return String.format(Locale.getDefault(), "%d:%02d", minutes, seconds)
}

/**
 * Playlist selection dialog
 */
@Composable
private fun PlaylistSelectionDialog(
    playlists: List<Playlist>,
    currentItem: QueueItem?,
    onDismiss: () -> Unit,
    onPlaylistSelected: (Long) -> Unit,
    onCreatePlaylist: (String) -> Unit
) {
    var newPlaylistName by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add to Playlist") },
        text = {
            Column {
                Text(
                    text = "Select a playlist to add \"${currentItem?.title ?: "this item"}\" to:",
                    style = MaterialTheme.typography.bodyMedium
                )
                Spacer(modifier = Modifier.height(16.dp))

                if (playlists.isEmpty()) {
                    Text(
                        text = "No playlists found. Create a new playlist below.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(modifier = Modifier.height(12.dp))
                } else {
                    LazyColumn(
                        modifier = Modifier
                            .fillMaxWidth()
                            .heightIn(max = 240.dp)
                    ) {
                        itemsIndexed(playlists) { _, playlist ->
                            TextButton(
                                onClick = { onPlaylistSelected(playlist.playlistId) },
                                modifier = Modifier.fillMaxWidth()
                            ) {
                                Column(modifier = Modifier.fillMaxWidth()) {
                                    Text(
                                        text = playlist.name,
                                        style = MaterialTheme.typography.bodyLarge,
                                        maxLines = 1,
                                        overflow = TextOverflow.Ellipsis
                                    )
                                    Text(
                                        text = playlist.description ?: "Playlist",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        }
                    }
                }

                Spacer(modifier = Modifier.height(12.dp))

                OutlinedTextField(
                    value = newPlaylistName,
                    onValueChange = { newPlaylistName = it },
                    label = { Text("New playlist name") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                Spacer(modifier = Modifier.height(8.dp))
                Button(
                    onClick = {
                        val trimmed = newPlaylistName.trim()
                        if (trimmed.isNotEmpty()) {
                            onCreatePlaylist(trimmed)
                        }
                    },
                    modifier = Modifier.fillMaxWidth(),
                    enabled = newPlaylistName.isNotBlank()
                ) {
                    Text("Create and add")
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
