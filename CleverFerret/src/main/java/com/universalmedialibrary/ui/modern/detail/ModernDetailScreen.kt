// ModernDetailScreen — generic media item detail.
// Hero header with cover + title + metadata; primary play/resume CTA;
// metadata grid; description; chapter / track / episode list.

package com.universalmedialibrary.ui.modern.detail

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
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.*
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class DetailMetaPair(val label: String, val value: String)

data class DetailChapter(
    val id: String,
    val index: Int,
    val title: String,
    val duration: String,
    val played: Boolean = false,
)

data class ModernDetailUiState(
    val item: MediaItem,
    val description: String,
    val tags: List<String> = emptyList(),
    val metadata: List<DetailMetaPair> = emptyList(),
    val chapters: List<DetailChapter> = emptyList(),
    val related: List<MediaItem> = emptyList(),
)

@Composable
fun ModernDetailScreen(
    state: ModernDetailUiState,
    onBack: () -> Unit,
    onPlay: () -> Unit,
    onAddToCollection: () -> Unit,
    onShare: () -> Unit,
    onSelectChapter: (DetailChapter) -> Unit,
    onOpenRelated: (MediaItem) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = state.item.kind.name,
                onBack = onBack,
                actions = {
                    IconButton(onClick = onAddToCollection) { Icon(Icons.Default.PlaylistAdd, contentDescription = "Add to collection") }
                    IconButton(onClick = onShare) { Icon(Icons.Default.Share, contentDescription = "Share") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            modifier = Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item { DetailHero(state, onPlay = onPlay) }

            if (state.tags.isNotEmpty()) {
                item {
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                    ) {
                        items(state.tags) { CFTagChip(text = it) }
                    }
                }
            }

            if (state.description.isNotBlank()) {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("About")
                        Spacer(Modifier.height(CFSpacing.sm))
                        Text(
                            state.description,
                            style = MaterialTheme.typography.bodyMedium,
                            color = cs.onBackground,
                        )
                    }
                }
            }

            if (state.metadata.isNotEmpty()) {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("Details")
                        Spacer(Modifier.height(CFSpacing.sm))
                        Column(
                            Modifier
                                .fillMaxWidth()
                                .clip(RoundedCornerShape(12.dp))
                                .background(cs.surface)
                                .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(12.dp)),
                        ) {
                            state.metadata.forEachIndexed { idx, pair ->
                                Row(
                                    Modifier
                                        .fillMaxWidth()
                                        .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.md),
                                ) {
                                    Text(
                                        pair.label,
                                        style = MaterialTheme.typography.labelMedium,
                                        color = cs.onSurfaceVariant,
                                        modifier = Modifier.weight(1f),
                                    )
                                    Text(pair.value, style = MaterialTheme.typography.bodyMedium)
                                }
                                if (idx != state.metadata.lastIndex) {
                                    HorizontalDivider(color = cs.outline.copy(alpha = 0.2f))
                                }
                            }
                        }
                    }
                }
            }

            if (state.chapters.isNotEmpty()) {
                item {
                    Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                        CFSectionHeader("Chapters", "${state.chapters.size} entries")
                    }
                }
                items(state.chapters) { ch ->
                    ChapterRow(ch, modifier = Modifier.padding(horizontal = CFSpacing.lg)) { onSelectChapter(ch) }
                }
            }

            if (state.related.isNotEmpty()) {
                item {
                    CFSectionHeader(
                        "Related",
                        modifier = Modifier.padding(horizontal = CFSpacing.lg),
                    )
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        items(state.related) { item ->
                            CFCover(item, width = 110.dp, height = 156.dp, modifier = Modifier.clickable { onOpenRelated(item) })
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun DetailHero(state: ModernDetailUiState, onPlay: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Column(
        Modifier
            .fillMaxWidth()
            .background(Brush.verticalGradient(listOf(cs.surfaceVariant, cs.background)))
            .padding(CFSpacing.lg),
    ) {
        Row(horizontalArrangement = Arrangement.spacedBy(CFSpacing.lg)) {
            CFCover(state.item, width = 132.dp, height = 196.dp, showLabel = false)
            Column(Modifier.weight(1f), verticalArrangement = Arrangement.spacedBy(CFSpacing.xs)) {
                Text(
                    state.item.kind.name.uppercase(),
                    style = MaterialTheme.typography.labelMedium,
                    color = cs.primary,
                )
                Text(
                    state.item.title,
                    style = MaterialTheme.typography.headlineMedium.copy(
                        brush = tokens.metal.brush(),
                        fontWeight = FontWeight.Black,
                    ),
                    maxLines = 3,
                    overflow = TextOverflow.Ellipsis,
                )
                Text(
                    state.item.author,
                    style = MaterialTheme.typography.titleSmall,
                    color = cs.onBackground,
                )
                Text(
                    state.item.subtitle,
                    style = MaterialTheme.typography.bodySmall,
                    color = cs.onSurfaceVariant,
                )
                if (state.item.progress > 0f) {
                    LinearProgressIndicator(
                        progress = { state.item.progress },
                        modifier = Modifier.fillMaxWidth().height(3.dp).clip(RoundedCornerShape(2.dp)),
                        color = cs.primary,
                        trackColor = cs.onSurface.copy(alpha = 0.12f),
                    )
                }
            }
        }
        Spacer(Modifier.height(CFSpacing.lg))
        CFMetalButton(
            text = if (state.item.progress > 0f) "Resume" else "Play",
            onClick = onPlay,
            leadingIcon = Icons.Default.PlayArrow,
        )
    }
}

@Composable
private fun ChapterRow(chapter: DetailChapter, modifier: Modifier = Modifier, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(10.dp))
            .clickable(onClick = onClick)
            .padding(vertical = CFSpacing.sm, horizontal = CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Text(
            "%02d".format(chapter.index),
            style = MaterialTheme.typography.titleMedium,
            color = if (chapter.played) cs.onSurfaceVariant else cs.primary,
            fontWeight = FontWeight.Black,
        )
        Column(Modifier.weight(1f)) {
            Text(chapter.title, style = MaterialTheme.typography.titleSmall)
            Text(
                chapter.duration,
                style = MaterialTheme.typography.labelSmall,
                color = cs.onSurfaceVariant,
            )
        }
        Icon(
            imageVector = if (chapter.played) Icons.Default.CheckCircle else Icons.Default.PlayArrow,
            contentDescription = null,
            tint = if (chapter.played) cs.onSurfaceVariant else cs.primary,
        )
    }
}
