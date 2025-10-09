package com.universalmedialibrary.ui.player

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView
import java.util.Locale

/**
 * Modern Video Player with clean controls and gesture support
 * Supports all video formats via ExoPlayer
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ModernVideoPlayerScreen(
    videoPath: String,
    onNavigateBack: () -> Unit,
    viewModel: ModernVideoPlayerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    var showControls by remember { mutableStateOf(true) }
    var showSettings by remember { mutableStateOf(false) }

    val configuration = LocalConfiguration.current
    val isLandscape = configuration.orientation == android.content.res.Configuration.ORIENTATION_LANDSCAPE

    LaunchedEffect(videoPath) {
        viewModel.loadVideo(videoPath)
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.Black)
            .pointerInput(Unit) {
                detectTapGestures(
                    onTap = { showControls = !showControls }
                )
            }
    ) {
        // Video player
        if (uiState.player != null) {
            AndroidView(
                factory = { context ->
                    PlayerView(context).apply {
                        player = uiState.player
                        useController = false
                        keepScreenOn = true
                    }
                },
                modifier = Modifier.fillMaxSize()
            )
        } else {
            // Loading state
            CircularProgressIndicator(
                modifier = Modifier.align(Alignment.Center),
                color = Color.White
            )
        }

        // Gradient overlays for better control visibility
        AnimatedVisibility(
            visible = showControls,
            enter = fadeIn(),
            exit = fadeOut()
        ) {
            Column {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(200.dp)
                        .background(
                            Brush.verticalGradient(
                                colors = listOf(
                                    Color.Black.copy(alpha = 0.7f),
                                    Color.Transparent
                                )
                            )
                        )
                )
                Spacer(modifier = Modifier.weight(1f))
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(200.dp)
                        .background(
                            Brush.verticalGradient(
                                colors = listOf(
                                    Color.Transparent,
                                    Color.Black.copy(alpha = 0.7f)
                                )
                            )
                        )
                )
            }
        }

        // Top controls
        AnimatedVisibility(
            visible = showControls,
            enter = slideInVertically() + fadeIn(),
            exit = slideOutVertically() + fadeOut(),
            modifier = Modifier.align(Alignment.TopCenter)
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                IconButton(onClick = onNavigateBack) {
                    Icon(
                        Icons.Default.ArrowBack,
                        contentDescription = "Back",
                        tint = Color.White,
                        modifier = Modifier.size(28.dp)
                    )
                }

                Column(
                    modifier = Modifier.weight(1f),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(
                        text = uiState.videoTitle,
                        style = MaterialTheme.typography.titleMedium,
                        color = Color.White,
                        fontWeight = FontWeight.Medium
                    )
                    if (uiState.videoQuality.isNotEmpty()) {
                        Text(
                            text = uiState.videoQuality,
                            style = MaterialTheme.typography.bodySmall,
                            color = Color.White.copy(alpha = 0.7f)
                        )
                    }
                }

                Row {
                    IconButton(onClick = { showSettings = true }) {
                        Icon(
                            Icons.Default.Settings,
                            contentDescription = "Settings",
                            tint = Color.White,
                            modifier = Modifier.size(24.dp)
                        )
                    }
                    IconButton(onClick = { /* TODO: Cast */ }) {
                        Icon(
                            Icons.Default.Cast,
                            contentDescription = "Cast",
                            tint = Color.White,
                            modifier = Modifier.size(24.dp)
                        )
                    }
                }
            }
        }

        // Center play/pause button
        AnimatedVisibility(
            visible = showControls,
            enter = scaleIn() + fadeIn(),
            exit = scaleOut() + fadeOut(),
            modifier = Modifier.align(Alignment.Center)
        ) {
            Surface(
                shape = CircleShape,
                color = Color.White.copy(alpha = 0.2f),
                modifier = Modifier.size(80.dp)
            ) {
                IconButton(
                    onClick = { viewModel.togglePlayPause() },
                    modifier = Modifier.fillMaxSize()
                ) {
                    Icon(
                        if (uiState.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = if (uiState.isPlaying) "Pause" else "Play",
                        tint = Color.White,
                        modifier = Modifier.size(48.dp)
                    )
                }
            }
        }

        // Bottom controls
        AnimatedVisibility(
            visible = showControls,
            enter = slideInVertically(initialOffsetY = { it }) + fadeIn(),
            exit = slideOutVertically(targetOffsetY = { it }) + fadeOut(),
            modifier = Modifier.align(Alignment.BottomCenter)
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            ) {
                // Progress bar
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        text = formatTime(uiState.currentPosition),
                        style = MaterialTheme.typography.bodySmall,
                        color = Color.White
                    )

                    Slider(
                        value = uiState.progress,
                        onValueChange = { viewModel.seekTo(it) },
                        modifier = Modifier.weight(1f),
                        colors = SliderDefaults.colors(
                            thumbColor = Color.White,
                            activeTrackColor = Color(0xFF00E5FF),
                            inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                        )
                    )

                    Text(
                        text = formatTime(uiState.duration),
                        style = MaterialTheme.typography.bodySmall,
                        color = Color.White
                    )
                }

                Spacer(modifier = Modifier.height(16.dp))

                // Control buttons
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    IconButton(onClick = { viewModel.rewind10() }) {
                        Icon(
                            Icons.Default.Replay10,
                            contentDescription = "Rewind 10s",
                            tint = Color.White,
                            modifier = Modifier.size(32.dp)
                        )
                    }

                    IconButton(onClick = { viewModel.previous() }) {
                        Icon(
                            Icons.Default.SkipPrevious,
                            contentDescription = "Previous",
                            tint = Color.White,
                            modifier = Modifier.size(36.dp)
                        )
                    }

                    Surface(
                        shape = CircleShape,
                        color = Color.White,
                        modifier = Modifier.size(56.dp)
                    ) {
                        IconButton(onClick = { viewModel.togglePlayPause() }) {
                            Icon(
                                if (uiState.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                                contentDescription = if (uiState.isPlaying) "Pause" else "Play",
                                tint = Color.Black,
                                modifier = Modifier.size(32.dp)
                            )
                        }
                    }

                    IconButton(onClick = { viewModel.next() }) {
                        Icon(
                            Icons.Default.SkipNext,
                            contentDescription = "Next",
                            tint = Color.White,
                            modifier = Modifier.size(36.dp)
                        )
                    }

                    IconButton(onClick = { viewModel.forward10() }) {
                        Icon(
                            Icons.Default.Forward10,
                            contentDescription = "Forward 10s",
                            tint = Color.White,
                            modifier = Modifier.size(32.dp)
                        )
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Additional controls
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    IconButton(onClick = { viewModel.toggleSubtitles() }) {
                        Icon(
                            Icons.Default.ClosedCaption,
                            contentDescription = "Subtitles",
                            tint = if (uiState.subtitlesEnabled) Color(0xFF00E5FF) else Color.White.copy(alpha = 0.5f)
                        )
                    }

                    IconButton(onClick = { viewModel.changePlaybackSpeed() }) {
                        Text(
                            text = "${uiState.playbackSpeed}x",
                            color = Color.White,
                            style = MaterialTheme.typography.labelLarge
                        )
                    }

                    IconButton(onClick = { viewModel.toggleFullscreen() }) {
                        Icon(
                            if (isLandscape) Icons.Default.FullscreenExit else Icons.Default.Fullscreen,
                            contentDescription = "Fullscreen",
                            tint = Color.White
                        )
                    }

                    IconButton(onClick = { viewModel.changeQuality() }) {
                        Text(
                            text = "HD",
                            color = Color.White,
                            style = MaterialTheme.typography.labelLarge,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }
            }
        }

        // Settings sheet
        if (showSettings) {
            VideoSettingsSheet(
                playbackSpeed = uiState.playbackSpeed,
                onSpeedChange = { viewModel.setPlaybackSpeed(it) },
                subtitlesEnabled = uiState.subtitlesEnabled,
                onSubtitlesToggle = { viewModel.toggleSubtitles() },
                onDismiss = { showSettings = false }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun VideoSettingsSheet(
    playbackSpeed: Float,
    onSpeedChange: (Float) -> Unit,
    subtitlesEnabled: Boolean,
    onSubtitlesToggle: () -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = Color(0xFF1A1A1A)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(24.dp),
            verticalArrangement = Arrangement.spacedBy(20.dp)
        ) {
            Text(
                text = "Playback Settings",
                style = MaterialTheme.typography.titleLarge,
                color = Color.White,
                fontWeight = FontWeight.Bold
            )

            // Playback speed
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                Text(
                    text = "Playback Speed",
                    style = MaterialTheme.typography.titleMedium,
                    color = Color.White
                )
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 2.0f).forEach { speed ->
                        FilterChip(
                            selected = playbackSpeed == speed,
                            onClick = { onSpeedChange(speed) },
                            label = { Text("${speed}x") },
                            colors = FilterChipDefaults.filterChipColors(
                                selectedContainerColor = Color(0xFF00E5FF),
                                selectedLabelColor = Color.Black
                            )
                        )
                    }
                }
            }

            // Subtitles
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Subtitles",
                    style = MaterialTheme.typography.titleMedium,
                    color = Color.White
                )
                Switch(
                    checked = subtitlesEnabled,
                    onCheckedChange = { onSubtitlesToggle() },
                    colors = SwitchDefaults.colors(
                        checkedThumbColor = Color.White,
                        checkedTrackColor = Color(0xFF00E5FF)
                    )
                )
            }

            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

private fun formatTime(ms: Long): String {
    val seconds = (ms / 1000) % 60
    val minutes = (ms / (1000 * 60)) % 60
    val hours = (ms / (1000 * 60 * 60))
    
    return if (hours > 0) {
        String.format(Locale.US, "%d:%02d:%02d", hours, minutes, seconds)
    } else {
        String.format(Locale.US, "%d:%02d", minutes, seconds)
    }
}
