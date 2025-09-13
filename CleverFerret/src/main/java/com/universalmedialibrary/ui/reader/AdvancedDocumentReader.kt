package com.universalmedialibrary.ui.reader

import android.net.Uri
import androidx.activity.compose.BackHandler
import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.selection.SelectionContainer
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.compose.ui.window.Dialog
import androidx.hilt.navigation.compose.hiltViewModel
import com.github.barteksc.pdfviewer.PDFView
import com.github.barteksc.pdfviewer.listener.OnLoadCompleteListener
import com.github.barteksc.pdfviewer.listener.OnPageChangeListener
import com.github.barteksc.pdfviewer.scroll.DefaultScrollHandle
import com.universalmedialibrary.ui.theme.PlexTheme
import com.universalmedialibrary.ui.viewer.MediaViewerManager
import com.universalmedialibrary.ui.viewer.common.ViewerSettings
import kotlinx.coroutines.delay
import kotlin.math.max
import kotlin.math.min

/**
 * Advanced Document Reader supporting PDF, EPUB, TXT, and other formats
 * Features:
 * - Multi-format support (PDF, EPUB, TXT, HTML, DOC, etc.)
 * - Advanced typography controls
 * - Text search and highlighting
 * - Bookmarks and annotations
 * - Reading statistics
 * - Night mode and blue light filter
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AdvancedDocumentReader(
    documentUri: Uri,
    onBack: () -> Unit,
    viewModel: AdvancedDocumentReaderViewModel = hiltViewModel()
) {
    PlexTheme {
        val uiState by viewModel.uiState.collectAsState()
        val context = LocalContext.current
        val density = LocalDensity.current
        
        var showControls by remember { mutableStateOf(true) }
        var showSettings by remember { mutableStateOf(false) }
        var showSearch by remember { mutableStateOf(false) }
        var showBookmarks by remember { mutableStateOf(false) }
        var showTableOfContents by remember { mutableStateOf(false) }
        
        var scale by remember { mutableFloatStateOf(1f) }
        var offsetX by remember { mutableFloatStateOf(0f) }
        var offsetY by remember { mutableFloatStateOf(0f) }

        LaunchedEffect(documentUri) {
            viewModel.loadDocument(context, documentUri)
        }

        // Auto-hide controls
        LaunchedEffect(showControls) {
            if (showControls && !showSettings && !showSearch) {
                delay(3000)
                showControls = false
            }
        }

        BackHandler {
            when {
                showSettings -> showSettings = false
                showSearch -> showSearch = false
                showBookmarks -> showBookmarks = false
                showTableOfContents -> showTableOfContents = false
                else -> onBack()
            }
        }

        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    if (uiState.settings.nightMode) Color.Black 
                    else uiState.settings.backgroundColor
                )
        ) {
            when {
                uiState.isLoading -> {
                    LoadingState()
                }
                
                uiState.error != null -> {
                    ErrorState(
                        error = uiState.error!!,
                        onRetry = { viewModel.loadDocument(context, documentUri) },
                        onBack = onBack
                    )
                }
                
                uiState.isLoaded -> {
                    when (uiState.documentType) {
                        MediaViewerManager.DocumentFormat.PDF -> {
                            PDFReaderView(
                                documentUri = documentUri,
                                currentPage = uiState.currentPage,
                                totalPages = uiState.totalPages,
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
                        
                        MediaViewerManager.DocumentFormat.EPUB -> {
                            EPUBReaderView(
                                content = uiState.content,
                                settings = uiState.settings,
                                currentPage = uiState.currentPage,
                                totalPages = uiState.totalPages,
                                onPageChanged = { page -> viewModel.setCurrentPage(page) },
                                onTap = { showControls = !showControls }
                            )
                        }
                        
                        else -> {
                            TextReaderView(
                                content = uiState.content,
                                settings = uiState.settings,
                                searchResults = uiState.searchResults,
                                currentSearchIndex = uiState.currentSearchIndex,
                                onTap = { showControls = !showControls }
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
                TopReaderControls(
                    title = uiState.title,
                    currentPage = uiState.currentPage,
                    totalPages = uiState.totalPages,
                    readingProgress = uiState.readingProgress,
                    onBack = onBack,
                    onSearch = { showSearch = true },
                    onBookmarks = { showBookmarks = true },
                    onTableOfContents = { showTableOfContents = true },
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
                BottomReaderControls(
                    currentPage = uiState.currentPage,
                    totalPages = uiState.totalPages,
                    readingProgress = uiState.readingProgress,
                    canGoPrevious = uiState.currentPage > 1,
                    canGoNext = uiState.currentPage < uiState.totalPages,
                    onPreviousPage = { viewModel.previousPage() },
                    onNextPage = { viewModel.nextPage() },
                    onPageSeek = { page -> viewModel.setCurrentPage(page) }
                )
            }

            // Reading statistics overlay
            if (uiState.settings.readingAnalytics && uiState.readingStats.isNotEmpty()) {
                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(16.dp)
                ) {
                    ReadingStatsOverlay(
                        stats = uiState.readingStats,
                        visible = showControls
                    )
                }
            }
        }

        // Settings bottom sheet
        if (showSettings) {
            DocumentReaderSettingsSheet(
                settings = uiState.settings,
                documentType = uiState.documentType,
                onDismiss = { showSettings = false },
                onSettingsChanged = { viewModel.updateSettings(it) }
            )
        }

        // Search dialog
        if (showSearch) {
            SearchDialog(
                searchQuery = uiState.searchQuery,
                searchResults = uiState.searchResults,
                currentSearchIndex = uiState.currentSearchIndex,
                onDismiss = { showSearch = false },
                onSearch = { query -> viewModel.searchInDocument(query) },
                onNavigateToResult = { index -> viewModel.navigateToSearchResult(index) }
            )
        }

        // Bookmarks sheet
        if (showBookmarks) {
            BookmarksSheet(
                bookmarks = uiState.bookmarks,
                onDismiss = { showBookmarks = false },
                onBookmarkSelected = { bookmark -> 
                    viewModel.navigateToBookmark(bookmark)
                    showBookmarks = false
                },
                onBookmarkDeleted = { bookmark -> viewModel.deleteBookmark(bookmark) }
            )
        }

        // Table of contents sheet
        if (showTableOfContents) {
            TableOfContentsSheet(
                chapters = uiState.tableOfContents,
                currentChapter = uiState.currentChapter,
                onDismiss = { showTableOfContents = false },
                onChapterSelected = { chapter ->
                    viewModel.navigateToChapter(chapter)
                    showTableOfContents = false
                }
            )
        }
    }
}

@Composable
private fun PDFReaderView(
    documentUri: Uri,
    currentPage: Int,
    totalPages: Int,
    scale: Float,
    offsetX: Float,
    offsetY: Float,
    onPageChanged: (Int) -> Unit,
    onScaleChanged: (Float) -> Unit,
    onOffsetChanged: (Float, Float) -> Unit,
    onTap: () -> Unit
) {
    AndroidView(
        factory = { context ->
            PDFView(context, null).apply {
                fromUri(documentUri)
                    .enableSwipe(true)
                    .swipeHorizontal(false)
                    .enableDoubletap(true)
                    .defaultPage(currentPage - 1)
                    .onLoad(object : OnLoadCompleteListener {
                        override fun loadComplete(nbPages: Int) {
                            // Update total pages if needed
                        }
                    })
                    .onPageChange(object : OnPageChangeListener {
                        override fun onPageChanged(page: Int, pageCount: Int) {
                            onPageChanged(page + 1) // Convert to 1-based indexing
                        }
                    })
                    .enableAnnotationRendering(true)
                    .scrollHandle(DefaultScrollHandle(context))
                    .spacing(10)
                    .load()
            }
        },
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
    )
}

@Composable
private fun EPUBReaderView(
    content: String,
    settings: ViewerSettings,
    currentPage: Int,
    totalPages: Int,
    onPageChanged: (Int) -> Unit,
    onTap: () -> Unit
) {
    // In a real implementation, this would use WebView or custom EPUB rendering
    // For now, showing as formatted text
    Column(
        modifier = Modifier
            .fillMaxSize()
            .clickable { onTap() }
            .padding(horizontal = settings.marginHorizontal.dp)
    ) {
        SelectionContainer {
            Text(
                text = content,
                color = settings.textColor,
                fontSize = settings.fontSize.sp,
                fontFamily = settings.fontFamily,
                lineHeight = (settings.fontSize * settings.lineSpacing).sp,
                textAlign = when (settings.textAlignment) {
                    com.universalmedialibrary.ui.viewer.common.TextAlignment.LEFT -> TextAlign.Left
                    com.universalmedialibrary.ui.viewer.common.TextAlignment.CENTER -> TextAlign.Center
                    com.universalmedialibrary.ui.viewer.common.TextAlignment.RIGHT -> TextAlign.Right
                    com.universalmedialibrary.ui.viewer.common.TextAlignment.JUSTIFY -> TextAlign.Justify
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = settings.marginVertical.dp)
                    .verticalScroll(rememberScrollState())
            )
        }
    }
}

@Composable
private fun TextReaderView(
    content: String,
    settings: ViewerSettings,
    searchResults: List<Int>,
    currentSearchIndex: Int,
    onTap: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .clickable { onTap() }
            .padding(horizontal = settings.marginHorizontal.dp)
    ) {
        SelectionContainer {
            Text(
                text = content,
                color = settings.textColor,
                fontSize = settings.fontSize.sp,
                fontFamily = settings.fontFamily,
                lineHeight = (settings.fontSize * settings.lineSpacing).sp,
                textAlign = when (settings.textAlignment) {
                    com.universalmedialibrary.ui.viewer.common.TextAlignment.LEFT -> TextAlign.Left
                    com.universalmedialibrary.ui.viewer.common.TextAlignment.CENTER -> TextAlign.Center
                    com.universalmedialibrary.ui.viewer.common.TextAlignment.RIGHT -> TextAlign.Right
                    com.universalmedialibrary.ui.viewer.common.TextAlignment.JUSTIFY -> TextAlign.Justify
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = settings.marginVertical.dp)
                    .verticalScroll(rememberScrollState())
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
                text = "Loading document...",
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.8f)
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
                text = "Unable to open document",
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

data class ReadingStats(
    val timeSpent: Long,
    val pagesRead: Int,
    val wordsPerMinute: Float,
    val sessionStartTime: Long
)

@Composable
private fun ReadingStatsOverlay(
    stats: ReadingStats,
    visible: Boolean
) {
    AnimatedVisibility(
        visible = visible,
        enter = fadeIn() + slideInHorizontally(initialOffsetX = { it }),
        exit = fadeOut() + slideOutHorizontally(targetOffsetX = { it })
    ) {
        Card(
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surface.copy(alpha = 0.9f)
            ),
            shape = RoundedCornerShape(8.dp)
        ) {
            Column(
                modifier = Modifier.padding(12.dp),
                horizontalAlignment = Alignment.End
            ) {
                Text(
                    text = formatReadingTime(stats.timeSpent),
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurface
                )
                Text(
                    text = "${stats.wordsPerMinute.toInt()} WPM",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f)
                )
            }
        }
    }
}

private fun formatReadingTime(milliseconds: Long): String {
    val seconds = milliseconds / 1000
    val minutes = seconds / 60
    val hours = minutes / 60
    
    return when {
        hours > 0 -> "${hours}h ${minutes % 60}m"
        minutes > 0 -> "${minutes}m"
        else -> "${seconds}s"
    }
}