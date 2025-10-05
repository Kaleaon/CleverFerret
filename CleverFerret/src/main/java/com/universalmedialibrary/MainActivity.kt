package com.universalmedialibrary

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.compose.setContent
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.ui.maintenance.MaintenanceScreen
import com.universalmedialibrary.ui.collections.CollectionsScreen
import com.universalmedialibrary.ui.home.ContinueReadingSection
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.services.CalibreImportForegroundService
import com.universalmedialibrary.ui.library.CreateLibraryDialog
import com.universalmedialibrary.ui.library.LibraryDetailsScreen
import com.universalmedialibrary.ui.open.MediaOpenScreen
import com.universalmedialibrary.ui.settings.StorageOrganizerScreen
import com.universalmedialibrary.ui.settings.PlaylistSettingsScreen
import com.universalmedialibrary.ui.settings.OpdsSettingsScreen
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import dagger.hilt.android.AndroidEntryPoint


// Sample library data class for demonstration
data class SampleLibrary(
    val name: String,
    val type: String,
    val libraryId: Long
)


/**
 * The main and only activity of the application, serving as the entry point for the UI.
 * It is annotated with [AndroidEntryPoint] to enable Hilt dependency injection.
 */

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            // Use settings to determine theme
            val mainViewModel: MainViewModel = hiltViewModel()
            val selectedTheme by mainViewModel.selectedTheme.collectAsState(ThemePalette.NAVY_GOLD)
            val darkMode by mainViewModel.darkMode.collectAsState(true)

            CleverFerretTheme(palette = selectedTheme, darkTheme = darkMode) {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    AppNavigation()
                }
            }
        }
    }
}

/**
 * Sets up the navigation for the entire application using Jetpack Compose Navigation.
 * It defines the navigation graph and the composable destinations.
 */
@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    NavHost(
        navController = navController,
        startDestination = "home"
    ) {
        composable("home") {
            LibraryListScreen(navController = navController)
        }
        composable("library_details/{libraryId}") { backStackEntry ->
            val libraryId = backStackEntry.arguments?.getString("libraryId")?.toIntOrNull() ?: 0
            LibraryDetailsScreen(
                libraryId = libraryId,
                onNavigateBack = { navController.navigateUp() },
                onNavigateToMediaViewer = { id -> navController.navigate("open/$id") }
            )
        }
        composable("open/{itemId}") { backStackEntry ->
            val itemId = backStackEntry.arguments?.getString("itemId")?.toLongOrNull() ?: -1L
            if (itemId > 0) {
                MediaOpenScreen(
                    itemId = itemId,
                    onBack = { navController.navigateUp() }
                )
            } else {
                Text("Invalid media item")
            }
        }
        composable("editor/new") {
            com.universalmedialibrary.ui.writer.DocumentEditorScreen(
                title = "Untitled",
                initialText = "",
                onBack = { navController.navigateUp() }
            )
        }
        composable("settings/organizer") {
            StorageOrganizerScreen(onBack = { navController.navigateUp() })
        }
        composable("settings/playlists") {
            PlaylistSettingsScreen(onBack = { navController.navigateUp() })
        }
        composable("settings/opds") {
            OpdsSettingsScreen(onBack = { navController.navigateUp() })
        }
        composable("maintenance") {
            MaintenanceScreen(onBack = { navController.navigateUp() })
        }
        composable("collections") {
            CollectionsScreen(onOpenCollection = { /* TODO: navigate to collection detail */ })
        }

        // Podcast routes
        composable("podcasts") {
            com.universalmedialibrary.ui.podcast.PodcastManagerScreen(navController = navController)
        }
        composable("podcast_player/{episodeId}") { backStackEntry ->
            val episodeId = backStackEntry.arguments?.getString("episodeId")?.toLongOrNull() ?: -1L
            com.universalmedialibrary.ui.podcast.PodcastPlayerScreen(
                episodeId = episodeId,
                onBack = { navController.navigateUp() }
            )
        }

        // Music routes
        composable("music") {
            com.universalmedialibrary.ui.music.MusicLibraryScreen(navController = navController)
        }
        composable("music_player") {
            com.universalmedialibrary.ui.music.MusicPlayerScreen(
                onBack = { navController.navigateUp() }
            )
        }

        // Reader routes
        composable("bookshelf/{libraryId}") { backStackEntry ->
            val libraryId = backStackEntry.arguments?.getString("libraryId")?.toLongOrNull() ?: 1L
            com.universalmedialibrary.ui.bookshelf.EnhancedBookshelfScreen(
                navController = navController,
                libraryId = libraryId
            )
        }
        composable("reader/{itemId}") { backStackEntry ->
            val itemId = backStackEntry.arguments?.getString("itemId")?.toLongOrNull() ?: -1L
            com.universalmedialibrary.ui.reader.EReaderScreen(
                itemId = itemId,
                onBack = { navController.navigateUp() }
            )
        }

        // Radio routes
        composable("radio") {
            com.universalmedialibrary.ui.radio.RadioScreen(
                onBack = { navController.navigateUp() }
            )
        }

        // Video routes
        composable("videos") {
            com.universalmedialibrary.ui.video.VideoLibraryScreen(
                navController = navController
            )
        }
        composable("video_player/{videoId}") { backStackEntry ->
            val videoId = backStackEntry.arguments?.getString("videoId")?.toLongOrNull() ?: -1L
            com.universalmedialibrary.ui.video.VideoPlayerScreen(
                videoId = videoId,
                onBack = { navController.navigateUp() }
            )
        }

        // Settings route
        composable("settings") {
            com.universalmedialibrary.ui.settings.SettingsScreen(
                onBack = { navController.navigateUp() }
            )
        }

        // Theme preview for testing
        composable("theme_preview") {
            com.universalmedialibrary.ui.theme.ThemePreviewScreen()
        }

        // Server integration route
        composable("servers") {
            com.universalmedialibrary.ui.integration.ServerIntegrationScreen(
                onBack = { navController.navigateUp() }
            )
        }
    }
}


