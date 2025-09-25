package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Main library list screen with Plex-inspired design.
 * Converted from React LibraryListScreen component.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryListScreen(
    onNavigateToLibrary: (Int) -> Unit = {},
    onNavigateToSettings: () -> Unit = {},
    onCreateLibrary: () -> Unit = {}
) {
    // Demo libraries data (in real app, this would come from ViewModel)
    val demoLibraries = remember {
        listOf(
            LibraryItem(
                id = 1,
                name = "My Books",
                type = LibraryType.BOOK,
                itemCount = 284,
                isActive = true,
                lastSyncTime = "Updated today"
            ),
            LibraryItem(
                id = 2, 
                name = "Movies & TV",
                type = LibraryType.MOVIE,
                itemCount = 156,
                isActive = true,
                lastSyncTime = "Updated 2 days ago"
            ),
            LibraryItem(
                id = 3,
                name = "Music Library", 
                type = LibraryType.MUSIC,
                itemCount = 1847,
                isActive = true,
                lastSyncTime = "Updated today"
            ),
            LibraryItem(
                id = 4,
                name = "Podcasts",
                type = LibraryType.PODCAST,
                itemCount = 45,
                isActive = true,
                lastSyncTime = "Updated 1 hour ago"
            ),
            LibraryItem(
                id = 5,
                name = "Magazines",
                type = LibraryType.MAGAZINE,
                itemCount = 12,
                isActive = false,
                lastSyncTime = "Updated 1 week ago"
            ),
            LibraryItem(
                id = 6,
                name = "Documents",
                type = LibraryType.DOCUMENT,
                itemCount = 89,
                isActive = true,
                lastSyncTime = "Updated today"
            )
        )
    }

    // Plex-inspired dark theme colors
    val backgroundColor = Color(0xFF1A1A1A)
    val surfaceColor = Color(0xFF1F2326)
    val primaryColor = Color(0xFFE5A00D)

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(backgroundColor)
    ) {
        Column {
            // App Bar with Plex-inspired design
            TopAppBar(
                title = {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        // CleverFerret Avatar
                        Surface(
                            modifier = Modifier.size(40.dp),
                            shape = CircleShape,
                            color = primaryColor
                        ) {
                            Box(
                                contentAlignment = Alignment.Center
                            ) {
                                Text(
                                    text = "CF",
                                    color = Color.Black,
                                    fontWeight = FontWeight.Bold,
                                    style = MaterialTheme.typography.titleMedium
                                )
                            }
                        }
                        
                        Text(
                            text = "CleverFerret",
                            style = MaterialTheme.typography.headlineSmall,
                            fontWeight = FontWeight.Light,
                            color = Color.White
                        )
                    }
                },
                actions = {
                    IconButton(onClick = onNavigateToSettings) {
                        Icon(
                            Icons.Default.Settings,
                            contentDescription = "Settings",
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
                    text = "Your Libraries",
                    style = MaterialTheme.typography.headlineMedium,
                    fontWeight = FontWeight.Light,
                    color = Color.White
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    text = "${demoLibraries.size} libraries",
                    style = MaterialTheme.typography.bodyLarge,
                    color = Color(0xFFB3B3B3)
                )
                
                Spacer(modifier = Modifier.height(24.dp))
                
                // Libraries grid
                LazyVerticalGrid(
                    columns = GridCells.Adaptive(minSize = 300.dp),
                    horizontalArrangement = Arrangement.spacedBy(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp),
                    modifier = Modifier.fillMaxSize()
                ) {
                    items(demoLibraries) { library ->
                        LibraryCard(
                            library = library,
                            onClick = { onNavigateToLibrary(library.id) }
                        )
                    }
                }
            }
        }
        
        // Floating Action Button for adding new libraries
        FloatingActionButton(
            onClick = onCreateLibrary,
            modifier = Modifier
                .align(Alignment.BottomEnd)
                .padding(24.dp),
            containerColor = primaryColor,
            contentColor = Color.Black,
            shape = RoundedCornerShape(16.dp)
        ) {
            Icon(
                Icons.Default.Add,
                contentDescription = "Add Library",
                modifier = Modifier.size(24.dp)
            )
        }
    }
}