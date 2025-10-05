package com.universalmedialibrary.ui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.ui.library.ImprovedLibraryListScreen
import com.universalmedialibrary.ui.library.LibraryManagementViewModel

/**
 * Main navigation component for the application.
 *
 * This composable sets up the navigation graph and handles routing between different screens.
 * It uses the Navigation Compose library for type-safe navigation.
 */
@Composable
fun AppNavigation() {
    val navController = rememberNavController()

    NavHost(
        navController = navController,
        startDestination = "library_list",
    ) {
        composable("library_list") {
            ImprovedLibraryListScreen(navController = navController)
        }

        composable("library_details/{libraryId}") { backStackEntry ->
            val libraryId = backStackEntry.arguments?.getString("libraryId")?.toLongOrNull()
            if (libraryId != null) {
                // TODO: Create LibraryDetailsScreen
                // LibraryDetailsScreen(libraryId = libraryId, navController = navController)
            }
        }
    }
}