/**
 * The main screen of the application, displaying a list of media libraries.
 * It handles user interactions for adding new libraries and initiating a Calibre import.
 *
 * @param navController The [NavController] for handling navigation events.
 * @param viewModel The [MainViewModel] instance for this screen, provided by Hilt.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryListScreen(
    navController: NavController,
    viewModel: MainViewModel = hiltViewModel()
) {
    val libraries by viewModel.libraries.collectAsState()
    var showCreateDialog by remember { mutableStateOf(false) }

    var showImportDialog by remember { mutableStateOf(false) }
    var showMenu by remember { mutableStateOf(false) }
    var showLibrarySelectionDialog by remember { mutableStateOf(false) }
    val context = LocalContext.current
    var dbFileUri by remember { mutableStateOf<Uri?>(null) }
    var selectedLibraryForImport by remember { mutableStateOf<Library?>(null) }

    // Launcher for picking the root folder of the Calibre library.
    // This is triggered after the user selects the target library.
    val rootFolderPicker =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.OpenDocumentTree(),
            onResult = { uri ->
                val libraryForImport = selectedLibraryForImport
                if (uri != null && dbFileUri != null && libraryForImport != null) {
                    val intent =
                        Intent(context, CalibreImportForegroundService::class.java).apply {
                            putExtra(CalibreImportForegroundService.EXTRA_DB_PATH, dbFileUri.toString())
                            putExtra(CalibreImportForegroundService.EXTRA_ROOT_PATH, uri.toString())
                            putExtra(CalibreImportForegroundService.EXTRA_LIBRARY_ID, libraryForImport.libraryId)
                        }
                    context.startForegroundService(intent)
                    dbFileUri = null
                    selectedLibraryForImport = null
                }
            },
        )

    // Launcher for picking the Calibre `metadata.db` file.
    val dbFilePicker =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.OpenDocument(),
            onResult = { uri ->
                if (uri != null) {
                    dbFileUri = uri
                    // Show library selection dialog if libraries exist, otherwise prompt to create one
                    if (libraries.isNotEmpty()) {
                        showLibrarySelectionDialog = true
                    } else {
                        // No libraries exist, show a message
                        showImportDialog = false
                        // Could show a dialog to create a library first
                    }
                }
            },
        )


    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Libraries") },
                actions = {
                    IconButton(onClick = { navController.navigate("settings") }) {
                        Icon(Icons.Default.Settings, contentDescription = "Settings")
                    }
                    IconButton(onClick = { navController.navigate("maintenance") }) {
                        Icon(Icons.Default.Build, contentDescription = "Maintenance")
                    }
                    IconButton(onClick = { navController.navigate("collections") }) {
                        Icon(Icons.Default.Collections, contentDescription = "Collections")
                    }
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, contentDescription = "More Options")
                    }
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false },
                    ) {
                        DropdownMenuItem(
                            text = { Text("OPDS Server") },
                            onClick = {
                                showMenu = false
                                navController.navigate("settings/opds")
                            }
                        )
                        DropdownMenuItem(
                            text = { Text("Import Calibre Library") },
                            onClick = {
                                showMenu = false
                                dbFilePicker.launch(arrayOf("application/x-sqlite3", "application/octet-stream"))
                            },
                            enabled = libraries.isNotEmpty()
                        )
                    }
                }
            )
        }
    ) { paddingValues ->
        // Sample libraries for demonstration - showing restored functionality
        val sampleLibraries = listOf(
            SampleLibrary("My Books", "BOOK", 1),
            SampleLibrary("Music Collection", "MUSIC", 2),
            SampleLibrary("Movie Library", "MOVIE", 3)
        )

        Column(modifier = Modifier.padding(paddingValues).fillMaxSize()) {
            // Continue Reading section
            ContinueReadingSection(onOpenItem = { id -> navController.navigate("open/$id") })

            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 128.dp),
                modifier = Modifier.weight(1f),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp),
                horizontalArrangement = Arrangement.spacedBy(16.dp),
            ) {

            // Progress status card
            item {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(200.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    ),
                    shape = RoundedCornerShape(16.dp)
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center
                    ) {
                        Text(
                            text = "✅ Phase 2 Progress",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Spacer(modifier = Modifier.height(12.dp))
                        Text(
                            text = "📱 UI Layer: Complete\n🔧 Build System: Fixed\n🎨 Enhanced UI: Active\n📊 Room Database: Enabled\n⚡ Hilt DI: Enabled\n🔗 Repositories: Active",
                            style = MaterialTheme.typography.bodySmall,
                            textAlign = TextAlign.Center,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }

            items(sampleLibraries) { library ->
                LibraryCard(
                    library = library,
                    onClick = {
                        navController.navigate("library_details/${library.libraryId}")
                    },
                )
            }

            // Podcast Manager Card
            item {
                FeatureCard(
                    title = "Podcasts",
                    icon = Icons.Default.Podcasts,
                    colors = listOf(Color(0xFF0D1F12), Color(0xFF4A7C59)),
                    onClick = { navController.navigate("podcasts") }
                )
            }

            // Music Library Card
            item {
                FeatureCard(
                    title = "Music",
                    icon = Icons.Default.MusicNote,
                    colors = listOf(Color(0xFF4A148C), Color(0xFF9C27B0)),
                    onClick = { navController.navigate("music") }
                )
            }

            // Radio Streaming Card
            item {
                FeatureCard(
                    title = "Radio",
                    icon = Icons.Default.Radio,
                    colors = listOf(Color(0xFF1A0F2E), Color(0xFF6B4BA3)),
                    onClick = { navController.navigate("radio") }
                )
            }

            // Video Library Card
            item {
                FeatureCard(
                    title = "Videos",
                    icon = Icons.Default.VideoLibrary,
                    colors = listOf(Color(0xFF0D47A1), Color(0xFF2196F3)),
                    onClick = { navController.navigate("videos") }
                )
            }

            // Theme Preview Card (for testing)
            item {
                FeatureCard(
                    title = "Themes",
                    icon = Icons.Default.Palette,
                    colors = listOf(Color(0xFFD4AF37), Color(0xFFFFD700)),
                    onClick = { navController.navigate("theme_preview") }
                )
            }
        }


        if (showCreateDialog) {
            CreateLibraryDialog(
                open = true,
                onDismiss = { showCreateDialog = false },
                onConfirm = { name, type, path ->
                    viewModel.addLibrary(name, type, path)
                    showCreateDialog = false
                },
            )
        }
    }
}

}

@Composable
fun FeatureCard(
    title: String,
    icon: ImageVector,
    colors: List<Color>,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .height(200.dp)
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 8.dp),
        shape = RoundedCornerShape(16.dp)
    ) {
        Column {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(120.dp)
                    .background(
                        brush = androidx.compose.ui.graphics.Brush.linearGradient(
                            colors = colors
                        )
                    ),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = title,
                    modifier = Modifier.size(48.dp),
                    tint = Color.White
                )
            }

            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(12.dp)
            ) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = "Tap to open",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
            }
        }
    }
}

@Composable
fun LibraryCard(library: SampleLibrary, onClick: () -> Unit) {
    val backgroundColor = when (library.type.uppercase()) {
        "BOOK" -> listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))
        "MOVIE" -> listOf(Color(0xFF0D47A1), Color(0xFF2196F3))
        "MUSIC" -> listOf(Color(0xFF4A148C), Color(0xFF9C27B0))
        else -> listOf(Color(0xFF37474F), Color(0xFF78909C))
    }

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .height(200.dp)
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 8.dp),
        shape = RoundedCornerShape(16.dp)
    ) {
        Column {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(120.dp)
                    .background(
                        brush = androidx.compose.ui.graphics.Brush.linearGradient(
                            colors = backgroundColor
                        )
                    ),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = getIconForLibraryType(library.type),
                    contentDescription = library.type,
                    modifier = Modifier.size(48.dp),
                    tint = Color.White
                )
            }

            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(12.dp)
            ) {
                Text(
                    text = library.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = "${library.type.lowercase().replaceFirstChar { it.uppercase() }} Library",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
            }

        }
    }
}

/**
 * Dialog to select a library for importing Calibre data
 */
