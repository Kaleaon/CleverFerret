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
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.util.Locale
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.roundToInt
import kotlin.random.Random

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
                contentDescription = null,
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
                                contentDescription = null,
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
                    progress = uiState.progress,
                    accent = artworkColors.accent,
                    backgroundColor = onArtworkColor.copy(alpha = 0.15f),
                    onSeek = { viewModel.seekToFraction(it) },
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
private fun PlaybackControls(
    isPlaying: Boolean,
    onPlayPause: () -> Unit,
    onPrevious: () -> Unit,
    onNext: () -> Unit,
    onShuffle: () -> Unit,
    onRepeat: () -> Unit,
    isShuffleEnabled: Boolean,
    repeatMode: RepeatMode,
    iconTint: Color,
    highlightColor: Color
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly,
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Shuffle
        IconButton(onClick = onShuffle) {
            Icon(
                Icons.Default.Shuffle,
                contentDescription = "Shuffle",
                tint = if (isShuffleEnabled) highlightColor else iconTint.copy(alpha = 0.5f),
                modifier = Modifier.size(28.dp)
            )
        }

        // Previous
        Surface(
            shape = CircleShape,
            color = Color.White.copy(alpha = 0.1f),
            modifier = Modifier.size(64.dp)
        ) {
            IconButton(onClick = onPrevious) {
                Icon(
                    Icons.Default.SkipPrevious,
                    contentDescription = "Previous",
                    tint = iconTint,
                    modifier = Modifier.size(32.dp)
                )
            }
        }

        // Play/Pause
        val scale by animateFloatAsState(
            targetValue = if (isPlaying) 1f else 0.95f,
            animationSpec = tween(200),
            label = "playPauseScale"
        )

        Surface(
            shape = CircleShape,
            color = Color.White,
            modifier = Modifier
                .size(80.dp)
                .scale(scale),
            tonalElevation = 8.dp,
            shadowElevation = 16.dp
        ) {
            IconButton(onClick = onPlayPause) {
                Icon(
                    if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    contentDescription = if (isPlaying) "Pause" else "Play",
                    tint = Color(0xFF1A1A2E),
                    modifier = Modifier.size(40.dp)
                )
            }
        }

        // Next
        Surface(
            shape = CircleShape,
            color = Color.White.copy(alpha = 0.1f),
            modifier = Modifier.size(64.dp)
        ) {
            IconButton(onClick = onNext) {
                Icon(
                    Icons.Default.SkipNext,
                    contentDescription = "Next",
                    tint = iconTint,
                    modifier = Modifier.size(32.dp)
                )
            }
        }

        // Repeat
        IconButton(onClick = onRepeat) {
            Icon(
                when (repeatMode) {
                    RepeatMode.OFF -> Icons.Default.Repeat
                    RepeatMode.ALL -> Icons.Default.Repeat
                    RepeatMode.ONE -> Icons.Default.RepeatOne
                },
                contentDescription = "Repeat",
                tint = when (repeatMode) {
                    RepeatMode.OFF -> iconTint.copy(alpha = 0.5f)
                    else -> highlightColor
                },
                modifier = Modifier.size(28.dp)
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

private fun generateWaveformPoints(seed: Long, size: Int = 80): List<Float> {
    val adjustedSeed = if (seed != 0L) seed else System.currentTimeMillis()
    val random = Random(adjustedSeed)
    return List(size) { 0.2f + random.nextFloat() * 0.8f }
}

@Composable
private fun WaveformSeekBar(
    points: List<Float>,
    progress: Float,
    accent: Color,
    backgroundColor: Color,
    onSeek: (Float) -> Unit,
    modifier: Modifier = Modifier
) {
    Canvas(
        modifier = modifier.pointerInput(points) {
            detectTapGestures { offset ->
                val fraction = (offset.x / size.width).coerceIn(0f, 1f)
                onSeek(fraction)
            }
        }
    ) {
        val barSpacing = size.width / (points.size * 1.2f)
        val barWidth = barSpacing * 0.6f
        val centerY = size.height / 2f
        val progressX = size.width * progress.coerceIn(0f, 1f)

        points.forEachIndexed { index, amplitude ->
            val x = index * barSpacing + barSpacing / 2
            val height = amplitude * size.height / 2
            val color = if (x <= progressX) accent else backgroundColor
            drawRoundRect(
                color = color,
                topLeft = Offset(x - barWidth / 2, centerY - height),
                size = androidx.compose.ui.geometry.Size(barWidth, height * 2),
                cornerRadius = androidx.compose.ui.geometry.CornerRadius(barWidth / 2, barWidth / 2)
            )
        }
    }
}

@Composable
private fun QuickToggleRow(
    skipSilenceEnabled: Boolean,
    crossfadeDurationMs: Int,
    accent: Color,
    textColor: Color,
    onSkipSilence: () -> Unit,
    onCrossfadeToggle: () -> Unit,
    onCrossfadeLongPress: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 8.dp),
        horizontalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        QuickToggleChip(
            label = if (skipSilenceEnabled) "Skip Silence On" else "Skip Silence",
            enabled = skipSilenceEnabled,
            accent = accent,
            textColor = textColor,
            onToggle = onSkipSilence
        )
        QuickToggleChip(
            label = if (crossfadeDurationMs > 0) "Crossfade ${crossfadeDurationMs / 1000}s" else "Crossfade",
            enabled = crossfadeDurationMs > 0,
            accent = accent,
            textColor = textColor,
            onToggle = onCrossfadeToggle,
            onLongPress = onCrossfadeLongPress
        )
    }
}

@Composable
private fun QuickToggleChip(
    label: String,
    enabled: Boolean,
    accent: Color,
    textColor: Color,
    onToggle: () -> Unit,
    onLongPress: (() -> Unit)? = null
) {
    val background = if (enabled) accent.copy(alpha = 0.2f) else Color.White.copy(alpha = 0.1f)
    Surface(
        shape = RoundedCornerShape(50),
        color = background,
        border = if (enabled) BorderStroke(1.dp, accent) else null,
        modifier = Modifier
            .weight(1f)
            .pointerInput(label, enabled) {
                detectTapGestures(
                    onTap = { onToggle() },
                    onLongPress = { onLongPress?.invoke() }
                )
            }
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 10.dp),
            horizontalArrangement = Arrangement.Center,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(10.dp)
                    .clip(CircleShape)
                    .background(if (enabled) accent else textColor.copy(alpha = 0.4f))
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(label, color = textColor, style = MaterialTheme.typography.labelMedium)
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AdvancedPlaybackSheet(
    skipSilenceEnabled: Boolean,
    onSkipSilenceToggled: () -> Unit,
    crossfadeSeconds: Int,
    onCrossfadeDurationChanged: (Int) -> Unit,
    onCrossfadeToggle: () -> Unit,
    partyModeEnabled: Boolean,
    onPartyModeToggle: () -> Unit,
    onSleepTimerSelected: (Int) -> Unit,
    onSleepTimerClear: () -> Unit,
    lastSleepTimerMinutes: Int,
    onDismiss: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .navigationBarsPadding()
            .padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(20.dp)
    ) {
        Text("Playback Enhancements", style = MaterialTheme.typography.titleMedium)

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text("Skip silence", style = MaterialTheme.typography.bodyLarge)
                Text("Trim quiet gaps automatically", style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
            Switch(checked = skipSilenceEnabled, onCheckedChange = { onSkipSilenceToggled() })
        }

        Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text("Crossfade", style = MaterialTheme.typography.bodyLarge)
                    Text("Blend transitions between tracks", style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
                }
                Switch(checked = crossfadeSeconds > 0, onCheckedChange = { onCrossfadeToggle() })
            }
            Slider(
                value = crossfadeSeconds.toFloat(),
                onValueChange = { onCrossfadeDurationChanged(it.roundToInt()) },
                valueRange = 0f..12f,
                steps = 11,
                colors = SliderDefaults.colors(activeTrackColor = MaterialTheme.colorScheme.primary)
            )
            Text("${crossfadeSeconds}s", style = MaterialTheme.typography.labelMedium)
        }

        Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
            Text("Sleep timer", style = MaterialTheme.typography.bodyLarge)
            Row(
                modifier = Modifier
                    .horizontalScroll(rememberScrollState()),
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                listOf(15, 30, 45, 60).forEach { minutes ->
                    FilterChip(
                        selected = lastSleepTimerMinutes == minutes,
                        onClick = { onSleepTimerSelected(minutes) },
                        label = { Text("${minutes}m") },
                        leadingIcon = if (lastSleepTimerMinutes == minutes) {
                            { Icon(Icons.Default.Check, contentDescription = null, modifier = Modifier.size(16.dp)) }
                        } else null
                    )
                }
                FilterChip(
                    selected = false,
                    onClick = onSleepTimerClear,
                    label = { Text("Clear") }
                )
            }
        }

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text("Party mode", style = MaterialTheme.typography.bodyLarge)
                Text("Animated backdrop for celebrations", style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
            Switch(checked = partyModeEnabled, onCheckedChange = { onPartyModeToggle() })
        }

        Spacer(modifier = Modifier.height(8.dp))
        Button(
            onClick = onDismiss,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Done")
        }
    }
}

