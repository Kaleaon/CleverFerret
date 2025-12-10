package com.universalmedialibrary.ui.plex.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Library Screen
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
fun PlexLibraryScreen(
    state: LibraryScreenState,
    onItemClick: (PlexMediaItem) -> Unit,
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
        modifier = modifier.background(PlexColors.Background),
        containerColor = PlexColors.Background,
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
                                    contentDescription = null,
                                    tint = PlexColors.AccentPrimary,
                                    modifier = Modifier.size(20.dp)
                                )
                                Spacer(modifier = Modifier.width(PlexSpacing.SM))
                            }
                            Text(
                                text = option.displayName,
                                color = if (state.sortOption == option) 
                                    PlexColors.AccentPrimary 
                                else 
                                    PlexColors.TextPrimary
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

// =============================================================================
// TOP BAR
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun LibraryTopBar(
    title: String,
    itemCount: Int,
    mediaType: PlexMediaType,
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit,
    onFilterClick: () -> Unit
) {
    Surface(
        color = PlexColors.BackgroundElevated,
        tonalElevation = PlexElevation.SM
    ) {
        Column {
            TopAppBar(
                title = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = mediaType.icon,
                            contentDescription = null,
                            tint = mediaType.color,
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(PlexSpacing.SM))
                        Column {
                            Text(
                                text = title,
                                style = PlexTypography.TitleMedium,
                                color = PlexColors.TextPrimary
                            )
                            Text(
                                text = "$itemCount items",
                                style = PlexTypography.LabelSmall,
                                color = PlexColors.TextTertiary
                            )
                        }
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(
                            imageVector = Icons.Default.ArrowBack,
                            contentDescription = "Back",
                            tint = PlexColors.TextPrimary
                        )
                    }
                },
                actions = {
                    IconButton(onClick = onSearchClick) {
                        Icon(
                            imageVector = Icons.Default.Search,
                            contentDescription = "Search",
                            tint = PlexColors.TextSecondary
                        )
                    }
                    IconButton(onClick = onFilterClick) {
                        Icon(
                            imageVector = Icons.Default.FilterList,
                            contentDescription = "Filter",
                            tint = PlexColors.TextSecondary
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Color.Transparent
                )
            )
        }
    }
}

// =============================================================================
// QUICK FILTERS
// =============================================================================

@Composable
private fun QuickFiltersRow(
    currentFilter: LibraryFilter,
    onFilterChange: (LibraryFilter) -> Unit,
    mediaType: PlexMediaType
) {
    val quickFilters = getQuickFiltersForMediaType(mediaType)
    
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = PlexSpacing.SM),
        contentPadding = PaddingValues(horizontal = PlexSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
    ) {
        items(quickFilters) { filter ->
            FilterChip(
                selected = currentFilter == filter,
                onClick = { onFilterChange(filter) },
                label = {
                    Text(
                        text = filter.displayName,
                        style = PlexTypography.LabelMedium
                    )
                },
                leadingIcon = if (currentFilter == filter) {
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
                    selectedLeadingIconColor = PlexColors.AccentPrimary,
                    containerColor = PlexColors.BackgroundElevated,
                    labelColor = PlexColors.TextSecondary
                ),
                border = FilterChipDefaults.filterChipBorder(
                    borderColor = Color.Transparent,
                    selectedBorderColor = PlexColors.AccentPrimary.copy(alpha = 0.5f),
                    enabled = true,
                    selected = currentFilter == filter
                )
            )
        }
    }
}

private fun getQuickFiltersForMediaType(mediaType: PlexMediaType): List<LibraryFilter> {
    return when (mediaType) {
        PlexMediaType.BOOK, PlexMediaType.COMIC, PlexMediaType.FANFICTION -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNREAD,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.COMPLETED,
            LibraryFilter.FAVORITES
        )
        PlexMediaType.AUDIOBOOK -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNPLAYED,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.COMPLETED,
            LibraryFilter.FAVORITES
        )
        PlexMediaType.MUSIC -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.RECENTLY_PLAYED,
            LibraryFilter.FAVORITES,
            LibraryFilter.DOWNLOADED
        )
        PlexMediaType.PODCAST -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNPLAYED,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.DOWNLOADED
        )
        PlexMediaType.MOVIE, PlexMediaType.TV_SHOW -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNWATCHED,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.FAVORITES
        )
        else -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.FAVORITES,
            LibraryFilter.RECENT
        )
    }
}

// =============================================================================
// SORT AND VIEW CONTROLS
// =============================================================================

