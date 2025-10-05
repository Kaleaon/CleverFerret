package com.universalmedialibrary.ui.library

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.local.model.Library
import kotlinx.coroutines.launch

/**
 * An improved library list screen that displays all available libraries in a grid layout.
 *
 * This screen provides a modern Material 3 design with cards for each library,
 * showing the library name, type, and an icon representing the media type.
 * Users can tap on a library to navigate to its details.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImprovedLibraryListScreen(
    navController: NavController,
    viewModel: LibraryManagementViewModel = hiltViewModel(),
) {
    val libraries by viewModel.libraries.collectAsState()
    val context = LocalContext.current
    val scope = rememberCoroutineScope()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("My Libraries") },
                actions = {
                    IconButton(onClick = {
                        // TODO: Show create library dialog
                    }) {
                        Icon(Icons.Default.Add, contentDescription = "Create Library")
                    }
                },
            )
        },
    ) { paddingValues ->
        if (libraries.isEmpty()) {
            // Show empty state
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.Center,
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center,
                ) {
                    Text(
                        text = "No libraries yet",
                        style = MaterialTheme.typography.headlineSmall,
                        textAlign = TextAlign.Center,
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Tap the + button to create your first library",
                        style = MaterialTheme.typography.bodyMedium,
                        textAlign = TextAlign.Center,
                    )
                }
            }
        } else {
            // Show library grid
            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 180.dp),
                contentPadding = PaddingValues(16.dp),
                horizontalArrangement = Arrangement.spacedBy(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp),
                modifier = Modifier.padding(paddingValues),
            ) {
                items(libraries) { library ->
                    LibraryCard(
                        library = library,
                        onClick = {
                            navController.navigate("library_details/${library.libraryId}")
                        },
                    )
                }
            }
        }
    }
}

/**
 * A card component that represents a single library.
 *
 * @param library The library data to display.
 * @param onClick Callback invoked when the card is tapped.
 */
@Composable
private fun LibraryCard(
    library: Library,
    onClick: () -> Unit,
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
    ) {
        Column(
            modifier = Modifier
                .padding(16.dp)
                .fillMaxWidth(),
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            // Library type icon
            Icon(
                imageVector = getLibraryIcon(library.type),
                contentDescription = null,
                modifier = Modifier.size(48.dp),
                tint = MaterialTheme.colorScheme.primary,
            )

            Spacer(modifier = Modifier.height(8.dp))

            // Library name
            Text(
                text = library.name,
                style = MaterialTheme.typography.titleMedium,
                textAlign = TextAlign.Center,
            )

            Spacer(modifier = Modifier.height(4.dp))

            // Library type
            Text(
                text = library.type,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                textAlign = TextAlign.Center,
            )
        }
    }
}

/**
 * Returns the appropriate icon for a given library type.
 *
 * @param type The type of the library (e.g., "BOOK", "MUSIC", "MOVIE").
 * @return An ImageVector representing the library type.
 */
@Composable
private fun getLibraryIcon(type: String): ImageVector {
    return when (type.uppercase()) {
        "BOOK" -> Icons.Default.Book
        "MUSIC" -> Icons.Default.MusicNote
        "MOVIE" -> Icons.Default.Movie
        else -> Icons.Default.QuestionMark
    }
}