@Composable
private fun QueueSheet(
    entries: List<AudioQueueEntry>,
    onPlay: (Int) -> Unit,
    onMoveUp: (Int) -> Unit,
    onMoveDown: (Int) -> Unit,
    onRemove: (Int) -> Unit,
    onClose: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .navigationBarsPadding()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text("Play Queue", style = MaterialTheme.typography.titleMedium)
        if (entries.isEmpty()) {
            Text("Queue is empty", color = MaterialTheme.colorScheme.onSurfaceVariant)
        } else {
            LazyColumn(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                items(entries, key = { it.index }) { entry ->
                    Surface(
                        shape = RoundedCornerShape(12.dp),
                        tonalElevation = if (entry.isCurrent) 4.dp else 0.dp,
                        color = if (entry.isCurrent) MaterialTheme.colorScheme.primary.copy(alpha = 0.08f) else MaterialTheme.colorScheme.surfaceVariant
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(12.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Column(modifier = Modifier.weight(1f)) {
                                Text(entry.title, style = MaterialTheme.typography.bodyLarge)
                                if (entry.isCurrent) {
                                    Text("Now playing", style = MaterialTheme.typography.labelSmall, color = MaterialTheme.colorScheme.primary)
                                }
                            }
                            Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                                IconButton(onClick = { onPlay(entry.index) }) {
                                    Icon(Icons.Default.PlayArrow, contentDescription = "Play this track")
                                }
                                IconButton(onClick = { onMoveUp(entry.index) }, enabled = entry.index > 0) {
                                    Icon(Icons.Default.KeyboardArrowUp, contentDescription = "Move up")
                                }
                                IconButton(onClick = { onMoveDown(entry.index) }, enabled = entry.index < entries.lastIndex) {
                                    Icon(Icons.Default.KeyboardArrowDown, contentDescription = "Move down")
                                }
                                IconButton(onClick = { onRemove(entry.index) }) {
                                    Icon(Icons.Default.Delete, contentDescription = "Remove")
                                }
                            }
                        }
                    }
                }
            }
        }
        Button(
            onClick = onClose,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Close")
        }
    }
}

