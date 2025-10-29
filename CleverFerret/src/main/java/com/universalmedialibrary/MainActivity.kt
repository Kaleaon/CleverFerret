package com.universalmedialibrary

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.compose.setContent
import androidx.activity.result.contract.ActivityResultContracts
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
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items as gridItems
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowForward
import androidx.compose.material.icons.filled.Book
import androidx.compose.material.icons.filled.Build
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Collections
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material.icons.filled.GraphicEq
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.LibraryBooks
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
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.NavigationRail
import androidx.compose.material3.NavigationRailItem
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
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
import com.universalmedialibrary.ui.home.MediaRecommendation
import com.universalmedialibrary.ui.home.MediaPosterCard
import com.universalmedialibrary.ui.home.QuickAccessCard
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.services.CalibreImportForegroundService
import com.universalmedialibrary.ui.library.CreateLibraryDialog
import com.universalmedialibrary.ui.library.LibraryDetailsScreen
import com.universalmedialibrary.ui.open.MediaOpenScreen
import com.universalmedialibrary.ui.settings.StorageOrganizerScreen
import com.universalmedialibrary.ui.settings.PlaylistSettingsScreen
import com.universalmedialibrary.ui.settings.OpdsSettingsScreen
import com.universalmedialibrary.ui.settings.MediaServerSettingsScreen
import com.universalmedialibrary.ui.settings.NetworkStorageSettingsScreen
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.theme.toCleverFerretTheme
import com.universalmedialibrary.utils.rememberPermissionsHandler
import com.universalmedialibrary.utils.PermissionsHandler
import dagger.hilt.android.AndroidEntryPoint


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
    val context = LocalContext.current
    
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
    NavHost(
        navController = navController,
        startDestination = "home"
    ) {
        composable("home") {
            com.universalmedialibrary.ui.home.HomeScreen(
                onNavigateToMedia = { type, id -> 
                    when (type) {
                        "music" -> navController.navigate("music")
                        "video" -> navController.navigate("videos")
                        "book" -> navController.navigate("bookshelf/1")
                        "comic" -> navController.navigate("bookshelf/2")
                        else -> navController.navigate("library_details/1")
                    }
                },
                onNavigateToSearch = { navController.navigate("enhanced_search") },
                onNavigateToLibrary = { navController.navigate("library_details/1") },
                onNavigateToVisualizer = { navController.navigate("visualizer") },
                onNavigateToFanfiction = { navController.navigate("fanfiction_library") },
                onNavigateToAudiobooks = { navController.navigate("audiobook_library") },
                onNavigateToDuplicates = { navController.navigate("duplicate_detection") }
            )
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
                onNavigateToFMRadio = { navController.navigate("fm_radio") }
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

        // Storage Browser route
        composable("storage_browser") {
            com.universalmedialibrary.ui.filepicker.StorageBrowserScreen(
                onNavigateBack = { navController.navigateUp() },
                onFileSelected = { file ->
                    // Determine file type and navigate to appropriate player/reader
                    when (file.extension.lowercase()) {
                        "epub", "pdf", "mobi", "azw", "azw3" -> {
                            navController.navigate("reader/${file.absolutePath}")
                        }
                        "mp3", "m4a", "flac", "wav", "ogg" -> {
                            navController.navigate("audio_player/${file.absolutePath}")
                        }
                        "mp4", "mkv", "avi", "mov", "webm" -> {
                            navController.navigate("video_player/${file.absolutePath}")
                        }
                    }
                }
            )
        }

        // Enhanced eBook Reader route
        composable("reader/{bookPath}") { backStackEntry ->
            val bookPath = backStackEntry.arguments?.getString("bookPath") ?: ""
            com.universalmedialibrary.ui.reader.EnhancedEReaderScreen(
                bookFilePath = bookPath,
                onBack = { navController.navigateUp() }
            )
        }

        // Modern Audio Player route
        composable("audio_player/{audioPath}") { backStackEntry ->
            val audioPath = backStackEntry.arguments?.getString("audioPath") ?: ""
            com.universalmedialibrary.ui.player.ModernAudioPlayerScreen(
                onNavigateBack = { navController.navigateUp() }
            )
        }

        // Modern Video Player route
        composable("video_player/{videoPath}") { backStackEntry ->
            val videoPath = backStackEntry.arguments?.getString("videoPath") ?: ""
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
                    // TODO: Implement file picker for audiobook import
                    navController.navigate("storage_browser")
                },
                onAudiobookClick = { audiobook ->
                    // TODO: Navigate to audiobook player when implemented
                    // navController.navigate("audiobook_player/${audiobook.id}")
                }
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
    }
}


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
        MediaRecommendation("The Great Gatsby", "F. Scott Fitzgerald", "BOOK", listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))),
        MediaRecommendation("Inception", "Christopher Nolan", "MOVIE", listOf(Color(0xFF0D47A1), Color(0xFF2196F3))),
        MediaRecommendation("Abbey Road", "The Beatles", "MUSIC", listOf(Color(0xFF4A148C), Color(0xFF9C27B0))),
        MediaRecommendation("1984", "George Orwell", "BOOK", listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))),
        MediaRecommendation("The Godfather", "Francis Ford Coppola", "MOVIE", listOf(Color(0xFF0D47A1), Color(0xFF2196F3))),
        MediaRecommendation("Dark Side of the Moon", "Pink Floyd", "MUSIC", listOf(Color(0xFF4A148C), Color(0xFF9C27B0))),
        MediaRecommendation("To Kill a Mockingbird", "Harper Lee", "BOOK", listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))),
        MediaRecommendation("Interstellar", "Christopher Nolan", "MOVIE", listOf(Color(0xFF0D47A1), Color(0xFF2196F3))),
        MediaRecommendation("Thriller", "Michael Jackson", "MUSIC", listOf(Color(0xFF4A148C), Color(0xFF9C27B0))),
        MediaRecommendation("Pride and Prejudice", "Jane Austen", "BOOK", listOf(Color(0xFF1B5E20), Color(0xFF4CAF50)))
    )


    Row(modifier = Modifier.fillMaxSize()) {
        // Navigation Rail
        NavigationRail(
            modifier = Modifier.fillMaxHeight(),
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        ) {
            Spacer(modifier = Modifier.height(16.dp))
            
            // Logo/Icon at top
            Icon(
                imageVector = Icons.Default.Favorite,
                contentDescription = "CleverFerret",
                modifier = Modifier
                    .size(48.dp)
                    .padding(bottom = 24.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            
            NavigationRailItem(
                icon = { Icon(Icons.Default.Home, contentDescription = "Home") },
                label = { Text("Home") },
                selected = selectedNavItem == 0,
                onClick = { selectedNavItem = 0 }
            )
            NavigationRailItem(
                icon = { Icon(Icons.Default.LibraryBooks, contentDescription = "Libraries") },
                label = { Text("Libraries") },
                selected = selectedNavItem == 1,
                onClick = { 
                    selectedNavItem = 1
                    navController.navigate("media_library")
                }
            )
            NavigationRailItem(
                icon = { Icon(Icons.Default.MusicNote, contentDescription = "Music") },
                label = { Text("Music") },
                selected = selectedNavItem == 2,
                onClick = { 
                    selectedNavItem = 2
                    navController.navigate("music")
                }
            )
            NavigationRailItem(
                icon = { Icon(Icons.Default.Movie, contentDescription = "Videos") },
                label = { Text("Videos") },
                selected = selectedNavItem == 3,
                onClick = { 
                    selectedNavItem = 3
                    navController.navigate("videos")
                }
            )
            NavigationRailItem(
                icon = { Icon(Icons.Default.Podcasts, contentDescription = "Podcasts") },
                label = { Text("Podcasts") },
                selected = selectedNavItem == 4,
                onClick = { 
                    selectedNavItem = 4
                    navController.navigate("podcasts")
                }
            )
            NavigationRailItem(
                icon = { Icon(Icons.Default.Radio, contentDescription = "Radio") },
                label = { Text("Radio") },
                selected = selectedNavItem == 5,
                onClick = { 
                    selectedNavItem = 5
                    navController.navigate("radio")
                }
            )
            
            Spacer(modifier = Modifier.weight(1f))
            
            NavigationRailItem(
                icon = { Icon(Icons.Default.Settings, contentDescription = "Settings") },
                label = { Text("Settings") },
                selected = selectedNavItem == 6,
                onClick = { 
                    selectedNavItem = 6
                    navController.navigate("settings")
                }
            )
            
            Spacer(modifier = Modifier.height(16.dp))
        }

        // Main Content Area
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

                        gridItems(sampleMedia) { media ->
                            MediaPosterCard(
                                media = media,
                                onClick = {
                                    when (media.type) {
                                        "BOOK" -> navController.navigate("bookshelf/1")
                                        "MOVIE" -> navController.navigate("videos")
                                        "MUSIC" -> navController.navigate("music")
                                    }
                                }
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
                                title = "Visualizer",
                                icon = Icons.Default.GraphicEq,
                                colors = listOf(Color(0xFF1B5E20), Color(0xFF4CAF50)),
                                modifier = Modifier.weight(1f),
                                onClick = { navController.navigate("visualizer") }
                            )
                            QuickAccessCard(
                                title = "Sync",
                                icon = Icons.Default.Sync,
                                colors = listOf(Color(0xFF0A1630), Color(0xFFD4AF37)),
                                modifier = Modifier.weight(1f),
                                onClick = { navController.navigate("sync") }
                            )
                        }
                    }
                }
            }
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
