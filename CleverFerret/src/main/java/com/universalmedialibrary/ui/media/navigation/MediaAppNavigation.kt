package com.universalmedialibrary.ui.media.navigation

import android.net.Uri
import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
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
import com.universalmedialibrary.ui.aientertainment.aiEntertainmentNavGraph
import com.universalmedialibrary.ui.components.NavigationItems
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.theme.toCleverFerretTheme

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
    
    // AI Entertainment (SynthChat Integration)
    const val AI_ENTERTAINMENT = "ai-entertainment"
    
    // Enhanced AI Systems
    const val AI_RATE_LIMITS = "ai-rate-limits"
    const val AI_BACKUP_SETTINGS = "ai-backup-settings"
    const val AI_CONTENT_CACHE = "ai-content-cache"
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
    
    // Helper functions for navigation
    fun libraryRoute(mediaType: String) = "library/$mediaType"
    fun mediaDetailRoute(mediaType: String, mediaId: String) = "detail/$mediaType/$mediaId"
    fun readerRoute(mediaType: String, mediaId: String) = "reader/$mediaType/$mediaId"
    fun audioPlayerRoute(playerType: String) = "player/audio/$playerType"
    fun videoPlayerRoute(videoId: String) = "player/video/$videoId"
    fun collectionDetailRoute(collectionId: String) = "collection/$collectionId"
    fun webFictionBrowseRoute(source: String) = "discover/webfiction/${Uri.encode(source)}"
}

