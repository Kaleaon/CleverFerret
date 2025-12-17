package com.universalmedialibrary.ui.player

import android.app.PictureInPictureParams
import android.content.Context
import android.content.pm.ActivityInfo
import android.net.Uri
import android.os.Build
import android.util.Rational
import androidx.activity.compose.BackHandler
import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.VolumeUp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.media3.common.AudioAttributes
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.common.Tracks
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.viewer.common.VideoSettings
import com.universalmedialibrary.ui.player.components.TopControlsBar
import com.universalmedialibrary.ui.player.components.BottomControlsBar
import com.universalmedialibrary.ui.player.components.SubtitleTrack
import com.universalmedialibrary.ui.player.components.AudioTrack
import com.universalmedialibrary.ui.player.components.Chapter
import kotlinx.coroutines.delay
import kotlin.math.abs

/**
 * Advanced Video Player with VLC-like capabilities
 * Features:
 * - Wide format support
 * - Subtitle and audio track selection
 * - Gesture controls
 * - Picture-in-Picture
 * - Playback speed control
 * - Chapter navigation
 */
@OptIn(ExperimentalMaterial3Api::class, UnstableApi::class)
@Composable
fun AdvancedVideoPlayerScreen(
    videoUri: Uri,
    onBack: () -> Unit,
    viewModel: AdvancedVideoPlayerViewModel = hiltViewModel()
) {
    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        val uiState by viewModel.uiState.collectAsState()
        val context = LocalContext.current
        val activity = context as? android.app.Activity
        val density = LocalDensity.current

        var showControls by remember { mutableStateOf(true) }
        var showSettings by remember { mutableStateOf(false) }
        var showSubtitleTracks by remember { mutableStateOf(false) }
        var showAudioTracks by remember { mutableStateOf(false) }
        var showChapters by remember { mutableStateOf(false) }

        var brightness by remember { mutableFloatStateOf(1f) }
        var volume by remember { mutableFloatStateOf(0.8f) }
        var isFullscreen by remember { mutableStateOf(false) }

        // Gesture states
        var isDragging by remember { mutableStateOf(false) }
        var seekPreview by remember { mutableLongStateOf(-1L) }
        var volumeAdjustment by remember { mutableFloatStateOf(0f) }
        var brightnessAdjustment by remember { mutableFloatStateOf(0f) }

        LaunchedEffect(videoUri) {
            viewModel.loadVideo(context, videoUri)
        }

        // Auto-hide controls
        LaunchedEffect(showControls, uiState.isPlaying) {
            if (showControls && uiState.isPlaying && !isDragging) {
                delay(4000)
                showControls = false
            }
        }

        // Handle back button
        BackHandler {
            if (isFullscreen) {
                isFullscreen = false
            } else {
                onBack()
            }
        }

        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.Black)
                .pointerInput(Unit) {
                    detectDragGestures(
                        onDragStart = { offset ->
                            isDragging = true
                            showControls = true
                        },
                        onDragEnd = {
                            isDragging = false
                            if (seekPreview >= 0) {
                                viewModel.seekTo(seekPreview)
                                seekPreview = -1L
                            }
                            volumeAdjustment = 0f
                            brightnessAdjustment = 0f
                        }
                    ) { change, dragAmount ->
                        val deltaX = dragAmount.x
                        val deltaY = dragAmount.y

                        when {
                            // Horizontal drag for seeking
                            kotlin.math.abs(deltaX) > kotlin.math.abs(deltaY) -> {
                                val seekAmount = (deltaX / size.width) * uiState.duration
                                seekPreview = (uiState.currentPosition + seekAmount.toLong())
                                    .coerceIn(0L, uiState.duration)
                            }
                            // Vertical drag on right side for volume
                            change.position.x > size.width / 2 -> {
                                volumeAdjustment += -deltaY / size.height
                                volume = (volume + volumeAdjustment * 0.01f).coerceIn(0f, 1f)
                            }
                            // Vertical drag on left side for brightness
                            else -> {
                                brightnessAdjustment += -deltaY / size.height
                                brightness = (brightness + brightnessAdjustment * 0.01f).coerceIn(0.1f, 1f)
                            }
                        }
                    }
                }
                .pointerInput(Unit) {
                    detectTapGestures(
                        onDoubleTap = { offset ->
                            if (offset.x < size.width / 3) {
                                // Double tap left - rewind 10s
                                viewModel.seekRelative(-10000)
                            } else if (offset.x > 2 * size.width / 3) {
                                // Double tap right - forward 10s
                                viewModel.seekRelative(10000)
                            } else {
                                // Double tap center - play/pause
                                viewModel.togglePlayPause()
                            }
                        },
                        onTap = {
                            showControls = !showControls
                        }
                    )
                }
        ) {
            when {
                uiState.isLoading -> {
                    LoadingState()
                }

                uiState.error != null -> {
                    ErrorState(
                        error = uiState.error!!,
                        onRetry = { viewModel.loadVideo(context, videoUri) },
                        onBack = onBack
                    )
                }

                uiState.isLoaded -> {
                    // Video player view
                    AndroidView(
                        factory = { context ->
                            PlayerView(context).apply {
                                player = viewModel.getExoPlayer()
                                useController = false
                                setShowBuffering(PlayerView.SHOW_BUFFERING_WHEN_PLAYING)
                                setShutterBackgroundColor(android.graphics.Color.BLACK)
                            }
                        },
                        modifier = Modifier.fillMaxSize()
                    )

                    // Gesture feedback overlays
                    GestureOverlays(
                        seekPreview = seekPreview,
                        volumeAdjustment = volumeAdjustment,
                        brightnessAdjustment = brightnessAdjustment,
                        currentPosition = uiState.currentPosition,
                        duration = uiState.duration,
                        isDragging = isDragging
                    )

                    // Large play/pause button when paused
                    if (!uiState.isPlaying && !isDragging) {
                        Box(
                            modifier = Modifier.fillMaxSize(),
                            contentAlignment = Alignment.Center
                        ) {
                            Card(
                                modifier = Modifier.size(80.dp),
                                colors = CardDefaults.cardColors(
                                    containerColor = Color.Black.copy(alpha = 0.7f)
                                ),
                                shape = MaterialTheme.shapes.extraLarge
                            ) {
                                IconButton(
                                    onClick = { viewModel.togglePlayPause() },
                                    modifier = Modifier.fillMaxSize()
                                ) {
                                    Icon(
                                        imageVector = Icons.Default.PlayArrow,
                                        contentDescription = "Play",
                                        modifier = Modifier.size(40.dp),
                                        tint = Color.White
                                    )
                                }
                            }
                        }
                    }
                }
            }

            // Control overlays
            AnimatedVisibility(
                visible = showControls && uiState.isLoaded,
                enter = fadeIn() + slideInVertically(initialOffsetY = { -it }),
                exit = fadeOut() + slideOutVertically(targetOffsetY = { -it }),
                modifier = Modifier.align(Alignment.TopStart)
            ) {
                TopControlsBar(
                    title = uiState.title,
                    currentChapter = uiState.currentChapter,
                    onBack = onBack,
                    onCast = { },
                    onPip = {
                        enterPictureInPictureMode(context)
                    },
                    onSettings = { showSettings = true }
                )
            }

            AnimatedVisibility(
                visible = showControls && uiState.isLoaded,
                enter = fadeIn() + slideInVertically(initialOffsetY = { it }),
                exit = fadeOut() + slideOutVertically(targetOffsetY = { it }),
                modifier = Modifier.align(Alignment.BottomStart)
            ) {
                BottomControlsBar(
                    isPlaying = uiState.isPlaying,
                    currentPosition = uiState.currentPosition,
                    duration = uiState.duration,
                    playbackSpeed = uiState.playbackSpeed,
                    volume = volume,
                    onPlayPause = { viewModel.togglePlayPause() },
                    onSeek = { viewModel.seekTo(it) },
                    onRewind = { viewModel.seekRelative(-10000) },
                    onForward = { viewModel.seekRelative(10000) },
                    onVolumeChange = { volume = it },
                    onFullscreen = {
                        isFullscreen = !isFullscreen
                        activity?.requestedOrientation = if (isFullscreen) {
                            ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                        } else {
                            ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
                        }
                    },
                    onSpeedChange = { viewModel.setPlaybackSpeed(it) },
                    onSubtitles = { showSubtitleTracks = true },
                    onAudioTracks = { showAudioTracks = true },
                    onChapters = if (uiState.chapters.isNotEmpty()) { { showChapters = true } } else null
                )
            }
        }

        // Settings bottom sheet
        if (showSettings) {
            VideoSettingsSheet(
                settings = uiState.settings,
                onDismiss = { showSettings = false },
                onSettingsChanged = { viewModel.updateSettings(it) }
            )
        }

        // Track selection sheets
        if (showSubtitleTracks) {
            SubtitleTracksSheet(
                tracks = uiState.subtitleTracks,
                selectedTrack = uiState.selectedSubtitleTrack,
                onDismiss = { showSubtitleTracks = false },
                onTrackSelected = { viewModel.selectSubtitleTrack(it) }
            )
        }

        if (showAudioTracks) {
            AudioTracksSheet(
                tracks = uiState.audioTracks,
                selectedTrack = uiState.selectedAudioTrack,
                onDismiss = { showAudioTracks = false },
                onTrackSelected = { viewModel.selectAudioTrack(it) }
            )
        }

        if (showChapters) {
            ChaptersSheet(
                chapters = uiState.chapters,
                currentChapter = uiState.currentChapter,
                onDismiss = { showChapters = false },
                onChapterSelected = { chapter ->
                    viewModel.seekTo(chapter.startTime)
                    showChapters = false
                }
            )
        }
    }
}

