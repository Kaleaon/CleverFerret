package com.universalmedialibrary.ui.reader

import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.data.local.entity.ReaderSettings
import kotlinx.coroutines.launch

/**
 * E-Reader Screen for displaying EPUB content
 * 
 * Features:
 * - WebView-based HTML rendering for robust CSS support
 * - Navigation controls (prev/next/chapter list)
 * - Reading progress indicator
 * - Settings integration for theming and typography
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EReaderScreen(
    mediaId: Long,
    onNavigateBack: () -> Unit,
    onOpenSettings: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: EReaderViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val readerSettings by viewModel.readerSettings.collectAsStateWithLifecycle()
    
    var showChapterList by remember { mutableStateOf(false) }
    val scope = rememberCoroutineScope()
    
    LaunchedEffect(mediaId) {
        viewModel.loadBook(mediaId)
    }
    
    Column(
        modifier = modifier.fillMaxSize()
    ) {
        // Top App Bar
        TopAppBar(
            title = { 
                Text(
                    text = uiState.bookTitle.ifEmpty { "Reader" },
                    maxLines = 1
                ) 
            },
            navigationIcon = {
                IconButton(onClick = onNavigateBack) {
                    Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                }
            },
            actions = {
                IconButton(onClick = { showChapterList = true }) {
                    Icon(Icons.Default.List, contentDescription = "Chapters")
                }
                IconButton(onClick = onOpenSettings) {
                    Icon(Icons.Default.Settings, contentDescription = "Settings")
                }
            }
        )
        
        when {
            uiState.isLoading -> {
                LoadingContent()
            }
            uiState.hasError -> {
                ErrorContent(
                    error = uiState.error ?: "Unknown error",
                    onRetry = { viewModel.loadBook(mediaId) }
                )
            }
            uiState.isLoaded -> {
                ReaderContent(
                    uiState = uiState,
                    readerSettings = readerSettings,
                    onPreviousChapter = viewModel::previousChapter,
                    onNextChapter = viewModel::nextChapter,
                    modifier = Modifier.weight(1f)
                )
            }
        }
        
        // Bottom Navigation
        if (uiState.isLoaded) {
            BottomReaderControls(
                uiState = uiState,
                onPreviousChapter = viewModel::previousChapter,
                onNextChapter = viewModel::nextChapter
            )
        }
    }
    
    // Chapter List Modal
    if (showChapterList) {
        ChapterListModal(
            chapters = uiState.chapters,
            currentChapter = uiState.currentChapter,
            onChapterSelected = { chapterIndex ->
                viewModel.jumpToChapter(chapterIndex)
                showChapterList = false
            },
            onDismiss = { showChapterList = false }
        )
    }
}

@Composable
private fun LoadingContent() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            CircularProgressIndicator()
            Text("Loading book...")
        }
    }
}

@Composable
private fun ErrorContent(
    error: String,
    onRetry: () -> Unit
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Icon(
                Icons.Default.Warning,
                contentDescription = "Error",
                tint = MaterialTheme.colorScheme.error,
                modifier = Modifier.size(64.dp)
            )
            Text(
                text = "Failed to load book",
                style = MaterialTheme.typography.headlineSmall
            )
            Text(
                text = error,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Button(onClick = onRetry) {
                Text("Retry")
            }
        }
    }
}

@Composable
private fun ReaderContent(
    uiState: EReaderUiState,
    readerSettings: ReaderSettings,
    onPreviousChapter: () -> Unit,
    onNextChapter: () -> Unit,
    modifier: Modifier = Modifier
) {
    val context = LocalContext.current
    
    Box(modifier = modifier) {
        AndroidView(
            factory = { context ->
                WebView(context).apply {
                    webViewClient = WebViewClient()
                    settings.apply {
                        javaScriptEnabled = true
                        loadWithOverviewMode = true
                        useWideViewPort = true
                        setSupportZoom(true)
                        builtInZoomControls = false
                        displayZoomControls = false
                    }
                }
            },
            update = { webView ->
                val currentChapterContent = uiState.currentChapterContent
                if (currentChapterContent.isNotEmpty()) {
                    val styledContent = applyReaderStyles(currentChapterContent, readerSettings)
                    webView.loadDataWithBaseURL(null, styledContent, "text/html", "UTF-8", null)
                }
            },
            modifier = Modifier.fillMaxSize()
        )
    }
}

@Composable
private fun BottomReaderControls(
    uiState: EReaderUiState,
    onPreviousChapter: () -> Unit,
    onNextChapter: () -> Unit
) {
    Surface(
        color = MaterialTheme.colorScheme.surface,
        tonalElevation = 8.dp
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            // Progress indicator
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Chapter ${uiState.currentChapter + 1} of ${uiState.totalChapters}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    text = "${(uiState.progress * 100).toInt()}%",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            LinearProgressIndicator(
                progress = uiState.progress,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 8.dp)
            )
            
            // Navigation buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                Button(
                    onClick = onPreviousChapter,
                    enabled = uiState.canGoPrevious
                ) {
                    Icon(Icons.Default.KeyboardArrowLeft, contentDescription = null)
                    Spacer(Modifier.width(4.dp))
                    Text("Previous")
                }
                
                Button(
                    onClick = onNextChapter,
                    enabled = uiState.canGoNext
                ) {
                    Text("Next")
                    Spacer(Modifier.width(4.dp))
                    Icon(Icons.Default.KeyboardArrowRight, contentDescription = null)
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ChapterListModal(
    chapters: List<EReaderChapter>,
    currentChapter: Int,
    onChapterSelected: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        dragHandle = { BottomSheetDefaults.DragHandle() }
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp)
                .padding(bottom = 32.dp)
        ) {
            item {
                Text(
                    text = "Chapters",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }
            
            items(chapters.size) { index ->
                val chapter = chapters[index]
                val isCurrentChapter = index == currentChapter
                
                Card(
                    onClick = { onChapterSelected(index) },
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 4.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = if (isCurrentChapter) {
                            MaterialTheme.colorScheme.primaryContainer
                        } else {
                            MaterialTheme.colorScheme.surface
                        }
                    )
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "${index + 1}",
                            style = MaterialTheme.typography.bodyMedium,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier.width(32.dp)
                        )
                        
                        Text(
                            text = chapter.title,
                            style = MaterialTheme.typography.bodyMedium,
                            fontWeight = if (isCurrentChapter) FontWeight.Bold else FontWeight.Normal,
                            modifier = Modifier.weight(1f)
                        )
                        
                        if (isCurrentChapter) {
                            Icon(
                                Icons.Default.PlayArrow,
                                contentDescription = "Current chapter",
                                tint = MaterialTheme.colorScheme.primary
                            )
                        }
                    }
                }
            }
        }
    }
}

/**
 * Apply reader settings to HTML content
 */
