package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
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
import androidx.compose.ui.unit.dp
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipFile
import com.github.junrar.Archive
import com.github.junrar.rarfile.FileHeader

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ComicReaderScreen(
	uriString: String,
	fileName: String,
	onBack: () -> Unit
) {
	val context = LocalContext.current
	val uri = remember(uriString) { Uri.parse(uriString) }
	val extension = remember(fileName) { fileName.substringAfterLast('.', "").lowercase() }

	var images by remember { mutableStateOf<List<File>>(emptyList()) }
	var index by remember { mutableStateOf(0) }
	var currentBitmap by remember { mutableStateOf<Bitmap?>(null) }

	LaunchedEffect(uri) {
		images = try {
			when (extension) {
				"cbz" -> extractCbzImages(context, uri)
				"cbr" -> extractCbrImages(context, uri)
				else -> emptyList()
			}
		} catch (_: Exception) { emptyList() }
		index = 0
		currentBitmap = loadBitmap(images.getOrNull(index))
	}

	Scaffold(
		topBar = {
			TopAppBar(
				title = { Text(fileName) },
				navigationIcon = {
					IconButton(onClick = onBack) { Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back") }
				}
			)
		}
	) { paddingValues ->
		Column(
			modifier = Modifier
				.fillMaxSize()
				.padding(paddingValues)
		) {
			Row(
				modifier = Modifier
					.fillMaxWidth()
					.padding(8.dp),
				horizontalArrangement = Arrangement.SpaceBetween,
				verticalAlignment = Alignment.CenterVertically
			) {
				IconButton(
					onClick = {
						if (index > 0) {
							index -= 1
							currentBitmap = loadBitmap(images.getOrNull(index))
						}
					},
					enabled = index > 0
				) { Icon(Icons.Default.NavigateBefore, contentDescription = "Prev page") }

				Text("${index + 1} / ${images.size}")

				IconButton(
					onClick = {
						if (index < images.size - 1) {
							index += 1
							currentBitmap = loadBitmap(images.getOrNull(index))
						}
					},
					enabled = index < images.size - 1
				) { Icon(Icons.Default.NavigateNext, contentDescription = "Next page") }
			}

			Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
				currentBitmap?.let { Image(bitmap = it.asImageBitmap(), contentDescription = null) }
			}
		}
	}
}

private fun extractCbzImages(context: android.content.Context, uri: Uri): List<File> {
	val tmp = copyToTempFile(context, uri, ".cbz")
	val outDir = File(context.cacheDir, "cbz_${tmp.nameWithoutExtension}").apply { mkdirs() }
	val outFiles = mutableListOf<File>()
	ZipFile(tmp).use { zip ->
		val entries = zip.entries().toList().filter { !it.isDirectory && it.name.matches(Regex(".*\\.(png|jpe?g|webp|bmp)", RegexOption.IGNORE_CASE)) }
		entries.sortedBy { it.name }.forEach { e ->
			val out = File(outDir, File(e.name).name)
			zip.getInputStream(e).use { input -> FileOutputStream(out).use { input.copyTo(it) } }
			outFiles.add(out)
		}
	}
	return outFiles
}

private fun extractCbrImages(context: android.content.Context, uri: Uri): List<File> {
	val tmp = copyToTempFile(context, uri, ".cbr")
	val outDir = File(context.cacheDir, "cbr_${tmp.nameWithoutExtension}").apply { mkdirs() }
	val outFiles = mutableListOf<File>()
	Archive(tmp).use { archive ->
		val headers: List<FileHeader> = archive.fileHeaders
		headers.filter { !it.isDirectory && it.fileNameString.matches(Regex(".*\\.(png|jpe?g|webp|bmp)", RegexOption.IGNORE_CASE)) }
			.sortedBy { it.fileNameString }
			.forEach { h ->
				val out = File(outDir, File(h.fileNameString).name)
				FileOutputStream(out).use { fos -> archive.extractFile(h, fos) }
				outFiles.add(out)
			}
	}
	return outFiles
}

private fun copyToTempFile(context: android.content.Context, uri: Uri, suffix: String): File {
	val input = context.contentResolver.openInputStream(uri) ?: throw IllegalArgumentException("No stream")
	val tmp = File.createTempFile("cf_tmp_", suffix, context.cacheDir)
	FileOutputStream(tmp).use { out -> input.copyTo(out) }
	return tmp
}

private fun loadBitmap(file: File?): Bitmap? {
	return try { file?.let { BitmapFactory.decodeFile(it.absolutePath) } } catch (_: Exception) { null }
}

