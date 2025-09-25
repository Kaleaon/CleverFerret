package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Library details screen showing the contents of a specific library.
 * Converted from React LibraryDetailsScreen component.
 * Now integrated with Room database via ViewModel.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryDetailsScreen(
    libraryId: Int,
    onNavigateBack: () -> Unit = {},
    onNavigateToMediaViewer: (Int) -> Unit = {},
    viewModel: LibraryDetailsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()

    // Plex-inspired colors
    val backgroundColor = Color(0xFF1A1A1A)
    val surfaceColor = Color(0xFF1F2326)
    val primaryColor = Color(0xFFE5A00D)

    // Load library details on composition
    LaunchedEffect(libraryId) {
        viewModel.loadLibraryDetails(libraryId.toLong())
        viewModel.createSampleMediaItems(libraryId.toLong())
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(backgroundColor) 
    ) {
        Column {
            // App Bar
            TopAppBar(
                title = {
                    Text(
                        text = uiState.library?.name ?: "Library Contents",
                        style = MaterialTheme.typography.titleLarge,
                        color = Color.White
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(
                            PhosphorIcons.ArrowLeft,
                            contentDescription = "Back",
                            tint = Color.White
                        )
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.refresh(libraryId.toLong()) }) {
                        Icon(
                            PhosphorIcons.ArrowClockwise,
                            contentDescription = "Refresh",
                            tint = Color.White
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = surfaceColor,
                    titleContentColor = Color.White
                )
            )
            
            // Main content
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(16.dp)
            ) {
                // Header section
                Text(
                    text = uiState.library?.name ?: "Library",
                    style = MaterialTheme.typography.headlineMedium,
                    fontWeight = FontWeight.Light,
                    color = Color.White
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                val itemCount = uiState.mediaItems.size
                val libraryType = uiState.library?.type?.lowercase() ?: "mixed"
                Text(
                    text = "$itemCount items • $libraryType media",
                    style = MaterialTheme.typography.bodyLarge,
                    color = Color(0xFFB3B3B3)
                )
                
                Spacer(modifier = Modifier.height(24.dp))
                
                // Error handling
                uiState.error?.let { error ->
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = Color(0xFF4A1A1A)
                        )
                    ) {
                        Text(
                            text = "Error: $error",
                            modifier = Modifier.padding(16.dp),
                            color = Color(0xFFFF6B6B)
                        )
                    }
                    Spacer(modifier = Modifier.height(16.dp))
                }
                
                // Loading state
                if (uiState.isLoading) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            CircularProgressIndicator(color = primaryColor)
                            Text(
                                text = "Loading media items...",
                                color = Color(0xFFB3B3B3)
                            )
                        }
                    }
                } else if (uiState.mediaItems.isEmpty()) {
                    // Empty state
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            Icon(
                                PhosphorIcons.FolderOpen,
                                contentDescription = null,
                                modifier = Modifier.size(64.dp),
                                tint = Color(0xFF666666)
                            )
                            Text(
                                text = "No media items found",
                                style = MaterialTheme.typography.headlineSmall,
                                color = Color(0xFF666666)
                            )
                            Text(
                                text = "Add some files to this library to get started",
                                style = MaterialTheme.typography.bodyMedium,
                                color = Color(0xFF999999)
                            )
                        }
                    }
                } else {
                    // Media items grid
                    LazyVerticalGrid(
                        columns = GridCells.Adaptive(minSize = 250.dp),
                        horizontalArrangement = Arrangement.spacedBy(16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp),
                        modifier = Modifier.fillMaxSize()
                    ) {
                        items(uiState.mediaItems) { mediaItemWithMetadata ->
                            MediaItem(
                                item = mediaItemWithMetadata.toMediaItemData(),
                                onClick = { onNavigateToMediaViewer(mediaItemWithMetadata.mediaItem.itemId.toInt()) }
                            )
                        }
                    }
                }
            }
        }
    }
}