package com.universalmedialibrary.ui.manga

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
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
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import com.universalmedialibrary.services.manga.library.LibraryManga
import com.universalmedialibrary.services.manga.library.MangaCategory
import com.universalmedialibrary.services.manga.library.LibrarySortOrder

/**
 * Manga Library Screen
 * 
 * User's manga collection with categories, favorites, and reading progress
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MangaLibraryScreen(
    onNavigateBack: () -> Unit,
    onMangaClick: (LibraryManga) -> Unit,
    onExplore: () -> Unit,
    viewModel: MangaLibraryViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showSortMenu by remember { mutableStateOf(false) }
    var showCategoryDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Column {
                        Text("Library")
                        if (uiState.selectedCategory != null) {
                            Text(
                                text = uiState.selectedCategory!!.name,
                                style = MaterialTheme.typography.bodySmall
                            )
                        }
                    }
                },
                actions = {
                    IconButton(onClick = { showSortMenu = true }) {
                        Icon(Icons.Default.Sort, contentDescription = "Sort")
                    }
                    IconButton(onClick = onExplore) {
                        Icon(Icons.Default.Explore, contentDescription = "Explore")
                    }
                    
                    DropdownMenu(
                        expanded = showSortMenu,
                        onDismissRequest = { showSortMenu = false }
                    ) {
                        LibrarySortOrder.entries.forEach { order ->
                            DropdownMenuItem(
                                text = { Text(order.name.replace("_", " ").lowercase().replaceFirstChar { it.uppercase() }) },
                                onClick = {
                                    viewModel.setSortOrder(order)
                                    showSortMenu = false
                                },
                                leadingIcon = if (uiState.sortOrder == order) {
                                    { Icon(Icons.Default.Check, contentDescription = null) }
                                } else null
                            )
                        }
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(onClick = onExplore) {
                Icon(Icons.Default.Add, contentDescription = "Add manga")
            }
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Category tabs
            if (uiState.categories.isNotEmpty()) {
                ScrollableTabRow(
                    selectedTabIndex = uiState.categories.indexOfFirst { 
                        it.id == uiState.selectedCategory?.id 
                    }.coerceAtLeast(0),
                    edgePadding = 16.dp
                ) {
                    // All tab
                    Tab(
                        selected = uiState.selectedCategory == null,
                        onClick = { viewModel.selectCategory(null) },
                        text = { Text("All (${uiState.library.size})") }
                    )
                    
                    // Category tabs
                    uiState.categories.forEach { category ->
                        Tab(
                            selected = category.id == uiState.selectedCategory?.id,
                            onClick = { viewModel.selectCategory(category) },
                            text = { Text("${category.name} (${category.mangaCount})") }
                        )
                    }
                }
            }
            
            // Library content
            when {
                uiState.isLoading -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                }
                
                uiState.filteredLibrary.isEmpty() -> {
                    EmptyLibraryState(onExplore = onExplore)
                }
                
                else -> {
                    LibraryGrid(
                        manga = uiState.filteredLibrary,
                        onMangaClick = onMangaClick,
                        onMangaLongClick = { /* Show context menu */ }
                    )
                }
            }
        }
    }
}

@Composable
private fun LibraryGrid(
    manga: List<LibraryManga>,
    onMangaClick: (LibraryManga) -> Unit,
    onMangaLongClick: (LibraryManga) -> Unit
) {
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 110.dp),
        contentPadding = PaddingValues(16.dp),
        horizontalArrangement = Arrangement.spacedBy(12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(manga, key = { it.id }) { item ->
            LibraryMangaCard(
                manga = item,
                onClick = { onMangaClick(item) },
                onLongClick = { onMangaLongClick(item) }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun LibraryMangaCard(
    manga: LibraryManga,
    onClick: () -> Unit,
    onLongClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(8.dp))
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(8.dp)
    ) {
        Column {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(0.7f)
            ) {
                AsyncImage(
                    model = manga.coverUrl,
                    contentDescription = manga.title,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
                
                // Unread badge
                if (manga.unreadCount > 0) {
                    Surface(
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(4.dp),
                        color = MaterialTheme.colorScheme.primary,
                        shape = RoundedCornerShape(4.dp)
                    ) {
                        Text(
                            text = manga.unreadCount.toString(),
                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onPrimary
                        )
                    }
                }
                
                // Favorite indicator
                if (manga.isFavorite) {
                    Icon(
                        Icons.Default.Favorite,
                        contentDescription = null,
                        modifier = Modifier
                            .align(Alignment.TopStart)
                            .padding(4.dp)
                            .size(16.dp),
                        tint = MaterialTheme.colorScheme.error
                    )
                }
                
                // Progress indicator
                if (manga.chaptersRead > 0 && manga.totalChapters > 0) {
                    LinearProgressIndicator(
                        progress = { manga.chaptersRead.toFloat() / manga.totalChapters },
                        modifier = Modifier
                            .fillMaxWidth()
                            .align(Alignment.BottomCenter)
                            .height(3.dp),
                    )
                }
            }
            
            Text(
                text = manga.title,
                modifier = Modifier.padding(8.dp),
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                style = MaterialTheme.typography.bodySmall,
                fontWeight = FontWeight.Medium
            )
        }
    }
}

@Composable
private fun EmptyLibraryState(
    onExplore: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            Icons.Default.LibraryBooks,
            contentDescription = null,
            modifier = Modifier.size(80.dp),
            tint = MaterialTheme.colorScheme.primary.copy(alpha = 0.5f)
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Text(
            text = "Your library is empty",
            style = MaterialTheme.typography.titleMedium
        )
        
        Text(
            text = "Add manga from the explore tab to start reading",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(modifier = Modifier.height(24.dp))
        
        Button(onClick = onExplore) {
            Icon(Icons.Default.Explore, contentDescription = "Explore")
            Spacer(modifier = Modifier.width(8.dp))
            Text("Explore Manga")
        }
    }
}
