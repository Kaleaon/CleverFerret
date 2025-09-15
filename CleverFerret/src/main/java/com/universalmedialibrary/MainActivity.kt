package com.universalmedialibrary

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Book
import androidx.compose.material.icons.filled.Edit
import androidx.compose.material.icons.filled.Movie
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material.icons.filled.MoreVert
import androidx.compose.material.icons.filled.QuestionMark
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.filled.StarBorder
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.music.MusicLibraryScreen
import com.universalmedialibrary.ui.player.QueueScreen
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.data.local.model.BookDetails
import com.universalmedialibrary.data.local.model.Library
import com.universalmedialibrary.services.CalibreImportForegroundService
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.ui.bookshelf.EnhancedBookshelfScreen
import com.universalmedialibrary.ui.details.LibraryDetailsViewModel
import com.universalmedialibrary.ui.main.MainViewModel
import androidx.compose.material.icons.filled.Settings
import com.universalmedialibrary.ui.settings.SettingsScreen
import com.universalmedialibrary.ui.settings.ApiSettingsScreen
import com.universalmedialibrary.ui.settings.APIKeysManagerScreen
import com.universalmedialibrary.ui.settings.ReaderSettingsScreen
import com.universalmedialibrary.ui.settings.SecuritySettingsScreen
import com.universalmedialibrary.ui.integration.PlexIntegrationScreen
import com.universalmedialibrary.ui.settings.AboutScreen
import com.universalmedialibrary.ui.metadata.MetadataEditorScreen
import com.universalmedialibrary.ui.theme.PlexTheme
import kotlin.math.absoluteValue
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.Settings
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import kotlinx.coroutines.launch
import dagger.hilt.android.AndroidEntryPoint
import com.universalmedialibrary.ui.details.BookDetailsScreen

@AndroidEntryPoint
class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Request permissions on first launch
        requestMediaPermissions()
        
        setContent {
            PlexTheme {
                AppNavigation()
            }
        }
    }
    
    private fun requestMediaPermissions() {
        val permissions = mutableListOf<String>()
        
        when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU -> {
                // Android 13+
                if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_MEDIA_IMAGES) != PackageManager.PERMISSION_GRANTED) {
                    permissions.add(Manifest.permission.READ_MEDIA_IMAGES)
                }
                if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_MEDIA_VIDEO) != PackageManager.PERMISSION_GRANTED) {
                    permissions.add(Manifest.permission.READ_MEDIA_VIDEO)
                }
                if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_MEDIA_AUDIO) != PackageManager.PERMISSION_GRANTED) {
                    permissions.add(Manifest.permission.READ_MEDIA_AUDIO)
                }
                if (ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
                    permissions.add(Manifest.permission.POST_NOTIFICATIONS)
                }
            }
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.R -> {
                // Android 11+
                if (!Environment.isExternalStorageManager()) {
                    val intent = Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION)
                    intent.data = Uri.parse("package:$packageName")
                    startActivity(intent)
                }
            }
            else -> {
                // Android 10 and below
                if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
                    permissions.add(Manifest.permission.READ_EXTERNAL_STORAGE)
                }
                if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.Q) {
                    if (ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
                        permissions.add(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                    }
                }
            }
        }
        
        if (permissions.isNotEmpty()) {
            ActivityCompat.requestPermissions(this, permissions.toTypedArray(), 1001)
        } else {
            // Permissions granted, start media scan
            startMediaScan()
        }
    }
    
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == 1001) {
            if (grantResults.all { it == PackageManager.PERMISSION_GRANTED }) {
                startMediaScan()
            }
        }
    }
    
    private fun startMediaScan() {
        val intent = Intent(this, MediaScannerService::class.java).apply {
            action = MediaScannerService.ACTION_SCAN_ALL
        }
        startService(intent)
    }
}

