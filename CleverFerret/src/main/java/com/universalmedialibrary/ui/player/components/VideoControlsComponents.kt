package com.universalmedialibrary.ui.player.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.viewer.common.VideoSettings

/**
 * A composable that displays the top controls for the video player.
 *
 * @param title The title of the video.
 * @param currentChapter The title of the current chapter, if any.
 * @param onBack A callback for when the user navigates back.
 * @param onCast A callback for when the user taps the cast button.
 * @param onPip A callback for when the user taps the picture-in-picture button.
 * @param onSettings A callback for when the user taps the settings button.
 */
/**
 * A composable that displays the top controls for the video player.
 *
 * @param title The title of the video.
 * @param currentChapter The title of the current chapter, if any.
 * @param onBack A callback for when the user navigates back.
 * @param onCast A callback for when the user taps the cast button.
 * @param onPip A callback for when the user taps the picture-in-picture button.
 * @param onSettings A callback for when the user taps the settings button.
 */
/**
 * A composable that displays the top controls for the video player.
 *
 * @param title The title of the video.
 * @param currentChapter The title of the current chapter, if any.
 * @param onBack A callback for when the user navigates back.
 * @param onCast A callback for when the user taps the cast button.
 * @param onPip A callback for when the user taps the picture-in-picture button.
 * @param onSettings A callback for when the user taps the settings button.
 */
@Composable
fun TopControlsBar(
    title: String,
    currentChapter: String?,
    onBack: () -> Unit,
    onCast: () -> Unit,
    onPip: () -> Unit,
    onSettings: () -> Unit
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(80.dp)
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color.Black.copy(alpha = 0.8f),
                        Color.Transparent
                    )
                )
            )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBack) {
                Icon(
                    Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = Color.White,
                    modifier = Modifier.size(24.dp)
                )
            }

            Column(
                modifier = Modifier
                    .weight(1f)
                    .padding(horizontal = 16.dp)
            ) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    color = Color.White,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                if (currentChapter != null) {
                    Text(
                        text = currentChapter,
                        style = MaterialTheme.typography.bodySmall,
                        color = Color.White.copy(alpha = 0.7f),
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }

            Row {
                IconButton(onClick = onCast) {
                    Icon(
                        Icons.Default.Cast,
                        contentDescription = "Cast",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
                IconButton(onClick = onPip) {
                    Icon(
                        Icons.Default.PictureInPicture,
                        contentDescription = "Picture in Picture",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
                IconButton(onClick = onSettings) {
                    Icon(
                        Icons.Default.Settings,
                        contentDescription = "Settings",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}

/**
 * A composable that displays the bottom controls for the video player.
 *
 * @param isPlaying Whether the player is currently playing.
 * @param currentPosition The current playback position in milliseconds.
 * @param duration The total duration of the video in milliseconds.
 * @param playbackSpeed The current playback speed.
 * @param volume The current volume.
 * @param onPlayPause A callback for when the play/pause button is clicked.
 * @param onSeek A callback for when the user seeks to a new position.
 * @param onRewind A callback for when the user rewinds.
 * @param onForward A callback for when the user forwards.
 * @param onVolumeChange A callback for when the volume changes.
 * @param onFullscreen A callback for when the fullscreen button is clicked.
 * @param onSpeedChange A callback for when the playback speed changes.
 * @param onSubtitles A callback for when the subtitles button is clicked.
 * @param onAudioTracks A callback for when the audio tracks button is clicked.
 * @param onChapters A callback for when the chapters button is clicked.
 */
@Composable
fun BottomControlsBar(
    isPlaying: Boolean,
    currentPosition: Long,
    duration: Long,
    playbackSpeed: Float,
    volume: Float,
    onPlayPause: () -> Unit,
    onSeek: (Long) -> Unit,
    onRewind: () -> Unit,
    onForward: () -> Unit,
    onVolumeChange: (Float) -> Unit,
    onFullscreen: () -> Unit,
    onSpeedChange: (Float) -> Unit,
    onSubtitles: () -> Unit,
    onAudioTracks: () -> Unit,
    onChapters: (() -> Unit)? = null
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(140.dp)
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color.Transparent,
                        Color.Black.copy(alpha = 0.8f)
                    )
                )
            )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .align(Alignment.BottomStart)
                .padding(16.dp)
        ) {
            // Progress bar
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = formatTime(currentPosition),
                    color = Color.White,
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.width(60.dp)
                )
                
                Slider(
                    value = currentPosition.toFloat(),
                    onValueChange = { onSeek(it.toLong()) },
                    valueRange = 0f..duration.toFloat(),
                    modifier = Modifier.weight(1f),
                    colors = SliderDefaults.colors(
                        thumbColor = MaterialTheme.colorScheme.primary,
                        activeTrackColor = MaterialTheme.colorScheme.primary,
                        inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                    )
                )
                
                Text(
                    text = formatTime(duration),
                    color = Color.White,
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.width(60.dp)
                )
            }

            Spacer(modifier = Modifier.height(8.dp))

            // Transport controls
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    IconButton(onClick = onRewind) {
                        Icon(Icons.Default.Replay10, contentDescription = "Rewind", tint = Color.White)
                    }
                    IconButton(onClick = onPlayPause) {
                        Icon(
                            if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            contentDescription = if (isPlaying) "Pause" else "Play",
                            tint = Color.White
                        )
                    }
                    IconButton(onClick = onForward) {
                        Icon(Icons.Default.Forward10, contentDescription = "Forward", tint = Color.White)
                    }
                }

                Row(verticalAlignment = Alignment.CenterVertically) {
                    IconButton(onClick = onSubtitles) {
                        Icon(Icons.Default.Subtitles, contentDescription = "Subtitles", tint = Color.White)
                    }
                    IconButton(onClick = onAudioTracks) {
                        Icon(Icons.Default.GraphicEq, contentDescription = "Audio Tracks", tint = Color.White)
                    }
                    IconButton(onClick = onFullscreen) {
                        Icon(Icons.Default.Fullscreen, contentDescription = "Fullscreen", tint = Color.White)
                    }
                }
            }

            Spacer(modifier = Modifier.height(8.dp))

            // Volume and speed controls
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text("Speed", color = Color.White, style = MaterialTheme.typography.bodySmall)
                    Spacer(modifier = Modifier.width(8.dp))
                    Slider(
                        value = playbackSpeed,
                        onValueChange = { onSpeedChange(it) },
                        valueRange = 0.5f..2.0f,
                        modifier = Modifier.width(160.dp)
                    )
                }

                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text("Volume", color = Color.White, style = MaterialTheme.typography.bodySmall)
                    Spacer(modifier = Modifier.width(8.dp))
                    Slider(
                        value = volume,
                        onValueChange = { onVolumeChange(it) },
                        valueRange = 0f..1f,
                        modifier = Modifier.width(160.dp)
                    )
                }
            }
        }
    }
}

