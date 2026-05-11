package com.universalmedialibrary.ui.media.player

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
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
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Video Player Screen
 * 
 * Full-featured video player for:
 * - Movies
 * - TV Shows
 * - Video files
 * 
 * Features:
 * - Gesture controls (swipe for brightness/volume)
 * - Double-tap to seek
 * - Picture-in-Picture
 * - Chromecast support
 * - Subtitle support
 * - Audio track selection
 * - Quality selection
 * - Skip intro/outro
 * - Chapter navigation
 * - Resume playback position
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaVideoPlayerScreen(
    state: VideoPlayerState,
    onPlayPause: () -> Unit,
    onSeek: (Long) -> Unit,
    onSeekRelative: (Long) -> Unit,
    onSkipPrevious: () -> Unit,
    onSkipNext: () -> Unit,
    onSkipIntro: () -> Unit,
    onSubtitleChange: (SubtitleTrack?) -> Unit,
    onAudioTrackChange: (AudioTrack) -> Unit,
    onQualityChange: (VideoQuality) -> Unit,
    onCastClick: () -> Unit,
    onPipClick: () -> Unit,
    onClose: () -> Unit,
    modifier: Modifier = Modifier
) {
    var controlsVisible by remember { mutableStateOf(true) }
    var showSettings by remember { mutableStateOf(false) }
    var showSubtitles by remember { mutableStateOf(false) }
    var showQuality by remember { mutableStateOf(false) }
    var showEpisodes by remember { mutableStateOf(false) }
    var seekPreviewPosition by remember { mutableStateOf<Long?>(null) }
    var brightnessLevel by remember { mutableStateOf(0.5f) }
    var volumeLevel by remember { mutableStateOf(1f) }
    var showBrightnessIndicator by remember { mutableStateOf(false) }
    var showVolumeIndicator by remember { mutableStateOf(false) }
    
    // Auto-hide controls
    LaunchedEffect(controlsVisible) {
        if (controlsVisible && state.isPlaying) {
            kotlinx.coroutines.delay(4000)
            controlsVisible = false
        }
    }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(Color.Black)
            .pointerInput(Unit) {
                detectTapGestures(
                    onTap = { controlsVisible = !controlsVisible },
                    onDoubleTap = { offset ->
                        val screenWidth = size.width
                        val seekAmount = 10000L // 10 seconds
                        when {
                            offset.x < screenWidth / 3 -> onSeekRelative(-seekAmount)
                            offset.x > screenWidth * 2 / 3 -> onSeekRelative(seekAmount)
                        }
                    }
                )
            }
    ) {
        // Video surface placeholder
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            // In real implementation, this would be ExoPlayer PlayerView
            // For now, showing a placeholder
            if (state.thumbnailUrl != null) {
                AsyncImage(
                    
                    model = state.thumbnailUrl,
                    contentDescription = "Media image",
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Fit
                )
            }
        }
        
        // Gesture overlays for brightness/volume
        Row(modifier = Modifier.fillMaxSize()) {
            // Left side - brightness
            Box(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight()
                    .pointerInput(Unit) {
                        detectVerticalDragGestures(
                            onDragStart = { showBrightnessIndicator = true },
                            onDragEnd = { showBrightnessIndicator = false },
                            onVerticalDrag = { _, dragAmount ->
                                brightnessLevel = (brightnessLevel - dragAmount / 500f).coerceIn(0f, 1f)
                            }
                        )
                    }
            )
            
            // Right side - volume
            Box(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight()
                    .pointerInput(Unit) {
                        detectVerticalDragGestures(
                            onDragStart = { showVolumeIndicator = true },
                            onDragEnd = { showVolumeIndicator = false },
                            onVerticalDrag = { _, dragAmount ->
                                volumeLevel = (volumeLevel - dragAmount / 500f).coerceIn(0f, 1f)
                            }
                        )
                    }
            )
        }
        
        // Brightness indicator
        AnimatedVisibility(
            visible = showBrightnessIndicator,
            modifier = Modifier
                .align(Alignment.CenterStart)
                .padding(start = MediaSpacing.XL)
        ) {
            VerticalIndicator(
                icon = Icons.Default.LightMode,
                level = brightnessLevel
            )
        }
        
        // Volume indicator
        AnimatedVisibility(
            visible = showVolumeIndicator,
            modifier = Modifier
                .align(Alignment.CenterEnd)
                .padding(end = MediaSpacing.XL)
        ) {
            VerticalIndicator(
                icon = if (volumeLevel > 0) Icons.Default.VolumeUp else Icons.Default.VolumeOff,
                level = volumeLevel
            )
        }
        
        // Skip intro button
        AnimatedVisibility(
            visible = state.showSkipIntro,
            enter = fadeIn() + slideInHorizontally(initialOffsetX = { it }),
            exit = fadeOut() + slideOutHorizontally(targetOffsetX = { it }),
            modifier = Modifier
                .align(Alignment.BottomEnd)
                .padding(MediaSpacing.XL)
                .padding(bottom = 80.dp)
        ) {
            Button(
                onClick = onSkipIntro,
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.BackgroundElevated.copy(alpha = 0.9f),
                    contentColor = MediaColors.TextPrimary
                ),
                shape = RoundedCornerShape(MediaCorners.SM)
            ) {
                Text(
                    text = "Skip Intro",
                    style = MediaTypography.LabelLarge,
                    fontWeight = FontWeight.SemiBold
                )
                Spacer(modifier = Modifier.width(MediaSpacing.XS))
                Icon(
                    imageVector = Icons.Default.SkipNext,
                    contentDescription = "Media image",
                    modifier = Modifier.size(20.dp)
                )
            }
        }
        
        // Controls overlay
        AnimatedVisibility(
            visible = controlsVisible,
            enter = fadeIn(),
            exit = fadeOut()
        ) {
            Box(modifier = Modifier.fillMaxSize()) {
                // Gradient overlays
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(120.dp)
                        .align(Alignment.TopCenter)
                        .background(
                            Brush.verticalGradient(
                                colors = listOf(
                                    Color.Black.copy(alpha = 0.7f),
                                    Color.Transparent
                                )
                            )
                        )
                )
                
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(180.dp)
                        .align(Alignment.BottomCenter)
                        .background(
                            Brush.verticalGradient(
                                colors = listOf(
                                    Color.Transparent,
                                    Color.Black.copy(alpha = 0.8f)
                                )
                            )
                        )
                )
                
                // Top bar
                VideoPlayerTopBar(
                    title = state.title,
                    subtitle = state.subtitle,
                    isCasting = state.isCasting,
                    onClose = onClose,
                    onCast = onCastClick,
                    onPip = onPipClick,
                    onSettings = { showSettings = true },
                    modifier = Modifier.align(Alignment.TopCenter)
                )
                
                // Center playback controls
                CenterControls(
                    isPlaying = state.isPlaying,
                    isBuffering = state.isBuffering,
                    hasNext = state.hasNext,
                    hasPrevious = state.hasPrevious,
                    onPlayPause = onPlayPause,
                    onSkipPrevious = onSkipPrevious,
                    onSkipNext = onSkipNext,
                    onRewind = { onSeekRelative(-10000) },
                    onFastForward = { onSeekRelative(10000) },
                    modifier = Modifier.align(Alignment.Center)
                )
                
                // Bottom bar
                VideoPlayerBottomBar(
                    currentPosition = state.currentPosition,
                    duration = state.duration,
                    bufferedPosition = state.bufferedPosition,
                    chapters = state.chapters,
                    onSeek = onSeek,
                    onSubtitles = { showSubtitles = true },
                    onQuality = { showQuality = true },
                    onEpisodes = if (state.isEpisode) {{ showEpisodes = true }} else null,
                    hasSubtitles = state.subtitleTracks.isNotEmpty(),
                    currentSubtitle = state.currentSubtitle,
                    currentQuality = state.currentQuality,
                    modifier = Modifier.align(Alignment.BottomCenter)
                )
            }
        }
        
        // Seek preview
        seekPreviewPosition?.let { position ->
            SeekPreview(
                position = position,
                thumbnailUrl = state.getSeekPreviewThumbnail(position),
                modifier = Modifier.align(Alignment.Center)
            )
        }
    }
    
    // Subtitles sheet
    if (showSubtitles) {
        ModalBottomSheet(
            onDismissRequest = { showSubtitles = false },
            containerColor = MediaColors.BackgroundElevated
        ) {
            SubtitlesSheet(
                tracks = state.subtitleTracks,
                currentTrack = state.currentSubtitle,
                onSelect = {
                    onSubtitleChange(it)
                    showSubtitles = false
                }
            )
        }
    }
    
    // Quality sheet
    if (showQuality) {
        ModalBottomSheet(
            onDismissRequest = { showQuality = false },
            containerColor = MediaColors.BackgroundElevated
        ) {
            QualitySheet(
                qualities = state.availableQualities,
                currentQuality = state.currentQuality,
                onSelect = {
                    onQualityChange(it)
                    showQuality = false
                }
            )
        }
    }
    
    // Episodes sheet
    if (showEpisodes) {
        ModalBottomSheet(
            onDismissRequest = { showEpisodes = false },
            containerColor = MediaColors.BackgroundElevated
        ) {
            EpisodesSheet(
                episodes = state.episodes,
                currentEpisode = state.currentEpisodeId,
                onSelect = { episode ->
                    // Play episode
                    showEpisodes = false
                }
            )
        }
    }
}

