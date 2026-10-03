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

fun NavGraphBuilder.detailRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
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
}
