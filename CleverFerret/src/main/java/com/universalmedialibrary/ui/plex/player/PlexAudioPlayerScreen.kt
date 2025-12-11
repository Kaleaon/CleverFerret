package com.universalmedialibrary.ui.plex.player

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Audio Player Screen
 * 
 * Unified player for:
 * - Music tracks
 * - Audiobooks
 * - Podcasts
 * 
 * Features:
 * - Full-screen artwork display with blur background
 * - Playback controls (play, pause, seek, skip)
 * - Queue management
 * - Equalizer & audio effects
 * - Sleep timer
 * - Playback speed control
 * - Chapter navigation (for audiobooks/podcasts)
 * - Lyrics display (for music)
 * - Chromecast support
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexAudioPlayerScreen(
    state: AudioPlayerState,
    onPlayPause: () -> Unit,
    onSeek: (Float) -> Unit,
    onSkipPrevious: () -> Unit,
    onSkipNext: () -> Unit,
    onRewind: () -> Unit,
    onFastForward: () -> Unit,
    onSpeedChange: (Float) -> Unit,
    onShuffleToggle: () -> Unit,
    onRepeatToggle: () -> Unit,
    onSleepTimer: () -> Unit,
    onQueueOpen: () -> Unit,
    onChaptersOpen: () -> Unit,
    onCastClick: () -> Unit,
    onClose: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showQueue by remember { mutableStateOf(false) }
    var showSpeedPicker by remember { mutableStateOf(false) }
    var showSleepTimer by remember { mutableStateOf(false) }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(PlexColors.Background)
    ) {
        // Blurred background artwork
        if (state.artworkUrl != null) {
            AsyncImage(
                model = state.artworkUrl,
                contentDescription = null,
                modifier = Modifier
                    .fillMaxSize()
                    .blur(50.dp),
                contentScale = ContentScale.Crop,
                alpha = 0.3f
            )
        }
        
        // Gradient overlay
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color.Black.copy(alpha = 0.5f),
                            PlexColors.Background,
                            PlexColors.Background
                        )
                    )
                )
        )
        
        // Main content
        Column(
            modifier = Modifier
                .fillMaxSize()
                .statusBarsPadding()
                .navigationBarsPadding()
        ) {
            // Top bar
            PlayerTopBar(
                title = when (state.playerType) {
                    PlayerType.MUSIC -> "Now Playing"
                    PlayerType.AUDIOBOOK -> state.albumTitle ?: "Audiobook"
                    PlayerType.PODCAST -> state.albumTitle ?: "Podcast"
                },
                subtitle = when (state.playerType) {
                    PlayerType.AUDIOBOOK -> state.chapterInfo?.let { "Chapter ${it.current} of ${it.total}" }
                    else -> null
                },
                isCasting = state.isCasting,
                onClose = onClose,
                onCast = onCastClick,
                onQueue = { showQueue = true }
            )
            
            Spacer(modifier = Modifier.weight(1f))
            
            // Artwork
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = PlexSpacing.XL),
                contentAlignment = Alignment.Center
            ) {
                Surface(
                    modifier = Modifier
                        .size(300.dp)
                        .clip(RoundedCornerShape(PlexCorners.LG)),
                    color = PlexColors.BackgroundSurface,
                    shadowElevation = PlexElevation.LG
                ) {
                    if (state.artworkUrl != null) {
                        AsyncImage(
                            model = state.artworkUrl,
                            contentDescription = null,
                            modifier = Modifier.fillMaxSize(),
                            contentScale = ContentScale.Crop
                        )
                    } else {
                        Box(
                            contentAlignment = Alignment.Center,
                            modifier = Modifier.fillMaxSize()
                        ) {
                            Icon(
                                imageVector = when (state.playerType) {
                                    PlayerType.MUSIC -> Icons.Default.MusicNote
                                    PlayerType.AUDIOBOOK -> Icons.Default.Headphones
                                    PlayerType.PODCAST -> Icons.Default.Podcasts
                                },
                                contentDescription = null,
                                tint = PlexColors.TextTertiary,
                                modifier = Modifier.size(96.dp)
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.weight(1f))
            
            // Track info
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = PlexSpacing.XL),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = state.title,
                    style = PlexTypography.TitleLarge,
                    color = PlexColors.TextPrimary,
                    textAlign = TextAlign.Center,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.SemiBold
                )
                
                Spacer(modifier = Modifier.height(PlexSpacing.XS))
                
                Text(
                    text = state.artist,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextSecondary,
                    textAlign = TextAlign.Center,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                // Chapter title for audiobooks/podcasts
                if (state.playerType != PlayerType.MUSIC && state.chapterTitle != null) {
                    Spacer(modifier = Modifier.height(PlexSpacing.XS))
                    Text(
                        text = state.chapterTitle,
                        style = PlexTypography.LabelMedium,
                        color = PlexColors.AccentPrimary,
                        textAlign = TextAlign.Center,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.XL))
            
            // Progress bar
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = PlexSpacing.XL)
            ) {
                Slider(
                    value = state.currentPosition.toFloat(),
                    onValueChange = { onSeek(it) },
                    valueRange = 0f..state.duration.toFloat(),
                    colors = SliderDefaults.colors(
                        thumbColor = PlexColors.AccentPrimary,
                        activeTrackColor = PlexColors.AccentPrimary,
                        inactiveTrackColor = PlexColors.ProgressBackground
                    )
                )
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(
                        text = formatTime(state.currentPosition),
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary
                    )
                    Text(
                        text = "-${formatTime(state.duration - state.currentPosition)}",
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
            
            // Main playback controls
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = PlexSpacing.XL),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Shuffle (music) or Speed (audiobook/podcast)
                if (state.playerType == PlayerType.MUSIC) {
                    IconButton(onClick = onShuffleToggle) {
                        Icon(
                            imageVector = Icons.Default.Shuffle,
                            contentDescription = "Shuffle",
                            tint = if (state.isShuffleEnabled) PlexColors.AccentPrimary else PlexColors.TextSecondary
                        )
                    }
                } else {
                    TextButton(onClick = { showSpeedPicker = true }) {
                        Text(
                            text = "${state.playbackSpeed}x",
                            style = PlexTypography.LabelLarge,
                            color = PlexColors.AccentPrimary,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }
                
                // Previous / Rewind
                IconButton(
                    onClick = if (state.playerType == PlayerType.MUSIC) onSkipPrevious else onRewind,
                    modifier = Modifier.size(48.dp)
                ) {
                    Icon(
                        imageVector = if (state.playerType == PlayerType.MUSIC) 
                            Icons.Default.SkipPrevious 
                        else 
                            Icons.Default.Replay30,
                        contentDescription = if (state.playerType == PlayerType.MUSIC) "Previous" else "Rewind 30s",
                        tint = PlexColors.TextPrimary,
                        modifier = Modifier.size(32.dp)
                    )
                }
                
                // Play/Pause
                Surface(
                    shape = CircleShape,
                    color = PlexColors.AccentPrimary,
                    modifier = Modifier.size(72.dp),
                    onClick = onPlayPause
                ) {
                    Icon(
                        imageVector = if (state.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = if (state.isPlaying) "Pause" else "Play",
                        tint = Color.Black,
                        modifier = Modifier.padding(16.dp)
                    )
                }
                
                // Next / Fast Forward
                IconButton(
                    onClick = if (state.playerType == PlayerType.MUSIC) onSkipNext else onFastForward,
                    modifier = Modifier.size(48.dp)
                ) {
                    Icon(
                        imageVector = if (state.playerType == PlayerType.MUSIC) 
                            Icons.Default.SkipNext 
                        else 
                            Icons.Default.Forward30,
                        contentDescription = if (state.playerType == PlayerType.MUSIC) "Next" else "Forward 30s",
                        tint = PlexColors.TextPrimary,
                        modifier = Modifier.size(32.dp)
                    )
                }
                
                // Repeat (music) or Sleep Timer (audiobook/podcast)
                if (state.playerType == PlayerType.MUSIC) {
                    IconButton(onClick = onRepeatToggle) {
                        Icon(
                            imageVector = when (state.repeatMode) {
                                RepeatMode.OFF -> Icons.Default.Repeat
                                RepeatMode.ALL -> Icons.Default.Repeat
                                RepeatMode.ONE -> Icons.Default.RepeatOne
                            },
                            contentDescription = "Repeat",
                            tint = if (state.repeatMode != RepeatMode.OFF) 
                                PlexColors.AccentPrimary 
                            else 
                                PlexColors.TextSecondary
                        )
                    }
                } else {
                    IconButton(onClick = { showSleepTimer = true }) {
                        Icon(
                            imageVector = if (state.sleepTimerActive) 
                                Icons.Filled.Timer 
                            else 
                                Icons.Outlined.Timer,
                            contentDescription = "Sleep Timer",
                            tint = if (state.sleepTimerActive) PlexColors.AccentPrimary else PlexColors.TextSecondary
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.XL))
            
            // Bottom actions
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = PlexSpacing.XL),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                // Chapters (for audiobooks/podcasts)
                if (state.playerType != PlayerType.MUSIC && state.hasChapters) {
                    IconButton(onClick = onChaptersOpen) {
                        Column(horizontalAlignment = Alignment.CenterHorizontally) {
                            Icon(
                                imageVector = Icons.Default.List,
                                contentDescription = "Chapters",
                                tint = PlexColors.TextSecondary
                            )
                            Text(
                                text = "Chapters",
                                style = PlexTypography.LabelSmall,
                                color = PlexColors.TextTertiary
                            )
                        }
                    }
                }
                
                // Equalizer
                IconButton(onClick = { /* Open equalizer */ }) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Icon(
                            imageVector = Icons.Default.Equalizer,
                            contentDescription = "Equalizer",
                            tint = PlexColors.TextSecondary
                        )
                        Text(
                            text = "EQ",
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextTertiary
                        )
                    }
                }
                
                // Queue
                IconButton(onClick = { showQueue = true }) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Icon(
                            imageVector = Icons.Default.QueueMusic,
                            contentDescription = "Queue",
                            tint = PlexColors.TextSecondary
                        )
                        Text(
                            text = "Queue",
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextTertiary
                        )
                    }
                }
                
                // Lyrics (for music)
                if (state.playerType == PlayerType.MUSIC) {
                    IconButton(onClick = { /* Show lyrics */ }) {
                        Column(horizontalAlignment = Alignment.CenterHorizontally) {
                            Icon(
                                imageVector = Icons.Outlined.Lyrics,
                                contentDescription = "Lyrics",
                                tint = PlexColors.TextSecondary
                            )
                            Text(
                                text = "Lyrics",
                                style = PlexTypography.LabelSmall,
                                color = PlexColors.TextTertiary
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
        }
    }
    
    // Queue sheet
    if (showQueue) {
        ModalBottomSheet(
            onDismissRequest = { showQueue = false },
            containerColor = PlexColors.BackgroundElevated
        ) {
            QueueSheet(
                queue = state.queue,
                currentIndex = state.currentQueueIndex,
                onItemClick = { index ->
                    // Play item at index
                    showQueue = false
                },
                onRemove = { index ->
                    // Remove from queue
                }
            )
        }
    }
    
    // Speed picker
    if (showSpeedPicker) {
        SpeedPickerDialog(
            currentSpeed = state.playbackSpeed,
            onSpeedChange = {
                onSpeedChange(it)
                showSpeedPicker = false
            },
            onDismiss = { showSpeedPicker = false }
        )
    }
    
    // Sleep timer
    if (showSleepTimer) {
        SleepTimerDialog(
            currentTimer = state.sleepTimerRemaining,
            isActive = state.sleepTimerActive,
            onSetTimer = { minutes ->
                onSleepTimer()
                showSleepTimer = false
            },
            onDismiss = { showSleepTimer = false }
        )
    }
}

// =============================================================================
// TOP BAR
// =============================================================================

@Composable
private fun PlayerTopBar(
    title: String,
    subtitle: String?,
    isCasting: Boolean,
    onClose: () -> Unit,
    onCast: () -> Unit,
    onQueue: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.SM, vertical = PlexSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        IconButton(onClick = onClose) {
            Icon(
                imageVector = Icons.Default.ExpandMore,
                contentDescription = "Minimize",
                tint = PlexColors.TextPrimary
            )
        }
        
        Column(
            modifier = Modifier.weight(1f),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = title,
                style = PlexTypography.LabelMedium,
                color = PlexColors.TextSecondary
            )
            subtitle?.let {
                Text(
                    text = it,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextTertiary
                )
            }
        }
        
        IconButton(onClick = onCast) {
            Icon(
                imageVector = if (isCasting) Icons.Filled.Cast else Icons.Outlined.Cast,
                contentDescription = "Cast",
                tint = if (isCasting) PlexColors.AccentPrimary else PlexColors.TextSecondary
            )
        }
        
        IconButton(onClick = onQueue) {
            Icon(
                imageVector = Icons.Default.MoreVert,
                contentDescription = "More",
                tint = PlexColors.TextSecondary
            )
        }
    }
}

