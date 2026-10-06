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

fun NavGraphBuilder.collectionsOrgRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
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
    
    // Tag Explorer - redirected to Unified Discovery Screen
    composable(MediaRoutes.TAG_EXPLORER) {
        LaunchedEffect(Unit) {
            navController.navigate(MediaRoutes.discoveryRoute(type = "TAGS")) {
                popUpTo(MediaRoutes.TAG_EXPLORER) { inclusive = true }
            }
        }
    }
    
    // Legacy route: TAGS
    composable(MediaRoutes.TAGS) {
        LaunchedEffect(Unit) {
            navController.navigate(MediaRoutes.discoveryRoute(type = "TAGS")) {
                popUpTo(MediaRoutes.TAGS) { inclusive = true }
            }
        }
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
        // For now, navigate back
        LaunchedEffect(Unit) {
            navController.popBackStack()
        }
    }
    
    // Enhanced Search - redirected to Unified Discovery Screen with preserved query arguments
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
    ) { backStackEntry ->
        val query = backStackEntry.arguments?.getString("query")
        val tags = backStackEntry.arguments?.getString("tags")
        val mediaTypes = backStackEntry.arguments?.getString("mediaTypes")
        
        LaunchedEffect(query, tags, mediaTypes) {
            navController.navigate(MediaRoutes.discoveryRoute(query = query, tags = tags, type = mediaTypes)) {
                popUpTo(MediaRoutes.ENHANCED_SEARCH) { inclusive = true }
            }
        }
    }
    
    // Universal Search - redirected to Unified Discovery Screen
    composable(MediaRoutes.UNIVERSAL_SEARCH) {
        LaunchedEffect(Unit) {
            navController.navigate(MediaRoutes.discoveryRoute()) {
                popUpTo(MediaRoutes.UNIVERSAL_SEARCH) { inclusive = true }
            }
        }
    }
    
    // =====================================================================
}
