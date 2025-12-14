package com.universalmedialibrary.ui.media.navigation

import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.player.*
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.settings.MediaSettingsScreen
import com.universalmedialibrary.ui.media.viewmodels.*
import com.universalmedialibrary.debug.ui.DebugMenuScreen

/**
 * Main Navigation Routes for Clean media-centric CleverFerret
 */
object MediaRoutes {
    // Main sections
    const val HOME = "home"
    const val SEARCH = "search"
    const val ACTIVITY = "activity"
    const val SETTINGS = "settings"
    
    // Library routes
    const val LIBRARY = "library/{mediaType}"
    const val BOOKS = "library/book"
    const val AUDIOBOOKS = "library/audiobook"
    const val MUSIC = "library/music"
    const val PODCASTS = "library/podcast"
    const val COMICS = "library/comic"
    const val MOVIES = "library/movie"
    const val TV_SHOWS = "library/tv_show"
    const val WEB_FICTION = "library/webfiction"
    const val RADIO = "library/radio"
    const val DOCUMENTS = "library/document"
    
    // Detail routes
    const val MEDIA_DETAIL = "detail/{mediaType}/{mediaId}"
    const val BOOK_DETAIL = "detail/book/{mediaId}"
    const val MUSIC_ALBUM_DETAIL = "detail/album/{mediaId}"
    const val ARTIST_DETAIL = "detail/artist/{mediaId}"
    const val PODCAST_DETAIL = "detail/podcast/{mediaId}"
    const val SERIES_DETAIL = "detail/series/{mediaId}"
    
    // Player routes
    const val READER = "reader/{mediaType}/{mediaId}"
    const val AUDIO_PLAYER = "player/audio/{playerType}"
    const val VIDEO_PLAYER = "player/video/{videoId}"
    
    // Discovery routes
    const val DISCOVER = "discover"
    const val OPDS_BROWSER = "opds"
    const val PODCAST_DISCOVER = "discover/podcasts"
    const val WEB_FICTION_BROWSE = "discover/webfiction/{source}"
    
    // Collections & Organization
    const val COLLECTIONS = "collections"
    const val COLLECTION_DETAIL = "collection/{collectionId}"
    const val TAGS = "tags"
    const val TAG_DETAIL = "tag/{tagId}"
    
    // Special features
    const val AMBIENT_SOUNDS = "ambient"
    const val NEWS = "news"
    const val VISUALIZER = "visualizer"
    const val SYNC = "sync"
    const val IMPORT_EXPORT = "import-export"
    
    // Settings sub-routes
    const val SETTINGS_API = "settings/api"
    const val SETTINGS_APPEARANCE = "settings/appearance"
    const val SETTINGS_PLAYBACK = "settings/playback"
    const val SETTINGS_READER = "settings/reader"
    const val SETTINGS_STORAGE = "settings/storage"
    const val SETTINGS_SECURITY = "settings/security"
    const val SETTINGS_ABOUT = "settings/about"
    const val SETTINGS_MEDIA_SERVERS = "settings/media-servers"
    const val FILE_BROWSER = "file-browser"
    
    // Onboarding
    const val ONBOARDING = "onboarding"
    
    // Debug (only in debug builds)
    const val DEBUG_MENU = "debug"
    
    // Helper functions for navigation
    fun libraryRoute(mediaType: String) = "library/$mediaType"
    fun mediaDetailRoute(mediaType: String, mediaId: String) = "detail/$mediaType/$mediaId"
    fun readerRoute(mediaType: String, mediaId: String) = "reader/$mediaType/$mediaId"
    fun audioPlayerRoute(playerType: String) = "player/audio/$playerType"
    fun videoPlayerRoute(videoId: String) = "player/video/$videoId"
    fun collectionDetailRoute(collectionId: String) = "collection/$collectionId"
    fun webFictionBrowseRoute(source: String) = "discover/webfiction/$source"
}

/**
 * Main App Navigation Host
 */
