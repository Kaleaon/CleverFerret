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
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
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
import com.universalmedialibrary.ui.theme.PlexTheme
import com.universalmedialibrary.ui.viewer.common.ComicSettings
import com.universalmedialibrary.ui.viewer.common.ReadingDirection
import com.universalmedialibrary.ui.viewer.common.ReadingMode
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
    PlexTheme {
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
                    when (uiState.settings.readingMode) {
                        ReadingMode.CONTINUOUS_SCROLL -> {
                            WebtoonView(
                                pages = uiState.pages,
                                currentPage = uiState.currentPage,
                                onPageChanged = { page -> viewModel.setCurrentPage(page) },
                                onTap = { showControls = !showControls }
                            )
                        }

                        ReadingMode.DOUBLE_PAGE -> {
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
                    readingDirection = uiState.settings.readingDirection,
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
}

@Composable
private fun SinglePageView(
    pages: List<String>,
    currentPage: Int,
    panels: List<Rect>,
    currentPanel: Int,
    panelByPanelMode: Boolean,
    showPanelBorders: Boolean,
    scale: Float,
    offsetX: Float,
    offsetY: Float,
    onPageChanged: (Int) -> Unit,
    onPanelSelected: (Int) -> Unit,
    onScaleChanged: (Float) -> Unit,
    onOffsetChanged: (Float, Float) -> Unit,
    onTap: () -> Unit
) {
    if (currentPage > 0 && currentPage <= pages.size) {
        val currentPageUri = pages[currentPage - 1]

        Box(
            modifier = Modifier
                .fillMaxSize()
                .graphicsLayer(
                    scaleX = scale,
                    scaleY = scale,
                    translationX = offsetX,
                    translationY = offsetY
                )
                .pointerInput(Unit) {
                    detectTransformGestures { _, pan, zoom, _ ->
                        if (!panelByPanelMode) {
                            val newScale = (scale * zoom).coerceIn(0.5f, 5f)
                            onScaleChanged(newScale)
                            onOffsetChanged(offsetX + pan.x, offsetY + pan.y)
                        }
                    }
                }
                .pointerInput(Unit) {
                    if (panelByPanelMode) {
                        detectTapGestures { offset ->
                            // In panel mode, find which panel was tapped
                            val tappedPanel = panels.indexOfFirst { panel ->
                                panel.contains(offset)
                            }
                            if (tappedPanel >= 0) {
                                onPanelSelected(tappedPanel)
                            }
                            onTap()
                        }
                    } else {
                        detectTapGestures(
                            onTap = { onTap() },
                            onDoubleTap = { offset ->
                                // Double tap to zoom or fit to panel
                                if (panels.isNotEmpty()) {
                                    val tappedPanel = panels.indexOfFirst { panel ->
                                        panel.contains(offset)
                                    }
                                    if (tappedPanel >= 0) {
                                        onPanelSelected(tappedPanel)
                                        // Zoom to fit panel
                                        val panel = panels[tappedPanel]
                                        val zoomScale = min(
                                            size.width / panel.width,
                                            size.height / panel.height
                                        ) * 0.9f
                                        onScaleChanged(zoomScale)
                                        onOffsetChanged(-panel.left * zoomScale, -panel.top * zoomScale)
                                    }
                                }
                            }
                        )
                    }
                }
        ) {
            AsyncImage(
                model = ImageRequest.Builder(LocalContext.current)
                    .data(currentPageUri)
                    .crossfade(true)
                    .build(),
                contentDescription = "Comic page $currentPage",
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Fit
            )

            // Draw panel borders and highlights
            if ((showPanelBorders || panelByPanelMode) && panels.isNotEmpty()) {
                Canvas(modifier = Modifier.fillMaxSize()) {
                    panels.forEachIndexed { index, panel ->
                        val isCurrentPanel = panelByPanelMode && index == currentPanel

                        drawRect(
                            color = if (isCurrentPanel) Color.Red else Color.Yellow,
                            topLeft = Offset(panel.left, panel.top),
                            size = Size(panel.width, panel.height),
                            style = Stroke(
                                width = if (isCurrentPanel) 4.dp.toPx() else 2.dp.toPx()
                            )
                        )

                        if (showPanelBorders) {
                            drawRect(
                                color = Color.Black.copy(alpha = 0.1f),
                                topLeft = Offset(panel.left, panel.top),
                                size = Size(panel.width, panel.height)
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun DoublePageView(
    pages: List<String>,
    currentPage: Int,
    scale: Float,
    offsetX: Float,
    offsetY: Float,
    onPageChanged: (Int) -> Unit,
    onScaleChanged: (Float) -> Unit,
    onOffsetChanged: (Float, Float) -> Unit,
    onTap: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxSize()
            .graphicsLayer(
                scaleX = scale,
                scaleY = scale,
                translationX = offsetX,
                translationY = offsetY
            )
            .pointerInput(Unit) {
                detectTransformGestures { _, pan, zoom, _ ->
                    val newScale = (scale * zoom).coerceIn(0.5f, 5f)
                    onScaleChanged(newScale)
                    onOffsetChanged(offsetX + pan.x, offsetY + pan.y)
                }
            }
            .pointerInput(Unit) {
                detectTapGestures(onTap = { onTap() })
            }
    ) {
        // Left page
        if (currentPage > 1) {
            AsyncImage(
                model = ImageRequest.Builder(LocalContext.current)
                    .data(pages[currentPage - 2])
                    .crossfade(true)
                    .build(),
                contentDescription = "Comic page ${currentPage - 1}",
                modifier = Modifier.weight(1f),
                contentScale = ContentScale.Fit
            )
        } else {
            Spacer(modifier = Modifier.weight(1f))
        }

        // Right page
        if (currentPage <= pages.size) {
            AsyncImage(
                model = ImageRequest.Builder(LocalContext.current)
                    .data(pages[currentPage - 1])
                    .crossfade(true)
                    .build(),
                contentDescription = "Comic page $currentPage",
                modifier = Modifier.weight(1f),
                contentScale = ContentScale.Fit
            )
        } else {
            Spacer(modifier = Modifier.weight(1f))
        }
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
                contentScale = ContentScale.FitWidth
            )
        }
    }
}

@Composable
private fun PanelNavigationHints(
    currentPanel: Int,
    totalPanels: Int,
    canGoNext: Boolean
) {
    Box(
        modifier = Modifier.fillMaxSize()
    ) {
        // Next panel hint
        if (canGoNext) {
            AnimatedVisibility(
                visible = true,
                enter = fadeIn() + scaleIn(),
                exit = fadeOut() + scaleOut(),
                modifier = Modifier
                    .align(Alignment.CenterEnd)
                    .padding(16.dp)
            ) {
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = Color.Black.copy(alpha = 0.7f)
                    ),
                    shape = RoundedCornerShape(20.dp)
                ) {
                    Icon(
                        Icons.Default.ArrowForward,
                        contentDescription = "Next panel",
                        tint = Color.White,
                        modifier = Modifier
                            .padding(12.dp)
                            .size(24.dp)
                    )
                }
            }
        }

        // Panel indicator
        AnimatedVisibility(
            visible = totalPanels > 1,
            modifier = Modifier
                .align(Alignment.TopCenter)
                .padding(16.dp)
        ) {
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = Color.Black.copy(alpha = 0.7f)
                ),
                shape = RoundedCornerShape(16.dp)
            ) {
                Text(
                    text = "${currentPanel + 1} / $totalPanels",
                    color = Color.White,
                    fontSize = 12.sp,
                    modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp)
                )
            }
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
                contentDescription = null,
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
