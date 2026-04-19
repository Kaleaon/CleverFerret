package com.universalmedialibrary.ui.media.navigation

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
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
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
import import kotlinx.coroutines.launch
import com.universalmedialibrary.ui.components.NavigationItems
import com.universalmedialibrary.ui.components.UiErrorBoundary
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.theme.toCleverFerretTheme
import kotlinx.coroutines.launch
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.EPUBReaderScreen
import java.io.File

private val libraryTypeOptions = listOf(
    LibraryMediaTypeOption("book", "Books", MediaType.BOOK),
    LibraryMediaTypeOption("audiobook", "Audiobooks", MediaType.AUDIOBOOK),
    LibraryMediaTypeOption("comic", "Comics", MediaType.COMIC),
    LibraryMediaTypeOption("music", "Music", MediaType.MUSIC),
    LibraryMediaTypeOption("podcast", "Podcasts", MediaType.PODCAST),
    LibraryMediaTypeOption("movie", "Movies", MediaType.MOVIE),
    LibraryMediaTypeOption("tv_show", "TV Shows", MediaType.TV_SHOW),
    LibraryMediaTypeOption("document", "Documents", MediaType.DOCUMENT),
    LibraryMediaTypeOption("webfiction", "Web Fiction", MediaType.FANFICTION)
)

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
    const val LIBRARY_ROOT = "library"
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
    const val SEE_ALL = "home/see-all/{section}"
    
    // Collections & Organization
    const val COLLECTIONS = "collections"
    const val COLLECTION_DETAIL = "collection/{collectionId}"
    const val TAGS = "tags"
    const val TAG_DETAIL = "tag/{tagId}"
    const val TAG_MANAGER = "tag_manager"
    const val TAG_EXPLORER = "tag_explorer"
    const val SMART_COLLECTIONS = "smart_collections"
    const val SMART_COLLECTION_DETAIL = "smart_collection/{ruleId}"
    const val ENHANCED_SEARCH = "enhanced_search?query={query}&tags={tags}&mediaTypes={mediaTypes}"
    const val UNIVERSAL_SEARCH = "universal_search"
    
    // Helper for smart collection detail
    fun smartCollectionDetailRoute(ruleId: Long) = "smart_collection/$ruleId"
    
    // Helper for enhanced search with parameters
    fun enhancedSearchRoute(query: String? = null, tags: String? = null, mediaTypes: String? = null): String {
        val params = mutableListOf<String>()
        query?.let { params.add("query=$it") }
        tags?.let { params.add("tags=$it") }
        mediaTypes?.let { params.add("mediaTypes=$it") }
        return if (params.isEmpty()) "enhanced_search" else "enhanced_search?${params.joinToString("&")}"
    }
    
    // Special features
    const val AMBIENT_SOUNDS = "ambient"
    const val NEWS = "news"
    const val VISUALIZER = "visualizer"
    const val SYNC = "sync"
    const val IMPORT_EXPORT = "import-export"
    const val FOLDER_IMPORT = "folder-import"
    
    // AI Entertainment (SynthChat Integration)
    // Removed

    // Link to Landseek
    const val LANDSEEK = "landseek"
    
    // Enhanced AI Systems
    const val ENHANCED_FILE_BROWSER = "enhanced-file-browser"
    
    // Settings sub-routes
    const val SETTINGS_API = "settings/api"
    const val SETTINGS_APPEARANCE = "settings/appearance"
    const val SETTINGS_PLAYBACK = "settings/playback"
    const val SETTINGS_READER = "settings/reader"
    const val SETTINGS_STORAGE = "settings/storage"
    const val SETTINGS_SECURITY = "settings/security"
    const val SETTINGS_ABOUT = "settings/about"
    // Legacy route compatibility (underscore is the primary route in the legacy settings UI)
    const val SETTINGS_MEDIA_SERVERS = "settings/media_servers"
    const val FILE_BROWSER = "file-browser"
    
    // Onboarding
    const val ONBOARDING = "onboarding"
    
    // Debug (only in debug builds)
    const val DEBUG_MENU = "debug"
    const val NOT_FOUND = "not-found?path={path}"
    
    // Helper functions for navigation
    fun libraryRoute(mediaType: String) = "library/$mediaType"
    fun mediaDetailRoute(mediaType: String, mediaId: String) = "detail/$mediaType/$mediaId"
    fun readerRoute(mediaType: String, mediaId: String) = "reader/$mediaType/$mediaId"
    fun audioPlayerRoute(playerType: String) = "player/audio/$playerType"
    fun videoPlayerRoute(videoId: String) = "player/video/$videoId"
    fun collectionDetailRoute(collectionId: String) = "collection/$collectionId"
    fun webFictionBrowseRoute(source: String) = "discover/webfiction/${Uri.encode(source)}"
    fun seeAllRoute(section: String) = "home/see-all/${Uri.encode(section)}"
    fun notFoundRoute(path: String) = "not-found?path=${Uri.encode(path)}"
}

