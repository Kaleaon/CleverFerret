package com.universalmedialibrary.ui.media.components

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.IntOffset
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch
import kotlin.math.roundToInt

/**
 * Slide-Up Media Control Bar
 * 
 * A draggable media control bar that:
 * - Shows at the bottom as a mini player
 * - Can be dragged up to reveal full controls
 * - Especially useful when reading a book
 * - Supports music, podcasts, audiobooks, ambient sounds
 * 
 * States:
 * - Collapsed: Small bar showing current track
 * - Expanded: Full player with all controls
 * - Hidden: No media playing
 */

enum class MediaBarState {
    HIDDEN,
    COLLAPSED,
    EXPANDED
}

data class SlideUpMediaState(
    val title: String = "",
    val subtitle: String = "",
    val artworkUrl: String? = null,
    val progress: Float = 0f,
    val duration: Long = 0L,
    val currentPosition: Long = 0L,
    val isPlaying: Boolean = false,
    val mediaType: String = "music", // music, podcast, audiobook, ambient
    val playbackSpeed: Float = 1.0f,
    val hasNext: Boolean = false,
    val hasPrevious: Boolean = false,
    val chapters: List<String> = emptyList(),
    val currentChapter: Int = 0
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SlideUpMediaBar(
    state: SlideUpMediaState?,
    onPlayPause: () -> Unit,
    onNext: () -> Unit,
    onPrevious: () -> Unit,
    onSeek: (Float) -> Unit,
    onSpeedChange: (Float) -> Unit,
    onChapterSelect: (Int) -> Unit,
    onExpand: () -> Unit,
    onCollapse: () -> Unit,
    modifier: Modifier = Modifier
) {
    if (state == null) return
    
    var barState by remember { mutableStateOf(MediaBarState.COLLAPSED) }
    val density = LocalDensity.current
    val coroutineScope = rememberCoroutineScope()
    
    val collapsedHeight = 72.dp
    val expandedHeight = 400.dp
    
    val animatedHeight by animateDpAsState(
        targetValue = when (barState) {
            MediaBarState.HIDDEN -> 0.dp
            MediaBarState.COLLAPSED -> collapsedHeight
            MediaBarState.EXPANDED -> expandedHeight
        },
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessLow
        ),
        label = "barHeight"
    )
    
    // Drag state for smooth dragging
    var offsetY by remember { mutableStateOf(0f) }
    val maxDragOffset = with(density) { (expandedHeight - collapsedHeight).toPx() }
    
    Box(
        modifier = modifier
            .fillMaxWidth()
            .height(animatedHeight)
            .pointerInput(Unit) {
                detectVerticalDragGestures(
                    onDragStart = { },
                    onDragEnd = {
                        coroutineScope.launch {
                            // Snap to state based on drag position
                            barState = if (offsetY < -maxDragOffset * 0.3f) {
                                MediaBarState.EXPANDED
                            } else {
                                MediaBarState.COLLAPSED
                            }
                            offsetY = 0f
                        }
                    },
                    onDragCancel = {
                        offsetY = 0f
                    },
                    onVerticalDrag = { change, dragAmount ->
                        change.consume()
                        offsetY = (offsetY + dragAmount).coerceIn(-maxDragOffset, 0f)
                    }
                )
            }
    ) {
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = MediaColors.BackgroundElevated,
            shape = RoundedCornerShape(topStart = MediaCorners.LG, topEnd = MediaCorners.LG),
            tonalElevation = MediaElevation.LG
        ) {
            Column(modifier = Modifier.fillMaxSize()) {
                // Drag handle
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = MediaSpacing.SM),
                    contentAlignment = Alignment.Center
                ) {
                    Surface(
                        modifier = Modifier
                            .width(40.dp)
                            .height(4.dp),
                        shape = RoundedCornerShape(MediaCorners.Full),
                        color = MediaColors.TextTertiary
                    ) {}
                }
                
                // Progress bar (always visible at top)
                LinearProgressIndicator(
                    progress = { state.progress },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(2.dp),
                    color = MediaColors.AccentPrimary,
                    trackColor = MediaColors.ProgressBackground
                )
                
                when (barState) {
                    MediaBarState.COLLAPSED -> CollapsedContent(
                        state = state,
                        onPlayPause = onPlayPause,
                        onTap = {
                            barState = MediaBarState.EXPANDED
                            onExpand()
                        }
                    )
                    MediaBarState.EXPANDED -> ExpandedContent(
                        state = state,
                        onPlayPause = onPlayPause,
                        onNext = onNext,
                        onPrevious = onPrevious,
                        onSeek = onSeek,
                        onSpeedChange = onSpeedChange,
                        onChapterSelect = onChapterSelect,
                        onCollapse = {
                            barState = MediaBarState.COLLAPSED
                            onCollapse()
                        }
                    )
                    MediaBarState.HIDDEN -> { }
                }
            }
        }
    }
}

