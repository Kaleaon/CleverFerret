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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

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

// =============================================================================
// TOP BAR
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun LibraryTopBar(
    title: String,
    itemCount: Int,
    mediaType: MediaType,
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit,
    onFilterClick: () -> Unit
) {
    Surface(
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.SM
    ) {
        Column {
            TopAppBar(
                title = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = mediaType.icon,
                            contentDescription = "Media image",
                            tint = mediaType.color,
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.SM))
                        Column {
                            Text(
                                text = title,
                                style = MediaTypography.TitleMedium,
                                color = MediaColors.TextPrimary
                            )
                            Text(
                                text = "$itemCount items",
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextTertiary
                            )
                        }
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(
                            imageVector = Icons.Default.ArrowBack,
                            contentDescription = "Back",
                            tint = MediaColors.TextPrimary
                        )
                    }
                },
                actions = {
                    IconButton(onClick = onSearchClick) {
                        Icon(
                            imageVector = Icons.Default.Search,
                            contentDescription = "Search",
                            tint = MediaColors.TextSecondary
                        )
                    }
                    IconButton(onClick = onFilterClick) {
                        Icon(
                            imageVector = Icons.Default.FilterList,
                            contentDescription = "Filter",
                            tint = MediaColors.TextSecondary
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
    mediaType: MediaType
) {
    val quickFilters = getQuickFiltersForMediaType(mediaType)
    
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = MediaSpacing.SM),
        contentPadding = PaddingValues(horizontal = MediaSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        items(quickFilters) { filter ->
            FilterChip(
                selected = currentFilter == filter,
                onClick = { onFilterChange(filter) },
                label = {
                    Text(
                        text = filter.displayName,
                        style = MediaTypography.LabelMedium
                    )
                },
                leadingIcon = if (currentFilter == filter) {
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
                    selectedLeadingIconColor = MediaColors.AccentPrimary,
                    containerColor = MediaColors.BackgroundElevated,
                    labelColor = MediaColors.TextSecondary
                ),
                border = FilterChipDefaults.filterChipBorder(
                    borderColor = Color.Transparent,
                    selectedBorderColor = MediaColors.AccentPrimary.copy(alpha = 0.5f),
                    enabled = true,
                    selected = currentFilter == filter
                )
            )
        }
    }
}

private fun getQuickFiltersForMediaType(mediaType: MediaType): List<LibraryFilter> {
    return when (mediaType) {
        MediaType.BOOK, MediaType.COMIC, MediaType.FANFICTION -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNREAD,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.COMPLETED,
            LibraryFilter.FAVORITES
        )
        MediaType.AUDIOBOOK -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNPLAYED,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.COMPLETED,
            LibraryFilter.FAVORITES
        )
        MediaType.MUSIC -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.RECENTLY_PLAYED,
            LibraryFilter.FAVORITES,
            LibraryFilter.DOWNLOADED
        )
        MediaType.PODCAST -> listOf(
            LibraryFilter.ALL,
            LibraryFilter.UNPLAYED,
            LibraryFilter.IN_PROGRESS,
            LibraryFilter.DOWNLOADED
        )
        MediaType.MOVIE, MediaType.TV_SHOW -> listOf(
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
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.SM),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Sort button
        TextButton(
            onClick = onSortClick,
            colors = ButtonDefaults.textButtonColors(
                contentColor = MediaColors.TextSecondary
            )
        ) {
            Icon(
                imageVector = Icons.Default.Sort,
                contentDescription = "Media image",
                modifier = Modifier.size(18.dp)
            )
            Spacer(modifier = Modifier.width(MediaSpacing.XS))
            Text(
                text = currentSort.displayName,
                style = MediaTypography.LabelMedium
            )
            Icon(
                imageVector = Icons.Default.ArrowDropDown,
                contentDescription = "Media image",
                modifier = Modifier.size(18.dp)
            )
        }
        
        // View mode toggle
        Row(
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS)
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
                            MediaColors.AccentPrimary 
                        else 
                            MediaColors.TextTertiary,
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
private fun LibraryListItem(
    item: MediaItem,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Thumbnail
        Surface(
            modifier = Modifier
                .size(72.dp, 108.dp)
                .clip(RoundedCornerShape(MediaCorners.SM)),
            color = MediaColors.BackgroundSurface
        ) {
            if (item.imageUrl != null) {
                AsyncImage(
                    
                    model = item.imageUrl,
                    contentDescription = "Media image",
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
            } else {
                Box(
                    contentAlignment = Alignment.Center,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = "Media image",
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
                        .padding(MediaSpacing.XS),
                    contentAlignment = Alignment.BottomCenter
                ) {
                    LinearProgressIndicator(
                        progress = { item.progress },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(3.dp)
                            .clip(RoundedCornerShape(MediaCorners.Full)),
                        color = MediaColors.AccentPrimary,
                        trackColor = MediaColors.ProgressBackground
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        // Info
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = item.title,
                style = MediaTypography.BodyLarge,
                color = MediaColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            item.subtitle?.let { subtitle ->
                Text(
                    text = subtitle,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.XS))
            
            // Metadata row
            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                verticalAlignment = Alignment.CenterVertically
            ) {
                item.rating?.let { rating ->
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.Star,
                            contentDescription = "Media image",
                            modifier = Modifier.size(14.dp),
                            tint = MediaColors.Warning
                        )
                        Spacer(modifier = Modifier.width(2.dp))
                        Text(
                            text = "%.1f".format(rating),
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }
                }
                
                item.year?.let { year ->
                    Text(
                        text = year.toString(),
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                item.duration?.let { duration ->
                    Text(
                        text = duration,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
        }
        
        // Action button
        IconButton(onClick = onClick) {
            Icon(
                imageVector = if (item.progress > 0) Icons.Default.PlayArrow else Icons.Default.ChevronRight,
                contentDescription = "Media image",
                tint = if (item.progress > 0) MediaColors.AccentPrimary else MediaColors.TextTertiary
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

@Composable
private fun LibraryEmptyState(
    mediaType: MediaType,
    hasFilter: Boolean
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
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
                contentDescription = "Media image",
                modifier = Modifier
                    .padding(MediaSpacing.LG)
                    .fillMaxSize(),
                tint = mediaType.color.copy(alpha = 0.5f)
            )
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = if (hasFilter) "No matching items" else "Your library is empty",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = if (hasFilter) 
                "Try adjusting your filters" 
            else 
                "Add some ${mediaType.name.lowercase().replace("_", " ")}s to get started",
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary
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
        containerColor = MediaColors.BackgroundElevated,
        contentColor = MediaColors.TextPrimary
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD)
        ) {
            Text(
                text = "Filter Library",
                style = MediaTypography.TitleMedium,
                color = MediaColors.TextPrimary,
                modifier = Modifier.padding(bottom = MediaSpacing.MD)
            )
            
            availableFilters.forEach { group ->
                Text(
                    text = group.title,
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.padding(vertical = MediaSpacing.SM)
                )
                
                FlowRowWrapper(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                    verticalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                ) {
                    group.filters.forEach { filter ->
                        FilterChip(
                            selected = currentFilter == filter,
                            onClick = { onFilterChange(filter) },
                            label = { Text(filter.displayName) },
                            colors = FilterChipDefaults.filterChipColors(
                                selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                                selectedLabelColor = MediaColors.AccentPrimary
                            )
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
        }
    }
}

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
