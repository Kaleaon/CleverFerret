package com.universalmedialibrary.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.components.*
import com.universalmedialibrary.ui.models.MediaCategory
import com.universalmedialibrary.ui.models.SidebarPosition
import com.universalmedialibrary.ui.viewmodels.MediaLibraryViewModel

/**
 * Main Media Library Screen
 * 
 * Plex-inspired layout with:
 * - Configurable sidebar (left/right)
 * - Media grid with category filtering
 * - Settings dialog
 * - Metallic theme with shimmer effects
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaLibraryScreen(
    viewModel: MediaLibraryViewModel = hiltViewModel(),
    onNavigateToItem: (Long) -> Unit = {}
) {
    // Collect state
    val selectedCategory by viewModel.selectedCategory.collectAsState()
    val mediaItems by viewModel.mediaItems.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    val showSettingsDialog by viewModel.showSettingsDialog.collectAsState()
    val appSettings by viewModel.appSettings.collectAsState()
    
    val sidebarPosition = appSettings.interface_.sidebarPosition
    val gridColumns = appSettings.interface_.gridColumns
    
    // Main Layout
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(selectedCategory.label) },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surface,
                    titleContentColor = MaterialTheme.colorScheme.onSurface
                )
            )
        }
    ) { paddingValues ->
        Row(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Left Sidebar
            if (sidebarPosition == SidebarPosition.LEFT) {
                MediaNavigationRail(
                    selectedCategory = selectedCategory,
                    onCategorySelected = { viewModel.selectCategory(it) },
                    onSettingsClick = { viewModel.showSettings() },
                    position = sidebarPosition
                )
            }
            
            // Main Content
            Box(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight()
            ) {
                if (isLoading) {
                    // Loading State
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator(
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                } else {
                    // Media Grid
                    MediaGrid(
                        items = mediaItems,
                        columns = gridColumns,
                        onItemClick = { item ->
                            onNavigateToItem(item.id)
                        }
                    )
                }
            }
            
            // Right Sidebar
            if (sidebarPosition == SidebarPosition.RIGHT) {
                MediaNavigationRail(
                    selectedCategory = selectedCategory,
                    onCategorySelected = { viewModel.selectCategory(it) },
                    onSettingsClick = { viewModel.showSettings() },
                    position = sidebarPosition
                )
            }
        }
        
        // Settings Dialog
        if (showSettingsDialog) {
            SettingsDialog(
                settings = appSettings,
                onSettingsChange = { viewModel.updateSettings(it) },
                onDismiss = { viewModel.hideSettings() }
            )
        }
    }
}

/**
 * Preview version for testing layouts
 */
@Composable
fun MediaLibraryScreenPreview() {
    MaterialTheme {
        Surface {
            MediaLibraryScreen()
        }
    }
}
