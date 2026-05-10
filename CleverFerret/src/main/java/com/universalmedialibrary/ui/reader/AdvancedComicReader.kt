package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import android.net.Uri
import androidx.activity.compose.BackHandler
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Rect
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.viewer.common.ComicSettings
import com.universalmedialibrary.ui.viewer.common.FitMode
import com.universalmedialibrary.ui.viewer.common.ReadingDirection
import com.universalmedialibrary.ui.viewer.common.ReadingMode
import com.universalmedialibrary.ui.viewer.common.ViewerSettings
import kotlinx.coroutines.delay
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min

/**
 * Advanced Comic Reader with Panel-by-Panel Navigation
 * Features:
 * - CBZ/CBR archive support
 * - Geometric panel detection
 * - Guided view with smooth transitions
 * - Multiple reading modes
 * - Smart cropping and zoom
 * - Webtoon continuous scroll mode
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AdvancedComicReader(
    comicUri: Uri,
    onBack: () -> Unit,
    viewModel: AdvancedComicReaderViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val context = LocalContext.current
    val density = LocalDensity.current

    var showControls by remember { mutableStateOf(true) }
    var showSettings by remember { mutableStateOf(false) }
    var showPanelBrowser by remember { mutableStateOf(false) }

        var scale by remember { mutableFloatStateOf(1f) }
        var offsetX by remember { mutableFloatStateOf(0f) }
        var offsetY by remember { mutableFloatStateOf(0f) }

        // Guided view animation state
        var guidedViewOffset by remember { mutableStateOf(Offset.Zero) }
        val guidedViewAnimation = remember { Animatable(Offset.Zero, Offset.VectorConverter) }

        LaunchedEffect(comicUri) {
            viewModel.loadComic(context, comicUri)
        }

        // Auto-hide controls
        LaunchedEffect(showControls) {
            if (showControls && !showSettings) {
                delay(3000)
                showControls = false
            }
        }

        // Guided view animation
        LaunchedEffect(uiState.currentPanel) {
            if (uiState.comicSettings.panelByPanelMode) {
                uiState.currentPanelRect?.let { panelRect ->
                    guidedViewAnimation.animateTo(
                        targetValue = Offset(-panelRect.left, -panelRect.top),
                        animationSpec = tween(
                            durationMillis = uiState.comicSettings.panelTransitionDuration.toInt(),
                            easing = FastOutSlowInEasing
                        )
                    )
                    guidedViewOffset = guidedViewAnimation.value
                }
            }
        }

        BackHandler {
            when {
                showSettings -> showSettings = false
                showPanelBrowser -> showPanelBrowser = false
                uiState.comicSettings.panelByPanelMode && uiState.currentPanel > 0 -> {
                    viewModel.previousPanel()
                }
                else -> onBack()
            }
        }

        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.Black)
        ) {
            when {
                uiState.isLoading -> {
                    LoadingState()
                }

                uiState.error != null -> {
                    ErrorState(
                        error = uiState.error!!,
                        onRetry = { viewModel.loadComic(context, comicUri) },
                        onBack = onBack
                    )
                }

                uiState.isLoaded -> {
                    when (uiState.comicSettings.readingMode) {
                        ReadingMode.WEBTOON, ReadingMode.CONTINUOUS_VERTICAL -> {
                            WebtoonView(
                                pages = uiState.pages,
                                currentPage = uiState.currentPage,
                                onPageChanged = { page -> viewModel.setCurrentPage(page) },
                                onTap = { showControls = !showControls }
                            )
                        }

                        ReadingMode.CONTINUOUS_HORIZONTAL -> {
                            DoublePageView(
                                pages = uiState.pages,
                                currentPage = uiState.currentPage,
                                scale = scale,
                                offsetX = offsetX,
                                offsetY = offsetY,
                                onPageChanged = { page -> viewModel.setCurrentPage(page) },
                                onScaleChanged = { newScale -> scale = newScale },
                                onOffsetChanged = { x, y ->
                                    offsetX = x
                                    offsetY = y
                                },
                                onTap = { showControls = !showControls }
                            )
                        }

                        else -> {
                            SinglePageView(
                                pages = uiState.pages,
                                currentPage = uiState.currentPage,
                                panels = uiState.currentPagePanels,
                                currentPanel = uiState.currentPanel,
                                panelByPanelMode = uiState.comicSettings.panelByPanelMode,
                                showPanelBorders = uiState.comicSettings.showPanelBorders,
                                scale = scale,
                                offsetX = if (uiState.comicSettings.panelByPanelMode) guidedViewOffset.x else offsetX,
                                offsetY = if (uiState.comicSettings.panelByPanelMode) guidedViewOffset.y else offsetY,
                                onPageChanged = { page -> viewModel.setCurrentPage(page) },
                                onPanelSelected = { panel -> viewModel.setCurrentPanel(panel) },
                                onScaleChanged = { newScale -> scale = newScale },
                                onOffsetChanged = { x, y ->
                                    if (!uiState.comicSettings.panelByPanelMode) {
                                        offsetX = x
                                        offsetY = y
                                    }
                                },
                                onTap = {
                                    if (uiState.comicSettings.panelByPanelMode) {
                                        viewModel.nextPanel()
                                    } else {
                                        showControls = !showControls
                                    }
                                }
                            )
                        }
                    }
                }
            }

            // Top controls
            AnimatedVisibility(
                visible = showControls && uiState.isLoaded,
                enter = fadeIn() + slideInVertically(initialOffsetY = { -it }),
                exit = fadeOut() + slideOutVertically(targetOffsetY = { -it }),
                modifier = Modifier.align(Alignment.TopStart)
            ) {
                TopComicControls(
                    title = uiState.title,
                    currentPage = uiState.currentPage,
                    totalPages = uiState.totalPages,
                    currentPanel = uiState.currentPanel,
                    totalPanels = uiState.currentPagePanels.size,
                    panelByPanelMode = uiState.comicSettings.panelByPanelMode,
                    onBack = onBack,
                    onPanelBrowser = { showPanelBrowser = true },
                    onSettings = { showSettings = true }
                )
            }

            // Bottom controls
            AnimatedVisibility(
                visible = showControls && uiState.isLoaded,
                enter = fadeIn() + slideInVertically(initialOffsetY = { it }),
                exit = fadeOut() + slideOutVertically(targetOffsetY = { it }),
                modifier = Modifier.align(Alignment.BottomStart)
            ) {
                BottomComicControls(
                    currentPage = uiState.currentPage,
                    totalPages = uiState.totalPages,
                    currentPanel = uiState.currentPanel,
                    totalPanels = uiState.currentPagePanels.size,
                    panelByPanelMode = uiState.comicSettings.panelByPanelMode,
                    readingDirection = uiState.comicSettings.readingDirection,
                    canGoPrevious = uiState.currentPage > 1 || uiState.currentPanel > 0,
                    canGoNext = uiState.currentPage < uiState.totalPages ||
                               uiState.currentPanel < uiState.currentPagePanels.size - 1,
                    onPreviousPage = { viewModel.previousPage() },
                    onNextPage = { viewModel.nextPage() },
                    onPreviousPanel = { viewModel.previousPanel() },
                    onNextPanel = { viewModel.nextPanel() },
                    onPageSeek = { page -> viewModel.setCurrentPage(page) },
                    onTogglePanelMode = { viewModel.togglePanelByPanelMode() }
                )
            }

            // Panel navigation hints
            if (uiState.comicSettings.panelByPanelMode &&
                uiState.comicSettings.panelNavigationHints &&
                showControls) {
                PanelNavigationHints(
                    currentPanel = uiState.currentPanel,
                    totalPanels = uiState.currentPagePanels.size,
                    canGoNext = uiState.currentPanel < uiState.currentPagePanels.size - 1 ||
                               uiState.currentPage < uiState.totalPages
                )
            }
        }

        // Settings bottom sheet
        if (showSettings) {
            ComicReaderSettingsSheet(
                settings = uiState.settings,
                comicSettings = uiState.comicSettings,
                onDismiss = { showSettings = false },
                onSettingsChanged = { viewModel.updateSettings(it) },
                onComicSettingsChanged = { viewModel.updateComicSettings(it) }
            )
        }

    // Panel browser sheet
    if (showPanelBrowser) {
        PanelBrowserSheet(
            pages = uiState.pages,
            currentPage = uiState.currentPage,
            panels = uiState.allPagePanels,
            onDismiss = { showPanelBrowser = false },
            onPageSelected = { page ->
                viewModel.setCurrentPage(page)
                showPanelBrowser = false
            },
            onPanelSelected = { page, panel ->
                viewModel.setCurrentPage(page)
                viewModel.setCurrentPanel(panel)
                showPanelBrowser = false
            }
        )
    }
}



@Composable
private fun WebtoonView(
    pages: List<String>,
    currentPage: Int,
    onPageChanged: (Int) -> Unit,
    onTap: () -> Unit
) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .pointerInput(Unit) {
                detectTapGestures(onTap = { onTap() })
            }
    ) {
        items(pages.withIndex().toList()) { (index, pageUri) ->
            AsyncImage(
                    
                model = ImageRequest.Builder(LocalContext.current)
                    .data(pageUri)
                    .crossfade(true)
                    .build(),
                contentDescription = "Comic page ${index + 1}",
                modifier = Modifier
                    .fillMaxWidth()
                    .wrapContentHeight(),
                contentScale = ContentScale.FillWidth
            )
        }
    }
}


@Composable
private fun LoadingState() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            CircularProgressIndicator(
                color = MaterialTheme.colorScheme.primary,
                strokeWidth = 3.dp,
                modifier = Modifier.size(60.dp)
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "Loading comic...",
                style = MaterialTheme.typography.bodyLarge,
                color = Color.White.copy(alpha = 0.8f)
            )
        }
    }
}

@Composable
private fun ErrorState(
    error: String,
    onRetry: () -> Unit,
    onBack: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(32.dp),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Column(
            modifier = Modifier.padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = Icons.Default.Error,
                contentDescription = "Media image",
                modifier = Modifier.size(48.dp),
                tint = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "Unable to open comic",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Medium
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = error,
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Center,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(16.dp))
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(onClick = onBack) {
                    Text("Go Back")
                }
                Button(onClick = onRetry) {
                    Text("Retry")
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun TopComicControls(
    title: String,
    currentPage: Int,
    totalPages: Int,
    currentPanel: Int,
    totalPanels: Int,
    panelByPanelMode: Boolean,
    onBack: () -> Unit,
    onPanelBrowser: () -> Unit,
    onSettings: () -> Unit
) {
    Surface(
        color = Color.Black.copy(alpha = 0.7f),
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(8.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBack) {
                Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back", tint = Color.White)
            }
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Text(title, color = Color.White, fontSize = 16.sp, fontWeight = FontWeight.Bold)
                Text(
                    "Page $currentPage/$totalPages" + if (panelByPanelMode) " - Panel $currentPanel/$totalPanels" else "",
                    color = Color.White,
                    fontSize = 12.sp
                )
            }
            Row {
                IconButton(onClick = onPanelBrowser) {
                    Icon(Icons.Default.GridView, contentDescription = "Panel Browser", tint = Color.White)
                }
                IconButton(onClick = onSettings) {
                    Icon(Icons.Default.Settings, contentDescription = "Settings", tint = Color.White)
                }
            }
        }
    }
}




@Composable
private fun SettingToggleRow(
    title: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(title, style = MaterialTheme.typography.bodyLarge)
        Switch(checked = checked, onCheckedChange = onCheckedChange)
    }
}
