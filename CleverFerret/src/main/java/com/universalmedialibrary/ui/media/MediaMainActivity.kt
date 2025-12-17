package com.universalmedialibrary.ui.media

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Modifier
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.PermissionDialog
import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.media.components.MediaMiniPlayer
import com.universalmedialibrary.ui.media.navigation.*
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.media.theme.MediaColors
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
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
    val palette by mainViewModel.selectedTheme.collectAsState(ThemePalette.NAVY_GOLD)
    val darkMode by mainViewModel.darkMode.collectAsState(true)

    CleverFerretTheme(
        palette = palette,
        darkTheme = darkMode
    ) {
        // Bridge media-centric design tokens to the app-wide theme palette.
        MediaColors.SyncWithMaterialTheme()

        MediaMainScreen(
            playbackStateManager = playbackStateManager,
            mainViewModel = mainViewModel
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaMainScreen(
    playbackStateManager: PlaybackStateManager,
    mainViewModel: MainViewModel = hiltViewModel()
) {
    val bottomBarPreferences by mainViewModel.bottomBarPreferences.collectAsState(BottomBarPreferences.Default)
    val gearPosition by mainViewModel.bottomGearPosition.collectAsState(BottomGearPosition.RIGHT)

    // Permissions: request everything the app needs on startup.
    val permissionState = rememberPermissionsHandler()
    var permissionRequestedOnce by rememberSaveable { mutableStateOf(false) }
    LaunchedEffect(Unit) {
        if (!permissionState.hasAllPermissions && !permissionRequestedOnce) {
            permissionRequestedOnce = true
            permissionState.requestPermissions()
        }
    }

    // Gate the UI until the required runtime permissions are granted.
    if (!permissionState.hasAllPermissions) {
        PermissionDialog(permissionState = permissionState)
        return
    }

    val navController = rememberNavController()
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentRoute = navBackStackEntry?.destination?.route
    val currentRouteForNavigation = remember(navBackStackEntry, currentRoute) {
        when (currentRoute) {
            MediaRoutes.LIBRARY -> {
                val mediaType = navBackStackEntry?.arguments?.getString("mediaType")
                if (mediaType.isNullOrBlank()) MediaRoutes.LIBRARY else MediaRoutes.libraryRoute(mediaType)
            }
            else -> currentRoute
        } ?: MediaRoutes.HOME
    }
    
    // Check if we should show navigation (hide during player screens)
    val showNavigation = remember(currentRoute) {
        currentRoute != null && !currentRoute.startsWith("player/") && !currentRoute.startsWith("reader/")
    }
    
    // Check if we should show mini player
    val playbackState by playbackStateManager.currentPlayback.collectAsState()
    val showMiniPlayer = remember(playbackState, currentRoute) {
        playbackState != null && !currentRoute.orEmpty().startsWith("player/")
    }
    
    // Snackbar state for global messages
    val snackbarHostState = remember { SnackbarHostState() }
    val scope = rememberCoroutineScope()
    
    Scaffold(
        snackbarHost = { SnackbarHost(snackbarHostState) },
        bottomBar = {
            Column {
                // Mini player
                AnimatedVisibility(
                    visible = showMiniPlayer,
                    enter = slideInVertically(initialOffsetY = { it }) + fadeIn(),
                    exit = slideOutVertically(targetOffsetY = { it }) + fadeOut()
                ) {
                    playbackState?.let { state ->
                        MediaMiniPlayer(
                            state = state,
                            onTap = {
                                val route = when (state.playerType) {
                                    "music" -> MediaRoutes.audioPlayerRoute("music")
                                    "audiobook" -> MediaRoutes.audioPlayerRoute("audiobook")
                                    "podcast" -> MediaRoutes.audioPlayerRoute("podcast")
                                    else -> MediaRoutes.audioPlayerRoute("music")
                                }
                                navController.navigate(route)
                            },
                            onPlayPause = { playbackStateManager.playPause() },
                            onNext = { playbackStateManager.skipNext() }
                        )
                    }
                }
            }
        }
    ) { paddingValues ->
        MediaNavigationScaffold(
            currentRoute = currentRouteForNavigation,
            onNavigate = { route -> navController.navigate(route) },
            bottomBarPreferences = bottomBarPreferences,
            gearPosition = gearPosition,
            modifier = Modifier.padding(paddingValues)
        ) { innerPadding ->
            MediaAppNavHost(
                navController = navController,
                onShowSnackbar = { message ->
                    // Show snackbar using composition-scoped coroutine
                    scope.launch {
                        snackbarHostState.showSnackbar(message)
                    }
                },
                modifier = Modifier.padding(innerPadding)
            )
        }
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
