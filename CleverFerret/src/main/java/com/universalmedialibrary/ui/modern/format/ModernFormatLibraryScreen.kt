// ModernFormatLibraryScreen — single generic browse screen used for every
// "grid of MediaItems" surface: Books, Audiobooks, Comics, Manga, Movies,
// TV, Video, Web Fiction, Fanfiction. The kind only changes the title,
// chip set, and aspect ratio of the cover.
//
// Wire each existing format library (BookshelfScreen, ComicsLibraryScreen,
// MangaLibraryScreen, VideoLibraryScreen, etc.) to this composable by
// mapping their domain items to MediaItem and supplying a kind-specific
// FormatLibraryConfig.

package com.universalmedialibrary.ui.modern.format

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.GridItemSpan
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.Sort
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
import com.universalmedialibrary.ui.modern.components.*
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.domain.MediaKind
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

/**
 * Layout knobs the host screen tweaks per format. Defaults work for most
 * book-like formats; movies override `coverAspect` to 2/3 portrait poster,
 * music to 1f, etc.
 */
data class FormatLibraryConfig(
    val kind: MediaKind,
    val title: String = kind.titleCase(),
    val coverAspect: Float = 2f / 3f,    // width / height
    val minCoverWidthDp: Int = 120,
    val emptyTitle: String = "Nothing here yet",
    val emptyBody: String = "Add a source under Settings to fill this shelf.",
)

data class FilterChip(val id: String, val label: String)

data class ModernFormatLibraryUiState(
    val config: FormatLibraryConfig,
    val items: List<MediaItem>,
    val filters: List<FilterChip> = emptyList(),
    val activeFilterId: String? = null,
    val sortLabel: String = "Title",
)

@Composable
fun ModernFormatLibraryScreen(
    state: ModernFormatLibraryUiState,
    onBack: () -> Unit,
    onSearch: () -> Unit,
    onSelectFilter: (FilterChip?) -> Unit,
    onChangeSort: () -> Unit,
    onOpenItem: (MediaItem) -> Unit,
    onAddSource: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current

    Scaffold(
        topBar = {
            CFTopBar(
                title = state.config.title,
                onBack = onBack,
                actions = {
                    IconButton(onClick = onChangeSort) { Icon(Icons.AutoMirrored.Filled.Sort, contentDescription = "Sort") }
                    IconButton(onClick = onSearch)     { Icon(Icons.Default.Search, contentDescription = "Search") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        Column(Modifier.fillMaxSize().padding(padding)) {
            if (state.filters.isNotEmpty()) {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                ) {
                    item {
                        Box(Modifier.clickable { onSelectFilter(null) }) {
                            CFTagChip(text = "All", selected = state.activeFilterId == null)
                        }
                    }
                    items(state.filters) { f ->
                        Box(Modifier.clickable { onSelectFilter(f) }) {
                            CFTagChip(text = f.label, selected = f.id == state.activeFilterId)
                        }
                    }
                }
            }
            Row(
                Modifier
                    .fillMaxWidth()
                    .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.xs),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                Text(
                    "${state.items.size} items",
                    style = MaterialTheme.typography.labelMedium,
                    color = cs.onSurfaceVariant,
                )
                Spacer(Modifier.weight(1f))
                Text(
                    "Sorted by ${state.sortLabel}",
                    style = MaterialTheme.typography.labelSmall,
                    color = cs.onSurfaceVariant,
                )
            }

            if (state.items.isEmpty()) {
                CFEmptyState(
                    icon = state.config.kind.icon(),
                    title = state.config.emptyTitle,
                    body = state.config.emptyBody,
                    actionLabel = "Add source",
                    onAction = onAddSource,
                )
            } else {
                LazyVerticalGrid(
                    columns = GridCells.Adaptive(minSize = state.config.minCoverWidthDp.dp),
                    contentPadding = PaddingValues(CFSpacing.lg),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    modifier = Modifier.fillMaxSize(),
                ) {
                    items(state.items) { item ->
                        FormatTile(item, state.config.coverAspect, onClick = { onOpenItem(item) })
                    }
                }
            }
        }
    }
}

@Composable
private fun FormatTile(item: MediaItem, aspect: Float, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(Modifier.clickable(onClick = onClick)) {
        Box(
            Modifier
                .fillMaxWidth()
                .aspectRatio(aspect)
                .clip(RoundedCornerShape(8.dp))
                .background(
                    Brush.linearGradient(
                        listOf(item.coverHue, item.coverHue.copy(alpha = 0.55f))
                    )
                ),
        )
        Spacer(Modifier.height(4.dp))
        Text(
            item.title,
            style = MaterialTheme.typography.titleSmall,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis,
        )
        Text(
            item.author,
            style = MaterialTheme.typography.bodySmall,
            color = cs.onSurfaceVariant,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
        )
        if (item.progress > 0f) {
            Spacer(Modifier.height(4.dp))
            LinearProgressIndicator(
                progress = { item.progress },
                modifier = Modifier.fillMaxWidth().height(2.dp),
                color = cs.primary,
                trackColor = cs.onSurface.copy(alpha = 0.12f),
            )
        }
    }
}

// ─── Helpers ─────────────────────────────────────────────────────────────
private fun MediaKind.titleCase(): String = when (this) {
    MediaKind.Book -> "Books"; MediaKind.Audiobook -> "Audiobooks"
    MediaKind.Podcast -> "Podcasts"; MediaKind.Comic -> "Comics"
    MediaKind.Movie -> "Movies"; MediaKind.Tv -> "TV"
    MediaKind.Music -> "Music"; MediaKind.Radio -> "Radio"
    MediaKind.WebFiction -> "Web fiction"
}

private fun MediaKind.icon() = when (this) {
    MediaKind.Book        -> Icons.Default.MenuBook
    MediaKind.Audiobook   -> Icons.Default.Headphones
    MediaKind.Podcast     -> Icons.Default.Podcasts
    MediaKind.Comic       -> Icons.Default.AutoStories
    MediaKind.Movie       -> Icons.Default.Movie
    MediaKind.Tv          -> Icons.Default.Tv
    MediaKind.Music       -> Icons.Default.MusicNote
    MediaKind.Radio       -> Icons.Default.Radio
    MediaKind.WebFiction  -> Icons.Default.Article
}
