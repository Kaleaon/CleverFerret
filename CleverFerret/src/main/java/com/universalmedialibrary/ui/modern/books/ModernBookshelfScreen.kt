package com.universalmedialibrary.ui.modern.books

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.data.local.entity.BookDetails
import com.universalmedialibrary.ui.bookshelf.*
import com.universalmedialibrary.ui.media.components.MediaPosterCardSkeleton
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.domain.ModernUiState
import com.universalmedialibrary.ui.modern.theme.CFSpacing

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ModernBookshelfScreen(
    navController: NavController,
    libraryId: Long = 1L,
    viewModel: BookshelfViewModel = hiltViewModel()
) {
    val books by viewModel.books.collectAsStateWithLifecycle()
    val favorites by viewModel.favorites.collectAsStateWithLifecycle()
    val progressMap by viewModel.progressMap.collectAsStateWithLifecycle()
    val viewMode by viewModel.viewMode.collectAsStateWithLifecycle()
    val sortOption by viewModel.sortOption.collectAsStateWithLifecycle()
    val searchQuery by viewModel.searchQuery.collectAsStateWithLifecycle()
    val selectedGenre by viewModel.selectedGenre.collectAsStateWithLifecycle()
    val showFilters by viewModel.showFilters.collectAsStateWithLifecycle()
    val searchActive by viewModel.searchActive.collectAsStateWithLifecycle()

    var showSortMenu by remember { mutableStateOf(false) }
    var showViewModeMenu by remember { mutableStateOf(false) }
    var isInitialLoading by remember { mutableStateOf(true) }

    LaunchedEffect(libraryId) {
        viewModel.loadBooks(libraryId)
        isInitialLoading = false
    }

    val uiState: ModernUiState<List<BookDetails>> = remember(books, isInitialLoading) {
        when {
            isInitialLoading -> ModernUiState.Loading
            books.isEmpty() -> ModernUiState.Empty
            else -> ModernUiState.Success(books)
        }
    }

    Scaffold(
        topBar = {
            CFTopBar(
                title = "Bookshelf",
                onBack = if (navController.previousBackStackEntry != null) {
                    { navController.popBackStack() }
                } else null,
                actions = {
                    IconButton(onClick = { viewModel.toggleSearch() }) {
                        Icon(Icons.Default.Search, contentDescription = "Search")
                    }

                    IconButton(onClick = { showViewModeMenu = true }) {
                        Icon(
                            when (viewMode) {
                                ViewMode.GRID_SMALL, ViewMode.GRID_LARGE -> Icons.Default.GridView
                                ViewMode.LIST, ViewMode.COMFORTABLE -> Icons.AutoMirrored.Filled.List
                                ViewMode.COVER_FLOW -> Icons.Default.ViewCarousel
                            },
                            contentDescription = "View Mode"
                        )
                    }

                    DropdownMenu(
                        expanded = showViewModeMenu,
                        onDismissRequest = { showViewModeMenu = false }
                    ) {
                        ViewMode.values().forEach { mode ->
                            DropdownMenuItem(
                                text = { Text(mode.displayName) },
                                onClick = {
                                    viewModel.setViewMode(mode)
                                    showViewModeMenu = false
                                },
                                leadingIcon = {
                                    Icon(mode.icon, contentDescription = mode.displayName)
                                }
                            )
                        }
                    }

                    IconButton(onClick = { showSortMenu = true }) {
                        Icon(Icons.AutoMirrored.Filled.Sort, contentDescription = "Sort")
                    }

                    DropdownMenu(
                        expanded = showSortMenu,
                        onDismissRequest = { showSortMenu = false }
                    ) {
                        SortOption.values().forEach { option ->
                            DropdownMenuItem(
                                text = { Text(option.displayName) },
                                onClick = {
                                    viewModel.setSortOption(option)
                                    showSortMenu = false
                                },
                                leadingIcon = {
                                    Icon(option.icon, contentDescription = option.displayName)
                                }
                            )
                        }
                    }

                    IconButton(onClick = { viewModel.toggleFilters() }) {
                        Icon(
                            Icons.Default.FilterList,
                            contentDescription = "Filter",
                            tint = if (showFilters) MaterialTheme.colorScheme.primary
                            else MaterialTheme.colorScheme.onSurface
                        )
                    }
                }
            )
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = { navController.navigate("opds_catalog") },
                icon = { Icon(Icons.Default.CloudDownload, contentDescription = "Download") },
                text = { Text("Get Books") },
                containerColor = MaterialTheme.colorScheme.primaryContainer
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            AnimatedVisibility(visible = searchQuery.isNotEmpty() || searchActive) {
                SearchTextField(
                    query = searchQuery,
                    onQueryChange = viewModel::setSearchQuery,
                    onClearSearch = { viewModel.clearSearch() },
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.sm)
                )
            }

            AnimatedVisibility(visible = showFilters) {
                FiltersRow(
                    selectedGenre = selectedGenre,
                    onGenreSelected = viewModel::setSelectedGenre,
                    modifier = Modifier.padding(horizontal = CFSpacing.lg, vertical = CFSpacing.sm)
                )
            }

            when (uiState) {
                is ModernUiState.Loading -> {
                    LazyVerticalGrid(
                        columns = GridCells.Adaptive(minSize = 120.dp),
                        modifier = Modifier.fillMaxSize(),
                        contentPadding = PaddingValues(CFSpacing.lg),
                        horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                        verticalArrangement = Arrangement.spacedBy(CFSpacing.md)
                    ) {
                        items(8) {
                            MediaPosterCardSkeleton(width = 120.dp)
                        }
                    }
                }
                is ModernUiState.Empty -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CFEmptyState(
                            icon = Icons.Default.MenuBook,
                            title = "No Books Found",
                            body = if (searchQuery.isNotEmpty()) {
                                "No books match parameter '$searchQuery'."
                            } else {
                                "Your library is empty. Download or import books to get started."
                            },
                            actionLabel = "Get Books",
                            onAction = { navController.navigate("opds_catalog") }
                        )
                    }
                }
                is ModernUiState.Success -> {
                    if (favorites.isNotEmpty()) {
                        FavoritesSection(
                            favorites = favorites,
                            onClick = { book ->
                                navController.navigate("book_details/${book.mediaItem.itemId}")
                            },
                            modifier = Modifier.padding(vertical = CFSpacing.sm)
                        )
                    }

                    when (viewMode) {
                        ViewMode.GRID_SMALL, ViewMode.GRID_LARGE -> {
                            GridBookView(
                                books = books,
                                progressMap = progressMap,
                                onClick = { book ->
                                    navController.navigate("book_details/${book.mediaItem.itemId}")
                                },
                                onFavoriteToggle = viewModel::toggleFavorite,
                                modifier = Modifier.fillMaxSize()
                            )
                        }
                        ViewMode.LIST, ViewMode.COMFORTABLE -> {
                            ListBookView(
                                books = books,
                                progressMap = progressMap,
                                onClick = { book ->
                                    navController.navigate("book_details/${book.mediaItem.itemId}")
                                },
                                onFavoriteToggle = viewModel::toggleFavorite,
                                modifier = Modifier.fillMaxSize()
                            )
                        }
                        ViewMode.COVER_FLOW -> {
                            CoverFlowView(
                                books = books,
                                onClick = { book ->
                                    navController.navigate("book_details/${book.mediaItem.itemId}")
                                },
                                onFavoriteToggle = viewModel::toggleFavorite,
                                modifier = Modifier.fillMaxSize()
                            )
                        }
                    }
                }
                is ModernUiState.Error -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CFEmptyState(
                            icon = Icons.Default.Warning,
                            title = "Error Loading Bookshelf",
                            body = (uiState as ModernUiState.Error).message,
                            actionLabel = "Retry",
                            onAction = { viewModel.loadBooks(libraryId) }
                        )
                    }
                }
            }
        }
    }
}
