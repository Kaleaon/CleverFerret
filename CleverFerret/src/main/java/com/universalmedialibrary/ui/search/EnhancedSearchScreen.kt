package com.universalmedialibrary.ui.search

import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.search.SearchResult
import com.universalmedialibrary.services.search.SortBy
import com.universalmedialibrary.services.search.SearchFilters
import com.universalmedialibrary.data.local.entity.SearchHistory
import coil.compose.AsyncImage

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedSearchScreen(
    navController: NavController,
    viewModel: EnhancedSearchViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val searchQuery by viewModel.searchQuery.collectAsState()
    val filters by viewModel.filters.collectAsState()
    val sortBy by viewModel.sortBy.collectAsState()

    var showFilters by remember { mutableStateOf(false) }
    var showSortOptions by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            SearchTopBar(
                searchQuery = searchQuery,
                onSearchQueryChange = viewModel::onSearchQueryChange,
                onNavigateBack = { navController.navigateUp() },
                onClearSearch = viewModel::clearSearch,
                showFilterBadge = filters.hasActiveFilters(),
                onShowFilters = { showFilters = true },
                onShowSort = { showSortOptions = true }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            when {
                uiState.isSearching -> {
                    LoadingState()
                }
                uiState.error != null -> {
                    ErrorState(
                        error = uiState.error!!,
                        onRetry = { viewModel.onSearchQueryChange(searchQuery) }
                    )
                }
                !uiState.hasSearched -> {
                    InitialState(
                        suggestions = uiState.suggestions,
                        searchHistory = uiState.searchHistory,
                        onSuggestionClick = viewModel::selectSuggestion,
                        onHistoryItemClick = viewModel::selectHistoryItem,
                        onDeleteHistoryItem = viewModel::deleteHistoryItem,
                        onClearHistory = viewModel::clearSearchHistory
                    )
                }
                uiState.results.isEmpty() -> {
                    EmptyResultsState(query = searchQuery)
                }
                else -> {
                    SearchResults(
                        results = uiState.results,
                        facets = uiState.facets,
                        onResultClick = { result ->
                            navController.navigate("detail/${result.itemId}")
                        },
                        onFacetFilterApplied = { mediaType ->
                            viewModel.toggleMediaTypeFilter(mediaType)
                        }
                    )
                }
            }

            // Filter Bottom Sheet
            if (showFilters) {
                FilterBottomSheet(
                    filters = filters,
                    facets = uiState.facets,
                    onDismiss = { showFilters = false },
                    onFiltersChange = viewModel::onFilterChange,
                    onClearFilters = viewModel::clearFilters
                )
            }

            // Sort Bottom Sheet
            if (showSortOptions) {
                SortBottomSheet(
                    currentSort = sortBy,
                    onDismiss = { showSortOptions = false },
                    onSortChange = { sort ->
                        viewModel.onSortChange(sort)
                        showSortOptions = false
                    }
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SearchTopBar(
    searchQuery: String,
    onSearchQueryChange: (String) -> Unit,
    onNavigateBack: () -> Unit,
    onClearSearch: () -> Unit,
    showFilterBadge: Boolean,
    onShowFilters: () -> Unit,
    onShowSort: () -> Unit
) {
    TopAppBar(
        title = {
            TextField(
                value = searchQuery,
                onValueChange = onSearchQueryChange,
                modifier = Modifier.fillMaxWidth(),
                placeholder = { Text("Search media library...") },
                singleLine = true,
                colors = TextFieldDefaults.colors(
                    focusedContainerColor = MaterialTheme.colorScheme.surface,
                    unfocusedContainerColor = MaterialTheme.colorScheme.surface,
                    focusedIndicatorColor = androidx.compose.ui.graphics.Color.Transparent,
                    unfocusedIndicatorColor = androidx.compose.ui.graphics.Color.Transparent
                ),
                trailingIcon = {
                    if (searchQuery.isNotEmpty()) {
                        IconButton(onClick = onClearSearch) {
                            Icon(Icons.Default.Clear, "Clear search")
                        }
                    }
                }
            )
        },
        navigationIcon = {
            IconButton(onClick = onNavigateBack) {
                Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
            }
        },
        actions = {
            BadgedBox(
                badge = {
                    if (showFilterBadge) {
                        Badge()
                    }
                }
            ) {
                IconButton(onClick = onShowFilters) {
                    Icon(Icons.Default.FilterList, "Filters")
                }
            }
            IconButton(onClick = onShowSort) {
                Icon(Icons.AutoMirrored.Filled.Sort, "Sort")
            }
        }
    )
}

@Composable
private fun LoadingState() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            CircularProgressIndicator()
            Spacer(modifier = Modifier.height(16.dp))
            Text("Searching...", style = MaterialTheme.typography.bodyMedium)
        }
    }
}

@Composable
private fun ErrorState(error: String, onRetry: () -> Unit) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.Error,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                "Search Error",
                style = MaterialTheme.typography.titleLarge
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                error,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(24.dp))
            Button(onClick = onRetry) {
                Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                Spacer(modifier = Modifier.width(8.dp))
                Text("Retry")
            }
        }
    }
}