@Composable
private fun LoadingState() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            CircularProgressIndicator(
                color = MaterialTheme.colorScheme.primary,
                strokeWidth = 3.dp,
                modifier = Modifier.size(60.dp)
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "Loading video...",
                style = MaterialTheme.typography.bodyLarge,
                color = Color.White.copy(alpha = 0.8f)
            )
        }
    }
}

@Composable
private fun ErrorState(
    error: String,
    onRetry: () -> Unit,
    onBack: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(32.dp),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Column(
            modifier = Modifier.padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = Icons.Default.Error,
                contentDescription = null,
                modifier = Modifier.size(48.dp),
                tint = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "Unable to play video",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Medium
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = error,
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Center,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(16.dp))
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(onClick = onBack) {
                    Text("Go Back")
                }
                Button(onClick = onRetry) {
                    Text("Retry")
                }
            }
        }
    }
}

@Composable
private fun GestureOverlays(
    seekPreview: Long,
    volumeAdjustment: Float,
    brightnessAdjustment: Float,
    currentPosition: Long,
    duration: Long,
    isDragging: Boolean
) {
    // Seek preview overlay
    if (seekPreview >= 0 && isDragging) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = Color.Black.copy(alpha = 0.8f)
                ),
                shape = RoundedCornerShape(8.dp)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(
                        text = formatTime(seekPreview),
                        color = Color.White,
                        style = MaterialTheme.typography.titleMedium
                    )
                    Text(
                        text = "/ ${formatTime(duration)}",
                        color = Color.White.copy(alpha = 0.7f),
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
        }
    }

    // Volume adjustment overlay
    if (abs(volumeAdjustment) > 0.01f) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(end = 32.dp),
            contentAlignment = Alignment.CenterEnd
        ) {
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = Color.Black.copy(alpha = 0.8f)
                ),
                shape = RoundedCornerShape(8.dp)
            ) {
                Row(
                    modifier = Modifier.padding(12.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.AutoMirrored.Filled.VolumeUp,
                        contentDescription = null,
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "${(volumeAdjustment * 100).toInt()}%",
                        color = Color.White,
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
        }
    }

    // Brightness adjustment overlay
    if (abs(brightnessAdjustment) > 0.01f) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(start = 32.dp),
            contentAlignment = Alignment.CenterStart
        ) {
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = Color.Black.copy(alpha = 0.8f)
                ),
                shape = RoundedCornerShape(8.dp)
            ) {
                Row(
                    modifier = Modifier.padding(12.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Default.Brightness6,
                        contentDescription = null,
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "${(brightnessAdjustment * 100).toInt()}%",
                        color = Color.White,
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
        }
    }
}

