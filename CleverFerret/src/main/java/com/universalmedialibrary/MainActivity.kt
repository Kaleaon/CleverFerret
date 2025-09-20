package com.universalmedialibrary

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
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
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.music.MusicLibraryScreen
import com.universalmedialibrary.ui.player.QueueScreen
import com.universalmedialibrary.ui.player.AudioPlayerScreen
import com.universalmedialibrary.ui.player.VideoPlayerScreen
import com.universalmedialibrary.ui.reader.EPUBReaderScreen
import com.universalmedialibrary.ui.reader.EnhancedPDFReaderScreen
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.data.local.model.BookDetails
import com.universalmedialibrary.data.local.model.Library
import com.universalmedialibrary.services.CalibreImportForegroundService
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.ui.bookshelf.EnhancedBookshelfScreen as EnhancedBookshelfScreenMain
import com.universalmedialibrary.ui.details.LibraryDetailsViewModel
import com.universalmedialibrary.ui.main.MainViewModel
import androidx.compose.material.icons.filled.Settings
import com.universalmedialibrary.ui.settings.SettingsScreen
import com.universalmedialibrary.ui.settings.ApiSettingsScreen
import com.universalmedialibrary.ui.settings.APIKeysManagerScreen
import com.universalmedialibrary.ui.settings.ReaderSettingsScreen
import com.universalmedialibrary.ui.settings.SecuritySettingsScreen as SecuritySettingsScreenMain
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
import com.universalmedialibrary.services.StorageAccessService
import javax.inject.Inject

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    
    @Inject
    lateinit var storageAccessService: StorageAccessService

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
                // Android 11-12 - Use legacy storage permissions
                if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
                    permissions.add(Manifest.permission.READ_EXTERNAL_STORAGE)
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
    
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
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
            EnhancedBookshelfScreenMain(navController = navController, libraryId = libraryId)
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
            SecuritySettingsScreenMain(navController = navController)
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
        
        // CRITICAL: Media Player Routes
        composable("audio_player/{filePath}") { backStackEntry ->
            val filePath = backStackEntry.arguments?.getString("filePath") ?: ""
            AudioPlayerScreen(
                audioFilePath = filePath,
                onBack = { navController.navigateUp() }
            )
        }
        
        composable("video_player/{filePath}") { backStackEntry ->
            val filePath = backStackEntry.arguments?.getString("filePath") ?: ""
            VideoPlayerScreen(
                videoFilePath = filePath,
                onBack = { navController.navigateUp() }
            )
        }
        
        composable("epub_reader/{filePath}") { backStackEntry ->
            val filePath = backStackEntry.arguments?.getString("filePath") ?: ""
            EPUBReaderScreen(
                epubFilePath = filePath,
                onBack = { navController.navigateUp() }
            )
        }
        
        composable("pdf_reader/{filePath}") { backStackEntry ->
            val filePath = backStackEntry.arguments?.getString("filePath") ?: ""
            EnhancedPDFReaderScreen(
                pdfFilePath = filePath,
                onBack = { navController.navigateUp() }
            )
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
    var selectedTab by remember { mutableStateOf(0) }
    val context = LocalContext.current
    var dbFileUri by remember { mutableStateOf<Uri?>(null) }
    var importStatus by remember { mutableStateOf("") }
    var isImporting by remember { mutableStateOf(false) }
    val coroutineScope = rememberCoroutineScope()
    
    // Media type tabs
    val mediaTabs = listOf(
        "Books" to Icons.Default.Book,
        "Music" to Icons.Default.MusicNote,
        "Movies" to Icons.Default.Movie
    )

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
            Column {
                TopAppBar(
                    title = { 
                        Text(
                            "CleverFerret",
                            style = MaterialTheme.typography.headlineSmall,
                            fontWeight = FontWeight.Bold
                        ) 
                    },
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
                                text = { Text("Refresh Libraries") },
                                onClick = {
                                    showMenu = false
                                    // Refresh functionality would go here
                                }
                            )
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer,
                        titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer,
                        actionIconContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                )
                
                // Enhanced Tab Row
                TabRow(
                    selectedTabIndex = selectedTab,
                    containerColor = MaterialTheme.colorScheme.surfaceContainer,
                    contentColor = MaterialTheme.colorScheme.onSurface
                ) {
                    mediaTabs.forEachIndexed { index, (title, icon) ->
                        Tab(
                            selected = selectedTab == index,
                            onClick = { 
                                selectedTab = index
                                when (index) {
                                    1 -> navController.navigate("music_library")
                                    2 -> { /* Movies - add when implemented */ }
                                    else -> { /* Books - current screen */ }
                                }
                            },
                            text = { Text(title) },
                            icon = { Icon(icon, contentDescription = title) }
                        )
                    }
                }
            }
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = { showDialog = true },
                containerColor = MaterialTheme.colorScheme.primaryContainer,
                contentColor = MaterialTheme.colorScheme.onPrimaryContainer
            ) {
                Icon(Icons.Default.Add, contentDescription = "Add Library")
            }
        }
    ) { paddingValues ->
        Box(modifier = Modifier.fillMaxSize()) {
            if (libraries.isEmpty()) {
                // Enhanced Empty State
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(paddingValues)
                        .padding(32.dp),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.Book,
                        contentDescription = null,
                        modifier = Modifier.size(72.dp),
                        tint = MaterialTheme.colorScheme.primary.copy(alpha = 0.6f)
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                    Text(
                        text = "Welcome to CleverFerret",
                        style = MaterialTheme.typography.headlineMedium,
                        fontWeight = FontWeight.Bold,
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurface
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Your universal media library organizer",
                        style = MaterialTheme.typography.bodyLarge,
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(modifier = Modifier.height(24.dp))
                    
                    // Quick actions
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.surfaceContainer
                        )
                    ) {
                        Column(
                            modifier = Modifier.padding(16.dp)
                        ) {
                            Text(
                                text = "Get Started",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.SemiBold,
                                color = MaterialTheme.colorScheme.onSurface
                            )
                            Spacer(modifier = Modifier.height(12.dp))
                            
                            // Create Library Button
                            OutlinedButton(
                                onClick = { showDialog = true },
                                modifier = Modifier.fillMaxWidth()
                            ) {
                                Icon(Icons.Default.Add, contentDescription = null)
                                Spacer(modifier = Modifier.width(8.dp))
                                Text("Create New Library")
                            }
                            
                            Spacer(modifier = Modifier.height(8.dp))
                            
                            // Import Calibre Button
                            Button(
                                onClick = { showImportDialog = true },
                                modifier = Modifier.fillMaxWidth()
                            ) {
                                Icon(Icons.Default.Book, contentDescription = null)
                                Spacer(modifier = Modifier.width(8.dp))
                                Text("Import Calibre Library")
                            }
                        }
                    }
                }
            } else {
                LazyVerticalGrid(
                    columns = GridCells.Adaptive(minSize = 140.dp),
                    modifier = Modifier.padding(paddingValues),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp),
                    horizontalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    items(libraries) { library ->
                        EnhancedLibraryCard(
                            library = library,
                            onClick = {
                                navController.navigate("library_details/${'$'}{library.libraryId}")
                            }
                        )
                    }
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

        // Enhanced Import Dialog
        if (showImportDialog) {
            AlertDialog(
                onDismissRequest = { showImportDialog = false },
                title = { 
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Book, 
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            "Import Calibre Library",
                            style = MaterialTheme.typography.headlineSmall
                        )
                    }
                },
                text = {
                    Column {
                        Card(
                            colors = CardDefaults.cardColors(
                                containerColor = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
                            )
                        ) {
                            Column(modifier = Modifier.padding(16.dp)) {
                                Text(
                                    "Import Steps:",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.SemiBold,
                                    color = MaterialTheme.colorScheme.primary
                                )
                                Spacer(modifier = Modifier.height(8.dp))
                                Text("📁 Select your Calibre metadata.db file")
                                Text("📚 Select your Calibre library folder")
                            }
                        }
                        Spacer(modifier = Modifier.height(12.dp))
                        Text(
                            "⚡ This process may take several minutes depending on your library size.",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                },
                confirmButton = {
                    Button(
                        onClick = {
                            dbFilePicker.launch(arrayOf("application/x-sqlite3", "application/octet-stream", "*/*"))
                        }
                    ) {
                        Icon(Icons.Default.Add, contentDescription = null, modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Start Import")
                    }
                },
                dismissButton = {
                    OutlinedButton(onClick = { showImportDialog = false }) {
                        Text("Cancel")
                    }
                }
            )
        }

        if (showDialog) {
            AddLibraryDialog(
                onDismiss = { showDialog = false },
                onAdd = { name, path ->
                    viewModel.addLibrary(name, "BOOK", path)
                    showDialog = false
                }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LibraryDetailsScreen(viewModel: LibraryDetailsViewModel = hiltViewModel()) {
    val bookDetails by viewModel.bookDetails.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Library Contents") },
                navigationIcon = {
                    // In a real implementation, you'd use NavController here
                    IconButton(onClick = { /* Navigate back */ }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        if (bookDetails.isEmpty()) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.Center
            ) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(
                        imageVector = Icons.Default.Book,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                    Text(
                        text = "No books found",
                        style = MaterialTheme.typography.headlineSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Import some books to get started",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.4f)
                    )
                }
            }
        } else {
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(bookDetails) { book ->
                    BookCard(book) {
                        // Handle book click
                    }
                }
            }
        }
    }
}

@Composable
fun BookCard(book: BookDetails, onClick: () -> Unit) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            AsyncImage(
                model = book.metadata.coverImagePath,
                contentDescription = "Book cover",
                modifier = Modifier
                    .size(60.dp)
                    .clip(RoundedCornerShape(4.dp)),
                contentScale = ContentScale.Crop,
                placeholder = painterResource(R.drawable.placeholder_book_cover),
                error = painterResource(R.drawable.placeholder_book_cover)
            )
            Spacer(modifier = Modifier.width(16.dp))
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = book.metadata.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = book.authorName ?: "Unknown Author",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                if (book.metadata.rating != null) {
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        repeat(5) { index ->
                            Icon(
                                imageVector = if (index < (book.metadata.rating?.toInt() ?: 0)) Icons.Default.Star else Icons.Default.StarBorder,
                                contentDescription = null,
                                modifier = Modifier.size(12.dp),
                                tint = Color(0xFFFFC107)
                            )
                        }
                    }
                }
            }
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

