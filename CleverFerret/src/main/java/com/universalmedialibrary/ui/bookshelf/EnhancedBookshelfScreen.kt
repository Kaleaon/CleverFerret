package com.universalmedialibrary.ui.bookshelf

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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.local.model.BookDetails
import com.universalmedialibrary.ui.theme.PlexTheme

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedBookshelfScreen(
    navController: NavController,
    viewModel: BookshelfViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    
    PlexTheme {
        Scaffold(
            topBar = {
                TopAppBar(
                    title = { Text("Enhanced Bookshelf") },
                    actions = {
                        IconButton(onClick = { /* Search */ }) {
                            Icon(Icons.Default.Search, contentDescription = "Search")
                        }
                        IconButton(onClick = { /* Filter */ }) {
                            Icon(Icons.Default.FilterList, contentDescription = "Filter")
                        }
                    }
                )
            },
            floatingActionButton = {
                FloatingActionButton(
                    onClick = { /* Add book */ }
                ) {
                    Icon(Icons.Default.Add, contentDescription = "Add Book")
                }
            }
        ) { paddingValues ->
            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 150.dp),
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp),
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                items(uiState.books) { book ->
                    BookCard(
                        book = book,
                        onClick = { 
                            navController.navigate("book_details/${book.id}")
                        }
                    )
                }
            }
        }
    }
}

@Composable
private fun BookCard(
    book: BookDetails,
    onClick: () -> Unit
) {
    Card(
        onClick = onClick,
        modifier = Modifier
            .fillMaxWidth()
            .aspectRatio(0.7f)
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(8.dp),
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            // Book cover placeholder
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(1f),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    Icons.Default.Book,
                    contentDescription = null,
                    modifier = Modifier.size(48.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
            }
            
            // Book info
            Column {
                Text(
                    text = book.title,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2
                )
                book.author?.let { author ->
                    Text(
                        text = author,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1
                    )
                }
            }
        }
    }
}