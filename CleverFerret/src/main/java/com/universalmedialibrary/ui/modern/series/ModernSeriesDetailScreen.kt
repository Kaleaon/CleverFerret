// ModernSeriesDetailScreen — series view shared by book series, comic
// arcs, manga series, TV series, podcast seasons. Shows series hero,
// completion progress across the run, and an ordered list of entries
// with read / unread / partial state.

package com.universalmedialibrary.ui.modern.series

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFCover
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class ModernSeriesDetailUiState(
    val title: String,
    val author: String,
    val description: String,
    val totalEntries: Int,
    val completedEntries: Int,
    val cover: MediaItem,        // re-uses MediaItem just for the hue / kind
    val entries: List<MediaItem>,
)

@Composable
fun ModernSeriesDetailScreen(
    state: ModernSeriesDetailUiState,
    onBack: () -> Unit,
    onContinue: () -> Unit,
    onMarkAllRead: () -> Unit,
    onOpenEntry: (MediaItem) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Series",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onMarkAllRead) {
                        Icon(Icons.Default.DoneAll, contentDescription = "Mark all read")
                    }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                Column(
                    Modifier
                        .fillMaxWidth()
                        .background(Brush.verticalGradient(listOf(state.cover.coverHue.copy(alpha = 0.45f), cs.background)))
                        .padding(CFSpacing.lg),
                ) {
                    Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.lg)) {
                        CFCover(state.cover, width = 120.dp, height = 180.dp, showLabel = false)
                        Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(CFSpacing.xs)) {
                            Text(
                                "SERIES · ${state.totalEntries} ENTRIES",
                                style = MaterialTheme.typography.labelMedium,
                                color = cs.primary,
                            )
                            Text(
                                state.title,
                                style = MaterialTheme.typography.headlineMedium.copy(
                                    brush = tokens.metal.brush(),
                                    fontWeight = FontWeight.Black,
                                ),
                                maxLines = 3,
                                overflow = TextOverflow.Ellipsis,
                            )
                            Text(state.author, style = MaterialTheme.typography.titleSmall, color = cs.onSurfaceVariant)
                            Spacer(Modifier.height(CFSpacing.xs))
                            val pct = if (state.totalEntries == 0) 0f
                                       else state.completedEntries / state.totalEntries.toFloat()
                            LinearProgressIndicator(
                                progress = { pct },
                                modifier = Modifier.fillMaxWidth().height(3.dp).clip(RoundedCornerShape(2.dp)),
                                color = cs.primary,
                                trackColor = cs.onSurface.copy(alpha = 0.12f),
                            )
                            Text(
                                "${state.completedEntries} of ${state.totalEntries} read",
                                style = MaterialTheme.typography.labelSmall,
                                color = cs.onSurfaceVariant,
                            )
                        }
                    }
                    Spacer(Modifier.height(CFSpacing.md))
                    CFMetalButton(text = "Continue", onClick = onContinue, leadingIcon = Icons.Default.PlayArrow)
                    if (state.description.isNotBlank()) {
                        Spacer(Modifier.height(CFSpacing.md))
                        Text(state.description, style = MaterialTheme.typography.bodyMedium, maxLines = 6, overflow = TextOverflow.Ellipsis)
                    }
                }
            }
            item { CFSectionHeader("Entries", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
            items(state.entries) { entry -> EntryRow(entry, onOpen = { onOpenEntry(entry) }) }
        }
    }
}

@Composable
private fun EntryRow(entry: MediaItem, onOpen: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val state = when {
        entry.progress >= 1f      -> EntryState.Read
        entry.progress > 0f       -> EntryState.Partial
        else                       -> EntryState.Unread
    }
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .clickable(onClick = onOpen)
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        CFCover(entry, width = 56.dp, height = 80.dp, showLabel = false)
        Column(Modifier.weight(1f)) {
            Text(entry.title, style = MaterialTheme.typography.titleSmall, maxLines = 2, overflow = TextOverflow.Ellipsis)
            Text(entry.subtitle, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant)
            if (entry.progress > 0f && entry.progress < 1f) {
                Spacer(Modifier.height(4.dp))
                LinearProgressIndicator(
                    progress = { entry.progress },
                    modifier = Modifier.fillMaxWidth().height(2.dp),
                    color = cs.primary,
                    trackColor = cs.onSurface.copy(alpha = 0.12f),
                )
            }
        }
        Icon(
            imageVector = when (state) {
                EntryState.Read    -> Icons.Default.CheckCircle
                EntryState.Partial -> Icons.Default.Pending
                EntryState.Unread  -> Icons.Default.RadioButtonUnchecked
            },
            contentDescription = state.name,
            tint = when (state) {
                EntryState.Read    -> cs.primary
                EntryState.Partial -> cs.primary
                EntryState.Unread  -> cs.onSurfaceVariant
            },
        )
    }
}

private enum class EntryState { Read, Partial, Unread }
