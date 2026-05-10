package com.universalmedialibrary.ui.media.navigation.graphs

import android.net.Uri
import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.MenuBook
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.player.*
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*
import com.universalmedialibrary.debug.ui.DebugMenuScreen
import com.universalmedialibrary.ui.components.NavigationItems
import com.universalmedialibrary.ui.components.UiErrorBoundary
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.theme.toCleverFerretTheme
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.EPUBReaderScreen
import kotlinx.coroutines.launch
import java.io.File
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.media.navigation.libraryTypeOptions
import com.universalmedialibrary.ui.media.screens.LibraryMediaTypeOption
fun NavGraphBuilder.legacyContentRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
    composable("webfiction_manager") {
        com.universalmedialibrary.ui.webfiction.WebFictionManagerScreen(
            navController = navController
        )
    }
    
    composable("story_manager") {
        com.universalmedialibrary.ui.webfiction.StoryManagerRoute(
            onBack = { navController.popBackStack() }
        )
    }
    
    composable("webfiction_story/{storyId}") { backStackEntry ->
        val storyId = backStackEntry.arguments?.getString("storyId") ?: ""
        val viewModel: ReaderViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaReaderScreen(
            state = state,
            onPageChange = { viewModel.goToPage(it) },
            onChapterChange = { viewModel.goToChapter(it) },
            onBookmarkToggle = { viewModel.toggleBookmark() },
            onTocOpen = { },
            onSettingsOpen = { },
            onSearch = { },
            onClose = { navController.popBackStack() },
            onTextSelect = { text, start, end -> viewModel.selectText(text, start, end) },
            onTtsToggle = { viewModel.toggleTts() }
        )
    }
    
    composable("web_comic_downloader") {
        com.universalmedialibrary.ui.webfiction.UnifiedFanfictionHubScreen(
            navController = navController
        )
    }
    
    composable("metabods_tag_browser") {
        com.universalmedialibrary.ui.webfiction.MetabodsTagBrowserScreen(
            navController = navController
        )
    }
    
    composable("universal_tag_browser") {
        com.universalmedialibrary.ui.webfiction.UniversalTagBrowserScreen(
            navController = navController
        )
    }
    
    composable("hivefy_music") {
        com.universalmedialibrary.ui.music.hivefy.HivefyMusicScreen(
            onBack = { navController.popBackStack() }
        )
    }
    
    composable("opds_catalog") {
        val viewModel: OPDSViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        OPDSBrowserScreen(
            state = state,
            onCatalogClick = { catalog -> viewModel.openCatalog(catalog) },
            onEntryClick = { entry ->
                if (entry.isDownloadable) {
                    viewModel.download(entry)
                } else {
                    navController.navigate(MediaRoutes.mediaDetailRoute("opds", entry.id))
                }
            },
            onSearch = { query -> viewModel.search(query) },
            onAddCatalog = { url -> viewModel.addCatalog(url) },
            onBackClick = { 
                if (!viewModel.navigateBack()) {
                    navController.popBackStack()
                }
            }
        )
    }
    
    composable("storage_browser") {
        val scope = rememberCoroutineScope()
        val context = LocalContext.current
        
        com.universalmedialibrary.ui.filepicker.EnhancedFileBrowser(
            onFileSelected = { file ->
                // Import the selected file to library
                scope.launch {
                    try {
                        val uri = android.net.Uri.fromFile(file)
                        val mediaType = when {
                            file.extension.lowercase() in listOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt", "rtf", "doc", "docx") -> "BOOK"
                            file.extension.lowercase() in listOf("mp3", "m4a", "m4b", "aac", "ogg", "opus", "flac", "wav", "wma") -> "MUSIC"
                            file.extension.lowercase() in listOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v") -> "VIDEO"
                            file.extension.lowercase() in listOf("cbz", "cbr", "cb7", "cbt") -> "COMIC"
                            else -> "DOCUMENT"
                        }
                        onShowSnackbar("Importing ${file.name}...")
                        
                        // Navigate to appropriate detail/reader based on type
                        when (mediaType) {
                            "BOOK", "COMIC", "DOCUMENT" -> {
                                val encodedUri = java.net.URLEncoder.encode(uri.toString(), "UTF-8")
                                val encodedName = java.net.URLEncoder.encode(file.name, "UTF-8")
                                navController.navigate("document-reader/$encodedUri/$encodedName")
                            }
                            else -> {
                                onShowSnackbar("Added ${file.name} to library")
                            }
                        }
                    } catch (e: Exception) {
                        onShowSnackbar("Error importing file: ${e.message}")
                    }
                }
            },
            onFolderSelected = { folder ->
                onShowSnackbar("Folder: ${folder.name}")
            }
        )
    }
    
    composable("reading_statistics") {
        // Reading statistics requires a specific media ID - show a placeholder for now
        // Users should navigate to this from a specific media detail screen
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Text("Reading Statistics", style = MaterialTheme.typography.titleMedium)
                Text("Please access statistics from a book's detail page", 
                     style = MaterialTheme.typography.bodyMedium)
                Button(onClick = { navController.popBackStack() }) {
                    Text("Go Back")
                }
            }
        }
    }
    
    composable("free_audiobooks") {
        MediaDiscoverScreen(
            onNavigate = navController::navigate,
            onBackClick = { navController.popBackStack() }
        )
    }
    
    composable("free_music") {
        com.universalmedialibrary.ui.music.FreeMusicScreen(
            onBack = { navController.popBackStack() }
        )
    }
    
    composable("free_media") {
        com.universalmedialibrary.ui.media.FreeMediaScreen(
            onBack = { navController.popBackStack() }
        )
    }
    
    composable("podcasts") {
        val viewModel: PodcastViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        PodcastScreen(
            state = state,
            onShowClick = { show ->
                navController.navigate(MediaRoutes.mediaDetailRoute("podcast", show.id))
            },
            onEpisodeClick = { episode ->
                navController.navigate(MediaRoutes.mediaDetailRoute("episode", episode.id))
            },
            onPlayEpisode = { episode -> viewModel.playEpisode(episode) },
            onDownloadEpisode = { episode -> viewModel.downloadEpisode(episode) },
            onDiscoverClick = { navController.navigate(MediaRoutes.PODCAST_DISCOVER) },
            onImportOPML = { },
            onBackClick = { navController.popBackStack() },
            onSearchClick = { navController.navigate(MediaRoutes.SEARCH) }
        )
    }
    
    composable("radio") {
        com.universalmedialibrary.ui.radio.RadioScreen(
            onBack = { navController.popBackStack() }
        )
    }
    
    composable("visualizer") {
        com.universalmedialibrary.ui.visualizer.VisualizerScreen(
            onBack = { navController.popBackStack() }
        )
    }
    
    composable("ambient") {
        val viewModel: AmbientViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaAmbientScreen(
            state = state,
            onSoundToggle = { sound -> viewModel.toggleSound(sound) },
            onVolumeChange = { sound, volume -> viewModel.setVolume(sound, volume) },
            onPresetSelect = { preset -> viewModel.applyPreset(preset) },
            onSavePreset = { name -> viewModel.savePreset(name) },
            onBackClick = { navController.popBackStack() }
        )
    }
    
    composable("music") {
        val viewModel: MusicViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MusicLibraryScreen(
            state = state,
            onArtistClick = { artist ->
                navController.navigate(MediaRoutes.mediaDetailRoute("artist", artist.id))
            },
            onAlbumClick = { album ->
                navController.navigate(MediaRoutes.mediaDetailRoute("album", album.id))
            },
            onTrackClick = { track -> viewModel.playTrack(track) },
            onPlaylistClick = { playlist -> viewModel.playPlaylist(playlist) },
            onShuffleAll = { viewModel.shuffleAll() },
            onBackClick = { navController.popBackStack() },
            onSearchClick = { navController.navigate(MediaRoutes.SEARCH) }
        )
    }
    
    composable("collections") {
        val viewModel: CollectionsViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaCollectionsScreen(
            state = state,
            onCollectionClick = { collection ->
                navController.navigate(MediaRoutes.collectionDetailRoute(collection.id))
            },
            onCreateCollection = { name -> viewModel.createCollection(name) },
            onBackClick = { navController.popBackStack() }
        )
    }
    
    // Legacy library detail routes (library_details/{typeId} pattern)
    composable("library_details/{typeId}") { backStackEntry ->
        val typeId = backStackEntry.arguments?.getString("typeId") ?: "1"
        val mediaType = when (typeId) {
            "1" -> "book"
            "2" -> "audiobook"
            "3" -> "comic"
            "4" -> "movie"
            "5" -> "tv_show"
            "7" -> "document"
            else -> "book"
        }
        val viewModel: MediaLibraryViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        UiErrorBoundary(
            boundaryName = "Route:${MediaRoutes.LIBRARY}",
            onGoHome = { navController.navigate(MediaRoutes.HOME) },
        ) {
            MediaLibraryScreen(
                state = state,
                mediaTypeOptions = libraryTypeOptions,
                currentMediaTypeRoute = mediaType,
                onMediaTypeSelected = { selectedType ->
                    navController.navigate(MediaRoutes.libraryRoute(selectedType)) {
                        launchSingleTop = true
                    }
                },
                onItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(mediaType, item.id))
                },
                onBackClick = { navController.popBackStack() },
                onSearchClick = { navController.navigate(MediaRoutes.SEARCH) },
                onFilterChange = { viewModel.setFilter(it) },
                onSortChange = { viewModel.setSort(it) },
                onViewModeChange = { viewModel.setViewMode(it) },
                onRefresh = { viewModel.refresh() }
            )
        }
    }
    
    // Legacy detail route
    composable("detail/{itemId}") { backStackEntry ->
        val itemId = backStackEntry.arguments?.getString("itemId") ?: ""
        val viewModel: MediaDetailViewModel = hiltViewModel()
        val vmState by viewModel.uiState.collectAsState()
        
        val screenState = MediaDetailState(
            item = MediaDetailItem(
                id = itemId,
                title = vmState.title,
                description = vmState.description,
                imageUrl = vmState.imageUrl,
                mediaType = MediaType.UNKNOWN
            ),
            isLoading = vmState.isLoading
        )
        
        MediaDetailScreen(
            state = screenState,
            onBackClick = { navController.popBackStack() },
            onPlayClick = { },
            onChapterClick = { },
            onRelatedItemClick = { item ->
                navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
            },
            onAddToCollectionClick = { },
            onShareClick = { },
            onDownloadClick = { viewModel.download() }
        )
    }
    
    // Metadata editor route
    composable("metadata_editor/{itemId}") { backStackEntry ->
        val itemId = backStackEntry.arguments?.getString("itemId") ?: ""
        com.universalmedialibrary.ui.metadata.MetadataEditorScreen(
            itemId = itemId.toLongOrNull() ?: 0L,
            onSave = { navController.popBackStack() },
            onCancel = { navController.popBackStack() }
        )
    }
    
    composable("fanfiction_download") {
        com.universalmedialibrary.ui.fanfiction.FanfictionDownloadScreen(
            onNavigateBack = { navController.popBackStack() }
        )
    }
    
    composable("home") {
        val viewModel: MediaHomeViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        val isRefreshing by viewModel.isRefreshing.collectAsState()
        
        MediaHomeScreen(
            state = state,
            isRefreshing = isRefreshing,
        val reduceMotionEnabled by viewModel.reduceMotionEnabled.collectAsState()

        MediaHomeScreen(
            state = state,
            reduceMotionEnabled = reduceMotionEnabled,
            onItemClick = { item ->
                viewModel.clearLastOpenedCategory()
                navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
            },
            onPlayClick = { item ->
                viewModel.clearLastOpenedCategory()
                when (item.mediaType) {
                    MediaType.BOOK, MediaType.COMIC, MediaType.DOCUMENT, MediaType.FANFICTION -> {
                        navController.navigate(MediaRoutes.readerRoute(item.mediaType.routeName, item.id))
                    }
                    MediaType.AUDIOBOOK -> {
                        navController.navigate(MediaRoutes.audioPlayerRoute("audiobook"))
                    }
                    MediaType.MUSIC -> {
                        navController.navigate(MediaRoutes.audioPlayerRoute("music"))
                    }
                    MediaType.PODCAST -> {
                        navController.navigate(MediaRoutes.audioPlayerRoute("podcast"))
                    }
                    MediaType.MOVIE, MediaType.TV_SHOW -> {
                        navController.navigate(MediaRoutes.videoPlayerRoute(item.id))
                    }
                    else -> {
                        navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                    }
                }
            },
            onSeeAllClick = { section ->
                viewModel.clearLastOpenedCategory()
                navController.navigate(section)
            },
            onSearchClick = { navController.navigate(MediaRoutes.SEARCH) },
            onRefresh = { viewModel.refresh() },
            onQuickAccessCategoryClick = { category ->
                viewModel.onQuickAccessCategoryOpened(category)
                navController.navigate(category)
            },
            onSearchClick = {
                viewModel.clearLastOpenedCategory()
                navController.navigate(MediaRoutes.SEARCH)
            },
            onRetry = { viewModel.refresh() },
            onNotificationClick = { viewModel.clearLastOpenedCategory() },
            onAddLocalFilesClick = {
                viewModel.clearLastOpenedCategory()
                navController.navigate(MediaRoutes.FILE_BROWSER)
            },
            onSubscribePodcastsClick = {
                viewModel.clearLastOpenedCategory()
                navController.navigate(MediaRoutes.PODCASTS)
            }
        )
    }
    
    // =====================================================================
}