// =============================================================================
// TOP BAR
// =============================================================================


// =============================================================================
// CENTER CONTROLS
// =============================================================================


// =============================================================================
// BOTTOM BAR
// =============================================================================


// =============================================================================
// VERTICAL INDICATOR
// =============================================================================


// =============================================================================
// SEEK PREVIEW
// =============================================================================


// =============================================================================
// SHEETS
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

data class VideoPlayerState(
    val title: String,
    val subtitle: String? = null,
    val thumbnailUrl: String? = null,
    val currentPosition: Long,
    val duration: Long,
    val bufferedPosition: Long,
    val isPlaying: Boolean,
    val isBuffering: Boolean = false,
    val isCasting: Boolean = false,
    val isEpisode: Boolean = false,
    val currentEpisodeId: String? = null,
    val episodes: List<EpisodeInfo> = emptyList(),
    val hasNext: Boolean = false,
    val hasPrevious: Boolean = false,
    val showSkipIntro: Boolean = false,
    val chapters: List<VideoChapter> = emptyList(),
    val subtitleTracks: List<SubtitleTrack> = emptyList(),
    val currentSubtitle: SubtitleTrack? = null,
    val audioTracks: List<AudioTrack> = emptyList(),
    val currentAudioTrack: AudioTrack? = null,
    val availableQualities: List<VideoQuality> = emptyList(),
    val currentQuality: VideoQuality = VideoQuality.AUTO
) {
    fun getSeekPreviewThumbnail(position: Long): String? {
        // In real implementation, this would return a thumbnail URL for the position
        return thumbnailUrl
    }
}

data class SubtitleTrack(
    val id: String,
    val language: String,
    val label: String? = null,
    val url: String
)

data class AudioTrack(
    val id: String,
    val language: String,
    val label: String? = null,
    val codec: String? = null
)

data class VideoQuality(
    val label: String,
    val resolution: Int? = null,
    val bitrate: String? = null
) {
    companion object {
        val AUTO = VideoQuality("Auto")
        val SD = VideoQuality("SD", 480, "1.5 Mbps")
        val HD = VideoQuality("HD", 720, "3 Mbps")
        val FULL_HD = VideoQuality("1080p", 1080, "6 Mbps")
        val UHD = VideoQuality("4K", 2160, "20 Mbps")
    }
}

data class VideoChapter(
    val title: String,
    val startPosition: Long
)

data class EpisodeInfo(
    val id: String,
    val number: Int,
    val title: String,
    val duration: String,
    val thumbnailUrl: String?,
    val mediaPath: String? = null,
    val progress: Float = 0f
)