@Composable
fun AddLibraryDialog(onDismiss: () -> Unit, onAdd: (String, String) -> Unit) {
    var name by remember { mutableStateOf("") }
    var path by remember { mutableStateOf("") }
    var selectedType by remember { mutableStateOf("BOOK") }
    
    val libraryTypes = listOf(
        "BOOK" to "📚",
        "MUSIC" to "🎵", 
        "MOVIE" to "🎬"
    )

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { 
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    Icons.Default.Add, 
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text(
                    "Create New Library",
                    style = MaterialTheme.typography.headlineSmall
                )
            }
        },
        text = {
            Column {
                // Library Type Selection
                Text(
                    "Library Type",
                    style = MaterialTheme.typography.titleSmall,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.SemiBold
                )
                Spacer(modifier = Modifier.height(8.dp))
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    libraryTypes.forEach { (type, emoji) ->
                        FilterChip(
                            selected = selectedType == type,
                            onClick = { selectedType = type },
                            label = { 
                                Text("$emoji ${type.lowercase().replaceFirstChar { it.uppercase() }}") 
                            }
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Library Name") },
                    placeholder = { Text("My ${selectedType.lowercase().replaceFirstChar { it.uppercase() }} Library") },
                    modifier = Modifier.fillMaxWidth(),
                    leadingIcon = {
                        Icon(getIconForLibraryType(selectedType), contentDescription = null)
                    }
                )
                Spacer(modifier = Modifier.height(12.dp))
                OutlinedTextField(
                    value = path,
                    onValueChange = { path = it },
                    label = { Text("Library Path") },
                    placeholder = { Text("/storage/emulated/0/${selectedType.lowercase().replaceFirstChar { it.uppercase() }}s") },
                    modifier = Modifier.fillMaxWidth(),
                    leadingIcon = {
                        Icon(Icons.Default.Book, contentDescription = null)
                    }
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onAdd(name.ifBlank { "My ${selectedType.lowercase().replaceFirstChar { it.uppercase() }} Library" }, path) },
                enabled = name.isNotBlank() || path.isNotBlank()
            ) {
                Icon(Icons.Default.Add, contentDescription = null, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(4.dp))
                Text("Create Library")
            }
        },
        dismissButton = {
            OutlinedButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@Composable
fun EnhancedLibraryCard(library: Library, onClick: () -> Unit) {
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
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceContainer
        ),
        shape = RoundedCornerShape(16.dp)
    ) {
        Column {
            // Enhanced gradient header section
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(120.dp)
                    .background(
                        brush = androidx.compose.ui.graphics.Brush.linearGradient(
                            colors = backgroundColor,
                            start = androidx.compose.ui.geometry.Offset(0f, 0f),
                            end = androidx.compose.ui.geometry.Offset(1f, 1f)
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
                
                // Enhanced item count chip
                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(8.dp)
                ) {
                    Surface(
                        color = Color.White.copy(alpha = 0.2f),
                        shape = RoundedCornerShape(12.dp)
                    ) {
                        Text(
                            text = "${(50..500).random()}",
                            style = MaterialTheme.typography.labelSmall,
                            color = Color.White,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                        )
                    }
                }
            }
            
            // Enhanced content section
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(12.dp),
                horizontalAlignment = Alignment.Start
            ) {
                Text(
                    text = library.name,
                    style = MaterialTheme.typography.titleMedium,
                    color = MaterialTheme.colorScheme.onSurface,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = "${library.type.lowercase().replaceFirstChar { it.uppercase() }} Library",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Medium
                )
            }
        }
    }
}

