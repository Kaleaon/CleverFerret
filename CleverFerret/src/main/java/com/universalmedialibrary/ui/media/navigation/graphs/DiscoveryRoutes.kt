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

fun NavGraphBuilder.discoveryRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
    composable(MediaRoutes.OPDS_BROWSER) {
        val viewModel: OPDSViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        OPDSBrowserScreen(
            state = state,
            onCatalogClick = { catalog -> viewModel.openCatalog(catalog) },
            onEntryClick = { entry ->
                // Either download or show details
                if (entry.isDownloadable) {
                    viewModel.download(entry)
                } else {
                    navController.navigate(MediaRoutes.mediaDetailRoute("opds", entry.id))
                }
            },
            onSearch = { query -> viewModel.search(query) },
            onAddCatalog = { url -> viewModel.addCatalog(url) },
            onBackClick = { 
                if (!viewModel.navigateBack()) {
                    navController.popBackStack()
                }
            }
        )
    }

    // Legacy compatibility: canonicalize old route without a source segment.
    // Keeps existing deep links/callsites functional while consolidating browse state.
    composable("discover/webfiction") {
        LaunchedEffect(Unit) {
            navController.navigate(MediaRoutes.webFictionBrowseRoute(source = "")) {
                popUpTo("discover/webfiction") { inclusive = true }
            }
        }
    }

    // Web fiction source browser (safe destination so navigation doesn't crash).
    // This can be upgraded to a real source directory UI later.
    composable(
        route = MediaRoutes.WEB_FICTION_BROWSE,
        arguments = listOf(
            navArgument("source") {
                type = NavType.StringType
                nullable = true
                defaultValue = ""
            }
        )
    ) { backStackEntry ->
        val source = backStackEntry.arguments?.getString("source").orEmpty()
        val decodedSource = remember(source) { Uri.decode(source) }
        val displaySource = sanitizeRouteParamForDisplay(decodedSource)
            .ifBlank { stringResource(R.string.webfiction_browse_source_unknown) }
        val snackbarMessage = stringResource(R.string.webfiction_browse_not_implemented, displaySource)

        LaunchedEffect(snackbarMessage) {
            onShowSnackbar(snackbarMessage)
        }

        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Text(
                            text = if (source.isBlank()) {
                                stringResource(R.string.webfiction_browse_title_generic)
                            } else {
                                stringResource(R.string.webfiction_browse_title, displaySource)
                            }
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = { navController.popBackStack() }) {
                            Icon(
                                Icons.Default.ArrowBack,
                                contentDescription = stringResource(R.string.navigation_back)
                            )
                        }
                    }
                )
            }
        ) { padding ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp),
                horizontalAlignment = Alignment.Start
            ) {
                Text(
                    text = stringResource(R.string.webfiction_browse_coming_soon),
                    style = MaterialTheme.typography.titleMedium
                )
                Text(
                    text = stringResource(R.string.webfiction_browse_add_by_url_hint),
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                    Button(onClick = { navController.popBackStack() }) {
                        Text(stringResource(R.string.navigation_back))
                    }
                    OutlinedButton(onClick = { navController.navigate(MediaRoutes.WEB_FICTION) }) {
                        Text(stringResource(R.string.webfiction_browse_go_to_web_fiction))
                    }
                }
            }
        }
    }
    
    composable(MediaRoutes.AMBIENT_SOUNDS) {
        val viewModel: AmbientViewModel = hiltViewModel()
        val state by viewModel.uiState.collectAsState()
        
        MediaAmbientScreen(
            state = state,
            onSoundToggle = { sound -> viewModel.toggleSound(sound) },
            onVolumeChange = { sound, volume -> viewModel.setVolume(sound, volume) },
            onPresetSelect = { preset -> viewModel.applyPreset(preset) },
            onSavePreset = { name -> viewModel.savePreset(name) },
            onBackClick = { navController.popBackStack() }
        )
    }
    
    composable(MediaRoutes.NEWS) {
        com.universalmedialibrary.ui.news.NewsScreen(
            onNavigateBack = { navController.popBackStack() },
            onOpenEpub = { path ->
                navController.navigate("epub_reader/${Uri.encode(path)}")
            }
        )
    }

    composable(MediaRoutes.VISUALIZER) {
        com.universalmedialibrary.ui.visualizer.VisualizerScreen(
            onBack = { navController.popBackStack() }
        )
    }
    
    // =====================================================================
}