// =============================================================================
// QUEUE SHEET
// =============================================================================

@Composable
private fun QueueSheet(
    queue: List<QueueItem>,
    currentIndex: Int,
    onItemClick: (Int) -> Unit,
    onRemove: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(PlexSpacing.MD)
    ) {
        Text(
            text = "Up Next",
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary,
            modifier = Modifier.padding(bottom = PlexSpacing.MD)
        )
        
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(max = 400.dp)
        ) {
            itemsIndexed(queue) { index, item ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onItemClick(index) }
                        .background(
                            if (index == currentIndex)
                                PlexColors.AccentPrimary.copy(alpha = 0.1f)
                            else
                                Color.Transparent
                        )
                        .padding(PlexSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Drag handle
                    Icon(
                        imageVector = Icons.Default.DragHandle,
                        contentDescription = "Reorder",
                        tint = PlexColors.TextTertiary,
                        modifier = Modifier.size(20.dp)
                    )
                    
                    Spacer(modifier = Modifier.width(PlexSpacing.SM))
                    
                    // Artwork
                    Surface(
                        modifier = Modifier
                            .size(48.dp)
                            .clip(RoundedCornerShape(PlexCorners.XS)),
                        color = PlexColors.BackgroundSurface
                    ) {
                        if (item.artworkUrl != null) {
                            AsyncImage(
                                model = item.artworkUrl,
                                contentDescription = null,
                                contentScale = ContentScale.Crop,
                                modifier = Modifier.fillMaxSize()
                            )
                        }
                    }
                    
                    Spacer(modifier = Modifier.width(PlexSpacing.MD))
                    
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = item.title,
                            style = PlexTypography.BodyMedium,
                            color = if (index == currentIndex) 
                                PlexColors.AccentPrimary 
                            else 
                                PlexColors.TextPrimary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis,
                            fontWeight = if (index == currentIndex) FontWeight.SemiBold else FontWeight.Normal
                        )
                        Text(
                            text = item.artist,
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextSecondary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    
                    // Now playing indicator
                    if (index == currentIndex) {
                        Icon(
                            imageVector = Icons.Default.VolumeUp,
                            contentDescription = "Playing",
                            tint = PlexColors.AccentPrimary,
                            modifier = Modifier.size(20.dp)
                        )
                    } else {
                        IconButton(onClick = { onRemove(index) }) {
                            Icon(
                                imageVector = Icons.Default.Close,
                                contentDescription = "Remove",
                                tint = PlexColors.TextTertiary,
                                modifier = Modifier.size(20.dp)
                            )
                        }
                    }
                }
            }
        }
    }
}

