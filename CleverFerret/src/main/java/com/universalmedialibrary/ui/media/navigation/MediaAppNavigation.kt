package com.universalmedialibrary.ui.media.navigation

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
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