/**
 * A composable that displays enhanced video controls.
 *
 * @param playerState The current state of the player.
 * @param onPlayPause A callback for when the play/pause button is clicked.
 * @param onSeek A callback for when the user seeks to a new position.
 * @param onVolumeChange A callback for when the volume changes.
 * @param onSpeedChange A callback for when the playback speed changes.
 * @param onSubtitleToggle A callback for when the subtitle toggle is clicked.
 * @param onAudioTrackChange A callback for when the audio track changes.
 * @param onFullscreenToggle A callback for when the fullscreen toggle is clicked.
 * @param onPlayerSwitch A callback for when the user switches the player.
 * @param modifier The modifier to be applied to the controls.
 */
/**
 * A composable that displays enhanced video controls.
 *
 * @param playerState The current state of the player.
 * @param onPlayPause A callback for when the play/pause button is clicked.
 * @param onSeek A callback for when the user seeks to a new position.
 * @param onVolumeChange A callback for when the volume changes.
 * @param onSpeedChange A callback for when the playback speed changes.
 * @param onSubtitleToggle A callback for when the subtitle toggle is clicked.
 * @param onAudioTrackChange A callback for when the audio track changes.
 * @param onFullscreenToggle A callback for when the fullscreen toggle is clicked.
 * @param onPlayerSwitch A callback for when the user switches the player.
 * @param modifier The modifier to be applied to the controls.
 */
/**
 * A composable that displays enhanced video controls.
 *
 * @param playerState The current state of the player.
 * @param onPlayPause A callback for when the play/pause button is clicked.
 * @param onSeek A callback for when the user seeks to a new position.
 * @param onVolumeChange A callback for when the volume changes.
 * @param onSpeedChange A callback for when the playback speed changes.
 * @param onSubtitleToggle A callback for when the subtitle toggle is clicked.
 * @param onAudioTrackChange A callback for when the audio track changes.
 * @param onFullscreenToggle A callback for when the fullscreen toggle is clicked.
 * @param onPlayerSwitch A callback for when the user switches the player.
 * @param modifier The modifier to be applied to the controls.
 */
@Composable
fun EnhancedVideoControls(
    playerState: com.universalmedialibrary.ui.player.UniversalPlayerState,
    onPlayPause: () -> Unit,
    onSeek: (Long) -> Unit,
    onVolumeChange: (Float) -> Unit,
    onSpeedChange: (Float) -> Unit,
    onSubtitleToggle: () -> Unit,
    onAudioTrackChange: (Int) -> Unit,
    onFullscreenToggle: () -> Unit,
    onPlayerSwitch: (com.universalmedialibrary.services.video.VideoPlayerType) -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxWidth()
            .background(
                Brush.verticalGradient(
                    listOf(Color.Transparent, Color.Black.copy(alpha = 0.6f))
                ),
                RoundedCornerShape(topStart = 12.dp, topEnd = 12.dp)
            )
            .padding(12.dp)
    ) {
        BottomControlsBar(
            isPlaying = playerState.isPlaying,
            currentPosition = playerState.currentPosition,
            duration = playerState.duration,
            playbackSpeed = playerState.playbackSpeed,
            volume = playerState.volume,
            onPlayPause = onPlayPause,
            onSeek = onSeek,
            onRewind = { onSeek((playerState.currentPosition - 10_000).coerceAtLeast(0)) },
            onForward = { onSeek((playerState.currentPosition + 10_000).coerceAtMost(playerState.duration)) },
            onVolumeChange = onVolumeChange,
            onFullscreen = onFullscreenToggle,
            onSpeedChange = onSpeedChange,
            onSubtitles = onSubtitleToggle,
            onAudioTracks = { onAudioTrackChange(0) }
        )
    }
}

private fun formatTime(ms: Long): String {
    val totalSeconds = (ms / 1000).toInt()
    val seconds = totalSeconds % 60
    val minutes = (totalSeconds / 60) % 60
    val hours = totalSeconds / 3600
    return if (hours > 0) String.format("%d:%02d:%02d", hours, minutes, seconds)
    else String.format("%02d:%02d", minutes, seconds)
}