@Composable
private fun InitialState(
    suggestions: List<String>,
    searchHistory: List<SearchHistory>,
    onSuggestionClick: (String) -> Unit,
    onHistoryItemClick: (SearchHistory) -> Unit,
    onDeleteHistoryItem: (SearchHistory) -> Unit,
    onClearHistory: () -> Unit
) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        // Suggestions
        if (suggestions.isNotEmpty()) {
            item {
                Text(
                    "Suggestions",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
            }
            items(suggestions) { suggestion ->
                ListItem(
                    headlineContent = { Text(suggestion) },
                    leadingContent = {
                        Icon(Icons.Default.Search, contentDescription = "Search")
                    },
                    modifier = Modifier.clickable { onSuggestionClick(suggestion) }
                )
            }
            item { Spacer(modifier = Modifier.height(16.dp)) }
        }

        // Search History
        if (searchHistory.isNotEmpty()) {
            item {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 8.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        "Recent Searches",
                        style = MaterialTheme.typography.titleMedium
                    )
                    TextButton(onClick = onClearHistory) {
                        Text("Clear All")
                    }
                }
            }
            items(searchHistory) { historyItem ->
                ListItem(
                    headlineContent = { Text(historyItem.query) },
                    supportingContent = {
                        Text(
                            "Found ${historyItem.resultCount} results",
                            style = MaterialTheme.typography.bodySmall
                        )
                    },
                    leadingContent = {
                        Icon(Icons.Default.History, contentDescription = "History")
                    },
                    trailingContent = {
                        IconButton(onClick = { onDeleteHistoryItem(historyItem) }) {
                            Icon(Icons.Default.Close, "Remove")
                        }
                    },
                    modifier = Modifier.clickable { onHistoryItemClick(historyItem) }
                )
            }
        }

        // Empty state
        if (suggestions.isEmpty() && searchHistory.isEmpty()) {
            item {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 64.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Icon(
                            Icons.Default.Search,
                            contentDescription = null,
                            modifier = Modifier.size(64.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            "Start searching",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Text(
                            "Search by title, author, genre, or tags",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun EmptyResultsState(query: String) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.SearchOff,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                "No results found",
                style = MaterialTheme.typography.titleLarge
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                "No matches for \"$query\"",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                "Try adjusting your filters or search query",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun SearchResults(
    results: List<SearchResult>,
    facets: com.universalmedialibrary.services.search.SearchFacets?,
    onResultClick: (SearchResult) -> Unit,
    onFacetFilterApplied: (String) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp)
    ) {
        // Result count
        item {
            Text(
                "${results.size} results",
                style = MaterialTheme.typography.titleMedium,
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }

        // Facets
        if (facets != null && facets.mediaTypes.isNotEmpty()) {
            item {
                Text(
                    "Filter by type",
                    style = MaterialTheme.typography.titleSmall,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.padding(bottom = 16.dp)
                ) {
                    items(facets.mediaTypes.entries.toList()) { (type, count) ->
                        FilterChip(
                            selected = false,
                            onClick = { onFacetFilterApplied(type) },
                            label = { Text("$type ($count)") }
                        )
                    }
                }
            }
        }

        // Results
        items(results) { result ->
            SearchResultCard(
                result = result,
                onClick = { onResultClick(result) }
            )
            Spacer(modifier = Modifier.height(8.dp))
        }
    }
}

@Composable
private fun SearchResultCard(
    result: SearchResult,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Thumbnail
            AsyncImage(
                    
                model = result.thumbnailUrl,
                contentDescription = null,
                modifier = Modifier
                    .size(80.dp)
                    .clip(MaterialTheme.shapes.small)
            )

            // Content
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    result.title,
                    style = MaterialTheme.typography.titleMedium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                if (result.subtitle.isNotEmpty()) {
                    Text(
                        result.subtitle,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.padding(top = 4.dp)
                ) {
                    AssistChip(
                        onClick = {},
                        label = { Text(result.mediaType) }
                    )
                    if (result.relevanceScore > 80f) {
                        AssistChip(
                            onClick = {},
                            label = { Text("Best match") },
                            leadingIcon = {
                                Icon(
                                    Icons.Default.Star,
                                    contentDescription = null,
                                    modifier = Modifier.size(16.dp)
                                )
                            }
                        )
                    }
                }
            }

            // Score indicator
            Text(
                "${result.relevanceScore.toInt()}%",
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.primary
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun FilterBottomSheet(
    filters: SearchFilters,
    facets: com.universalmedialibrary.services.search.SearchFacets?,
    onDismiss: () -> Unit,
    onFiltersChange: (SearchFilters) -> Unit,
    onClearFilters: () -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    "Filters",
                    style = MaterialTheme.typography.titleLarge
                )
                TextButton(onClick = onClearFilters) {
                    Text("Clear All")
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Media Types
            Text("Media Types", style = MaterialTheme.typography.titleSmall)
            Spacer(modifier = Modifier.height(8.dp))
            LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                val types = facets?.mediaTypes?.keys?.toList() 
                    ?: listOf("BOOK", "AUDIO", "VIDEO", "PDF", "COMIC")
                items(types) { type ->
                    FilterChip(
                        selected = filters.mediaTypes.contains(type),
                        onClick = {
                            val updated = filters.mediaTypes.toMutableList()
                            if (updated.contains(type)) updated.remove(type)
                            else updated.add(type)
                            onFiltersChange(
                                filters.copy(mediaTypes = updated)
                            )
                        },
                        label = { Text(type) }
                    )
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Rating filter
            Text("Minimum Rating", style = MaterialTheme.typography.titleSmall)
            Slider(
                value = filters.minRating ?: 0f,
                onValueChange = { onFiltersChange(filters.copy(minRating = if (it > 0) it else null)) },
                valueRange = 0f..5f,
                steps = 9
            )
            Text("${filters.minRating ?: 0f} stars", style = MaterialTheme.typography.bodySmall)

            Spacer(modifier = Modifier.height(32.dp))

            Button(
                onClick = onDismiss,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Apply Filters")
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SortBottomSheet(
    currentSort: SortBy,
    onDismiss: () -> Unit,
    onSortChange: (SortBy) -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "Sort By",
                style = MaterialTheme.typography.titleLarge
            )

            Spacer(modifier = Modifier.height(16.dp))

            SortBy.values().forEach { sortOption ->
                ListItem(
                    headlineContent = { Text(sortOption.name.replace("_", " ")) },
                    leadingContent = {
                        RadioButton(
                            selected = currentSort == sortOption,
                            onClick = { onSortChange(sortOption) }
                        )
                    },
                    modifier = Modifier.clickable { onSortChange(sortOption) }
                )
            }
        }
    }
}
