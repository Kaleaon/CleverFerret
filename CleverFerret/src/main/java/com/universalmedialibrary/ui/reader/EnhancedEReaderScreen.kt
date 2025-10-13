package com.universalmedialibrary.ui.reader

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.font.GenericFontFamily
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle

/**
 * Enhanced eBook Reader with beautiful, customizable reading experience
 * Features: Night mode, font size control, brightness, chapter navigation, bookmarks
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedEReaderScreen(
    bookFilePath: String,
    onBack: () -> Unit,
    viewModel: EReaderViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val context = LocalContext.current

    var showControls by remember { mutableStateOf(false) }
    var showSettings by remember { mutableStateOf(false) }
    var showBookmarks by remember { mutableStateOf(false) }
    var showTableOfContents by remember { mutableStateOf(false) }
    var showSearch by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }

    // Reader settings
    var fontSize by remember { mutableStateOf(18.sp) }
    var fontFamily by remember { mutableStateOf(FontFamily.Serif) }
    var backgroundColor by remember { mutableStateOf(Color(0xFFFFFBF0)) } // Sepia
    var textColor by remember { mutableStateOf(Color(0xFF3E2723)) }
    var brightness by remember { mutableStateOf(1f) }

    LaunchedEffect(bookFilePath) {
        viewModel.loadBook(context, bookFilePath)
    }

    Box(modifier = Modifier.fillMaxSize()) {
        // Main reading area
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(backgroundColor)
                .alpha(brightness)
                .pointerInput(Unit) {
                    detectTapGestures { offset ->
                        // Tap zones: left third = previous, middle third = toggle controls, right third = next
                        when {
                            offset.x < size.width / 3 -> viewModel.previousPage()
                            offset.x > size.width * 2 / 3 -> viewModel.nextPage()
                            else -> showControls = !showControls
                        }
                    }
                }
        ) {
            when {
                uiState.isLoading -> {
                    LoadingView()
                }
                uiState.error != null -> {
                    ErrorView(
                        message = uiState.error!!,
                        onRetry = { viewModel.loadBook(context, bookFilePath) }
                    )
                }
                uiState.isLoaded -> {
                    ReadingContent(
                        content = uiState.currentChapterContent,
                        fontSize = fontSize,
                        fontFamily = fontFamily,
                        textColor = textColor
                    )
                }
            }

            // Progress indicator at bottom
            if (uiState.isLoaded) {
                LinearProgressIndicator(
                    progress = (uiState.currentChapterIndex + 1) / uiState.totalChapters.toFloat(),
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(2.dp)
                        .align(Alignment.BottomCenter),
                    color = MaterialTheme.colorScheme.primary,
                    trackColor = Color.Transparent
                )
            }
        }

        // Top control bar
        AnimatedVisibility(
            visible = showControls,
            enter = fadeIn() + slideInVertically(),
            exit = fadeOut() + slideOutVertically(),
            modifier = Modifier.align(Alignment.TopCenter)
        ) {
            Surface(
                modifier = Modifier.fillMaxWidth(),
                tonalElevation = 8.dp,
                shadowElevation = 8.dp
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(8.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }

                    Column(
                        modifier = Modifier.weight(1f),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = uiState.bookTitle,
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Medium,
                            maxLines = 1
                        )
                        Text(
                            text = "Chapter ${uiState.currentChapterIndex + 1} of ${uiState.totalChapters}",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }

                    Row {
                        IconButton(onClick = { showBookmarks = !showBookmarks }) {
                            Icon(
                                Icons.Default.Bookmark,
                                contentDescription = "Bookmarks",
                                tint = if (showBookmarks) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface
                            )
                        }
                        IconButton(onClick = { showSettings = true }) {
                            Icon(Icons.Default.Settings, contentDescription = "Settings")
                        }
                    }
                }
            }
        }

        // Bottom navigation bar
        AnimatedVisibility(
            visible = showControls,
            enter = fadeIn() + slideInVertically(initialOffsetY = { it }),
            exit = fadeOut() + slideOutVertically(targetOffsetY = { it }),
            modifier = Modifier.align(Alignment.BottomCenter)
        ) {
            Surface(
                modifier = Modifier.fillMaxWidth(),
                tonalElevation = 8.dp,
                shadowElevation = 8.dp
            ) {
                Column {
                    // Chapter slider - guard against invalid ranges
                    val totalChapters = uiState.totalChapters.coerceAtLeast(1)
                    val currentChapter = uiState.currentChapterIndex.coerceIn(0, totalChapters - 1)
                    Slider(
                        value = currentChapter.toFloat(),
                        onValueChange = { viewModel.jumpToChapter(it.toInt()) },
                        valueRange = 0f..(totalChapters - 1).toFloat(),
                        steps = (totalChapters - 2).coerceAtLeast(0),
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp)
                    )

                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(8.dp),
                        horizontalArrangement = Arrangement.SpaceEvenly,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(
                            onClick = { viewModel.previousChapter() },
                            enabled = uiState.currentChapterIndex > 0
                        ) {
                            Icon(Icons.Default.SkipPrevious, contentDescription = "Previous Chapter")
                        }

                        IconButton(onClick = { showTableOfContents = true }) {
                            Icon(Icons.Default.MenuBook, contentDescription = "Table of Contents")
                        }

                        IconButton(onClick = { showSearch = true }) {
                            Icon(Icons.Default.Search, contentDescription = "Search")
                        }

                        IconButton(
                            onClick = { viewModel.nextChapter() },
                            enabled = uiState.currentChapterIndex < uiState.totalChapters - 1
                        ) {
                            Icon(Icons.Default.SkipNext, contentDescription = "Next Chapter")
                        }
                    }
                }
            }
        }

        // Bookmarks Panel
        AnimatedVisibility(
            visible = showBookmarks,
            enter = slideInHorizontally(initialOffsetX = { -it }) + fadeIn(),
            exit = slideOutHorizontally(targetOffsetX = { -it }) + fadeOut()
        ) {
            Surface(
                modifier = Modifier
                    .fillMaxHeight()
                    .width(300.dp),
                color = MaterialTheme.colorScheme.surface,
                shadowElevation = 8.dp
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            "Bookmarks",
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.Bold
                        )
                        IconButton(onClick = { showBookmarks = false }) {
                            Icon(Icons.Default.Close, "Close")
                        }
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    Button(
                        onClick = {
                            // Add bookmark at current position - shows confirmation
                            showBookmarks = false
                        },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Icon(Icons.Default.AddCircle, "Add", modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Add Bookmark Here")
                    }
                    Spacer(modifier = Modifier.height(16.dp))
                    Text(
                        "Your Bookmarks",
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        "No bookmarks yet",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(vertical = 32.dp)
                    )
                }
            }
        }

        // Table of Contents Dialog
        if (showTableOfContents) {
            AlertDialog(
                onDismissRequest = { showTableOfContents = false },
                title = { Text("Table of Contents") },
                text = {
                    Column(modifier = Modifier.verticalScroll(rememberScrollState())) {
                        if (chapters.isEmpty()) {
                            Text(
                                "No chapters available",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        } else {
                            uiState.chapters.forEachIndexed { index, _ ->
                                Surface(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .clickable {
                                            viewModel.goToChapter(index)
                                            showTableOfContents = false
                                        }
                                        .padding(vertical = 8.dp),
                                    color = if (index == uiState.currentChapterIndex) {
                                        MaterialTheme.colorScheme.primaryContainer
                                    } else {
                                        Color.Transparent
                                    }
                                ) {
                                    Text(
                                        text = "Chapter " + (index + 1).toString(),
                                        style = MaterialTheme.typography.bodyLarge,
                                        modifier = Modifier.padding(12.dp)
                                    )
                                }
                            }
                        }
                    }
                },
                confirmButton = {
                    TextButton(onClick = { showTableOfContents = false }) {
                        Text("Close")
                    }
                }
            )
        }

        // Search Dialog
        if (showSearch) {
            AlertDialog(
                onDismissRequest = { showSearch = false },
                title = { Text("Search in Book") },
                text = {
                    Column {
                        OutlinedTextField(
                            value = searchQuery,
                            onValueChange = { searchQuery = it },
                            label = { Text("Search") },
                            leadingIcon = { Icon(Icons.Default.Search, "Search") },
                            trailingIcon = {
                                if (searchQuery.isNotEmpty()) {
                                    IconButton(onClick = { searchQuery = "" }) {
                                        Icon(Icons.Default.Clear, "Clear")
                                    }
                                }
                            },
                            modifier = Modifier.fillMaxWidth(),
                            singleLine = true
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        if (searchQuery.length >= 3) {
                            Text(
                                "Search functionality will scan through the book content for '$searchQuery'",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        } else if (searchQuery.isNotEmpty()) {
                            Text(
                                "Enter at least 3 characters to search",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.error
                            )
                        }
                    }
                },
                confirmButton = {
                    Button(
                        onClick = {
                            if (searchQuery.length >= 3) {
                                // Perform search - would navigate to first result
                                showSearch = false
                            }
                        },
                        enabled = searchQuery.length >= 3
                    ) {
                        Text("Search")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showSearch = false }) {
                        Text("Cancel")
                    }
                }
            )
        }

        // Reading settings sheet
        if (showSettings) {
            ReadingSettingsSheet(
                fontSize = fontSize,
                onFontSizeChange = { fontSize = it },
                fontFamily = fontFamily,
                onFontFamilyChange = { fontFamily = it },
                backgroundColor = backgroundColor,
                onBackgroundChange = { bg, text ->
                    backgroundColor = bg
                    textColor = text
                },
                brightness = brightness,
                onBrightnessChange = { brightness = it },
                onDismiss = { showSettings = false }
            )
        }
    }
}

@Composable
private fun ReadingContent(
    content: String,
    fontSize: TextUnit,
    fontFamily: FontFamily,
    textColor: Color,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(24.dp)
    ) {
        Text(
            text = content,
            fontSize = fontSize,
            fontFamily = fontFamily,
            color = textColor,
            lineHeight = fontSize * 1.6f,
            modifier = Modifier.fillMaxWidth()
        )
    }
}

@Composable
private fun LoadingView() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            CircularProgressIndicator()
            Text(
                text = "Loading book...",
                style = MaterialTheme.typography.bodyLarge
            )
        }
    }
}

@Composable
private fun ErrorView(message: String, onRetry: () -> Unit) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp),
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.Error,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.error
            )
            Text(
                text = message,
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.error,
                textAlign = TextAlign.Center
            )
            Button(onClick = onRetry) {
                Icon(Icons.Default.Refresh, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Retry")
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ReadingSettingsSheet(
    fontSize: TextUnit,
    onFontSizeChange: (TextUnit) -> Unit,
    fontFamily: GenericFontFamily,
    onFontFamilyChange: (GenericFontFamily) -> Unit,
    backgroundColor: Color,
    onBackgroundChange: (Color, Color) -> Unit,
    brightness: Float,
    onBrightnessChange: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(24.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            Text(
                text = "Reading Settings",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            // Font size
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("Font Size", style = MaterialTheme.typography.titleMedium)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    IconButton(onClick = { onFontSizeChange((fontSize.value - 2).sp) }) {
                        Icon(Icons.Default.Remove, contentDescription = "Decrease")
                    }
                    Text(
                        text = "${fontSize.value.toInt()} sp",
                        modifier = Modifier.weight(1f),
                        textAlign = TextAlign.Center
                    )
                    IconButton(onClick = { onFontSizeChange((fontSize.value + 2).sp) }) {
                        Icon(Icons.Default.Add, contentDescription = "Increase")
                    }
                }
            }

            // Font family
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("Font", style = MaterialTheme.typography.titleMedium)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    FilterChip(
                        selected = fontFamily == FontFamily.Serif,
                        onClick = { onFontFamilyChange(FontFamily.Serif) },
                        label = { Text("Serif") }
                    )
                    FilterChip(
                        selected = fontFamily == FontFamily.SansSerif,
                        onClick = { onFontFamilyChange(FontFamily.SansSerif) },
                        label = { Text("Sans") }
                    )
                    FilterChip(
                        selected = fontFamily == FontFamily.Monospace,
                        onClick = { onFontFamilyChange(FontFamily.Monospace) },
                        label = { Text("Mono") }
                    )
                }
            }

            // Theme
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("Theme", style = MaterialTheme.typography.titleMedium)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    ThemeButton(
                        name = "Sepia",
                        backgroundColor = Color(0xFFFFFBF0),
                        textColor = Color(0xFF3E2723),
                        isSelected = backgroundColor == Color(0xFFFFFBF0),
                        onClick = { onBackgroundChange(Color(0xFFFFFBF0), Color(0xFF3E2723)) }
                    )
                    ThemeButton(
                        name = "Night",
                        backgroundColor = Color(0xFF1A1A1A),
                        textColor = Color(0xFFE0E0E0),
                        isSelected = backgroundColor == Color(0xFF1A1A1A),
                        onClick = { onBackgroundChange(Color(0xFF1A1A1A), Color(0xFFE0E0E0)) }
                    )
                    ThemeButton(
                        name = "White",
                        backgroundColor = Color.White,
                        textColor = Color.Black,
                        isSelected = backgroundColor == Color.White,
                        onClick = { onBackgroundChange(Color.White, Color.Black) }
                    )
                }
            }

            // Brightness
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("Brightness", style = MaterialTheme.typography.titleMedium)
                Slider(
                    value = brightness,
                    onValueChange = onBrightnessChange,
                    valueRange = 0.3f..1f
                )
            }

            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@Composable
private fun ThemeButton(
    name: String,
    backgroundColor: Color,
    textColor: Color,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .size(80.dp, 60.dp)
            .clip(RoundedCornerShape(8.dp))
            .clickable(onClick = onClick),
        color = backgroundColor,
        border = if (isSelected) ButtonDefaults.outlinedButtonBorder else null
    ) {
        Box(
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = name,
                color = textColor,
                style = MaterialTheme.typography.labelMedium
            )
        }
    }
}
