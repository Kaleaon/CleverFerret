package com.universalmedialibrary.ui.components

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.FilledIconButton
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.Stable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.CornerRadius
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode

/**
 * Bottom Media Controls Bar
 * Shows currently playing media with playback controls
 */
@Composable
fun MediaControlsBar(
    isVisible: Boolean,
    title: String,
    artist: String?,
    isPlaying: Boolean,
    isCasting: Boolean = false,
    castDeviceName: String? = null,
    albumArtUrl: String? = null,
    backgroundMode: MiniPlayerBackgroundMode = MiniPlayerBackgroundMode.THEME,
    onPlayPause: () -> Unit,
    onSkipNext: () -> Unit,
    onSkipPrevious: () -> Unit,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    AnimatedVisibility(
        visible = isVisible,
        enter = slideInVertically(initialOffsetY = { it }) + fadeIn(),
        exit = slideOutVertically(targetOffsetY = { it }) + fadeOut(),
        modifier = modifier
    ) {
        Surface(
            modifier = Modifier
                .fillMaxWidth()
                .height(72.dp),
            color = Color.Transparent,
            tonalElevation = 0.dp,
            shadowElevation = 8.dp
        ) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
            ) {
                MediaControlsBackdrop(
                    mode = backgroundMode,
                    albumArtUrl = albumArtUrl,
                    isPlaying = isPlaying
                )

                val overlayBrush = when (backgroundMode) {
                    MiniPlayerBackgroundMode.THEME -> Brush.verticalGradient(
                        colors = listOf(
                            MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.97f),
                            MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.99f)
                        )
                    )
                    else -> Brush.verticalGradient(
                        colors = listOf(
                            Color.Black.copy(alpha = 0.25f),
                            Color.Black.copy(alpha = 0.55f)
                        )
                    )
                }

                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(overlayBrush)
                )

                Row(
                    modifier = Modifier
                        .fillMaxSize()
                        .clickable(onClick = onClick)
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Thumbnail / artwork preview
                    Box(
                        modifier = Modifier
                            .size(56.dp)
                            .clip(MaterialTheme.shapes.small)
                            .background(MaterialTheme.colorScheme.primaryContainer),
                        contentAlignment = Alignment.Center
                    ) {
                        if (!albumArtUrl.isNullOrBlank()) {
                            AsyncImage(
                                model = albumArtUrl,
                                contentDescription = null,
                                modifier = Modifier.fillMaxSize(),
                                contentScale = ContentScale.Crop
                            )
                        } else {
                            Icon(
                                Icons.Default.MusicNote,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }

                    Spacer(modifier = Modifier.width(12.dp))

                    // Track info
                    Column(
                        modifier = Modifier.weight(1f)
                    ) {
                        Text(
                            text = title,
                            style = MaterialTheme.typography.bodyLarge,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            if (isCasting && castDeviceName != null) {
                                Icon(
                                    Icons.Default.Cast,
                                    contentDescription = null,
                                    modifier = Modifier.size(14.dp),
                                    tint = MaterialTheme.colorScheme.primary
                                )
                                Spacer(modifier = Modifier.width(4.dp))
                                Text(
                                    text = castDeviceName,
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.primary,
                                    maxLines = 1,
                                    overflow = TextOverflow.Ellipsis
                                )
                            } else if (!artist.isNullOrBlank()) {
                                Text(
                                    text = artist,
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                                    maxLines = 1,
                                    overflow = TextOverflow.Ellipsis
                                )
                            }
                        }
                    }

                    Spacer(modifier = Modifier.width(8.dp))

                    // Playback controls
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(4.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(
                            onClick = onSkipPrevious,
                            modifier = Modifier.size(40.dp)
                        ) {
                            Icon(
                                Icons.Default.SkipPrevious,
                                contentDescription = "Previous"
                            )
                        }

                        FilledIconButton(
                            onClick = onPlayPause,
                            modifier = Modifier.size(48.dp)
                        ) {
                            Icon(
                                if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                                contentDescription = if (isPlaying) "Pause" else "Play"
                            )
                        }

                        IconButton(
                            onClick = onSkipNext,
                            modifier = Modifier.size(40.dp)
                        ) {
                            Icon(
                                Icons.Default.SkipNext,
                                contentDescription = "Next"
                            )
                        }
                    }
                }
            }
        }
    }
}

/**
 * State holder for media controls bar
 */
