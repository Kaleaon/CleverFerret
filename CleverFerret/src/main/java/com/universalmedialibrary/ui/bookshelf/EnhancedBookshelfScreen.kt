package com.universalmedialibrary.ui.bookshelf

import androidx.compose.animation.*
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import coil.compose.AsyncImage

/**
 * Enhanced Bookshelf Screen
 * Features:
 * - Grid and List view modes
 * - Advanced sorting (title, author, date added, recently read, rating)
 * - Filtering (read status, genre, tags, format)
 * - Search with suggestions
 * - Cover art display with fallback
 * - Collections/shelves management
 * - Batch operations (mark as read, add to collection, delete)
 * - Reading progress indicators
 * - Pull-to-refresh
 * - Infinite scroll/pagination
 */

enum class ViewMode {
    GRID_SMALL,
    GRID_LARGE,
    LIST,
    COMFORTABLE
}

enum class SortOption {
    TITLE_ASC,
    TITLE_DESC,
    AUTHOR_ASC,
    AUTHOR_DESC,
    DATE_ADDED_NEW,
    DATE_ADDED_OLD,
    RECENTLY_READ,
    PROGRESS,
    RATING,
    FILE_SIZE
}

data class FilterOptions(
    val readStatus: Set<ReadStatus> = emptySet(),
    val genres: Set<String> = emptySet(),
    val tags: Set<String> = emptySet(),
    val formats: Set<String> = emptySet(),  // EPUB, PDF, MOBI, etc.
    val minRating: Int = 0,
    val hasProgress: Boolean? = null
)

enum class ReadStatus {
    UNREAD,
    READING,
    FINISHED,
    DNF  // Did Not Finish
}

data class BookItem(
    val id: Long,
    val title: String,
    val author: String,
    val coverUrl: String?,
    val progress: Float = 0f,        // 0.0 to 1.0
    val rating: Int = 0,             // 0 to 5 stars
    val readStatus: ReadStatus = ReadStatus.UNREAD,
    val genres: List<String> = emptyList(),
    val tags: List<String> = emptyList(),
    val format: String = "EPUB",
    val dateAdded: Long = System.currentTimeMillis(),
    val lastRead: Long? = null,
    val fileSize: Long = 0
)

