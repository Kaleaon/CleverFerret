package com.universalmedialibrary.ui.music

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.services.music.PlaylistMode
import com.universalmedialibrary.ui.icons.PhosphorIcons
import com.universalmedialibrary.ui.music.components.CreatePlaylistDialog
import com.universalmedialibrary.ui.player.SyncedLyricsDisplay
import com.universalmedialibrary.ui.player.SyncedLyricsViewModel
import kotlinx.coroutines.isActive

/**
 * Unified Music Player Screen
 * 
 * Single canonical player handling:
 * - All music playback controls (play/pause, seek, skip, shuffle, repeat, favorite, speed, volume, equalizer, sleep timer, queue, visualizer)
 * - Synced lyrics display
 * - Audio metadata and track details views
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun UnifiedMusicPlayerScreen(
    onNavigateBack: () -> Unit,
    onNavigateToQueue: () -> Unit,
    onNavigateToAlbum: (String) -> Unit = {},
    onNavigateToVisualizer: () -> Unit = {},
    viewModel: MusicPlayerViewModel = hiltViewModel(),
    lyricsViewModel: SyncedLyricsViewModel = hiltViewModel()
) {
    val playbackState by viewModel.playbackState.collectAsStateWithLifecycle()
    val snackbarHostState = remember { SnackbarHostState() }
    val currentTrack by viewModel.currentTrack.collectAsStateWithLifecycle()
    val currentTrackMetadata by viewModel.currentTrackMetadata.collectAsStateWithLifecycle()
    val playlistMode by viewModel.playlistMode.collectAsStateWithLifecycle()
    val queue by viewModel.queue.collectAsStateWithLifecycle()
    val playbackSpeed by viewModel.playbackSpeed.collectAsStateWithLifecycle()
    val volume by viewModel.volume.collectAsStateWithLifecycle()
    val equalizerPreset by viewModel.equalizerPreset.collectAsStateWithLifecycle()
    val isFavorite by viewModel.isFavorite.collectAsStateWithLifecycle()
    val sleepTimerState by viewModel.sleepTimerState.collectAsStateWithLifecycle()
    val lyricsUiState by lyricsViewModel.uiState.collectAsStateWithLifecycle()

    var currentPosition by remember { mutableLongStateOf(0L) }
    var isDragging by remember { mutableStateOf(false) }
    
    // Dialog & section states
    var showSpeedDialog by remember { mutableStateOf(false) }
    var showVolumeDialog by remember { mutableStateOf(false) }
    var showEqualizerDialog by remember { mutableStateOf(false) }
    var showSleepTimerDialog by remember { mutableStateOf(false) }
    var showAddToPlaylistDialog by remember { mutableStateOf(false) }
    var showCreatePlaylistDialog by remember { mutableStateOf(false) }
    var showTrackDetailsDialog by remember { mutableStateOf(false) }
    var showLyrics by remember { mutableStateOf(false) }

    LaunchedEffect(currentTrack?.id) {
        if (currentTrack != null) {
            viewModel.loadEnhancedMetadata()
        }
    }

    LaunchedEffect(playbackState.isPlaying) {
        while (playbackState.isPlaying && isActive) {
            try {
                if (!isDragging) {
                    currentPosition = viewModel.getCurrentPosition()
                }
            } catch (e: Exception) {
                // Ignore position update errors
            }
            kotlinx.coroutines.delay(1000)
        }
    }

    Scaffold(
        snackbarHost = { SnackbarHost(snackbarHostState) },
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
                        BadgedBox(
                            badge = {
                                if (queue.isNotEmpty()) {
                                    Badge(
                                        containerColor = MaterialTheme.colorScheme.primary,
                                        contentColor = MaterialTheme.colorScheme.onPrimary
                                    ) {
                                        Text("${queue.size}")
                                    }
                                }
                            }
                        ) {
                            Icon(PhosphorIcons.QueueMusic, contentDescription = "Queue")
                        }
                    }
                    
                    com.universalmedialibrary.ui.visualizer.VisualizerButton(
                        onClick = onNavigateToVisualizer
                    )
                    
                    if (sleepTimerState.isActive) {
                        IconButton(onClick = { showSleepTimerDialog = true }) {
                            BadgedBox(
                                badge = {
                                    Badge(
                                        containerColor = MaterialTheme.colorScheme.primary,
                                        contentColor = MaterialTheme.colorScheme.onPrimary
                                    ) {
                                        Text(sleepTimerState.minutesRemaining.toString())
                                    }
                                }
                            ) {
                                Icon(Icons.Default.Timer, contentDescription = "Sleep Timer Active")
                            }
                        }
                    }
                    
                    var showMoreMenu by remember { mutableStateOf(false) }
                    Box {
                        IconButton(onClick = { showMoreMenu = true }) {
                            Icon(Icons.Default.MoreVert, contentDescription = "More options")
                        }
                        DropdownMenu(
                            expanded = showMoreMenu,
                            onDismissRequest = { showMoreMenu = false }
                        ) {
                            DropdownMenuItem(
                                text = { Text("Track Info & Metadata") },
                                onClick = {
                                    showTrackDetailsDialog = true
                                    showMoreMenu = false
                                },
                                leadingIcon = { Icon(Icons.Default.Info, null) }
                            )
                            DropdownMenuItem(
                                text = { Text("Add to Playlist") },
                                onClick = {
                                    showAddToPlaylistDialog = true
                                    showMoreMenu = false
                                },
                                leadingIcon = { Icon(Icons.Default.Add, null) }
                            )
                            DropdownMenuItem(
                                text = { Text("Sleep Timer") },
                                onClick = {
                                    showSleepTimerDialog = true
                                    showMoreMenu = false
                                },
                                leadingIcon = { Icon(Icons.Default.Timer, null) }
                            )
                        }
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

                Spacer(modifier = Modifier.height(16.dp))

                currentTrack?.let { track ->
                    EnhancedTrackInfoSection(
                        track = track,
                        metadata = currentTrackMetadata,
                        onShowDetails = { showTrackDetailsDialog = true },
                        modifier = Modifier.padding(horizontal = 24.dp)
                    )
                }

                Spacer(modifier = Modifier.height(16.dp))

                Column(modifier = Modifier.padding(horizontal = 24.dp)) {
                    val duration = currentTrack?.duration ?: 1L
                    val progress = if (duration > 0) currentPosition.toFloat() / duration.toFloat() else 0f

                    Slider(
                        value = progress.coerceIn(0f, 1f),
                        onValueChange = { newProgress ->
                            val newPosition = (newProgress * duration).toLong()
                            currentPosition = newPosition
                            viewModel.seekTo(newPosition)
                        },
                        onValueChangeFinished = { isDragging = false },
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
                            text = formatTime(currentTrack?.duration ?: 0L),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                Spacer(modifier = Modifier.height(16.dp))

                EnhancedControlButtonsSection(
                    isPlaying = playbackState.isPlaying,
                    playlistMode = playlistMode,
                    canSkipPrevious = true,
                    canSkipNext = queue.size > 1,
                    onPlayPause = viewModel::togglePlayPause,
                    onSkipPrevious = viewModel::skipToPrevious,
                    onSkipNext = viewModel::skipToNext,
                    onSeekBackward = { viewModel.seekBackward() },
                    onSeekForward = { viewModel.seekForward() },
                    onToggleShuffle = viewModel::toggleShuffle,
                    onToggleRepeat = viewModel::toggleRepeat,
                    isFavorite = isFavorite,
                    onToggleFavorite = viewModel::toggleFavorite,
                    modifier = Modifier.padding(horizontal = 24.dp)
                )

                Spacer(modifier = Modifier.height(12.dp))

                CompactSecondaryControls(
                    volume = volume,
                    speed = playbackSpeed,
                    onVolumeClick = { showVolumeDialog = true },
                    onSpeedClick = { showSpeedDialog = true },
                    onEqualizerClick = { showEqualizerDialog = true },
                    onShareClick = viewModel::shareTrack,
                    modifier = Modifier.padding(horizontal = 24.dp)
                )

                Spacer(modifier = Modifier.height(12.dp))

                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 24.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    TextButton(onClick = { showLyrics = !showLyrics }) {
                        Icon(
                            imageVector = if (showLyrics) Icons.Default.MusicNote else Icons.Default.Lyrics,
                            contentDescription = "Lyrics"
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(if (showLyrics) "Hide Lyrics" else "Show Lyrics")
                    }

                    if (showLyrics) {
                        if (lyricsUiState.isLoading) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                strokeWidth = 2.dp
                            )
                        } else {
                            IconButton(
                                onClick = {
                                    if (currentTrack != null) {
                                        lyricsViewModel.refreshLyrics()
                                    }
                                },
                                enabled = currentTrack != null
                            ) {
                                Icon(Icons.Default.Refresh, contentDescription = "Refresh Lyrics")
                            }
                        }
                    }
                }

                if (showLyrics) {
                    Spacer(modifier = Modifier.height(8.dp))
                    ElevatedCard(
                        modifier = Modifier
                            .fillMaxWidth()
                            .heightIn(min = 180.dp, max = 260.dp)
                            .padding(horizontal = 24.dp)
                    ) {
                        SyncedLyricsDisplay(
                            track = currentTrack,
                            currentPositionMs = currentPosition,
                            modifier = Modifier.fillMaxSize(),
                            viewModel = lyricsViewModel
                        )
                    }
                }

                Spacer(modifier = Modifier.weight(1f))
            }
        } else {
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
                        contentDescription = "Music note",
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

        if (playbackState.hasError) {
            LaunchedEffect(playbackState.error) {
                snackbarHostState.showSnackbar(
                    message = playbackState.error ?: "Playback error",
                    duration = SnackbarDuration.Long
                )
            }
        }
    }

    if (showSpeedDialog) {
        EnhancedPlaybackSpeedDialog(
            currentSpeed = playbackSpeed,
            onSpeedSelected = viewModel::setPlaybackSpeed,
            onDismiss = { showSpeedDialog = false }
        )
    }

    if (showVolumeDialog) {
        EnhancedVolumeDialog(
            currentVolume = volume,
            onVolumeChange = viewModel::setVolume,
            onDismiss = { showVolumeDialog = false }
        )
    }

    if (showEqualizerDialog) {
        EqualizerDialog(
            currentPreset = equalizerPreset,
            onPresetSelected = viewModel::setEqualizerPreset,
            onDismiss = { showEqualizerDialog = false }
        )
    }

    if (showSleepTimerDialog) {
        SleepTimerDialog(
            onTimerSet = viewModel::startSleepTimer,
            onDismiss = { showSleepTimerDialog = false }
        )
    }

    if (showAddToPlaylistDialog) {
        val playlists by viewModel.playlists.collectAsStateWithLifecycle()
        AddToPlaylistDialog(
            playlists = playlists.map { it.name },
            onPlaylistSelected = { playlistName ->
                val playlist = playlists.find { it.name == playlistName }
                playlist?.let { viewModel.addToPlaylist(it.playlistId) }
                showAddToPlaylistDialog = false
            },
            onCreateNew = {
                showAddToPlaylistDialog = false
                showCreatePlaylistDialog = true
            },
            onDismiss = { showAddToPlaylistDialog = false }
        )
    }

    if (showTrackDetailsDialog && currentTrack != null) {
        TrackDetailsDialog(
            track = currentTrack!!,
            metadata = currentTrackMetadata,
            onDismiss = { showTrackDetailsDialog = false }
        )
    }

    if (showCreatePlaylistDialog) {
        CreatePlaylistDialog(
            onDismiss = { showCreatePlaylistDialog = false },
            onConfirm = { playlistName ->
                viewModel.createPlaylistWithCurrentTrack(playlistName)
                showCreatePlaylistDialog = false
            }
        )
    }
}

private fun formatTime(timeMs: Long): String {
    val totalSeconds = timeMs / 1000
    val minutes = totalSeconds / 60
    val seconds = totalSeconds % 60
    return String.format(java.util.Locale.US, "%d:%02d", minutes, seconds)
}
