// ModernCollectionsScreen — grid of collections (manual + smart) plus a
// CTA to create a new one.
// ModernCollectionDetailScreen — collection contents grid.

package com.universalmedialibrary.ui.modern.collections

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
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
import com.universalmedialibrary.ui.modern.components.CFCover
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class UiCollection(
    val id: String,
    val title: String,
    val subtitle: String,
    val itemCount: Int,
    val hue: Color,
    val smart: Boolean = false,
)

data class ModernCollectionsUiState(val collections: List<UiCollection> = emptyList())

@Composable
fun ModernCollectionsScreen(
    state: ModernCollectionsUiState,
    onBack: () -> Unit,
    onCreate: () -> Unit,
    onOpen: (UiCollection) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Collections",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onCreate) { Icon(Icons.Default.Add, contentDescription = "New collection") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.collections.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.Collections,
                    title = "No collections yet",
                    body = "Group your media into manual or smart collections.",
                    actionLabel = "Create collection",
                    onAction = onCreate,
                )
            }
            return@Scaffold
        }
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 170.dp),
            contentPadding = PaddingValues(CFSpacing.lg),
            horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.md),
            modifier = Modifier.fillMaxSize().padding(padding),
        ) {
            items(state.collections) { c -> CollectionTile(c) { onOpen(c) } }
        }
    }
}

@Composable
private fun CollectionTile(c: UiCollection, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Column(
        Modifier
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
            .clickable(onClick = onClick)
            .padding(CFSpacing.sm),
    ) {
        Box(
            Modifier
                .fillMaxWidth()
                .aspectRatio(1.6f)
                .clip(RoundedCornerShape(10.dp))
                .background(Brush.linearGradient(listOf(c.hue, c.hue.copy(alpha = 0.4f)))),
            contentAlignment = Alignment.TopEnd,
        ) {
            if (c.smart) {
                Box(
                    Modifier
                        .padding(8.dp)
                        .clip(RoundedCornerShape(50))
                        .background(tokens.metal.brush())
                        .padding(horizontal = 8.dp, vertical = 2.dp),
                ) {
                    Text("SMART", style = MaterialTheme.typography.labelSmall, color = cs.onPrimary, fontWeight = FontWeight.Black)
                }
            }
        }
        Spacer(Modifier.height(CFSpacing.xs))
        Text(c.title, style = MaterialTheme.typography.titleSmall, maxLines = 1, overflow = TextOverflow.Ellipsis)
        Text(
            "${c.itemCount} items · ${c.subtitle}",
            style = MaterialTheme.typography.bodySmall,
            color = cs.onSurfaceVariant,
            maxLines = 1,
        )
    }
}

// ── Detail ───────────────────────────────────────────────────────────────

data class ModernCollectionDetailUiState(
    val collection: UiCollection,
    val items: List<MediaItem>,
)

@Composable
fun ModernCollectionDetailScreen(
    state: ModernCollectionDetailUiState,
    onBack: () -> Unit,
    onPlayAll: () -> Unit,
    onEdit: () -> Unit,
    onOpenItem: (MediaItem) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = {
            CFTopBar(
                title = state.collection.title,
                onBack = onBack,
                actions = {
                    IconButton(onClick = onEdit) { Icon(Icons.Default.Edit, contentDescription = "Edit") }
                    IconButton(onClick = onPlayAll) { Icon(Icons.Default.PlayCircle, contentDescription = "Play all") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.items.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.LibraryAddCheck,
                    title = "Empty collection",
                    body = "Add items from any detail screen to land them here.",
                )
            }
            return@Scaffold
        }
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 120.dp),
            contentPadding = PaddingValues(CFSpacing.lg),
            horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
            modifier = Modifier.fillMaxSize().padding(padding),
        ) {
            items(state.items) { item ->
                Column(Modifier.clickable { onOpenItem(item) }) {
                    CFCover(item, width = 120.dp, height = 168.dp, showLabel = false)
                    Spacer(Modifier.height(4.dp))
                    Text(
                        item.title,
                        style = MaterialTheme.typography.labelMedium,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                    )
                }
            }
        }
    }
}
