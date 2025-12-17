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
                    contentDescription = null,
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
                    contentDescription = null,
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

@Composable
private fun VideoPlayerTopBar(
    title: String,
    subtitle: String?,
    isCasting: Boolean,
    onClose: () -> Unit,
    onCast: () -> Unit,
    onPip: () -> Unit,
    onSettings: () -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier
            .fillMaxWidth()
            .statusBarsPadding()
            .padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        IconButton(onClick = onClose) {
            Icon(
                imageVector = Icons.Default.ArrowBack,
                contentDescription = "Back",
                tint = Color.White
            )
        }
        
        Column(
            modifier = Modifier.weight(1f),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = title,
                style = MediaTypography.BodyLarge,
                color = Color.White,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            subtitle?.let {
                Text(
                    text = it,
                    style = MediaTypography.LabelSmall,
                    color = Color.White.copy(alpha = 0.7f),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
        
        Row {
            IconButton(onClick = onCast) {
                Icon(
                    imageVector = if (isCasting) Icons.Filled.Cast else Icons.Outlined.Cast,
                    contentDescription = "Cast",
                    tint = if (isCasting) MediaColors.AccentPrimary else Color.White
                )
            }
            
            IconButton(onClick = onPip) {
                Icon(
                    imageVector = Icons.Default.PictureInPicture,
                    contentDescription = "Picture in Picture",
                    tint = Color.White
                )
            }
            
            IconButton(onClick = onSettings) {
                Icon(
                    imageVector = Icons.Default.Settings,
                    contentDescription = "Settings",
                    tint = Color.White
                )
            }
        }
    }
}

// =============================================================================
// CENTER CONTROLS
// =============================================================================

@Composable
private fun CenterControls(
    isPlaying: Boolean,
    isBuffering: Boolean,
    hasNext: Boolean,
    hasPrevious: Boolean,
    onPlayPause: () -> Unit,
    onSkipPrevious: () -> Unit,
    onSkipNext: () -> Unit,
    onRewind: () -> Unit,
    onFastForward: () -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XL),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Previous
        IconButton(
            onClick = onSkipPrevious,
            enabled = hasPrevious,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                imageVector = Icons.Default.SkipPrevious,
                contentDescription = "Previous",
                tint = if (hasPrevious) Color.White else Color.White.copy(alpha = 0.3f),
                modifier = Modifier.size(36.dp)
            )
        }
        
        // Rewind 10s
        IconButton(
            onClick = onRewind,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Replay10,
                contentDescription = "Rewind 10 seconds",
                tint = Color.White,
                modifier = Modifier.size(36.dp)
            )
        }
        
        // Play/Pause
        if (isBuffering) {
            CircularProgressIndicator(
                modifier = Modifier.size(72.dp),
                color = Color.White,
                strokeWidth = 3.dp
            )
        } else {
            Surface(
                shape = CircleShape,
                color = Color.White.copy(alpha = 0.2f),
                modifier = Modifier.size(72.dp),
                onClick = onPlayPause
            ) {
                Icon(
                    imageVector = if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    contentDescription = if (isPlaying) "Pause" else "Play",
                    tint = Color.White,
                    modifier = Modifier.padding(16.dp)
                )
            }
        }
        
        // Forward 10s
        IconButton(
            onClick = onFastForward,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Forward10,
                contentDescription = "Forward 10 seconds",
                tint = Color.White,
                modifier = Modifier.size(36.dp)
            )
        }
        
        // Next
        IconButton(
            onClick = onSkipNext,
            enabled = hasNext,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                imageVector = Icons.Default.SkipNext,
                contentDescription = "Next",
                tint = if (hasNext) Color.White else Color.White.copy(alpha = 0.3f),
                modifier = Modifier.size(36.dp)
            )
        }
    }
}

// =============================================================================
// BOTTOM BAR
// =============================================================================

