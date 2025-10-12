package com.universalmedialibrary.ui.music

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import com.universalmedialibrary.ui.icons.PhosphorIcons
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.services.music.PlaylistMode
import com.universalmedialibrary.services.music.TrackInfo
import kotlin.math.roundToInt

/**
 * Advanced Music Player Screen with album art, controls, and queue management
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MusicPlayerScreen(
    onNavigateBack: () -> Unit,
    onNavigateToQueue: () -> Unit,
    onNavigateToAlbum: (String) -> Unit,
    onNavigateToVisualizer: () -> Unit = {},
    viewModel: MusicPlayerViewModel = hiltViewModel()
) {
    val playbackState by viewModel.playbackState.collectAsStateWithLifecycle()
    val currentTrack by viewModel.currentTrack.collectAsStateWithLifecycle()
    val playlistMode by viewModel.playlistMode.collectAsStateWithLifecycle()
    val queue by viewModel.queue.collectAsStateWithLifecycle()

    var currentPosition by remember { mutableLongStateOf(0L) }
    var isDragging by remember { mutableStateOf(false) }

    // Update position periodically when playing
    LaunchedEffect(playbackState.isPlaying) {
        if (playbackState.isPlaying) {
            while (playbackState.isPlaying) {
                if (!isDragging) {
                    currentPosition = viewModel.getCurrentPosition()
                }
                kotlinx.coroutines.delay(1000)
            }
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        text = "Now Playing",
                        style = MaterialTheme.typography.titleMedium
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.KeyboardArrowDown, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = onNavigateToQueue) {
                        Badge(
                            containerColor = MaterialTheme.colorScheme.primary
                        ) {
                            Text("${queue.size}")
                        }
                        Icon(PhosphorIcons.QueueMusic, contentDescription = "Queue")
                    }
                    com.universalmedialibrary.ui.visualizer.VisualizerButton(
                        onClick = onNavigateToVisualizer
                    )
                    IconButton(onClick = { }) {
                        Icon(Icons.Default.MoreVert, contentDescription = "More")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Color.Transparent
                )
            )
        }
    ) { paddingValues ->

        if (currentTrack != null) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .background(
                        brush = Brush.verticalGradient(
                            colors = listOf(
                                MaterialTheme.colorScheme.surface,
                                MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f)
                            )
                        )
                    )
            ) {

                // Album Art Section
                currentTrack?.let { track ->
                    AlbumArtSection(
                        track = track,
                        isPlaying = playbackState.isPlaying,
                        onAlbumClick = { tr ->
                            tr.album?.let { album ->
                                onNavigateToAlbum(album)
                            }
                        }
                    )
                }

                Spacer(modifier = Modifier.height(32.dp))

                // Track Information
                currentTrack?.let { track ->
                    TrackInfoSection(
                        track = track,
                        modifier = Modifier.padding(horizontal = 24.dp)
                    )
                }

                Spacer(modifier = Modifier.height(24.dp))

                // Progress Section
                ProgressSection(
                    currentPosition = currentPosition,
                    duration = currentTrack?.duration ?: 0L,
                    onSeek = { position ->
                        currentPosition = position
                        viewModel.seekTo(position)
                    },
                    onDragStart = { isDragging = true },
                    onDragEnd = { isDragging = false },
                    modifier = Modifier.padding(horizontal = 24.dp)
                )

                Spacer(modifier = Modifier.height(32.dp))

                // Control Buttons
                ControlButtonsSection(
                    isPlaying = playbackState.isPlaying,
                    playlistMode = playlistMode,
                    canSkipPrevious = true,
                    canSkipNext = queue.size > 1,
                    onPlayPause = viewModel::togglePlayPause,
                    onSkipPrevious = viewModel::skipToPrevious,
                    onSkipNext = viewModel::skipToNext,
                    onToggleMode = viewModel::togglePlaylistMode,
                    modifier = Modifier.padding(horizontal = 24.dp)
                )

                Spacer(modifier = Modifier.height(24.dp))

                // Secondary Controls
                SecondaryControlsSection(
                    onVolumeClick = { },
                    onEqualizerClick = { },
                    onShareClick = { },
                    modifier = Modifier.padding(horizontal = 24.dp)
                )

                Spacer(modifier = Modifier.weight(1f))
            }
        } else {
            // No track loaded state
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.Center
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Icon(
                        PhosphorIcons.MusicNote,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                    Text(
                        text = "No music playing",
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        text = "Select a song from your library",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }

        // Error state
        if (playbackState.hasError) {
            LaunchedEffect(playbackState.error) {
                // TODO: Show error snackbar
            }
        }
    }
}

@Composable
private fun AlbumArtSection(
    track: TrackInfo,
    isPlaying: Boolean,
    onAlbumClick: (TrackInfo) -> Unit
) {
    val rotation by animateFloatAsState(
        targetValue = if (isPlaying) 360f else 0f,
        animationSpec = tween(durationMillis = 10000),
        label = "album_rotation"
    )

    Box(
        modifier = Modifier
            .fillMaxWidth()
            .aspectRatio(1f)
            .padding(24.dp),
        contentAlignment = Alignment.Center
    ) {
        Card(
            modifier = Modifier
                .fillMaxSize()
                .clip(CircleShape),
            elevation = CardDefaults.cardElevation(defaultElevation = 8.dp),
            onClick = { onAlbumClick(track) }
        ) {
            AsyncImage(
                model = ImageRequest.Builder(LocalContext.current)
                    .data(track.albumArtUrl ?: "")
                    .placeholder(android.R.drawable.ic_media_play)
                    .error(android.R.drawable.ic_media_play)
                    .build(),
                contentDescription = "Album Art",
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop
            )
        }

        // Vinyl record effect
        if (isPlaying) {
            Box(
                modifier = Modifier
                    .size(40.dp)
                    .background(
                        color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.8f),
                        shape = CircleShape
                    )
            )
        }
    }
}

@Composable
private fun TrackInfoSection(
    track: TrackInfo,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = track.title,
            style = MaterialTheme.typography.headlineSmall.copy(
                fontWeight = FontWeight.Bold
            ),
            textAlign = TextAlign.Center,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis
        )

        Spacer(modifier = Modifier.height(8.dp))

        Text(
            text = track.artist ?: "Unknown Artist",
            style = MaterialTheme.typography.titleMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )

        if (track.album != null) {
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = track.album,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                textAlign = TextAlign.Center,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

@Composable
private fun ProgressSection(
    currentPosition: Long,
    duration: Long,
    onSeek: (Long) -> Unit,
    onDragStart: () -> Unit,
    onDragEnd: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier) {
        val progress = if (duration > 0) currentPosition.toFloat() / duration.toFloat() else 0f

        Slider(
            value = progress,
            onValueChange = { newProgress ->
                val newPosition = (newProgress * duration).toLong()
                onSeek(newPosition)
            },
            onValueChangeFinished = { onDragEnd() },
            modifier = Modifier.fillMaxWidth()
        )

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                text = formatTime(currentPosition),
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Text(
                text = formatTime(duration),
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun ControlButtonsSection(
    isPlaying: Boolean,
    playlistMode: PlaylistMode,
    canSkipPrevious: Boolean,
    canSkipNext: Boolean,
    onPlayPause: () -> Unit,
    onSkipPrevious: () -> Unit,
    onSkipNext: () -> Unit,
    onToggleMode: () -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly,
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Shuffle/Repeat Mode
        IconButton(
            onClick = onToggleMode,
            modifier = Modifier.size(48.dp)
        ) {
            val (icon, tint) = when (playlistMode) {
                PlaylistMode.SHUFFLE -> PhosphorIcons.Shuffle to MaterialTheme.colorScheme.primary
                PlaylistMode.REPEAT_ALL -> PhosphorIcons.Repeat to MaterialTheme.colorScheme.primary
                PlaylistMode.REPEAT_ONE -> PhosphorIcons.RepeatOne to MaterialTheme.colorScheme.primary
                else -> PhosphorIcons.Shuffle to MaterialTheme.colorScheme.onSurfaceVariant
            }
            Icon(icon, contentDescription = "Playlist Mode", tint = tint)
        }

        // Previous Track
        IconButton(
            onClick = onSkipPrevious,
            enabled = canSkipPrevious,
            modifier = Modifier.size(56.dp)
        ) {
            Icon(
                PhosphorIcons.SkipPrevious,
                contentDescription = "Previous",
                modifier = Modifier.size(32.dp)
            )
        }

        // Play/Pause
        FilledIconButton(
            onClick = onPlayPause,
            modifier = Modifier.size(72.dp)
        ) {
            Icon(
                if (isPlaying) PhosphorIcons.Pause else Icons.Default.PlayArrow,
                contentDescription = if (isPlaying) "Pause" else "Play",
                modifier = Modifier.size(36.dp)
            )
        }

        // Next Track
        IconButton(
            onClick = onSkipNext,
            enabled = canSkipNext,
            modifier = Modifier.size(56.dp)
        ) {
            Icon(
                PhosphorIcons.SkipNext,
                contentDescription = "Next",
                modifier = Modifier.size(32.dp)
            )
        }

        // Add to Favorites
        IconButton(
            onClick = { },
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                Icons.Default.FavoriteBorder,
                contentDescription = "Favorite",
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun SecondaryControlsSection(
    onVolumeClick: () -> Unit,
    onEqualizerClick: () -> Unit,
    onShareClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly
    ) {
        IconButton(onClick = onVolumeClick) {
            Icon(PhosphorIcons.VolumeUp, contentDescription = "Volume")
        }

        IconButton(onClick = onEqualizerClick) {
            Icon(PhosphorIcons.Equalizer, contentDescription = "Equalizer")
        }

        IconButton(onClick = onShareClick) {
            Icon(Icons.Default.Share, contentDescription = "Share")
        }
    }
}

private fun formatTime(milliseconds: Long): String {
    val seconds = (milliseconds / 1000).toInt()
    val minutes = seconds / 60
    val remainingSeconds = seconds % 60
    return "%d:%02d".format(minutes, remainingSeconds)
}
