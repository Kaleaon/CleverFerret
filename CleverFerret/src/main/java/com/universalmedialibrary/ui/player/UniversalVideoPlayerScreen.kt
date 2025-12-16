package com.universalmedialibrary.ui.player

import android.net.Uri
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.VolumeUp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.media3.ui.PlayerView
import com.universalmedialibrary.services.video.VideoPlayerType
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
// VLC import handled via reflection to avoid compilation errors
// import org.videolan.libvlc.util.VLCVideoLayout

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun UniversalVideoPlayerScreen(
    videoUri: Uri,
    viewModel: UniversalVideoPlayerViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val playerState by viewModel.playerState.collectAsState()

    LaunchedEffect(videoUri) {
        viewModel.initializePlayer(context, videoUri)
    }

    DisposableEffect(Unit) {
        onDispose {
            viewModel.releasePlayer()
        }
    }

    Surface(
        modifier = Modifier.fillMaxSize(),
        color = Color.Black
    ) {
        Box(modifier = Modifier.fillMaxSize()) {
                // Main video player area
                when (playerState.playerType) {
                    VideoPlayerType.EXOPLAYER -> {
                        ExoPlayerView(
                            playerView = playerState.exoPlayerView,
                            modifier = Modifier.fillMaxSize()
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

                // Player info overlay (top)
                PlayerInfoOverlay(
                    playerState = playerState,
                    modifier = Modifier
                        .align(Alignment.TopStart)
                        .padding(16.dp)
                )

                // Enhanced controls overlay (bottom)
                EnhancedVideoControls(
                    playerState = playerState,
                    onPlayPause = { viewModel.togglePlayPause() },
                    onSeek = { position -> viewModel.seekTo(position) },
                    onVolumeChange = { volume -> viewModel.setVolume(volume) },
                    onSpeedChange = { speed -> viewModel.setPlaybackSpeed(speed) },
                    onSubtitleToggle = { viewModel.toggleSubtitles() },
                    onAudioTrackChange = { track -> viewModel.changeAudioTrack(track) },
                    onFullscreenToggle = { viewModel.toggleFullscreen() },
                    onPlayerSwitch = { newType -> viewModel.switchPlayer(newType) },
                    modifier = Modifier
                        .align(Alignment.BottomCenter)
                        .padding(16.dp)
                )

                // Loading indicator
                if (playerState.isLoading) {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(Color.Black.copy(alpha = 0.7f)),
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
                                style = MaterialTheme.typography.bodyLarge
                            )
                            Text(
                                text = "Player: ${playerState.playerType.name}",
                                color = Color.White.copy(alpha = 0.7f),
                                style = MaterialTheme.typography.bodySmall
                            )
                        }
                    }
                }

                // Error overlay
                playerState.error?.let { error ->
                    ErrorOverlay(
                        error = error,
                        onRetry = { viewModel.retryPlayback() },
                        onSwitchPlayer = { viewModel.switchToAlternativePlayer() },
                        modifier = Modifier.align(Alignment.Center)
                    )
                }
            }
        }
}

@Composable
private fun ExoPlayerView(
    playerView: PlayerView?,
    modifier: Modifier = Modifier
) {
    AndroidView(
        factory = { playerView ?: PlayerView(it) },
        modifier = modifier
    )
}

@Composable
private fun VLCPlayerView(
    vlcVideoLayout: Any?, // VLCVideoLayout?,
    modifier: Modifier = Modifier
) {
    if (vlcVideoLayout != null) {
        AndroidView(
            factory = {
                try {
                    vlcVideoLayout as android.view.View
                } catch (e: Exception) {
                    // Fallback to empty view if VLC not available
                    android.view.View(it)
                }
            },
            modifier = modifier
        )
    } else {
        // Fallback UI when VLC is not available
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
    // Placeholder for system video player implementation
    Box(
        modifier = modifier,
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = "System Player\n${videoUri.lastPathSegment}",
            color = Color.White,
            style = MaterialTheme.typography.bodyLarge
        )
    }
}

@Composable
private fun PlayerInfoOverlay(
    playerState: UniversalPlayerState,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = Color.Black.copy(alpha = 0.7f)
        ),
        shape = RoundedCornerShape(8.dp)
    ) {
        Column(
            modifier = Modifier.padding(12.dp),
            verticalArrangement = Arrangement.spacedBy(4.dp)
        ) {
            Text(
                text = playerState.playerType.name,
                color = Color.White,
                style = MaterialTheme.typography.labelMedium,
                fontWeight = FontWeight.Bold
            )

            playerState.videoMetadata?.let { metadata ->
                Text(
                    text = "${metadata.width}x${metadata.height}",
                    color = Color.White.copy(alpha = 0.8f),
                    style = MaterialTheme.typography.labelSmall
                )
                Text(
                    text = metadata.codec,
                    color = Color.White.copy(alpha = 0.8f),
                    style = MaterialTheme.typography.labelSmall
                )
                if (metadata.audioTracks > 0) {
                    Text(
                        text = "${metadata.audioTracks} audio tracks",
                        color = Color.White.copy(alpha = 0.8f),
                        style = MaterialTheme.typography.labelSmall
                    )
                }
                if (metadata.subtitleTracks > 0) {
                    Text(
                        text = "${metadata.subtitleTracks} subtitle tracks",
                        color = Color.White.copy(alpha = 0.8f),
                        style = MaterialTheme.typography.labelSmall
                    )
                }
            }
        }
    }
}

