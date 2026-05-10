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


// =============================================================================
// QUEUE SHEET
// =============================================================================


// =============================================================================
// SPEED PICKER
// =============================================================================


// =============================================================================
// SLEEP TIMER
// =============================================================================


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