private fun sanitizeRouteParamForDisplay(input: String, maxLen: Int = 60): String {
    // Defensive: route params may come from deep links; keep UI strings printable and bounded.
    return input
        .replace(Regex("[\\p{Cc}\\p{Cf}]"), "")
        .take(maxLen)
        .trim()
}

private val knownStaticRoutes = setOf(
    MediaRoutes.HOME,
    MediaRoutes.SEARCH,
    MediaRoutes.ACTIVITY,
    MediaRoutes.SETTINGS,
    MediaRoutes.LIBRARY_ROOT,
    MediaRoutes.BOOKS,
    MediaRoutes.AUDIOBOOKS,
    MediaRoutes.MUSIC,
    MediaRoutes.PODCASTS,
    MediaRoutes.COMICS,
    MediaRoutes.MOVIES,
    MediaRoutes.TV_SHOWS,
    MediaRoutes.WEB_FICTION,
    MediaRoutes.RADIO,
    MediaRoutes.DOCUMENTS,
    MediaRoutes.DISCOVER,
    MediaRoutes.OPDS_BROWSER,
    MediaRoutes.PODCAST_DISCOVER,
    MediaRoutes.COLLECTIONS,
    MediaRoutes.TAGS,
    MediaRoutes.TAG_MANAGER,
    MediaRoutes.TAG_EXPLORER,
    MediaRoutes.SMART_COLLECTIONS,
    MediaRoutes.UNIVERSAL_SEARCH,
    MediaRoutes.AMBIENT_SOUNDS,
    MediaRoutes.NEWS,
    MediaRoutes.VISUALIZER,
    MediaRoutes.SYNC,
    MediaRoutes.IMPORT_EXPORT,
    MediaRoutes.FOLDER_IMPORT,
    MediaRoutes.LANDSEEK,
    MediaRoutes.ENHANCED_FILE_BROWSER,
    MediaRoutes.SETTINGS_API,
    MediaRoutes.SETTINGS_APPEARANCE,
    MediaRoutes.SETTINGS_PLAYBACK,
    MediaRoutes.SETTINGS_READER,
    MediaRoutes.SETTINGS_STORAGE,
    MediaRoutes.SETTINGS_SECURITY,
    MediaRoutes.SETTINGS_ABOUT,
    MediaRoutes.SETTINGS_MEDIA_SERVERS,
    MediaRoutes.FILE_BROWSER,
    MediaRoutes.ONBOARDING,
    MediaRoutes.DEBUG_MENU
)

private val knownParameterizedPrefixes = listOf(
    "library/",
    "detail/",
    "reader/",
    "player/",
    "discover/webfiction/",
    "home/see-all/",
    "collection/",
    "tag/",
    "smart_collection/",
    "enhanced_search",
    "not-found"
)

internal fun resolveRouteOrFallback(route: String): String {
    if (route in knownStaticRoutes) return route
    if (knownParameterizedPrefixes.any { route.startsWith(it) }) return route
    return MediaRoutes.notFoundRoute(route)
}

