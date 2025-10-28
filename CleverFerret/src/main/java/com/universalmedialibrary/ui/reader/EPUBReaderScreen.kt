package com.universalmedialibrary.ui.reader

import android.net.Uri
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.*
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
// import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import kotlinx.coroutines.launch
import androidx.compose.foundation.clickable
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed

/**
 * EPUB Reader Screen with full WebView rendering
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EPUBReaderScreen(
    navController: NavController,
    bookUri: String
    // viewModel: EPUBReaderViewModel = hiltViewModel()  // Temporarily disabled
) {
    val context = LocalContext.current
    // Local reader state (standalone, no ViewModel dependency)
    var readerState by remember {
        mutableStateOf(
            EpubReaderState(
                bookTitle = "",
                bookAuthor = "",
                isLoaded = false,
                isBookmarked = false,
                currentChapter = 0,
                totalChapters = 0,
                error = null,
                currentContent = "",
                chapters = emptyList()
            )
        )
    }
    var uiSettings by remember { mutableStateOf(ReaderSettings()) }
    val scope = rememberCoroutineScope()

    var showToc by remember { mutableStateOf(false) }
    var showSettings by remember { mutableStateOf(false) }
    var showSearch by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }

    // WebView reference for JavaScript interaction
    var webView by remember { mutableStateOf<WebView?>(null) }

    // Clean up WebView to prevent memory leaks
    DisposableEffect(Unit) {
        onDispose {
            webView?.apply {
                loadUrl("about:blank")
                clearHistory()
                clearCache(true)
                removeAllViews()
                destroy()
            }
            webView = null
        }
    }

    LaunchedEffect(bookUri) {
        // Minimal inline loader stub; replace with real VM/service call when ready
        // For now we mark as loaded and set placeholder content
        readerState = readerState.copy(
            bookTitle = Uri.parse(bookUri).lastPathSegment ?: "Book",
            bookAuthor = "",
            isLoaded = true,
            totalChapters = 10,
            currentChapter = 0,
            currentContent = "<h1>Chapter 1</h1><p>Sample EPUB content preview.</p>",
            chapters = (1..10).map { "Chapter $it" }
        )
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text(
                            text = readerState.bookTitle,
                            style = MaterialTheme.typography.titleMedium,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                        if (readerState.bookAuthor.isNotEmpty()) {
                            Text(
                                text = readerState.bookAuthor,
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showSearch = true }) {
                        Icon(Icons.Default.Search, contentDescription = "Search")
                    }
                    IconButton(onClick = { showToc = true }) {
                        Icon(Icons.AutoMirrored.Filled.List, contentDescription = "Table of Contents")
                    }
                    IconButton(onClick = { showSettings = true }) {
                        Icon(Icons.Default.Settings, contentDescription = "Settings")
                    }
                    IconButton(onClick = {
                        readerState = readerState.copy(isBookmarked = !readerState.isBookmarked)
                    }) {
                        Icon(
                            if (readerState.isBookmarked) Icons.Default.Bookmark
                            else Icons.Default.BookmarkBorder,
                            contentDescription = "Bookmark"
                        )
                    }
                }
            )
        },
        bottomBar = {
            if (readerState.isLoaded) {
                BottomAppBar(
                    modifier = Modifier.height(64.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(
                            onClick = {
                                if (readerState.currentChapter > 0) {
                                    val newIndex = readerState.currentChapter - 1
                                    readerState = readerState.copy(
                                        currentChapter = newIndex,
                                        currentContent = "<h1>${readerState.chapters.getOrNull(newIndex) ?: "Chapter"}</h1><p>Sample content.</p>"
                                    )
                                }
                            },
                            enabled = readerState.currentChapter > 0
                        ) {
                            Icon(Icons.Default.SkipPrevious, contentDescription = "Previous Chapter")
                        }

                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            modifier = Modifier.weight(1f)
                        ) {
                            Text(
                                text = "Chapter ${readerState.currentChapter + 1} of ${readerState.totalChapters}",
                                style = MaterialTheme.typography.bodyMedium
                            )
                            LinearProgressIndicator(
                                progress = {
                                    if (readerState.totalChapters > 0) {
                                        (readerState.currentChapter + 1).toFloat() / readerState.totalChapters
                                    } else 0f
                                },
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(horizontal = 16.dp, vertical = 4.dp)
                            )
                        }

                        IconButton(
                            onClick = {
                                if (readerState.currentChapter < readerState.totalChapters - 1) {
                                    val newIndex = readerState.currentChapter + 1
                                    readerState = readerState.copy(
                                        currentChapter = newIndex,
                                        currentContent = "<h1>${readerState.chapters.getOrNull(newIndex) ?: "Chapter"}</h1><p>Sample content.</p>"
                                    )
                                }
                            },
                            enabled = readerState.currentChapter < readerState.totalChapters - 1
                        ) {
                            Icon(Icons.Default.SkipNext, contentDescription = "Next Chapter")
                        }
                    }
                }
            }
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            when {
                readerState.error != null -> {
                    ErrorContent(
                        error = readerState.error ?: "Unknown error",
                        onRetry = {
                            // Simple retry: re-trigger LaunchedEffect by updating settings
                            readerState = readerState.copy(error = null, isLoaded = true)
                        }
                    )
                }
                !readerState.isLoaded -> {
                    LoadingContent()
                }
                else -> {
                    // WebView for EPUB content
                    AndroidView(
                        factory = { context ->
                            WebView(context).apply {
                                webViewClient = EPUBWebViewClient()
                                settings.apply {
                                    // Security hardening - disable JS and file access
                                    javaScriptEnabled = false
                                    allowFileAccess = false
                                    allowFileAccessFromFileURLs = false
                                    allowUniversalAccessFromFileURLs = false
                                    allowContentAccess = false

                                    // Display settings
                                    domStorageEnabled = false
                                    setSupportZoom(true)
                                    builtInZoomControls = true
                                    displayZoomControls = false
                                    loadWithOverviewMode = true
                                    useWideViewPort = true

                                    // Additional security
                                    mixedContentMode = android.webkit.WebSettings.MIXED_CONTENT_NEVER_ALLOW
                                    safeBrowsingEnabled = true
                                }
                                webView = this
                            }
                        },
                        update = { view ->
                            // Load current chapter content with styling
                            val htmlContent = buildHTMLContent(
                                readerState.currentContent,
                                uiSettings
                            )
                            view.loadDataWithBaseURL(
                                null,
                                htmlContent,
                                "text/html",
                                "UTF-8",
                                null
                            )
                        },
                        modifier = Modifier.fillMaxSize()
                    )
                }
            }
        }
    }

    // Table of Contents Dialog
    if (showToc) {
        TableOfContentsDialog(
            chapters = readerState.chapters,
            currentChapter = readerState.currentChapter,
            onChapterSelected = { index ->
                readerState = readerState.copy(
                    currentChapter = index,
                    currentContent = "<h1>${readerState.chapters.getOrNull(index) ?: "Chapter"}</h1><p>Sample content.</p>"
                )
                showToc = false
            },
            onDismiss = { showToc = false }
        )
    }

    // Settings Dialog
    if (showSettings) {
        ReaderSettingsDialog(
            settings = uiSettings,
            onSettingsChanged = { uiSettings = it },
            onDismiss = { showSettings = false }
        )
    }

    // Search Dialog
    if (showSearch) {
        SearchDialog(
            query = searchQuery,
            onQueryChange = { searchQuery = it },
            onSearch = {
                // No-op search placeholder
                showSearch = false
            },
            onDismiss = { showSearch = false }
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
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            CircularProgressIndicator()
            Spacer(modifier = Modifier.height(16.dp))
            Text("Loading EPUB...")
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
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                Icons.Default.ErrorOutline,
                contentDescription = "Error",
                modifier = Modifier.size(48.dp),
                tint = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = error,
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.height(16.dp))
            Button(onClick = onRetry) {
                Text("Retry")
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun TableOfContentsDialog(
    chapters: List<String>,
    currentChapter: Int,
    onChapterSelected: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Table of Contents") },
        text = {
            LazyColumn {
                itemsIndexed(chapters) { index, chapter ->
                    ListItem(
                        headlineContent = {
                            Text(
                                chapter,
                                color = if (index == currentChapter)
                                    MaterialTheme.colorScheme.primary
                                else
                                    MaterialTheme.colorScheme.onSurface
                            )
                        },
                        modifier = Modifier.clickable { onChapterSelected(index) }
                    )
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}

@Composable
private fun ReaderSettingsDialog(
    settings: ReaderSettings,
    onSettingsChanged: (ReaderSettings) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Reader Settings") },
        text = {
            Column {
                // Font Size
                Text("Font Size")
                Slider(
                    value = settings.fontSize.toFloat(),
                    onValueChange = {
                        onSettingsChanged(settings.copy(fontSize = it.toInt()))
                    },
                    valueRange = 12f..32f,
                    steps = 19
                )

                // Line Height
                Text("Line Height")
                Slider(
                    value = settings.lineHeight,
                    onValueChange = {
                        onSettingsChanged(settings.copy(lineHeight = it))
                    },
                    valueRange = 1.0f..2.0f,
                    steps = 9
                )

                // Theme
                Text("Theme")
                Row {
                    FilterChip(
                        selected = settings.theme == "light",
                        onClick = { onSettingsChanged(settings.copy(theme = "light")) },
                        label = { Text("Light") }
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    FilterChip(
                        selected = settings.theme == "dark",
                        onClick = { onSettingsChanged(settings.copy(theme = "dark")) },
                        label = { Text("Dark") }
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    FilterChip(
                        selected = settings.theme == "sepia",
                        onClick = { onSettingsChanged(settings.copy(theme = "sepia")) },
                        label = { Text("Sepia") }
                    )
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Done")
            }
        }
    )
}

@Composable
private fun SearchDialog(
    query: String,
    onQueryChange: (String) -> Unit,
    onSearch: () -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Search in Book") },
        text = {
            OutlinedTextField(
                value = query,
                onValueChange = onQueryChange,
                label = { Text("Search text") },
                singleLine = true
            )
        },
        confirmButton = {
            TextButton(onClick = onSearch) {
                Text("Search")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

private class EPUBWebViewClient : WebViewClient() {
    override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
        // Handle internal navigation
        return false
    }
}

private fun buildHTMLContent(
    content: String,
    settings: ReaderSettings
): String {
    val backgroundColor = when (settings.theme) {
        "dark" -> "#1a1a1a"
        "sepia" -> "#f4ecd8"
        else -> "#ffffff"
    }

    val textColor = when (settings.theme) {
        "dark" -> "#e0e0e0"
        "sepia" -> "#5c4b37"
        else -> "#000000"
    }

    return """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body {
                    font-family: ${settings.fontFamily};
                    font-size: ${settings.fontSize}px;
                    line-height: ${settings.lineHeight};
                    background-color: $backgroundColor;
                    color: $textColor;
                    padding: 20px;
                    margin: 0;
                    text-align: justify;
                }
                p {
                    margin: 0 0 1em 0;
                }
                h1, h2, h3, h4, h5, h6 {
                    margin: 1em 0 0.5em 0;
                    font-weight: bold;
                }
                img {
                    max-width: 100%;
                    height: auto;
                }
                a {
                    color: #4a90e2;
                }
            </style>
        </head>
        <body>
            $content
        </body>
        </html>
    """.trimIndent()
}

data class EpubReaderState(
    val bookTitle: String = "",
    val bookAuthor: String = "",
    val isLoaded: Boolean = false,
    val isBookmarked: Boolean = false,
    val currentChapter: Int = 0,
    val totalChapters: Int = 0,
    val error: String? = null,
    val currentContent: String = "",
    val chapters: List<String> = emptyList()
)

data class ReaderSettings(
    val fontSize: Int = 16,
    val lineHeight: Float = 1.5f,
    val fontFamily: String = "serif",
    val theme: String = "light",
    val marginHorizontal: Int = 20,
    val marginVertical: Int = 20
)
