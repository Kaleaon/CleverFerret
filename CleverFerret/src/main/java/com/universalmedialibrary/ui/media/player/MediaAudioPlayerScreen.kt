package com.universalmedialibrary.ui.media.player

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
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Audio Player Screen
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
fun MediaAudioPlayerScreen(
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
            .background(MediaColors.Background)
    ) {
        // Blurred background artwork
        if (state.artworkUrl != null) {
            AsyncImage(
                    
                model = state.artworkUrl,
                contentDescription = "Background artwork",
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
                            MediaColors.Background,
                            MediaColors.Background
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
                    .padding(horizontal = MediaSpacing.XL),
                contentAlignment = Alignment.Center
            ) {
                Surface(
                    modifier = Modifier
                        .size(300.dp)
                        .clip(RoundedCornerShape(MediaCorners.LG)),
                    color = MediaColors.BackgroundSurface,
                    shadowElevation = MediaElevation.LG
                ) {
                    if (state.artworkUrl != null) {
                        AsyncImage(
                    
                            model = state.artworkUrl,
                            contentDescription = "${state.title} album artwork",
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
                                contentDescription = "Media type: ${state.playerType.name}",
                                tint = MediaColors.TextTertiary,
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
                    .padding(horizontal = MediaSpacing.XL),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = state.title,
                    style = MediaTypography.TitleLarge,
                    color = MediaColors.TextPrimary,
                    textAlign = TextAlign.Center,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.SemiBold
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.XS))
                
                Text(
                    text = state.artist ?: "",
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextSecondary,
                    textAlign = TextAlign.Center,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                // Chapter title for audiobooks/podcasts
                if (state.playerType != PlayerType.MUSIC && state.chapterTitle != null) {
                    Spacer(modifier = Modifier.height(MediaSpacing.XS))
                    Text(
                        text = state.chapterTitle,
                        style = MediaTypography.LabelMedium,
                        color = MediaColors.AccentPrimary,
                        textAlign = TextAlign.Center,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.XL))
            
            // Progress bar
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = MediaSpacing.XL)
            ) {
                Slider(
                    value = state.currentPosition.toFloat(),
                    onValueChange = { onSeek(it) },
                    valueRange = 0f..state.duration.toFloat(),
                    colors = SliderDefaults.colors(
                        thumbColor = MediaColors.AccentPrimary,
                        activeTrackColor = MediaColors.AccentPrimary,
                        inactiveTrackColor = MediaColors.ProgressBackground
                    )
                )
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(
                        text = formatTime(state.currentPosition),
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary
                    )
                    Text(
                        text = "-${formatTime(state.duration - state.currentPosition)}",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
            
            // Main playback controls
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = MediaSpacing.XL),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Shuffle (music) or Speed (audiobook/podcast)
                if (state.playerType == PlayerType.MUSIC) {
                    IconButton(onClick = onShuffleToggle) {
                        Icon(
                            imageVector = Icons.Default.Shuffle,
                            contentDescription = "Shuffle",
                            tint = if (state.isShuffleEnabled) MediaColors.AccentPrimary else MediaColors.TextSecondary
                        )
                    }
                } else {
                    TextButton(onClick = { showSpeedPicker = true }) {
                        Text(
                            text = "${state.playbackSpeed}x",
                            style = MediaTypography.LabelLarge,
                            color = MediaColors.AccentPrimary,
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
                        tint = MediaColors.TextPrimary,
                        modifier = Modifier.size(32.dp)
                    )
                }
                
                // Play/Pause
                Surface(
                    shape = CircleShape,
                    color = MediaColors.AccentPrimary,
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
                        tint = MediaColors.TextPrimary,
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
                                MediaColors.AccentPrimary 
                            else 
                                MediaColors.TextSecondary
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
                            tint = if (state.sleepTimerActive) MediaColors.AccentPrimary else MediaColors.TextSecondary
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.XL))
            
            // Bottom actions
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = MediaSpacing.XL),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                // Chapters (for audiobooks/podcasts)
                if (state.playerType != PlayerType.MUSIC && state.hasChapters) {
                    IconButton(onClick = onChaptersOpen) {
                        Column(horizontalAlignment = Alignment.CenterHorizontally) {
                            Icon(
                                imageVector = Icons.Default.List,
                                contentDescription = "Chapters",
                                tint = MediaColors.TextSecondary
                            )
                            Text(
                                text = "Chapters",
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextTertiary
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
                            tint = MediaColors.TextSecondary
                        )
                        Text(
                            text = "EQ",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }
                }
                
                // Queue
                IconButton(onClick = { showQueue = true }) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Icon(
                            imageVector = Icons.Default.QueueMusic,
                            contentDescription = "Queue",
                            tint = MediaColors.TextSecondary
                        )
                        Text(
                            text = "Queue",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
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
                                tint = MediaColors.TextSecondary
                            )
                            Text(
                                text = "Lyrics",
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextTertiary
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
        }
    }
    
    // Queue sheet
    if (showQueue) {
        ModalBottomSheet(
            onDismissRequest = { showQueue = false },
            containerColor = MediaColors.BackgroundElevated
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
            .padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        IconButton(onClick = onClose) {
            Icon(
                imageVector = Icons.Default.ExpandMore,
                contentDescription = "Minimize",
                tint = MediaColors.TextPrimary
            )
        }
        
        Column(
            modifier = Modifier.weight(1f),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = title,
                style = MediaTypography.LabelMedium,
                color = MediaColors.TextSecondary
            )
            subtitle?.let {
                Text(
                    text = it,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
            }
        }
        
        IconButton(onClick = onCast) {
            Icon(
                imageVector = if (isCasting) Icons.Filled.Cast else Icons.Outlined.Cast,
                contentDescription = "Cast",
                tint = if (isCasting) MediaColors.AccentPrimary else MediaColors.TextSecondary
            )
        }
        
        IconButton(onClick = onQueue) {
            Icon(
                imageVector = Icons.Default.MoreVert,
                contentDescription = "More",
                tint = MediaColors.TextSecondary
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
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Up Next",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
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
                                MediaColors.AccentPrimary.copy(alpha = 0.1f)
                            else
                                Color.Transparent
                        )
                        .padding(MediaSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Drag handle
                    Icon(
                        imageVector = Icons.Default.DragHandle,
                        contentDescription = "Reorder",
                        tint = MediaColors.TextTertiary,
                        modifier = Modifier.size(20.dp)
                    )
                    
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    
                    // Artwork
                    Surface(
                        modifier = Modifier
                            .size(48.dp)
                            .clip(RoundedCornerShape(MediaCorners.XS)),
                        color = MediaColors.BackgroundSurface
                    ) {
                        if (item.artworkUrl != null) {
                            AsyncImage(
                    
                                model = item.artworkUrl,
                                contentDescription = "Media image",
                                contentScale = ContentScale.Crop,
                                modifier = Modifier.fillMaxSize()
                            )
                        }
                    }
                    
                    Spacer(modifier = Modifier.width(MediaSpacing.MD))
                    
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = item.title,
                            style = MediaTypography.BodyMedium,
                            color = if (index == currentIndex) 
                                MediaColors.AccentPrimary 
                            else 
                                MediaColors.TextPrimary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis,
                            fontWeight = if (index == currentIndex) FontWeight.SemiBold else FontWeight.Normal
                        )
                        Text(
                            text = item.artist ?: "",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextSecondary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    
                    // Now playing indicator
                    if (index == currentIndex) {
                        Icon(
                            imageVector = Icons.Default.VolumeUp,
                            contentDescription = "Playing",
                            tint = MediaColors.AccentPrimary,
                            modifier = Modifier.size(20.dp)
                        )
                    } else {
                        IconButton(onClick = { onRemove(index) }) {
                            Icon(
                                imageVector = Icons.Default.Close,
                                contentDescription = "Remove",
                                tint = MediaColors.TextTertiary,
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
            Text("Playback Speed", color = MediaColors.TextPrimary)
        },
        text = {
            LazyColumn {
                items(speeds) { speed ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSpeedChange(speed) }
                            .padding(MediaSpacing.MD),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "${speed}x",
                            style = MediaTypography.BodyMedium,
                            color = if (speed == currentSpeed) 
                                MediaColors.AccentPrimary 
                            else 
                                MediaColors.TextPrimary,
                            fontWeight = if (speed == currentSpeed) FontWeight.SemiBold else FontWeight.Normal
                        )
                        if (speed == currentSpeed) {
                            Icon(
                                imageVector = Icons.Default.Check,
                                contentDescription = "Media image",
                                tint = MediaColors.AccentPrimary
                            )
                        }
                    }
                }
            }
        },
        confirmButton = {},
        containerColor = MediaColors.BackgroundElevated
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
            Text("Sleep Timer", color = MediaColors.TextPrimary)
        },
        text = {
            Column {
                if (isActive && currentTimer != null) {
                    Surface(
                        color = MediaColors.AccentPrimary.copy(alpha = 0.1f),
                        shape = RoundedCornerShape(MediaCorners.SM),
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = MediaSpacing.MD)
                    ) {
                        Row(
                            modifier = Modifier.padding(MediaSpacing.MD),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Timer,
                                contentDescription = "Media image",
                                tint = MediaColors.AccentPrimary
                            )
                            Spacer(modifier = Modifier.width(MediaSpacing.SM))
                            Text(
                                text = "Timer: ${formatTime(currentTimer)}",
                                color = MediaColors.AccentPrimary,
                                style = MediaTypography.BodyMedium
                            )
                            Spacer(modifier = Modifier.weight(1f))
                            TextButton(onClick = { onSetTimer(0) }) {
                                Text("Cancel", color = MediaColors.Error)
                            }
                        }
                    }
                }
                
                options.forEach { (minutes, label) ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSetTimer(minutes) }
                            .padding(MediaSpacing.MD),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = label,
                            style = MediaTypography.BodyMedium,
                            color = MediaColors.TextPrimary
                        )
                    }
                }
            }
        },
        confirmButton = {},
        containerColor = MediaColors.BackgroundElevated
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
    val title: String = "",
    val artist: String? = null,
    val albumTitle: String? = null,
    val artworkUrl: String? = null,
    val currentPosition: Long = 0L,
    val duration: Long = 0L,
    val isPlaying: Boolean = false,
    val playerType: PlayerType = PlayerType.MUSIC,
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
    val artist: String? = null,
    val artworkUrl: String?,
    val duration: Long,
    val isCurrentItem: Boolean = false
)

data class ChapterPosition(
    val current: Int,
    val total: Int
)
