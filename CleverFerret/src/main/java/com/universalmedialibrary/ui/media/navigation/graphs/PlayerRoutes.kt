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

fun NavGraphBuilder.playerRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
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
        
        UiErrorBoundary(
            boundaryName = "ReaderBoundary",
            onGoHome = { navController.navigate(MediaRoutes.HOME) },
        ) {
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
    }
    
    composable(
        route = MediaRoutes.AUDIO_PLAYER,
        arguments = listOf(navArgument("playerType") { type = NavType.StringType })
    ) { backStackEntry ->
        val viewModel: AudioPlayerViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        UiErrorBoundary(
            boundaryName = "AudioPlayerBoundary",
            onGoHome = { navController.navigate(MediaRoutes.HOME) },
        ) {
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
    }
    
    composable(
        route = MediaRoutes.VIDEO_PLAYER,
        arguments = listOf(navArgument("videoId") { type = NavType.StringType })
    ) { backStackEntry ->
        val viewModel: VideoPlayerViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        UiErrorBoundary(
            boundaryName = "VideoPlayerBoundary",
            onGoHome = { navController.navigate(MediaRoutes.HOME) },
        ) {
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
    }
    
    // =====================================================================
}
