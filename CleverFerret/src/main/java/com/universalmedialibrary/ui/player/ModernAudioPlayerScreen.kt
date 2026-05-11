package com.universalmedialibrary.ui.player

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.Shadow
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.foundation.horizontalScroll
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import com.universalmedialibrary.services.audio.AudioPlaybackManager.AudioQueueEntry
import com.universalmedialibrary.ui.player.WaveformSource
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.util.Locale
import kotlin.math.PI
import kotlin.math.absoluteValue
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.roundToInt

/**
 * Modern Audio Player with beautiful animations and glassmorphic design
 * Supports music, audiobooks, and podcasts
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ModernAudioPlayerScreen(
    onNavigateBack: () -> Unit,
    viewModel: ModernAudioPlayerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val artworkColors = rememberArtworkPalette(uiState.currentTrack?.coverUrl)
    val onArtworkColor = if (artworkColors.isDark) Color.White else Color.Black
    val gradientColors = remember(artworkColors) {
        listOf(
            artworkColors.primary,
            artworkColors.secondary.copy(alpha = 0.9f),
            artworkColors.accent
        )
    }
    
    val coroutineScope = rememberCoroutineScope()
    var showAdvancedSheet by remember { mutableStateOf(false) }
    var showQueueSheet by remember { mutableStateOf(false) }
    var showAddToPlaylist by remember { mutableStateOf(false) }
    var showShare by remember { mutableStateOf(false) }
    val waveformPoints by viewModel.waveformPoints.collectAsStateWithLifecycle()
    val waveformToRender = if (waveformPoints.isNotEmpty()) {
        waveformPoints
    } else {
        remember(uiState.currentTrack?.id) { List(96) { 0.1f } }
    }
    val waveformProgress = remember(
        uiState.currentPosition,
        uiState.duration,
        uiState.waveformOffsetMs
    ) {
        if (uiState.duration > 0) {
            ((uiState.currentPosition + uiState.waveformOffsetMs).toFloat() / uiState.duration)
                .coerceIn(0f, 1f)
        } else 0f
    }
    
    // Animated vinyl rotation
    val infiniteTransition = rememberInfiniteTransition(label = "vinyl")
    val rotation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(10000, easing = LinearEasing),
            repeatMode = androidx.compose.animation.core.RepeatMode.Restart
        ),
        label = "rotation"
    )

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(colors = gradientColors)
            )
    ) {
        // Background blur effect
        uiState.currentTrack?.coverUrl?.let { coverUrl ->
            AsyncImage(
                    
                model = coverUrl,
                contentDescription = "Media image",
                modifier = Modifier
                    .fillMaxSize()
                    .blur(100.dp)
                    .scale(1.2f),
                contentScale = ContentScale.Crop,
                alpha = 0.3f
            )
        }
        if (uiState.partyModeEnabled) {
            PartyModeAurora(
                modifier = Modifier.fillMaxSize(),
                baseColors = gradientColors
            )
        }

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(24.dp),
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            // Top bar
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                    IconButton(onClick = onNavigateBack) {
                    Icon(
                        Icons.Default.ExpandMore,
                        contentDescription = "Back",
                            tint = onArtworkColor
                    )
                }

                Text(
                    text = "NOW PLAYING",
                    style = MaterialTheme.typography.labelLarge,
                    color = onArtworkColor.copy(alpha = 0.7f),
                    letterSpacing = 2.sp
                )

                    IconButton(onClick = { showAdvancedSheet = true }) {
                    Icon(
                        Icons.Default.MoreVert,
                        contentDescription = "More",
                            tint = onArtworkColor
                    )
                }
            }

            // Album art with vinyl effect
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1f),
                contentAlignment = Alignment.Center
            ) {
                // Vinyl record rotating
                if (uiState.isPlaying) {
                    VinylRecord(
                        rotation = rotation,
                        modifier = Modifier
                            .fillMaxSize(0.9f),
                        grooveColor = artworkColors.secondary
                    )
                }

                // Album art
                Surface(
                    modifier = Modifier
                        .fillMaxSize(0.75f)
                        .rotate(if (uiState.isPlaying) rotation else 0f),
                    shape = CircleShape,
                    tonalElevation = 16.dp,
                    shadowElevation = 24.dp
                ) {
                    val currentTrack = uiState.currentTrack
                    if (currentTrack?.coverUrl != null) {
                        AsyncImage(
                    
                            model = currentTrack.coverUrl,
                            contentDescription = "Album Art",
                            modifier = Modifier.fillMaxSize(),
                            contentScale = ContentScale.Crop
                        )
                    } else {
                          Box(
                              modifier = Modifier
                                  .fillMaxSize()
                                  .background(
                                      Brush.linearGradient(
                                          colors = listOf(
                                              artworkColors.primary,
                                              artworkColors.accent
                                          )
                                      )
                                  ),
                              contentAlignment = Alignment.Center
                          ) {
                            Icon(
                                Icons.Default.MusicNote,
                                contentDescription = "Media image",
                                modifier = Modifier.size(120.dp),
                                tint = Color.White.copy(alpha = 0.5f)
                            )
                        }
                    }
                }
            }

            // Track info
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = uiState.currentTrack?.title ?: "No track",
                    style = MaterialTheme.typography.headlineSmall.copy(
                        fontWeight = FontWeight.Bold,
                        shadow = Shadow(
                            color = Color.Black.copy(alpha = 0.5f),
                            offset = Offset(0f, 4f),
                            blurRadius = 8f
                        )
                    ),
                      color = onArtworkColor,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                Text(
                    text = uiState.currentTrack?.artist ?: "",
                    style = MaterialTheme.typography.bodyLarge,
                      color = onArtworkColor.copy(alpha = 0.7f),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }

            // Waveform seek bar + timing
            Column(
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                WaveformSeekBar(
                    points = waveformToRender,
                    progress = waveformProgress,
                    accent = artworkColors.accent,
                    backgroundColor = onArtworkColor.copy(alpha = 0.15f),
                    onSeek = { viewModel.seekUsingWaveformFraction(it) },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(80.dp)
                )

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(
                        text = formatTime(uiState.currentPosition),
                        style = MaterialTheme.typography.bodySmall,
                        color = onArtworkColor.copy(alpha = 0.6f)
                    )
                    Text(
                        text = formatTime(uiState.duration),
                        style = MaterialTheme.typography.bodySmall,
                        color = onArtworkColor.copy(alpha = 0.6f)
                    )
                }
                if (uiState.waveformSource == WaveformSource.PRECOMPUTED) {
                    WaveformAlignmentControls(
                        offsetMs = uiState.waveformOffsetMs,
                        accent = artworkColors.accent,
                        textColor = onArtworkColor,
                        onAdjust = viewModel::adjustWaveformAlignment
                    )
                }
            }

            QuickToggleRow(
                skipSilenceEnabled = uiState.skipSilenceEnabled,
                crossfadeDurationMs = uiState.crossfadeDurationMs,
                accent = artworkColors.accent,
                textColor = onArtworkColor,
                onSkipSilence = viewModel::toggleSkipSilence,
                onCrossfadeToggle = viewModel::toggleCrossfade,
                onCrossfadeLongPress = { showAdvancedSheet = true }
            )

            uiState.sleepTimerEndTime?.let { endTime ->
                SleepTimerBadge(
                    endTime = endTime,
                    onClear = viewModel::cancelSleepTimer,
                    textColor = onArtworkColor
                )
            }

            // Controls
            PlaybackControls(
                isPlaying = uiState.isPlaying,
                onPlayPause = { viewModel.togglePlayPause() },
                onPrevious = { viewModel.previous() },
                onNext = { viewModel.next() },
                onShuffle = { viewModel.toggleShuffle() },
                onRepeat = { viewModel.toggleRepeat() },
                isShuffleEnabled = uiState.isShuffleEnabled,
                  repeatMode = uiState.repeatMode,
                  iconTint = onArtworkColor,
                  highlightColor = artworkColors.accent
            )

            // Bottom actions
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                IconButton(onClick = { viewModel.toggleLike() }) {
                    Icon(
                        if (uiState.isLiked) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                        contentDescription = "Like",
                        tint = if (uiState.isLiked) artworkColors.accent else onArtworkColor,
                        modifier = Modifier.size(28.dp)
                    )
                }

                IconButton(onClick = { showQueueSheet = true }) {
                    Icon(
                        Icons.Default.QueueMusic,
                        contentDescription = "Queue",
                        tint = onArtworkColor,
                        modifier = Modifier.size(28.dp)
                    )
                }

                IconButton(onClick = { showAddToPlaylist = true }) {
                    Icon(
                        Icons.Default.PlaylistAdd,
                        contentDescription = "Add to Playlist",
                        tint = onArtworkColor,
                        modifier = Modifier.size(28.dp)
                    )
                }

                IconButton(onClick = { showShare = true }) {
                    Icon(
                        Icons.Default.Share,
                        contentDescription = "Share",
                        tint = onArtworkColor,
                        modifier = Modifier.size(28.dp)
                    )
                }
            }
        }
        if (showAdvancedSheet) {
            val sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
            ModalBottomSheet(
                sheetState = sheetState,
                onDismissRequest = { showAdvancedSheet = false }
            ) {
                AdvancedPlaybackSheet(
                    skipSilenceEnabled = uiState.skipSilenceEnabled,
                    onSkipSilenceToggled = viewModel::toggleSkipSilence,
                    crossfadeSeconds = (uiState.crossfadeDurationMs / 1000f).roundToInt(),
                    onCrossfadeDurationChanged = { seconds ->
                        viewModel.setCrossfadeDurationSeconds(seconds)
                    },
                    onCrossfadeToggle = viewModel::toggleCrossfade,
                    partyModeEnabled = uiState.partyModeEnabled,
                    onPartyModeToggle = viewModel::togglePartyMode,
                    onSleepTimerSelected = { minutes ->
                        viewModel.scheduleSleepTimer(minutes)
                    },
                    onSleepTimerClear = viewModel::cancelSleepTimer,
                    lastSleepTimerMinutes = uiState.lastSleepTimerMinutes,
                    onDismiss = {
                        coroutineScope.launch {
                            sheetState.hide()
                        }.invokeOnCompletion {
                            showAdvancedSheet = false
                        }
                    }
                )
            }
        }

        if (showQueueSheet) {
            val sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
            ModalBottomSheet(
                sheetState = sheetState,
                onDismissRequest = { showQueueSheet = false }
            ) {
                QueueSheet(
                    entries = uiState.queueEntries,
                    onPlay = viewModel::playQueueItem,
                    onMoveUp = { index -> viewModel.moveQueueItem(index, index - 1) },
                    onMoveDown = { index -> viewModel.moveQueueItem(index, index + 1) },
                    onRemove = viewModel::removeQueueItem,
                    onClose = {
                        coroutineScope.launch {
                            sheetState.hide()
                        }.invokeOnCompletion {
                            showQueueSheet = false
                        }
                    }
                )
            }
        }

        // Add to Playlist Dialog
        if (showAddToPlaylist) {
            AlertDialog(
                onDismissRequest = { showAddToPlaylist = false },
                title = { Text("Add to Playlist") },
                text = {
                    Column {
                        Button(
                            onClick = { showAddToPlaylist = false },
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Icon(Icons.Default.Add, "Create", modifier = Modifier.size(18.dp))
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Create New Playlist")
                        }
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            "Your Playlists",
                            style = MaterialTheme.typography.titleSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "No playlists yet",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                },
                confirmButton = {
                    TextButton(onClick = { showAddToPlaylist = false }) {
                        Text("Close")
                    }
                }
            )
        }
        
        // Share Dialog
        if (showShare) {
            AlertDialog(
                onDismissRequest = { showShare = false },
                title = { Text("Share Track") },
                text = {
                    Column {
                        Text(
                            text = "Share Track",
                            style = MaterialTheme.typography.bodyLarge
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceEvenly
                        ) {
                            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                IconButton(onClick = { showShare = false }) {
                                    Icon(Icons.Default.Chat, "Messages")
                                }
                                Text("Messages", style = MaterialTheme.typography.bodySmall)
                            }
                            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                IconButton(onClick = { showShare = false }) {
                                    Icon(Icons.Default.Email, "Email")
                                }
                                Text("Email", style = MaterialTheme.typography.bodySmall)
                            }
                            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                IconButton(onClick = { showShare = false }) {
                                    Icon(Icons.Default.Link, "Copy Link")
                                }
                                Text("Copy", style = MaterialTheme.typography.bodySmall)
                            }
                        }
                    }
                },
                confirmButton = {
                    TextButton(onClick = { showShare = false }) {
                        Text("Cancel")
                    }
                }
            )
        }
    }
}


@Composable
private fun VinylRecord(
    rotation: Float,
    modifier: Modifier = Modifier,
    grooveColor: Color = Color.Black.copy(alpha = 0.3f)
) {
    Canvas(modifier = modifier.rotate(rotation)) {
        val center = Offset(size.width / 2, size.height / 2)
        val radius = size.minDimension / 2

        // Draw vinyl grooves - reduced iterations for better performance on low-end devices
        for (i in 10 until radius.toInt() step 16) {
            drawCircle(
                color = grooveColor.copy(alpha = 0.3f),
                radius = i.toFloat(),
                center = center,
                style = androidx.compose.ui.graphics.drawscope.Stroke(width = 1f)
            )
        }

        // Draw center hole
        drawCircle(
            color = grooveColor.copy(alpha = 0.6f),
            radius = radius * 0.15f,
            center = center
        )
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

private fun formatOffset(offsetMs: Int): String {
    return if (offsetMs >= 0) {
        "+${offsetMs} ms"
    } else {
        "-${offsetMs.absoluteValue} ms"
    }
}









