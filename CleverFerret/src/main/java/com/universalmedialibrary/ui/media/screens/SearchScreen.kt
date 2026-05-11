package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.components.TagChip
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Universal Search Screen
 * 
 * A powerful search interface that searches across:
 * - Local library (all media types)
 * - External sources (metadata providers, catalogs)
 * - Web fiction sites
 * - Podcast directories
 * - Music services
 * 
 * Features:
 * - Category filters
 * - Recent searches
 * - Search suggestions
 * - Voice search
 * - Grouped results by media type
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaSearchScreen(
    state: SearchScreenState,
    onQueryChange: (String) -> Unit,
    onSearch: (String) -> Unit,
    onClearSearch: () -> Unit,
    onResultClick: (SearchResult) -> Unit,
    onRecentSearchClick: (String) -> Unit,
    onClearRecentSearches: () -> Unit,
    onCategoryFilterChange: (SearchCategory?) -> Unit,
    onCategoryNavigate: (SearchCategory) -> Unit = {},
    onVoiceSearch: () -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val focusRequester = remember { FocusRequester() }
    val focusManager = LocalFocusManager.current
    
    LaunchedEffect(Unit) {
        focusRequester.requestFocus()
    }
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            SearchTopBar(
                query = state.query,
                onQueryChange = onQueryChange,
                onSearch = {
                    onSearch(state.query)
                    focusManager.clearFocus()
                },
                onClear = onClearSearch,
                onVoiceSearch = onVoiceSearch,
                onBackClick = onBackClick,
                focusRequester = focusRequester
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Category filter chips
            CategoryFilterRow(
                selectedCategory = state.selectedCategory,
                onCategoryChange = onCategoryFilterChange
            )
            MediaTypeFilterRow(
                selectedMediaType = state.selectedMediaType,
                onMediaTypeChange = onMediaTypeFilterChange
            )
            ActiveFilterTags(
                selectedCategory = state.selectedCategory,
                selectedMediaType = state.selectedMediaType,
                onCategoryClear = { onCategoryFilterChange(null) },
                onMediaTypeClear = { onMediaTypeFilterChange(null) }
            )
            
            when {
                state.isSearching -> {
                    SearchLoadingState()
                }
                state.query.isEmpty() -> {
                    if (state.recentSearches.isNotEmpty()) {
                        RecentSearchesSection(
                            recentSearches = state.recentSearches,
                            onRecentSearchClick = onRecentSearchClick,
                            onClearAll = onClearRecentSearches
                        )
                    } else {
                        SearchEmptyState()
                    }
                }
                state.results.isEmpty() && !state.isSearching -> {
                    NoResultsState(query = state.query)
                }
                else -> {
                    SearchResultsList(
                        results = state.results,
                        groupedResults = state.groupedResults,
                        onResultClick = onResultClick,
                        onCategoryFilterChange = onCategoryFilterChange,
                        onCategoryNavigate = onCategoryNavigate,
                        showGrouped = state.selectedCategory == null
                    )
                }
            }
        }
    }
}

// =============================================================================
// TOP BAR WITH SEARCH
// =============================================================================


// =============================================================================
// CATEGORY FILTERS
// =============================================================================



@Composable
private fun ActiveFilterTags(
    selectedCategory: SearchCategory?,
    selectedMediaType: MediaType?,
    onCategoryClear: () -> Unit,
    onMediaTypeClear: () -> Unit
) {
    if (selectedCategory == null && selectedMediaType == null) return

    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.XS),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        selectedCategory?.let {
            TagChip(
                label = "Category: ${it.displayName}",
                color = MaterialTheme.colorScheme.primaryContainer,
                onTextColor = MaterialTheme.colorScheme.onPrimaryContainer,
                onRemove = onCategoryClear
            )
        }
        selectedMediaType?.let {
            TagChip(
                label = "Type: ${it.name.replace('_', ' ')}",
                color = MaterialTheme.colorScheme.secondaryContainer,
                onTextColor = MaterialTheme.colorScheme.onSecondaryContainer,
                onRemove = onMediaTypeClear
            )
        }
    }
}

// =============================================================================
// RECENT SEARCHES
// =============================================================================


// =============================================================================
// SEARCH RESULTS
// =============================================================================