@Composable
private fun CollapsedContent(
    state: SlideUpMediaState,
    onPlayPause: () -> Unit,
    onTap: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onTap)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Artwork
        Surface(
            modifier = Modifier
                .size(48.dp)
                .clip(RoundedCornerShape(MediaCorners.XS)),
            color = MediaColors.BackgroundSurface
        ) {
            if (state.artworkUrl != null) {
                AsyncImage(
                    model = state.artworkUrl,
                    contentDescription = "${state.title} artwork",
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Icon(
                    imageVector = when (state.mediaType) {
                        "music" -> Icons.Default.MusicNote
                        "podcast" -> Icons.Default.Podcasts
                        "audiobook" -> Icons.Default.Headphones
                        "ambient" -> Icons.Default.Spa
                        else -> Icons.Default.PlayArrow
                    },
                    contentDescription = "Media type: ${state.mediaType}",
                    tint = MediaColors.AccentPrimary,
                    modifier = Modifier.padding(MediaSpacing.SM)
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        // Title & subtitle
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = state.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            Text(
                text = state.subtitle,
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
        
        // Play/Pause
        IconButton(onClick = onPlayPause) {
            Surface(
                shape = CircleShape,
                color = MediaColors.AccentPrimary,
                modifier = Modifier.size(40.dp)
            ) {
                Icon(
                    imageVector = if (state.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    contentDescription = if (state.isPlaying) "Pause ${state.title}" else "Play ${state.title}",
                    tint = Color.Black,
                    modifier = Modifier.padding(8.dp)
                )
            }
        }
        
        // Expand hint
        Icon(
            imageVector = Icons.Default.KeyboardArrowUp,
            contentDescription = "Expand player",
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(20.dp)
        )
    }
}

@Composable
private fun ExpandedContent(
    state: SlideUpMediaState,
    onPlayPause: () -> Unit,
    onNext: () -> Unit,
    onPrevious: () -> Unit,
    onSeek: (Float) -> Unit,
    onSpeedChange: (Float) -> Unit,
    onChapterSelect: (Int) -> Unit,
    onCollapse: () -> Unit
) {
    var showSpeedPicker by remember { mutableStateOf(false) }
    var showChapters by remember { mutableStateOf(false) }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.MD),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Collapse button
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            IconButton(onClick = onCollapse) {
                Icon(
                    imageVector = Icons.Default.KeyboardArrowDown,
                    contentDescription = "Collapse",
                    tint = MediaColors.TextSecondary
                )
            }
            
            Text(
                text = state.mediaType.replaceFirstChar { it.uppercase() },
                style = MediaTypography.LabelMedium,
                color = MediaColors.TextTertiary
            )
            
            IconButton(onClick = { /* More options */ }) {
                Icon(
                    imageVector = Icons.Default.MoreVert,
                    contentDescription = "More",
                    tint = MediaColors.TextSecondary
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        // Large artwork
        Surface(
            modifier = Modifier
                .size(180.dp)
                .clip(RoundedCornerShape(MediaCorners.MD)),
            color = MediaColors.BackgroundSurface
        ) {
            if (state.artworkUrl != null) {
                AsyncImage(
                    model = state.artworkUrl,
                    contentDescription = "${state.title} album artwork",
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Icon(
                    imageVector = when (state.mediaType) {
                        "music" -> Icons.Default.MusicNote
                        "podcast" -> Icons.Default.Podcasts
                        "audiobook" -> Icons.Default.Headphones
                        "ambient" -> Icons.Default.Spa
                        else -> Icons.Default.PlayArrow
                    },
                    contentDescription = "Media type: ${state.mediaType}",
                    tint = MediaColors.AccentPrimary,
                    modifier = Modifier.padding(MediaSpacing.XL)
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Title & subtitle
        Text(
            text = state.title,
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis,
            fontWeight = FontWeight.SemiBold
        )
        
        Text(
            text = state.subtitle,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Progress slider
        Column(modifier = Modifier.fillMaxWidth()) {
            Slider(
                value = state.progress,
                onValueChange = onSeek,
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
                    color = MediaColors.TextTertiary
                )
                Text(
                    text = formatTime(state.duration),
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        // Main controls
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Skip back / Previous
            IconButton(
                onClick = onPrevious,
                enabled = state.hasPrevious || state.mediaType in listOf("podcast", "audiobook")
            ) {
                Icon(
                    imageVector = if (state.mediaType in listOf("podcast", "audiobook"))
                        Icons.Default.Replay30
                    else
                        Icons.Default.SkipPrevious,
                    contentDescription = "Previous",
                    tint = MediaColors.TextSecondary,
                    modifier = Modifier.size(32.dp)
                )
            }
            
            // Play/Pause (large)
            IconButton(
                onClick = onPlayPause,
                modifier = Modifier.size(64.dp)
            ) {
                Surface(
                    shape = CircleShape,
                    color = MediaColors.AccentPrimary,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Icon(
                        imageVector = if (state.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = if (state.isPlaying) "Pause" else "Play",
                        tint = Color.Black,
                        modifier = Modifier.padding(MediaSpacing.MD)
                    )
                }
            }
            
            // Skip forward / Next
            IconButton(
                onClick = onNext,
                enabled = state.hasNext || state.mediaType in listOf("podcast", "audiobook")
            ) {
                Icon(
                    imageVector = if (state.mediaType in listOf("podcast", "audiobook"))
                        Icons.Default.Forward30
                    else
                        Icons.Default.SkipNext,
                    contentDescription = "Next",
                    tint = MediaColors.TextSecondary,
                    modifier = Modifier.size(32.dp)
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        // Secondary controls
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            // Speed control (for podcasts/audiobooks)
            if (state.mediaType in listOf("podcast", "audiobook")) {
                TextButton(onClick = { showSpeedPicker = true }) {
                    Text(
                        text = "${state.playbackSpeed}x",
                        color = MediaColors.TextSecondary
                    )
                }
            }
            
            // Chapters (for audiobooks/podcasts with chapters)
            if (state.chapters.isNotEmpty()) {
                TextButton(onClick = { showChapters = true }) {
                    Icon(
                        imageVector = Icons.Default.List,
                        contentDescription = "Chapters",
                        tint = MediaColors.TextSecondary
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                    Text(
                        text = "Ch ${state.currentChapter + 1}/${state.chapters.size}",
                        color = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
    
    // Speed picker dialog
    if (showSpeedPicker) {
        SpeedPickerDialog(
            currentSpeed = state.playbackSpeed,
            onSpeedSelect = {
                onSpeedChange(it)
                showSpeedPicker = false
            },
            onDismiss = { showSpeedPicker = false }
        )
    }
}

@Composable
private fun SpeedPickerDialog(
    currentSpeed: Float,
    onSpeedSelect: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    val speeds = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 1.75f, 2.0f, 2.5f, 3.0f)
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Playback Speed", color = MediaColors.TextPrimary) },
        text = {
            Column {
                speeds.forEach { speed ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSpeedSelect(speed) }
                            .padding(MediaSpacing.MD),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = currentSpeed == speed,
                            onClick = { onSpeedSelect(speed) },
                            colors = RadioButtonDefaults.colors(
                                selectedColor = MediaColors.AccentPrimary
                            )
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.MD))
                        Text(
                            text = "${speed}x",
                            color = if (currentSpeed == speed)
                                MediaColors.AccentPrimary
                            else
                                MediaColors.TextPrimary
                        )
                    }
                }
            }
        },
        confirmButton = {},
        containerColor = MediaColors.BackgroundElevated
    )
}

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
