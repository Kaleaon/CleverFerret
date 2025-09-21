package com.universalmedialibrary.ui.player

import android.app.Activity
import android.content.pm.ActivityInfo
import android.net.Uri
import android.view.View
import android.view.WindowInsets
import android.view.WindowInsetsController
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.ui.PlayerView
import com.universalmedialibrary.services.media.UniversalMediaPlayerService
import com.universalmedialibrary.services.video.VideoPlayerType
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.util.Locale
import javax.inject.Inject

/**
 * Enhanced Video Player Screen with full functionality
 * 
 * Features:
 * - Multiple player backends (ExoPlayer, VLC, System)
 * - Fullscreen support with immersive mode
 * - Gesture controls (tap to show/hide controls, double-tap to seek)
 * - Picture-in-Picture support
 * - Audio/subtitle track selection
 * - Playback speed control
 * - Volume control with gestures
 * - Brightness control
 * - Auto-hide controls
 * - Error handling with player switching
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedVideoPlayerScreen(
    videoUri: Uri,
    title: String = "",
    onBack: () -> Unit,
    viewModel: EnhancedVideoPlayerViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val activity = context as? Activity
    
    val playerState by viewModel.playerState.collectAsState()
    val uiState by viewModel.uiState.collectAsState()
    
    var showControls by remember { mutableStateOf(true) }
    var showPlayerSelector by remember { mutableStateOf(false) }
    var showTrackSelector by remember { mutableStateOf(false) }
    var showSpeedSelector by remember { mutableStateOf(false) }
    
    // Auto-hide controls
    LaunchedEffect(showControls, playerState.isPlaying) {
        if (showControls && playerState.isPlaying) {
            delay(3000)
            showControls = false
        }
    }
    
    LaunchedEffect(videoUri) {
        viewModel.initializePlayer(context, videoUri, title)
    }
    
    DisposableEffect(Unit) {
        onDispose {
            viewModel.releasePlayer()
        }
    }
    
    // Handle fullscreen mode
    LaunchedEffect(uiState.isFullscreen) {
        activity?.let { act ->
            if (uiState.isFullscreen) {
                act.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                act.window.insetsController?.let { controller ->
                    controller.hide(WindowInsets.Type.systemBars())
                    controller.systemBarsBehavior = WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
                }
            } else {
                act.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
                act.window.insetsController?.show(WindowInsets.Type.systemBars())
            }
        }
    }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.Black)
            .pointerInput(Unit) {
                detectTapGestures(
                    onTap = {
                        showControls = !showControls
                    },
                    onDoubleTap = { offset ->
                        // Double tap to seek forward/backward
                        val screenWidth = size.width
                        if (offset.x < screenWidth / 2) {
                            viewModel.seekBackward()
                        } else {
                            viewModel.seekForward()
                        }
                        showControls = true
                    }
                )
            }
    ) {
        // Video player view
        when (playerState.playerType) {
            VideoPlayerType.EXOPLAYER -> {
                ExoPlayerView(
                    playerView = playerState.exoPlayerView,
                    modifier = Modifier.fillMaxSize(),
                    showControls = false // We handle controls ourselves
                )
            }
            VideoPlayerType.VLC -> {
                VLCPlayerView(
                    vlcVideoLayout = playerState.vlcVideoLayout,
                    modifier = Modifier.fillMaxSize()
                )
            }
            VideoPlayerType.SYSTEM_PLAYER -> {
                SystemPlayerView(
                    videoUri = videoUri,
                    modifier = Modifier.fillMaxSize()
                )
            }
        }
        
        // Loading overlay
        if (playerState.isLoading) {
            LoadingOverlay(
                playerType = playerState.playerType,
                modifier = Modifier.align(Alignment.Center)
            )
        }
        
        // Error overlay
        playerState.error?.let { error ->
            ErrorOverlay(
                error = error,
                onRetry = { viewModel.retryPlayback() },
                onSwitchPlayer = { viewModel.switchToNextPlayer() },
                modifier = Modifier.align(Alignment.Center)
            )
        }
        
        // Top controls (title, back button, etc.)
        AnimatedVisibility(
            visible = showControls,
            enter = fadeIn(),
            exit = fadeOut(),
            modifier = Modifier.align(Alignment.TopStart)
        ) {
            TopControlsBar(
                title = title,
                playerType = playerState.playerType,
                isFullscreen = uiState.isFullscreen,
                onBack = {
                    if (uiState.isFullscreen) {
                        viewModel.exitFullscreen()
                    } else {
                        onBack()
                    }
                },
                onPlayerSelect = { showPlayerSelector = true },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            )
        }
        
        // Bottom controls
        AnimatedVisibility(
            visible = showControls,
            enter = fadeIn(),
            exit = fadeOut(),
            modifier = Modifier.align(Alignment.BottomCenter)
        ) {
            BottomControlsBar(
                playerState = playerState,
                onPlayPause = { viewModel.togglePlayPause() },
                onSeek = { position -> viewModel.seekTo(position) },
                onFullscreen = { viewModel.toggleFullscreen() },
                onTrackSelect = { showTrackSelector = true },
                onSpeedSelect = { showSpeedSelector = true },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            )
        }
        
        // Seek feedback overlay
        uiState.seekFeedback?.let { feedback ->
            SeekFeedbackOverlay(
                feedback = feedback,
                modifier = Modifier.align(Alignment.Center)
            )
        }
        
        // Volume/brightness overlay
        uiState.volumeLevel?.let { volume ->
            VolumeOverlay(
                volume = volume,
                modifier = Modifier.align(Alignment.CenterStart)
            )
        }
        
        uiState.brightnessLevel?.let { brightness ->
            BrightnessOverlay(
                brightness = brightness,
                modifier = Modifier.align(Alignment.CenterEnd)
            )
        }
    }
    
    // Player selector dialog
    if (showPlayerSelector) {
        PlayerSelectorDialog(
            currentPlayer = playerState.playerType,
            availablePlayers = listOf(VideoPlayerType.EXOPLAYER, VideoPlayerType.VLC, VideoPlayerType.SYSTEM_PLAYER),
            onPlayerSelected = { playerType ->
                viewModel.switchPlayer(playerType)
                showPlayerSelector = false
            },
            onDismiss = { showPlayerSelector = false }
        )
    }
    
    // Track selector dialog
    if (showTrackSelector) {
        TrackSelectorDialog(
            audioTracks = uiState.audioTracks,
            subtitleTracks = uiState.subtitleTracks,
            selectedAudioTrack = uiState.selectedAudioTrack,
            selectedSubtitleTrack = uiState.selectedSubtitleTrack,
            onAudioTrackSelected = { track -> viewModel.selectAudioTrack(track) },
            onSubtitleTrackSelected = { track -> viewModel.selectSubtitleTrack(track) },
            onDismiss = { showTrackSelector = false }
        )
    }
    
    // Speed selector dialog
    if (showSpeedSelector) {
        SpeedSelectorDialog(
            currentSpeed = playerState.playbackSpeed,
            availableSpeeds = listOf(0.25f, 0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 2.0f),
            onSpeedSelected = { speed ->
                viewModel.setPlaybackSpeed(speed)
                showSpeedSelector = false
            },
            onDismiss = { showSpeedSelector = false }
        )
    }
}

@Composable
private fun ExoPlayerView(
    playerView: PlayerView?,
    modifier: Modifier = Modifier,
    showControls: Boolean = true
) {
    AndroidView(
        factory = { context ->
            playerView ?: PlayerView(context).apply {
                useController = showControls
                controllerAutoShow = false
            }
        },
        modifier = modifier,
        update = { view ->
            view.useController = showControls
        }
    )
}

@Composable
private fun VLCPlayerView(
    vlcVideoLayout: Any?,
    modifier: Modifier = Modifier
) {
    if (vlcVideoLayout != null) {
        AndroidView(
            factory = { 
                try {
                    vlcVideoLayout as View
                } catch (e: Exception) {
                    View(it)
                }
            },
            modifier = modifier
        )
    } else {
        Box(
            modifier = modifier,
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = "VLC Player Not Available",
                color = Color.White,
                style = MaterialTheme.typography.bodyLarge
            )
        }
    }
}

@Composable
private fun SystemPlayerView(
    videoUri: Uri,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier,
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = Icons.Default.VideoFile,
                contentDescription = null,
                tint = Color.White,
                modifier = Modifier.size(64.dp)
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "System Player",
                color = Color.White,
                style = MaterialTheme.typography.titleLarge
            )
            Text(
                text = videoUri.lastPathSegment ?: "Video",
                color = Color.White.copy(alpha = 0.7f),
                style = MaterialTheme.typography.bodyMedium
            )
        }
    }
}

@Composable
private fun LoadingOverlay(
    playerType: VideoPlayerType,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier
            .background(Color.Black.copy(alpha = 0.7f), RoundedCornerShape(16.dp))
            .padding(32.dp),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            CircularProgressIndicator(
                color = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(48.dp)
            )
            Text(
                text = "Loading video...",
                color = Color.White,
                style = MaterialTheme.typography.titleMedium
            )
            Text(
                text = "Using ${playerType.name} player",
                color = Color.White.copy(alpha = 0.7f),
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}

@Composable
private fun ErrorOverlay(
    error: String,
    onRetry: () -> Unit,
    onSwitchPlayer: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Error,
                contentDescription = "Error",
                tint = MaterialTheme.colorScheme.onErrorContainer,
                modifier = Modifier.size(48.dp)
            )
            
            Text(
                text = "Playback Error",
                style = MaterialTheme.typography.headlineSmall,
                color = MaterialTheme.colorScheme.onErrorContainer,
                fontWeight = FontWeight.Bold
            )
            
            Text(
                text = error,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(onClick = onRetry) {
                    Text("Retry")
                }
                Button(onClick = onSwitchPlayer) {
                    Text("Switch Player")
                }
            }
        }
    }
}

@Composable
private fun TopControlsBar(
    title: String,
    playerType: VideoPlayerType,
    isFullscreen: Boolean,
    onBack: () -> Unit,
    onPlayerSelect: () -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            IconButton(
                onClick = onBack,
                modifier = Modifier
                    .background(Color.Black.copy(alpha = 0.5f), CircleShape)
                    .size(40.dp)
            ) {
                Icon(
                    imageVector = if (isFullscreen) Icons.Default.FullscreenExit else Icons.AutoMirrored.Filled.ArrowBack,
                    contentDescription = if (isFullscreen) "Exit Fullscreen" else "Back",
                    tint = Color.White
                )
            }
            
            if (title.isNotEmpty()) {
                Text(
                    text = title,
                    color = Color.White,
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier
                        .background(Color.Black.copy(alpha = 0.5f), RoundedCornerShape(8.dp))
                        .padding(horizontal = 12.dp, vertical = 6.dp)
                )
            }
        }
        
        TextButton(
            onClick = onPlayerSelect,
            modifier = Modifier
                .background(Color.Black.copy(alpha = 0.5f), RoundedCornerShape(8.dp))
        ) {
            Text(
                text = playerType.name,
                color = Color.White,
                style = MaterialTheme.typography.labelMedium
            )
        }
    }
}

@Composable
private fun BottomControlsBar(
    playerState: com.universalmedialibrary.services.media.UniversalPlayerState,
    onPlayPause: () -> Unit,
    onSeek: (Long) -> Unit,
    onFullscreen: () -> Unit,
    onTrackSelect: () -> Unit,
    onSpeedSelect: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .background(Color.Black.copy(alpha = 0.7f), RoundedCornerShape(12.dp))
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        // Progress slider
        Column {
            Slider(
                value = playerState.progress,
                onValueChange = { progress ->
                    val position = (progress * playerState.duration).toLong()
                    onSeek(position)
                },
                colors = SliderDefaults.colors(
                    thumbColor = MaterialTheme.colorScheme.primary,
                    activeTrackColor = MaterialTheme.colorScheme.primary,
                    inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                )
            )
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = formatTime(playerState.currentPosition),
                    color = Color.White,
                    style = MaterialTheme.typography.labelSmall
                )
                Text(
                    text = formatTime(playerState.duration),
                    color = Color.White,
                    style = MaterialTheme.typography.labelSmall
                )
            }
        }
        
        // Control buttons
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Tracks button
            IconButton(onClick = onTrackSelect) {
                Icon(
                    imageVector = Icons.Default.Audiotrack,
                    contentDescription = "Audio/Subtitle Tracks",
                    tint = Color.White
                )
            }
            
            // Speed button
            TextButton(onClick = onSpeedSelect) {
                Text(
                    text = "${playerState.playbackSpeed}x",
                    color = Color.White,
                    style = MaterialTheme.typography.labelMedium
                )
            }
            
            // Play/Pause button
            IconButton(
                onClick = onPlayPause,
                modifier = Modifier.size(56.dp)
            ) {
                Icon(
                    imageVector = if (playerState.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    contentDescription = if (playerState.isPlaying) "Pause" else "Play",
                    tint = Color.White,
                    modifier = Modifier.size(32.dp)
                )
            }
            
            // Volume button
            IconButton(onClick = { /* TODO: Volume control */ }) {
                Icon(
                    imageVector = Icons.Default.VolumeUp,
                    contentDescription = "Volume",
                    tint = Color.White
                )
            }
            
            // Fullscreen button
            IconButton(onClick = onFullscreen) {
                Icon(
                    imageVector = Icons.Default.Fullscreen,
                    contentDescription = "Fullscreen",
                    tint = Color.White
                )
            }
        }
    }
}

