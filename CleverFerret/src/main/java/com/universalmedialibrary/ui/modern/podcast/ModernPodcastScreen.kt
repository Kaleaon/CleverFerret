// ModernPodcastScreen — subscribed shows + recent episodes feed.
// Two stacked sections: subscriptions horizontal carousel and a Latest
// episodes list. Episodes show artwork, show title, episode title, and
// elapsed/duration with a small progress bar when partially played.

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

data class UiPodcastShow(
    val id: String,
    val title: String,
    val publisher: String,
    val unplayedCount: Int,
    val hue: Color,
)

data class UiPodcastEpisode(
    val id: String,
    val showId: String,
    val showTitle: String,
    val title: String,
    val publishedLabel: String,
    val durationLabel: String,
    val progress: Float = 0f,
    val downloaded: Boolean = false,
    val hue: Color,
)

data class ModernPodcastUiState(
    val subscriptions: List<UiPodcastShow> = emptyList(),
    val latest: List<UiPodcastEpisode> = emptyList(),
)

@Composable
fun ModernPodcastScreen(
    state: ModernPodcastUiState,
    onBack: () -> Unit,
    onAddPodcast: () -> Unit,
    onOpenShow: (UiPodcastShow) -> Unit,
    onPlayEpisode: (UiPodcastEpisode) -> Unit,
    onDownloadEpisode: (UiPodcastEpisode) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Podcasts",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onAddPodcast) { Icon(Icons.Default.Add, contentDescription = "Add podcast") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.subscriptions.isEmpty() && state.latest.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.Podcasts,
                    title = "No podcasts yet",
                    body = "Search for a show or paste an RSS URL to subscribe.",
                    actionLabel = "Add podcast",
                    onAction = onAddPodcast,
                )
            }
            return@Scaffold
        }

        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            if (state.subscriptions.isNotEmpty()) {
                item {
                    CFSectionHeader("Subscriptions", "${state.subscriptions.size}", modifier = Modifier.padding(horizontal = CFSpacing.lg))
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        items(state.subscriptions) { show ->
                            ShowTile(show) { onOpenShow(show) }
                        }
                    }
                }
            }
            if (state.latest.isNotEmpty()) {
                item { CFSectionHeader("Latest episodes", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.latest) { ep ->
                    EpisodeRow(
                        episode = ep,
                        onPlay = { onPlayEpisode(ep) },
                        onDownload = { onDownloadEpisode(ep) },
                    )
                }
            }
        }
    }
}

@Composable
private fun ShowTile(show: UiPodcastShow, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier.width(132.dp).clickable(onClick = onClick),
    ) {
        Box(
            Modifier
                .fillMaxWidth()
                .aspectRatio(1f)
                .clip(RoundedCornerShape(12.dp))
                .background(Brush.linearGradient(listOf(show.hue, show.hue.copy(alpha = 0.4f)))),
            contentAlignment = Alignment.TopEnd,
        ) {
            if (show.unplayedCount > 0) {
                Box(
                    Modifier
                        .padding(6.dp)
                        .clip(RoundedCornerShape(50))
                        .background(cs.primary)
                        .padding(horizontal = 6.dp, vertical = 2.dp),
                ) {
                    Text(
                        "${show.unplayedCount}",
                        style = MaterialTheme.typography.labelSmall,
                        color = cs.onPrimary,
                        fontWeight = FontWeight.Black,
                    )
                }
            }
        }
        Spacer(Modifier.height(CFSpacing.xs))
        Text(show.title, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
        Text(show.publisher, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1)
    }
}

@Composable
private fun EpisodeRow(episode: UiPodcastEpisode, onPlay: () -> Unit, onDownload: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.xs)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(8.dp))
                .background(Brush.linearGradient(listOf(episode.hue, episode.hue.copy(alpha = 0.4f)))),
        )
        Column(Modifier.weight(1f)) {
            Text(
                episode.showTitle.uppercase(),
                style = MaterialTheme.typography.labelSmall,
                color = cs.primary,
                maxLines = 1,
            )
            Text(
                episode.title,
                style = MaterialTheme.typography.titleSmall,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
            )
            Text(
                "${episode.publishedLabel} · ${episode.durationLabel}",
                style = MaterialTheme.typography.bodySmall,
                color = cs.onSurfaceVariant,
            )
            if (episode.progress > 0f && episode.progress < 1f) {
                Spacer(Modifier.height(4.dp))
                LinearProgressIndicator(
                    progress = { episode.progress },
                    modifier = Modifier.fillMaxWidth().height(2.dp),
                    color = cs.primary,
                    trackColor = cs.onSurface.copy(alpha = 0.12f),
                )
            }
        }
        IconButton(onClick = onDownload) {
            Icon(
                if (episode.downloaded) Icons.Default.OfflinePin else Icons.Default.Download,
                contentDescription = "Download",
                tint = if (episode.downloaded) cs.primary else cs.onSurfaceVariant,
            )
        }
        IconButton(onClick = onPlay) {
            Icon(Icons.Default.PlayCircle, contentDescription = "Play", tint = cs.primary)
        }
    }
}