@Composable
private fun SortAndViewControls(
    currentSort: LibrarySortOption,
    currentViewMode: LibraryViewMode,
    onSortClick: () -> Unit,
    onViewModeChange: (LibraryViewMode) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.ScreenHorizontal, vertical = PlexSpacing.SM),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Sort button
        TextButton(
            onClick = onSortClick,
            colors = ButtonDefaults.textButtonColors(
                contentColor = PlexColors.TextSecondary
            )
        ) {
            Icon(
                imageVector = Icons.Default.Sort,
                contentDescription = null,
                modifier = Modifier.size(18.dp)
            )
            Spacer(modifier = Modifier.width(PlexSpacing.XS))
            Text(
                text = currentSort.displayName,
                style = PlexTypography.LabelMedium
            )
            Icon(
                imageVector = Icons.Default.ArrowDropDown,
                contentDescription = null,
                modifier = Modifier.size(18.dp)
            )
        }
        
        // View mode toggle
        Row(
            horizontalArrangement = Arrangement.spacedBy(PlexSpacing.XS)
        ) {
            LibraryViewMode.entries.forEach { mode ->
                IconButton(
                    onClick = { onViewModeChange(mode) },
                    modifier = Modifier.size(36.dp)
                ) {
                    Icon(
                        imageVector = mode.icon,
                        contentDescription = mode.name,
                        tint = if (currentViewMode == mode) 
                            PlexColors.AccentPrimary 
                        else 
                            PlexColors.TextTertiary,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}

// =============================================================================
// LIBRARY CONTENT
// =============================================================================

@Composable
private fun LibraryContent(
    items: List<PlexMediaItem>,
    viewMode: LibraryViewMode,
    mediaType: PlexMediaType,
    onItemClick: (PlexMediaItem) -> Unit
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
    items: List<PlexMediaItem>,
    mediaType: PlexMediaType,
    onItemClick: (PlexMediaItem) -> Unit
) {
    val columns = when (mediaType) {
        PlexMediaType.MUSIC, PlexMediaType.PODCAST, PlexMediaType.RADIO -> 3
        else -> 3
    }
    
    LazyVerticalGrid(
        columns = GridCells.Fixed(columns),
        contentPadding = PaddingValues(PlexSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(PlexSpacing.LG),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items) { item ->
            when (mediaType) {
                PlexMediaType.MUSIC, PlexMediaType.PODCAST, PlexMediaType.RADIO -> {
                    PlexSquareCard(
                        item = item,
                        onClick = { onItemClick(item) },
                        size = 120.dp
                    )
                }
                else -> {
                    PlexPosterCard(
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
    items: List<PlexMediaItem>,
    onItemClick: (PlexMediaItem) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(vertical = PlexSpacing.SM),
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
private fun LibraryListItem(
    item: PlexMediaItem,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = PlexSpacing.ScreenHorizontal, vertical = PlexSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Thumbnail
        Surface(
            modifier = Modifier
                .size(72.dp, 108.dp)
                .clip(RoundedCornerShape(PlexCorners.SM)),
            color = PlexColors.BackgroundSurface
        ) {
            if (item.imageUrl != null) {
                coil.compose.AsyncImage(
                    model = item.imageUrl,
                    contentDescription = null,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = androidx.compose.ui.layout.ContentScale.Crop
                )
            } else {
                Box(
                    contentAlignment = Alignment.Center,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = null,
                        tint = item.mediaType.color.copy(alpha = 0.5f),
                        modifier = Modifier.size(32.dp)
                    )
                }
            }
            
            // Progress overlay
            if (item.progress > 0) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(PlexSpacing.XS),
                    contentAlignment = Alignment.BottomCenter
                ) {
                    LinearProgressIndicator(
                        progress = { item.progress },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(3.dp)
                            .clip(RoundedCornerShape(PlexCorners.Full)),
                        color = PlexColors.AccentPrimary,
                        trackColor = PlexColors.ProgressBackground
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(PlexSpacing.MD))
        
        // Info
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = item.title,
                style = PlexTypography.BodyLarge,
                color = PlexColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            item.subtitle?.let { subtitle ->
                Text(
                    text = subtitle,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.XS))
            
            // Metadata row
            Row(
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
                verticalAlignment = Alignment.CenterVertically
            ) {
                item.rating?.let { rating ->
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.Star,
                            contentDescription = null,
                            modifier = Modifier.size(14.dp),
                            tint = PlexColors.Warning
                        )
                        Spacer(modifier = Modifier.width(2.dp))
                        Text(
                            text = "%.1f".format(rating),
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextTertiary
                        )
                    }
                }
                
                item.year?.let { year ->
                    Text(
                        text = year.toString(),
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
                
                item.duration?.let { duration ->
                    Text(
                        text = duration,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
            }
        }
        
        // Action button
        IconButton(onClick = onClick) {
            Icon(
                imageVector = if (item.progress > 0) Icons.Default.PlayArrow else Icons.Default.ChevronRight,
                contentDescription = null,
                tint = if (item.progress > 0) PlexColors.AccentPrimary else PlexColors.TextTertiary
            )
        }
    }
}

@Composable
private fun LibraryCompactView(
    items: List<PlexMediaItem>,
    onItemClick: (PlexMediaItem) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(vertical = PlexSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items) { item ->
            PlexListItem(
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
                contentPadding = PaddingValues(PlexSpacing.ScreenHorizontal),
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
                verticalArrangement = Arrangement.spacedBy(PlexSpacing.LG),
                modifier = Modifier.fillMaxSize()
            ) {
                items(12) {
                    PlexPosterCardSkeleton(width = 110.dp)
                }
            }
        }
        else -> {
            LazyColumn(
                contentPadding = PaddingValues(PlexSpacing.ScreenHorizontal),
                verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
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
            .padding(vertical = PlexSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Box(
            modifier = Modifier
                .size(72.dp, 108.dp)
                .clip(RoundedCornerShape(PlexCorners.SM))
                .background(PlexColors.BackgroundElevated)
        )
        
        Spacer(modifier = Modifier.width(PlexSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Box(
                modifier = Modifier
                    .fillMaxWidth(0.7f)
                    .height(16.dp)
                    .clip(RoundedCornerShape(PlexCorners.XS))
                    .background(PlexColors.BackgroundElevated)
            )
            
            Spacer(modifier = Modifier.height(PlexSpacing.SM))
            
            Box(
                modifier = Modifier
                    .fillMaxWidth(0.5f)
                    .height(12.dp)
                    .clip(RoundedCornerShape(PlexCorners.XS))
                    .background(PlexColors.BackgroundElevated)
            )
        }
    }
}

@Composable
private fun LibraryEmptyState(
    mediaType: PlexMediaType,
    hasFilter: Boolean
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(PlexSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Surface(
            shape = CircleShape,
            color = mediaType.color.copy(alpha = 0.1f),
            modifier = Modifier.size(96.dp)
        ) {
            Icon(
                imageVector = if (hasFilter) Icons.Outlined.FilterAlt else mediaType.icon,
                contentDescription = null,
                modifier = Modifier
                    .padding(PlexSpacing.LG)
                    .fillMaxSize(),
                tint = mediaType.color.copy(alpha = 0.5f)
            )
        }
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Text(
            text = if (hasFilter) "No matching items" else "Your library is empty",
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = if (hasFilter) 
                "Try adjusting your filters" 
            else 
                "Add some ${mediaType.name.lowercase().replace("_", " ")}s to get started",
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary
        )
    }
}

// =============================================================================
// FILTER BOTTOM SHEET
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun FilterBottomSheet(
    currentFilter: LibraryFilter,
    availableFilters: List<LibraryFilterGroup>,
    onFilterChange: (LibraryFilter) -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = PlexColors.BackgroundElevated,
        contentColor = PlexColors.TextPrimary
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(PlexSpacing.MD)
        ) {
            Text(
                text = "Filter Library",
                style = PlexTypography.TitleMedium,
                color = PlexColors.TextPrimary,
                modifier = Modifier.padding(bottom = PlexSpacing.MD)
            )
            
            availableFilters.forEach { group ->
                Text(
                    text = group.title,
                    style = PlexTypography.LabelMedium,
                    color = PlexColors.TextSecondary,
                    modifier = Modifier.padding(vertical = PlexSpacing.SM)
                )
                
                FlowRow(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM),
                    verticalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
                ) {
                    group.filters.forEach { filter ->
                        FilterChip(
                            selected = currentFilter == filter,
                            onClick = { onFilterChange(filter) },
                            label = { Text(filter.displayName) },
                            colors = FilterChipDefaults.filterChipColors(
                                selectedContainerColor = PlexColors.AccentPrimary.copy(alpha = 0.2f),
                                selectedLabelColor = PlexColors.AccentPrimary
                            )
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
        }
    }
}

@Composable
private fun FlowRow(
    horizontalArrangement: Arrangement.Horizontal,
    verticalArrangement: Arrangement.Vertical,
    content: @Composable () -> Unit
) {
    // Simple implementation - in production use accompanist FlowRow
    Row(
        horizontalArrangement = horizontalArrangement,
        modifier = Modifier.horizontalScroll(rememberScrollState())
    ) {
        content()
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class LibraryScreenState(
    val libraryTitle: String,
    val mediaType: PlexMediaType,
    val items: List<PlexMediaItem> = emptyList(),
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
