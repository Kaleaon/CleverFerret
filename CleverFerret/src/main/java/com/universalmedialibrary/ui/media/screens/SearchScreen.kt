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
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.SM
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(
                    horizontal = MediaSpacing.SM,
                    vertical = MediaSpacing.SM
                ),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextSecondary
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
                        color = MediaColors.TextTertiary
                    )
                },
                leadingIcon = {
                    Icon(
                        imageVector = Icons.Default.Search,
                        contentDescription = "Media image",
                        tint = MediaColors.TextTertiary
                    )
                },
                trailingIcon = {
                    Row {
                        if (query.isNotEmpty()) {
                            IconButton(onClick = onClear) {
                                Icon(
                                    imageVector = Icons.Default.Close,
                                    contentDescription = "Clear",
                                    tint = MediaColors.TextSecondary
                                )
                            }
                        }
                        IconButton(onClick = onVoiceSearch) {
                            Icon(
                                imageVector = Icons.Default.Mic,
                                contentDescription = "Voice search",
                                tint = MediaColors.TextSecondary
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
                    focusedBorderColor = MediaColors.AccentPrimary,
                    unfocusedBorderColor = MediaColors.Border,
                    focusedTextColor = MediaColors.TextPrimary,
                    unfocusedTextColor = MediaColors.TextPrimary,
                    cursorColor = MediaColors.AccentPrimary
                ),
                shape = RoundedCornerShape(MediaCorners.Full)
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
        contentPadding = PaddingValues(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
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
                            contentDescription = "Media image",
                            modifier = Modifier.size(18.dp)
                        )
                    }
                } else null,
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                    selectedLabelColor = MediaColors.AccentPrimary,
                    containerColor = MediaColors.BackgroundElevated
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
                        contentDescription = "Media image",
                        modifier = Modifier.size(18.dp),
                        tint = if (selectedCategory == category)
                            category.color
                        else
                            MediaColors.TextSecondary
                    )
                },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = category.color.copy(alpha = 0.2f),
                    selectedLabelColor = category.color,
                    selectedLeadingIconColor = category.color,
                    containerColor = MediaColors.BackgroundElevated
                )
            )
        }
    }
}

@Composable
private fun MediaTypeFilterRow(
    selectedMediaType: MediaType?,
    onMediaTypeChange: (MediaType?) -> Unit
) {
    val availableTypes = remember {
        listOf(
            MediaType.BOOK,
            MediaType.AUDIOBOOK,
            MediaType.COMIC,
            MediaType.MUSIC,
            MediaType.PODCAST,
            MediaType.MOVIE,
            MediaType.TV_SHOW,
            MediaType.DOCUMENT,
            MediaType.FANFICTION
        )
    }
    val actionColor = MaterialTheme.colorScheme.primary
    val borderColor = MaterialTheme.colorScheme.outline

    LazyRow(
        contentPadding = PaddingValues(horizontal = MediaSpacing.MD, vertical = MediaSpacing.XS),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        item {
            FilterChip(
                selected = selectedMediaType == null,
                onClick = { onMediaTypeChange(null) },
                label = { Text("Any media type") },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = actionColor.copy(alpha = 0.16f),
                    selectedLabelColor = actionColor,
                    selectedLeadingIconColor = actionColor,
                    containerColor = MediaColors.BackgroundElevated
                ),
                border = FilterChipDefaults.filterChipBorder(
                    enabled = true,
                    selected = selectedMediaType == null,
                    borderColor = borderColor,
                    selectedBorderColor = actionColor
                )
            )
        }
        items(availableTypes) { mediaType ->
            FilterChip(
                selected = selectedMediaType == mediaType,
                onClick = { onMediaTypeChange(mediaType) },
                label = { Text(mediaType.name.replace('_', ' ')) },
                leadingIcon = {
                    Icon(
                        imageVector = mediaType.icon,
                        contentDescription = "Media image",
                        modifier = Modifier.size(18.dp)
                    )
                },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = actionColor.copy(alpha = 0.16f),
                    selectedLabelColor = actionColor,
                    selectedLeadingIconColor = actionColor,
                    containerColor = MediaColors.BackgroundElevated
                ),
                border = FilterChipDefaults.filterChipBorder(
                    enabled = true,
                    selected = selectedMediaType == mediaType,
                    borderColor = borderColor,
                    selectedBorderColor = actionColor
                )
            )
        }
    }
}

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
                .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Recent Searches",
                style = MediaTypography.TitleSmall,
                color = MediaColors.TextSecondary
            )
            
            TextButton(onClick = onClearAll) {
                Text(
                    text = "Clear",
                    color = MediaColors.AccentSecondary
                )
            }
        }
        
        recentSearches.forEach { search ->
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onRecentSearchClick(search) }
                    .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = Icons.Default.History,
                    contentDescription = "Media image",
                    tint = MediaColors.TextTertiary,
                    modifier = Modifier.size(20.dp)
                )
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
                
                Text(
                    text = search,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    modifier = Modifier.weight(1f)
                )
                
                Icon(
                    imageVector = Icons.Default.NorthWest,
                    contentDescription = "Use this search",
                    tint = MediaColors.TextTertiary,
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

@Composable
private fun SearchResultItem(
    result: SearchResult,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
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
                        SearchCategory.MUSIC -> RoundedCornerShape(MediaCorners.SM)
                        else -> RoundedCornerShape(MediaCorners.XS)
                    }
                ),
            color = MediaColors.BackgroundSurface
        ) {
            if (result.imageUrl != null) {
                AsyncImage(
                    
                    model = result.imageUrl,
                    contentDescription = "Media image",
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = result.category.icon,
                        contentDescription = "Media image",
                        tint = result.category.color.copy(alpha = 0.5f),
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = result.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            if (result.subtitle != null) {
                Text(
                    text = result.subtitle,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            // Source badge for external results
            if (result.source != null && result.source != "Local") {
                Spacer(modifier = Modifier.height(2.dp))
                Surface(
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = MediaColors.BackgroundElevated
                ) {
                    Text(
                        text = result.source,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary,
                        modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 1.dp)
                    )
                }
            }
        }
        
        // Category indicator
        Icon(
            imageVector = result.category.icon,
            contentDescription = "Media image",
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
