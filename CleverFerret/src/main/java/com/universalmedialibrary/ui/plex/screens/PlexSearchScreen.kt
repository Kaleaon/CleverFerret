package com.universalmedialibrary.ui.plex.screens

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
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Universal Search Screen
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
fun PlexSearchScreen(
    state: SearchScreenState,
    onQueryChange: (String) -> Unit,
    onSearch: (String) -> Unit,
    onClearSearch: () -> Unit,
    onResultClick: (SearchResult) -> Unit,
    onRecentSearchClick: (String) -> Unit,
    onClearRecentSearches: () -> Unit,
    onCategoryFilterChange: (SearchCategory?) -> Unit,
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
        modifier = modifier.background(PlexColors.Background),
        containerColor = PlexColors.Background,
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SearchTopBar(
    query: String,
    onQueryChange: (String) -> Unit,
    onSearch: () -> Unit,
    onClear: () -> Unit,
    onVoiceSearch: () -> Unit,
    onBackClick: () -> Unit,
    focusRequester: FocusRequester
) {
    Surface(
        color = PlexColors.BackgroundElevated,
        tonalElevation = PlexElevation.SM
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(
                    horizontal = PlexSpacing.SM,
                    vertical = PlexSpacing.SM
                ),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = PlexColors.TextSecondary
                )
            }
            
            OutlinedTextField(
                value = query,
                onValueChange = onQueryChange,
                modifier = Modifier
                    .weight(1f)
                    .focusRequester(focusRequester),
                placeholder = {
                    Text(
                        text = "Search library & more...",
                        color = PlexColors.TextTertiary
                    )
                },
                leadingIcon = {
                    Icon(
                        imageVector = Icons.Default.Search,
                        contentDescription = null,
                        tint = PlexColors.TextTertiary
                    )
                },
                trailingIcon = {
                    Row {
                        if (query.isNotEmpty()) {
                            IconButton(onClick = onClear) {
                                Icon(
                                    imageVector = Icons.Default.Close,
                                    contentDescription = "Clear",
                                    tint = PlexColors.TextSecondary
                                )
                            }
                        }
                        IconButton(onClick = onVoiceSearch) {
                            Icon(
                                imageVector = Icons.Default.Mic,
                                contentDescription = "Voice search",
                                tint = PlexColors.TextSecondary
                            )
                        }
                    }
                },
                singleLine = true,
                keyboardOptions = KeyboardOptions(
                    imeAction = ImeAction.Search
                ),
                keyboardActions = KeyboardActions(
                    onSearch = { onSearch() }
                ),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = PlexColors.AccentPrimary,
                    unfocusedBorderColor = PlexColors.Border,
                    focusedTextColor = PlexColors.TextPrimary,
                    unfocusedTextColor = PlexColors.TextPrimary,
                    cursorColor = PlexColors.AccentPrimary
                ),
                shape = RoundedCornerShape(PlexCorners.Full)
            )
        }
    }
}

// =============================================================================
// CATEGORY FILTERS
// =============================================================================

@Composable
private fun CategoryFilterRow(
    selectedCategory: SearchCategory?,
    onCategoryChange: (SearchCategory?) -> Unit
) {
    LazyRow(
        contentPadding = PaddingValues(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM),
        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
    ) {
        item {
            FilterChip(
                selected = selectedCategory == null,
                onClick = { onCategoryChange(null) },
                label = { Text("All") },
                leadingIcon = if (selectedCategory == null) {
                    {
                        Icon(
                            imageVector = Icons.Default.Check,
                            contentDescription = null,
                            modifier = Modifier.size(18.dp)
                        )
                    }
                } else null,
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = PlexColors.AccentPrimary.copy(alpha = 0.2f),
                    selectedLabelColor = PlexColors.AccentPrimary,
                    containerColor = PlexColors.BackgroundElevated
                )
            )
        }
        
        items(SearchCategory.entries.toTypedArray()) { category ->
            FilterChip(
                selected = selectedCategory == category,
                onClick = { onCategoryChange(category) },
                label = { Text(category.displayName) },
                leadingIcon = {
                    Icon(
                        imageVector = category.icon,
                        contentDescription = null,
                        modifier = Modifier.size(18.dp),
                        tint = if (selectedCategory == category)
                            category.color
                        else
                            PlexColors.TextSecondary
                    )
                },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = category.color.copy(alpha = 0.2f),
                    selectedLabelColor = category.color,
                    selectedLeadingIconColor = category.color,
                    containerColor = PlexColors.BackgroundElevated
                )
            )
        }
    }
}

