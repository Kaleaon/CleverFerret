package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

data class LibraryMediaTypeOption(
    val routeType: String,
    val label: String,
    val mediaType: MediaType
)

/**
 * Clean Media-Centric Library Screen
 * 
 * A unified library screen that adapts to all media types:
 * - Books, Audiobooks, Comics
 * - Music (Albums, Artists, Tracks)
 * - Movies, TV Shows
 * - Podcasts
 * - Web Fiction / Fanfiction
 * - Documents
 * 
 * Features:
 * - Multiple view modes (grid, list, compact)
 * - Sorting and filtering
 * - Search within library
 * - Quick filters (unread, in progress, favorites)
 * - Bulk selection and actions
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaLibraryScreen(
    state: LibraryScreenState,
    mediaTypeOptions: List<LibraryMediaTypeOption>,
    currentMediaTypeRoute: String,
    onMediaTypeSelected: (String) -> Unit,
    onItemClick: (MediaItem) -> Unit,
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit,
    onFilterChange: (LibraryFilter) -> Unit,
    onSortChange: (LibrarySortOption) -> Unit,
    onViewModeChange: (LibraryViewMode) -> Unit,
    onRefresh: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showSortMenu by remember { mutableStateOf(false) }
    var showFilterSheet by remember { mutableStateOf(false) }
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            LibraryTopBar(
                title = state.libraryTitle,
                itemCount = state.totalItems,
                mediaType = state.mediaType,
                onBackClick = onBackClick,
                onSearchClick = onSearchClick,
                onFilterClick = { showFilterSheet = true }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            MediaTypeChipsRow(
                mediaTypeOptions = mediaTypeOptions,
                currentMediaTypeRoute = currentMediaTypeRoute,
                onMediaTypeSelected = onMediaTypeSelected
            )

            // Quick filters row
            QuickFiltersRow(
                currentFilter = state.currentFilter,
                onFilterChange = onFilterChange,
                mediaType = state.mediaType
            )
            
            // Sort and view controls
            SortAndViewControls(
                currentSort = state.sortOption,
                currentViewMode = state.viewMode,
                onSortClick = { showSortMenu = true },
                onViewModeChange = onViewModeChange
            )
            
            // Content
            when {
                state.isLoading -> {
                    LibraryLoadingState(viewMode = state.viewMode)
                }
                state.items.isEmpty() -> {
                    LibraryEmptyState(
                        mediaType = state.mediaType,
                        hasFilter = state.currentFilter != LibraryFilter.ALL
                    )
                }
                else -> {
                    LibraryContent(
                        items = state.items,
                        viewMode = state.viewMode,
                        mediaType = state.mediaType,
                        onItemClick = onItemClick
                    )
                }
            }
        }
        
        // Sort menu dropdown
        DropdownMenu(
            expanded = showSortMenu,
            onDismissRequest = { showSortMenu = false }
        ) {
            LibrarySortOption.entries.forEach { option ->
                DropdownMenuItem(
                    text = {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            if (state.sortOption == option) {
                                Icon(
                                    imageVector = Icons.Default.Check,
                                    contentDescription = "Media image",
                                    tint = MediaColors.AccentPrimary,
                                    modifier = Modifier.size(20.dp)
                                )
                                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                            }
                            Text(
                                text = option.displayName,
                                color = if (state.sortOption == option) 
                                    MediaColors.AccentPrimary 
                                else 
                                    MediaColors.TextPrimary
                            )
                        }
                    },
                    onClick = {
                        onSortChange(option)
                        showSortMenu = false
                    }
                )
            }
        }
        
        // Filter bottom sheet
        if (showFilterSheet) {
            FilterBottomSheet(
                currentFilter = state.currentFilter,
                availableFilters = state.availableFilters,
                onFilterChange = {
                    onFilterChange(it)
                    showFilterSheet = false
                },
                onDismiss = { showFilterSheet = false }
            )
        }
    }
}

@Composable
private fun MediaTypeChipsRow(
    mediaTypeOptions: List<LibraryMediaTypeOption>,
    currentMediaTypeRoute: String,
    onMediaTypeSelected: (String) -> Unit
) {
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = MediaSpacing.SM),
        contentPadding = PaddingValues(horizontal = MediaSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        items(mediaTypeOptions) { option ->
            val selected = currentMediaTypeRoute == option.routeType
            FilterChip(
                selected = selected,
                onClick = { onMediaTypeSelected(option.routeType) },
                label = { Text(option.label) },
                leadingIcon = {
                    Icon(
                        imageVector = option.mediaType.icon,
                        contentDescription = option.label,
                        modifier = Modifier.size(16.dp)
                    )
                },
                modifier = Modifier.semantics {
                    contentDescription = "Library type ${option.label}"
                }
            )
        }
    }
}

// =============================================================================
// TOP BAR
// =============================================================================


// =============================================================================
// QUICK FILTERS
// =============================================================================



// =============================================================================
// SORT AND VIEW CONTROLS
// =============================================================================


// =============================================================================
// LIBRARY CONTENT
// =============================================================================

@Composable
private fun LibraryContent(
    items: List<MediaItem>,
    viewMode: LibraryViewMode,
    mediaType: MediaType,
    onItemClick: (MediaItem) -> Unit
) {
    when (viewMode) {
        LibraryViewMode.GRID -> {
            LibraryGridView(
                items = items,
                mediaType = mediaType,
                onItemClick = onItemClick
            )
        }
        LibraryViewMode.LIST -> {
            LibraryListView(
                items = items,
                onItemClick = onItemClick
            )
        }
        LibraryViewMode.COMPACT -> {
            LibraryCompactView(
                items = items,
                onItemClick = onItemClick
            )
        }
    }
}

@Composable
private fun LibraryGridView(
    items: List<MediaItem>,
    mediaType: MediaType,
    onItemClick: (MediaItem) -> Unit
) {
    val columns = when (mediaType) {
        MediaType.MUSIC, MediaType.PODCAST, MediaType.RADIO -> 3
        else -> 3
    }
    
    LazyVerticalGrid(
        columns = GridCells.Fixed(columns),
        contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items) { item ->
            when (mediaType) {
                MediaType.MUSIC, MediaType.PODCAST, MediaType.RADIO -> {
                    MediaSquareCard(
                        item = item,
                        onClick = { onItemClick(item) },
                        size = 120.dp
                    )
                }
                else -> {
                    MediaPosterCard(
                        item = item,
                        onClick = { onItemClick(item) },
                        width = 110.dp
                    )
                }
            }
        }
    }
}

@Composable
private fun LibraryListView(
    items: List<MediaItem>,
    onItemClick: (MediaItem) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items) { item ->
            LibraryListItem(
                item = item,
                onClick = { onItemClick(item) }
            )
        }
    }
}


@Composable
private fun LibraryCompactView(
    items: List<MediaItem>,
    onItemClick: (MediaItem) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items) { item ->
            MediaListItem(
                item = item,
                onClick = { onItemClick(item) },
                showImage = true,
                showProgress = true
            )
        }
    }
}

// =============================================================================
// LOADING & EMPTY STATES
// =============================================================================

@Composable
private fun LibraryLoadingState(viewMode: LibraryViewMode) {
    when (viewMode) {
        LibraryViewMode.GRID -> {
            LazyVerticalGrid(
                columns = GridCells.Fixed(3),
                contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG),
                modifier = Modifier.fillMaxSize()
            ) {
                items(12) {
                    MediaPosterCardSkeleton(width = 110.dp)
                }
            }
        }
        else -> {
            LazyColumn(
                contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
                verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                modifier = Modifier.fillMaxSize()
            ) {
                items(8) {
                    ListItemSkeleton()
                }
            }
        }
    }
}

@Composable
private fun ListItemSkeleton() {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Box(
            modifier = Modifier
                .size(72.dp, 108.dp)
                .clip(RoundedCornerShape(MediaCorners.SM))
                .background(MediaColors.BackgroundElevated)
        )
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Box(
                modifier = Modifier
                    .fillMaxWidth(0.7f)
                    .height(16.dp)
                    .clip(RoundedCornerShape(MediaCorners.XS))
                    .background(MediaColors.BackgroundElevated)
            )
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            Box(
                modifier = Modifier
                    .fillMaxWidth(0.5f)
                    .height(12.dp)
                    .clip(RoundedCornerShape(MediaCorners.XS))
                    .background(MediaColors.BackgroundElevated)
            )
        }
    }
}


// =============================================================================
// FILTER BOTTOM SHEET
// =============================================================================


@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun FlowRowWrapper(
    horizontalArrangement: Arrangement.Horizontal,
    verticalArrangement: Arrangement.Vertical,
    content: @Composable () -> Unit
) {
    // Use official Material3 FlowRow for proper wrapping behavior
    androidx.compose.foundation.layout.FlowRow(
        horizontalArrangement = horizontalArrangement,
        verticalArrangement = verticalArrangement,
        modifier = Modifier.fillMaxWidth()
    ) {
        content()
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class LibraryScreenState(
    val libraryTitle: String,
    val mediaType: MediaType,
    val items: List<MediaItem> = emptyList(),
    val totalItems: Int = 0,
    val currentFilter: LibraryFilter = LibraryFilter.ALL,
    val sortOption: LibrarySortOption = LibrarySortOption.RECENTLY_ADDED,
    val viewMode: LibraryViewMode = LibraryViewMode.GRID,
    val availableFilters: List<LibraryFilterGroup> = emptyList(),
    val isLoading: Boolean = false
)

enum class LibraryFilter(val displayName: String) {
    ALL("All"),
    UNREAD("Unread"),
    UNPLAYED("Unplayed"),
    UNWATCHED("Unwatched"),
    IN_PROGRESS("In Progress"),
    COMPLETED("Completed"),
    FAVORITES("Favorites"),
    RECENT("Recent"),
    RECENTLY_PLAYED("Recently Played"),
    DOWNLOADED("Downloaded")
}

enum class LibrarySortOption(val displayName: String) {
    RECENTLY_ADDED("Recently Added"),
    TITLE("Title"),
    AUTHOR("Author/Artist"),
    RATING("Rating"),
    YEAR("Year"),
    PROGRESS("Progress"),
    DURATION("Duration"),
    DATE_READ("Date Read")
}

enum class LibraryViewMode(val icon: ImageVector) {
    GRID(Icons.Default.GridView),
    LIST(Icons.Default.ViewList),
    COMPACT(Icons.Default.ViewHeadline)
}

data class LibraryFilterGroup(
    val title: String,
    val filters: List<LibraryFilter>
)
