package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import android.graphics.pdf.PdfRenderer
import android.net.Uri
import android.os.ParcelFileDescriptor
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.NavigateBefore
import androidx.compose.material.icons.automirrored.filled.NavigateNext
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
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
    var currentPageIndex by remember { mutableStateOf(0) }
    var pageCount by remember { mutableStateOf(0) }
    var bitmap by remember { mutableStateOf<Bitmap?>(null) }

    DisposableEffect(uri) {
        val pfd: ParcelFileDescriptor? = tryOpenPfd(context, uri)
        if (pfd != null) {
            renderer = PdfRenderer(pfd)
            pageCount = renderer?.pageCount ?: 0
            renderToBitmap(renderer, currentPageIndex) { bmp -> bitmap = bmp }
        }
        onDispose {
            try { renderer?.close() } catch (_: Exception) {}
            try { pfd?.close() } catch (_: Exception) {}
        }
    }

    Column(modifier = Modifier.fillMaxSize()) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(8.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(
                onClick = {
                    if (currentPageIndex > 0) {
                        currentPageIndex -= 1
                        renderToBitmap(renderer, currentPageIndex) { bmp -> bitmap = bmp }
                    }
                },
                enabled = currentPageIndex > 0
            ) { Icon(Icons.AutoMirrored.Filled.NavigateBefore, contentDescription = "Prev page") }

            Text("${currentPageIndex + 1} / ${pageCount}")

            IconButton(
                onClick = {
                    if (currentPageIndex < pageCount - 1) {
                        currentPageIndex += 1
                        renderToBitmap(renderer, currentPageIndex) { bmp -> bitmap = bmp }
                    }
                },
                enabled = currentPageIndex < pageCount - 1
            ) { Icon(Icons.AutoMirrored.Filled.NavigateNext, contentDescription = "Next page") }
        }

        Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
            bitmap?.let { Image(bitmap = it.asImageBitmap(), contentDescription = null) }
        }
    }
}

private fun tryOpenPfd(context: android.content.Context, uri: Uri): ParcelFileDescriptor? {
    return try {
        // Try open directly
        context.contentResolver.openFileDescriptor(uri, "r")
    } catch (_: Exception) {
        // Fallback: copy to cache file
        try {
            val input: InputStream = context.contentResolver.openInputStream(uri) ?: return null
            val cache = File.createTempFile("cf_tmp_", ".pdf", context.cacheDir)
            FileOutputStream(cache).use { out -> input.copyTo(out) }
            ParcelFileDescriptor.open(cache, ParcelFileDescriptor.MODE_READ_ONLY)
        } catch (_: Exception) { null }
    }
}

private fun renderToBitmap(renderer: PdfRenderer?, index: Int, onRendered: (Bitmap?) -> Unit) {
    try {
        val page = renderer?.openPage(index) ?: return onRendered(null)
        val bmp = Bitmap.createBitmap(page.width, page.height, Bitmap.Config.ARGB_8888)
        page.render(bmp, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY)
        page.close()
        onRendered(bmp)
    } catch (_: Exception) { onRendered(null) }
}
