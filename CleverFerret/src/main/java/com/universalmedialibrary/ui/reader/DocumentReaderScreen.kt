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
import androidx.compose.material.icons.filled.NavigateBefore
import androidx.compose.material.icons.filled.NavigateNext
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
		} catch (_: Exception) { "" }
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
	AndroidView(
		factory = { ctx ->
			android.webkit.WebView(ctx).apply {
				settings.javaScriptEnabled = false
				loadUrl(uri.toString())
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
			text = "Unsupported document type: .$extension",
			style = MaterialTheme.typography.bodyLarge,
			textAlign = TextAlign.Center
		)
	}
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
			) { Icon(Icons.Default.NavigateBefore, contentDescription = "Prev page") }

			Text("${currentPageIndex + 1} / ${pageCount}")

			IconButton(
				onClick = {
					if (currentPageIndex < pageCount - 1) {
						currentPageIndex += 1
						renderToBitmap(renderer, currentPageIndex) { bmp -> bitmap = bmp }
					}
				},
				enabled = currentPageIndex < pageCount - 1
			) { Icon(Icons.Default.NavigateNext, contentDescription = "Next page") }
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

