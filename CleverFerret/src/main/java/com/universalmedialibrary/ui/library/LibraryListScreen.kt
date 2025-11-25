package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Main library list screen with Plex-inspired design.
 * Converted from React LibraryListScreen component.
 * Now integrated with Room database via ViewModel.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryListScreen(
    onNavigateToLibrary: (Int) -> Unit = {},
    onNavigateToSettings: () -> Unit = {},
    onCreateLibrary: () -> Unit = {},
    viewModel: LibraryListViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    val colorScheme = MaterialTheme.colorScheme

    // Create sample data on first launch
    LaunchedEffect(Unit) {
        viewModel.createSampleData()
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(colorScheme.background)
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
                            color = colorScheme.primary
                        ) {
                            Box(
                                contentAlignment = Alignment.Center
                            ) {
                                Text(
                                    text = "CF",
                                    color = colorScheme.onPrimary,
                                    fontWeight = FontWeight.Bold,
                                    style = MaterialTheme.typography.titleMedium
                                )
                            }
                        }

                        Text(
                            text = "CleverFerret",
                            style = MaterialTheme.typography.headlineSmall,
                            fontWeight = FontWeight.Light,
                            color = colorScheme.onSurface
                        )
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.refresh() }) {
                        Icon(
                            PhosphorIcons.ArrowClockwise,
                            contentDescription = "Refresh",
                            tint = colorScheme.onSurface
                        )
                    }
                    IconButton(onClick = onNavigateToSettings) {
                        Icon(
                            PhosphorIcons.Gear,
                            contentDescription = "Settings",
                            tint = colorScheme.onSurface
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = colorScheme.surface,
                    titleContentColor = colorScheme.onSurface
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
                    color = colorScheme.onBackground
                )

                Spacer(modifier = Modifier.height(4.dp))

                Text(
                    text = "${uiState.libraries.size} libraries",
                    style = MaterialTheme.typography.bodyLarge,
                    color = colorScheme.onSurfaceVariant
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
                            CircularProgressIndicator(color = colorScheme.primary)
                            Text(
                                text = "Loading libraries...",
                                color = Color(0xFFB3B3B3)
                            )
                        }
                    }
                } else {
                    // Libraries grid
                    LazyVerticalGrid(
                        columns = GridCells.Adaptive(minSize = 300.dp),
                        horizontalArrangement = Arrangement.spacedBy(16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp),
                        modifier = Modifier
                            .fillMaxSize()
                            .weight(1f)
                    ) {
                        items(uiState.libraries) { libraryWithCount ->
                            LibraryCard(
                                library = libraryWithCount.toLibraryItem(),
                                onClick = { onNavigateToLibrary(libraryWithCount.library.libraryId.toInt()) }
                            )
                        }
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
            containerColor = colorScheme.primary,
            contentColor = colorScheme.onPrimary,
            shape = RoundedCornerShape(16.dp)
        ) {
            Icon(
                PhosphorIcons.Plus,
                contentDescription = "Add Library",
                modifier = Modifier.size(24.dp)
            )
        }
    }
}
