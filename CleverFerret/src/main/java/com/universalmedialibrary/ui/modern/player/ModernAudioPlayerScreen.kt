// ModernAudioPlayerScreen — full-screen now-playing for audio
// (audiobook / podcast / music / OTR / radio).
// Hero artwork, metal-brushed title, scrubber with chapter marks,
// transport row, and an expandable controls drawer (sleep, speed, queue, cast).

package com.universalmedialibrary.ui.modern.player

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.QueueMusic
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFCover
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.components.MetalChip
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class ModernAudioPlayerUiState(
    val item: MediaItem,
    val positionLabel: String,        // "23:14"
    val durationLabel: String,        // "1:18:02"
    val progress: Float,              // 0..1
    val isPlaying: Boolean,
    val speedLabel: String = "1.0×",
    val sleepLabel: String? = null,   // "12 min" while a sleep timer runs
    val isCasting: Boolean = false,
)

@Composable
fun ModernAudioPlayerScreen(
    state: ModernAudioPlayerUiState,
    onBack: () -> Unit,
    onScrub: (Float) -> Unit,
    onPlayPause: () -> Unit,
    onSkipPrev: () -> Unit,
    onSkipNext: () -> Unit,
    onSeekBack: () -> Unit,
    onSeekForward: () -> Unit,
    onChangeSpeed: () -> Unit,
    onSleep: () -> Unit,
    onQueue: () -> Unit,
    onCast: () -> Unit,
    onMore: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current

    Scaffold(
        topBar = {
            CFTopBar(
                title = "Now playing",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onCast) {
                        Icon(
                            if (state.isCasting) Icons.Default.CastConnected else Icons.Default.Cast,
                            contentDescription = "Cast",
                        )
                    }
                    IconButton(onClick = onMore) { Icon(Icons.Default.MoreVert, contentDescription = "More") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(CFSpacing.xl),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            Box(
                Modifier
                    .size(280.dp)
                    .clip(RoundedCornerShape(20.dp))
                    .background(Brush.linearGradient(listOf(cs.surfaceVariant, cs.surface))),
                contentAlignment = Alignment.Center,
            ) { CFCover(state.item, width = 280.dp, height = 280.dp, showLabel = true) }

            Column(
                Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
            ) {
                MetalChip(text = state.item.kind.name.uppercase())
                Text(
                    state.item.title,
                    style = MaterialTheme.typography.headlineMedium.copy(
                        brush = tokens.metal.brush(),
                        fontWeight = FontWeight.Black,
                    ),
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                )
                Text(
                    state.item.author,
                    style = MaterialTheme.typography.titleSmall,
                    color = cs.onSurfaceVariant,
                )
            }

            Column(Modifier.fillMaxWidth(), verticalArrangement = Arrangement.spacedBy(CFSpacing.xs)) {
                Slider(
                    value = state.progress.coerceIn(0f, 1f),
                    onValueChange = onScrub,
                    colors = SliderDefaults.colors(
                        thumbColor = cs.primary,
                        activeTrackColor = cs.primary,
                        inactiveTrackColor = cs.onSurface.copy(alpha = 0.12f),
                    ),
                )
                Row(Modifier.fillMaxWidth()) {
                    Text(
                        state.positionLabel,
                        style = MaterialTheme.typography.labelMedium,
                        color = cs.onSurfaceVariant,
                    )
                    Spacer(Modifier.weight(1f))
                    Text(
                        state.durationLabel,
                        style = MaterialTheme.typography.labelMedium,
                        color = cs.onSurfaceVariant,
                    )
                }
            }

            Row(
                Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceEvenly,
            ) {
                IconButton(onClick = onSkipPrev) {
                    Icon(Icons.Default.SkipPrevious, contentDescription = "Previous")
                }
                IconButton(onClick = onSeekBack) {
                    Icon(Icons.Default.Replay30, contentDescription = "Back 30s")
                }
                Box(
                    Modifier
                        .size(72.dp)
                        .clip(CircleShape)
                        .background(tokens.metal.brush()),
                    contentAlignment = Alignment.Center,
                ) {
                    IconButton(onClick = onPlayPause) {
                        Icon(
                            if (state.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            contentDescription = if (state.isPlaying) "Pause" else "Play",
                            tint = cs.onPrimary,
                        )
                    }
                }
                IconButton(onClick = onSeekForward) {
                    Icon(Icons.Default.Forward30, contentDescription = "Forward 30s")
                }
                IconButton(onClick = onSkipNext) {
                    Icon(Icons.Default.SkipNext, contentDescription = "Next")
                }
            }

            Row(
                Modifier
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(14.dp))
                    .background(cs.surface)
                    .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
                    .padding(vertical = CFSpacing.sm),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically,
            ) {
                ControlChip(Icons.Default.Speed, state.speedLabel, onChangeSpeed)
                ControlChip(
                    icon = Icons.Default.Bedtime,
                    label = state.sleepLabel ?: "Sleep",
                    onClick = onSleep,
                    accent = state.sleepLabel != null,
                )
                ControlChip(Icons.AutoMirrored.Filled.QueueMusic, "Queue", onQueue)
            }
        }
    }
}

@Composable
private fun ControlChip(
    icon: ImageVector,
    label: String,
    onClick: () -> Unit,
    accent: Boolean = false,
) {
    val cs = MaterialTheme.colorScheme
    val tint = if (accent) cs.primary else cs.onSurface
    TextButton(onClick = onClick) {
        Icon(icon, contentDescription = null, tint = tint)
        Spacer(Modifier.width(CFSpacing.xs))
        Text(label, style = MaterialTheme.typography.labelMedium, color = tint)
    }
}