@Composable
private fun NotFoundRouteScreen(
    requestedPath: String,
    onNavigateHome: () -> Unit,
    onNavigateSearch: () -> Unit,
    onNavigateLibrary: () -> Unit,
    onBack: () -> Unit
) {
    val focusRequester = remember { FocusRequester() }
    LaunchedEffect(Unit) { focusRequester.requestFocus() }

    BoxWithConstraints(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        val wideLayout = maxWidth >= 720.dp

        if (wideLayout) {
            Row(
                modifier = Modifier.fillMaxSize(),
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically
            ) {
                NotFoundCardContent(
                    modifier = Modifier.widthIn(max = 800.dp),
                    focusRequester = focusRequester,
                    requestedPath = requestedPath,
                    onNavigateHome = onNavigateHome,
                    onNavigateSearch = onNavigateSearch,
                    onNavigateLibrary = onNavigateLibrary,
                    onBack = onBack
                )
            }
        } else {
            NotFoundCardContent(
                modifier = Modifier.fillMaxSize(),
                focusRequester = focusRequester,
                requestedPath = requestedPath,
                onNavigateHome = onNavigateHome,
                onNavigateSearch = onNavigateSearch,
                onNavigateLibrary = onNavigateLibrary,
                onBack = onBack
            )
        }
    }
}

