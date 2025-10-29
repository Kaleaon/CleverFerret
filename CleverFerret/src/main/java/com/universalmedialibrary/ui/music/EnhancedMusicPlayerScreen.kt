package com.universalmedialibrary.ui.music

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Info
import androidx.compose.material.icons.filled.KeyboardArrowDown
import androidx.compose.material.icons.filled.MoreVert
import androidx.compose.material.icons.filled.Timer
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
import kotlinx.coroutines.isActive

/**
 * Enhanced Music Player Screen with all PowerampAPI features
 * 
 * New Features:
 * - Audio quality badges
 * - Full metadata display (25+ fields)
 * - Seek forward/backward buttons
 * - Volume slider
 * - Speed controls
 * - Enhanced queue management
 * - Track details dialog
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedMusicPlayerScreen(
    onNavigateBack: () -> Unit,
    onNavigateToQueue: () -> Unit,
    onNavigateToAlbum: (String) -> Unit,
    onNavigateToVisualizer: () -> Unit = {},
    viewModel: MusicPlayerViewModel = hiltViewModel()
) {
    // State from ViewModel
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

    var currentPosition by remember { mutableLongStateOf(0L) }
    var isDragging by remember { mutableStateOf(false) }
    
    // Dialog states
    var showSpeedDialog by remember { mutableStateOf(false) }
    var showVolumeDialog by remember { mutableStateOf(false) }
    var showEqualizerDialog by remember { mutableStateOf(false) }
    var showSleepTimerDialog by remember { mutableStateOf(false) }
    var showAddToPlaylistDialog by remember { mutableStateOf(false) }
    var showTrackDetailsDialog by remember { mutableStateOf(false) }

    // Load enhanced metadata when track changes
    LaunchedEffect(currentTrack?.id) {
        if (currentTrack != null) {
            viewModel.loadEnhancedMetadata()
        }
    }

    // Update position periodically when playing
    LaunchedEffect(playbackState.isPlaying) {
        while (playbackState.isPlaying && isActive) {
            try {
                if (!isDragging) {
                    currentPosition = viewModel.getCurrentPosition()
                }
            } catch (e: Exception) {
                // Handle position update error
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
                    // Queue button with badge
                    IconButton(onClick = onNavigateToQueue) {
                        Badge(containerColor = MaterialTheme.colorScheme.primary) {
                            Text("${queue.size}")
                        }
                        Icon(PhosphorIcons.QueueMusic, contentDescription = "Queue")
                    }
                    
                    // Visualizer button
                    com.universalmedialibrary.ui.visualizer.VisualizerButton(
                        onClick = onNavigateToVisualizer
                    )
                    
                    // Sleep timer indicator
                    if (sleepTimerState.isActive) {
                        IconButton(onClick = { showSleepTimerDialog = true }) {
                            Badge(containerColor = MaterialTheme.colorScheme.primary) {
                                Text(sleepTimerState.minutesRemaining.toString())
                            }
                            Icon(Icons.Default.Timer, contentDescription = "Sleep Timer Active")
                        }
                    }
                    
                    // More menu
                    var showMoreMenu by remember { mutableStateOf(false) }
                    Box {
                        IconButton(onClick = { showMoreMenu = true }) {
                            Icon(Icons.Default.MoreVert, contentDescription = "More")
                        }
                        DropdownMenu(
                            expanded = showMoreMenu,
                            onDismissRequest = { showMoreMenu = false }
                        ) {
                            DropdownMenuItem(
                                text = { Text("Track Info") },
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

                // Album Art Section (using existing component)
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

                // Enhanced Track Information with metadata
                currentTrack?.let { track ->
                    EnhancedTrackInfoSection(
                        track = track,
                        metadata = currentTrackMetadata,
                        onShowDetails = { showTrackDetailsDialog = true },
                        modifier = Modifier.padding(horizontal = 24.dp)
                    )
                }

                Spacer(modifier = Modifier.height(24.dp))

                // Progress Section (inline implementation)
                Column(modifier = Modifier.padding(horizontal = 24.dp)) {
                    val progress = if ((currentTrack?.duration ?: 0L) > 0) 
                        currentPosition.toFloat() / (currentTrack?.duration ?: 1L).toFloat() 
                    else 0f

                    Slider(
                        value = progress,
                        onValueChange = { newProgress ->
                            val newPosition = (newProgress * (currentTrack?.duration ?: 0L)).toLong()
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

                Spacer(modifier = Modifier.height(24.dp))

                // Enhanced Control Buttons with Seek
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

                Spacer(modifier = Modifier.height(16.dp))

                // Volume Control
                VolumeControlSection(
                    volume = volume,
                    onVolumeChange = viewModel::setVolume,
                    modifier = Modifier.padding(horizontal = 24.dp)
                )

                Spacer(modifier = Modifier.height(16.dp))

                // Compact Secondary Controls
                CompactSecondaryControls(
                    volume = volume,
                    speed = playbackSpeed,
                    onVolumeClick = { showVolumeDialog = true },
                    onSpeedClick = { showSpeedDialog = true },
                    onEqualizerClick = { showEqualizerDialog = true },
                    onShareClick = viewModel::shareTrack,
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
                snackbarHostState.showSnackbar(
                    message = playbackState.error ?: "Playback error",
                    duration = SnackbarDuration.Long
                )
            }
        }
    }
    
    // Dialogs
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
        val playlists by viewModel.playlists.collectAsState()
        
        AddToPlaylistDialog(
            playlists = playlists.map { it.name },
            onPlaylistSelected = { playlistName ->
                val playlist = playlists.find { it.name == playlistName }
                playlist?.let { viewModel.addToPlaylist(it.playlistId) }
                showAddToPlaylistDialog = false
            },
            onCreateNew = { name ->
                viewModel.createPlaylistWithCurrentTrack(name)
                showAddToPlaylistDialog = false
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
}

/**
 * Format time in milliseconds to MM:SS format
 */
private fun formatTime(timeMs: Long): String {
    val totalSeconds = timeMs / 1000
    val minutes = totalSeconds / 60
    val seconds = totalSeconds % 60
    return String.format("%d:%02d", minutes, seconds)
}
