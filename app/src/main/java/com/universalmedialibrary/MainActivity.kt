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
import com.universalmedialibrary.data.local.model.BookDetails
import com.universalmedialibrary.data.local.model.Library
import com.universalmedialibrary.services.CalibreImportForegroundService
import com.universalmedialibrary.ui.details.LibraryDetailsViewModel
import com.universalmedialibrary.ui.library.ImprovedLibraryListScreen
import com.universalmedialibrary.ui.library.LibraryManagementViewModel
import com.universalmedialibrary.ui.main.MainViewModel
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
            AppNavigation()
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
            val libraryManagementViewModel: LibraryManagementViewModel = hiltViewModel()
            ImprovedLibraryListScreen(
                onNavigateToLibrary = { id -> navController.navigate("library_details/$id") },
                onNavigateToSettings = { navController.navigate("settings") },
                onCreateLibrary = { name, type, path -> 
                    libraryManagementViewModel.createLibrary(name, type, path)
                },
                onRefresh = { /* no-op; flows auto-update */ }
            )
        }
        composable("library_details/{libraryId}") {
            LibraryDetailsScreen()
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
    var showDialog by remember { mutableStateOf(false) }
    var showMenu by remember { mutableStateOf(false) }
    val context = LocalContext.current
    var dbFileUri by remember { mutableStateOf<Uri?>(null) }

    // Launcher for picking the root folder of the Calibre library.
    // This is triggered after the user selects the metadata.db file.
    val rootFolderPicker =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.OpenDocumentTree(),
            onResult = { uri ->
                if (uri != null && dbFileUri != null) {
                    val intent =
                        Intent(context, CalibreImportForegroundService::class.java).apply {
                            putExtra(CalibreImportForegroundService.EXTRA_DB_PATH, dbFileUri.toString())
                            putExtra(CalibreImportForegroundService.EXTRA_ROOT_PATH, uri.toString())
                            // For now, we'll import into a placeholder library. A real implementation
                            // would have the user select or create a library first.
                            putExtra(CalibreImportForegroundService.EXTRA_LIBRARY_ID, 1L)
                        }
                    context.startForegroundService(intent)
                    dbFileUri = null // Reset for next time
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
                    rootFolderPicker.launch(null) // Chain the folder picker
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
                        )
                    }
                },
            )
        },
        floatingActionButton = {
            FloatingActionButton(onClick = { showDialog = true }) {
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

        if (showDialog) {
            AddLibraryDialog(
                onDismiss = { showDialog = false },
                onAdd = { name ->
                    // Note: Hardcoded type and path are used here.
                    viewModel.addLibrary(name, "BOOK", "/path/to/library")
                    showDialog = false
                },
            )
        }
    }
}

/**
 * A screen that displays the contents of a single library, showing a grid of books.
 *
 * @param viewModel The [LibraryDetailsViewModel] for this screen, provided by Hilt.
 */
@Composable
fun LibraryDetailsScreen(viewModel: LibraryDetailsViewModel = hiltViewModel()) {
    val bookDetails by viewModel.bookDetails.collectAsState()

    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 128.dp),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp),
        horizontalArrangement = Arrangement.spacedBy(16.dp),
    ) {
        items(bookDetails) { book ->
            BookCard(book = book)
        }
    }
}

/**
 * A composable that displays a single book as a card, showing its cover and title.
 *
 * @param book The [BookDetails] object containing the information to display.
 */
@Composable
fun BookCard(book: BookDetails) {
    Card(
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
    ) {
        Column {
            PlaceholderCover(
                title = book.metadata.title,
                author = book.authorName,
            )
            Text(
                text = book.metadata.title,
                style = MaterialTheme.typography.titleSmall,
                modifier = Modifier.padding(8.dp),
            )
        }
    }
}

/**
 * A composable that generates a placeholder book cover.
 * It displays the title and author on a colored background, with the color determined by the title's hash code.
 *
 * @param title The title of the book.
 * @param author The author of the book.
 */
@Composable
fun PlaceholderCover(
    title: String,
    author: String?,
) {
    val colors =
        listOf(
            Color(0xFFE57373),
            Color(0xFF81C784),
            Color(0xFF64B5F6),
            Color(0xFFF06292),
            Color(0xFF4DB6AC),
            Color(0xFFFFD54F),
        )
    val color = colors[title.hashCode() % colors.size]

    Box(
        modifier =
            Modifier
                .fillMaxWidth()
                .height(180.dp)
                .background(color),
        contentAlignment = Alignment.Center,
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                textAlign = TextAlign.Center,
                color = Color.White,
            )
            if (author != null) {
                Text(
                    text = author,
                    style = MaterialTheme.typography.bodyMedium,
                    textAlign = TextAlign.Center,
                    color = Color.White,
                )
            }
        }
    }
}

/**
 * An [AlertDialog] for adding a new library.
 *
 * @param onDismiss Callback invoked when the dialog is dismissed.
 * @param onAdd Callback invoked with the new library name when the "Add" button is clicked.
 */
@Composable
fun AddLibraryDialog(
    onDismiss: () -> Unit,
    onAdd: (String) -> Unit,
) {
    var name by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add New Library") },
        text = {
            TextField(
                value = name,
                onValueChange = { name = it },
                label = { Text("Library Name") },
            )
        },
        confirmButton = {
            Button(
                onClick = { onAdd(name) },
                enabled = name.isNotBlank(),
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            Button(onClick = onDismiss) {
                Text("Cancel")
            }
        },
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

/**
 * A helper function that returns an appropriate [ImageVector] icon for a given library type.
 *
 * @param type The type of the library (e.g., "BOOK", "MOVIE").
 * @return An [ImageVector] corresponding to the library type.
 */
private fun getIconForLibraryType(type: String): ImageVector =
    when (type.uppercase()) {
        "BOOK" -> Icons.Default.Book
        "MOVIE" -> Icons.Default.Movie
        "MUSIC" -> Icons.Default.MusicNote
        else -> Icons.Default.QuestionMark
    }