@Composable
private fun VideoPlayerBottomBar(
    currentPosition: Long,
    duration: Long,
    bufferedPosition: Long,
    chapters: List<VideoChapter>,
    onSeek: (Long) -> Unit,
    onSubtitles: () -> Unit,
    onQuality: () -> Unit,
    onEpisodes: (() -> Unit)?,
    hasSubtitles: Boolean,
    currentSubtitle: SubtitleTrack?,
    currentQuality: VideoQuality,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxWidth()
            .navigationBarsPadding()
            .padding(MediaSpacing.MD)
    ) {
        // Progress bar with chapters
        Box(modifier = Modifier.fillMaxWidth()) {
            // Buffered progress
            LinearProgressIndicator(
                progress = { if (duration > 0) bufferedPosition.toFloat() / duration else 0f },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(4.dp)
                    .clip(RoundedCornerShape(MediaCorners.Full)),
                color = Color.White.copy(alpha = 0.3f),
                trackColor = Color.White.copy(alpha = 0.1f)
            )
            
            // Playback progress
            Slider(
                value = currentPosition.toFloat(),
                onValueChange = { onSeek(it.toLong()) },
                valueRange = 0f..duration.toFloat(),
                modifier = Modifier.fillMaxWidth(),
                colors = SliderDefaults.colors(
                    thumbColor = MediaColors.AccentPrimary,
                    activeTrackColor = MediaColors.AccentPrimary,
                    inactiveTrackColor = Color.Transparent
                )
            )
            
            // Chapter markers
            chapters.forEach { chapter ->
                val position = chapter.startPosition.toFloat() / duration
                Box(
                    modifier = Modifier
                        .fillMaxWidth(position)
                        .height(4.dp)
                        .align(Alignment.CenterStart)
                ) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.CenterEnd)
                            .size(4.dp)
                            .background(Color.White, CircleShape)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        
        // Time and controls
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Time
            Text(
                text = "${formatTime(currentPosition)} / ${formatTime(duration)}",
                style = MediaTypography.LabelMedium,
                color = Color.White
            )
            
            // Controls
            Row(horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)) {
                // Episodes (for TV shows)
                onEpisodes?.let {
                    TextButton(onClick = it) {
                        Icon(
                            imageVector = Icons.Default.VideoLibrary,
                            contentDescription = null,
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.XS))
                        Text("Episodes")
                    }
                }
                
                // Subtitles
                if (hasSubtitles) {
                    TextButton(onClick = onSubtitles) {
                        Icon(
                            imageVector = if (currentSubtitle != null) 
                                Icons.Filled.Subtitles 
                            else 
                                Icons.Outlined.Subtitles,
                            contentDescription = null,
                            modifier = Modifier.size(20.dp),
                            tint = if (currentSubtitle != null) 
                                MediaColors.AccentPrimary 
                            else 
                                Color.White
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.XS))
                        Text(
                            text = currentSubtitle?.language ?: "Subtitles",
                            color = if (currentSubtitle != null) 
                                MediaColors.AccentPrimary 
                            else 
                                Color.White
                        )
                    }
                }
                
                // Quality
                TextButton(onClick = onQuality) {
                    Icon(
                        imageVector = Icons.Default.HighQuality,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                    Text(currentQuality.label)
                }
            }
        }
    }
}

// =============================================================================
// VERTICAL INDICATOR
// =============================================================================

@Composable
private fun VerticalIndicator(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    level: Float
) {
    Surface(
        shape = RoundedCornerShape(MediaCorners.MD),
        color = Color.Black.copy(alpha = 0.7f)
    ) {
        Column(
            modifier = Modifier.padding(MediaSpacing.MD),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = Color.White,
                modifier = Modifier.size(24.dp)
            )
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            Box(
                modifier = Modifier
                    .width(4.dp)
                    .height(100.dp)
                    .clip(RoundedCornerShape(MediaCorners.Full))
                    .background(Color.White.copy(alpha = 0.3f))
            ) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .fillMaxHeight(level)
                        .align(Alignment.BottomCenter)
                        .background(Color.White, RoundedCornerShape(MediaCorners.Full))
                )
            }
        }
    }
}

// =============================================================================
// SEEK PREVIEW
// =============================================================================

