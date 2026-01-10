package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import android.graphics.pdf.PdfRenderer
import android.net.Uri
import android.os.ParcelFileDescriptor
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.gestures.rememberTransformableState
import androidx.compose.foundation.gestures.transformable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.NavigateBefore
import androidx.compose.material.icons.automirrored.filled.NavigateNext
import androidx.compose.material.icons.filled.CenterFocusWeak
import androidx.compose.material.icons.filled.FitScreen
import androidx.compose.material.icons.filled.ZoomIn
import androidx.compose.material.icons.filled.ZoomOut
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DocumentReaderScreen(
    uriString: String,
    fileName: String,
    onBack: () -> Unit
) {
    val context = LocalContext.current
    val uri = remember(uriString) { Uri.parse(uriString) }
    val extension = remember(fileName) { fileName.substringAfterLast('.', "").lowercase() }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(fileName) },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
    when (extension) {
                "pdf" -> PdfReaderView(uri)
                "txt" -> TextReaderView(uri)
                "html", "htm" -> HtmlReaderView(uri)
            "docx" -> DocxReaderView(uri)
                else -> UnsupportedDocumentView(extension)
            }
        }
    }
}

@Composable
private fun TextReaderView(uri: Uri) {
    val context = LocalContext.current
    var text by remember(uri) { mutableStateOf("") }

    LaunchedEffect(uri) {
        text = try {
            context.contentResolver.openInputStream(uri)?.use { it.readBytes().toString(Charsets.UTF_8) } ?: ""
        } catch (e: Exception) { 
            android.util.Log.w("DocumentReader", "Failed to read text document", e)
            "" 
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(16.dp)
    ) {
        Text(text = text)
    }
}

@Composable
private fun HtmlReaderView(uri: Uri) {
    var webView by remember { mutableStateOf<android.webkit.WebView?>(null) }
    
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
    
    AndroidView(
        factory = { ctx ->
            android.webkit.WebView(ctx).apply {
                settings.javaScriptEnabled = false
                loadUrl(uri.toString())
                webView = this
            }
        },
        modifier = Modifier.fillMaxSize()
    )
}

@Composable
private fun UnsupportedDocumentView(extension: String) {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = "Unsupported document type: .$extension\nTry converting to PDF/DOCX.",
            style = MaterialTheme.typography.bodyLarge,
            textAlign = TextAlign.Center
        )
    }
}

