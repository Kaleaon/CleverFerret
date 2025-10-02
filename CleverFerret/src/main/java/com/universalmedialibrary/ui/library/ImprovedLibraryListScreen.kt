package com.universalmedialibrary.ui.library

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.ui.components.*
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Improved library list screen with robust state handling
 * Displays loading, error, empty, and content states
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImprovedLibraryListScreen(
    onNavigateToLibrary: (Int) -> Unit,
    onNavigateToSettings: () -> Unit,
    onCreateLibrary: (String, String, String) -> Unit,
    onRefresh: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: LibraryListViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    var showCreateDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(
                            imageVector = PhosphorIcons.Book,
                            contentDescription = null,
                            modifier = Modifier.size(24.dp)
                        )
                        Text("CleverFerret")
                    }
                },
                actions = {
                    IconButton(onClick = onRefresh) {
                        Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                    }
                    IconButton(onClick = onNavigateToSettings) {
                        Icon(Icons.Default.Settings, contentDescription = "Settings")
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(onClick = { showCreateDialog = true }) {
                Icon(Icons.Default.Add, contentDescription = "Add Library")
            }
        },
        modifier = modifier
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            when {
                uiState.isLoading -> {
                    // Loading state
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        LoadingStateCard(message = "Loading your libraries...")
                    }
                }
                
                uiState.error != null -> {
                    // Error state
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        ErrorStateCard(
                            message = uiState.error ?: "An unknown error occurred",
                            onRetry = { viewModel.refresh() }
                        )
                    }
                }
                
                uiState.libraries.isEmpty() -> {
                    // Empty state
                    Column(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        EmptyStateCard(
                            icon = Icons.Default.BookmarkBorder,
                            title = "No Libraries Yet",
                            description = "Create your first library to start organizing your media collection",
                            actionLabel = "Create Library",
                            onActionClick = { showCreateDialog = true }
                        )
                        
                        InfoBanner(
                            message = "You can also import an existing Calibre library from the settings menu",
                            icon = Icons.Default.Info
                        )
                    }
                }
                
                else -> {
                    // Content state - show libraries
                    Column(
                        modifier = Modifier.fillMaxSize()
                    ) {
                        // Header
                        SectionHeader(
                            title = "Your Libraries",
                            modifier = Modifier.padding(top = 8.dp)
                        )
                        
                        // Stats row
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = 16.dp, vertical = 8.dp),
                            horizontalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            StatsCard(
                                icon = Icons.Default.LibraryBooks,
                                label = "Libraries",
                                value = uiState.libraries.size.toString(),
                                modifier = Modifier.weight(1f)
                            )
                            
                            StatsCard(
                                icon = Icons.Default.Article,
                                label = "Total Items",
                                value = uiState.libraries.sumOf { it.itemCount }.toString(),
                                modifier = Modifier.weight(1f)
                            )
                        }
                        
                        // Library grid
                        LazyVerticalGrid(
                            columns = GridCells.Adaptive(minSize = 160.dp),
                            modifier = Modifier.fillMaxSize(),
                            contentPadding = PaddingValues(16.dp),
                            verticalArrangement = Arrangement.spacedBy(16.dp),
                            horizontalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            items(uiState.libraries) { libraryWithCount ->
                                LibraryCard(
                                    library = libraryWithCount.toLibraryItem(),
                                    onClick = {
                                        onNavigateToLibrary(libraryWithCount.library.libraryId.toInt())
                                    }
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    // Create Library Dialog
    if (showCreateDialog) {
        CreateLibraryDialog(
            open = showCreateDialog,
            onDismiss = { showCreateDialog = false },
            onConfirm = { name, type, path ->
                onCreateLibrary(name, type, path)
                showCreateDialog = false
            }
        )
    }
}