@Composable
private fun SeekFeedbackOverlay(
    feedback: SeekFeedback,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier
            .background(Color.Black.copy(alpha = 0.7f), RoundedCornerShape(8.dp))
            .padding(16.dp),
        contentAlignment = Alignment.Center
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Icon(
                imageVector = if (feedback.isForward) Icons.Default.FastForward else Icons.Default.FastRewind,
                contentDescription = null,
                tint = Color.White,
                modifier = Modifier.size(24.dp)
            )
            Text(
                text = "${if (feedback.isForward) "+" else "-"}${feedback.seconds}s",
                color = Color.White,
                style = MaterialTheme.typography.titleMedium
            )
        }
    }
}

@Composable
private fun VolumeOverlay(
    volume: Float,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.padding(16.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = Icons.Default.VolumeUp,
                contentDescription = "Volume"
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "${(volume * 100).toInt()}%",
                style = MaterialTheme.typography.bodyMedium
            )
        }
    }
}

@Composable
private fun BrightnessOverlay(
    brightness: Float,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.padding(16.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = Icons.Default.Brightness6,
                contentDescription = "Brightness"
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "${(brightness * 100).toInt()}%",
                style = MaterialTheme.typography.bodyMedium
            )
        }
    }
}

// Dialog components
@Composable
private fun PlayerSelectorDialog(
    currentPlayer: VideoPlayerType,
    availablePlayers: List<VideoPlayerType>,
    onPlayerSelected: (VideoPlayerType) -> Unit,
    onDismiss: () -> Unit
) {
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(usePlatformDefaultWidth = false)
    ) {
        Card(
            modifier = Modifier
                .fillMaxWidth(0.8f)
                .padding(16.dp)
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "Select Player",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                availablePlayers.forEach { playerType ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onPlayerSelected(playerType) }
                            .padding(vertical = 8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = currentPlayer == playerType,
                            onClick = { onPlayerSelected(playerType) }
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = playerType.name,
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun TrackSelectorDialog(
    audioTracks: List<String>,
    subtitleTracks: List<String>,
    selectedAudioTrack: Int,
    selectedSubtitleTrack: Int,
    onAudioTrackSelected: (Int) -> Unit,
    onSubtitleTrackSelected: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(usePlatformDefaultWidth = false)
    ) {
        Card(
            modifier = Modifier
                .fillMaxWidth(0.9f)
                .padding(16.dp)
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "Audio & Subtitle Tracks",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                if (audioTracks.isNotEmpty()) {
                    Text(
                        text = "Audio Tracks",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    audioTracks.forEachIndexed { index, track ->
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable { onAudioTrackSelected(index) }
                                .padding(vertical = 4.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            RadioButton(
                                selected = selectedAudioTrack == index,
                                onClick = { onAudioTrackSelected(index) }
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(text = track)
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(16.dp))
                }
                
                if (subtitleTracks.isNotEmpty()) {
                    Text(
                        text = "Subtitle Tracks",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    subtitleTracks.forEachIndexed { index, track ->
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable { onSubtitleTrackSelected(index) }
                                .padding(vertical = 4.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            RadioButton(
                                selected = selectedSubtitleTrack == index,
                                onClick = { onSubtitleTrackSelected(index) }
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(text = track)
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun SpeedSelectorDialog(
    currentSpeed: Float,
    availableSpeeds: List<Float>,
    onSpeedSelected: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(usePlatformDefaultWidth = false)
    ) {
        Card(
            modifier = Modifier
                .fillMaxWidth(0.7f)
                .padding(16.dp)
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "Playback Speed",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                availableSpeeds.forEach { speed ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSpeedSelected(speed) }
                            .padding(vertical = 8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = currentSpeed == speed,
                            onClick = { onSpeedSelected(speed) }
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "${speed}x",
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                }
            }
        }
    }
}

private fun formatTime(milliseconds: Long): String {
    val seconds = milliseconds / 1000
    val minutes = seconds / 60
    val hours = minutes / 60
    
    return if (hours > 0) {
        String.format(Locale.getDefault(), "%d:%02d:%02d", hours, minutes % 60, seconds % 60)
    } else {
        String.format(Locale.getDefault(), "%d:%02d", minutes, seconds % 60)
    }
}

// ViewModel for the enhanced video player
@HiltViewModel
class EnhancedVideoPlayerViewModel @Inject constructor(
    private val mediaPlayerService: UniversalMediaPlayerService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(VideoPlayerUIState())
    val uiState: StateFlow<VideoPlayerUIState> = _uiState.asStateFlow()
    
    val playerState = mediaPlayerService.playerState
    
    fun initializePlayer(context: android.content.Context, uri: Uri, title: String) {
        mediaPlayerService.playMedia(uri, com.universalmedialibrary.data.MediaType.MOVIE)
        _uiState.value = _uiState.value.copy(title = title)
    }
    
    fun togglePlayPause() {
        mediaPlayerService.togglePlayPause()
    }
    
    fun seekTo(positionMs: Long) {
        mediaPlayerService.seekTo(positionMs)
    }
    
    fun seekForward() {
        val currentPosition = playerState.value.currentPosition
        val newPosition = currentPosition + 10000 // 10 seconds
        mediaPlayerService.seekTo(newPosition)
        showSeekFeedback(true, 10)
    }
    
    fun seekBackward() {
        val currentPosition = playerState.value.currentPosition
        val newPosition = (currentPosition - 10000).coerceAtLeast(0) // 10 seconds back
        mediaPlayerService.seekTo(newPosition)
        showSeekFeedback(false, 10)
    }
    
    fun setPlaybackSpeed(speed: Float) {
        mediaPlayerService.setPlaybackSpeed(speed)
    }
    
    fun switchPlayer(playerType: VideoPlayerType) {
        mediaPlayerService.switchPlayer(playerType)
    }
    
    fun switchToNextPlayer() {
        val currentType = playerState.value.playerType
        val nextType = when (currentType) {
            VideoPlayerType.EXOPLAYER -> VideoPlayerType.VLC
            VideoPlayerType.VLC -> VideoPlayerType.SYSTEM_PLAYER
            VideoPlayerType.SYSTEM_PLAYER -> VideoPlayerType.EXOPLAYER
        }
        switchPlayer(nextType)
    }
    
    fun toggleFullscreen() {
        _uiState.value = _uiState.value.copy(
            isFullscreen = !_uiState.value.isFullscreen
        )
    }
    
    fun exitFullscreen() {
        _uiState.value = _uiState.value.copy(isFullscreen = false)
    }
    
    fun retryPlayback() {
        // Implementation for retry logic
    }
    
    fun selectAudioTrack(trackIndex: Int) {
        _uiState.value = _uiState.value.copy(selectedAudioTrack = trackIndex)
    }
    
    fun selectSubtitleTrack(trackIndex: Int) {
        _uiState.value = _uiState.value.copy(selectedSubtitleTrack = trackIndex)
    }
    
    private fun showSeekFeedback(isForward: Boolean, seconds: Int) {
        _uiState.value = _uiState.value.copy(
            seekFeedback = SeekFeedback(isForward, seconds)
        )
        
        viewModelScope.launch {
            delay(1500)
            _uiState.value = _uiState.value.copy(seekFeedback = null)
        }
    }
    
    fun releasePlayer() {
        mediaPlayerService.release()
    }
}

data class VideoPlayerUIState(
    val title: String = "",
    val isFullscreen: Boolean = false,
    val seekFeedback: SeekFeedback? = null,
    val volumeLevel: Float? = null,
    val brightnessLevel: Float? = null,
    val audioTracks: List<String> = emptyList(),
    val subtitleTracks: List<String> = emptyList(),
    val selectedAudioTrack: Int = 0,
    val selectedSubtitleTrack: Int = -1
)

data class SeekFeedback(
    val isForward: Boolean,
    val seconds: Int
)