@Composable
private fun DocxReaderView(uri: Uri) {
    // Minimal DOCX text extractor: unzip and parse word/document.xml, collecting <w:t> text nodes
    val context = LocalContext.current
    var text by remember(uri) { mutableStateOf("Loading...") }

    LaunchedEffect(uri) {
        text = try {
            val tmp = copyToTempFile(context, uri, ".docx")
            val sb = StringBuilder()
            java.util.zip.ZipFile(tmp).use { zip ->
                val entry = zip.getEntry("word/document.xml")
                if (entry != null) {
                    zip.getInputStream(entry).bufferedReader(Charsets.UTF_8).use { r ->
                        val xml = r.readText()
                        // Naive XML extraction: get text between <w:t>...</w:t>
                        val regex = "<w:t[^>]*>(.*?)</w:t>".toRegex(RegexOption.DOT_MATCHES_ALL)
                        regex.findAll(xml).forEach { m -> sb.append(m.groupValues[1]) }
                    }
                } else {
                    sb.append("(No document.xml found)")
                }
            }
            sb.toString()
        } catch (e: Exception) {
            "Failed to open DOCX: ${e.message}"
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(16.dp)
    ) {
        Text(text = text)
    }
}

private fun copyToTempFile(context: android.content.Context, uri: Uri, suffix: String): File {
    val input: InputStream = context.contentResolver.openInputStream(uri) ?: throw IllegalArgumentException("No stream")
    val tmp = File.createTempFile("cf_tmp_", suffix, context.cacheDir)
    FileOutputStream(tmp).use { out -> input.copyTo(out) }
    return tmp
}

@Composable
private fun PdfReaderView(uri: Uri) {
    val context = LocalContext.current
    var renderer by remember { mutableStateOf<PdfRenderer?>(null) }
    var pfd by remember { mutableStateOf<ParcelFileDescriptor?>(null) }
    var currentPageIndex by remember { mutableStateOf(0) }
    var pageCount by remember { mutableStateOf(0) }
    var bitmap by remember { mutableStateOf<Bitmap?>(null) }
    
    // Zoom and pan state
    var scale by remember { mutableFloatStateOf(1f) }
    var offsetX by remember { mutableFloatStateOf(0f) }
    var offsetY by remember { mutableFloatStateOf(0f) }
    var showControls by remember { mutableStateOf(true) }
    
    // Render quality multiplier for zoom
    var renderScale by remember { mutableFloatStateOf(2f) }
    
    val configuration = LocalConfiguration.current
    val screenWidth = configuration.screenWidthDp.dp
    val screenHeight = configuration.screenHeightDp.dp
    
    // Transform state for pinch-to-zoom
    val transformableState = rememberTransformableState { zoomChange, panChange, _ ->
        scale = (scale * zoomChange).coerceIn(0.5f, 5f)
        offsetX += panChange.x
        offsetY += panChange.y
    }

    DisposableEffect(uri) {
        val descriptor: ParcelFileDescriptor? = tryOpenPfd(context, uri)
        pfd = descriptor
        if (descriptor != null) {
            renderer = PdfRenderer(descriptor)
            pageCount = renderer?.pageCount ?: 0
            renderToBitmapHighQuality(renderer, currentPageIndex, renderScale) { bmp -> bitmap = bmp }
        }
        onDispose {
            try { renderer?.close() } catch (e: Exception) { 
                android.util.Log.w("PdfReader", "Error closing PDF renderer", e)
            }
            try { pfd?.close() } catch (e: Exception) { 
                android.util.Log.w("PdfReader", "Error closing file descriptor", e)
            }
        }
    }
    
    // Re-render at higher quality when zoom increases
    LaunchedEffect(scale) {
        val newRenderScale = when {
            scale > 3f -> 4f
            scale > 2f -> 3f
            scale > 1f -> 2f
            else -> 2f
        }
        if (newRenderScale != renderScale) {
            renderScale = newRenderScale
            renderToBitmapHighQuality(renderer, currentPageIndex, renderScale) { bmp -> bitmap = bmp }
        }
    }

    Column(modifier = Modifier.fillMaxSize()) {
        // Top controls - always visible
        AnimatedVisibility(
            visible = showControls,
            enter = fadeIn() + slideInVertically(),
            exit = fadeOut() + slideOutVertically()
        ) {
            Surface(
                modifier = Modifier.fillMaxWidth(),
                color = MaterialTheme.colorScheme.surface,
                tonalElevation = 2.dp
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 8.dp, vertical = 4.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Previous page
                    IconButton(
                        onClick = {
                            if (currentPageIndex > 0) {
                                currentPageIndex -= 1
                                scale = 1f
                                offsetX = 0f
                                offsetY = 0f
                                renderToBitmapHighQuality(renderer, currentPageIndex, renderScale) { bmp -> bitmap = bmp }
                            }
                        },
                        enabled = currentPageIndex > 0
                    ) { 
                        Icon(
                            Icons.AutoMirrored.Filled.NavigateBefore, 
                            contentDescription = "Previous page",
                            modifier = Modifier.size(28.dp)
                        ) 
                    }

                    // Page indicator
                    Surface(
                        shape = RoundedCornerShape(8.dp),
                        color = MaterialTheme.colorScheme.primaryContainer
                    ) {
                        Text(
                            text = "Page ${currentPageIndex + 1} of $pageCount",
                            style = MaterialTheme.typography.titleMedium,
                            modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp)
                        )
                    }

                    // Next page
                    IconButton(
                        onClick = {
                            if (currentPageIndex < pageCount - 1) {
                                currentPageIndex += 1
                                scale = 1f
                                offsetX = 0f
                                offsetY = 0f
                                renderToBitmapHighQuality(renderer, currentPageIndex, renderScale) { bmp -> bitmap = bmp }
                            }
                        },
                        enabled = currentPageIndex < pageCount - 1
                    ) { 
                        Icon(
                            Icons.AutoMirrored.Filled.NavigateNext, 
                            contentDescription = "Next page",
                            modifier = Modifier.size(28.dp)
                        ) 
                    }
                }
            }
        }

        // PDF content with zoom/pan
        Box(
            modifier = Modifier
                .weight(1f)
                .fillMaxWidth()
                .background(MaterialTheme.colorScheme.surfaceVariant)
                .pointerInput(Unit) {
                    detectTapGestures(
                        onTap = { showControls = !showControls },
                        onDoubleTap = { offset ->
                            // Double tap to zoom in/out
                            scale = if (scale > 1.5f) 1f else 2.5f
                            if (scale == 1f) {
                                offsetX = 0f
                                offsetY = 0f
                            }
                        }
                    )
                }
                .transformable(state = transformableState),
            contentAlignment = Alignment.Center
        ) {
            bitmap?.let { bmp ->
                Image(
                    bitmap = bmp.asImageBitmap(), 
                    contentDescription = "PDF page ${currentPageIndex + 1}",
                    modifier = Modifier
                        .fillMaxSize()
                        .graphicsLayer(
                            scaleX = scale,
                            scaleY = scale,
                            translationX = offsetX,
                            translationY = offsetY
                        ),
                    contentScale = ContentScale.Fit
                )
            } ?: run {
                CircularProgressIndicator()
            }
        }
        
        // Bottom zoom controls - always visible
        AnimatedVisibility(
            visible = showControls,
            enter = fadeIn() + slideInVertically(initialOffsetY = { it }),
            exit = fadeOut() + slideOutVertically(targetOffsetY = { it })
        ) {
            Surface(
                modifier = Modifier.fillMaxWidth(),
                color = MaterialTheme.colorScheme.surface,
                tonalElevation = 2.dp
            ) {
                Column(
                    modifier = Modifier.padding(8.dp)
                ) {
                    // Page slider
                    if (pageCount > 1) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "1",
                                style = MaterialTheme.typography.bodySmall,
                                modifier = Modifier.padding(horizontal = 4.dp)
                            )
                            
                            Slider(
                                value = (currentPageIndex + 1).toFloat(),
                                onValueChange = { value ->
                                    val newIndex = (value.toInt() - 1).coerceIn(0, pageCount - 1)
                                    if (newIndex != currentPageIndex) {
                                        currentPageIndex = newIndex
                                        scale = 1f
                                        offsetX = 0f
                                        offsetY = 0f
                                        renderToBitmapHighQuality(renderer, currentPageIndex, renderScale) { bmp -> bitmap = bmp }
                                    }
                                },
                                valueRange = 1f..pageCount.coerceAtLeast(1).toFloat(),
                                steps = (pageCount - 2).coerceAtLeast(0),
                                modifier = Modifier.weight(1f)
                            )
                            
                            Text(
                                text = pageCount.toString(),
                                style = MaterialTheme.typography.bodySmall,
                                modifier = Modifier.padding(horizontal = 4.dp)
                            )
                        }
                    }
                    
                    // Zoom controls
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.Center,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        // Zoom out
                        FilledTonalIconButton(
                            onClick = { scale = (scale - 0.25f).coerceAtLeast(0.5f) },
                            enabled = scale > 0.5f,
                            modifier = Modifier.size(44.dp)
                        ) {
                            Icon(
                                Icons.Default.ZoomOut, 
                                contentDescription = "Zoom Out",
                                modifier = Modifier.size(24.dp)
                            )
                        }
                        
                        Spacer(modifier = Modifier.width(8.dp))
                        
                        // Zoom level indicator
                        Surface(
                            shape = RoundedCornerShape(8.dp),
                            color = MaterialTheme.colorScheme.surfaceVariant
                        ) {
                            Text(
                                text = "${(scale * 100).toInt()}%",
                                style = MaterialTheme.typography.titleMedium,
                                modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp)
                            )
                        }
                        
                        Spacer(modifier = Modifier.width(8.dp))
                        
                        // Zoom in
                        FilledTonalIconButton(
                            onClick = { scale = (scale + 0.25f).coerceAtMost(5f) },
                            enabled = scale < 5f,
                            modifier = Modifier.size(44.dp)
                        ) {
                            Icon(
                                Icons.Default.ZoomIn, 
                                contentDescription = "Zoom In",
                                modifier = Modifier.size(24.dp)
                            )
                        }
                        
                        Spacer(modifier = Modifier.width(8.dp))
                        
                        // Reset zoom
                        FilledTonalIconButton(
                            onClick = { 
                                scale = 1f
                                offsetX = 0f
                                offsetY = 0f
                            },
                            modifier = Modifier.size(44.dp)
                        ) {
                            Icon(
                                Icons.Default.CenterFocusWeak, 
                                contentDescription = "Reset Zoom",
                                modifier = Modifier.size(24.dp)
                            )
                        }
                        
                        Spacer(modifier = Modifier.width(8.dp))
                        
                        // Fit width
                        FilledTonalIconButton(
                            onClick = { 
                                scale = 1f
                                offsetX = 0f
                                offsetY = 0f
                            },
                            modifier = Modifier.size(44.dp)
                        ) {
                            Icon(
                                Icons.Default.FitScreen, 
                                contentDescription = "Fit Width",
                                modifier = Modifier.size(24.dp)
                            )
                        }
                    }
                }
            }
        }
    }
}

