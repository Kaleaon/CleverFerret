package com.universalmedialibrary.ui.media.navigation

import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInHorizontally
import androidx.compose.animation.slideOutHorizontally
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.navigation.graphs.collectionsOrgRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.debugMenuRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.detailRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.discoveryRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.legacyContentRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.legacyRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.libraryRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.mainSectionRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.onboardingLandseekRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.playerRoutes
import com.universalmedialibrary.ui.media.navigation.graphs.syncImportRoutes

internal val libraryTypeOptions = listOf(
    LibraryMediaTypeOption("book", "Books", MediaType.BOOK),
    LibraryMediaTypeOption("audiobook", "Audiobooks", MediaType.AUDIOBOOK),
    LibraryMediaTypeOption("comic", "Comics", MediaType.COMIC),
    LibraryMediaTypeOption("music", "Music", MediaType.MUSIC),
    LibraryMediaTypeOption("podcast", "Podcasts", MediaType.PODCAST),
    LibraryMediaTypeOption("movie", "Movies", MediaType.MOVIE),
    LibraryMediaTypeOption("tv_show", "TV Shows", MediaType.TV_SHOW),
    LibraryMediaTypeOption("document", "Documents", MediaType.DOCUMENT),
    LibraryMediaTypeOption("webfiction", "Web Fiction", MediaType.FANFICTION),
)

/**
 * Main App Navigation Host. Each domain (library, player, settings, discovery,
 * etc.) owns a NavGraphBuilder extension function under [graphs/].
 */
@Composable
fun MediaAppNavHost(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit,
    modifier: Modifier = Modifier,
) {
    NavHost(
        navController = navController,
        startDestination = MediaRoutes.HOME,
        modifier = modifier,
        enterTransition = { fadeIn() + slideInHorizontally { it / 4 } },
        exitTransition = { fadeOut() + slideOutHorizontally { -it / 4 } },
        popEnterTransition = { fadeIn() + slideInHorizontally { -it / 4 } },
        popExitTransition = { fadeOut() + slideOutHorizontally { it / 4 } },
    ) {
        mainSectionRoutes(navController, onShowSnackbar)
        libraryRoutes(navController, onShowSnackbar)
        detailRoutes(navController, onShowSnackbar)
        playerRoutes(navController, onShowSnackbar)
        discoveryRoutes(navController, onShowSnackbar)
        collectionsOrgRoutes(navController, onShowSnackbar)
        syncImportRoutes(navController, onShowSnackbar)
        onboardingLandseekRoutes(navController, onShowSnackbar)
        legacyRoutes(navController, onShowSnackbar)
        legacyContentRoutes(navController, onShowSnackbar)
        debugMenuRoutes(navController, onShowSnackbar)
    }
}
