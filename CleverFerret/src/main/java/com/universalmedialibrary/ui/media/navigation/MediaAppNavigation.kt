package com.universalmedialibrary.ui.media.navigation

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.screens.LibraryMediaTypeOption
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
import com.universalmedialibrary.ui.media.navigation.graphs.*

@Composable
fun MediaAppNavHost(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit,
    startDestination: String = MediaRoutes.HOME,
    modifier: Modifier = Modifier
) {
    NavHost(
        navController = navController,
        startDestination = startDestination,
        modifier = modifier
    ) {
        mainSectionRoutes(navController, onShowSnackbar)
        discoveryRoutes(navController, onShowSnackbar)
        libraryRoutes(navController, onShowSnackbar)
        playerRoutes(navController, onShowSnackbar)
        detailRoutes(navController, onShowSnackbar)
        collectionsOrgRoutes(navController, onShowSnackbar)
        syncImportRoutes(navController, onShowSnackbar)
        onboardingLandseekRoutes(navController, onShowSnackbar)
        debugMenuRoutes(navController, onShowSnackbar)
        legacyRoutes(navController, onShowSnackbar)
        legacyContentRoutes(navController, onShowSnackbar)
    }
}