private fun tryOpenPfd(context: android.content.Context, uri: Uri): ParcelFileDescriptor? {
    return try {
        // Try open directly
        context.contentResolver.openFileDescriptor(uri, "r")
    } catch (e: Exception) {
        android.util.Log.d("PdfReader", "Direct open failed, trying cache fallback", e)
        // Fallback: copy to cache file
        try {
            val input: InputStream = context.contentResolver.openInputStream(uri) ?: return null
            val cache = File.createTempFile("cf_tmp_", ".pdf", context.cacheDir)
            FileOutputStream(cache).use { out -> input.copyTo(out) }
            ParcelFileDescriptor.open(cache, ParcelFileDescriptor.MODE_READ_ONLY)
        } catch (e2: Exception) { 
            android.util.Log.w("PdfReader", "Cache fallback also failed", e2)
            null 
        }
    }
}

private fun renderToBitmap(renderer: PdfRenderer?, index: Int, onRendered: (Bitmap?) -> Unit) {
    try {
        val page = renderer?.openPage(index) ?: return onRendered(null)
        val bmp = Bitmap.createBitmap(page.width, page.height, Bitmap.Config.ARGB_8888)
        page.render(bmp, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY)
        page.close()
        onRendered(bmp)
    } catch (e: Exception) { 
        android.util.Log.w("PdfReader", "Failed to render PDF page $index", e)
        onRendered(null) 
    }
}
