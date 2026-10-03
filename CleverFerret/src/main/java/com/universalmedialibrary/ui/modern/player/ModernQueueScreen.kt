// ModernQueueScreen — current queue, with now-playing pinned at the top,
// "Up next" list, and "Recently played" footer.
// Drag-reorder is intentionally NOT included here — wire it up via the
// existing reorderable library at the call site by overlaying drag handles
// on the rows; this screen exposes onReorder(from, to) for that path.

package com.universalmedialibrary.ui.modern.player

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class UiQueueItem(
    val id: String,
    val title: String,
    val subtitle: String,
    val durationLabel: String,
    val hue: Color,
)

data class ModernQueueUiState(
    val nowPlaying: UiQueueItem?,
    val upNext: List<UiQueueItem> = emptyList(),
    val recent: List<UiQueueItem> = emptyList(),
    val shuffled: Boolean = false,
    val repeatMode: RepeatMode = RepeatMode.Off,
)

enum class RepeatMode { Off, All, One }

@Composable
fun ModernQueueScreen(
    state: ModernQueueUiState,
    onBack: () -> Unit,
    onClear: () -> Unit,
    onShuffleToggle: () -> Unit,
    onRepeatToggle: () -> Unit,
    onPlay: (UiQueueItem) -> Unit,
    onRemove: (UiQueueItem) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Queue",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onShuffleToggle) {
                        Icon(
                            Icons.Default.Shuffle,
                            contentDescription = "Shuffle",
                            tint = if (state.shuffled) cs.primary else cs.onSurface,
                        )
                    }
                    IconButton(onClick = onRepeatToggle) {
                        val icon = when (state.repeatMode) {
                            RepeatMode.Off -> Icons.Default.Repeat
                            RepeatMode.All -> Icons.Default.Repeat
                            RepeatMode.One -> Icons.Default.RepeatOne
                        }
                        Icon(
                            icon,
                            contentDescription = "Repeat",
                            tint = if (state.repeatMode != RepeatMode.Off) cs.primary else cs.onSurface,
                        )
                    }
                    IconButton(onClick = onClear) { Icon(Icons.Default.ClearAll, contentDescription = "Clear queue") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.nowPlaying == null && state.upNext.isEmpty() && state.recent.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.QueueMusic,
                    title = "Nothing in the queue",
                    body = "Play something to get this party started.",
                )
            }
            return@Scaffold
        }

        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            state.nowPlaying?.let { np ->
                item {
                    CFSectionHeader("Now playing", modifier = Modifier.padding(horizontal = CFSpacing.lg))
                    Spacer(Modifier.height(CFSpacing.sm))
                    NowPlayingRow(np)
                }
            }
            if (state.upNext.isNotEmpty()) {
                item { CFSectionHeader("Up next", "${state.upNext.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.upNext) { item ->
                    QueueRow(item, leadingIcon = Icons.Default.DragHandle, onPlay = { onPlay(item) }, onRemove = { onRemove(item) })
                }
            }
            if (state.recent.isNotEmpty()) {
                item { CFSectionHeader("Recently played", "${state.recent.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.recent) { item ->
                    QueueRow(item, leadingIcon = Icons.Default.History, onPlay = { onPlay(item) }, onRemove = { onRemove(item) })
                }
            }
        }
    }
}

@Composable
private fun NowPlayingRow(item: UiQueueItem) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(14.dp))
            .background(Brush.linearGradient(listOf(cs.surfaceVariant, cs.surface)))
            .border(1.dp, cs.outline.copy(alpha = 0.4f), RoundedCornerShape(14.dp))
            .padding(CFSpacing.md),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(8.dp))
                .background(Brush.linearGradient(listOf(item.hue, item.hue.copy(alpha = 0.5f)))),
        )
        Column(Modifier.weight(1f)) {
            Text(
                "PLAYING",
                style = MaterialTheme.typography.labelSmall,
                color = cs.primary,
                fontWeight = FontWeight.Black,
            )
            Text(item.title, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(item.subtitle, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1)
        }
        Box(
            Modifier
                .size(40.dp)
                .clip(CircleShape)
                .background(tokens.metal.brush()),
            contentAlignment = Alignment.Center,
        ) {
            Icon(Icons.Default.GraphicEq, contentDescription = null, tint = cs.onPrimary)
        }
    }
}

@Composable
private fun QueueRow(
    item: UiQueueItem,
    leadingIcon: androidx.compose.ui.graphics.vector.ImageVector,
    onPlay: () -> Unit,
    onRemove: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(10.dp))
            .clickable(onClick = onPlay)
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Icon(leadingIcon, contentDescription = null, tint = cs.onSurfaceVariant)
        Box(
            Modifier
                .size(40.dp)
                .clip(RoundedCornerShape(6.dp))
                .background(Brush.linearGradient(listOf(item.hue, item.hue.copy(alpha = 0.5f)))),
        )
        Column(Modifier.weight(1f)) {
            Text(item.title, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
            Text(item.subtitle, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1)
        }
        Text(item.durationLabel, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
        IconButton(onClick = onRemove) {
            Icon(Icons.Default.Close, contentDescription = "Remove", tint = cs.onSurfaceVariant)
        }
    }
}