// =============================================================================
// RECENT SEARCHES
// =============================================================================

@Composable
private fun RecentSearchesSection(
    recentSearches: List<String>,
    onRecentSearchClick: (String) -> Unit,
    onClearAll: () -> Unit
) {
    Column(modifier = Modifier.fillMaxWidth()) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Recent Searches",
                style = PlexTypography.TitleSmall,
                color = PlexColors.TextSecondary
            )
            
            TextButton(onClick = onClearAll) {
                Text(
                    text = "Clear",
                    color = PlexColors.AccentSecondary
                )
            }
        }
        
        recentSearches.forEach { search ->
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onRecentSearchClick(search) }
                    .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = Icons.Default.History,
                    contentDescription = null,
                    tint = PlexColors.TextTertiary,
                    modifier = Modifier.size(20.dp)
                )
                
                Spacer(modifier = Modifier.width(PlexSpacing.MD))
                
                Text(
                    text = search,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextPrimary,
                    modifier = Modifier.weight(1f)
                )
                
                Icon(
                    imageVector = Icons.Default.NorthWest,
                    contentDescription = "Use this search",
                    tint = PlexColors.TextTertiary,
                    modifier = Modifier.size(16.dp)
                )
            }
        }
    }
}

// =============================================================================
// SEARCH RESULTS
// =============================================================================

@Composable
private fun SearchResultsList(
    results: List<SearchResult>,
    groupedResults: Map<SearchCategory, List<SearchResult>>,
    onResultClick: (SearchResult) -> Unit,
    showGrouped: Boolean
) {
    if (showGrouped && groupedResults.isNotEmpty()) {
        // Grouped by category
        LazyColumn(
            contentPadding = PaddingValues(bottom = PlexSpacing.XL),
            modifier = Modifier.fillMaxSize()
        ) {
            groupedResults.forEach { (category, categoryResults) ->
                item {
                    ResultCategoryHeader(
                        category = category,
                        count = categoryResults.size
                    )
                }
                
                items(categoryResults.take(5)) { result ->
                    SearchResultItem(
                        result = result,
                        onClick = { onResultClick(result) }
                    )
                }
                
                if (categoryResults.size > 5) {
                    item {
                        TextButton(
                            onClick = { 
                                // TODO: Navigate to category-filtered results screen
                                // onNavigateToCategoryResults(category, query)
                            },
                            modifier = Modifier.padding(
                                horizontal = PlexSpacing.MD,
                                vertical = PlexSpacing.SM
                            )
                        ) {
                            Text(
                                text = "See all ${categoryResults.size} ${category.displayName.lowercase()}",
                                color = PlexColors.AccentPrimary
                            )
                        }
                    }
                }
                
                item {
                    HorizontalDivider(
                        color = PlexColors.Border,
                        modifier = Modifier.padding(vertical = PlexSpacing.SM)
                    )
                }
            }
        }
    } else {
        // Flat list
        LazyColumn(
            contentPadding = PaddingValues(bottom = PlexSpacing.XL),
            modifier = Modifier.fillMaxSize()
        ) {
            items(results) { result ->
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
            .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = category.icon,
            contentDescription = null,
            tint = category.color,
            modifier = Modifier.size(20.dp)
        )
        
        Spacer(modifier = Modifier.width(PlexSpacing.SM))
        
        Text(
            text = category.displayName,
            style = PlexTypography.TitleSmall,
            color = PlexColors.TextPrimary,
            fontWeight = FontWeight.SemiBold
        )
        
        Spacer(modifier = Modifier.width(PlexSpacing.SM))
        
        Surface(
            shape = RoundedCornerShape(PlexCorners.Full),
            color = category.color.copy(alpha = 0.2f)
        ) {
            Text(
                text = count.toString(),
                style = PlexTypography.LabelSmall,
                color = category.color,
                modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = 2.dp)
            )
        }
    }
}