private fun sanitizeRouteParamForDisplay(input: String, maxLen: Int = 60): String {
    // Defensive: route params may come from deep links; keep UI strings printable and bounded.
    return input
        .replace(Regex("[\\p{Cc}\\p{Cf}]"), "")
        .take(maxLen)
        .trim()
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
                    navController.navigate(section)
                },
                onSearchClick = { navController.navigate(MediaRoutes.SEARCH) },
                onRetry = { viewModel.refresh() },
                onNotificationClick = { /* TODO: Show notifications */ }
            )
        }

        composable(MediaRoutes.DISCOVER) {
            MediaDiscoverScreen(
                onNavigate = navController::navigate,
                onBackClick = { navController.popBackStack() }
            )
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
        
        composable(MediaRoutes.SETTINGS) {
            com.universalmedialibrary.ui.settings.SettingsScreen(
                onBack = { navController.popBackStack() },
                navController = navController,
                availableBottomItems = NavigationItems.items
            )
        }
        
        // API Settings sub-screen
        composable(MediaRoutes.SETTINGS_API) {
            com.universalmedialibrary.ui.settings.APISettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        // =========================
        // Settings routes (fully operational - no placeholders)
        // =========================

        // Media-centric settings sub-pages (routes used by MediaSettingsScreen)
        composable(MediaRoutes.SETTINGS_APPEARANCE) {
            com.universalmedialibrary.ui.settings.AppearanceSettingsScreen(
                onBack = { navController.popBackStack() },
                navController = navController
            )
        }
        composable("settings/social") {
            com.universalmedialibrary.ui.settings.SocialIntegrationsSettingsScreen(
                onBack = { navController.popBackStack() },
                navController = navController
            )
        }
        composable("settings/metadata") {
            com.universalmedialibrary.ui.settings.MetadataSettingsScreen(
                onBack = { navController.popBackStack() },
                navController = navController
            )
        }
        composable("settings/auto-scan") {
            com.universalmedialibrary.ui.settings.AutoScanSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }
        composable("settings/display") {
            com.universalmedialibrary.ui.settings.DisplaySettingsScreen(
                onBack = { navController.popBackStack() },
                navController = navController
            )
        }
        composable("settings/text-size") {
            // Reuse the existing reader settings page to adjust font sizes and layout.
            com.universalmedialibrary.ui.settings.ReaderSettingsScreen(
                navController = navController,
                settingsType = "visual"
            )
        }
        composable("settings/downloads") {
            com.universalmedialibrary.ui.settings.DownloadsSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }
        composable("settings/cache") {
            com.universalmedialibrary.ui.settings.CacheSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }
        composable("settings/privacy") {
            com.universalmedialibrary.ui.settings.PrivacySettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }
        composable("settings/casting") {
            com.universalmedialibrary.ui.settings.CastingSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }
        composable("settings/feedback") {
            com.universalmedialibrary.ui.settings.FeedbackSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Theme gallery (used by SettingsScreen)
        composable("theme_showcase") {
            val mainViewModel: MainViewModel = hiltViewModel()
            val selectedTheme by mainViewModel.selectedTheme.collectAsState(ThemePalette.NAVY_GOLD)
            val currentUnifiedTheme = selectedTheme.toCleverFerretTheme()

            com.universalmedialibrary.ui.screens.ThemeShowcaseScreen(
                currentTheme = currentUnifiedTheme,
                onThemeSelected = { newTheme ->
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
                onNavigateBack = { navController.popBackStack() }
            )
        }

        // Advanced audio effects showcase (used by AudioEffectsSettingsScreen)
        composable("advanced_effects_showcase") {
            com.universalmedialibrary.ui.screens.AdvancedEffectsShowcaseScreen()
        }

        // Import sorter (used by SettingsScreen)
        composable("settings/import_sorter") {
            com.universalmedialibrary.ui.settings.ImportSorterScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Import history (used by SettingsScreen)
        composable("settings/import_history") {
            com.universalmedialibrary.ui.settings.ImportHistoryScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Import/export (legacy settings route)
        composable("settings/import_export") {
            com.universalmedialibrary.ui.settings.ImportExportScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        // Media servers (used by SettingsScreen)
        composable(MediaRoutes.SETTINGS_MEDIA_SERVERS) {
            com.universalmedialibrary.ui.settings.MediaServerSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Back-compat alias (hyphenated route referenced by older media-centric settings UI)
        composable("settings/media-servers") {
            com.universalmedialibrary.ui.settings.MediaServerSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Network storage / cloud shares (used by SettingsScreen)
        composable("settings/network_storage") {
            com.universalmedialibrary.ui.settings.NetworkStorageSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Back-compat alias for media-centric route
        composable("settings/cloud") {
            com.universalmedialibrary.ui.settings.NetworkStorageSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Audio effects (used by SettingsScreen)
        composable("settings/audio_effects") {
            val vm: com.universalmedialibrary.ui.settings.AudioEffectsViewModel = hiltViewModel()
            com.universalmedialibrary.ui.settings.AudioEffectsSettingsScreen(
                viewModel = vm,
                onNavigateBack = { navController.popBackStack() },
                onNavigateToShowcase = { navController.navigate("advanced_effects_showcase") }
            )
        }

        // Back-compat alias for media-centric route
        composable(MediaRoutes.SETTINGS_PLAYBACK) {
            val vm: com.universalmedialibrary.ui.settings.AudioEffectsViewModel = hiltViewModel()
            com.universalmedialibrary.ui.settings.AudioEffectsSettingsScreen(
                viewModel = vm,
                onNavigateBack = { navController.popBackStack() },
                onNavigateToShowcase = { navController.navigate("advanced_effects_showcase") }
            )
        }

        // Audio profiles (used by SettingsScreen)
        composable("settings/audio_profiles") {
            com.universalmedialibrary.ui.settings.AudioProfilesScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        // Last.fm (used by SettingsScreen)
        composable("settings/lastfm") {
            com.universalmedialibrary.ui.settings.LastFmSettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        // Text-to-speech providers (used by SettingsScreen)
        composable("settings/tts_provider") {
            com.universalmedialibrary.ui.settings.TtsProviderSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Back-compat alias for media-centric route
        composable("settings/tts") {
            com.universalmedialibrary.ui.settings.TtsProviderSettingsScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Parental controls (used by SettingsScreen)
        composable("settings/parental_controls") {
            com.universalmedialibrary.ui.settings.ParentalControlsScreen(
                navController = navController
            )
        }

        // Back-compat alias for media-centric route
        composable("settings/parental") {
            com.universalmedialibrary.ui.settings.ParentalControlsScreen(
                navController = navController
            )
        }

        // Storage organizer (legacy settings route)
        composable("settings/organizer") {
            com.universalmedialibrary.ui.settings.StorageOrganizerScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Back-compat alias for media-centric route
        composable(MediaRoutes.SETTINGS_STORAGE) {
            com.universalmedialibrary.ui.settings.StorageOrganizerScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Reader settings (wire to existing ReaderSettingsScreen section entry)
        composable(MediaRoutes.SETTINGS_READER) {
            com.universalmedialibrary.ui.settings.ReaderSettingsScreen(
                navController = navController,
                settingsType = "visual"
            )
        }

        // Security (wire to operational security settings)
        composable(MediaRoutes.SETTINGS_SECURITY) {
            com.universalmedialibrary.ui.settings.SecuritySettingsScreen(
                navController = navController
            )
        }

        // About
        composable(MediaRoutes.SETTINGS_ABOUT) {
            com.universalmedialibrary.ui.settings.AboutScreen(
                navController = navController
            )
        }

        // Ambient utilities (used by SettingsScreen)
        composable("ambient/theme_manager") {
            com.universalmedialibrary.ui.ambient.ThemeManagerScreen(
                onBack = { navController.popBackStack() }
            )
        }
        composable("ambient/import") {
            com.universalmedialibrary.ui.ambient.AudioPackImportScreen(
                onBack = { navController.popBackStack() }
            )
        }

        // Fanfiction hub (used by SettingsScreen)
        composable("fanfiction_hub") {
            com.universalmedialibrary.ui.webfiction.UnifiedFanfictionHubScreen(
                navController = navController
            )
        }
        
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

        // Malformed/legacy route tolerance: if invoked without a source param, don't crash.
        composable("discover/webfiction") {
            val title = stringResource(R.string.webfiction_browse_title_generic)
            val snackbarMessage = stringResource(
                R.string.webfiction_browse_not_implemented,
                stringResource(R.string.webfiction_browse_source_unknown)
            )

            LaunchedEffect(snackbarMessage) {
                onShowSnackbar(snackbarMessage)
            }

            Scaffold(
                topBar = {
                    TopAppBar(
                        title = { Text(text = title) },
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
        // AI ENTERTAINMENT (SynthChat Integration)
        // =====================================================================
        
        composable(MediaRoutes.AI_ENTERTAINMENT) {
            // Entry point: redirect to AI Entertainment login or characters screen
            com.universalmedialibrary.ui.aientertainment.AIEntertainmentEntryScreen(
                navController = navController
            )
        }
        
        // Include the full AI Entertainment navigation graph
        aiEntertainmentNavGraph(
            navController = navController,
            onShowSnackbar = onShowSnackbar
        )
        
        // Enhanced AI Systems Screens
        composable(MediaRoutes.AI_RATE_LIMITS) {
            com.universalmedialibrary.ui.ai.AIRateLimitControlScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        
        composable(MediaRoutes.AI_BACKUP_SETTINGS) {
            com.universalmedialibrary.ui.ai.AIBackupSettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        
        composable(MediaRoutes.AI_CONTENT_CACHE) {
            com.universalmedialibrary.ui.ai.AIContentCacheScreen(
                onNavigateBack = { navController.popBackStack() }
            )
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
        
        composable("music_player") {
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
        
        composable("podcast_player/{episodeId}") { backStackEntry ->
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
        
        composable("audio_player/{path}") { backStackEntry ->
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
        
        composable("pdf_reader/{path}") { backStackEntry ->
            val path = backStackEntry.arguments?.getString("path") ?: ""
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
                onAddByUrl = { },
                onBrowseSource = { source ->
                    navController.navigate(MediaRoutes.webFictionBrowseRoute(source.id))
                },
                onBackClick = { navController.popBackStack() }
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
            com.universalmedialibrary.ui.filepicker.EnhancedFileBrowser(
                onFileSelected = { file ->
                    onShowSnackbar("Selected: ${file.name}")
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
                    navController.navigate(section)
                },
                onSearchClick = { navController.navigate(MediaRoutes.SEARCH) },
                onRetry = { viewModel.refresh() },
                onNotificationClick = { }
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