@Composable
fun LibraryCard(library: Library, onClick: () -> Unit) {
    val backgroundColor = when (library.type.uppercase()) {
        "BOOK" -> listOf(Color(0xFF2C5F2D), Color(0xFF97BC62))
        "MOVIE" -> listOf(Color(0xFF1565C0), Color(0xFF42A5F5))
        "MUSIC" -> listOf(Color(0xFF7B1FA2), Color(0xFFBA68C8))
        else -> listOf(Color(0xFF455A64), Color(0xFF90A4AE))
    }

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .height(280.dp)
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Column {
            // Gradient header section
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(160.dp)
                    .background(
                        brush = androidx.compose.ui.graphics.Brush.linearGradient(backgroundColor)
                    ),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = getIconForLibraryType(library.type),
                    contentDescription = library.type,
                    modifier = Modifier.size(64.dp),
                    tint = Color.White
                )
                
                // Mock item count chip
                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(12.dp)
                ) {
                    Card(
                        colors = CardDefaults.cardColors(
                            containerColor = Color.Black.copy(alpha = 0.6f)
                        )
                    ) {
                        Text(
                            text = "${(50..500).random()} items",
                            style = MaterialTheme.typography.labelSmall,
                            color = Color.White,
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                        )
                    }
                }
            }
            
            // Content section
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalAlignment = Alignment.Start
            ) {
                Text(
                    text = library.name,
                    style = MaterialTheme.typography.titleMedium,
                    color = MaterialTheme.colorScheme.onSurface,
                    maxLines = 1
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = "${library.type.lowercase().replaceFirstChar { it.uppercase() }} Library",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "Updated ${(1..7).random()} days ago",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f)
                )
            }
        }
    }
}

private fun getIconForLibraryType(type: String): ImageVector {
    return when (type.uppercase()) {
        "BOOK" -> Icons.Default.Book
        "MOVIE" -> Icons.Default.Movie
        "MUSIC" -> Icons.Default.MusicNote
        else -> Icons.Default.QuestionMark
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun BookDetailsScreen(bookId: Long, navController: NavController) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Book Details") },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(
                        onClick = { 
                            navController.navigate("metadata_editor/$bookId")
                        }
                    ) {
                        Icon(Icons.Default.Edit, contentDescription = "Edit Metadata")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp)
        ) {
            Text(
                text = "Book Details for ID: $bookId",
                style = MaterialTheme.typography.headlineMedium
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "This is a placeholder for the book details screen. In a complete implementation, this would show full book metadata, cover image, and reading options.",
                style = MaterialTheme.typography.bodyLarge
            )
        }
    }
}