@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    NavHost(navController = navController, startDestination = "library_list") {
        composable("library_list") {
            LibraryListScreen(navController = navController)
        }
        composable("library_details/{libraryId}") { backStackEntry ->
            val libraryId = backStackEntry.arguments?.getString("libraryId")?.toLong() ?: 1L
            EnhancedBookshelfScreen(navController = navController, libraryId = libraryId)
        }
        composable("book_details/{bookId}") { backStackEntry ->
            val bookId = backStackEntry.arguments?.getString("bookId")?.toLong() ?: 0L
            BookDetailsScreen(bookId = bookId, navController = navController)
        }
        composable("metadata_editor/{bookId}") { backStackEntry ->
            val bookId = backStackEntry.arguments?.getString("bookId")?.toLong() ?: 0L
            MetadataEditorScreenWrapper(bookId = bookId, navController = navController)
        }
        composable("settings") {
            SettingsScreen(navController = navController)
        }
        composable("settings/api_keys") {
            APIKeysManagerScreen(navController = navController)
        }
        composable("settings/integrations/plex") {
            PlexIntegrationScreen()
        }
        composable("settings/apis/{mediaType}") { backStackEntry ->
            val mediaType = backStackEntry.arguments?.getString("mediaType") ?: "books"
            ApiSettingsScreen(navController = navController, mediaType = mediaType)
        }
        composable("settings/reader/{settingsType}") { backStackEntry ->
            val settingsType = backStackEntry.arguments?.getString("settingsType") ?: "visual"
            ReaderSettingsScreen(navController = navController, settingsType = settingsType)
        }
        composable("settings/security") {
            SecuritySettingsScreen(navController = navController)
        }
        composable("settings/about") {
            AboutScreen(navController = navController)
        }
        composable("music_library") {
            MusicLibraryScreen(navController = navController)
        }
        composable("audio_queue") {
            QueueScreen()
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryListScreen(navController: NavController, viewModel: MainViewModel = hiltViewModel()) {
    val libraries by viewModel.libraries.collectAsState()
    var showDialog by remember { mutableStateOf(false) }
    var showMenu by remember { mutableStateOf(false) }
    var showImportDialog by remember { mutableStateOf(false) }
    val context = LocalContext.current
    var dbFileUri by remember { mutableStateOf<Uri?>(null) }
    var importStatus by remember { mutableStateOf("") }
    var isImporting by remember { mutableStateOf(false) }
    val coroutineScope = rememberCoroutineScope()

    val rootFolderPicker = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.OpenDocumentTree(),
        onResult = { uri ->
            if (uri != null && dbFileUri != null) {
                isImporting = true
                importStatus = "Starting import..."
                val intent = Intent(context, CalibreImportForegroundService::class.java).apply {
                    putExtra(CalibreImportForegroundService.EXTRA_DB_PATH, dbFileUri.toString())
                    putExtra(CalibreImportForegroundService.EXTRA_ROOT_PATH, uri.toString())
                    // Create a default library for import
                    putExtra(CalibreImportForegroundService.EXTRA_LIBRARY_ID, 1L)
                }
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    context.startForegroundService(intent)
                } else {
                    context.startService(intent)
                }
                dbFileUri = null // Reset for next time
                
                // Show completion after a delay (in real app, this would be event-driven)
                // Using rememberCoroutineScope for proper coroutine handling
                coroutineScope.launch {
                    kotlinx.coroutines.delay(3000)
                    importStatus = "Import completed!"
                    kotlinx.coroutines.delay(2000)
                    isImporting = false
                    importStatus = ""
                }
            }
        }
    )

    val dbFilePicker = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.OpenDocument(),
        onResult = { uri ->
            if (uri != null) {
                dbFileUri = uri
                showImportDialog = false
                rootFolderPicker.launch(null)
            }
        }
    )

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Libraries") },
                actions = {
                    IconButton(onClick = { navController.navigate("settings") }) {
                        Icon(Icons.Default.Settings, contentDescription = "Settings")
                    }
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, contentDescription = "More Options")
                    }
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false }
                    ) {
                        DropdownMenuItem(
                            text = { Text("Import Calibre Library") },
                            onClick = {
                                showMenu = false
                                showImportDialog = true
                            }
                        )
                        DropdownMenuItem(
                            text = { Text("Open Music Library") },
                            onClick = {
                                showMenu = false
                                navController.navigate("music_library")
                            }
                        )
                        DropdownMenuItem(
                            text = { Text("Now Playing Queue") },
                            onClick = {
                                showMenu = false
                                navController.navigate("audio_queue")
                            }
                        )
                        DropdownMenuItem(
                            text = { Text("Refresh Libraries") },
                            onClick = {
                                showMenu = false
                                // Refresh functionality would go here
                            }
                        )
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(onClick = { showDialog = true }) {
                Icon(Icons.Default.Add, contentDescription = "Add Library")
            }
        }
    ) { paddingValues ->
        Box(modifier = Modifier.fillMaxSize()) {
            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 128.dp),
                modifier = Modifier.padding(paddingValues),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp),
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                items(libraries) { library ->
                    LibraryCard(
                        library = library,
                        onClick = {
                            navController.navigate("library_details/${'$'}{library.libraryId}")
                        }
                    )
                }
            }

            // Import status overlay
            if (isImporting) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(Color.Black.copy(alpha = 0.5f)),
                    contentAlignment = Alignment.Center
                ) {
                    Card(
                        modifier = Modifier.padding(32.dp),
                        elevation = CardDefaults.cardElevation(defaultElevation = 8.dp)
                    ) {
                        Column(
                            modifier = Modifier.padding(24.dp),
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            CircularProgressIndicator()
                            Spacer(modifier = Modifier.height(16.dp))
                            Text(
                                text = importStatus,
                                style = MaterialTheme.typography.bodyLarge
                            )
                        }
                    }
                }
            }
        }

        // Import Dialog
        if (showImportDialog) {
            AlertDialog(
                onDismissRequest = { showImportDialog = false },
                title = { Text("Import Calibre Library") },
                text = {
                    Column {
                        Text("To import your Calibre library, you'll need to:")
                        Text("1. Select your Calibre metadata.db file")
                        Text("2. Select your Calibre library folder")
                        Spacer(modifier = Modifier.height(8.dp))
                        Text("This process may take several minutes depending on the size of your library.")
                    }
                },
                confirmButton = {
                    Button(
                        onClick = {
                            dbFilePicker.launch(arrayOf("application/x-sqlite3", "application/octet-stream", "*/*"))
                        }
                    ) {
                        Text("Choose Database File")
                    }
                },
                dismissButton = {
                    Button(onClick = { showImportDialog = false }) {
                        Text("Cancel")
                    }
                }
            )
        }

        if (showDialog) {
            AddLibraryDialog(
                onDismiss = { showDialog = false },
                onAdd = { name ->
                    viewModel.addLibrary(name, "BOOK", "/path/to/library")
                    showDialog = false
                }
            )
        }
    }
}

@Composable
fun MetadataEditorScreenWrapper(bookId: Long, navController: NavController) {
    MetadataEditorScreen(
        itemId = bookId,
        onSave = {
            // In a real implementation, this would save to the database
            navController.navigateUp()
        },
        onCancel = {
            navController.navigateUp()
        }
    )
}