@Composable
private fun SearchResultsList(
    results: List<SearchResult>,
    groupedResults: Map<SearchCategory, List<SearchResult>>,
    onResultClick: (SearchResult) -> Unit,
    onCategoryFilterChange: (SearchCategory?) -> Unit,
    onCategoryNavigate: (SearchCategory) -> Unit,
    showGrouped: Boolean
) {
    if (showGrouped && groupedResults.isNotEmpty()) {
        // Grouped by category
        LazyColumn(
            contentPadding = PaddingValues(bottom = MediaSpacing.XL),
            modifier = Modifier.fillMaxSize()
        ) {
            groupedResults.forEach { (category, categoryResults) ->
                item {
                    ResultCategoryHeader(
                        category = category,
                        count = categoryResults.size
                    )
                }
                
                items(categoryResults.take(5), key = { "${it.category.name}:${it.id}" }) { result ->
                    SearchResultItem(
                        result = result,
                        onClick = { onResultClick(result) }
                    )
                }
                
                if (categoryResults.size > 5) {
                    item {
                        TextButton(
                            onClick = { 
                                onCategoryFilterChange(category)
                                onCategoryNavigate(category)
                            },
                            modifier = Modifier.padding(
                                horizontal = MediaSpacing.MD,
                                vertical = MediaSpacing.SM
                            )
                        ) {
                            Text(
                                text = "See all ${categoryResults.size} ${category.displayName.lowercase()}",
                                color = MediaColors.AccentPrimary
                            )
                        }
                    }
                }
                
                item {
                    HorizontalDivider(
                        color = MediaColors.Border,
                        modifier = Modifier.padding(vertical = MediaSpacing.SM)
                    )
                }
            }
        }
    } else {
        // Flat list
        LazyColumn(
            contentPadding = PaddingValues(bottom = MediaSpacing.XL),
            modifier = Modifier.fillMaxSize()
        ) {
            items(results, key = { "${it.category.name}:${it.id}" }) { result ->
                SearchResultItem(
                    result = result,
                    onClick = { onResultClick(result) }
                )
            }
        }
    }
}

@Composable
private fun ResultCategoryHeader(
    category: SearchCategory,
    count: Int
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = category.icon,
            contentDescription = "Media image",
            tint = category.color,
            modifier = Modifier.size(20.dp)
        )
        
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        
        Text(
            text = category.displayName,
            style = MediaTypography.TitleSmall,
            color = MediaColors.TextPrimary,
            fontWeight = FontWeight.SemiBold
        )
        
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        
        Surface(
            shape = RoundedCornerShape(MediaCorners.Full),
            color = category.color.copy(alpha = 0.2f)
        ) {
            Text(
                text = count.toString(),
                style = MediaTypography.LabelSmall,
                color = category.color,
                modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp)
            )
        }
    }
}


// =============================================================================
// STATES
// =============================================================================

@Composable
private fun SearchLoadingState() {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        CircularProgressIndicator(
            color = MediaColors.AccentPrimary,
            modifier = Modifier.size(48.dp)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        Text(
            text = "Searching...",
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary
        )
    }
}

@Composable
private fun SearchEmptyState() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Search,
            contentDescription = "Media image",
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = "Search your library",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = "Search across all your media, or explore external sources",
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
    }
}

@Composable
private fun NoResultsState(query: String) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.SearchOff,
            contentDescription = "Media image",
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = "No results for \"$query\"",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = "Try different keywords or check external sources",
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class SearchScreenState(
    val query: String = "",
    val allResults: List<SearchResult> = emptyList(),
    val results: List<SearchResult> = emptyList(),
    val groupedResults: Map<SearchCategory, List<SearchResult>> = emptyMap(),
    val recentSearches: List<String> = emptyList(),
    val selectedCategory: SearchCategory? = null,
    val selectedMediaType: MediaType? = null,
    val isSearching: Boolean = false
)

data class SearchResult(
    val id: String,
    val title: String,
    val subtitle: String?,
    val imageUrl: String?,
    val category: SearchCategory,
    val source: String?,  // e.g., "Local", "Google Books", "OPDS", etc.
    val mediaType: MediaType
)

enum class SearchCategory(
    val displayName: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color
) {
    BOOKS("Books", Icons.Default.Book, MediaColors.MediaTypes.Book),
    AUDIOBOOKS("Audiobooks", Icons.Default.Headphones, MediaColors.MediaTypes.Audiobook),
    COMICS("Comics", Icons.Default.PhotoLibrary, MediaColors.MediaTypes.Comic),
    MUSIC("Music", Icons.Default.MusicNote, MediaColors.MediaTypes.Music),
    PODCASTS("Podcasts", Icons.Default.Podcasts, MediaColors.MediaTypes.Podcast),
    MOVIES("Movies", Icons.Default.Movie, MediaColors.MediaTypes.Movie),
    TV_SHOWS("TV Shows", Icons.Default.Tv, MediaColors.MediaTypes.TvShow),
    WEB_FICTION("Web Fiction", Icons.Default.Article, MediaColors.MediaTypes.Document),
    DOCUMENTS("Documents", Icons.Default.Description, MediaColors.MediaTypes.Document)
}
