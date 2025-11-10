package com.universalmedialibrary

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Bundle
import java.io.File
import java.net.URLEncoder
import java.net.URLDecoder
import java.nio.charset.StandardCharsets
import java.util.UUID
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import androidx.activity.ComponentActivity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.compose.setContent
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.itemsIndexed
import androidx.compose.foundation.lazy.grid.items as gridItems
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowForward
import androidx.compose.material.icons.filled.Book
import androidx.compose.material.icons.filled.Build
import androidx.compose.material.icons.filled.CameraAlt
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Collections
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material.icons.filled.FolderOpen
import androidx.compose.material.icons.filled.GraphicEq
import androidx.compose.material.icons.filled.Headphones
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.LibraryBooks
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material.icons.filled.MoreVert
import androidx.compose.material.icons.filled.Movie
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material.icons.filled.Podcasts
import androidx.compose.material.icons.filled.Radio
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material.icons.filled.Sync
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.maintenance.MaintenanceScreen
import com.universalmedialibrary.ui.collections.CollectionsScreen
import com.universalmedialibrary.ui.home.ContinueReadingSection
import com.universalmedialibrary.ui.home.MediaRecommendation
import com.universalmedialibrary.ui.home.MediaPosterCard
import com.universalmedialibrary.ui.home.QuickAccessCard
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.ui.home.SampleClassic
import com.universalmedialibrary.services.CalibreImportForegroundService
import com.universalmedialibrary.ui.main.SampleDownloadStatus
import com.universalmedialibrary.ui.library.CreateLibraryDialog
import com.universalmedialibrary.ui.library.LibraryDetailsScreen
import com.universalmedialibrary.ui.open.MediaOpenScreen
import com.universalmedialibrary.ui.reader.EnhancedEReaderScreen
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.ComicReaderScreen
import com.universalmedialibrary.ui.settings.StorageOrganizerScreen
import com.universalmedialibrary.ui.settings.PlaylistSettingsScreen
import com.universalmedialibrary.ui.settings.OpdsSettingsScreen
import com.universalmedialibrary.ui.settings.MediaServerSettingsScreen
import com.universalmedialibrary.ui.settings.NetworkStorageSettingsScreen
import com.universalmedialibrary.ui.settings.AudioEffectsSettingsScreen
import com.universalmedialibrary.ui.settings.LastFmSettingsScreen
import com.universalmedialibrary.ui.settings.AudioProfilesScreen
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.theme.toCleverFerretTheme
import com.universalmedialibrary.ui.components.NavigationItem
import com.universalmedialibrary.ui.components.ResponsiveNavigationScaffold
import com.universalmedialibrary.ui.components.MediaControlsBar
import com.universalmedialibrary.ui.components.rememberMediaControlsState
import com.universalmedialibrary.ui.ambient.AmbientSoundScreen
import com.universalmedialibrary.ui.ambient.AmbientSoundViewModel
import com.universalmedialibrary.utils.rememberPermissionsHandler
import com.universalmedialibrary.utils.PermissionsHandler
import dagger.hilt.android.AndroidEntryPoint
import androidx.compose.ui.res.painterResource
import com.universalmedialibrary.ui.icons.PhosphorIcons
import java.util.Locale


/**
 * Sample library data class for demonstration purposes.
 * 
 * @property name Display name of the library
 * @property type Media type (BOOK, MOVIE, MUSIC, etc.)
 * @property libraryId Unique identifier for the library
 */
data class SampleLibrary(
    val name: String,
    val type: String,
    val libraryId: Long
)


/**
 * MainActivity - The main and only activity of the application.
 * 
 * This activity serves as the entry point for the CleverFerret app's UI,
 * hosting the entire Compose-based navigation graph. It is annotated with
 * [AndroidEntryPoint] to enable Hilt dependency injection throughout the app.
 * 
 * Key responsibilities:
 * - Theme configuration based on user settings
 * - Main navigation setup
 * - Permission handling
 * 
 * @see AppNavigation for the navigation graph structure
 */

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    private var externalFileUri by mutableStateOf<Uri?>(null)
    
    // ScreenTimeoutManager instance to be accessed by reader screens
    lateinit var screenTimeoutManager: com.universalmedialibrary.utils.ScreenTimeoutManager
        private set

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Initialize ScreenTimeoutManager
        screenTimeoutManager = com.universalmedialibrary.utils.ScreenTimeoutManager(this)
        
        // Restore external file URI from saved state if available
        savedInstanceState?.getString(KEY_EXTERNAL_FILE_URI)?.let { uriString ->
            externalFileUri = Uri.parse(uriString)
        }
        
        // Handle intent for opening external files
        handleIntent(intent)
        
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
                    AppNavigation(externalFileUri = externalFileUri)
                }
            }
        }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        // Save external file URI to survive configuration changes
        externalFileUri?.toString()?.let { uriString ->
            outState.putString(KEY_EXTERNAL_FILE_URI, uriString)
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        handleIntent(intent)
    }

    private fun handleIntent(intent: Intent?) {
        if (intent?.action == Intent.ACTION_VIEW) {
            externalFileUri = intent.data
        }
    }
    
    override fun onUserInteraction() {
        super.onUserInteraction()
        // Notify ScreenTimeoutManager about user interaction to reset timeout
        if (::screenTimeoutManager.isInitialized) {
            screenTimeoutManager.onUserInteraction()
        }
    }
    
    override fun onDestroy() {
        super.onDestroy()
        // Clean up ScreenTimeoutManager resources
        if (::screenTimeoutManager.isInitialized) {
            screenTimeoutManager.cleanup()
        }
    }

    companion object {
        private const val KEY_EXTERNAL_FILE_URI = "external_file_uri"
    }
}

/**
 * Sets up the navigation for the entire application using Jetpack Compose Navigation.
 * It defines the navigation graph and the composable destinations.
 * Now with responsive navigation that adapts to screen size.
 */