@Composable
private fun EnhancedVideoControls(
    playerState: UniversalPlayerState,
    onPlayPause: () -> Unit,
    onSeek: (Long) -> Unit,
    onVolumeChange: (Float) -> Unit,
    onSpeedChange: (Float) -> Unit,
    onSubtitleToggle: () -> Unit,
    onAudioTrackChange: (Int) -> Unit,
    onFullscreenToggle: () -> Unit,
    onPlayerSwitch: (VideoPlayerType) -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = Color.Black.copy(alpha = 0.8f)
        ),
        shape = RoundedCornerShape(12.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            // Main controls row
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Play/Pause button
                IconButton(onClick = onPlayPause) {
                    Icon(
                        imageVector = if (playerState.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = if (playerState.isPlaying) "Pause" else "Play",
                        tint = Color.White,
                        modifier = Modifier.size(32.dp)
                    )
                }

                // Progress slider
                Slider(
                    value = playerState.progress,
                    onValueChange = { progress ->
                        val position = (progress * playerState.duration).toLong()
                        onSeek(position)
                    },
                    modifier = Modifier.weight(1f),
                    colors = SliderDefaults.colors(
                        thumbColor = MaterialTheme.colorScheme.primary,
                        activeTrackColor = MaterialTheme.colorScheme.primary,
                        inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                    )
                )

                // Fullscreen toggle
                IconButton(onClick = onFullscreenToggle) {
                    Icon(
                        imageVector = if (playerState.isFullscreen) Icons.Default.FullscreenExit else Icons.Default.Fullscreen,
                        contentDescription = if (playerState.isFullscreen) "Exit Fullscreen" else "Fullscreen",
                        tint = Color.White
                    )
                }
            }

            // Secondary controls row
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Subtitle toggle
                IconButton(onClick = onSubtitleToggle) {
                    Icon(
                        imageVector = Icons.Default.Subtitles,
                        contentDescription = "Toggle Subtitles",
                        tint = if (playerState.subtitlesEnabled) MaterialTheme.colorScheme.primary else Color.White
                    )
                }

                // Volume control
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    Icon(
                        imageVector = Icons.AutoMirrored.Filled.VolumeUp,
                        contentDescription = "Volume",
                        tint = Color.White,
                        modifier = Modifier.size(16.dp)
                    )
                    Slider(
                        value = playerState.volume,
                        onValueChange = onVolumeChange,
                        modifier = Modifier.width(80.dp),
                        colors = SliderDefaults.colors(
                            thumbColor = MaterialTheme.colorScheme.primary,
                            activeTrackColor = MaterialTheme.colorScheme.primary,
                            inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                        )
                    )
                }

                // Speed control
                TextButton(
                    onClick = {
                        val speeds = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 2.0f)
                        val currentIndex = speeds.indexOf(playerState.playbackSpeed)
                        val nextSpeed = speeds[(currentIndex + 1) % speeds.size]
                        onSpeedChange(nextSpeed)
                    }
                ) {
                    Text(
                        text = "${playerState.playbackSpeed}x",
                        color = Color.White,
                        style = MaterialTheme.typography.labelSmall
                    )
                }

                // Player switcher
                TextButton(
                    onClick = {
                        val nextPlayer = when (playerState.playerType) {
                            VideoPlayerType.EXOPLAYER -> VideoPlayerType.VLC
                            VideoPlayerType.VLC -> VideoPlayerType.EXOPLAYER
                            VideoPlayerType.SYSTEM_PLAYER -> VideoPlayerType.EXOPLAYER
                        }
                        onPlayerSwitch(nextPlayer)
                    }
                ) {
                    Text(
                        text = playerState.playerType.name.take(3),
                        color = MaterialTheme.colorScheme.primary,
                        style = MaterialTheme.typography.labelSmall
                    )
                }
            }

            // Time display
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = formatTime(playerState.currentPosition),
                    color = Color.White.copy(alpha = 0.8f),
                    style = MaterialTheme.typography.labelSmall
                )
                Text(
                    text = formatTime(playerState.duration),
                    color = Color.White.copy(alpha = 0.8f),
                    style = MaterialTheme.typography.labelSmall
                )
            }
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

private fun formatTime(milliseconds: Long): String {
    val seconds = milliseconds / 1000
    val minutes = seconds / 60
    val hours = minutes / 60

    return if (hours > 0) {
        "%d:%02d:%02d".format(hours, minutes % 60, seconds % 60)
    } else {
        "%d:%02d".format(minutes, seconds % 60)
    }
}
