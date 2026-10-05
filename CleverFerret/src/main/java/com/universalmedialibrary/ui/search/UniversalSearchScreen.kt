package com.universalmedialibrary.ui.search

import androidx.compose.runtime.Composable
import androidx.navigation.NavController
import com.universalmedialibrary.ui.media.screens.UniversalSearchAndDiscoveryScreen

/**
 * Universal search screen entry point delegating to UniversalSearchAndDiscoveryScreen
 */
@Composable
fun UniversalSearchScreen(
    navController: NavController? = null
) {
    UniversalSearchAndDiscoveryScreen(navController = navController)
}