private fun applyReaderStyles(content: String, settings: ReaderSettings): String {
    val backgroundColor = settings.backgroundColor
    val textColor = settings.textColor
    val fontSize = settings.fontSize
    val lineSpacing = settings.lineSpacing
    val fontFamily = getFontFamilyCSS(settings.fontFamily)
    val textAlign = settings.textAlignment.lowercase()
    val marginHorizontal = settings.marginLeft + settings.marginRight
    val marginVertical = settings.marginTop + settings.marginBottom
    
    return """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body {
                    background-color: $backgroundColor;
                    color: $textColor;
                    font-family: $fontFamily;
                    font-size: ${fontSize}px;
                    line-height: $lineSpacing;
                    text-align: $textAlign;
                    margin: ${marginVertical}px ${marginHorizontal}px;
                    padding: 0;
                    word-wrap: break-word;
                }
                p {
                    margin-bottom: ${settings.paragraphSpacing}px;
                }
                h1, h2, h3, h4, h5, h6 {
                    margin-top: ${settings.paragraphSpacing * 2}px;
                    margin-bottom: ${settings.paragraphSpacing}px;
                }
            </style>
        </head>
        <body>
            $content
        </body>
        </html>
    """.trimIndent()
}

private fun getFontFamilyCSS(fontFamily: String): String {
    return when (fontFamily.uppercase()) {
        "SERIF" -> "serif"
        "SANS_SERIF" -> "sans-serif"
        "MONOSPACE" -> "monospace"
        else -> "system-ui, -apple-system, sans-serif"
    }
}