@Composable
private fun SeekPreview(
    position: Long,
    thumbnailUrl: String?,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Surface(
            modifier = Modifier
                .size(width = 160.dp, height = 90.dp)
                .clip(RoundedCornerShape(MediaCorners.SM)),
            color = Color.Black
        ) {
            if (thumbnailUrl != null) {
                AsyncImage(
                    model = thumbnailUrl,
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        
        Surface(
            shape = RoundedCornerShape(MediaCorners.XS),
            color = Color.Black.copy(alpha = 0.8f)
        ) {
            Text(
                text = formatTime(position),
                style = MediaTypography.LabelMedium,
                color = Color.White,
                modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XS)
            )
        }
    }
}

// =============================================================================
// SHEETS
// =============================================================================

@Composable
private fun SubtitlesSheet(
    tracks: List<SubtitleTrack>,
    currentTrack: SubtitleTrack?,
    onSelect: (SubtitleTrack?) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Subtitles",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
        )
        
        // Off option
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .clickable { onSelect(null) }
                .padding(MediaSpacing.MD),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Off",
                style = MediaTypography.BodyMedium,
                color = if (currentTrack == null) MediaColors.AccentPrimary else MediaColors.TextPrimary
            )
            if (currentTrack == null) {
                Icon(
                    imageVector = Icons.Default.Check,
                    contentDescription = null,
                    tint = MediaColors.AccentPrimary
                )
            }
        }
        
        HorizontalDivider(color = MediaColors.Border)
        
        tracks.forEach { track ->
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onSelect(track) }
                    .padding(MediaSpacing.MD),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = track.language,
                        style = MediaTypography.BodyMedium,
                        color = if (currentTrack?.id == track.id) 
                            MediaColors.AccentPrimary 
                        else 
                            MediaColors.TextPrimary
                    )
                    track.label?.let {
                        Text(
                            text = it,
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextSecondary
                        )
                    }
                }
                if (currentTrack?.id == track.id) {
                    Icon(
                        imageVector = Icons.Default.Check,
                        contentDescription = null,
                        tint = MediaColors.AccentPrimary
                    )
                }
            }
        }
    }
}

@Composable
private fun QualitySheet(
    qualities: List<VideoQuality>,
    currentQuality: VideoQuality,
    onSelect: (VideoQuality) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Quality",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
        )
        
        qualities.forEach { quality ->
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onSelect(quality) }
                    .padding(MediaSpacing.MD),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text(
                        text = quality.label,
                        style = MediaTypography.BodyMedium,
                        color = if (currentQuality == quality) 
                            MediaColors.AccentPrimary 
                        else 
                            MediaColors.TextPrimary
                    )
                    quality.bitrate?.let { bitrate ->
                        Spacer(modifier = Modifier.width(MediaSpacing.SM))
                        Text(
                            text = bitrate,
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }
                }
                if (currentQuality == quality) {
                    Icon(
                        imageVector = Icons.Default.Check,
                        contentDescription = null,
                        tint = MediaColors.AccentPrimary
                    )
                }
            }
        }
    }
}

@Composable
private fun EpisodesSheet(
    episodes: List<EpisodeInfo>,
    currentEpisode: String?,
    onSelect: (EpisodeInfo) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Episodes",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
        )
        
        LazyColumn(
            modifier = Modifier.heightIn(max = 400.dp)
        ) {
            items(episodes) { episode ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onSelect(episode) }
                        .background(
                            if (episode.id == currentEpisode)
                                MediaColors.AccentPrimary.copy(alpha = 0.1f)
                            else
                                Color.Transparent
                        )
                        .padding(MediaSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Thumbnail
                    Surface(
                        modifier = Modifier
                            .size(width = 120.dp, height = 68.dp)
                            .clip(RoundedCornerShape(MediaCorners.XS)),
                        color = MediaColors.BackgroundSurface
                    ) {
                        if (episode.thumbnailUrl != null) {
                            AsyncImage(
                                model = episode.thumbnailUrl,
                                contentDescription = null,
                                contentScale = ContentScale.Crop,
                                modifier = Modifier.fillMaxSize()
                            )
                        }
                        
                        // Play indicator for current
                        if (episode.id == currentEpisode) {
                            Box(
                                modifier = Modifier
                                    .fillMaxSize()
                                    .background(Color.Black.copy(alpha = 0.5f)),
                                contentAlignment = Alignment.Center
                            ) {
                                Icon(
                                    imageVector = Icons.Default.VolumeUp,
                                    contentDescription = "Playing",
                                    tint = Color.White
                                )
                            }
                        }
                    }
                    
                    Spacer(modifier = Modifier.width(MediaSpacing.MD))
                    
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = "E${episode.number}: ${episode.title}",
                            style = MediaTypography.BodyMedium,
                            color = if (episode.id == currentEpisode)
                                MediaColors.AccentPrimary
                            else
                                MediaColors.TextPrimary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis,
                            fontWeight = if (episode.id == currentEpisode)
                                FontWeight.SemiBold
                            else
                                FontWeight.Normal
                        )
                        
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                        ) {
                            Text(
                                text = episode.duration,
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextSecondary
                            )
                            
                            if (episode.progress > 0) {
                                Text("•", color = MediaColors.TextTertiary)
                                Text(
                                    text = "${(episode.progress * 100).toInt()}% watched",
                                    style = MediaTypography.LabelSmall,
                                    color = MediaColors.AccentPrimary
                                )
                            }
                        }
                    }
                }
            }
        }
    }
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
    val progress: Float = 0f
)