@Stable
class MediaControlsState {
    var isVisible by mutableStateOf(false)
    var title by mutableStateOf("")
    var artist by mutableStateOf<String?>(null)
    var isPlaying by mutableStateOf(false)
    var isCasting by mutableStateOf(false)
    var castDeviceName by mutableStateOf<String?>(null)
    var albumArtUrl by mutableStateOf<String?>(null)
    
    fun show(
        title: String,
        artist: String? = null,
        isPlaying: Boolean = false,
        isCasting: Boolean = false,
        castDeviceName: String? = null,
        albumArtUrl: String? = null
    ) {
        this.title = title
        this.artist = artist
        this.isPlaying = isPlaying
        this.isCasting = isCasting
        this.castDeviceName = castDeviceName
        this.albumArtUrl = albumArtUrl
        this.isVisible = true
    }
    
    fun hide() {
        this.isVisible = false
        this.albumArtUrl = null
    }
    
    fun updatePlaybackState(isPlaying: Boolean) {
        this.isPlaying = isPlaying
    }
}

data class MediaControlActions(
    val onPlayPause: () -> Unit = {},
    val onSkipNext: () -> Unit = {},
    val onSkipPrevious: () -> Unit = {},
    val onOpenPlayer: () -> Unit = {}
)

@Composable
fun rememberMediaControlsState(): MediaControlsState {
    return remember { MediaControlsState() }
}

@Composable
private fun MediaControlsBackdrop(
    mode: MiniPlayerBackgroundMode,
    albumArtUrl: String?,
    isPlaying: Boolean
) {
    when (mode) {
        MiniPlayerBackgroundMode.THEME -> {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(MaterialTheme.colorScheme.surfaceVariant)
            )
        }
        MiniPlayerBackgroundMode.ALBUM_ART_SLIVER -> {
            AlbumArtSliverBackground(albumArtUrl)
        }
        MiniPlayerBackgroundMode.VISUALIZER -> {
            VisualizerBackground(isPlaying)
        }
    }
}

@Composable
private fun AlbumArtSliverBackground(albumArtUrl: String?) {
    if (albumArtUrl.isNullOrBlank()) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(MaterialTheme.colorScheme.surfaceVariant)
        )
        return
    }

    val density = LocalDensity.current
    val maxOffsetPx = remember(density) { with(density) { 64.dp.toPx() } }
    val infiniteTransition = rememberInfiniteTransition(label = "album_art_scroll")
    val offset by infiniteTransition.animateFloat(
        initialValue = -maxOffsetPx,
        targetValue = 0f,
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis = 8000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "album_art_offset"
    )

    AsyncImage(
        model = albumArtUrl,
        contentDescription = null,
        modifier = Modifier
            .fillMaxSize()
            .graphicsLayer {
                translationY = offset
                scaleX = 1.2f
                scaleY = 1.2f
            },
        contentScale = ContentScale.Crop
    )
}

@Composable
private fun VisualizerBackground(isPlaying: Boolean) {
    val barCount = 24
    val infiniteTransition = rememberInfiniteTransition(label = "mini_player_visualizer")
    val barAnimations = remember(infiniteTransition) {
        List(barCount) { index ->
            infiniteTransition.animateFloat(
                initialValue = 0.2f,
                targetValue = 1f,
                animationSpec = infiniteRepeatable(
                    animation = tween(
                        durationMillis = 900 + index * 35,
                        easing = LinearEasing
                    ),
                    repeatMode = RepeatMode.Reverse
                ),
                label = "visualizer_bar_$index"
            )
        }
    }

    Canvas(modifier = Modifier.fillMaxSize()) {
        drawRect(
            color = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.6f)
        )
        val widthPerBar = size.width / (barCount * 1.6f)
        val spacing = widthPerBar * 0.5f
        barAnimations.forEachIndexed { index, anim ->
            val normalized = if (isPlaying) anim.value else 0.3f
            val barHeight = size.height * (0.2f + 0.6f * normalized)
            val x = index * (widthPerBar + spacing)
            drawRoundRect(
                color = MaterialTheme.colorScheme.primary.copy(alpha = 0.35f + 0.25f * normalized),
                topLeft = Offset(x, size.height - barHeight),
                size = Size(widthPerBar, barHeight),
                cornerRadius = CornerRadius(widthPerBar / 2f, widthPerBar / 2f)
            )
        }
    }
}