@Composable
private fun SearchResultItem(
    result: SearchResult,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Thumbnail
        Surface(
            modifier = Modifier
                .size(
                    width = when (result.category) {
                        SearchCategory.MUSIC, SearchCategory.PODCASTS -> 56.dp
                        else -> 42.dp
                    },
                    height = when (result.category) {
                        SearchCategory.MOVIES, SearchCategory.TV_SHOWS -> 63.dp
                        SearchCategory.MUSIC, SearchCategory.PODCASTS -> 56.dp
                        else -> 63.dp
                    }
                )
                .clip(
                    when (result.category) {
                        SearchCategory.MUSIC -> RoundedCornerShape(PlexCorners.SM)
                        else -> RoundedCornerShape(PlexCorners.XS)
                    }
                ),
            color = PlexColors.BackgroundSurface
        ) {
            if (result.imageUrl != null) {
                AsyncImage(
                    model = result.imageUrl,
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = result.category.icon,
                        contentDescription = null,
                        tint = result.category.color.copy(alpha = 0.5f),
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(PlexSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = result.title,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            if (result.subtitle != null) {
                Text(
                    text = result.subtitle,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            // Source badge for external results
            if (result.source != null && result.source != "Local") {
                Spacer(modifier = Modifier.height(2.dp))
                Surface(
                    shape = RoundedCornerShape(PlexCorners.XS),
                    color = PlexColors.BackgroundElevated
                ) {
                    Text(
                        text = result.source,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary,
                        modifier = Modifier.padding(horizontal = PlexSpacing.XS, vertical = 1.dp)
                    )
                }
            }
        }
        
        // Category indicator
        Icon(
            imageVector = result.category.icon,
            contentDescription = null,
            tint = result.category.color,
            modifier = Modifier.size(16.dp)
        )
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
            color = PlexColors.AccentPrimary,
            modifier = Modifier.size(48.dp)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.MD))
        
        Text(
            text = "Searching...",
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary
        )
    }
}

@Composable
private fun SearchEmptyState() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(PlexSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Search,
            contentDescription = null,
            tint = PlexColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Text(
            text = "Search your library",
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = "Search across all your media, or explore external sources",
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
    }
}

@Composable
private fun NoResultsState(query: String) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(PlexSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.SearchOff,
            contentDescription = null,
            tint = PlexColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Text(
            text = "No results for \"$query\"",
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = "Try different keywords or check external sources",
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class SearchScreenState(
    val query: String = "",
    val results: List<SearchResult> = emptyList(),
    val groupedResults: Map<SearchCategory, List<SearchResult>> = emptyMap(),
    val recentSearches: List<String> = emptyList(),
    val selectedCategory: SearchCategory? = null,
    val isSearching: Boolean = false
)

data class SearchResult(
    val id: String,
    val title: String,
    val subtitle: String?,
    val imageUrl: String?,
    val category: SearchCategory,
    val source: String?,  // e.g., "Local", "Google Books", "OPDS", etc.
    val mediaType: PlexMediaType
)

enum class SearchCategory(
    val displayName: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color
) {
    BOOKS("Books", Icons.Default.Book, PlexColors.MediaBook),
    AUDIOBOOKS("Audiobooks", Icons.Default.Headphones, PlexColors.MediaAudiobook),
    COMICS("Comics", Icons.Default.PhotoLibrary, PlexColors.MediaComic),
    MUSIC("Music", Icons.Default.MusicNote, PlexColors.MediaMusic),
    PODCASTS("Podcasts", Icons.Default.Podcasts, PlexColors.MediaPodcast),
    MOVIES("Movies", Icons.Default.Movie, PlexColors.MediaMovie),
    TV_SHOWS("TV Shows", Icons.Default.Tv, PlexColors.MediaTVShow),
    WEB_FICTION("Web Fiction", Icons.Default.Article, PlexColors.MediaDocument),
    DOCUMENTS("Documents", Icons.Default.Description, PlexColors.MediaDocument)
}
