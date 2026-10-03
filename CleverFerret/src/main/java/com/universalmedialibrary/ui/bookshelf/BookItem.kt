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
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.Sort
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

// ViewMode and SortOption are now defined in BookshelfModels.kt

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
fun EnhancedBookshelfScreenDemo(
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
                getBookComparator(sortOption)
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
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
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
                                ViewMode.COMFORTABLE -> ViewMode.COVER_FLOW
                                ViewMode.COVER_FLOW -> ViewMode.GRID_SMALL
                            }
                        }) {
                            Icon(
                                when (viewMode) {
                                    ViewMode.GRID_SMALL -> Icons.Default.GridView
                                    ViewMode.GRID_LARGE -> Icons.Default.ViewModule
                                    ViewMode.LIST -> Icons.Default.ViewList
                                    ViewMode.COMFORTABLE -> Icons.Default.ViewComfy
                                    ViewMode.COVER_FLOW -> Icons.Default.ViewCarousel
                                },
                                "View Mode"
                            )
                        }

                        // Sort menu
                        IconButton(onClick = { showSortMenu = true }) {
                            Icon(Icons.AutoMirrored.Filled.Sort, "Sort")
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
                            if (isFilterActive(filterOptions)) {
                                BadgedBox(
                                    badge = {
                                        Badge { Text("!") }
                                    }
                                ) {
                                    Icon(Icons.Default.FilterList, "Filter")
                                }
                            } else {
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
                                modifier = Modifier
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
                                modifier = Modifier
                            )
                        }
                    }
                }
                ViewMode.COVER_FLOW -> {
                    // Cover flow view - placeholder for now
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(16.dp),
                            modifier = Modifier.padding(32.dp)
                        ) {
                            Icon(
                                Icons.Default.ViewCarousel,
                                contentDescription = "Media image",
                                modifier = Modifier.size(80.dp),
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Text(
                                "Cover Flow View",
                                style = MaterialTheme.typography.headlineSmall,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                "An immersive 3D carousel view of your book covers is coming soon. Switch to another view mode for now.",
                                style = MaterialTheme.typography.bodyMedium,
                                textAlign = androidx.compose.ui.text.style.TextAlign.Center,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
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