// =============================================================================
// SPEED PICKER
// =============================================================================

@Composable
private fun SpeedPickerDialog(
    currentSpeed: Float,
    onSpeedChange: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    val speeds = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 1.75f, 2.0f, 2.5f, 3.0f)
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Playback Speed", color = PlexColors.TextPrimary)
        },
        text = {
            LazyColumn {
                items(speeds) { speed ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSpeedChange(speed) }
                            .padding(PlexSpacing.MD),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "${speed}x",
                            style = PlexTypography.BodyMedium,
                            color = if (speed == currentSpeed) 
                                PlexColors.AccentPrimary 
                            else 
                                PlexColors.TextPrimary,
                            fontWeight = if (speed == currentSpeed) FontWeight.SemiBold else FontWeight.Normal
                        )
                        if (speed == currentSpeed) {
                            Icon(
                                imageVector = Icons.Default.Check,
                                contentDescription = null,
                                tint = PlexColors.AccentPrimary
                            )
                        }
                    }
                }
            }
        },
        confirmButton = {},
        containerColor = PlexColors.BackgroundElevated
    )
}

// =============================================================================
// SLEEP TIMER
// =============================================================================

@Composable
private fun SleepTimerDialog(
    currentTimer: Long?,
    isActive: Boolean,
    onSetTimer: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    val options = listOf(
        5 to "5 minutes",
        15 to "15 minutes",
        30 to "30 minutes",
        45 to "45 minutes",
        60 to "1 hour",
        -1 to "End of chapter/episode"
    )
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Sleep Timer", color = PlexColors.TextPrimary)
        },
        text = {
            Column {
                if (isActive && currentTimer != null) {
                    Surface(
                        color = PlexColors.AccentPrimary.copy(alpha = 0.1f),
                        shape = RoundedCornerShape(PlexCorners.SM),
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = PlexSpacing.MD)
                    ) {
                        Row(
                            modifier = Modifier.padding(PlexSpacing.MD),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Timer,
                                contentDescription = null,
                                tint = PlexColors.AccentPrimary
                            )
                            Spacer(modifier = Modifier.width(PlexSpacing.SM))
                            Text(
                                text = "Timer: ${formatTime(currentTimer)}",
                                color = PlexColors.AccentPrimary,
                                style = PlexTypography.BodyMedium
                            )
                            Spacer(modifier = Modifier.weight(1f))
                            TextButton(onClick = { onSetTimer(0) }) {
                                Text("Cancel", color = PlexColors.Error)
                            }
                        }
                    }
                }
                
                options.forEach { (minutes, label) ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSetTimer(minutes) }
                            .padding(PlexSpacing.MD),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = label,
                            style = PlexTypography.BodyMedium,
                            color = PlexColors.TextPrimary
                        )
                    }
                }
            }
        },
        confirmButton = {},
        containerColor = PlexColors.BackgroundElevated
    )
}