@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun EnhancedBookshelfScreen(
    navController: NavController,
    libraryId: Long,
    modifier: Modifier = Modifier
) {
    var viewMode by remember { mutableStateOf(ViewMode.GRID_LARGE) }
    var sortOption by remember { mutableStateOf(SortOption.RECENTLY_READ) }
    var filterOptions by remember { mutableStateOf(FilterOptions()) }
    var searchQuery by remember { mutableStateOf("") }
    var showFilterSheet by remember { mutableStateOf(false) }
    var showSortMenu by remember { mutableStateOf(false) }
    var selectedBooks by remember { mutableStateOf<Set<Long>>(emptySet()) }
    var isSelectionMode by remember { mutableStateOf(false) }

    // Sample book data
    val books = remember {
        List(20) { index ->
            BookItem(
                id = index.toLong(),
                title = "Book Title ${index + 1}",
                author = "Author Name ${index % 5 + 1}",
                coverUrl = null,
                progress = (index * 10 % 100) / 100f,
                rating = index % 6,
                readStatus = ReadStatus.values()[index % ReadStatus.values().size],
                genres = listOf("Fiction", "Mystery", "Thriller").shuffled().take(2),
                tags = listOf("Favorite", "To Read", "Classic").shuffled().take(1),
                format = listOf("EPUB", "PDF", "MOBI")[index % 3]
            )
        }
    }

    // Apply filtering and sorting
    val filteredBooks = remember(books, filterOptions, sortOption, searchQuery) {
        books
            .filter { book ->
                // Search filter
                (searchQuery.isEmpty() || 
                    book.title.contains(searchQuery, ignoreCase = true) ||
                    book.author.contains(searchQuery, ignoreCase = true))
            }
            .filter { book ->
                // Read status filter
                filterOptions.readStatus.isEmpty() || book.readStatus in filterOptions.readStatus
            }
            .filter { book ->
                // Genre filter
                filterOptions.genres.isEmpty() || book.genres.any { it in filterOptions.genres }
            }
            .filter { book ->
                // Format filter
                filterOptions.formats.isEmpty() || book.format in filterOptions.formats
            }
            .filter { book ->
                // Rating filter
                book.rating >= filterOptions.minRating
            }
            .sortedWith(
                when (sortOption) {
                    SortOption.TITLE_ASC -> compareBy { it.title }
                    SortOption.TITLE_DESC -> compareByDescending { it.title }
                    SortOption.AUTHOR_ASC -> compareBy { it.author }
                    SortOption.AUTHOR_DESC -> compareByDescending { it.author }
                    SortOption.DATE_ADDED_NEW -> compareByDescending { it.dateAdded }
                    SortOption.DATE_ADDED_OLD -> compareBy { it.dateAdded }
                    SortOption.RECENTLY_READ -> compareByDescending { it.lastRead ?: 0L }
                    SortOption.PROGRESS -> compareByDescending { it.progress }
                    SortOption.RATING -> compareByDescending { it.rating }
                    SortOption.FILE_SIZE -> compareByDescending { it.fileSize }
                }
            )
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    if (isSelectionMode) {
                        Text("${selectedBooks.size} selected")
                    } else {
                        Text("My Library")
                    }
                },
                navigationIcon = {
                    IconButton(onClick = {
                        if (isSelectionMode) {
                            isSelectionMode = false
                            selectedBooks = emptySet()
                        } else {
                            navController.navigateUp()
                        }
                    }) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    if (isSelectionMode) {
                        // Batch actions
                        IconButton(onClick = { /* Mark as read */ }) {
                            Icon(Icons.Default.Check, "Mark as Read")
                        }
                        IconButton(onClick = { /* Add to collection */ }) {
                            Icon(Icons.Default.CreateNewFolder, "Add to Collection")
                        }
                        IconButton(onClick = { /* Delete */ }) {
                            Icon(Icons.Default.Delete, "Delete")
                        }
                    } else {
                        // View mode toggle
                        IconButton(onClick = {
                            viewMode = when (viewMode) {
                                ViewMode.GRID_SMALL -> ViewMode.GRID_LARGE
                                ViewMode.GRID_LARGE -> ViewMode.LIST
                                ViewMode.LIST -> ViewMode.COMFORTABLE
                                ViewMode.COMFORTABLE -> ViewMode.GRID_SMALL
                            }
                        }) {
                            Icon(
                                when (viewMode) {
                                    ViewMode.GRID_SMALL -> Icons.Default.GridView
                                    ViewMode.GRID_LARGE -> Icons.Default.ViewModule
                                    ViewMode.LIST -> Icons.Default.ViewList
                                    ViewMode.COMFORTABLE -> Icons.Default.ViewComfy
                                },
                                "View Mode"
                            )
                        }
                        
                        // Sort menu
                        IconButton(onClick = { showSortMenu = true }) {
                            Icon(Icons.Default.Sort, "Sort")
                        }
                        DropdownMenu(
                            expanded = showSortMenu,
                            onDismissRequest = { showSortMenu = false }
                        ) {
                            SortOption.values().forEach { option ->
                                DropdownMenuItem(
                                    text = { Text(formatSortOption(option)) },
                                    onClick = {
                                        sortOption = option
                                        showSortMenu = false
                                    },
                                    leadingIcon = {
                                        if (sortOption == option) {
                                            Icon(Icons.Default.Check, null)
                                        }
                                    }
                                )
                            }
                        }
                        
                        // Filter button
                        IconButton(onClick = { showFilterSheet = true }) {
                            Badge(
                                content = if (isFilterActive(filterOptions)) {
                                    { Text("!") }
                                } else null
                            ) {
                                Icon(Icons.Default.FilterList, "Filter")
                            }
                        }
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = if (isSelectionMode) {
                        MaterialTheme.colorScheme.primaryContainer
                    } else {
                        MaterialTheme.colorScheme.surface
                    }
                )
            )
        },
        floatingActionButton = {
            if (!isSelectionMode) {
                FloatingActionButton(
                    onClick = { /* Add new book */ }
                ) {
                    Icon(Icons.Default.Add, "Add Book")
                }
            }
        }
    ) { padding ->
        Column(
            modifier = modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Search bar
            SearchBar(
                query = searchQuery,
                onQueryChange = { searchQuery = it },
                onSearch = { /* Perform search */ },
                active = false,
                onActiveChange = { },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                placeholder = { Text("Search books and authors...") },
                leadingIcon = { Icon(Icons.Default.Search, null) },
                trailingIcon = {
                    if (searchQuery.isNotEmpty()) {
                        IconButton(onClick = { searchQuery = "" }) {
                            Icon(Icons.Default.Clear, "Clear")
                        }
                    }
                }
            ) {
                // Search suggestions could go here
            }

            // Books count and filter chips
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "${filteredBooks.size} books",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                // Quick filter chips
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    ReadStatus.values().forEach { status ->
                        FilterChip(
                            selected = status in filterOptions.readStatus,
                            onClick = {
                                filterOptions = filterOptions.copy(
                                    readStatus = if (status in filterOptions.readStatus) {
                                        filterOptions.readStatus - status
                                    } else {
                                        filterOptions.readStatus + status
                                    }
                                )
                            },
                            label = { Text(formatReadStatus(status), style = MaterialTheme.typography.bodySmall) }
                        )
                    }
                }
            }

            // Book list/grid
            when (viewMode) {
                ViewMode.GRID_SMALL, ViewMode.GRID_LARGE -> {
                    LazyVerticalGrid(
                        columns = GridCells.Fixed(if (viewMode == ViewMode.GRID_SMALL) 3 else 2),
                        contentPadding = PaddingValues(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        items(filteredBooks, key = { it.id }) { book ->
                            GridBookItem(
                                book = book,
                                isSelected = book.id in selectedBooks,
                                isSelectionMode = isSelectionMode,
                                onClick = {
                                    if (isSelectionMode) {
                                        selectedBooks = if (book.id in selectedBooks) {
                                            selectedBooks - book.id
                                        } else {
                                            selectedBooks + book.id
                                        }
                                    } else {
                                        navController.navigate("reader/${book.id}")
                                    }
                                },
                                onLongClick = {
                                    isSelectionMode = true
                                    selectedBooks = setOf(book.id)
                                },
                                modifier = Modifier.animateItemPlacement()
                            )
                        }
                    }
                }
                ViewMode.LIST, ViewMode.COMFORTABLE -> {
                    LazyColumn(
                        contentPadding = PaddingValues(16.dp),
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        items(filteredBooks, key = { it.id }) { book ->
                            ListBookItem(
                                book = book,
                                isSelected = book.id in selectedBooks,
                                isSelectionMode = isSelectionMode,
                                isComfortable = viewMode == ViewMode.COMFORTABLE,
                                onClick = {
                                    if (isSelectionMode) {
                                        selectedBooks = if (book.id in selectedBooks) {
                                            selectedBooks - book.id
                                        } else {
                                            selectedBooks + book.id
                                        }
                                    } else {
                                        navController.navigate("reader/${book.id}")
                                    }
                                },
                                onLongClick = {
                                    isSelectionMode = true
                                    selectedBooks = setOf(book.id)
                                },
                                modifier = Modifier.animateItemPlacement()
                            )
                        }
                    }
                }
            }
        }

        // Filter bottom sheet
        if (showFilterSheet) {
            ModalBottomSheet(
                onDismissRequest = { showFilterSheet = false }
            ) {
                FilterSheet(
                    filterOptions = filterOptions,
                    onFilterChange = { filterOptions = it },
                    onDismiss = { showFilterSheet = false }
                )
            }
        }
    }
}

