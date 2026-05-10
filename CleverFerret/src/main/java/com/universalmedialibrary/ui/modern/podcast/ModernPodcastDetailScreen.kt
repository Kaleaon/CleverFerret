// ModernPodcastDetailScreen — show hero + about + episodes list with
// filter (All / Unplayed / Downloaded).

package com.universalmedialibrary.ui.modern.podcast

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

enum class PodcastEpisodeFilter(val label: String) {
    All("All"), Unplayed("Unplayed"), Downloaded("Downloaded")
}

data class ModernPodcastDetailUiState(
    val show: UiPodcastShow,
    val description: String,
    val episodes: List<UiPodcastEpisode>,
    val activeFilter: PodcastEpisodeFilter = PodcastEpisodeFilter.All,
    val subscribed: Boolean = true,
)

@Composable
fun ModernPodcastDetailScreen(
    state: ModernPodcastDetailUiState,
    onBack: () -> Unit,
    onSubscribeToggle: () -> Unit,
    onShare: () -> Unit,
    onChangeFilter: (PodcastEpisodeFilter) -> Unit,
    onPlayEpisode: (UiPodcastEpisode) -> Unit,
    onDownloadEpisode: (UiPodcastEpisode) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    val filteredEpisodes = when (state.activeFilter) {
        PodcastEpisodeFilter.All        -> state.episodes
        PodcastEpisodeFilter.Unplayed   -> state.episodes.filter { it.progress == 0f }
        PodcastEpisodeFilter.Downloaded -> state.episodes.filter { it.downloaded }
    }

    Scaffold(
        topBar = {
            CFTopBar(
                title = "Show",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onShare) { Icon(Icons.Default.Share, contentDescription = "Share") }
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
                        .background(Brush.verticalGradient(listOf(state.show.hue.copy(alpha = 0.45f), cs.background)))
                        .padding(CFSpacing.lg),
                ) {
                    Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.lg)) {
                        Box(
                            Modifier
                                .size(112.dp)
                                .clip(RoundedCornerShape(12.dp))
                                .background(Brush.linearGradient(listOf(state.show.hue, state.show.hue.copy(alpha = 0.4f)))),
                        )
                        Column(Modifier.weight(1f)) {
                            Text(
                                state.show.title,
                                style = MaterialTheme.typography.headlineSmall.copy(
                                    brush = tokens.metal.brush(),
                                    fontWeight = FontWeight.Black,
                                ),
                                maxLines = 2,
                            )
                            Text(state.show.publisher, style = MaterialTheme.typography.titleSmall, color = cs.onSurfaceVariant)
                            Spacer(Modifier.height(CFSpacing.sm))
                            Button(onClick = onSubscribeToggle) {
                                Icon(
                                    if (state.subscribed) Icons.Default.CheckCircle else Icons.Default.Add,
                                    contentDescription = null,
                                )
                                Spacer(Modifier.width(4.dp))
                                Text(if (state.subscribed) "Subscribed" else "Subscribe")
                            }
                        }
                    }
                    Spacer(Modifier.height(CFSpacing.md))
                    Text(
                        state.description,
                        style = MaterialTheme.typography.bodyMedium,
                        maxLines = 4,
                        overflow = TextOverflow.Ellipsis,
                    )
                }
            }

            item {
                CFSectionHeader("Episodes", "${filteredEpisodes.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg))
                Spacer(Modifier.height(CFSpacing.sm))
                LazyRow(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                ) {
                    items(PodcastEpisodeFilter.entries.toList()) { f ->
                        Box(Modifier.clickable { onChangeFilter(f) }) {
                            CFTagChip(text = f.label, selected = f == state.activeFilter)
                        }
                    }
                }
            }

            items(filteredEpisodes) { ep ->
                Row(
                    Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.xs)
                        .clip(RoundedCornerShape(12.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
                        .clickable { onPlayEpisode(ep) }
                        .padding(CFSpacing.sm),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                ) {
                    Column(Modifier.weight(1f)) {
                        Text(
                            ep.publishedLabel.uppercase(),
                            style = MaterialTheme.typography.labelSmall,
                            color = cs.onSurfaceVariant,
                        )
                        Text(
                            ep.title,
                            style = MaterialTheme.typography.titleSmall,
                            maxLines = 2,
                            overflow = TextOverflow.Ellipsis,
                        )
                        Text(
                            ep.durationLabel,
                            style = MaterialTheme.typography.bodySmall,
                            color = cs.onSurfaceVariant,
                        )
                    }
                    IconButton(onClick = { onDownloadEpisode(ep) }) {
                        Icon(
                            if (ep.downloaded) Icons.Default.OfflinePin else Icons.Default.Download,
                            contentDescription = "Download",
                            tint = if (ep.downloaded) cs.primary else cs.onSurfaceVariant,
                        )
                    }
                    IconButton(onClick = { onPlayEpisode(ep) }) {
                        Icon(Icons.Default.PlayCircle, contentDescription = "Play", tint = cs.primary)
                    }
                }
            }
        }
    }
}
