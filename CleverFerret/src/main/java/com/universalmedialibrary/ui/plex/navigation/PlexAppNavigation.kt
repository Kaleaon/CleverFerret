package com.universalmedialibrary.ui.plex.navigation

import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.ui.plex.components.PlexMediaType
import com.universalmedialibrary.ui.plex.player.*
import com.universalmedialibrary.ui.plex.screens.*
import com.universalmedialibrary.ui.plex.settings.PlexSettingsScreen
import com.universalmedialibrary.ui.plex.viewmodels.*
import com.universalmedialibrary.debug.ui.DebugMenuScreen

/**
 * Main Navigation Routes for Plex-style CleverFerret
 */
object PlexRoutes {
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
fun PlexAppNavHost(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    NavHost(
        navController = navController,
        startDestination = PlexRoutes.HOME,
        modifier = modifier,
        enterTransition = { fadeIn() + slideInHorizontally { it / 4 } },
        exitTransition = { fadeOut() + slideOutHorizontally { -it / 4 } },
        popEnterTransition = { fadeIn() + slideInHorizontally { -it / 4 } },
        popExitTransition = { fadeOut() + slideOutHorizontally { it / 4 } }
    ) {
        // =====================================================================
        // MAIN SECTIONS
        // =====================================================================
        
        composable(PlexRoutes.HOME) {
            val viewModel: PlexHomeViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexHomeScreen(
                state = state,
                onItemClick = { item ->
                    navController.navigate(PlexRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onPlayClick = { item ->
                    when (item.mediaType) {
                        PlexMediaType.BOOK, PlexMediaType.COMIC, PlexMediaType.DOCUMENT, PlexMediaType.FANFICTION -> {
                            navController.navigate(PlexRoutes.readerRoute(item.mediaType.routeName, item.id))
                        }
                        PlexMediaType.AUDIOBOOK -> {
                            navController.navigate(PlexRoutes.audioPlayerRoute("audiobook"))
                        }
                        PlexMediaType.MUSIC -> {
                            navController.navigate(PlexRoutes.audioPlayerRoute("music"))
                        }
                        PlexMediaType.PODCAST -> {
                            navController.navigate(PlexRoutes.audioPlayerRoute("podcast"))
                        }
                        PlexMediaType.MOVIE, PlexMediaType.TV_SHOW -> {
                            navController.navigate(PlexRoutes.videoPlayerRoute(item.id))
                        }
                        else -> {
                            navController.navigate(PlexRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                        }
                    }
                },
                onSeeAllClick = { section ->
                    navController.navigate(PlexRoutes.libraryRoute(section))
                },
                onSearchClick = { navController.navigate(PlexRoutes.SEARCH) },
                onNotificationClick = { /* TODO: Show notifications */ }
            )
        }
        
        composable(PlexRoutes.SEARCH) {
            val viewModel: PlexSearchViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexSearchScreen(
                state = state,
                onQueryChange = { viewModel.updateQuery(it) },
                onSearch = { viewModel.search(it) },
                onClearSearch = { viewModel.clearSearch() },
                onResultClick = { result ->
                    navController.navigate(PlexRoutes.mediaDetailRoute(result.mediaType.routeName, result.id))
                },
                onRecentSearchClick = { viewModel.useRecentSearch(it) },
                onClearRecentSearches = { viewModel.clearRecentSearches() },
                onCategoryFilterChange = { viewModel.setCategory(it) },
                onVoiceSearch = { /* Implement voice search */ },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        composable(PlexRoutes.SETTINGS) {
            PlexSettingsScreen(
                onNavigateToSubScreen = { route ->
                    navController.navigate(route)
                },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // LIBRARY SCREENS
        // =====================================================================
        
        composable(
            route = PlexRoutes.LIBRARY,
            arguments = listOf(navArgument("mediaType") { type = NavType.StringType })
        ) { backStackEntry ->
            val mediaType = backStackEntry.arguments?.getString("mediaType") ?: "book"
            val viewModel: PlexLibraryViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexLibraryScreen(
                state = state,
                onItemClick = { item ->
                    navController.navigate(PlexRoutes.mediaDetailRoute(mediaType, item.id))
                },
                onBackClick = { navController.popBackStack() },
                onSearchClick = { navController.navigate(PlexRoutes.SEARCH) },
                onFilterChange = { viewModel.setFilter(it) },
                onSortChange = { viewModel.setSort(it) },
                onViewModeChange = { viewModel.setViewMode(it) },
                onRefresh = { viewModel.refresh() }
            )
        }
        
        // Music library with special tabbed view
        composable(PlexRoutes.MUSIC) {
            val viewModel: PlexMusicViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexMusicLibraryScreen(
                state = state,
                onArtistClick = { artist ->
                    navController.navigate(PlexRoutes.mediaDetailRoute("artist", artist.id))
                },
                onAlbumClick = { album ->
                    navController.navigate(PlexRoutes.mediaDetailRoute("album", album.id))
                },
                onTrackClick = { track -> viewModel.playTrack(track) },
                onPlaylistClick = { playlist -> viewModel.playPlaylist(playlist) },
                onShuffleAll = { viewModel.shuffleAll() },
                onBackClick = { navController.popBackStack() },
                onSearchClick = { navController.navigate(PlexRoutes.SEARCH) }
            )
        }
        
        // Podcasts with special tabbed view
        composable(PlexRoutes.PODCASTS) {
            val viewModel: PlexPodcastViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexPodcastScreen(
                state = state,
                onShowClick = { show ->
                    navController.navigate(PlexRoutes.mediaDetailRoute("podcast", show.id))
                },
                onEpisodeClick = { episode ->
                    navController.navigate(PlexRoutes.mediaDetailRoute("episode", episode.id))
                },
                onPlayEpisode = { episode -> viewModel.playEpisode(episode) },
                onDownloadEpisode = { episode -> viewModel.downloadEpisode(episode) },
                onDiscoverClick = { navController.navigate(PlexRoutes.PODCAST_DISCOVER) },
                onImportOPML = { /* Show OPML import dialog */ },
                onBackClick = { navController.popBackStack() },
                onSearchClick = { navController.navigate(PlexRoutes.SEARCH) }
            )
        }
        
        // Web Fiction with special tabbed view
        composable(PlexRoutes.WEB_FICTION) {
            val viewModel: PlexWebFictionViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexWebFictionScreen(
                state = state,
                onStoryClick = { story ->
                    navController.navigate(PlexRoutes.mediaDetailRoute("webfiction", story.id))
                },
                onChapterClick = { chapter ->
                    navController.navigate(PlexRoutes.readerRoute("webfiction", chapter.storyId))
                },
                onSourceClick = { source ->
                    navController.navigate(PlexRoutes.webFictionBrowseRoute(source.id))
                },
                onRefresh = { viewModel.refresh() },
                onAddByUrl = { /* Show add by URL dialog */ },
                onBrowseSource = { source ->
                    navController.navigate(PlexRoutes.webFictionBrowseRoute(source.id))
                },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // Radio screen
        composable(PlexRoutes.RADIO) {
            val viewModel: PlexRadioViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexRadioScreen(
                state = state,
                onStationClick = { station -> viewModel.playStation(station) },
                onFavoriteToggle = { station -> viewModel.toggleFavorite(station) },
                onCategoryClick = { category -> viewModel.selectCategory(category) },
                onSearchClick = { navController.navigate(PlexRoutes.SEARCH) },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // DETAIL SCREENS
        // =====================================================================
        
        composable(
            route = PlexRoutes.MEDIA_DETAIL,
            arguments = listOf(
                navArgument("mediaType") { type = NavType.StringType },
                navArgument("mediaId") { type = NavType.StringType }
            )
        ) { backStackEntry ->
            val mediaType = backStackEntry.arguments?.getString("mediaType") ?: "book"
            val mediaId = backStackEntry.arguments?.getString("mediaId") ?: ""
            val viewModel: PlexMediaDetailViewModel = hiltViewModel()
            val vmState by viewModel.uiState.collectAsState()
            
            // Create screen state from viewmodel state
            val screenState = MediaDetailState(
                item = MediaDetailItem(
                    id = mediaId,
                    title = vmState.title,
                    description = vmState.description,
                    imageUrl = vmState.imageUrl,
                    mediaType = PlexMediaType.fromRouteName(mediaType)
                ),
                isLoading = vmState.isLoading
            )
            
            PlexMediaDetailScreen(
                state = screenState,
                onBackClick = { navController.popBackStack() },
                onPlayClick = {
                    when (mediaType) {
                        "book", "comic", "document", "webfiction" -> {
                            navController.navigate(PlexRoutes.readerRoute(mediaType, mediaId))
                        }
                        "audiobook" -> {
                            navController.navigate(PlexRoutes.audioPlayerRoute("audiobook"))
                        }
                        "music", "album" -> {
                            navController.navigate(PlexRoutes.audioPlayerRoute("music"))
                        }
                        "podcast", "episode" -> {
                            navController.navigate(PlexRoutes.audioPlayerRoute("podcast"))
                        }
                        "movie", "tv_show", "video" -> {
                            navController.navigate(PlexRoutes.videoPlayerRoute(mediaId))
                        }
                    }
                },
                onChapterClick = { chapter ->
                    // Start reader at specific chapter
                    navController.navigate("${PlexRoutes.readerRoute(mediaType, mediaId)}?chapter=${chapter.id}")
                },
                onRelatedItemClick = { item ->
                    navController.navigate(PlexRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
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
            route = "${PlexRoutes.READER}?chapter={chapter}",
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
            val viewModel: PlexReaderViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            // Handle chapter parameter if provided (expects chapter index as string)
            val chapterParam = backStackEntry.arguments?.getString("chapter")
            LaunchedEffect(chapterParam) {
                chapterParam?.toIntOrNull()?.let { chapterIndex ->
                    viewModel.goToChapter(chapterIndex)
                }
            }
            
            PlexReaderScreen(
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
            route = PlexRoutes.AUDIO_PLAYER,
            arguments = listOf(navArgument("playerType") { type = NavType.StringType })
        ) { backStackEntry ->
            val viewModel: PlexAudioPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexAudioPlayerScreen(
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
            route = PlexRoutes.VIDEO_PLAYER,
            arguments = listOf(navArgument("videoId") { type = NavType.StringType })
        ) { backStackEntry ->
            val viewModel: PlexVideoPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexVideoPlayerScreen(
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
        
        composable(PlexRoutes.OPDS_BROWSER) {
            val viewModel: PlexOPDSViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexOPDSBrowserScreen(
                state = state,
                onCatalogClick = { catalog -> viewModel.openCatalog(catalog) },
                onEntryClick = { entry ->
                    // Either download or show details
                    if (entry.isDownloadable) {
                        viewModel.download(entry)
                    } else {
                        navController.navigate(PlexRoutes.mediaDetailRoute("opds", entry.id))
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
        
        composable(PlexRoutes.AMBIENT_SOUNDS) {
            val viewModel: PlexAmbientViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexAmbientScreen(
                state = state,
                onSoundToggle = { sound -> viewModel.toggleSound(sound) },
                onVolumeChange = { sound, volume -> viewModel.setVolume(sound, volume) },
                onPresetSelect = { preset -> viewModel.applyPreset(preset) },
                onSavePreset = { name -> viewModel.savePreset(name) },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        composable(PlexRoutes.NEWS) {
            val viewModel: PlexNewsViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexNewsScreen(
                state = state,
                onArticleClick = { article ->
                    navController.navigate(PlexRoutes.readerRoute("news", article.id))
                },
                onFeedSelect = { feed -> viewModel.selectFeed(feed) },
                onRefresh = { viewModel.refresh() },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // COLLECTIONS & ORGANIZATION
        // =====================================================================
        
        composable(PlexRoutes.COLLECTIONS) {
            val viewModel: PlexCollectionsViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexCollectionsScreen(
                state = state,
                onCollectionClick = { collection ->
                    navController.navigate(PlexRoutes.collectionDetailRoute(collection.id))
                },
                onCreateCollection = { name -> viewModel.createCollection(name) },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        composable(
            route = PlexRoutes.COLLECTION_DETAIL,
            arguments = listOf(navArgument("collectionId") { type = NavType.StringType })
        ) { backStackEntry ->
            val viewModel: PlexCollectionDetailViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexCollectionDetailScreen(
                state = state,
                onItemClick = { item ->
                    navController.navigate(PlexRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onRemoveItem = { item -> viewModel.removeItem(item) },
                onEditCollection = { /* Show edit dialog */ },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // SYNC & IMPORT/EXPORT
        // =====================================================================
        
        composable(PlexRoutes.SYNC) {
            val viewModel: PlexSyncViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexSyncScreen(
                state = state,
                onSyncNow = { viewModel.syncNow() },
                onConfigureService = { service -> viewModel.configureService(service) },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        composable(PlexRoutes.IMPORT_EXPORT) {
            val viewModel: PlexImportExportViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            PlexImportExportScreen(
                state = state,
                onImport = { type -> viewModel.startImport(type) },
                onExport = { type -> viewModel.startExport(type) },
                onBackClick = { navController.popBackStack() }
            )
        }
        
        // =====================================================================
        // ONBOARDING
        // =====================================================================
        
        composable(PlexRoutes.ONBOARDING) {
            PlexOnboardingScreen(
                onComplete = {
                    navController.navigate(PlexRoutes.HOME) {
                        popUpTo(PlexRoutes.ONBOARDING) { inclusive = true }
                    }
                }
            )
        }
        
        // =====================================================================
        // DEBUG MENU (only available in debug builds)
        // =====================================================================
        
        if (BuildConfig.SHOW_DEBUG_MENU) {
            composable(PlexRoutes.DEBUG_MENU) {
                DebugMenuScreen(
                    onBack = { navController.popBackStack() }
                )
            }
        }
    }
}

// Extension to get route name from PlexMediaType
private val PlexMediaType.routeName: String
    get() = when (this) {
        PlexMediaType.BOOK -> "book"
        PlexMediaType.AUDIOBOOK -> "audiobook"
        PlexMediaType.MUSIC -> "music"
        PlexMediaType.PODCAST -> "podcast"
        PlexMediaType.COMIC -> "comic"
        PlexMediaType.MOVIE -> "movie"
        PlexMediaType.TV_SHOW -> "tv_show"
        PlexMediaType.FANFICTION -> "webfiction"
        PlexMediaType.DOCUMENT -> "document"
        PlexMediaType.RADIO -> "radio"
        PlexMediaType.NEWS -> "news"
        PlexMediaType.UNKNOWN -> "unknown"
    }
