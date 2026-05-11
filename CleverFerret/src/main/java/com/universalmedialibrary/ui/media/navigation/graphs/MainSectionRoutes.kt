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
import com.universalmedialibrary.ui.media.navigation.NotFoundRouteScreen
import com.universalmedialibrary.ui.media.navigation.resolveRouteOrFallback

fun NavGraphBuilder.mainSectionRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
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
            onCategoryNavigate = { category ->
                val libraryRoute = when (category) {
                    SearchCategory.BOOKS -> MediaRoutes.BOOKS
                    SearchCategory.AUDIOBOOKS -> MediaRoutes.AUDIOBOOKS
                    SearchCategory.COMICS -> MediaRoutes.COMICS
                    SearchCategory.MUSIC -> MediaRoutes.MUSIC
                    SearchCategory.PODCASTS -> MediaRoutes.PODCASTS
                    SearchCategory.MOVIES -> MediaRoutes.MOVIES
                    SearchCategory.TV_SHOWS -> MediaRoutes.TV_SHOWS
                    SearchCategory.WEB_FICTION -> MediaRoutes.WEB_FICTION
                    SearchCategory.DOCUMENTS -> MediaRoutes.DOCUMENTS
                }
                navController.navigate(libraryRoute)
            },
            onVoiceSearch = { /* Implement voice search */ },
            onBackClick = { navController.popBackStack() }
        )
    }

    composable(MediaRoutes.ACTIVITY) {
        ActivityFeedScreen(
            onBackClick = { navController.popBackStack() }
        )
    }

    composable(
        route = MediaRoutes.ROOM_CHAT,
        arguments = listOf(navArgument("roomName") { type = NavType.StringType })
    ) { backStackEntry ->
        val roomName = sanitizeRouteParamForDisplay(
            Uri.decode(backStackEntry.arguments?.getString("roomName").orEmpty())
        ).ifBlank { "Room Chat" }
        RoomChatScreen(
            roomName = roomName,
            onBackClick = { navController.popBackStack() }
        )
    }
    
    addSettingsRoutes(navController)

    // =====================================================================
}
