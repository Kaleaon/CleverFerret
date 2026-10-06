package com.universalmedialibrary.ui.modern.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.util.Log
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.NavigateBefore
import androidx.compose.material.icons.automirrored.filled.NavigateNext
import androidx.compose.material.icons.filled.Warning
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.github.junrar.Archive
import com.github.junrar.rarfile.FileHeader
import com.universalmedialibrary.ui.media.components.MediaPosterCardSkeleton
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.domain.ModernUiState
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.reader.ComicReaderViewModel
import com.universalmedialibrary.ui.settings.SettingsViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipFile

private data class ExtractedComic(
    val imageFiles: List<File> = emptyList(),
    val cleanupDir: File? = null
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ModernComicReaderScreen(
    uriString: String,
    fileName: String,
    onBack: () -> Unit,
    onPickFile: (() -> Unit)? = null,
    settingsViewModel: SettingsViewModel = hiltViewModel(),
    comicReaderViewModel: ComicReaderViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    val uri = remember(uriString) { Uri.parse(uriString) }
    val extension = remember(fileName) { fileName.substringAfterLast('.', "").lowercase() }

    var extractedComic by remember { mutableStateOf(ExtractedComic()) }
    var pageIndex by remember { mutableStateOf(0) }
    var currentBitmap by remember { mutableStateOf<Bitmap?>(null) }
    var translationsJson by remember { mutableStateOf<String?>(null) }

    var uiState by remember { mutableStateOf<ModernUiState<List<File>>>(ModernUiState.Loading) }

    // Clean up resources on exit
    DisposableEffect(Unit) {
        onDispose {
            currentBitmap?.recycle()
            currentBitmap = null
            extractedComic.cleanupDir?.deleteRecursively()
        }
    }

    LaunchedEffect(uri) {
        uiState = ModernUiState.Loading
        withContext(Dispatchers.IO) {
            try {
                val extracted = when (extension) {
                    "cbz", "zip" -> extractCbzImages(context, uri)
                    "cbr", "rar" -> extractCbrImages(context, uri)
                    else -> ExtractedComic()
                }
                extractedComic = extracted
                pageIndex = 0
                if (extracted.imageFiles.isEmpty()) {
                    uiState = ModernUiState.Empty
                } else {
                    currentBitmap?.recycle()
                    currentBitmap = loadBitmap(extracted.imageFiles.getOrNull(pageIndex))
                    uiState = ModernUiState.Success(extracted.imageFiles)
                }
            } catch (e: Exception) {
                Log.w("ModernComicReader", "Failed to extract comic images", e)
                uiState = ModernUiState.Error(e.message ?: "Failed to extract comic archive")
            }
        }
    }

    Scaffold(
        topBar = {
            CFTopBar(
                title = fileName,
                onBack = onBack
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            when (val state = uiState) {
                is ModernUiState.Loading -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(CFSpacing.md)
                        ) {
                            MediaPosterCardSkeleton(width = 160.dp)
                            Text(
                                "Extracting comic pages...",
                                style = MaterialTheme.typography.titleMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            CircularProgressIndicator()
                        }
                    }
                }
                is ModernUiState.Empty -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CFEmptyState(
                            icon = Icons.Default.Warning,
                            title = "Unable to Read Comic",
                            body = "No supported image pages found in '$fileName'.",
                            actionLabel = if (onPickFile != null) "Select File" else "Go Back",
                            onAction = { onPickFile?.invoke() ?: onBack() }
                        )
                    }
                }
                is ModernUiState.Error -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CFEmptyState(
                            icon = Icons.Default.Warning,
                            title = "Failed to Read Comic",
                            body = state.message,
                            actionLabel = if (onPickFile != null) "Select File" else "Go Back",
                            onAction = { onPickFile?.invoke() ?: onBack() }
                        )
                    }
                }
                is ModernUiState.Success -> {
                    val files = state.data
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(CFSpacing.sm),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(
                            onClick = {
                                if (pageIndex > 0) {
                                    pageIndex -= 1
                                    currentBitmap?.recycle()
                                    currentBitmap = loadBitmap(files.getOrNull(pageIndex))
                                }
                            },
                            enabled = pageIndex > 0
                        ) {
                            Icon(
                                Icons.AutoMirrored.Filled.NavigateBefore,
                                contentDescription = "Previous Page"
                            )
                        }

                        Text(
                            "${pageIndex + 1} / ${files.size}",
                            style = MaterialTheme.typography.titleSmall
                        )

                        IconButton(
                            onClick = {
                                if (pageIndex < files.size - 1) {
                                    pageIndex += 1
                                    currentBitmap?.recycle()
                                    currentBitmap = loadBitmap(files.getOrNull(pageIndex))
                                }
                            },
                            enabled = pageIndex < files.size - 1
                        ) {
                            Icon(
                                Icons.AutoMirrored.Filled.NavigateNext,
                                contentDescription = "Next Page"
                            )
                        }
                    }

                    Box(
                        modifier = Modifier
                            .weight(1f)
                            .fillMaxWidth(),
                        contentAlignment = Alignment.Center
                    ) {
                        currentBitmap?.let { bmp ->
                            Image(
                                bitmap = bmp.asImageBitmap(),
                                contentDescription = "Comic Page ${pageIndex + 1}"
                            )
                            val apiSettings = settingsViewModel.apiSettings.collectAsState().value
                            val enabled = apiSettings.comicApis.geminiBubbleTranslationEnabled
                            if (enabled && translationsJson != null) {
                                Surface(color = MaterialTheme.colorScheme.primary.copy(alpha = 0.85f)) {
                                    Text(
                                        text = "Translations Available",
                                        modifier = Modifier.padding(6.dp),
                                        color = MaterialTheme.colorScheme.onPrimary,
                                        textAlign = TextAlign.Center
                                    )
                                }
                            }
                        }
                    }

                    val apiSettings = settingsViewModel.apiSettings.collectAsState().value
                    if (apiSettings.comicApis.geminiBubbleTranslationEnabled) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(CFSpacing.md),
                            horizontalArrangement = Arrangement.End
                        ) {
                            CFMetalButton(
                                text = "Translate Page",
                                onClick = {
                                    currentBitmap?.let { bmp ->
                                        scope.launch {
                                            Log.d("ModernComicReader", "Translation feature requested")
                                            translationsJson = null
                                        }
                                    }
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}

private fun extractCbzImages(context: Context, uri: Uri): ExtractedComic {
    val tmp = copyToTempFile(context, uri, ".cbz")
    val outDir = File(context.cacheDir, "cbz_${tmp.nameWithoutExtension}").apply { mkdirs() }
    val outFiles = mutableListOf<File>()
    ZipFile(tmp).use { zip ->
        val entries = zip.entries().toList().filter {
            !it.isDirectory && it.name.matches(Regex(".*\\.(png|jpe?g|webp|bmp)", RegexOption.IGNORE_CASE))
        }
        entries.sortedBy { it.name }.forEach { e ->
            val out = File(outDir, File(e.name).name)
            zip.getInputStream(e).use { input -> FileOutputStream(out).use { input.copyTo(it) } }
            outFiles.add(out)
        }
    }
    return ExtractedComic(outFiles, outDir)
}

private fun extractCbrImages(context: Context, uri: Uri): ExtractedComic {
    val tmp = copyToTempFile(context, uri, ".cbr")
    val outDir = File(context.cacheDir, "cbr_${tmp.nameWithoutExtension}").apply { mkdirs() }
    val outFiles = mutableListOf<File>()
    Archive(tmp).use { archive ->
        val headers: List<FileHeader> = archive.fileHeaders
        headers.filter {
            !it.isDirectory && it.fileNameString.matches(Regex(".*\\.(png|jpe?g|webp|bmp)", RegexOption.IGNORE_CASE))
        }
            .sortedBy { it.fileNameString }
            .forEach { h ->
                val out = File(outDir, File(h.fileNameString).name)
                FileOutputStream(out).use { fos -> archive.extractFile(h, fos) }
                outFiles.add(out)
            }
    }
    return ExtractedComic(outFiles, outDir)
}

private fun copyToTempFile(context: Context, uri: Uri, suffix: String): File {
    val input = context.contentResolver.openInputStream(uri) ?: throw IllegalArgumentException("No stream")
    val tmp = File.createTempFile("cf_tmp_", suffix, context.cacheDir)
    FileOutputStream(tmp).use { out -> input.copyTo(out) }
    return tmp
}

private fun loadBitmap(file: File?, maxWidth: Int = 2048, maxHeight: Int = 2048): Bitmap? {
    return try {
        file?.let {
            val options = BitmapFactory.Options().apply {
                inJustDecodeBounds = true
            }
            BitmapFactory.decodeFile(it.absolutePath, options)
            options.inSampleSize = calculateInSampleSize(options, maxWidth, maxHeight)
            options.inJustDecodeBounds = false
            BitmapFactory.decodeFile(it.absolutePath, options)
        }
    } catch (e: Exception) {
        Log.w("ModernComicReader", "Failed to load bitmap", e)
        null
    }
}

private fun calculateInSampleSize(options: BitmapFactory.Options, reqWidth: Int, reqHeight: Int): Int {
    val height = options.outHeight
    val width = options.outWidth
    var inSampleSize = 1

    if (height > reqHeight || width > reqWidth) {
        val halfHeight = height / 2
        val halfWidth = width / 2

        while (halfHeight / inSampleSize >= reqHeight && halfWidth / inSampleSize >= reqWidth) {
            inSampleSize *= 2
        }
    }
    return inSampleSize
}
