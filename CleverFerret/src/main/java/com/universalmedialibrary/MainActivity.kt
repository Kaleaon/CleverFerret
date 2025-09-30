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

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Book
import androidx.compose.material.icons.filled.MoreVert
import androidx.compose.material.icons.filled.Movie
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material.icons.filled.QuestionMark

import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.services.CalibreImportForegroundService
import com.universalmedialibrary.ui.library.CreateLibraryDialog
import com.universalmedialibrary.ui.library.LibraryDetailsScreen
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.PlexTheme

import dagger.hilt.android.AndroidEntryPoint


/**
 * The main and only activity of the application, serving as the entry point for the UI.
 * It is annotated with [AndroidEntryPoint] to enable Hilt dependency injection.
 */
@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        setContent {
            PlexTheme {
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
    NavHost(navController = navController, startDestination = "library_list") {
        composable("library_list") {
            LibraryListScreen(navController = navController)
        }
        composable("library_details/{libraryId}") { backStackEntry ->
            val libraryId = backStackEntry.arguments?.getString("libraryId")?.toIntOrNull() ?: 0
            LibraryDetailsScreen(
                libraryId = libraryId,
                onNavigateBack = { navController.navigateUp() }
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
    viewModel: MainViewModel = hiltViewModel(),
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
                if (uri != null && dbFileUri != null && selectedLibraryForImport != null) {
                    val intent =
                        Intent(context, CalibreImportForegroundService::class.java).apply {
                            putExtra(CalibreImportForegroundService.EXTRA_DB_PATH, dbFileUri.toString())
                            putExtra(CalibreImportForegroundService.EXTRA_ROOT_PATH, uri.toString())
                            putExtra(CalibreImportForegroundService.EXTRA_LIBRARY_ID, selectedLibraryForImport!!.libraryId)
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
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, contentDescription = "More Options")
                    }
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false },
                    ) {
                        DropdownMenuItem(
                            text = { Text("Import Calibre Library") },
                            onClick = {
                                showMenu = false
                                dbFilePicker.launch(arrayOf("application/x-sqlite3", "application/octet-stream"))
                            },
                            enabled = libraries.isNotEmpty()

    var selectedTab by remember { mutableStateOf(0) }
    
    // Sample libraries for demonstration - showing restored functionality
    val sampleLibraries = listOf(
        SampleLibrary("My Books", "BOOK", 1),
TopAppBar(
                    title = { 
                        Text(
                            "CleverFerret - Advanced Features Restored! 🚀",
                            style = MaterialTheme.typography.headlineSmall,
                            fontWeight = FontWeight.Bold
                        ) 
                    },
                    actions = {
                        IconButton(onClick = { navController.navigate("settings") }) {
                            Icon(PhosphorIcons.Gear, contentDescription = "Settings")
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer,
                        titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer,
                        actionIconContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                )
                
                TabRow(
                    selectedTabIndex = selectedTab,
                    containerColor = MaterialTheme.colorScheme.surfaceContainer
                ) {
                    mediaTabs.forEachIndexed { index, (title, icon) ->
                        Tab(
                            selected = selectedTab == index,
                            onClick = { selectedTab = index },
                            text = { Text(title) },
                           
                        )
                    }
                },
            )
        },
        floatingActionButton = {

            FloatingActionButton(onClick = { showCreateDialog = true }) {
                Icon(Icons.Default.Add, contentDescription = "Add Library")

            }
        },
    ) { paddingValues ->
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 128.dp),
            modifier = Modifier.padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp),
            horizontalArrangement = Arrangement.spacedBy(16.dp),
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

        // Show create library dialog
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

        // Show library selection dialog for import
        if (showLibrarySelectionDialog) {
            LibrarySelectionDialog(
                libraries = libraries,
                onDismiss = { 
                    showLibrarySelectionDialog = false
                    dbFileUri = null
                },
                onSelect = { library ->
                    selectedLibraryForImport = library
                    showLibrarySelectionDialog = false
                    rootFolderPicker.launch(null)
                }
            )
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

/**
 * A composable that displays a single library as a card, showing an icon and its name.
 *
 * @param library The [Library] object containing the information to display.
 * @param onClick Callback invoked when the card is clicked.
 */
@Composable
fun LibraryCard(
    library: Library,
    onClick: () -> Unit,
) {
    Card(
        modifier =
            Modifier
                .fillMaxWidth()
                .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center,
        ) {
            Icon(
                imageVector = getIconForLibraryType(library.type),
                contentDescription = library.type,
                modifier = Modifier.size(48.dp),
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = library.name,
                style = MaterialTheme.typography.titleMedium,
            )
        }
    }
}


private fun getIconForLibraryType(type: String): ImageVector {
    return when (type.uppercase()) {
        "BOOK" -> PhosphorIcons.Book
        "MOVIE" -> PhosphorIcons.FilmStrip
        "MUSIC" -> PhosphorIcons.MusicNote
        else -> PhosphorIcons.Book

    }
