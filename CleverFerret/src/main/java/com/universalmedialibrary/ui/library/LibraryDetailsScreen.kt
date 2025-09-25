package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Library details screen showing the contents of a specific library.
 * Converted from React LibraryDetailsScreen component.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryDetailsScreen(
    libraryId: Int,
    onNavigateBack: () -> Unit = {},
    onNavigateToMediaViewer: (Int) -> Unit = {}
) {
    // Demo media items (in real app, this would come from ViewModel based on libraryId)
    val demoItems = remember {
        listOf(
            MediaItemData(
                id = 1,
                title = "The Digital Frontier",
                author = "Sarah Chen",
                year = 2024,
                rating = 4.5f,
                genre = "Sci-Fi",
                type = MediaType.BOOK
            ),
            MediaItemData(
                id = 2,
                title = "Cyber Dreams",
                author = "Michael Rodriguez", 
                year = 2023,
                rating = 4.8f,
                genre = "Thriller",
                type = MediaType.MOVIE
            ),
            MediaItemData(
                id = 3,
                title = "Neon Nights",
                author = "Synthwave Collective",
                year = 2024,
                rating = 4.2f,
                genre = "Electronic",
                type = MediaType.MUSIC
            ),
            MediaItemData(
                id = 4,
                title = "AI Revolution", 
                author = "Dr. Emily Zhang",
                year = 2024,
                rating = 4.6f,
                genre = "Non-Fiction",
                type = MediaType.BOOK
            ),
            MediaItemData(
                id = 5,
                title = "Matrix Reborn",
                author = "James Cameron",
                year = 2025,
                rating = 4.9f,
                genre = "Action",
                type = MediaType.MOVIE
            ),
            MediaItemData(
                id = 6,
                title = "Future Bass",
                author = "Digital Dreams",
                year = 2024, 
                rating = 4.3f,
                genre = "EDM",
                type = MediaType.MUSIC
            )
        )
    }

    // Plex-inspired colors
    val backgroundColor = Color(0xFF1A1A1A)
    val surfaceColor = Color(0xFF1F2326)

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
                        text = "Library Contents",
                        style = MaterialTheme.typography.titleLarge,
                        color = Color.White
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(
                            Icons.Default.ArrowBack,
                            contentDescription = "Back",
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
                    text = "Demo Library",
                    style = MaterialTheme.typography.headlineMedium,
                    fontWeight = FontWeight.Light,
                    color = Color.White
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    text = "${demoItems.size} items • Mixed media",
                    style = MaterialTheme.typography.bodyLarge,
                    color = Color(0xFFB3B3B3)
                )
                
                Spacer(modifier = Modifier.height(24.dp))
                
                // Media items grid
                LazyVerticalGrid(
                    columns = GridCells.Adaptive(minSize = 250.dp),
                    horizontalArrangement = Arrangement.spacedBy(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp),
                    modifier = Modifier.fillMaxSize()
                ) {
                    items(demoItems) { item ->
                        MediaItem(
                            item = item,
                            onClick = { onNavigateToMediaViewer(item.id) }
                        )
                    }
                }
            }
        }
    }
}