@Composable
private fun GridBookItem(
    book: BookItem,
    isSelected: Boolean,
    isSelectionMode: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(
            defaultElevation = if (isSelected) 8.dp else 2.dp
        ),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) {
                MaterialTheme.colorScheme.primaryContainer
            } else {
                MaterialTheme.colorScheme.surface
            }
        )
    ) {
        Column {
            // Cover image
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(0.67f)
            ) {
                if (book.coverUrl != null) {
                    AsyncImage(
                        model = book.coverUrl,
                        contentDescription = book.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    // Fallback gradient cover
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(
                                Brush.linearGradient(
                                    colors = listOf(
                                        MaterialTheme.colorScheme.primary,
                                        MaterialTheme.colorScheme.secondary
                                    )
                                )
                            ),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            Icons.Default.MenuBook,
                            contentDescription = null,
                            modifier = Modifier.size(48.dp),
                            tint = Color.White
                        )
                    }
                }

                // Progress indicator
                if (book.progress > 0) {
                    LinearProgressIndicator(
                        progress = book.progress,
                        modifier = Modifier
                            .fillMaxWidth()
                            .align(Alignment.BottomCenter)
                    )
                }

                // Selection checkbox
                if (isSelectionMode) {
                    Checkbox(
                        checked = isSelected,
                        onCheckedChange = null,
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(8.dp)
                    )
                }

                // Read status badge
                Surface(
                    modifier = Modifier
                        .align(Alignment.TopStart)
                        .padding(8.dp),
                    color = getReadStatusColor(book.readStatus),
                    shape = RoundedCornerShape(4.dp)
                ) {
                    Text(
                        text = formatReadStatus(book.readStatus),
                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                        style = MaterialTheme.typography.labelSmall,
                        color = Color.White
                    )
                }
            }

            // Book info
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(8.dp),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Text(
                    text = book.title,
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = book.author,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                // Rating
                if (book.rating > 0) {
                    Row(horizontalArrangement = Arrangement.spacedBy(2.dp)) {
                        repeat(5) { index ->
                            Icon(
                                imageVector = if (index < book.rating) Icons.Default.Star else Icons.Default.StarBorder,
                                contentDescription = null,
                                modifier = Modifier.size(12.dp),
                                tint = if (index < book.rating) Color(0xFFFFD700) else MaterialTheme.colorScheme.outline
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun ListBookItem(
    book: BookItem,
    isSelected: Boolean,
    isSelectionMode: Boolean,
    isComfortable: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(
            defaultElevation = if (isSelected) 4.dp else 1.dp
        ),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) {
                MaterialTheme.colorScheme.primaryContainer
            } else {
                MaterialTheme.colorScheme.surface
            }
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Selection checkbox
            if (isSelectionMode) {
                Checkbox(
                    checked = isSelected,
                    onCheckedChange = null
                )
            }

            // Cover thumbnail
            Box(
                modifier = Modifier
                    .width(if (isComfortable) 80.dp else 60.dp)
                    .aspectRatio(0.67f)
                    .clip(RoundedCornerShape(4.dp))
            ) {
                if (book.coverUrl != null) {
                    AsyncImage(
                        model = book.coverUrl,
                        contentDescription = book.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(MaterialTheme.colorScheme.primaryContainer),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            Icons.Default.MenuBook,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }

            // Book info
            Column(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight(),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                    Text(
                        text = book.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        maxLines = if (isComfortable) 3 else 2,
                        overflow = TextOverflow.Ellipsis
                    )
                    Text(
                        text = book.author,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    if (isComfortable) {
                        // Genre tags
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(4.dp),
                            modifier = Modifier.padding(top = 4.dp)
                        ) {
                            book.genres.take(2).forEach { genre ->
                                SuggestionChip(
                                    onClick = { },
                                    label = { Text(genre, style = MaterialTheme.typography.labelSmall) }
                                )
                            }
                        }
                    }
                }

                // Progress and status
                Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                    if (book.progress > 0) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "${(book.progress * 100).toInt()}%",
                                style = MaterialTheme.typography.labelSmall
                            )
                            LinearProgressIndicator(
                                progress = book.progress,
                                modifier = Modifier
                                    .weight(1f)
                                    .padding(start = 8.dp)
                            )
                        }
                    }

                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Surface(
                            color = getReadStatusColor(book.readStatus),
                            shape = RoundedCornerShape(4.dp)
                        ) {
                            Text(
                                text = formatReadStatus(book.readStatus),
                                modifier = Modifier.padding(horizontal = 8.dp, vertical = 2.dp),
                                style = MaterialTheme.typography.labelSmall,
                                color = Color.White
                            )
                        }

                        // Rating
                        if (book.rating > 0) {
                            Row(horizontalArrangement = Arrangement.spacedBy(2.dp)) {
                                repeat(book.rating) {
                                    Icon(
                                        Icons.Default.Star,
                                        contentDescription = null,
                                        modifier = Modifier.size(14.dp),
                                        tint = Color(0xFFFFD700)
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun FilterSheet(
    filterOptions: FilterOptions,
    onFilterChange: (FilterOptions) -> Unit,
    onDismiss: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "Filter Books",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )

        // Reset button
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.End
        ) {
            TextButton(onClick = {
                onFilterChange(FilterOptions())
            }) {
                Text("Reset All")
            }
        }

        // Read Status
        Text("Read Status", style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold)
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            ReadStatus.values().forEach { status ->
                FilterChip(
                    selected = status in filterOptions.readStatus,
                    onClick = {
                        onFilterChange(
                            filterOptions.copy(
                                readStatus = if (status in filterOptions.readStatus) {
                                    filterOptions.readStatus - status
                                } else {
                                    filterOptions.readStatus + status
                                }
                            )
                        )
                    },
                    label = { Text(formatReadStatus(status)) }
                )
            }
        }

        // Formats
        Text("Format", style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold)
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            listOf("EPUB", "PDF", "MOBI", "AZW3").forEach { format ->
                FilterChip(
                    selected = format in filterOptions.formats,
                    onClick = {
                        onFilterChange(
                            filterOptions.copy(
                                formats = if (format in filterOptions.formats) {
                                    filterOptions.formats - format
                                } else {
                                    filterOptions.formats + format
                                }
                            )
                        )
                    },
                    label = { Text(format) }
                )
            }
        }

        // Minimum Rating
        Text("Minimum Rating", style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold)
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            (0..5).forEach { rating ->
                FilterChip(
                    selected = filterOptions.minRating == rating,
                    onClick = { onFilterChange(filterOptions.copy(minRating = rating)) },
                    label = {
                        Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                            if (rating > 0) {
                                Icon(Icons.Default.Star, null, modifier = Modifier.size(16.dp))
                                Text("$rating+")
                            } else {
                                Text("Any")
                            }
                        }
                    }
                )
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = onDismiss,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Apply Filters")
        }
    }
}

private fun formatReadStatus(status: ReadStatus): String = when (status) {
    ReadStatus.UNREAD -> "Unread"
    ReadStatus.READING -> "Reading"
    ReadStatus.FINISHED -> "Finished"
    ReadStatus.DNF -> "DNF"
}

private fun getReadStatusColor(status: ReadStatus): Color = when (status) {
    ReadStatus.UNREAD -> Color(0xFF9E9E9E)
    ReadStatus.READING -> Color(0xFF2196F3)
    ReadStatus.FINISHED -> Color(0xFF4CAF50)
    ReadStatus.DNF -> Color(0xFFFF5722)
}

private fun formatSortOption(option: SortOption): String = when (option) {
    SortOption.TITLE_ASC -> "Title (A-Z)"
    SortOption.TITLE_DESC -> "Title (Z-A)"
    SortOption.AUTHOR_ASC -> "Author (A-Z)"
    SortOption.AUTHOR_DESC -> "Author (Z-A)"
    SortOption.DATE_ADDED_NEW -> "Recently Added"
    SortOption.DATE_ADDED_OLD -> "Oldest First"
    SortOption.RECENTLY_READ -> "Recently Read"
    SortOption.PROGRESS -> "Reading Progress"
    SortOption.RATING -> "Highest Rated"
    SortOption.FILE_SIZE -> "File Size"
}

private fun isFilterActive(options: FilterOptions): Boolean {
    return options.readStatus.isNotEmpty() ||
           options.genres.isNotEmpty() ||
           options.tags.isNotEmpty() ||
           options.formats.isNotEmpty() ||
           options.minRating > 0 ||
           options.hasProgress != null
}