package com.universalmedialibrary.ui.media

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.interaction.collectIsHoveredAsState
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.PermissionDialog
import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.media.components.MediaMiniPlayer
import com.universalmedialibrary.ui.media.navigation.*
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.components.UiErrorBoundary
import com.universalmedialibrary.ui.media.theme.MediaColors
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.modern.theme.CFLayoutTheme
import com.universalmedialibrary.utils.rememberPermissionsHandler
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Main Activity for Clean media-centric CleverFerret
 * 
 * Entry point for the redesigned app with:
 * - Edge-to-edge display
 * - Responsive navigation (sidebar on tablets, bottom nav on phones)
 * - Global mini-player
 * - Material 3 theming with media app colors
 */
@AndroidEntryPoint
class MediaMainActivity : ComponentActivity() {
    
    @Inject
    lateinit var playbackStateManager: PlaybackStateManager
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        
        setContent {
            MediaAppRoot(playbackStateManager = playbackStateManager)
        }
    }
}

@Composable
private fun MediaAppRoot(
    playbackStateManager: PlaybackStateManager
) {
    val mainViewModel: MainViewModel = hiltViewModel()
    val palette by mainViewModel.selectedTheme.collectAsStateWithLifecycle(CleverFerretTheme.NAVY_GOLD)
    val layout by mainViewModel.selectedLayout.collectAsStateWithLifecycle()
    val darkMode by mainViewModel.darkMode.collectAsStateWithLifecycle(true)

    CleverFerretTheme(
        palette = palette,
        darkTheme = darkMode
    ) {
        CFLayoutTheme(layout) {
        // Bridge media-centric design tokens to the app-wide theme palette.
        MediaColors.SyncWithMaterialTheme()

        UiErrorBoundary(
            boundaryName = "AppRoot"
        ) {
            MediaMainScreen(
                playbackStateManager = playbackStateManager,
                mainViewModel = mainViewModel
            )
        }
    }
    }
}

@Composable
fun MediaMainScreen(
    playbackStateManager: PlaybackStateManager,
    mainViewModel: MainViewModel = hiltViewModel()
) {
    val preferences by mainViewModel.bottomBarPreferences.collectAsStateWithLifecycle(BottomBarPreferences.Default)
    val gear by mainViewModel.bottomGearPosition.collectAsStateWithLifecycle(BottomGearPosition.RIGHT)
    val onboarded by mainViewModel.hasCompletedOnboarding.collectAsStateWithLifecycle()
    val start = if (onboarded) MediaRoutes.HOME else MediaRoutes.ONBOARDING
    val navController = rememberNavController()
    val entry by navController.currentBackStackEntryAsState()
    val route = entry?.destination?.route
    val routeForNavigation = if (route == MediaRoutes.LIBRARY) {
        entry?.arguments?.getString("mediaType")?.takeIf { it.isNotBlank() }?.let { MediaRoutes.libraryRoute(it) } ?: route
    } else route
    val navigation = CFMediaNavigationState(routeForNavigation ?: start, shouldShowNavigation(route), preferences, gear)
    val playback by playbackStateManager.currentPlayback.collectAsStateWithLifecycle()
    val snackbar = remember { SnackbarHostState() }
    CFMediaScaffold(
        navigation = navigation,
        onNavigate = { navController.navigate(resolveRouteOrFallback(it)) },
        player = { MediaPlaybackDock(playback, route, playbackStateManager, navController) },
        feedback = { SnackbarHost(snackbar) },
        content = { MediaNavigationContent(navController, start, snackbar) }
    )
}

internal fun shouldShowNavigation(route: String?): Boolean = route != null &&
    route != MediaRoutes.ONBOARDING && !route.startsWith("player/") && !route.startsWith("reader/")

@Composable
private fun MediaPlaybackDock(
    state: MiniPlayerState?, route: String?, manager: PlaybackStateManager,
    navController: androidx.navigation.NavHostController
) {
    if (state != null && route != MediaRoutes.ONBOARDING && !route.orEmpty().startsWith("player/")) {
        MediaMiniPlayer(state = state,
            onTap = { navController.navigate(MediaRoutes.audioPlayerRoute(audioDockType(state.playerType))) },
            onPlayPause = manager::playPause, onNext = manager::skipNext)
    }
}

@Composable
private fun MediaNavigationContent(
    navController: androidx.navigation.NavHostController, start: String, snackbar: SnackbarHostState
) {
    val scope = rememberCoroutineScope()
    UiErrorBoundary(boundaryName = "NavigationRoot", onGoHome = {
        navController.navigate(MediaRoutes.HOME) {
            popUpTo(MediaRoutes.HOME) { inclusive = false }
            launchSingleTop = true
        }
    }, onReportIssue = { scope.launch { snackbar.showSnackbar("Issue reported for NavigationRoot") } }) {
        MediaAppNavHost(navController = navController, startDestination = start,
            onShowSnackbar = { message -> scope.launch { snackbar.showSnackbar(message) } })
    }
}

/**
 * Manages global playback state for mini player
 */
interface PlaybackStateManager {
    val currentPlayback: kotlinx.coroutines.flow.StateFlow<MiniPlayerState?>
    fun playPause()
    fun skipNext()
    fun skipPrevious()
}

data class MiniPlayerState(
    val title: String,
    val subtitle: String,
    val artworkUrl: String?,
    val progress: Float,
    val isPlaying: Boolean,
    val playerType: String
)

private fun audioDockType(type: String): String = if (type in setOf("audiobook", "podcast")) type else "music"
