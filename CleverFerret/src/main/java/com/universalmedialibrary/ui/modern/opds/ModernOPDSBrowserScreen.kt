// ModernOPDSBrowserScreen — feed-tree navigator for any OPDS catalog.
// Top: breadcrumb chips for the current path.
// Body: feed entries (subfolders + downloadable items) as cards with
// download CTA. Caller controls pagination via onLoadMore.

package com.universalmedialibrary.ui.modern.opds

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
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
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class OpdsEntryKind { Folder, Item }

data class UiOpdsEntry(
    val id: String,
    val title: String,
    val author: String? = null,
    val summary: String? = null,
    val kind: OpdsEntryKind,
    val downloadable: Boolean = false,
    val downloaded: Boolean = false,
    val tint: Color,
)

data class OpdsBreadcrumb(val id: String, val label: String)

data class ModernOpdsUiState(
    val catalogTitle: String,
    val crumbs: List<OpdsBreadcrumb>,
    val entries: List<UiOpdsEntry>,
    val isLoading: Boolean = false,
    val canLoadMore: Boolean = false,
)

@Composable
fun ModernOPDSBrowserScreen(
    state: ModernOpdsUiState,
    onBack: () -> Unit,
    onSearch: () -> Unit,
    onJumpCrumb: (OpdsBreadcrumb) -> Unit,
    onOpenFolder: (UiOpdsEntry) -> Unit,
    onDownload: (UiOpdsEntry) -> Unit,
    onLoadMore: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = state.catalogTitle,
                onBack = onBack,
                actions = {
                    IconButton(onClick = onSearch) { Icon(Icons.Default.Search, contentDescription = "Search") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        Column(Modifier.fillMaxSize().padding(padding)) {
            if (state.crumbs.isNotEmpty()) {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    items(state.crumbs) { crumb ->
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Box(Modifier.clickable { onJumpCrumb(crumb) }) {
                                CFTagChip(text = crumb.label)
                            }
                            Icon(
                                Icons.Default.ChevronRight,
                                contentDescription = null,
                                tint = cs.onSurfaceVariant,
                                modifier = Modifier.padding(horizontal = 2.dp),
                            )
                        }
                    }
                }
            }
            when {
                state.isLoading && state.entries.isEmpty() -> Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                    CircularProgressIndicator(color = cs.primary)
                }
                state.entries.isEmpty() -> CFEmptyState(
                    icon = Icons.Default.Public,
                    title = "Empty feed",
                    body = "This catalog has no entries at this level.",
                )
                else -> LazyColumn(
                    contentPadding = PaddingValues(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                    modifier = Modifier.fillMaxSize(),
                ) {
                    items(state.entries) { entry ->
                        EntryRow(
                            entry,
                            onOpen = { if (entry.kind == OpdsEntryKind.Folder) onOpenFolder(entry) },
                            onDownload = { onDownload(entry) },
                        )
                    }
                    if (state.canLoadMore) {
                        item {
                            Box(Modifier.fillMaxWidth().padding(CFSpacing.lg), contentAlignment = Alignment.Center) {
                                TextButton(onClick = onLoadMore) {
                                    if (state.isLoading) {
                                        CircularProgressIndicator(modifier = Modifier.size(16.dp), strokeWidth = 2.dp)
                                    } else {
                                        Text("Load more")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun EntryRow(entry: UiOpdsEntry, onOpen: () -> Unit, onDownload: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .clickable(onClick = onOpen)
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Box(
            Modifier
                .size(48.dp)
                .clip(RoundedCornerShape(8.dp))
                .background(Brush.linearGradient(listOf(entry.tint, entry.tint.copy(alpha = 0.4f)))),
            contentAlignment = Alignment.Center,
        ) {
            Icon(
                imageVector = if (entry.kind == OpdsEntryKind.Folder) Icons.Default.Folder else Icons.Default.MenuBook,
                contentDescription = null,
                tint = Color.White,
            )
        }
        Column(Modifier.weight(1f)) {
            Text(entry.title, style = MaterialTheme.typography.titleSmall, maxLines = 2, overflow = TextOverflow.Ellipsis)
            entry.author?.let {
                Text(it, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1)
            }
            entry.summary?.let {
                Text(it, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 2, overflow = TextOverflow.Ellipsis)
            }
        }
        if (entry.downloadable) {
            IconButton(onClick = onDownload) {
                Icon(
                    if (entry.downloaded) Icons.Default.OfflinePin else Icons.Default.Download,
                    contentDescription = "Download",
                    tint = if (entry.downloaded) cs.primary else cs.onSurfaceVariant,
                )
            }
        } else if (entry.kind == OpdsEntryKind.Folder) {
            Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
        }
    }
}
