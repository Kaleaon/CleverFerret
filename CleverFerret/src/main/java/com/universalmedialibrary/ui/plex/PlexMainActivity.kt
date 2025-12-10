package com.universalmedialibrary.ui.plex

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.ui.plex.components.PlexMiniPlayer
import com.universalmedialibrary.ui.plex.navigation.*
import com.universalmedialibrary.ui.plex.theme.PlexTheme
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Main Activity for Plex-style CleverFerret
 * 
 * Entry point for the redesigned app with:
 * - Edge-to-edge display
 * - Responsive navigation (sidebar on tablets, bottom nav on phones)
 * - Global mini-player
 * - Material 3 theming with Plex colors
 */
@AndroidEntryPoint
class PlexMainActivity : ComponentActivity() {
    
    @Inject
    lateinit var playbackStateManager: PlaybackStateManager
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        
        setContent {
            PlexTheme {
                PlexMainScreen(playbackStateManager = playbackStateManager)
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexMainScreen(
    playbackStateManager: PlaybackStateManager
) {
    val navController = rememberNavController()
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentRoute = navBackStackEntry?.destination?.route
    
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
                        PlexMiniPlayer(
                            state = state,
                            onTap = {
                                val route = when (state.playerType) {
                                    "music" -> PlexRoutes.audioPlayerRoute("music")
                                    "audiobook" -> PlexRoutes.audioPlayerRoute("audiobook")
                                    "podcast" -> PlexRoutes.audioPlayerRoute("podcast")
                                    else -> PlexRoutes.audioPlayerRoute("music")
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
        PlexNavigationScaffold(
            currentRoute = currentRoute ?: PlexRoutes.HOME,
            onNavigate = { route -> navController.navigate(route) },
            modifier = Modifier.padding(paddingValues)
        ) { innerPadding ->
            PlexAppNavHost(
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
