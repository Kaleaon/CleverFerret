package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.util.Log
import androidx.compose.foundation.Image
import androidx.compose.foundation.gestures.detectHorizontalDragGestures
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.NavigateBefore
import androidx.compose.material.icons.automirrored.filled.NavigateNext
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.ui.accessibility.headingSemantics
import com.universalmedialibrary.ui.settings.SettingsViewModel
import com.universalmedialibrary.ui.viewer.common.ReadingDirection
import com.universalmedialibrary.ui.viewer.common.ReadingMode
import kotlinx.coroutines.launch
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipFile
import com.github.junrar.Archive
import com.github.junrar.rarfile.FileHeader

private data class ExtractedComic(
    val imageFiles: List<File> = emptyList(),
    val cleanupDir: File? = null
)

@Deprecated(
    message = "Migrated to ModernComicReaderScreen in ui.modern.reader",
    replaceWith = ReplaceWith(
        "ModernComicReaderScreen(uriString, fileName, onBack)",
        "com.universalmedialibrary.ui.modern.reader.ModernComicReaderScreen"
    )
)
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ComicReaderScreen(
    uriString: String,
    fileName: String,
    onBack: () -> Unit,
    settingsViewModel: SettingsViewModel = hiltViewModel(),
    comicReaderViewModel: ComicReaderViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val uri = remember(uriString) { Uri.parse(uriString) }
    val extension = remember(fileName) { fileName.substringAfterLast('.', "").lowercase() }

    var extractedComic by remember { mutableStateOf(ExtractedComic()) }
    var index by remember { mutableStateOf(0) }
    var currentBitmap by remember { mutableStateOf<Bitmap?>(null) }
    var translationsJson by remember { mutableStateOf<String?>(null) }
    var showSettingsSheet by remember { mutableStateOf(false) }
    var dragAccumulator by remember { mutableFloatStateOf(0f) }
    val scope = rememberCoroutineScope()

    val uiState by comicReaderViewModel.uiState.collectAsStateWithLifecycle()
    val isRtl = uiState.readingDirection == ReadingDirection.RIGHT_TO_LEFT
    val isWebtoon = uiState.readingMode == ReadingMode.WEBTOON || uiState.readingDirection == ReadingDirection.VERTICAL

    // Cleanup bitmap on screen exit to prevent memory leaks
    DisposableEffect(Unit) {
        onDispose {
            currentBitmap?.recycle()
            currentBitmap = null
            extractedComic.cleanupDir?.deleteRecursively()
        }
    }

    LaunchedEffect(uri) {
        extractedComic = try {
            when (extension) {
                "cbz" -> extractCbzImages(context, uri)
                "cbr" -> extractCbrImages(context, uri)
                else -> ExtractedComic()
            }
        } catch (e: Exception) { 
            Log.w("ComicReader", "Failed to extract comic images", e)
            ExtractedComic()
        }
        val comicId = uriString.hashCode().toLong()
        comicReaderViewModel.loadComic(context, uriString, comicId)
    }

    // Sync current page with session restore once session is loaded
    LaunchedEffect(uiState.readingSession) {
        uiState.readingSession?.let { session ->
            if (session.currentPage in extractedComic.imageFiles.indices) {
                index = session.currentPage
            }
        }
    }

    // Load bitmap when index changes
    LaunchedEffect(index, extractedComic) {
        if (extractedComic.imageFiles.isNotEmpty() && index in extractedComic.imageFiles.indices) {
            currentBitmap?.recycle()
            currentBitmap = loadBitmap(extractedComic.imageFiles.getOrNull(index))
            comicReaderViewModel.reportProgress(index)
        }
    }

    // Navigation functions respecting reading direction
    val canGoNext = if (isRtl) index > 0 else index < extractedComic.imageFiles.size - 1
    val canGoPrev = if (isRtl) index < extractedComic.imageFiles.size - 1 else index > 0

    fun triggerNextPage() {
        if (isRtl) {
            if (index > 0) index -= 1
        } else {
            if (index < extractedComic.imageFiles.size - 1) index += 1
        }
    }

    fun triggerPrevPage() {
        if (isRtl) {
            if (index < extractedComic.imageFiles.size - 1) index += 1
        } else {
            if (index > 0) index -= 1
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(fileName, modifier = Modifier.headingSemantics()) },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showSettingsSheet = true }) {
                        Icon(Icons.Default.Settings, contentDescription = "Settings")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            if (!isWebtoon) {
                // Page controls header for page-by-page mode
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(8.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    IconButton(
                        onClick = { triggerPrevPage() },
                        enabled = canGoPrev
                    ) {
                        Icon(Icons.AutoMirrored.Filled.NavigateBefore, contentDescription = "Prev page")
                    }

                    Text("${index + 1} / ${extractedComic.imageFiles.size}")

                    IconButton(
                        onClick = { triggerNextPage() },
                        enabled = canGoNext
                    ) {
                        Icon(Icons.AutoMirrored.Filled.NavigateNext, contentDescription = "Next page")
                    }
                }

                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .weight(1f)
                        .pointerInput(isRtl, index, extractedComic.imageFiles.size) {
                            detectTapGestures { offset ->
                                val width = size.width
                                when {
                                    offset.x < width * 0.35f -> {
                                        // Left zone tap
                                        if (isRtl) triggerNextPage() else triggerPrevPage()
                                    }
                                    offset.x > width * 0.65f -> {
                                        // Right zone tap
                                        if (isRtl) triggerPrevPage() else triggerNextPage()
                                    }
                                }
                            }
                        }
                        .pointerInput(isRtl, index, extractedComic.imageFiles.size) {
                            detectHorizontalDragGestures(
                                onDragEnd = {
                                    if (dragAccumulator < -60f) {
                                        // Dragged left (swipe left)
                                        if (isRtl) triggerPrevPage() else triggerNextPage()
                                    } else if (dragAccumulator > 60f) {
                                        // Dragged right (swipe right)
                                        if (isRtl) triggerNextPage() else triggerPrevPage()
                                    }
                                    dragAccumulator = 0f
                                },
                                onHorizontalDrag = { _, dragAmount ->
                                    dragAccumulator += dragAmount
                                }
                            )
                        },
                    contentAlignment = Alignment.Center
                ) {
                    currentBitmap?.let { bmp ->
                        Image(bitmap = bmp.asImageBitmap(), contentDescription = "Media image")
                        val apiSettings = settingsViewModel.apiSettings.collectAsStateWithLifecycle().value
                        val enabled = apiSettings.comicApis.geminiBubbleTranslationEnabled
                        if (enabled && translationsJson != null) {
                            Surface(color = MaterialTheme.colorScheme.primary.copy(alpha = 0.85f)) {
                                Text(
                                    text = "Translations",
                                    modifier = Modifier.padding(6.dp),
                                    color = MaterialTheme.colorScheme.onPrimary,
                                    textAlign = TextAlign.Center
                                )
                            }
                        }
                    }
                }

                // Action row for translation
                val apiSettings = settingsViewModel.apiSettings.collectAsStateWithLifecycle().value
                if (apiSettings.comicApis.geminiBubbleTranslationEnabled) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(8.dp),
                        horizontalArrangement = Arrangement.End
                    ) {
                        Button(onClick = {
                            currentBitmap?.let { bmp ->
                                scope.launch {
                                    Log.d("ComicReaderScreen", "Translation feature coming in v1.1.0")
                                    translationsJson = null
                                }
                            }
                        }) { Text("Translate Page") }
                    }
                }
            } else {
                // Webtoon continuous vertical view
                val listState = rememberLazyListState(initialFirstVisibleItemIndex = index)
                LaunchedEffect(listState.firstVisibleItemIndex) {
                    if (extractedComic.imageFiles.isNotEmpty()) {
                        index = listState.firstVisibleItemIndex
                        comicReaderViewModel.reportProgress(index)
                    }
                }

                LazyColumn(
                    state = listState,
                    modifier = Modifier.fillMaxSize()
                ) {
                    itemsIndexed(extractedComic.imageFiles) { pageIdx, file ->
                        AsyncImage(
                            model = ImageRequest.Builder(context)
                                .data(file)
                                .crossfade(true)
                                .build(),
                            contentDescription = "Comic page ${pageIdx + 1}",
                            modifier = Modifier
                                .fillMaxWidth()
                                .wrapContentHeight(),
                            contentScale = ContentScale.FillWidth
                        )
                    }
                }
            }
        }
    }

    if (showSettingsSheet) {
        ModalBottomSheet(onDismissRequest = { showSettingsSheet = false }) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(20.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    text = "Reading Settings",
                    style = MaterialTheme.typography.titleLarge
                )

                Text(
                    text = "Reading Direction",
                    style = MaterialTheme.typography.titleMedium
                )
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    FilterChip(
                        selected = uiState.readingDirection == ReadingDirection.LEFT_TO_RIGHT,
                        onClick = { comicReaderViewModel.setReadingDirection(ReadingDirection.LEFT_TO_RIGHT) },
                        label = { Text("Left to Right") }
                    )
                    FilterChip(
                        selected = uiState.readingDirection == ReadingDirection.RIGHT_TO_LEFT,
                        onClick = { comicReaderViewModel.setReadingDirection(ReadingDirection.RIGHT_TO_LEFT) },
                        label = { Text("Right to Left") }
                    )
                    FilterChip(
                        selected = uiState.readingDirection == ReadingDirection.VERTICAL,
                        onClick = { comicReaderViewModel.setReadingDirection(ReadingDirection.VERTICAL) },
                        label = { Text("Vertical") }
                    )
                }

                Text(
                    text = "Reading Mode",
                    style = MaterialTheme.typography.titleMedium
                )
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    FilterChip(
                        selected = uiState.readingMode == ReadingMode.PAGE_BY_PAGE && uiState.readingDirection != ReadingDirection.VERTICAL,
                        onClick = { comicReaderViewModel.setReadingMode(ReadingMode.PAGE_BY_PAGE) },
                        label = { Text("Page by Page") }
                    )
                    FilterChip(
                        selected = uiState.readingMode == ReadingMode.WEBTOON || uiState.readingDirection == ReadingDirection.VERTICAL,
                        onClick = { comicReaderViewModel.setReadingMode(ReadingMode.WEBTOON) },
                        label = { Text("Webtoon") }
                    )
                }

                Spacer(modifier = Modifier.height(8.dp))
                Button(
                    onClick = { showSettingsSheet = false },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Done")
                }
            }
        }
    }
}

private fun extractCbzImages(context: android.content.Context, uri: Uri): ExtractedComic {
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
    return ExtractedComic(outFiles, outDir)
}

private fun extractCbrImages(context: android.content.Context, uri: Uri): ExtractedComic {
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
    return ExtractedComic(outFiles, outDir)
}

private fun copyToTempFile(context: android.content.Context, uri: Uri, suffix: String): File {
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
        Log.w("ComicReader", "Failed to load bitmap", e)
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
