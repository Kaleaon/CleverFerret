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
fun NavGraphBuilder.legacyRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
    // =====================================================================
    
    // Legacy player routes
    composable("video_player/{videoId}") { backStackEntry ->
        val videoId = backStackEntry.arguments?.getString("videoId") ?: ""
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
    
    composable("music_player") {
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
    
    composable("podcast_player/{episodeId}") { backStackEntry ->
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
    
    composable("audio_player/{path}") { backStackEntry ->
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
    
    // Legacy detail routes
    composable("podcast_detail/{podcastId}") { backStackEntry ->
        val podcastId = backStackEntry.arguments?.getString("podcastId") ?: ""
        val viewModel: MediaDetailViewModel = hiltViewModel()
        val vmState by viewModel.uiState.collectAsState()
        
        val screenState = MediaDetailState(
            item = MediaDetailItem(
                id = podcastId,
                title = vmState.title,
                description = vmState.description,
                imageUrl = vmState.imageUrl,
                mediaType = MediaType.PODCAST
            ),
            isLoading = vmState.isLoading
        )
        
        MediaDetailScreen(
            state = screenState,
            onBackClick = { navController.popBackStack() },
            onPlayClick = { navController.navigate(MediaRoutes.audioPlayerRoute("podcast")) },
            onChapterClick = { },
            onRelatedItemClick = { item ->
                navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
            },
            onAddToCollectionClick = { },
            onShareClick = { },
            onDownloadClick = { viewModel.download() }
        )
    }
    
    composable("book_details/{bookId}") { backStackEntry ->
        val bookId = backStackEntry.arguments?.getString("bookId") ?: ""
        val viewModel: MediaDetailViewModel = hiltViewModel()
        val vmState by viewModel.uiState.collectAsState()
        
        val screenState = MediaDetailState(
            item = MediaDetailItem(
                id = bookId,
                title = vmState.title,
                description = vmState.description,
                imageUrl = vmState.imageUrl,
                mediaType = MediaType.BOOK
            ),
            isLoading = vmState.isLoading
        )
        
        MediaDetailScreen(
            state = screenState,
            onBackClick = { navController.popBackStack() },
            onPlayClick = { navController.navigate(MediaRoutes.readerRoute("book", bookId)) },
            onChapterClick = { },
            onRelatedItemClick = { item ->
                navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
            },
            onAddToCollectionClick = { },
            onShareClick = { },
            onDownloadClick = { viewModel.download() }
        )
    }
    
    composable("album/{albumId}") { backStackEntry ->
        val albumId = backStackEntry.arguments?.getString("albumId") ?: ""
        val viewModel: MediaDetailViewModel = hiltViewModel()
        val vmState by viewModel.uiState.collectAsState()
        
        val screenState = MediaDetailState(
            item = MediaDetailItem(
                id = albumId,
                title = vmState.title,
                description = vmState.description,
                imageUrl = vmState.imageUrl,
                mediaType = MediaType.MUSIC
            ),
            isLoading = vmState.isLoading
        )
        
        MediaDetailScreen(
            state = screenState,
            onBackClick = { navController.popBackStack() },
            onPlayClick = { navController.navigate(MediaRoutes.audioPlayerRoute("music")) },
            onChapterClick = { },
            onRelatedItemClick = { item ->
                navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
            },
            onAddToCollectionClick = { },
            onShareClick = { },
            onDownloadClick = { viewModel.download() }
        )
    }
    
    composable("artist/{artistId}") { backStackEntry ->
        val artistId = backStackEntry.arguments?.getString("artistId") ?: ""
        val viewModel: MediaDetailViewModel = hiltViewModel()
        val vmState by viewModel.uiState.collectAsState()
        
        val screenState = MediaDetailState(
            item = MediaDetailItem(
                id = artistId,
                title = vmState.title,
                description = vmState.description,
                imageUrl = vmState.imageUrl,
                mediaType = MediaType.MUSIC
            ),
            isLoading = vmState.isLoading
        )
        
        MediaDetailScreen(
            state = screenState,
            onBackClick = { navController.popBackStack() },
            onPlayClick = { navController.navigate(MediaRoutes.audioPlayerRoute("music")) },
            onChapterClick = { },
            onRelatedItemClick = { item ->
                navController.navigate(MediaRoutes.mediaDetailRoute(item.mediaType.routeName, item.id))
            },
            onAddToCollectionClick = { },
            onShareClick = { },
            onDownloadClick = { viewModel.download() }
        )
    }
    
    composable("genre/{genreId}") { backStackEntry ->
        val genreId = backStackEntry.arguments?.getString("genreId") ?: ""
        val viewModel: MediaLibraryViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaLibraryScreen(
            state = state,
            onItemClick = { item ->
                navController.navigate(MediaRoutes.mediaDetailRoute("music", item.id))
            },
            onBackClick = { navController.popBackStack() },
            onSearchClick = { navController.navigate(MediaRoutes.SEARCH) },
            onFilterChange = { viewModel.setFilter(it) },
            onSortChange = { viewModel.setSort(it) },
            onViewModeChange = { viewModel.setViewMode(it) },
            onRefresh = { viewModel.refresh() }
        )
    }
    
    // Legacy reader routes
    composable("reader/{mediaId}") { backStackEntry ->
        val mediaId = backStackEntry.arguments?.getString("mediaId") ?: ""
        val viewModel: ReaderViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaReaderScreen(
            state = state,
            onPageChange = { viewModel.goToPage(it) },
            onChapterChange = { viewModel.goToChapter(it) },
            onBookmarkToggle = { viewModel.toggleBookmark() },
            onTocOpen = { },
            onSettingsOpen = { },
            onSearch = { },
            onClose = { navController.popBackStack() },
            onTextSelect = { text, start, end -> viewModel.selectText(text, start, end) },
            onTtsToggle = { viewModel.toggleTts() }
        )
    }
    
    composable("epub_reader/{path}") { backStackEntry ->
        val path = backStackEntry.arguments?.getString("path") ?: ""
        EPUBReaderScreen(
            navController = navController,
            bookUri = path
        )
    }
    
    composable("pdf_reader/{path}") { backStackEntry ->
        val path = backStackEntry.arguments?.getString("path") ?: ""
        val decodedPath = remember(path) { Uri.decode(path) }
        val fileName = remember(decodedPath) { File(decodedPath).name }

        DocumentReaderScreen(
            uriString = decodedPath,
            fileName = fileName,
            onBack = { navController.popBackStack() }
        )
    }
    
    composable("ereader/{mediaId}") { backStackEntry ->
        val mediaId = backStackEntry.arguments?.getString("mediaId") ?: ""
        val viewModel: ReaderViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaReaderScreen(
            state = state,
            onPageChange = { viewModel.goToPage(it) },
            onChapterChange = { viewModel.goToChapter(it) },
            onBookmarkToggle = { viewModel.toggleBookmark() },
            onTocOpen = { },
            onSettingsOpen = { },
            onSearch = { },
            onClose = { navController.popBackStack() },
            onTextSelect = { text, start, end -> viewModel.selectText(text, start, end) },
            onTtsToggle = { viewModel.toggleTts() }
        )
    }
    
    composable("audioplayer/{mediaId}") { backStackEntry ->
        val viewModel: AudioPlayerViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
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
            onSleepTimer = { },
            onQueueOpen = { },
            onChaptersOpen = { },
            onCastClick = { },
            onClose = { navController.popBackStack() }
        )
    }
    
    composable("videoplayer/{mediaId}") { backStackEntry ->
        val viewModel: VideoPlayerViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
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
            onCastClick = { },
            onPipClick = { },
            onClose = { navController.popBackStack() }
        )
    }
    
    composable("musicplayer/{mediaId}") { backStackEntry ->
        val viewModel: AudioPlayerViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
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
            onSleepTimer = { },
            onQueueOpen = { },
            onChaptersOpen = { },
            onCastClick = { },
            onClose = { navController.popBackStack() }
        )
    }
    
    composable("podcastplayer/{mediaId}") { backStackEntry ->
        val viewModel: AudioPlayerViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
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
            onSleepTimer = { },
            onQueueOpen = { },
            onChaptersOpen = { },
            onCastClick = { },
            onClose = { navController.popBackStack() }
        )
    }
    
    composable("magazinereader/{mediaId}") { backStackEntry ->
        val viewModel: ReaderViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaReaderScreen(
            state = state,
            onPageChange = { viewModel.goToPage(it) },
            onChapterChange = { viewModel.goToChapter(it) },
            onBookmarkToggle = { viewModel.toggleBookmark() },
            onTocOpen = { },
            onSettingsOpen = { },
            onSearch = { },
            onClose = { navController.popBackStack() },
            onTextSelect = { text, start, end -> viewModel.selectText(text, start, end) },
            onTtsToggle = { viewModel.toggleTts() }
        )
    }
    
    composable("documentviewer/{mediaId}") { backStackEntry ->
        val viewModel: ReaderViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaReaderScreen(
            state = state,
            onPageChange = { viewModel.goToPage(it) },
            onChapterChange = { viewModel.goToChapter(it) },
            onBookmarkToggle = { viewModel.toggleBookmark() },
            onTocOpen = { },
            onSettingsOpen = { },
            onSearch = { },
            onClose = { navController.popBackStack() },
            onTextSelect = { text, start, end -> viewModel.selectText(text, start, end) },
            onTtsToggle = { viewModel.toggleTts() }
        )
    }
    
    // Legacy browse/manager routes
}