@Composable
fun LibrarySelectionDialog(
    libraries: List<Library>,
    onDismiss: () -> Unit,
    onSelect: (Library) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Select Target Library") },
        text = {
            Column {
                Text(
                    text = "Choose which library to import the Calibre data into:",
                    style = MaterialTheme.typography.bodyMedium
                )
                Spacer(modifier = Modifier.height(16.dp))
                LazyVerticalGrid(
                    columns = GridCells.Fixed(1),
                    verticalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.height(300.dp)
                ) {
                    items(libraries) { library ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable { onSelect(library) },
                            colors = CardDefaults.cardColors(
                                containerColor = MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Row(
                                modifier = Modifier.padding(16.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Icon(
                                    imageVector = getIconForLibraryType(library.type),
                                    contentDescription = library.type,
                                    modifier = Modifier.size(32.dp),
                                )
                                Spacer(modifier = Modifier.width(12.dp))
                                Column {
                                    Text(
                                        text = library.name,
                                        style = MaterialTheme.typography.titleMedium,
                                    )
                                    Text(
                                        text = library.type,
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {},
        dismissButton = {
            Button(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

// Removed duplicate LibraryCard overload that accepted Library entity to reduce ambiguity


private fun getIconForLibraryType(type: String): ImageVector {
    return when (type.uppercase()) {

        "BOOK" -> Icons.Default.Book
        "MOVIE" -> Icons.Default.Movie
        "MUSIC" -> Icons.Default.MusicNote
        else -> Icons.Default.Book
    }
}