@Composable
private fun SleepTimerBadge(
    endTime: Long,
    onClear: () -> Unit,
    textColor: Color
) {
    var now by remember(endTime) { mutableStateOf(System.currentTimeMillis()) }
    LaunchedEffect(endTime) {
        while (now < endTime) {
            delay(1000)
            now = System.currentTimeMillis()
        }
    }
    val remaining = (endTime - now).coerceAtLeast(0L)
    if (remaining <= 0L) return
    val minutes = (remaining / 60000)
    val seconds = (remaining / 1000) % 60
    Surface(
        shape = RoundedCornerShape(50),
        color = textColor.copy(alpha = 0.15f),
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Sleep timer ${String.format(Locale.US, "%02d:%02d", minutes, seconds)}",
                color = textColor,
                style = MaterialTheme.typography.labelLarge
            )
            IconButton(onClick = onClear) {
                Icon(Icons.Default.Close, contentDescription = "Cancel timer", tint = textColor)
            }
        }
    }
}

@Composable
private fun PartyModeAurora(
    modifier: Modifier = Modifier,
    baseColors: List<Color>
) {
    val transition = rememberInfiniteTransition(label = "party_mode")
    val phase by transition.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis = 12000, easing = LinearEasing),
            repeatMode = androidx.compose.animation.core.RepeatMode.Restart
        ),
        label = "party_phase"
    )
    Canvas(modifier = modifier) {
        val width = size.width
        val height = size.height
        val palette = listOf(
            baseColors.getOrNull(0) ?: Color.Magenta,
            baseColors.getOrNull(1) ?: Color.Cyan,
            baseColors.getOrNull(2) ?: Color.Yellow
        )
        palette.forEachIndexed { index, color ->
            val animatedRadius = (width.coerceAtMost(height) / 2f) * (0.4f + 0.25f * sin((phase + index * 0.3f) * 2 * PI).toFloat())
            val animatedX = width * ((phase + index * 0.2f) % 1f)
            val animatedY = height * (((phase * 1.2f) + index * 0.15f) % 1f)
            drawCircle(
                color = color.copy(alpha = 0.12f),
                radius = animatedRadius,
                center = Offset(animatedX, animatedY),
                style = Stroke(width = animatedRadius * 0.15f)
            )
        }
    }
}

