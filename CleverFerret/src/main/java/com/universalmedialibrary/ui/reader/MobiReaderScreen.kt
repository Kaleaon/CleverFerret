package com.universalmedialibrary.ui.reader

import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle

/**
 * MOBI/AZW Reader Screen
 * 
 * Displays Amazon Kindle format books (MOBI, AZW, AZW3)
 * Uses WebView for HTML rendering from extracted MOBI content
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MobiReaderScreen(
    bookFilePath: String,
    onBack: () -> Unit,
    viewModel: MobiReaderViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    
    var showControls by remember { mutableStateOf(false) }
    var showChapters by remember { mutableStateOf(false) }
    
    LaunchedEffect(bookFilePath) {
        viewModel.loadBook(bookFilePath)
    }
    
    Scaffold(
        topBar = {
            if (showControls) {
                TopAppBar(
                    title = { 
                        Text(
                            text = uiState.title ?: "MOBI Reader",
                            maxLines = 1
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = onBack) {
                            Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                        }
                    },
                    actions = {
                        IconButton(onClick = { showChapters = true }) {
                            Icon(Icons.Default.List, "Chapters")
                        }
                        IconButton(onClick = { viewModel.addBookmark() }) {
                            Icon(Icons.Default.Bookmark, "Bookmark")
                        }
                        IconButton(onClick = { viewModel.toggleSettings() }) {
                            Icon(Icons.Default.Settings, "Settings")
                        }
                    }
                )
            }
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            when {
                uiState.isLoading -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            CircularProgressIndicator()
                            Spacer(modifier = Modifier.height(16.dp))
                            Text("Loading MOBI book...")
                        }
                    }
                }
                
                uiState.error != null -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            modifier = Modifier.padding(32.dp)
                        ) {
                            Icon(
                                Icons.Default.Error,
                                contentDescription = null,
                                modifier = Modifier.size(64.dp),
                                tint = MaterialTheme.colorScheme.error
                            )
                            Spacer(modifier = Modifier.height(16.dp))
                            Text(
                                text = "Error loading MOBI file",
                                style = MaterialTheme.typography.headlineSmall,
                                fontWeight = FontWeight.Bold
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            Text(
                                text = uiState.error ?: "Unknown error",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Spacer(modifier = Modifier.height(24.dp))
                            Button(onClick = { viewModel.loadBook(bookFilePath) }) {
                                Text("Retry")
                            }
                        }
                    }
                }
                
                uiState.currentChapterHtml != null -> {
                    // WebView for rendering HTML content
                    AndroidView(
                        factory = { ctx ->
                            WebView(ctx).apply {
                                webViewClient = WebViewClient()
                                settings.javaScriptEnabled = false // Security
                                settings.builtInZoomControls = true
                                settings.displayZoomControls = false
                                settings.textZoom = uiState.fontSize
                                
                                // Apply theme
                                val bgColor = when (uiState.theme) {
                                    ReadingTheme.DAY -> "#FFFFFF"
                                    ReadingTheme.NIGHT -> "#000000"
                                    ReadingTheme.SEPIA -> "#FFF8DC"
                                }
                                
                                val textColor = when (uiState.theme) {
                                    ReadingTheme.DAY -> "#000000"
                                    ReadingTheme.NIGHT -> "#FFFFFF"
                                    ReadingTheme.SEPIA -> "#3E2723"
                                }
                                
                                val styledHtml = """
                                    <!DOCTYPE html>
                                    <html>
                                    <head>
                                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                        <style>
                                            body {
                                                background-color: $bgColor;
                                                color: $textColor;
                                                font-family: serif;
                                                font-size: ${uiState.fontSize}%;
                                                line-height: 1.6;
                                                padding: 16px;
                                                margin: 0;
                                            }
                                            img {
                                                max-width: 100%;
                                                height: auto;
                                            }
                                            p {
                                                margin: 1em 0;
                                            }
                                        </style>
                                    </head>
                                    <body>
                                        ${uiState.currentChapterHtml}
                                    </body>
                                    </html>
                                """.trimIndent()
                                
                                loadDataWithBaseURL(null, styledHtml, "text/html", "UTF-8", null)
                                
                                // Toggle controls on tap
                                setOnClickListener {
                                    showControls = !showControls
                                }
                            }
                        },
                        update = { webView ->
                            // Update when theme or fontSize changes
                            val bgColor = when (uiState.theme) {
                                ReadingTheme.DAY -> "#FFFFFF"
                                ReadingTheme.NIGHT -> "#000000"
                                ReadingTheme.SEPIA -> "#FFF8DC"
                            }
                            
                            val textColor = when (uiState.theme) {
                                ReadingTheme.DAY -> "#000000"
                                ReadingTheme.NIGHT -> "#FFFFFF"
                                ReadingTheme.SEPIA -> "#3E2723"
                            }
                            
                            webView.settings.textZoom = uiState.fontSize
                            
                            val styledHtml = """
                                <!DOCTYPE html>
                                <html>
                                <head>
                                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                    <style>
                                        body {
                                            background-color: $bgColor;
                                            color: $textColor;
                                            font-family: serif;
                                            font-size: ${uiState.fontSize}%;
                                            line-height: 1.6;
                                            padding: 16px;
                                            margin: 0;
                                        }
                                        img {
                                            max-width: 100%;
                                            height: auto;
                                        }
                                        p {
                                            margin: 1em 0;
                                        }
                                    </style>
                                </head>
                                <body>
                                    ${uiState.currentChapterHtml}
                                </body>
                                </html>
                            """.trimIndent()
                            
                            webView.loadDataWithBaseURL(null, styledHtml, "text/html", "UTF-8", null)
                        },
                        modifier = Modifier.fillMaxSize()
                    )
                    
                    // Navigation buttons (bottom)
                    if (showControls && uiState.chapters.size > 1) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .align(Alignment.BottomCenter)
                                .background(MaterialTheme.colorScheme.surface.copy(alpha = 0.95f))
                                .padding(16.dp),
                            horizontalArrangement = Arrangement.SpaceEvenly
                        ) {
                            Button(
                                onClick = { viewModel.previousChapter() },
                                enabled = uiState.currentChapterIndex > 0
                            ) {
                                Icon(Icons.Default.NavigateBefore, "Previous")
                                Spacer(modifier = Modifier.width(4.dp))
                                Text("Previous")
                            }
                            
                            Text(
                                text = "${uiState.currentChapterIndex + 1} / ${uiState.chapters.size}",
                                modifier = Modifier.align(Alignment.CenterVertically),
                                style = MaterialTheme.typography.bodyLarge,
                                fontWeight = FontWeight.Medium
                            )
                            
                            Button(
                                onClick = { viewModel.nextChapter() },
                                enabled = uiState.currentChapterIndex < uiState.chapters.size - 1
                            ) {
                                Text("Next")
                                Spacer(modifier = Modifier.width(4.dp))
                                Icon(Icons.Default.NavigateNext, "Next")
                            }
                        }
                    }
                }
            }
            
            // Chapter list dialog
            if (showChapters) {
                AlertDialog(
                    onDismissRequest = { showChapters = false },
                    title = { Text("Chapters") },
                    text = {
                        Box(modifier = Modifier.heightIn(max = 400.dp)) {
                            LazyColumn {
                                items(uiState.chapters) { chapter ->
                                    val index = uiState.chapters.indexOf(chapter)
                                    TextButton(
                                        onClick = {
                                            viewModel.goToChapter(index)
                                            showChapters = false
                                        },
                                        modifier = Modifier.fillMaxWidth()
                                    ) {
                                        Row(
                                            modifier = Modifier.fillMaxWidth(),
                                            horizontalArrangement = Arrangement.SpaceBetween
                                        ) {
                                            Text(
                                                text = chapter.title,
                                                color = if (index == uiState.currentChapterIndex)
                                                    MaterialTheme.colorScheme.primary
                                                else
                                                    MaterialTheme.colorScheme.onSurface
                                            )
                                            if (index == uiState.currentChapterIndex) {
                                                Icon(
                                                    Icons.Default.PlayArrow,
                                                    contentDescription = "Current",
                                                    tint = MaterialTheme.colorScheme.primary
                                                )
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    },
                    confirmButton = {
                        TextButton(onClick = { showChapters = false }) {
                            Text("Close")
                        }
                    }
                )
            }
        }
    }
}

enum class ReadingTheme {
    DAY, NIGHT, SEPIA
}
