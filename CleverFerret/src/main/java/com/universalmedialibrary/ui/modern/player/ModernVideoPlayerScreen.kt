// ModernVideoPlayerScreen — full-screen video chrome.
// The actual player surface (ExoPlayer / Media3 PlayerView) is supplied by
// the caller as `videoSurface`. This composable handles the overlay UI:
// gradient scrim, top toolbar (back / title / cast), centre transport,
// bottom progress + controls.

package com.universalmedialibrary.ui.modern.player

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class ModernVideoPlayerUiState(
    val title: String,
    val subtitle: String = "",
    val positionLabel: String,
    val durationLabel: String,
    val progress: Float,
    val isPlaying: Boolean,
    val isCasting: Boolean = false,
    val captionsAvailable: Boolean = false,
    val captionsOn: Boolean = false,
)

@Composable
fun ModernVideoPlayerScreen(
    state: ModernVideoPlayerUiState,
    onBack: () -> Unit,
    onPlayPause: () -> Unit,
    onSeek: (Float) -> Unit,
    onSkipPrev: () -> Unit,
    onSkipNext: () -> Unit,
    onCast: () -> Unit,
    onToggleCaptions: () -> Unit,
    onMore: () -> Unit,
    videoSurface: @Composable BoxScope.() -> Unit,
) {
    var controlsVisible by remember { mutableStateOf(true) }
    val interaction = remember { MutableInteractionSource() }

    Box(
        Modifier
            .fillMaxSize()
            .background(Color.Black)
            .clickable(interactionSource = interaction, indication = null) {
                controlsVisible = !controlsVisible
            },
    ) {
        videoSurface()

        // Top + bottom scrim only when controls are showing.
        AnimatedVisibility(visible = controlsVisible, enter = fadeIn(), exit = fadeOut()) {
            Box(
                Modifier
                    .fillMaxSize()
                    .background(
                        Brush.verticalGradient(
                            0f to Color.Black.copy(alpha = 0.55f),
                            0.25f to Color.Transparent,
                            0.75f to Color.Transparent,
                            1f to Color.Black.copy(alpha = 0.65f),
                        )
                    ),
            )
        }

        AnimatedVisibility(visible = controlsVisible, enter = fadeIn(), exit = fadeOut()) {
            Column(Modifier.fillMaxSize()) {
                TopOverlay(
                    title = state.title,
                    subtitle = state.subtitle,
                    isCasting = state.isCasting,
                    captionsOn = state.captionsOn,
                    captionsAvailable = state.captionsAvailable,
                    onBack = onBack,
                    onCast = onCast,
                    onToggleCaptions = onToggleCaptions,
                    onMore = onMore,
                )
                Spacer(Modifier.weight(1f))
                CenterTransport(
                    isPlaying = state.isPlaying,
                    onSkipPrev = onSkipPrev,
                    onPlayPause = onPlayPause,
                    onSkipNext = onSkipNext,
                )
                Spacer(Modifier.weight(1f))
                BottomOverlay(state = state, onSeek = onSeek)
            }
        }
    }
}

@Composable
private fun TopOverlay(
    title: String,
    subtitle: String,
    isCasting: Boolean,
    captionsOn: Boolean,
    captionsAvailable: Boolean,
    onBack: () -> Unit,
    onCast: () -> Unit,
    onToggleCaptions: () -> Unit,
    onMore: () -> Unit,
) {
    Row(
        Modifier
            .fillMaxWidth()
            .padding(CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
    ) {
        IconButton(onClick = onBack) {
            Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back", tint = Color.White)
        }
        Column(Modifier.weight(1f)) {
            Text(
                title,
                style = MaterialTheme.typography.titleMedium,
                color = Color.White,
                fontWeight = FontWeight.Black,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            if (subtitle.isNotBlank()) {
                Text(
                    subtitle,
                    style = MaterialTheme.typography.labelMedium,
                    color = Color.White.copy(alpha = 0.7f),
                    maxLines = 1,
                )
            }
        }
        if (captionsAvailable) {
            IconButton(onClick = onToggleCaptions) {
                Icon(
                    if (captionsOn) Icons.Default.ClosedCaption else Icons.Default.ClosedCaptionDisabled,
                    contentDescription = "Captions",
                    tint = Color.White,
                )
            }
        }
        IconButton(onClick = onCast) {
            Icon(
                if (isCasting) Icons.Default.CastConnected else Icons.Default.Cast,
                contentDescription = "Cast",
                tint = Color.White,
            )
        }
        IconButton(onClick = onMore) {
            Icon(Icons.Default.MoreVert, contentDescription = "More", tint = Color.White)
        }
    }
}

@Composable
private fun CenterTransport(
    isPlaying: Boolean,
    onSkipPrev: () -> Unit,
    onPlayPause: () -> Unit,
    onSkipNext: () -> Unit,
) {
    val tokens = LocalCFTokens.current
    Row(
        Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly,
        verticalAlignment = Alignment.CenterVertically,
    ) {
        IconButton(onClick = onSkipPrev) {
            Icon(Icons.Default.SkipPrevious, contentDescription = "Previous", tint = Color.White)
        }
        Box(
            Modifier
                .size(80.dp)
                .clip(CircleShape)
                .background(tokens.metal.brush()),
            contentAlignment = Alignment.Center,
        ) {
            IconButton(onClick = onPlayPause) {
                Icon(
                    if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    contentDescription = if (isPlaying) "Pause" else "Play",
                    tint = Color.Black,
                )
            }
        }
        IconButton(onClick = onSkipNext) {
            Icon(Icons.Default.SkipNext, contentDescription = "Next", tint = Color.White)
        }
    }
}

@Composable
private fun BottomOverlay(state: ModernVideoPlayerUiState, onSeek: (Float) -> Unit) {
    Column(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
    ) {
        Slider(
            value = state.progress.coerceIn(0f, 1f),
            onValueChange = onSeek,
            colors = SliderDefaults.colors(
                thumbColor = Color.White,
                activeTrackColor = MaterialTheme.colorScheme.primary,
                inactiveTrackColor = Color.White.copy(alpha = 0.3f),
            ),
        )
        Row(Modifier.fillMaxWidth()) {
            Text(state.positionLabel, style = MaterialTheme.typography.labelMedium, color = Color.White)
            Spacer(Modifier.weight(1f))
            Text(state.durationLabel, style = MaterialTheme.typography.labelMedium, color = Color.White)
        }
    }
}