@Composable
private fun NotFoundCardContent(
    modifier: Modifier,
    focusRequester: FocusRequester,
    requestedPath: String,
    onNavigateHome: () -> Unit,
    onNavigateSearch: () -> Unit,
    onNavigateLibrary: () -> Unit,
    onBack: () -> Unit
) {
    Card(modifier = modifier) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp)
                .verticalScroll(rememberScrollState()),
            verticalArrangement = Arrangement.spacedBy(14.dp)
        ) {
            Text(
                text = "CleverFerret",
                style = MaterialTheme.typography.labelLarge,
                color = MaterialTheme.colorScheme.primary
            )
            Text(
                modifier = Modifier.semantics { heading() },
                text = "We couldn't find that page",
                style = MaterialTheme.typography.headlineSmall
            )
            Text(
                text = "The route \"$requestedPath\" doesn't exist or is no longer available. " +
                    "Use one of the recovery actions below.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                Button(
                    modifier = Modifier.focusRequester(focusRequester),
                    onClick = onNavigateHome
                ) {
                    Icon(Icons.Default.Home, contentDescription = null)
                    Spacer(Modifier.width(8.dp))
                    Text("Go Home")
                }
                OutlinedButton(onClick = onBack) {
                    Icon(Icons.Default.ArrowBack, contentDescription = null)
                    Spacer(Modifier.width(8.dp))
                    Text("Back")
                }
            }
            Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                OutlinedButton(onClick = onNavigateSearch) {
                    Icon(Icons.Default.Search, contentDescription = null)
                    Spacer(Modifier.width(8.dp))
                    Text("Search")
                }
                OutlinedButton(onClick = onNavigateLibrary) {
                    Icon(Icons.Default.MenuBook, contentDescription = null)
                    Spacer(Modifier.width(8.dp))
                    Text("Library")
                }
            }
        }
    }
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
                onNotificationClick = {
                    viewModel.clearLastOpenedCategory()
                    navController.navigate(MediaRoutes.ACTIVITY)
                },
                onAddLocalFilesClick = {
                    viewModel.clearLastOpenedCategory()
                    navController.navigate(MediaRoutes.FOLDER_IMPORT)
                },
                onSubscribePodcastsClick = {
                    viewModel.clearLastOpenedCategory()
                    navController.navigate(MediaRoutes.PODCASTS)
                }
            )
        }

        composable(
            route = MediaRoutes.NOT_FOUND,
            arguments = listOf(
                navArgument("path") {
                    type = NavType.StringType
                    nullable = true
                    defaultValue = ""
                }
            )
        ) { backStackEntry ->
            val rawPath = backStackEntry.arguments?.getString("path").orEmpty()
            val requestedPath = sanitizeRouteParamForDisplay(Uri.decode(rawPath)).ifBlank { "unknown" }

            NotFoundRouteScreen(
                requestedPath = requestedPath,
                onNavigateHome = { navController.navigate(MediaRoutes.HOME) },
                onNavigateSearch = { navController.navigate(MediaRoutes.SEARCH) },
                onNavigateLibrary = { navController.navigate(MediaRoutes.LIBRARY_ROOT) },
                onBack = { navController.popBackStack() }
            )
        }

        composable(MediaRoutes.DISCOVER) {
            UiErrorBoundary(
                boundaryName = "Route:${MediaRoutes.DISCOVER}",
                onGoHome = { navController.navigate(MediaRoutes.HOME) },
            ) {
                MediaDiscoverScreen(
                    onNavigate = navController::navigate,
                    onBackClick = { navController.popBackStack() }
                )
            }
        }
        
        // Alias route: podcast screen "Discover" action
        // The UI navigates to "discover/podcasts" but we can reuse the main Discover screen for now.
        composable(MediaRoutes.PODCAST_DISCOVER) {
            MediaDiscoverScreen(
                onNavigate = navController::navigate,
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
        
        addSettingsRoutes(navController)

        // =====================================================================
        // LIBRARY SCREENS
        // =====================================================================

        composable(MediaRoutes.LIBRARY_ROOT) {
            LaunchedEffect(Unit) {
                navController.navigate(MediaRoutes.BOOKS) {
                    launchSingleTop = true
                }
            }
        }

        composable(
            route = MediaRoutes.SEE_ALL,
            arguments = listOf(navArgument("section") { type = NavType.StringType })
        ) { backStackEntry ->
            val encodedSection = backStackEntry.arguments?.getString("section").orEmpty()
            val sectionContract = HomeSectionRouteContract.fromSection(encodedSection)
            val targetRoute = sectionContract?.let { MediaRoutes.libraryRoute(it.mediaTypeRoute) }
                ?: MediaRoutes.notFoundRoute("home/see-all/${Uri.encode(encodedSection)}")

            LaunchedEffect(targetRoute) {
                navController.navigate(targetRoute) {
                    popUpTo(backStackEntry.destination.route ?: MediaRoutes.HOME) { inclusive = true }
                    launchSingleTop = true
                }
            }
        }


        composable(
            route = MediaRoutes.LIBRARY,
            arguments = listOf(navArgument("mediaType") { type = NavType.StringType })
        ) { backStackEntry ->
            val mediaType = backStackEntry.arguments?.getString("mediaType") ?: "book"
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
            com.universalmedialibrary.ui.webfiction.WebFictionManagerScreen(
                navController = navController
            )
        }
        
        // Radio screen
        composable(MediaRoutes.RADIO) {
            com.universalmedialibrary.ui.radio.RadioScreen(
                onBack = { navController.popBackStack() }
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
            
            UiErrorBoundary(
                boundaryName = "ReaderBoundary",
                onGoHome = { navController.navigate(MediaRoutes.HOME) },
            ) {
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
        }
        
        composable(
            route = MediaRoutes.AUDIO_PLAYER,
            arguments = listOf(navArgument("playerType") { type = NavType.StringType })
        ) { backStackEntry ->
            val viewModel: AudioPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            UiErrorBoundary(
                boundaryName = "AudioPlayerBoundary",
                onGoHome = { navController.navigate(MediaRoutes.HOME) },
            ) {
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
        }
        
        composable(
            route = MediaRoutes.VIDEO_PLAYER,
            arguments = listOf(navArgument("videoId") { type = NavType.StringType })
        ) { backStackEntry ->
            val viewModel: VideoPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            UiErrorBoundary(
                boundaryName = "VideoPlayerBoundary",
                onGoHome = { navController.navigate(MediaRoutes.HOME) },
            ) {
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

        // Legacy compatibility: canonicalize old route without a source segment.
        // Keeps existing deep links/callsites functional while consolidating browse state.
        composable("discover/webfiction") {
            LaunchedEffect(Unit) {
                navController.navigate(MediaRoutes.webFictionBrowseRoute(source = "")) {
                    popUpTo("discover/webfiction") { inclusive = true }
                }
            }
        }

        // Web fiction source browser (safe destination so navigation doesn't crash).
        // This can be upgraded to a real source directory UI later.
        composable(
            route = MediaRoutes.WEB_FICTION_BROWSE,
            arguments = listOf(
                navArgument("source") {
                    type = NavType.StringType
                    nullable = true
                    defaultValue = ""
                }
            )
        ) { backStackEntry ->
            val source = backStackEntry.arguments?.getString("source").orEmpty()
            val decodedSource = remember(source) { Uri.decode(source) }
            val displaySource = sanitizeRouteParamForDisplay(decodedSource)
                .ifBlank { stringResource(R.string.webfiction_browse_source_unknown) }
            val snackbarMessage = stringResource(R.string.webfiction_browse_not_implemented, displaySource)

            LaunchedEffect(snackbarMessage) {
                onShowSnackbar(snackbarMessage)
            }

            Scaffold(
                topBar = {
                    TopAppBar(
                        title = {
                            Text(
                                text = if (source.isBlank()) {
                                    stringResource(R.string.webfiction_browse_title_generic)
                                } else {
                                    stringResource(R.string.webfiction_browse_title, displaySource)
                                }
                            )
                        },
                        navigationIcon = {
                            IconButton(onClick = { navController.popBackStack() }) {
                                Icon(
                                    Icons.Default.ArrowBack,
                                    contentDescription = stringResource(R.string.navigation_back)
                                )
                            }
                        }
                    )
                }
            ) { padding ->
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(padding)
                        .padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp),
                    horizontalAlignment = Alignment.Start
                ) {
                    Text(
                        text = stringResource(R.string.webfiction_browse_coming_soon),
                        style = MaterialTheme.typography.titleMedium
                    )
                    Text(
                        text = stringResource(R.string.webfiction_browse_add_by_url_hint),
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                        Button(onClick = { navController.popBackStack() }) {
                            Text(stringResource(R.string.navigation_back))
                        }
                        OutlinedButton(onClick = { navController.navigate(MediaRoutes.WEB_FICTION) }) {
                            Text(stringResource(R.string.webfiction_browse_go_to_web_fiction))
                        }
                    }
                }
            }
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
            com.universalmedialibrary.ui.news.NewsScreen(
                onNavigateBack = { navController.popBackStack() },
                onOpenEpub = { path ->
                    navController.navigate("epub_reader/${Uri.encode(path)}")
                }
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
        
        // Tag Manager - Full tag management with hierarchies and categories
        composable(MediaRoutes.TAG_MANAGER) {
            com.universalmedialibrary.ui.tags.UniversalTagManagerScreen(
                navController = navController
            )
        }
        
        // Tag Explorer - Browse and filter by tags
        composable(MediaRoutes.TAG_EXPLORER) {
            com.universalmedialibrary.ui.tags.UniversalTagExplorerScreen(
                navController = navController
            )
        }
        
        // Smart Collections - Auto-suggested playlists, series, and collections
        composable(MediaRoutes.SMART_COLLECTIONS) {
            com.universalmedialibrary.ui.collections.SmartCollectionsScreen(
                navController = navController
            )
        }
        
        // Smart Collection Detail
        composable(
            route = MediaRoutes.SMART_COLLECTION_DETAIL,
            arguments = listOf(navArgument("ruleId") { type = NavType.LongType })
        ) { backStackEntry ->
            val ruleId = backStackEntry.arguments?.getLong("ruleId") ?: 0L
            // Would create a SmartCollectionDetailScreen to show items in the smart collection
            // For now, navigate back
            LaunchedEffect(Unit) {
                navController.popBackStack()
            }
        }
        
        // Enhanced Search with filters
        composable(
            route = MediaRoutes.ENHANCED_SEARCH,
            arguments = listOf(
                navArgument("query") { 
                    type = NavType.StringType
                    nullable = true
                    defaultValue = null
                },
                navArgument("tags") {
                    type = NavType.StringType
                    nullable = true
                    defaultValue = null
                },
                navArgument("mediaTypes") {
                    type = NavType.StringType
                    nullable = true
                    defaultValue = null
                }
            )
        ) {
            com.universalmedialibrary.ui.search.EnhancedSearchScreen(
                navController = navController
            )
        }
        
        // Universal Search - Search across formats, tags, and media
        composable(MediaRoutes.UNIVERSAL_SEARCH) {
            com.universalmedialibrary.ui.search.UniversalSearchScreen(
                navController = navController
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
        
        // Enhanced Folder Import Screen with metadata fetching
        composable(MediaRoutes.FOLDER_IMPORT) {
            com.universalmedialibrary.ui.folderimport.FolderImportScreen(
                onBack = { navController.popBackStack() },
                onImportComplete = { 
                    navController.popBackStack()
                    onShowSnackbar("Import complete!")
                }
            )
        }

        composable(MediaRoutes.FILE_BROWSER) {
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
                                "BOOK" -> {
                                    // Open book reader directly
                                    val encodedUri = java.net.URLEncoder.encode(uri.toString(), "UTF-8")
                                    val encodedName = java.net.URLEncoder.encode(file.name, "UTF-8")
                                    navController.navigate("document-reader/$encodedUri/$encodedName")
                                }
                                "COMIC" -> {
                                    val encodedUri = java.net.URLEncoder.encode(uri.toString(), "UTF-8")
                                    val encodedName = java.net.URLEncoder.encode(file.name, "UTF-8")
                                    navController.navigate("document-reader/$encodedUri/$encodedName")
                                }
                                "MUSIC", "VIDEO" -> {
                                    onShowSnackbar("Added ${file.name} to library")
                                }
                                else -> {
                                    val encodedUri = java.net.URLEncoder.encode(uri.toString(), "UTF-8")
                                    val encodedName = java.net.URLEncoder.encode(file.name, "UTF-8")
                                    navController.navigate("document-reader/$encodedUri/$encodedName")
                                }
                            }
                        } catch (e: Exception) {
                            onShowSnackbar("Error importing file: ${e.message}")
                        }
                    }
                },
                onFolderSelected = { folder ->
                    // Navigate to enhanced folder import for bulk import
                    navController.navigate(MediaRoutes.FOLDER_IMPORT)
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
        // WORK WITH LANDSEEK
        // =====================================================================

        composable(MediaRoutes.LANDSEEK) {
            val context = LocalContext.current
            LaunchedEffect(Unit) {
                try {
                    val intent = android.content.Intent(android.content.Intent.ACTION_VIEW, Uri.parse("https://GitHub.com/Kaleaon/Landseek"))
                    context.startActivity(intent)
                } catch (e: Exception) {
                    onShowSnackbar("Could not open link")
                }
                navController.popBackStack()
            }
        }
        
        composable(MediaRoutes.ENHANCED_FILE_BROWSER) {
            com.universalmedialibrary.ui.filepicker.EnhancedStorageBrowserScreen(
                onNavigateBack = { navController.popBackStack() },
                onFilesSelected = { files -> 
                    // Handle file selection/import
                    navController.popBackStack()
                },
                onFoldersSelected = { folders ->
                    // Handle folder selection/import  
                    navController.popBackStack()
                }
            )
        }
        
        // =====================================================================
        // LEGACY ROUTE COMPATIBILITY
        // These routes provide backwards compatibility for screens that use
        // legacy navigation patterns. They redirect to the proper media-centric routes.
        // =====================================================================
        
        // Legacy player routes
        composable("video_player/{videoId}") { backStackEntry ->
            val videoId = backStackEntry.arguments?.getString("videoId") ?: ""
            val viewModel: VideoPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            UiErrorBoundary(
                boundaryName = "VideoPlayerBoundary",
                onGoHome = { navController.navigate(MediaRoutes.HOME) },
            ) {
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
        }
        
        composable("music_player") {
            val viewModel: AudioPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            UiErrorBoundary(
                boundaryName = "AudioPlayerBoundary",
                onGoHome = { navController.navigate(MediaRoutes.HOME) },
            ) {
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
        }
        
        composable("podcast_player/{episodeId}") { backStackEntry ->
            val viewModel: AudioPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            UiErrorBoundary(
                boundaryName = "AudioPlayerBoundary",
                onGoHome = { navController.navigate(MediaRoutes.HOME) },
            ) {
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
        }
        
        composable("audio_player/{path}") { backStackEntry ->
            val viewModel: AudioPlayerViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            UiErrorBoundary(
                boundaryName = "AudioPlayerBoundary",
                onGoHome = { navController.navigate(MediaRoutes.HOME) },
            ) {
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
        }
        
        // Legacy detail routes
        composable("podcast_detail/{podcastId}") { backStackEntry ->
            val podcastId = backStackEntry.arguments?.getString("podcastId") ?: ""
            val viewModel: MediaDetailViewModel = hiltViewModel()
            val vmState by viewModel.uiState.collectAsState()
            
            val screenState = MediaDetailState(
                item = MediaDetailItem(
                    id = podcastId,
                    title = vmState.title,
                    description = vmState.description,
                    imageUrl = vmState.imageUrl,
                    mediaType = MediaType.PODCAST
                ),
                isLoading = vmState.isLoading
            )
            
            MediaDetailScreen(
                state = screenState,
                onBackClick = { navController.popBackStack() },
                onPlayClick = { navController.navigate(MediaRoutes.audioPlayerRoute("podcast")) },
                onChapterClick = { },
                onRelatedItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onAddToCollectionClick = { },
                onShareClick = { },
                onDownloadClick = { viewModel.download() }
            )
        }
        
        composable("book_details/{bookId}") { backStackEntry ->
            val bookId = backStackEntry.arguments?.getString("bookId") ?: ""
            val viewModel: MediaDetailViewModel = hiltViewModel()
            val vmState by viewModel.uiState.collectAsState()
            
            val screenState = MediaDetailState(
                item = MediaDetailItem(
                    id = bookId,
                    title = vmState.title,
                    description = vmState.description,
                    imageUrl = vmState.imageUrl,
                    mediaType = MediaType.BOOK
                ),
                isLoading = vmState.isLoading
            )
            
            MediaDetailScreen(
                state = screenState,
                onBackClick = { navController.popBackStack() },
                onPlayClick = { navController.navigate(MediaRoutes.readerRoute("book", bookId)) },
                onChapterClick = { },
                onRelatedItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onAddToCollectionClick = { },
                onShareClick = { },
                onDownloadClick = { viewModel.download() }
            )
        }
        
        composable("album/{albumId}") { backStackEntry ->
            val albumId = backStackEntry.arguments?.getString("albumId") ?: ""
            val viewModel: MediaDetailViewModel = hiltViewModel()
            val vmState by viewModel.uiState.collectAsState()
            
            val screenState = MediaDetailState(
                item = MediaDetailItem(
                    id = albumId,
                    title = vmState.title,
                    description = vmState.description,
                    imageUrl = vmState.imageUrl,
                    mediaType = MediaType.MUSIC
                ),
                isLoading = vmState.isLoading
            )
            
            MediaDetailScreen(
                state = screenState,
                onBackClick = { navController.popBackStack() },
                onPlayClick = { navController.navigate(MediaRoutes.audioPlayerRoute("music")) },
                onChapterClick = { },
                onRelatedItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onAddToCollectionClick = { },
                onShareClick = { },
                onDownloadClick = { viewModel.download() }
            )
        }
        
        composable("artist/{artistId}") { backStackEntry ->
            val artistId = backStackEntry.arguments?.getString("artistId") ?: ""
            val viewModel: MediaDetailViewModel = hiltViewModel()
            val vmState by viewModel.uiState.collectAsState()
            
            val screenState = MediaDetailState(
                item = MediaDetailItem(
                    id = artistId,
                    title = vmState.title,
                    description = vmState.description,
                    imageUrl = vmState.imageUrl,
                    mediaType = MediaType.MUSIC
                ),
                isLoading = vmState.isLoading
            )
            
            MediaDetailScreen(
                state = screenState,
                onBackClick = { navController.popBackStack() },
                onPlayClick = { navController.navigate(MediaRoutes.audioPlayerRoute("music")) },
                onChapterClick = { },
                onRelatedItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
                },
                onAddToCollectionClick = { },
                onShareClick = { },
                onDownloadClick = { viewModel.download() }
            )
        }
        
        composable("genre/{genreId}") { backStackEntry ->
            val genreId = backStackEntry.arguments?.getString("genreId") ?: ""
            val viewModel: MediaLibraryViewModel = hiltViewModel()
            val state by viewModel.uiState.collectAsState()
            
            MediaLibraryScreen(
                state = state,
                onItemClick = { item ->
                    navController.navigate(MediaRoutes.mediaDetailRoute("music", item.id))
                },
                onBackClick = { navController.popBackStack() },
                onSearchClick = { navController.navigate(MediaRoutes.SEARCH) },
                onFilterChange = { viewModel.setFilter(it) },
                onSortChange = { viewModel.setSort(it) },
                onViewModeChange = { viewModel.setViewMode(it) },
                onRefresh = { viewModel.refresh() }
            )
        }
        
        // Legacy reader routes
        composable("reader/{mediaId}") { backStackEntry ->
            val mediaId = backStackEntry.arguments?.getString("mediaId") ?: ""
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
        
        composable("epub_reader/{path}") { backStackEntry ->
            val path = backStackEntry.arguments?.getString("path") ?: ""
            EPUBReaderScreen(
                navController = navController,
                bookUri = path
            )
        }
        
        composable("pdf_reader/{path}") { backStackEntry ->
            val path = backStackEntry.arguments?.getString("path") ?: ""
            val decodedPath = remember(path) { Uri.decode(path) }
            val fileName = remember(decodedPath) { File(decodedPath).name }

            DocumentReaderScreen(
                uriString = decodedPath,
                fileName = fileName,
                onBack = { navController.popBackStack() }
            )
        }
        
        composable("ereader/{mediaId}") { backStackEntry ->
            val mediaId = backStackEntry.arguments?.getString("mediaId") ?: ""
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
        
        composable("audioplayer/{mediaId}") { backStackEntry ->
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
                onSleepTimer = { },
                onQueueOpen = { },
                onChaptersOpen = { },
                onCastClick = { },
                onClose = { navController.popBackStack() }
            )
        }
        
        composable("videoplayer/{mediaId}") { backStackEntry ->
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
                onCastClick = { },
                onPipClick = { },
                onClose = { navController.popBackStack() }
            )
        }
        
        composable("musicplayer/{mediaId}") { backStackEntry ->
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
                onSleepTimer = { },
                onQueueOpen = { },
                onChaptersOpen = { },
                onCastClick = { },
                onClose = { navController.popBackStack() }
            )
        }
        
        composable("podcastplayer/{mediaId}") { backStackEntry ->
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
                onSleepTimer = { },
                onQueueOpen = { },
                onChaptersOpen = { },
                onCastClick = { },
                onClose = { navController.popBackStack() }
            )
        }
        
        composable("magazinereader/{mediaId}") { backStackEntry ->
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
        
        composable("documentviewer/{mediaId}") { backStackEntry ->
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
        
        // Legacy browse/manager routes
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
