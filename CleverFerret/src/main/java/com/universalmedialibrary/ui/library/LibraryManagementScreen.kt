package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.*
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.Library

/**
 * Main screen for managing media libraries
 * Shows list of existing libraries and provides access to create/import functionality
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryManagementScreen(
    onNavigateBack: () -> Unit = {},
    onNavigateToLibrary: (Long) -> Unit = {},
    onNavigateToSettings: () -> Unit = {},
    viewModel: LibraryManagementViewModel = hiltViewModel()
) {
    var showCreateDialog by remember { mutableStateOf(false) }
    var showImportDialog by remember { mutableStateOf(false) }
    var showExportDialog by remember { mutableStateOf(false) }
    var showMenu by remember { mutableStateOf(false) }

    val libraries by viewModel.libraries.collectAsState()
    val uiState by viewModel.uiState.collectAsState()
    val libraryItemCounts by viewModel.libraryItemCounts.collectAsState()
    val snackbarHostState = remember { SnackbarHostState() }

    Scaffold(
        snackbarHost = { SnackbarHost(snackbarHostState) },
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        "CleverFerret",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    Box {
                        IconButton(onClick = { showMenu = true }) {
                            Icon(Icons.Default.MoreVert, contentDescription = "More options")
                        }
                        DropdownMenu(
                            expanded = showMenu,
                            onDismissRequest = { showMenu = false }
                        ) {
                            DropdownMenuItem(
                                text = { Text("Settings") },
                                onClick = {
                                    showMenu = false
                                    onNavigateToSettings()
                                },
                                leadingIcon = {
                                    Icon(Icons.Default.Settings, contentDescription = "Settings")
                                }
                            )
                            DropdownMenuItem(
                                text = { Text("Import Calibre Library") },
                                onClick = {
                                    showMenu = false
                                    showImportDialog = true
                                },
                                leadingIcon = {
                                    Icon(Icons.Default.Add, contentDescription = "Add")
                                }
                            )
                        }
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = { showCreateDialog = true },
                containerColor = MaterialTheme.colorScheme.primary
            ) {
                Icon(Icons.Default.Add, contentDescription = "Create Library")
            }
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            if (libraries.isEmpty()) {
                WelcomeScreen(
                    onCreateLibrary = { showCreateDialog = true },
                    onImportLibrary = { showImportDialog = true }
                )
            } else {
                LibraryListContent(
                    libraries = libraries,
                    libraryItemCounts = libraryItemCounts,
                    onLibraryClick = { library ->
                        onNavigateToLibrary(library.libraryId)
                    }
                )
            }
        }
    }

    if (showCreateDialog) {
        CreateLibraryDialog(
            open = showCreateDialog,
            onDismiss = { showCreateDialog = false },
            onConfirm = { name, type, path ->
                viewModel.createLibrary(name, type, path)
                showCreateDialog = false
            }
        )
    }

    if (showImportDialog) {
        ImportCalibreDialog(
            open = showImportDialog,
            onDismiss = { showImportDialog = false },
            onConfirm = { name, path ->
                viewModel.importCalibreLibrary(path, name)
                showImportDialog = false
            }
        )
    }
    
    if (showExportDialog) {
        ExportCalibreDialog(
            open = showExportDialog,
            onDismiss = { showExportDialog = false },
            onConfirm = { path ->
                viewModel.exportToCalibre(path)
                showExportDialog = false
            }
        )
    }

    // Show loading or error states
    val currentState = uiState
    when (currentState) {
        is LibraryManagementUiState.Loading -> {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator()
            }
        }
        is LibraryManagementUiState.Error -> {
            LaunchedEffect(currentState) {
                snackbarHostState.showSnackbar(
                    message = currentState.message,
                    duration = SnackbarDuration.Long
                )
            }
        }
        is LibraryManagementUiState.Success -> {
            // Content already shown above
        }
    }
}

@Composable
private fun WelcomeScreen(
    onCreateLibrary: () -> Unit,
    onImportLibrary: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp)
            .verticalScroll(rememberScrollState()),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Default.Home,
            contentDescription = "Media image",
            modifier = Modifier.size(120.dp),
            tint = MaterialTheme.colorScheme.primary
        )

        Spacer(modifier = Modifier.height(24.dp))

        Text(
            text = "Welcome to CleverFerret",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold,
            color = MaterialTheme.colorScheme.onSurface
        )

        Text(
            text = "Your universal media library organizer",
            style = MaterialTheme.typography.bodyLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            modifier = Modifier.padding(top = 8.dp)
        )

        Spacer(modifier = Modifier.height(48.dp))

        Card(
            modifier = Modifier.fillMaxWidth(),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surfaceVariant
            )
        ) {
            Column(
                modifier = Modifier.padding(24.dp),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = "Get Started",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.SemiBold
                )

                Spacer(modifier = Modifier.height(16.dp))

                Text(
                    text = "Create your first media library to start organizing your books, movies, music, and more.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Spacer(modifier = Modifier.height(24.dp))

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Button(
                        onClick = onCreateLibrary,
                        modifier = Modifier.weight(1f),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = MaterialTheme.colorScheme.primary
                        )
                    ) {
                        Icon(Icons.Default.Add, contentDescription = "Add")
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Create Library")
                    }

                    OutlinedButton(
                        onClick = onImportLibrary,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Add, contentDescription = "Add")
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Import Library")
                    }
                }
            }
        }

        Spacer(modifier = Modifier.height(32.dp))

        // Features overview
        Card(
            modifier = Modifier.fillMaxWidth(),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.secondaryContainer
            )
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "🚀 Media Types Supported",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold,
                    color = MaterialTheme.colorScheme.onSecondaryContainer
                )

                Spacer(modifier = Modifier.height(12.dp))

                val mediaTypes = listOf(
                    "📚 Books: EPUB, PDF, TXT, MOBI",
                    "🎵 Music: MP3, FLAC, OGG, M4A",
                    "🎬 Movies: MP4, MKV, AVI, MOV",
                    "📺 TV Shows: Episode & season tracking",
                    "🎧 Podcasts: RSS feed management",
                    "📄 Documents: Advanced text processing"
                )

                mediaTypes.forEach { type ->
                    Text(
                        text = type,
                        style = MaterialTheme.typography.bodySmall,
                        modifier = Modifier.padding(vertical = 2.dp),
                        color = MaterialTheme.colorScheme.onSecondaryContainer
                    )
                }
            }
        }
    }
}

@Composable
private fun LibraryListContent(
    libraries: List<Library>,
    libraryItemCounts: Map<Long, Int>,
    onLibraryClick: (Library) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item {
            Text(
                text = "Your Libraries",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }

        items(libraries) { library ->
            LibraryCard(
                library = library,
                itemCount = libraryItemCounts[library.libraryId] ?: 0,
                onClick = { onLibraryClick(library) }
            )
        }
    }
}

@Composable
private fun LibraryCard(
    library: Library,
    itemCount: Int,
    onClick: () -> Unit
) {
    Card(
        onClick = onClick,
        modifier = Modifier
            .fillMaxWidth()
            .height(100.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF1E1E1E)
        ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = 2.dp
        ),
        border = androidx.compose.foundation.BorderStroke(1.dp, Color(0xFF333333))
    ) {
        Row(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Surface(
                modifier = Modifier.size(56.dp),
                shape = RoundedCornerShape(8.dp),
                color = Color(0xFF2D2D2D)
            ) {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = getLibraryIcon(library.type),
                        contentDescription = "Media image",
                        modifier = Modifier.size(32.dp),
                        tint = Color(0xFFCCCCCC)
                    )
                }
            }

            Spacer(modifier = Modifier.width(16.dp))

            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = library.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = Color.White
                )

                Spacer(modifier = Modifier.height(4.dp))

                Text(
                    text = getLibraryTypeDisplayName(library.type),
                    style = MaterialTheme.typography.bodyMedium,
                    color = Color(0xFFAAAAAA)
                )
            }

            Surface(
                color = Color(0xFF333333),
                shape = RoundedCornerShape(4.dp)
            ) {
                val itemCountText = itemCount
                Text(
                    text = "$itemCountText ${if (itemCountText == 1) "item" else "items"}",
                    style = MaterialTheme.typography.labelSmall,
                    color = Color.White,
                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                )
            }
        }
    }
}

private fun getLibraryGradientColors(type: String): List<Color> {
    return when (type.uppercase()) {
        "BOOK", "EBOOK" -> listOf(Color(0xFF2C5F2D), Color(0xFF97BC62))
        "MOVIE", "TV_SHOW" -> listOf(Color(0xFF1565C0), Color(0xFF42A5F5))
        "MUSIC_TRACK", "MUSIC_ALBUM" -> listOf(Color(0xFF7B1FA2), Color(0xFFBA68C8))
        "PODCAST_EPISODE" -> listOf(Color(0xFFEF6C00), Color(0xFFFFB74D))
        "DOCUMENT" -> listOf(Color(0xFFD32F2F), Color(0xFFF48FB1))
        else -> listOf(Color(0xFF455A64), Color(0xFF90A4AE))
    }
}

private fun getLibraryIcon(type: String): ImageVector {
    return when (type.uppercase()) {
        "BOOK", "EBOOK" -> Icons.AutoMirrored.Filled.List
        "MOVIE", "TV_SHOW" -> Icons.Default.PlayArrow
        "MUSIC_TRACK", "MUSIC_ALBUM" -> Icons.Default.PlayArrow
        "PODCAST_EPISODE" -> Icons.Default.PlayArrow
        "DOCUMENT" -> Icons.AutoMirrored.Filled.List
        "COMIC" -> Icons.AutoMirrored.Filled.List
        else -> Icons.Default.Star
    }
}

private fun getLibraryTypeDisplayName(type: String): String {
    return when (type.uppercase()) {
        "BOOK" -> "Books"
        "EBOOK" -> "E-Books"
        "MOVIE" -> "Movies"
        "TV_SHOW" -> "TV Shows"
        "MUSIC_TRACK" -> "Music"
        "MUSIC_ALBUM" -> "Music Albums"
        "PODCAST_EPISODE" -> "Podcasts"
        "DOCUMENT" -> "Documents"
        "COMIC" -> "Comics"
        else -> type.lowercase().replaceFirstChar { it.uppercase() }
    }
}