@Composable
fun AppNavigation(externalFileUri: Uri? = null) {
    val navController = rememberNavController()
    val context = LocalContext.current
    val mainViewModel: MainViewModel = hiltViewModel()
    val libraries by mainViewModel.libraries.collectAsState()
    val gearPosition by mainViewModel.bottomGearPosition.collectAsState()
    var bottomBarVisible by rememberSaveable { mutableStateOf(true) }

    val settingsItem = remember {
        NavigationItem(
            route = "settings",
            label = "Settings",
            icon = { Icon(PhosphorIcons.Gear, contentDescription = "Settings") },
            selectedIcon = { Icon(PhosphorIcons.GearFill, contentDescription = "Settings") },
            routeMatch = "settings"
        )
    }

    val bottomNavItems = remember(libraries) {
        buildBottomNavItems(libraries)
    }
    
    // Handle external file opening
    LaunchedEffect(externalFileUri) {
        if (externalFileUri != null) {
            val encodedUri = Uri.encode(externalFileUri.toString())
            navController.navigate("open_file/$encodedUri") {
                // Clear the back stack to make the file viewer the new root
                popUpTo("home") { inclusive = false }
            }
        }
    }
    
    // Permission handling
    val permissionState = rememberPermissionsHandler(
        onAllPermissionsGranted = {
            // Permissions granted - continue normal flow
        },
        onPermissionsDenied = { denied ->
            // Handle denied permissions
        }
    )
    
    // Show permission dialog if needed
    if (!permissionState.hasAllPermissions) {
        PermissionDialog(
            permissionState = permissionState
        )
    }
    
    // Wrap navigation in responsive scaffold
    ResponsiveNavigationScaffold(
        navController = navController,
        bottomNavItems = bottomNavItems,
        settingsItem = settingsItem,
        gearPosition = gearPosition,
        bottomBarVisible = bottomBarVisible,
        onBottomBarVisibleChange = { bottomBarVisible = it },
        topBar = {
            // Top bar can be customized per screen if needed
        },
        floatingActionButton = {
            // FAB can be shown on specific screens
        }
    ) { paddingValues ->
        NavHost(
            navController = navController,
            startDestination = "home",
            modifier = Modifier.padding(paddingValues)
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
        composable("detail/{itemId}") { backStackEntry ->
            val itemId = backStackEntry.arguments?.getString("itemId")?.toLongOrNull() ?: -1L
            if (itemId > 0) {
                com.universalmedialibrary.ui.detail.MediaItemDetailScreen(
                    itemId = itemId,
                    onNavigateBack = { navController.navigateUp() },
                    onOpenMedia = { id -> navController.navigate("open/$id") },
                    onEditMetadata = { id -> navController.navigate("metadata_editor/$id") }
                )
            } else {
                Text("Invalid media item")
            }
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
        composable("open_file/{encodedUri}") { backStackEntry ->
            val encodedUri = backStackEntry.arguments?.getString("encodedUri")
            if (encodedUri != null) {
                val uri = Uri.decode(encodedUri)
                DirectFileOpenScreen(
                    fileUri = uri,
                    onBack = { navController.navigateUp() }
                )
            } else {
                Text("Invalid file URI")
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
            CollectionsScreen(onOpenCollection = { collectionId -> 
                navController.navigate("collection_detail/$collectionId")
            })
        }
        composable("settings/media_servers") {
            MediaServerSettingsScreen(onBack = { navController.navigateUp() })
        }
        composable("settings/network_storage") {
            NetworkStorageSettingsScreen(onBack = { navController.navigateUp() })
        }
        composable("settings/tts_provider") {
            com.universalmedialibrary.ui.settings.TtsProviderSettingsScreen(
                onBack = { navController.navigateUp() }
            )
        }
        composable("settings/parental_controls") {
            com.universalmedialibrary.ui.settings.ParentalControlsScreen(
                navController = navController
            )
        }
        
        // Ambient sound routes
        composable("ambient/theme_manager") {
            com.universalmedialibrary.ui.ambient.ThemeManagerScreen(
                onBack = { navController.navigateUp() }
            )
        }
        composable("ambient/import") {
            com.universalmedialibrary.ui.ambient.AudioPackImportScreen(
                onBack = { navController.navigateUp() }
            )
        }
        
        composable("collection_detail/{collectionId}") { backStackEntry ->
            val collectionId = backStackEntry.arguments?.getString("collectionId")?.toLongOrNull() ?: -1L
            if (collectionId > 0) {
                com.universalmedialibrary.ui.collections.CollectionDetailScreen(
                    collectionId = collectionId,
                    onNavigateBack = { navController.navigateUp() },
                    onOpenItem = { itemId -> navController.navigate("open/$itemId") }
                )
            } else {
                Text("Invalid collection")
            }
        }

        // Podcast routes
        composable("podcasts") {
            com.universalmedialibrary.ui.podcast.PodcastManagerScreen(navController = navController)
        }
        composable("podcast_player/{episodeId}") { backStackEntry ->
            val episodeId = backStackEntry.arguments?.getString("episodeId")?.toLongOrNull() ?: -1L
            com.universalmedialibrary.ui.podcast.PodcastPlayerScreen(
                episodeId = episodeId,
                onBack = { navController.navigateUp() },
                onNavigateToVisualizer = { navController.navigate("visualizer") }
            )
        }

        // Music routes
        composable("music") {
            com.universalmedialibrary.ui.music.MusicLibraryScreen(navController = navController)
        }
        composable("music_player") {
            com.universalmedialibrary.ui.music.EnhancedMusicPlayerScreen(
                onNavigateBack = { navController.navigateUp() },
                onNavigateToQueue = { navController.navigate("queue") },
                onNavigateToAlbum = { albumId -> navController.navigate("album/$albumId") },
                onNavigateToVisualizer = { navController.navigate("visualizer") }
            )
        }
        composable("queue") {
            val musicPlayerViewModel: com.universalmedialibrary.ui.music.MusicPlayerViewModel = hiltViewModel()
            com.universalmedialibrary.ui.music.EnhancedQueueScreen(
                queue = musicPlayerViewModel.queue.collectAsState().value,
                currentTrackId = musicPlayerViewModel.currentTrack.collectAsState().value?.id,
                currentIndex = musicPlayerViewModel.getCurrentQueueIndex(),
                onTrackClick = { index -> musicPlayerViewModel.jumpToQueuePosition(index) },
                onRemoveTrack = { index -> musicPlayerViewModel.removeFromQueueByIndex(index) },
                onMoveTrack = { from, to -> musicPlayerViewModel.moveTrackInQueue(from, to) },
                onClearQueue = { musicPlayerViewModel.clearQueue() },
                onShuffleQueue = { musicPlayerViewModel.shuffleQueue() },
                onNavigateBack = { navController.navigateUp() }
            )
        }
        composable("album/{albumName}") { backStackEntry ->
            val albumName = backStackEntry.arguments?.getString("albumName") ?: ""
            com.universalmedialibrary.ui.music.AlbumDetailScreen(
                albumName = java.net.URLDecoder.decode(albumName, "UTF-8"),
                onNavigateBack = { navController.navigateUp() },
                onNavigateToPlayer = { navController.navigate("music_player") }
            )
        }
        composable("artist/{artistName}") { backStackEntry ->
            val artistName = backStackEntry.arguments?.getString("artistName") ?: ""
            com.universalmedialibrary.ui.music.ArtistDetailScreen(
                artistName = java.net.URLDecoder.decode(artistName, "UTF-8"),
                onNavigateBack = { navController.navigateUp() },
                onNavigateToPlayer = { navController.navigate("music_player") },
                onNavigateToAlbum = { albumName ->
                    navController.navigate("album/${java.net.URLEncoder.encode(albumName, "UTF-8")}")
                }
            )
        }
        composable("genre/{genreName}") { backStackEntry ->
            val genreName = backStackEntry.arguments?.getString("genreName") ?: ""
            com.universalmedialibrary.ui.music.GenreDetailScreen(
                genreName = java.net.URLDecoder.decode(genreName, "UTF-8"),
                onNavigateBack = { navController.navigateUp() },
                onNavigateToPlayer = { navController.navigate("music_player") }
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
            if (itemId > 0) {
                MediaOpenScreen(
                    itemId = itemId,
                    onBack = { navController.navigateUp() }
                )
            } else {
                Text("Invalid media item")
            }
        }
        composable("metadata_editor/{itemId}") { backStackEntry ->
            val itemId = backStackEntry.arguments?.getString("itemId")?.toLongOrNull() ?: -1L
            if (itemId > 0) {
                com.universalmedialibrary.ui.metadata.MetadataEditorScreen(
                    itemId = itemId,
                    onSave = { navController.navigateUp() },
                    onCancel = { navController.navigateUp() }
                )
            } else {
                Text("Invalid media item")
            }
        }

        // Web Fiction routes
        composable("universal_tag_browser") {
            com.universalmedialibrary.ui.webfiction.UniversalTagBrowserScreen(
                navController = navController
            )
        }
        composable("universal_tag_browser/{siteType}") { backStackEntry ->
            val siteTypeStr = backStackEntry.arguments?.getString("siteType")
            val siteType = try {
                siteTypeStr?.let { com.universalmedialibrary.services.webfiction.WebFictionSiteType.valueOf(it.uppercase()) }
            } catch (e: Exception) {
                null
            }
            com.universalmedialibrary.ui.webfiction.UniversalTagBrowserScreen(
                initialSiteType = siteType,
                navController = navController
            )
        }

        // Radio routes
        composable("radio") {
            com.universalmedialibrary.ui.radio.EnhancedRadioScreen(
                onNavigateBack = { navController.navigateUp() },
                onNavigateToOTR = { navController.navigate("old_time_radio") },
                onNavigateToInternetRadio = { navController.navigate("internet_radio") },
                onNavigateToFMRadio = { navController.navigate("fm_radio") },
                onNavigateToHDRadio = { navController.navigate("hd_radio") }
            )
        }
        
        composable("internet_radio") {
            com.universalmedialibrary.ui.radio.InternetRadioScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }
        
        composable("fm_radio") {
            com.universalmedialibrary.ui.radio.FMRadioScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }
        
        composable("hd_radio") {
            com.universalmedialibrary.ui.radio.HDRadioScreen(
                onNavigateBack = { navController.navigateUp() }
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
                onBack = { navController.navigateUp() },
                   navController = navController
            )
        }
        
        // Import/Export route
        composable("settings/import_export") {
            com.universalmedialibrary.ui.settings.ImportExportScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Audio Effects Settings route
        composable("settings/audio_effects") {
            AudioEffectsSettingsScreen(
                viewModel = hiltViewModel(),
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Last.fm Settings route
        composable("settings/lastfm") {
            LastFmSettingsScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Audio Profiles Settings route
        composable("settings/audio_profiles") {
            AudioProfilesScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Storage Browser route
        composable("storage_browser") {
            com.universalmedialibrary.ui.filepicker.StorageBrowserScreen(
                onNavigateBack = { navController.navigateUp() },
                onFileSelected = { file ->
                    // Determine file type and navigate to appropriate player/reader
                    val encodedPath = URLEncoder.encode(file.absolutePath, StandardCharsets.UTF_8.toString())
                    when (file.extension.lowercase()) {
                        "epub", "pdf", "mobi", "azw", "azw3" -> {
                            navController.navigate("reader_path/$encodedPath")
                        }
                        "mp3", "m4a", "flac", "wav", "ogg" -> {
                            navController.navigate("audio_player/$encodedPath")
                        }
                        "mp4", "mkv", "avi", "mov", "webm" -> {
                            navController.navigate("video_player_path/$encodedPath")
                        }
                        "cbz", "cbr" -> {
                            navController.navigate("reader_path/$encodedPath")
                        }
                    }
                }
            )
        }

        // Enhanced eBook Reader route (for direct file paths)
        composable("reader_path/{bookPath}") { backStackEntry ->
            val encodedPath = backStackEntry.arguments?.getString("bookPath") ?: ""
            val bookPath = URLDecoder.decode(encodedPath, StandardCharsets.UTF_8.toString())
            com.universalmedialibrary.ui.reader.EnhancedEReaderScreen(
                bookFilePath = bookPath,
                onBack = { navController.navigateUp() }
            )
        }

        // Modern Audio Player route
        composable("audio_player/{audioPath}") { backStackEntry ->
            val encodedPath = backStackEntry.arguments?.getString("audioPath") ?: ""
            val audioPath = URLDecoder.decode(encodedPath, StandardCharsets.UTF_8.toString())
            com.universalmedialibrary.ui.player.ModernAudioPlayerScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Modern Video Player route (for direct file paths)
        composable("video_player_path/{videoPath}") { backStackEntry ->
            val encodedPath = backStackEntry.arguments?.getString("videoPath") ?: ""
            val videoPath = URLDecoder.decode(encodedPath, StandardCharsets.UTF_8.toString())
            com.universalmedialibrary.ui.player.ModernVideoPlayerScreen(
                videoPath = videoPath,
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // ========== Calibre Features Routes ==========
        
        // Fanfiction routes
        composable("fanfiction_download") {
            com.universalmedialibrary.ui.fanfiction.FanfictionDownloadScreen(
                onNavigateBack = { navController.navigateUp() },
                onDownloadComplete = { navController.navigate("fanfiction_library") }
            )
        }
        
        composable("fanfiction_library") {
            com.universalmedialibrary.ui.fanfiction.FanfictionLibraryScreen(
                onNavigateBack = { navController.navigateUp() },
                onNavigateToDownload = { navController.navigate("fanfiction_download") },
                onStoryClick = { story ->
                    // Open the EPUB file if it exists
                    story.epubPath?.let { path ->
                        val encoded = android.net.Uri.encode(path)
                        navController.navigate("reader?path=$encoded")
                    }
                }
            )
        }
        
        // Audiobook routes
        composable("audiobook_library") {
            com.universalmedialibrary.ui.audiobook.AudiobookLibraryScreen(
                onNavigateBack = { navController.navigateUp() },
                onImportClick = { 
                    navController.navigate("storage_browser")
                },
                onAudiobookClick = { audiobook ->
                    navController.navigate("audiobook_player/${audiobook.id}")
                }
            )
        }
        
        composable(
            route = "audiobook_player/{audiobookId}",
            arguments = listOf(navArgument("audiobookId") { type = NavType.LongType })
        ) { backStackEntry ->
            val audiobookId = backStackEntry.arguments?.getLong("audiobookId") ?: 0L
            com.universalmedialibrary.ui.audiobook.AudiobookPlayerScreen(
                audiobookId = audiobookId,
                onNavigateBack = { navController.navigateUp() }
            )
        }
        
        // Organization routes
        composable("duplicate_detection") {
            com.universalmedialibrary.ui.organization.DuplicateDetectionScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Theme preview for testing (old)
        composable("theme_preview") {
            com.universalmedialibrary.ui.theme.ThemePreviewScreen()
        }
        
        // New unified theme showcase with all 15 themes
        composable("theme_showcase") {
            val mainViewModel: MainViewModel = hiltViewModel()
            val selectedTheme by mainViewModel.selectedTheme.collectAsState(ThemePalette.NAVY_GOLD)
            val currentUnifiedTheme = selectedTheme.toCleverFerretTheme()
            
            com.universalmedialibrary.ui.screens.ThemeShowcaseScreen(
                currentTheme = currentUnifiedTheme,
                onThemeSelected = { newTheme ->
                    // Convert back to old ThemePalette if needed
                    val oldPalette = when (newTheme) {
                        CleverFerretTheme.NAVY_GOLD -> ThemePalette.NAVY_GOLD
                        CleverFerretTheme.ROYAL_SILVER -> ThemePalette.ROYAL_SILVER
                        CleverFerretTheme.FOREST_COPPER -> ThemePalette.FOREST_COPPER
                        CleverFerretTheme.BURGUNDY_ROSE_GOLD -> ThemePalette.BURGUNDY_ROSE_GOLD
                        CleverFerretTheme.CHARCOAL_CHAMPAGNE -> ThemePalette.CHARCOAL_CHAMPAGNE
                        CleverFerretTheme.SLATE_GUNMETAL -> ThemePalette.SLATE_GUNMETAL
                        else -> ThemePalette.NAVY_GOLD
                    }
                    mainViewModel.setTheme(oldPalette)
                },
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Enhanced Media Library Screen route
        composable("media_library") {
            com.universalmedialibrary.ui.screens.MediaLibraryScreen(
                onNavigateToItem = { itemId ->
                    navController.navigate("open/$itemId")
                }
            )
        }

        // Server integration route
        composable("servers") {
            com.universalmedialibrary.ui.integration.ServerIntegrationScreen(
                onBack = { navController.navigateUp() }
            )
        }

           // Visualizer route
           composable("visualizer") { backStackEntry ->
               val visualizerViewModel: com.universalmedialibrary.ui.visualizer.VisualizerViewModel = 
                   androidx.hilt.navigation.compose.hiltViewModel(backStackEntry)
               
               com.universalmedialibrary.ui.visualizer.VisualizerScreen(
                   onBack = { navController.navigateUp() },
                   onNavigateToPresets = { navController.navigate("visualizer_presets") },
                   viewModel = visualizerViewModel
               )
           }
           
           // Ambient sound route
           composable("ambient") { backStackEntry ->
               val ambientViewModel: com.universalmedialibrary.ui.ambient.AmbientSoundViewModel = 
                   androidx.hilt.navigation.compose.hiltViewModel(backStackEntry)
               
               com.universalmedialibrary.ui.ambient.AmbientSoundScreen(
                   onBack = { navController.navigateUp() },
                   viewModel = ambientViewModel
               )
           }
           
           // Visualizer presets browser
           composable("visualizer_presets") { backStackEntry ->
               // Get the parent VisualizerViewModel to share state
               val parentEntry = remember(backStackEntry) {
                   navController.getBackStackEntry("visualizer")
               }
               val visualizerViewModel: com.universalmedialibrary.ui.visualizer.VisualizerViewModel = 
                   androidx.hilt.navigation.compose.hiltViewModel(parentEntry)
               
               com.universalmedialibrary.ui.visualizer.PresetBrowserScreen(
                   onBack = { navController.navigateUp() },
                   onPresetSelected = { preset ->
                       // Pass the selected preset to the visualizer
                       visualizerViewModel.setPreset(preset)
                       navController.navigateUp()
                   },
                   onNavigateToEditor = { presetId ->
                       if (presetId != null) {
                           navController.navigate("visualizer_editor/$presetId")
                       } else {
                           navController.navigate("visualizer_editor")
                       }
                   }
               )
           }
           
           // Visualizer parameter editor
           composable("visualizer_editor/{presetId}") { backStackEntry ->
               val presetId = backStackEntry.arguments?.getString("presetId")
               val presetManager = com.universalmedialibrary.services.visualizer.VisualizerPresetManager()
               val preset = presetId?.let { presetManager.getPresetById(it) }
               
               com.universalmedialibrary.ui.visualizer.ParameterEditorScreen(
                   preset = preset,
                   onBack = { navController.navigateUp() },
                   onSave = { newPreset ->
                       // Save the preset and navigate back
                       navController.navigateUp()
                   }
               )
           }
           
           // Visualizer parameter editor (new preset)
           composable("visualizer_editor") {
               com.universalmedialibrary.ui.visualizer.ParameterEditorScreen(
                   preset = null,
                   onBack = { navController.navigateUp() },
                   onSave = { newPreset ->
                       // Save the preset and navigate back
                       navController.navigateUp()
                   }
               )
           }
           
           // Enhanced Search route
           composable("enhanced_search") {
               com.universalmedialibrary.ui.search.EnhancedSearchScreen(
                   navController = navController
               )
           }
           
           // Sync route
           composable("sync") {
               com.universalmedialibrary.ui.sync.SyncScreen(
                   navController = navController
               )
           }
           
           // Recommendations route
           composable("recommendations") {
               com.universalmedialibrary.ui.recommendations.RecommendationsScreen(
                   navController = navController
               )
           }
           composable("collaborative_sessions") {
               com.universalmedialibrary.ui.collaborative.CollaborativeSessionScreen(
                   onNavigateBack = { navController.navigateUp() }
               )
           }
           composable("qr_scanner") {
               com.universalmedialibrary.ui.collaborative.QRScannerScreen(
                   onNavigateBack = { navController.navigateUp() },
                   onSessionJoined = { sessionId ->
                       navController.navigate("collaborative_sessions") {
                           popUpTo("qr_scanner") { inclusive = true }
                       }
                   }
               )
           }
        }
    }
}

private fun buildBottomNavItems(libraries: List<Library>): List<NavigationItem> {
    val sortedLibraries = libraries.sortedBy { it.name.ifBlank { it.type }.lowercase(Locale.getDefault()) }
    val normalizedTypes = sortedLibraries.mapNotNull { normalizeLibraryType(it.type) }.toSet()

    return buildList {
        fun MutableList<NavigationItem>.addIfMissing(route: String, builder: () -> NavigationItem) {
            if (none { it.route == route }) {
                add(builder())
            }
        }

        add(
            NavigationItem(
                route = "home",
                label = "Home",
                icon = { Icon(PhosphorIcons.House, contentDescription = "Home") },
                selectedIcon = { Icon(PhosphorIcons.HouseFill, contentDescription = "Home") },
                routeMatch = "home"
            )
        )

        sortedLibraries.forEach { library ->
            val navConfig = libraryNavConfig(library.type)
            val label = formatLibraryLabel(
                name = library.name,
                type = library.type,
                canonicalLabel = navConfig?.canonicalLabel
            )
            val iconVector = navConfig?.icon ?: iconForLibraryType(library.type)
            val selectedIconVector = navConfig?.selectedIcon ?: iconVector
            add(
                NavigationItem(
                    route = "library_details/${library.libraryId}",
                    label = label,
                    icon = { Icon(iconVector, contentDescription = label) },
                    selectedIcon = { Icon(selectedIconVector, contentDescription = label) },
                    routeMatch = "library_details/{libraryId}"
                )
            )
        }

        val hasAudiobookLibrary = normalizedTypes.any { it in AUDIOBOOK_TYPE_TOKENS }
        val hasPodcastLibrary = normalizedTypes.any { it in PODCAST_TYPE_TOKENS }
        val hasVideoLibrary = normalizedTypes.any { it in MOVIE_TYPE_TOKENS || it in TV_TYPE_TOKENS }

        add(
            NavigationItem(
                route = "music",
                label = "Music",
                icon = { Icon(PhosphorIcons.MusicNote, contentDescription = "Music") },
                selectedIcon = { Icon(PhosphorIcons.MusicNoteFill, contentDescription = "Music") },
                routeMatch = "music"
            )
        )

        if (!hasAudiobookLibrary) {
            addIfMissing("audiobook_library") {
                NavigationItem(
                    route = "audiobook_library",
                    label = "Audiobooks",
                    icon = { Icon(PhosphorIcons.Headphones, contentDescription = "Audiobooks") },
                    routeMatch = "audiobook"
                )
            }
        }

        addIfMissing("fanfiction_library") {
            NavigationItem(
                route = "fanfiction_library",
                label = "Fanfiction",
                icon = { Icon(PhosphorIcons.Bookmark, contentDescription = "Fanfiction") },
                routeMatch = "fanfiction"
            )
        }

        if (!hasPodcastLibrary) {
            addIfMissing("podcasts") {
                NavigationItem(
                    route = "podcasts",
                    label = "Podcasts",
                    icon = { Icon(PhosphorIcons.Microphone, contentDescription = "Podcasts") },
                    routeMatch = "podcast"
                )
            }
        }

        add(
            NavigationItem(
                route = "radio",
                label = "Radio",
                icon = { Icon(PhosphorIcons.Radio, contentDescription = "Radio") },
                routeMatch = "radio"
            )
        )

        if (hasVideoLibrary) {
            addIfMissing("videos") {
                NavigationItem(
                    route = "videos",
                    label = "Videos",
                    icon = { Icon(PhosphorIcons.FilmSlate, contentDescription = "Videos") },
                    routeMatch = "video"
                )
            }
        }

        addIfMissing("collections") {
            NavigationItem(
                route = "collections",
                label = "Collections",
                icon = { Icon(PhosphorIcons.Stack, contentDescription = "Collections") },
                routeMatch = "collection"
            )
        }

        addIfMissing("media_library") {
            NavigationItem(
                route = "media_library",
                label = "Media Hub",
                icon = { Icon(PhosphorIcons.Books, contentDescription = "Media Hub") },
                routeMatch = "media_library"
            )
        }

        addIfMissing("recommendations") {
            NavigationItem(
                route = "recommendations",
                label = "Discover",
                icon = {
                    Icon(
                        imageVector = Icons.Filled.Favorite,
                        contentDescription = "Discover"
                    )
                },
                routeMatch = "recommendations"
            )
        }

        addIfMissing("enhanced_search") {
            NavigationItem(
                route = "enhanced_search",
                label = "Search",
                icon = { Icon(PhosphorIcons.MagnifyingGlass, contentDescription = "Search") },
                routeMatch = "enhanced_search"
            )
        }

        add(
            NavigationItem(
                route = "visualizer",
                label = "Visualizer",
                icon = { Icon(PhosphorIcons.Equalizer, contentDescription = "Visualizer") },
                routeMatch = "visualizer"
            )
        )

        add(
            NavigationItem(
                route = "ambient",
                label = "Ambient",
                icon = { Icon(PhosphorIcons.Nature, contentDescription = "Ambient") },
                routeMatch = "ambient"
            )
        )
    }
}

private fun iconForLibraryType(type: String?): ImageVector {
    val normalized = normalizeLibraryType(type) ?: return PhosphorIcons.Stack
    return when {
        normalized in BOOK_TYPE_TOKENS -> PhosphorIcons.Book
        normalized in AUDIOBOOK_TYPE_TOKENS -> PhosphorIcons.Headphones
        normalized in COMIC_TYPE_TOKENS -> PhosphorIcons.Books
        normalized in MOVIE_TYPE_TOKENS -> PhosphorIcons.FilmSlate
        normalized in TV_TYPE_TOKENS -> PhosphorIcons.Television
        normalized in MUSIC_TYPE_TOKENS -> PhosphorIcons.MusicNote
        normalized in MAGAZINE_TYPE_TOKENS -> PhosphorIcons.Newspaper
        normalized in DOCUMENT_TYPE_TOKENS -> PhosphorIcons.FileText
        normalized in PODCAST_TYPE_TOKENS -> PhosphorIcons.Microphone
        else -> PhosphorIcons.Stack
    }
}

private data class LibraryNavConfig(
    val canonicalLabel: String,
    val icon: ImageVector,
    val selectedIcon: ImageVector? = null
)

private fun libraryNavConfig(type: String?): LibraryNavConfig? {
    val normalized = normalizeLibraryType(type) ?: return null
    return when {
        normalized in BOOK_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "Books",
            icon = PhosphorIcons.Book,
            selectedIcon = PhosphorIcons.BookFill
        )
        normalized in AUDIOBOOK_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "Audiobooks",
            icon = PhosphorIcons.Headphones
        )
        normalized in COMIC_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "Comics",
            icon = PhosphorIcons.Books
        )
        normalized in MOVIE_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "Movies",
            icon = PhosphorIcons.FilmSlate
        )
        normalized in TV_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "TV Shows",
            icon = PhosphorIcons.Television
        )
        normalized in MUSIC_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "Music",
            icon = PhosphorIcons.MusicNote,
            selectedIcon = PhosphorIcons.MusicNoteFill
        )
        normalized in MAGAZINE_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "Magazines",
            icon = PhosphorIcons.Newspaper
        )
        normalized in DOCUMENT_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "Documents",
            icon = PhosphorIcons.FileText
        )
        normalized in PODCAST_TYPE_TOKENS -> LibraryNavConfig(
            canonicalLabel = "Podcasts",
            icon = PhosphorIcons.Microphone
        )
        else -> null
    }
}

private fun formatLibraryLabel(name: String, type: String?, canonicalLabel: String?): String {
    val fallback = canonicalLabel
        ?: normalizeLibraryType(type)?.let(::humanizeNormalizedType)
        ?: "Library"

    val trimmedName = name.trim()
    if (trimmedName.isEmpty()) return fallback

    val normalizedName = trimmedName.normalizeLabelToken()
    val normalizedType = normalizeLibraryType(type)?.normalizeLabelToken()
    val normalizedFallback = fallback.normalizeLabelToken()

    return when {
        normalizedName.isEmpty() -> fallback
        normalizedType != null && normalizedName == normalizedType -> fallback
        normalizedFallback.isNotEmpty() && normalizedName == normalizedFallback -> fallback
        else -> trimmedName
    }
}

private fun normalizeLibraryType(type: String?): String? =
    type
        ?.trim()
        ?.uppercase(Locale.getDefault())
        ?.replace('-', '_')
        ?.replace(' ', '_')

private fun humanizeNormalizedType(normalized: String): String =
    normalized
        .lowercase(Locale.getDefault())
        .split('_')
        .joinToString(" ") { part ->
            part.replaceFirstChar { char ->
                if (char.isLowerCase()) char.titlecase(Locale.getDefault()) else char.toString()
            }
        }

private fun String.normalizeLabelToken(): String =
    lowercase(Locale.getDefault()).replace(NON_ALPHANUMERIC_REGEX, "")

private val NON_ALPHANUMERIC_REGEX = Regex("[^a-z0-9]")

private val BOOK_TYPE_TOKENS = setOf(
    "BOOK",
    "BOOKS",
    "EBOOK",
    "EBOOKS",
    "E_BOOK",
    "E_BOOKS",
    "E-BOOK",
    "E-BOOKS",
    "LITERATURE",
    "NOVEL",
    "FICTION"
)

private val AUDIOBOOK_TYPE_TOKENS = setOf(
    "AUDIOBOOK",
    "AUDIOBOOKS",
    "AUDIO_BOOK",
    "AUDIO_BOOKS",
    "AUDIBLE",
    "LISTEN"
)

private val COMIC_TYPE_TOKENS = setOf(
    "COMIC",
    "COMICS",
    "GRAPHIC_NOVEL",
    "GRAPHIC-NOVEL",
    "MANGA"
)

private val MOVIE_TYPE_TOKENS = setOf(
    "MOVIE",
    "MOVIES",
    "FILM",
    "CINEMA"
)

private val TV_TYPE_TOKENS = setOf(
    "TV",
    "TV_SHOW",
    "TV_SHOWS",
    "TELEVISION",
    "SERIES"
)

private val MUSIC_TYPE_TOKENS = setOf(
    "MUSIC",
    "ALBUM",
    "AUDIO",
    "TRACKS"
)

private val MAGAZINE_TYPE_TOKENS = setOf(
    "MAGAZINE",
    "MAGAZINES",
    "PERIODICAL",
    "NEWSPAPER",
    "JOURNAL"
)

private val DOCUMENT_TYPE_TOKENS = setOf(
    "DOCUMENT",
    "DOCUMENTS",
    "DOCS",
    "REFERENCE",
    "PDF",
    "TEXT"
)

private val PODCAST_TYPE_TOKENS = setOf(
    "PODCAST",
    "PODCASTS"
)


/**
 * The main screen of the application, displaying an artistic recommendations feed
 * with navigation rail and search functionality.
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
    var showMenu by remember { mutableStateOf(false) }
    var showLibrarySelectionDialog by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }
    var selectedNavItem by remember { mutableStateOf(0) }
    val context = LocalContext.current
    var dbFileUri by remember { mutableStateOf<Uri?>(null) }
    var selectedLibraryForImport by remember { mutableStateOf<Library?>(null) }
      val mediaControlsState = rememberMediaControlsState()
      val configuration = LocalConfiguration.current
      val isCompactWidth = configuration.screenWidthDp < 600

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
                    if (libraries.isNotEmpty()) {
                        showLibrarySelectionDialog = true
                    }
                }
            },
        )

    // Sample media data for recommendations
      val sampleMedia = listOf(
          MediaRecommendation("The Great Gatsby", "F. Scott Fitzgerald", "BOOK", listOf(Color(0xFF1B5E20), Color(0xFF4CAF50)), imageRes = R.drawable.sample_cover_gatsby),
          MediaRecommendation("Pride and Prejudice", "Jane Austen", "BOOK", listOf(Color(0xFF3E1A3D), Color(0xFF8E3A7C)), imageRes = R.drawable.sample_cover_pride),
          MediaRecommendation("Moby-Dick", "Herman Melville", "BOOK", listOf(Color(0xFF0A2A35), Color(0xFF134B5F)), imageRes = R.drawable.sample_cover_mobydick),
          MediaRecommendation("The Adventures of Sherlock Holmes", "Arthur Conan Doyle", "BOOK", listOf(Color(0xFF1A1A1A), Color(0xFFC0A062)), imageRes = R.drawable.sample_cover_sherlock),
          MediaRecommendation("Little Women", "Louisa May Alcott", "BOOK", listOf(Color(0xFF713F2B), Color(0xFFD89C77)), imageRes = R.drawable.sample_cover_pride),
          MediaRecommendation("Treasure Island", "Robert Louis Stevenson", "BOOK", listOf(Color(0xFF2E4A33), Color(0xFF7AA17A)), imageRes = R.drawable.sample_cover_mobydick)
      )

      val sampleClassics = remember {
          listOf(
              SampleClassic(
                  id = "gutenberg-1342",
                  title = "Pride and Prejudice",
                  author = "Jane Austen",
                  description = "Elizabeth Bennet navigates manners, morality, and an unforgettable romance in Georgian England.",
                  downloadUrl = "https://www.gutenberg.org/cache/epub/1342/pg1342.epub",
                  fileName = "Pride_and_Prejudice.epub",
                  coverRes = R.drawable.sample_cover_pride
              ),
              SampleClassic(
                  id = "gutenberg-1661",
                  title = "The Adventures of Sherlock Holmes",
                  author = "Arthur Conan Doyle",
                  description = "Twelve iconic mysteries introduce Sherlock Holmes and Dr. Watson's legendary partnership.",
                  downloadUrl = "https://www.gutenberg.org/cache/epub/1661/pg1661.epub",
                  fileName = "Adventures_of_Sherlock_Holmes.epub",
                  coverRes = R.drawable.sample_cover_sherlock
              ),
              SampleClassic(
                  id = "gutenberg-2701",
                  title = "Moby-Dick; or, The Whale",
                  author = "Herman Melville",
                  description = "Captain Ahab's epic pursuit of the white whale explores obsession, fate, and the sea's fury.",
                  downloadUrl = "https://www.gutenberg.org/cache/epub/2701/pg2701.epub",
                  fileName = "Moby_Dick.epub",
                  coverRes = R.drawable.sample_cover_mobydick
              )
          )
      }

      val sampleDownloads by viewModel.sampleDownloads.collectAsState()

      LaunchedEffect(sampleClassics) {
          viewModel.syncSampleStatuses(sampleClassics)
      }


      val mainContent: @Composable (Modifier) -> Unit = { contentModifier ->
          Box(modifier = contentModifier.fillMaxSize()) {
              Scaffold(
                topBar = {
                Column {
                    TopAppBar(
                        title = { 
                            Text(
                                "Discover",
                                style = MaterialTheme.typography.headlineMedium,
                                fontWeight = FontWeight.Bold
                            )
                        },
                        actions = {
                            IconButton(onClick = { navController.navigate("qr_scanner") }) {
                                Icon(Icons.Default.CameraAlt, contentDescription = "Scan QR Code")
                            }
                            IconButton(onClick = { navController.navigate("collections") }) {
                                Icon(Icons.Default.Collections, contentDescription = "Collections")
                            }
                            IconButton(onClick = { navController.navigate("maintenance") }) {
                                Icon(Icons.Default.Build, contentDescription = "Maintenance")
                            }
                            IconButton(onClick = { showMenu = true }) {
                                Icon(Icons.Default.MoreVert, contentDescription = "More Options")
                            }
                            DropdownMenu(
                                expanded = showMenu,
                                onDismissRequest = { showMenu = false },
                            ) {
                                DropdownMenuItem(
                                    text = { Text("Browse Files") },
                                    onClick = {
                                        showMenu = false
                                        navController.navigate("storage_browser")
                                    },
                                    leadingIcon = {
                                        Icon(Icons.Default.FolderOpen, contentDescription = null)
                                    }
                                )
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
                                DropdownMenuItem(
                                    text = { Text("Theme Preview") },
                                    onClick = {
                                        showMenu = false
                                        navController.navigate("theme_preview")
                                    }
                                )
                              }
                          }
                      )

                      // Search Bar
                      OutlinedTextField(
                          value = searchQuery,
                          onValueChange = { searchQuery = it },
                          modifier = Modifier
                              .fillMaxWidth()
                              .padding(horizontal = 16.dp, vertical = 8.dp),
                          placeholder = { Text("Search books, music, movies...") },
                          leadingIcon = { Icon(Icons.Default.Search, contentDescription = "Search") },
                          trailingIcon = {
                              if (searchQuery.isNotEmpty()) {
                                  IconButton(onClick = { searchQuery = "" }) {
                                      Icon(Icons.Default.Close, contentDescription = "Clear")
                                  }
                              }
                          },
                          singleLine = true,
                          shape = RoundedCornerShape(24.dp),
                          colors = OutlinedTextFieldDefaults.colors(
                              focusedBorderColor = MaterialTheme.colorScheme.primary,
                              unfocusedBorderColor = MaterialTheme.colorScheme.outline.copy(alpha = 0.5f)
                          )
                      )
                  }
              }
          ) { paddingValues ->
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                verticalArrangement = Arrangement.spacedBy(24.dp),
                contentPadding = PaddingValues(bottom = 24.dp)
            ) {
                // Continue Reading/Watching section
                  item {
                    ContinueReadingSection(onOpenItem = { id -> navController.navigate("open/$id") })
                }

                // Recommendations Header
                  item {
                      Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "Recommended for You",
                            style = MaterialTheme.typography.headlineSmall,
                            fontWeight = FontWeight.Bold
                        )
                        TextButton(onClick = { navController.navigate("recommendations") }) {
                            Text("See All")
                            Icon(
                                Icons.Default.ArrowForward,
                                contentDescription = null,
                                modifier = Modifier.size(16.dp)
                            )
                        }
                    }
                }

                // Poster Grid
                  item {
                      LazyVerticalGrid(
                        columns = GridCells.Adaptive(minSize = 160.dp),
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(800.dp),
                        contentPadding = PaddingValues(horizontal = 16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(16.dp),
                    ) {

                          itemsIndexed(sampleMedia) { index, media ->
                            MediaPosterCard(
                                media = media,
                                onClick = {
                                    when (media.type) {
                                        "BOOK" -> navController.navigate("bookshelf/1")
                                        "MOVIE" -> navController.navigate("videos")
                                        "MUSIC" -> navController.navigate("music")
                                    }
                                  },
                                  appearanceIndex = index
                            )
                        }
                    }
                }
                
                // Quick Access Features
                  item {
                    Column(modifier = Modifier.padding(horizontal = 16.dp)) {
                        Text(
                            text = "Quick Access",
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier.padding(bottom = 12.dp)
                        )
                        
                          Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            QuickAccessCard(
                                title = "Browse Files",
                                icon = Icons.Default.FolderOpen,
                                colors = listOf(Color(0xFF0D47A1), Color(0xFF2196F3)),
                                modifier = Modifier.weight(1f),
                                onClick = { navController.navigate("storage_browser") }
                            )
                            QuickAccessCard(
                                title = "Visualizer",
                                icon = Icons.Default.GraphicEq,
                                colors = listOf(Color(0xFF1B5E20), Color(0xFF4CAF50)),
                                modifier = Modifier.weight(1f),
                                onClick = { navController.navigate("visualizer") }
                            )
                        }
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                          Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            QuickAccessCard(
                                title = "Sync",
                                icon = Icons.Default.Sync,
                                colors = listOf(Color(0xFF0A1630), Color(0xFFD4AF37)),
                                modifier = Modifier.weight(1f),
                                onClick = { navController.navigate("sync") }
                            )
                            QuickAccessCard(
                                title = "Collections",
                                icon = Icons.Default.Collections,
                                colors = listOf(Color(0xFF4A148C), Color(0xFF9C27B0)),
                                modifier = Modifier.weight(1f),
                                onClick = { navController.navigate("collections") }
                            )
                        }
                    }
                }

                  item {
                      SampleClassicsSection(
                          samples = sampleClassics,
                          downloadStatuses = sampleDownloads,
                          onDownload = viewModel::downloadSample,
                          onRemove = viewModel::removeSample,
                          onOpen = { filePath ->
                              val encodedPath = Uri.encode(filePath)
                              navController.navigate("reader_path/$encodedPath")
                          }
                      )
                  }
            }
        }
        
            // Media Controls Bar at Bottom
            MediaControlsBar(
                isVisible = mediaControlsState.isVisible,
                title = mediaControlsState.title,
                artist = mediaControlsState.artist,
                isPlaying = mediaControlsState.isPlaying,
                isCasting = mediaControlsState.isCasting,
                castDeviceName = mediaControlsState.castDeviceName,
                onPlayPause = { 
                    mediaControlsState.updatePlaybackState(!mediaControlsState.isPlaying) 
                },
                onSkipNext = { },
                onSkipPrevious = { },
                onClick = { navController.navigate("music_player") },
                modifier = Modifier.align(Alignment.BottomCenter)
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
    
    if (showLibrarySelectionDialog && libraries.isNotEmpty()) {
        LibrarySelectionDialog(
            libraries = libraries,
            onDismiss = { showLibrarySelectionDialog = false },
            onSelect = { library ->
                selectedLibraryForImport = library
                showLibrarySelectionDialog = false
                rootFolderPicker.launch(null)
            }
        )
    }
}

@Composable
private fun SampleClassicsSection(
    samples: List<SampleClassic>,
    downloadStatuses: Map<String, SampleDownloadStatus>,
    onDownload: (SampleClassic) -> Unit,
    onRemove: (SampleClassic) -> Unit,
    onOpen: (String) -> Unit
) {
    Column(modifier = Modifier.padding(horizontal = 16.dp)) {
        Text(
            text = "Free Classics",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "Enjoy hand-picked Project Gutenberg EPUBs. Downloaded books live inside the app, and you can remove them any time.",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            modifier = Modifier.padding(top = 4.dp, bottom = 16.dp)
        )

        samples.forEachIndexed { index, sample ->
            val status = downloadStatuses[sample.id] ?: SampleDownloadStatus.NotDownloaded
            SampleClassicCard(
                sample = sample,
                status = status,
                onDownload = { onDownload(sample) },
                onRemove = { onRemove(sample) },
                onOpen = onOpen,
                appearanceIndex = index
            )

            if (index != samples.lastIndex) {
                Spacer(modifier = Modifier.height(12.dp))
            }
        }
    }
}

@Composable
private fun SampleClassicCard(
    sample: SampleClassic,
    status: SampleDownloadStatus,
    onDownload: () -> Unit,
    onRemove: () -> Unit,
    onOpen: (String) -> Unit,
    appearanceIndex: Int
) {
    val isDownloading = status is SampleDownloadStatus.Downloading
    val isDownloaded = status is SampleDownloadStatus.Downloaded
    val errorMessage = (status as? SampleDownloadStatus.Error)?.message

    var targetVisible by remember { mutableStateOf(false) }
    LaunchedEffect(Unit) { targetVisible = true }

    val alpha by animateFloatAsState(
        targetValue = if (targetVisible) 1f else 0f,
        animationSpec = tween(durationMillis = 320, delayMillis = appearanceIndex * 60),
        label = "classicCardAlpha"
    )
    val translationX by animateFloatAsState(
        targetValue = if (targetVisible) 0f else 24f,
        animationSpec = tween(durationMillis = 320, delayMillis = appearanceIndex * 60),
        label = "classicCardTranslation"
    )

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .graphicsLayer {
                this.alpha = alpha
                this.translationX = translationX
            },
        shape = RoundedCornerShape(20.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .background(MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.4f))
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Image(
                painter = painterResource(sample.coverRes),
                contentDescription = sample.title,
                modifier = Modifier
                    .size(width = 96.dp, height = 136.dp)
                    .clip(RoundedCornerShape(16.dp)),
                contentScale = ContentScale.Crop
            )

            Spacer(modifier = Modifier.width(16.dp))

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = sample.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = sample.author,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(top = 2.dp)
                )
                Text(
                    text = sample.description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(top = 8.dp)
                )

                if (errorMessage != null) {
                    Text(
                        text = errorMessage,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.error,
                        modifier = Modifier.padding(top = 8.dp)
                    )
                }

                Spacer(modifier = Modifier.height(12.dp))

                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    when {
                        isDownloading -> {
                            CircularProgressIndicator(
                                modifier = Modifier
                                    .size(24.dp),
                                strokeWidth = 2.5.dp
                            )
                            Text(
                                text = "Downloading...",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }

                        isDownloaded -> {
                            Button(
                                onClick = { onOpen((status as SampleDownloadStatus.Downloaded).path) },
                                shape = RoundedCornerShape(999.dp)
                            ) {
                                Text("Open")
                            }
                            TextButton(onClick = onRemove) {
                                Text("Remove")
                            }
                        }

                        else -> {
                            Button(
                                onClick = onDownload,
                                shape = RoundedCornerShape(999.dp)
                            ) {
                                Text("Download EPUB")
                            }
                        }
                    }
                }
            }
        }
    }
}

/**
 * Displays a feature card with an icon, gradient background, and title.
 * 
 * @param title The title text to display
 * @param icon The icon to show in the center of the gradient
 * @param colors Gradient colors for the card background
 * @param onClick Callback invoked when the card is clicked
 */
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

/**
 * Displays a library card with media type-specific gradient colors.
 * 
 * @param library The library information to display
 * @param onClick Callback invoked when the card is clicked
 */
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
 * Dialog to select a target library for importing Calibre data.
 * 
 * Displays all available libraries in a grid format with icons,
 * allowing users to choose which library to import their Calibre
 * metadata and books into.
 * 
 * @param libraries List of available libraries to choose from
 * @param onDismiss Callback invoked when the dialog is dismissed
 * @param onSelect Callback invoked when a library is selected
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
                    gridItems(libraries) { library ->
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
 * Returns the appropriate Material Icon for a given library media type.
 * 
 * @param type The media type (BOOK, MOVIE, MUSIC, etc.)
 * @return Corresponding Material Icon
 */
private fun getIconForLibraryType(type: String): ImageVector {
    return when (type.uppercase()) {

        "BOOK" -> Icons.Default.Book
        "MOVIE" -> Icons.Default.Movie
        "MUSIC" -> Icons.Default.MusicNote
        else -> Icons.Default.Book
    }
}

/**
 * Permission request dialog for storage and media access.
 * 
 * Displays a user-friendly explanation of why CleverFerret needs
 * storage permissions, with visual indicators for each permission type.
 * Adapts for Android 13+ notification permissions and shows rationale
 * when permissions have been previously denied.
 * 
 * @param permissionState Current permission state and request handler
 */
@Composable
fun PermissionDialog(
    permissionState: com.universalmedialibrary.utils.PermissionState
) {
    AlertDialog(
        onDismissRequest = { /* Cannot dismiss - permissions required */ },
        title = {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    Icons.Default.Lock,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Text("Storage Permissions Required")
            }
        },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                Text(
                    text = "CleverFerret needs access to your device storage to:",
                    style = MaterialTheme.typography.bodyMedium
                )
                
                PermissionItem("📚", "Access your books and documents")
                PermissionItem("🎵", "Play your music and audiobooks")
                PermissionItem("🎬", "View your videos and movies")
                PermissionItem("📸", "Display cover images and artwork")
                
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "You'll also be asked for notification permission to show playback controls.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                if (permissionState.showRationale) {
                    Spacer(modifier = Modifier.height(8.dp))
                    Card(
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.errorContainer
                        )
                    ) {
                        Text(
                            text = "⚠️ Some permissions were denied. CleverFerret requires these permissions to function properly.",
                            modifier = Modifier.padding(12.dp),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onErrorContainer
                        )
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { permissionState.requestPermissions() }
            ) {
                Icon(Icons.Default.Check, contentDescription = null, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(8.dp))
                Text("Grant Permissions")
            }
        }
    )
}

@Composable
private fun PermissionItem(emoji: String, text: String) {
    Row(
        modifier = Modifier.padding(start = 8.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        Text(emoji, style = MaterialTheme.typography.bodyLarge)
        Text(text, style = MaterialTheme.typography.bodyMedium)
    }
}

/**
 * Screen for opening files directly from external sources (e.g., file manager)
 * without needing them to be in the library database.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun DirectFileOpenScreen(
    fileUri: String,
    onBack: () -> Unit
) {
    val context = LocalContext.current
    val uri = remember(fileUri) { Uri.parse(fileUri) }
    
    // Get the file name from URI
    val fileName = remember(uri) {
        context.contentResolver.query(uri, null, null, null, null)?.use { cursor ->
            val nameIndex = cursor.getColumnIndex(android.provider.OpenableColumns.DISPLAY_NAME)
            if (cursor.moveToFirst() && nameIndex != -1) {
                cursor.getString(nameIndex)
            } else {
                uri.lastPathSegment ?: "unknown"
            }
        } ?: uri.lastPathSegment ?: "unknown"
    }
    
    val extension = remember(fileName) { fileName.substringAfterLast('.', "").lowercase() }
    
    // State for error messages and loading - moved outside when block
    var errorMessage by remember { mutableStateOf<String?>(null) }
    var isLoading by remember { mutableStateOf(false) }
    var filePath by remember { mutableStateOf<String?>(null) }
    
    // Route to appropriate reader based on file type
    when {
        extension == "epub" -> {
            // For EPUB, we need a file path, so convert URI to path
            // Clean up old cache files on mount
            LaunchedEffect(Unit) {
                try {
                    val cacheDir = context.cacheDir
                    val oldCacheFiles = cacheDir.listFiles { file ->
                        file.name.contains("_") && file.name.endsWith(".epub")
                    }
                    val oneDayAgo = System.currentTimeMillis() - (24 * 60 * 60 * 1000)
                    oldCacheFiles?.forEach { file ->
                        if (file.lastModified() < oneDayAgo) {
                            file.delete()
                        }
                    }
                } catch (e: Exception) {
                    // Ignore cleanup errors
                }
            }
            
            // Handle file loading asynchronously
            LaunchedEffect(uri) {
                isLoading = true
                errorMessage = null
                filePath = null
                
                try {
                    if (uri.scheme == "file") {
                        filePath = uri.path ?: throw IllegalStateException("File URI has no path")
                    } else {
                        // For content:// URIs, copy to cache with unique name
                        kotlinx.coroutines.withContext(kotlinx.coroutines.Dispatchers.IO) {
                            val uuid = UUID.randomUUID().toString()
                            val uniqueFileName = "${uuid}_$fileName"
                            val cacheFile = File(context.cacheDir, uniqueFileName)
                            context.contentResolver.openInputStream(uri)?.use { input ->
                                cacheFile.outputStream().use { output ->
                                    input.copyTo(output)
                                }
                            } ?: throw IllegalStateException("Unable to access the selected file. It may have been moved or deleted.")
                            filePath = cacheFile.absolutePath
                        }
                    }
                } catch (e: Exception) {
                    errorMessage = "Failed to load EPUB: ${e.message}"
                } finally {
                    isLoading = false
                }
            }
            
            when {
                isLoading -> {
                    // Show loading indicator
                    Scaffold(
                        topBar = {
                            TopAppBar(
                                title = { Text("Loading...") },
                                navigationIcon = {
                                    IconButton(onClick = onBack) {
                                        Icon(Icons.Default.Close, contentDescription = "Back")
                                    }
                                }
                            )
                        }
                    ) { paddingValues ->
                        Box(
                            modifier = Modifier
                                .fillMaxSize()
                                .padding(paddingValues),
                            contentAlignment = Alignment.Center
                        ) {
                            CircularProgressIndicator()
                        }
                    }
                }
                errorMessage != null -> {
                    Scaffold(
                        topBar = {
                            TopAppBar(
                                title = { Text("Error") },
                                navigationIcon = {
                                    IconButton(onClick = onBack) {
                                        Icon(Icons.Default.Close, contentDescription = "Back")
                                    }
                                }
                            )
                        }
                    ) { paddingValues ->
                        Box(
                            modifier = Modifier
                                .fillMaxSize()
                                .padding(paddingValues),
                            contentAlignment = Alignment.Center
                        ) {
                            Text(
                                text = errorMessage ?: "Unknown error",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.error
                            )
                        }
                    }
                }
                filePath != null -> {
                    EnhancedEReaderScreen(bookFilePath = filePath!!, onBack = onBack)
                }
            }
        }
        extension in setOf("pdf", "txt", "html", "htm", "docx") -> {
            DocumentReaderScreen(uriString = fileUri, fileName = fileName, onBack = onBack)
        }
        extension in setOf("cbz", "cbr") -> {
            ComicReaderScreen(uriString = fileUri, fileName = fileName, onBack = onBack)
        }
        else -> {
            // Unsupported file type
            Scaffold(
                topBar = {
                    TopAppBar(
                        title = { Text("Unsupported File") },
                        navigationIcon = {
                            IconButton(onClick = onBack) {
                                Icon(Icons.Default.Close, contentDescription = "Back")
                            }
                        }
                    )
                }
            ) { paddingValues ->
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(paddingValues),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Text(
                            text = "Unsupported file type: .$extension",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Text(
                            text = "CleverFerret supports: EPUB, PDF, TXT, HTML, DOCX, CBZ, CBR",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }
    }
}