@Composable
fun MediaAppNavHost(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    NavHost(
        navController = navController,
        startDestination = MediaRoutes.HOME,
        modifier = modifier,
        enterTransition = { fadeIn() + slideInHorizontally { it / 4 } },
        exitTransition = { fadeOut() + slideOutHorizontally { -it / 4 } },
        popEnterTransition = { fadeIn() + slideInHorizontally { -it / 4 } },
        popExitTransition = { fadeOut() + slideOutHorizontally { it / 4 } }
    ) {
        // =====================================================================
        // MAIN SECTIONS
        // =====================================================================
        
        composable(MediaRoutes.HOME) {
            val viewModel: MediaHomeViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            MediaHomeScreen(
                state = state,
                onItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onPlayClick = { item ->
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
                    navController.navigate(MediaRoutes.libraryRoute(section))
                },
                onSearchClick = { navController.navigate(MediaRoutes.SEARCH) },
                onNotificationClick = { /* TODO: Show notifications */ }
            )
        }

        composable(MediaRoutes.DISCOVER) {
            MediaDiscoverScreen(
                onNavigate = { route -> navController.navigate(route) },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        composable(MediaRoutes.SEARCH) {
            val viewModel: SearchViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            MediaSearchScreen(
                state = state,
                onQueryChange = { viewModel.updateQuery(it) },
                onSearch = { viewModel.search(it) },
                onClearSearch = { viewModel.clearSearch() },
                onResultClick = { result ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(result.mediaType.routeName, result.id))
                },
                onRecentSearchClick = { viewModel.useRecentSearch(it) },
                onClearRecentSearches = { viewModel.clearRecentSearches() },
                onCategoryFilterChange = { viewModel.setCategory(it) },
                onVoiceSearch = { /* Implement voice search */ },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        composable(MediaRoutes.SETTINGS) {
            MediaSettingsScreen(
                onNavigateToSubScreen = { route ->
                    navController.navigate(route)
                },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // API Settings sub-screen
        composable(MediaRoutes.SETTINGS_API) {
            com.universalmedialibrary.ui.settings.APISettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        // Media servers
        composable(MediaRoutes.SETTINGS_MEDIA_SERVERS) {
            com.universalmedialibrary.ui.settings.MediaServerSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Cloud storage / network shares
        composable("settings/cloud") {
            com.universalmedialibrary.ui.settings.NetworkStorageSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Playback / audio effects
        composable(MediaRoutes.SETTINGS_PLAYBACK) {
            val vm: com.universalmedialibrary.ui.settings.AudioEffectsViewModel = hiltViewModel()
            com.universalmedialibrary.ui.settings.AudioEffectsSettingsScreen(
                viewModel = vm,
                onNavigateBack = { navController.popBackStack() }
            )
        }

        // Text-to-speech providers
        composable("settings/tts") {
            com.universalmedialibrary.ui.settings.TtsProviderSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Reader settings (use the "visual" section as a reasonable default entry)
        composable(MediaRoutes.SETTINGS_READER) {
            com.universalmedialibrary.ui.settings.ReaderSettingsScreen(
                navController = navController,
                settingsType = "visual"
            )
        }

        // Storage tools
        composable(MediaRoutes.SETTINGS_STORAGE) {
            com.universalmedialibrary.ui.settings.StorageOrganizerScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Security
        composable(MediaRoutes.SETTINGS_SECURITY) {
            val vm: com.universalmedialibrary.ui.settings.SecuritySettingsViewModel = hiltViewModel()
            com.universalmedialibrary.ui.settings.SecuritySettingsScreen(
                navController = navController,
                viewModel = vm
            )
        }

        // Parental controls
        composable("settings/parental") {
            com.universalmedialibrary.ui.settings.ParentalControlsScreen(
                navController = navController
            )
        }

        // About
        composable(MediaRoutes.SETTINGS_ABOUT) {
            com.universalmedialibrary.ui.settings.AboutScreen(
                navController = navController
            )
        }

        // Placeholder routes referenced by Settings screen but not implemented here yet.
        composable("settings/social") { PlaceholderSettingsSubScreen(title = "Social Integrations", onBackClick = { navController.popBackStack() }) }
        composable("settings/auto-scan") { PlaceholderSettingsSubScreen(title = "Auto-Scan Settings", onBackClick = { navController.popBackStack() }) }
        composable("settings/metadata") { PlaceholderSettingsSubScreen(title = "Metadata Preferences", onBackClick = { navController.popBackStack() }) }
        composable(MediaRoutes.SETTINGS_APPEARANCE) { PlaceholderSettingsSubScreen(title = "Appearance", onBackClick = { navController.popBackStack() }) }
        composable("settings/display") { PlaceholderSettingsSubScreen(title = "Display Options", onBackClick = { navController.popBackStack() }) }
        composable("settings/text-size") { PlaceholderSettingsSubScreen(title = "Text Size", onBackClick = { navController.popBackStack() }) }
        composable("settings/casting") { PlaceholderSettingsSubScreen(title = "Casting", onBackClick = { navController.popBackStack() }) }
        composable("settings/privacy") { PlaceholderSettingsSubScreen(title = "Privacy", onBackClick = { navController.popBackStack() }) }
        composable("settings/cache") { PlaceholderSettingsSubScreen(title = "Cache", onBackClick = { navController.popBackStack() }) }
        composable("settings/downloads") { PlaceholderSettingsSubScreen(title = "Download Settings", onBackClick = { navController.popBackStack() }) }
        composable("settings/feedback") { PlaceholderSettingsSubScreen(title = "Feedback", onBackClick = { navController.popBackStack() }) }
        
        // =====================================================================
        // LIBRARY SCREENS
        // =====================================================================
        
        composable(
            route = MediaRoutes.LIBRARY,
            arguments = listOf(navArgument("mediaType") { type = NavType.StringType })
        ) { backStackEntry ->
            val mediaType = backStackEntry.arguments?.getString("mediaType") ?: "book"
            val viewModel: MediaLibraryViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            MediaLibraryScreen(
                state = state,
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
        
        // Music library with special tabbed view
        composable(MediaRoutes.MUSIC) {
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
        
        // Podcasts with special tabbed view
        composable(MediaRoutes.PODCASTS) {
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
                onImportOPML = { /* Show OPML import dialog */ },
                onBackClick = { navController.popBackStack() },
                onSearchClick = { navController.navigate(MediaRoutes.SEARCH) }
            )
        }
        
        // Web Fiction with special tabbed view
        composable(MediaRoutes.WEB_FICTION) {
            val viewModel: WebFictionViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            WebFictionScreen(
                state = state,
                onStoryClick = { story ->
                    navController.navigate(MediaRoutes.mediaDetailRoute("webfiction", story.id))
                },
                onChapterClick = { chapter ->
                    navController.navigate(MediaRoutes.readerRoute("webfiction", chapter.storyId))
                },
                onSourceClick = { source ->
                    navController.navigate(MediaRoutes.webFictionBrowseRoute(source.id))
                },
                onRefresh = { viewModel.refresh() },
                onAddByUrl = { /* Show add by URL dialog */ },
                onBrowseSource = { source ->
                    navController.navigate(MediaRoutes.webFictionBrowseRoute(source.id))
                },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // Radio screen
        composable(MediaRoutes.RADIO) {
            val viewModel: RadioViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            RadioScreen(
                state = state,
                onStationClick = { station -> viewModel.playStation(station) },
                onFavoriteToggle = { station -> viewModel.toggleFavorite(station) },
                onCategoryClick = { category -> viewModel.selectCategory(category) },
                onSearchClick = { navController.navigate(MediaRoutes.SEARCH) },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // DETAIL SCREENS
        // =====================================================================
        
        composable(
            route = MediaRoutes.MEDIA_DETAIL,
            arguments = listOf(
                navArgument("mediaType") { type = NavType.StringType },
                navArgument("mediaId") { type = NavType.StringType }
            )
        ) { backStackEntry ->
            val mediaType = backStackEntry.arguments?.getString("mediaType") ?: "book"
            val mediaId = backStackEntry.arguments?.getString("mediaId") ?: ""
            val viewModel: MediaDetailViewModel = hiltViewModel()
            val vmState by viewModel.uiState.collectAsState()
            
            // Create screen state from viewmodel state
            val screenState = MediaDetailState(
                item = MediaDetailItem(
                    id = mediaId,
                    title = vmState.title,
                    description = vmState.description,
                    imageUrl = vmState.imageUrl,
                    mediaType = MediaType.fromRouteName(mediaType)
                ),
                isLoading = vmState.isLoading
            )
            
            MediaDetailScreen(
                state = screenState,
                onBackClick = { navController.popBackStack() },
                onPlayClick = {
                    when (mediaType) {
                        "book", "comic", "document", "webfiction" -> {
                            navController.navigate(MediaRoutes.readerRoute(mediaType, mediaId))
                        }
                        "audiobook" -> {
                            navController.navigate(MediaRoutes.audioPlayerRoute("audiobook"))
                        }
                        "music", "album" -> {
                            navController.navigate(MediaRoutes.audioPlayerRoute("music"))
                        }
                        "podcast", "episode" -> {
                            navController.navigate(MediaRoutes.audioPlayerRoute("podcast"))
                        }
                        "movie", "tv_show", "video" -> {
                            navController.navigate(MediaRoutes.videoPlayerRoute(mediaId))
                        }
                    }
                },
                onChapterClick = { chapter ->
                    // Start reader at specific chapter
                    navController.navigate("${MediaRoutes.readerRoute(mediaType, mediaId)}?chapter=${chapter.id}")
                },
                onRelatedItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onAddToCollectionClick = { /* Show add to collection dialog */ },
                onShareClick = { /* Share media */ },
                onDownloadClick = { viewModel.download() }
            )
        }
        
        // =====================================================================
        // PLAYER SCREENS
        // =====================================================================
        
        composable(
            route = "${MediaRoutes.READER}?chapter={chapter}",
            arguments = listOf(
                navArgument("mediaType") { type = NavType.StringType },
                navArgument("mediaId") { type = NavType.StringType },
                navArgument("chapter") { 
                    type = NavType.StringType
                    nullable = true
                    defaultValue = null
                }
            )
        ) { backStackEntry ->
            val viewModel: ReaderViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            // Handle chapter parameter if provided (expects chapter index as string)
            val chapterParam = backStackEntry.arguments?.getString("chapter")
            LaunchedEffect(chapterParam) {
                chapterParam?.toIntOrNull()?.let { chapterIndex ->
                    viewModel.goToChapter(chapterIndex)
                }
            }
            
            MediaReaderScreen(
                state = state,
                onPageChange = { viewModel.goToPage(it) },
                onChapterChange = { viewModel.goToChapter(it) },
                onBookmarkToggle = { viewModel.toggleBookmark() },
                onTocOpen = { /* Handled by sheet in screen */ },
                onSettingsOpen = { /* Handled by sheet in screen */ },
                onSearch = { /* Show search dialog */ },
                onClose = { navController.popBackStack() },
                onTextSelect = { text, start, end -> viewModel.selectText(text, start, end) },
                onTtsToggle = { viewModel.toggleTts() }
            )
        }
        
        composable(
            route = MediaRoutes.AUDIO_PLAYER,
            arguments = listOf(navArgument("playerType") { type = NavType.StringType })
        ) { backStackEntry ->
            val viewModel: AudioPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            MediaAudioPlayerScreen(
                state = state,
                onPlayPause = { viewModel.playPause() },
                onSeek = { viewModel.seek(it) },
                onSkipPrevious = { viewModel.skipPrevious() },
                onSkipNext = { viewModel.skipNext() },
                onRewind = { viewModel.rewind() },
                onFastForward = { viewModel.fastForward() },
                onSpeedChange = { viewModel.setPlaybackSpeed(it) },
                onShuffleToggle = { viewModel.toggleShuffle() },
                onRepeatToggle = { viewModel.toggleRepeat() },
                onSleepTimer = { /* Show sleep timer dialog */ },
                onQueueOpen = { /* Handled by sheet in screen */ },
                onChaptersOpen = { /* Handled by sheet in screen */ },
                onCastClick = { /* Start casting */ },
                onClose = { navController.popBackStack() }
            )
        }
        
        composable(
            route = MediaRoutes.VIDEO_PLAYER,
            arguments = listOf(navArgument("videoId") { type = NavType.StringType })
        ) { backStackEntry ->
            val viewModel: VideoPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            MediaVideoPlayerScreen(
                state = state,
                onPlayPause = { viewModel.playPause() },
                onSeek = { viewModel.seek(it) },
                onSeekRelative = { viewModel.seekRelative(it) },
                onSkipPrevious = { viewModel.skipPrevious() },
                onSkipNext = { viewModel.skipNext() },
                onSkipIntro = { viewModel.skipIntro() },
                onSubtitleChange = { viewModel.setSubtitle(it) },
                onAudioTrackChange = { viewModel.setAudioTrack(it) },
                onQualityChange = { viewModel.setQuality(it) },
                onCastClick = { /* Start casting */ },
                onPipClick = { /* Enter PiP */ },
                onClose = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // DISCOVERY & BROWSE SCREENS
        // =====================================================================
        
        composable(MediaRoutes.OPDS_BROWSER) {
            val viewModel: OPDSViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            OPDSBrowserScreen(
                state = state,
                onCatalogClick = { catalog -> viewModel.openCatalog(catalog) },
                onEntryClick = { entry ->
                    // Either download or show details
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
        
        composable(MediaRoutes.AMBIENT_SOUNDS) {
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
        
        composable(MediaRoutes.NEWS) {
            val viewModel: NewsViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            NewsScreen(
                state = state,
                onArticleClick = { article ->
                    navController.navigate(MediaRoutes.readerRoute("news", article.id))
                },
                onFeedSelect = { feed -> viewModel.selectFeed(feed) },
                onRefresh = { viewModel.refresh() },
                onBackClick = { navController.popBackStack() }
            )
        }

        composable(MediaRoutes.VISUALIZER) {
            com.universalmedialibrary.ui.visualizer.VisualizerScreen(
                onBack = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // COLLECTIONS & ORGANIZATION
        // =====================================================================
        
        composable(MediaRoutes.COLLECTIONS) {
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
        
        composable(
            route = MediaRoutes.COLLECTION_DETAIL,
            arguments = listOf(navArgument("collectionId") { type = NavType.StringType })
        ) { backStackEntry ->
            val viewModel: CollectionDetailViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            CollectionDetailScreen(
                state = state,
                onItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onRemoveItem = { item -> viewModel.removeItem(item) },
                onEditCollection = { /* Show edit dialog */ },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // SYNC & IMPORT/EXPORT
        // =====================================================================
        
        composable(MediaRoutes.SYNC) {
            val viewModel: MediaSyncViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            MediaSyncScreen(
                state = state,
                onSyncNow = { viewModel.syncNow() },
                onConfigureService = { service -> viewModel.configureService(service) },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        composable(MediaRoutes.IMPORT_EXPORT) {
            val viewModel: ImportExportViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            ImportExportScreen(
                state = state,
                onImport = { type -> viewModel.startImport(type) },
                onExport = { type -> viewModel.startExport(type) },
                onBackClick = { navController.popBackStack() }
            )
        }

        composable(MediaRoutes.FILE_BROWSER) {
            com.universalmedialibrary.ui.filepicker.EnhancedFileBrowser(
                onFileSelected = { file ->
                    onShowSnackbar("Selected: ${file.name}")
                }
            )
        }
        
        // =====================================================================
        // ONBOARDING
        // =====================================================================
        
        composable(MediaRoutes.ONBOARDING) {
            OnboardingScreen(
                onComplete = {
                    navController.navigate(MediaRoutes.HOME) {
                        popUpTo(MediaRoutes.ONBOARDING) { inclusive = true }
                    }
                }
            )
        }
        
        // =====================================================================
        // DEBUG MENU (only available in debug builds)
        // =====================================================================
        
        if (BuildConfig.SHOW_DEBUG_MENU) {
            composable(MediaRoutes.DEBUG_MENU) {
                DebugMenuScreen(
                    onBack = { navController.popBackStack() }
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun PlaceholderSettingsSubScreen(
    title: String,
    onBackClick: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(title) },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(24.dp),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = "This settings section is not wired up yet.",
                style = MaterialTheme.typography.bodyLarge
            )
        }
    }
}

// Extension to get route name from MediaType
private val MediaType.routeName: String
    get() = when (this) {
        MediaType.BOOK -> "book"
        MediaType.AUDIOBOOK -> "audiobook"
        MediaType.MUSIC -> "music"
        MediaType.PODCAST -> "podcast"
        MediaType.COMIC -> "comic"
        MediaType.MOVIE -> "movie"
        MediaType.TV_SHOW -> "tv_show"
        MediaType.FANFICTION -> "webfiction"
        MediaType.DOCUMENT -> "document"
        MediaType.RADIO -> "radio"
        MediaType.NEWS -> "news"
        MediaType.UNKNOWN -> "unknown"
    }
