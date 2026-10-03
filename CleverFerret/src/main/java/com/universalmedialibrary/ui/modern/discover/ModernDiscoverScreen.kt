// ModernDiscoverScreen — recommendations and editorial shelves.
// Stacked horizontal carousels: For You, Trending, New, Curators.
// Each carousel can render any media kind via CFCover.

package com.universalmedialibrary.ui.modern.discover

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Cast
import androidx.compose.material.icons.filled.Search
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
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class DiscoverShelf(
    val id: String,
    val title: String,
    val subtitle: String? = null,
    val items: List<MediaItem>,
)

data class ModernDiscoverUiState(val shelves: List<DiscoverShelf> = emptyList())

@Composable
fun ModernDiscoverScreen(
    state: ModernDiscoverUiState,
    onBack: () -> Unit,
    onSearch: () -> Unit,
    onCast: () -> Unit,
    onOpenItem: (MediaItem) -> Unit,
    onSeeAll: (DiscoverShelf) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Discover",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onSearch) { Icon(Icons.Default.Search, contentDescription = "Search") }
                    IconButton(onClick = onCast)  { Icon(Icons.Default.Cast, contentDescription = "Cast") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.shelves.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.Search,
                    title = "Nothing to recommend yet",
                    body = "Read, watch, or listen to a few items so we can suggest more.",
                )
            }
            return@Scaffold
        }

        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            // Hero shelf — first one, larger covers
            val first = state.shelves.firstOrNull()
            if (first != null) {
                item {
                    Column(
                        Modifier
                            .padding(horizontal = CFSpacing.lg)
                            .clip(RoundedCornerShape(18.dp))
                            .background(Brush.linearGradient(listOf(cs.surfaceVariant, cs.surface)))
                            .border(1.dp, cs.outline.copy(alpha = 0.4f), RoundedCornerShape(18.dp))
                            .padding(CFSpacing.md),
                    ) {
                        Text(
                            first.title.uppercase(),
                            style = MaterialTheme.typography.labelMedium.copy(
                                brush = tokens.metal.brush(),
                                fontWeight = FontWeight.Black,
                            ),
                        )
                        Text(
                            first.subtitle ?: "Hand-picked for you",
                            style = MaterialTheme.typography.titleLarge,
                            maxLines = 2,
                            overflow = TextOverflow.Ellipsis,
                        )
                        Spacer(Modifier.height(CFSpacing.sm))
                        LazyRow(horizontalArrangement = Arrangement.spacedBy(CFSpacing.md)) {
                            items(first.items) { item ->
                                CFCover(item, width = 140.dp, height = 200.dp, modifier = Modifier.clickable { onOpenItem(item) })
                            }
                        }
                    }
                }
            }
            // Remaining shelves
            items(state.shelves.drop(1)) { shelf ->
                Column {
                    CFSectionHeader(
                        title = shelf.title,
                        subtitle = shelf.subtitle,
                        actionLabel = "See all",
                        onAction = { onSeeAll(shelf) },
                        modifier = Modifier.padding(horizontal = CFSpacing.lg),
                    )
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                    ) {
                        items(shelf.items) { item ->
                            CFCover(item, width = 110.dp, height = 156.dp, modifier = Modifier.clickable { onOpenItem(item) })
                        }
                    }
                }
            }
        }
    }
}