private fun formatTime(milliseconds: Long): String {
    val seconds = milliseconds / 1000
    val hours = seconds / 3600
    val minutes = (seconds % 3600) / 60
    val secs = seconds % 60

    return if (hours > 0) {
        String.format(java.util.Locale.US, "%d:%02d:%02d", hours, minutes, secs)
    } else {
        String.format(java.util.Locale.US, "%d:%02d", minutes, secs)
    }
}

private fun enterPictureInPictureMode(context: Context) {
    val activity = context as? androidx.activity.ComponentActivity
    activity?.let {
        val params = PictureInPictureParams.Builder()
            .setAspectRatio(Rational(16, 9))
            .build()
        it.enterPictureInPictureMode(params)
    }
}

// Placeholder sheet composables - to be fully implemented
@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun VideoSettingsSheet(
    settings: VideoSettings,
    onDismiss: () -> Unit,
    onSettingsChanged: (VideoSettings) -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "Video Settings",
                style = MaterialTheme.typography.headlineSmall,
                modifier = Modifier.padding(bottom = 16.dp)
            )
            Text("Settings UI to be implemented", style = MaterialTheme.typography.bodyMedium)
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SubtitleTracksSheet(
    tracks: List<SubtitleTrack>,
    selectedTrack: Int,
    onDismiss: () -> Unit,
    onTrackSelected: (Int) -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "Subtitle Tracks",
                style = MaterialTheme.typography.headlineSmall,
                modifier = Modifier.padding(bottom = 16.dp)
            )
            LazyColumn {
                items(tracks) { track ->
                    Text(
                        track.label ?: "Subtitle ${track.id}",
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onTrackSelected(track.id) }
                            .padding(12.dp)
                    )
                }
            }
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AudioTracksSheet(
    tracks: List<AudioTrack>,
    selectedTrack: Int,
    onDismiss: () -> Unit,
    onTrackSelected: (Int) -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "Audio Tracks",
                style = MaterialTheme.typography.headlineSmall,
                modifier = Modifier.padding(bottom = 16.dp)
            )
            LazyColumn {
                items(tracks) { track ->
                    Text(
                        track.label ?: "Audio ${track.id}",
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onTrackSelected(track.id) }
                            .padding(12.dp)
                    )
                }
            }
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ChaptersSheet(
    chapters: List<Chapter>,
    currentChapter: String?,
    onDismiss: () -> Unit,
    onChapterSelected: (Chapter) -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "Chapters",
                style = MaterialTheme.typography.headlineSmall,
                modifier = Modifier.padding(bottom = 16.dp)
            )
            LazyColumn {
                items(chapters) { chapter ->
                    Text(
                        chapter.title ?: "Chapter",
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onChapterSelected(chapter) }
                            .padding(12.dp)
                    )
                }
            }
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}
