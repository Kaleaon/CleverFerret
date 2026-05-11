// ModernSearchScreen — universal search across formats and sources.
// Pinned search bar, format-filter chip row, recent searches, results list.

package com.universalmedialibrary.ui.modern.search

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFCover
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.domain.MediaItem
import com.universalmedialibrary.ui.modern.domain.MediaKind
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class SearchFilter(val kind: MediaKind?, val label: String)

private val DEFAULT_FILTERS = listOf(
    SearchFilter(null,                    "All"),
    SearchFilter(MediaKind.Book,          "Books"),
    SearchFilter(MediaKind.Audiobook,     "Audiobooks"),
    SearchFilter(MediaKind.Podcast,       "Podcasts"),
    SearchFilter(MediaKind.Comic,         "Comics"),
    SearchFilter(MediaKind.Movie,         "Movies"),
    SearchFilter(MediaKind.Tv,            "TV"),
    SearchFilter(MediaKind.Music,         "Music"),
    SearchFilter(MediaKind.Radio,         "Radio"),
    SearchFilter(MediaKind.WebFiction,    "Web fiction"),
)

data class ModernSearchUiState(
    val query: String,
    val activeFilter: SearchFilter = DEFAULT_FILTERS.first(),
    val filters: List<SearchFilter> = DEFAULT_FILTERS,
    val recentQueries: List<String> = emptyList(),
    val results: List<MediaItem> = emptyList(),
    val isLoading: Boolean = false,
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ModernSearchScreen(
    state: ModernSearchUiState,
    onBack: () -> Unit,
    onQueryChange: (String) -> Unit,
    onSubmit: (String) -> Unit,
    onSelectFilter: (SearchFilter) -> Unit,
    onPickRecent: (String) -> Unit,
    onOpenItem: (MediaItem) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            SearchTopBar(
                query = state.query,
                onBack = onBack,
                onQueryChange = onQueryChange,
                onSubmit = { onSubmit(state.query) },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        Column(
            modifier = Modifier.fillMaxSize().padding(padding),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.md),
        ) {
            LazyRow(
                contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
            ) {
                items(state.filters) { f ->
                    Box(Modifier.clickable { onSelectFilter(f) }) {
                        CFTagChip(text = f.label, selected = f == state.activeFilter)
                    }
                }
            }

            when {
                state.isLoading -> Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                    CircularProgressIndicator(color = cs.primary)
                }
                state.query.isBlank() && state.recentQueries.isNotEmpty() -> {
                    LazyColumn(
                        contentPadding = PaddingValues(horizontal = CFSpacing.lg),
                        verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
                    ) {
                        item {
                            CFSectionHeader(title = "Recent searches")
                            Spacer(Modifier.height(CFSpacing.sm))
                        }
                        items(state.recentQueries) { q ->
                            RecentRow(query = q, onClick = { onPickRecent(q) })
                        }
                    }
                }
                state.query.isNotBlank() && state.results.isEmpty() -> {
                    CFEmptyState(
                        icon = Icons.Default.SearchOff,
                        title = "No matches",
                        body = "Try a broader query or switch the format filter.",
                    )
                }
                state.results.isNotEmpty() -> {
                    LazyColumn(
                        contentPadding = PaddingValues(
                            horizontal = CFSpacing.lg,
                            vertical = CFSpacing.sm,
                        ),
                        verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                    ) {
                        items(state.results) { item ->
                            ResultRow(item, onClick = { onOpenItem(item) })
                        }
                    }
                }
                else -> CFEmptyState(
                    icon = Icons.Default.Search,
                    title = "Search everything",
                    body = "Books, audiobooks, podcasts, comics, music, video, web fiction — one box.",
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SearchTopBar(
    query: String,
    onBack: () -> Unit,
    onQueryChange: (String) -> Unit,
    onSubmit: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Surface(color = cs.background) {
        Row(
            Modifier
                .fillMaxWidth()
                .padding(horizontal = CFSpacing.sm, vertical = CFSpacing.sm),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(CFSpacing.xs),
        ) {
            IconButton(onClick = onBack) {
                Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
            }
            TextField(
                value = query,
                onValueChange = onQueryChange,
                modifier = Modifier
                    .weight(1f)
                    .clip(CircleShape),
                placeholder = { Text("Search everything") },
                singleLine = true,
                leadingIcon = { Icon(Icons.Default.Search, contentDescription = null) },
                trailingIcon = if (query.isNotEmpty()) {
                    @Composable {
                        IconButton(onClick = { onQueryChange("") }) {
                            Icon(Icons.Default.Close, contentDescription = "Clear")
                        }
                    }
                } else null,
                colors = TextFieldDefaults.colors(
                    focusedContainerColor = cs.surfaceVariant,
                    unfocusedContainerColor = cs.surfaceVariant,
                    focusedIndicatorColor = androidx.compose.ui.graphics.Color.Transparent,
                    unfocusedIndicatorColor = androidx.compose.ui.graphics.Color.Transparent,
                ),
                keyboardOptions = KeyboardOptions(imeAction = ImeAction.Search),
            )
        }
    }
}

@Composable
private fun RecentRow(query: String, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(10.dp))
            .clickable(onClick = onClick)
            .padding(vertical = CFSpacing.sm, horizontal = CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        Icon(Icons.Default.History, contentDescription = null, tint = cs.onSurfaceVariant)
        Text(query, modifier = Modifier.weight(1f), style = MaterialTheme.typography.bodyLarge)
        Icon(Icons.Default.NorthWest, contentDescription = null, tint = cs.onSurfaceVariant)
    }
}

@Composable
private fun ResultRow(item: MediaItem, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(12.dp))
            .clickable(onClick = onClick)
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
    ) {
        CFCover(item, width = 56.dp, height = 80.dp, showLabel = false)
        Column(Modifier.weight(1f)) {
            Text(
                item.kind.name.uppercase(),
                style = MaterialTheme.typography.labelSmall,
                color = cs.primary,
            )
            Text(
                item.title,
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.SemiBold,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            Text(
                item.author,
                style = MaterialTheme.typography.bodySmall,
                color = cs.onSurfaceVariant,
                maxLines = 1,
            )
        }
        Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
    }
}
