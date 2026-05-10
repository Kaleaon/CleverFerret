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

fun NavGraphBuilder.libraryRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
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
}