// =============================================================================
// HELPERS
// =============================================================================

private fun formatTime(ms: Long): String {
    val seconds = (ms / 1000) % 60
    val minutes = (ms / (1000 * 60)) % 60
    val hours = ms / (1000 * 60 * 60)
    
    return if (hours > 0) {
        "%d:%02d:%02d".format(hours, minutes, seconds)
    } else {
        "%d:%02d".format(minutes, seconds)
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class AudioPlayerState(
    val title: String,
    val artist: String,
    val albumTitle: String?,
    val artworkUrl: String?,
    val currentPosition: Long,
    val duration: Long,
    val isPlaying: Boolean,
    val playerType: PlayerType,
    val playbackSpeed: Float = 1.0f,
    val isShuffleEnabled: Boolean = false,
    val repeatMode: RepeatMode = RepeatMode.OFF,
    val queue: List<QueueItem> = emptyList(),
    val currentQueueIndex: Int = 0,
    val hasChapters: Boolean = false,
    val chapterTitle: String? = null,
    val chapterInfo: ChapterPosition? = null,
    val sleepTimerActive: Boolean = false,
    val sleepTimerRemaining: Long? = null,
    val isCasting: Boolean = false
)

enum class PlayerType {
    MUSIC, AUDIOBOOK, PODCAST
}

enum class RepeatMode {
    OFF, ALL, ONE
}

data class QueueItem(
    val id: String,
    val title: String,
    val artist: String,
    val artworkUrl: String?,
    val duration: Long
)

data class ChapterPosition(
    val current: Int,
    val total: Int
)
