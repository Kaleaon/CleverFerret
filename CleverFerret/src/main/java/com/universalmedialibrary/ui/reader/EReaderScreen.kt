package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.background
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.sp
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel

/**
 * E-reader screen for reading ePub books
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EReaderScreen(
    bookFilePath: String,
    onBack: () -> Unit,
    viewModel: EReaderViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val context = LocalContext.current
    var showChapterMenu by remember { mutableStateOf(false) }

    LaunchedEffect(bookFilePath) {
        viewModel.loadBook(context, bookFilePath)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text(text = uiState.bookTitle, maxLines = 1)
                        if (uiState.totalChapters > 0) {
                            Text(
                                text = "Progress ${(100f * (uiState.currentChapterIndex + 1) / uiState.totalChapters).toInt()}%",
                                style = MaterialTheme.typography.labelSmall
                            )
                        }
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    Box {
                        TextButton(onClick = { showChapterMenu = true }) {
                            Text("Chapters")
                        }
                        DropdownMenu(expanded = showChapterMenu, onDismissRequest = { showChapterMenu = false }) {
                            uiState.chapterTitles.forEachIndexed { index, title ->
                                DropdownMenuItem(
                                    text = { Text(title, maxLines = 1) },
                                    onClick = {
                                        viewModel.jumpToChapter(index)
                                        showChapterMenu = false
                                    }
                                )
                            }
                        }
                    }
                }
            )
        },
        bottomBar = {
            if (uiState.isLoaded && !uiState.isLoading) {
                BottomAppBar {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(
                            onClick = { viewModel.previousChapter() },
                            enabled = uiState.currentChapterIndex > 0
                        ) {
                            Icon(Icons.AutoMirrored.Filled.NavigateBefore, contentDescription = "Previous Chapter")
                        }

                        Text(
                            text = "Chapter ${uiState.currentChapterIndex + 1} of ${uiState.totalChapters}",
                            style = MaterialTheme.typography.bodyMedium
                        )

                        IconButton(
                            onClick = { viewModel.nextChapter() },
                            enabled = uiState.currentChapterIndex < uiState.totalChapters - 1
                        ) {
                            Icon(Icons.AutoMirrored.Filled.NavigateNext, contentDescription = "Next Chapter")
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
                uiState.isLoading -> {
                    CircularProgressIndicator(
                        modifier = Modifier.align(Alignment.Center)
                    )
                }

                uiState.error != null -> {
                    Column(
                        modifier = Modifier
                            .align(Alignment.Center)
                            .padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Error loading book",
                            style = MaterialTheme.typography.headlineSmall,
                            color = MaterialTheme.colorScheme.error
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = uiState.error ?: "Unknown error",
                            style = MaterialTheme.typography.bodyMedium,
                            textAlign = TextAlign.Center
                        )
                    }
                }

                uiState.isLoaded -> {
                    Column(modifier = Modifier.fillMaxSize()) {
                        LinearProgressIndicator(
                            progress = { if (uiState.totalChapters > 0) (uiState.currentChapterIndex + 1f) / uiState.totalChapters else 0f },
                            modifier = Modifier.fillMaxWidth()
                        )
                        Row(
                            modifier = Modifier.fillMaxWidth().padding(horizontal = 12.dp, vertical = 8.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Row(verticalAlignment = Alignment.CenterVertically) {
                                Text("A", fontSize = 14.sp)
                                Slider(
                                    value = uiState.fontSizeSp.toFloat(),
                                    onValueChange = { viewModel.adjustFontSize((it - uiState.fontSizeSp).toInt()) },
                                    valueRange = 12f..32f,
                                    modifier = Modifier.width(120.dp)
                                )
                                Text("A", fontSize = 22.sp, fontWeight = FontWeight.Bold)
                            }
                            Row {
                                ReaderThemeMode.entries.forEach { mode ->
                                    FilterChip(
                                        selected = uiState.themeMode == mode,
                                        onClick = { viewModel.setTheme(mode) },
                                        label = { Text(mode.name.lowercase().replaceFirstChar { it.uppercase() }) }
                                    )
                                }
                            }
                        }
                        ReaderContent(
                            content = uiState.currentChapterContent,
                            modifier = Modifier.fillMaxSize(),
                            fontSizeSp = uiState.fontSizeSp,
                            theme = uiState.themeMode
                        )
                    }
                }

                else -> {
                    Text(
                        text = "No book loaded",
                        modifier = Modifier.align(Alignment.Center),
                        style = MaterialTheme.typography.bodyLarge
                    )
                }
            }
        }
    }
}

/**
 * Displays the actual reading content
 */
@Composable
private fun ReaderContent(
    content: String,
    modifier: Modifier = Modifier,
    fontSizeSp: Int = 18,
    theme: ReaderThemeMode = ReaderThemeMode.SYSTEM
) {
    val backgroundColor = when (theme) {
        ReaderThemeMode.SEPIA -> Color(0xFFF8F1D9)
        ReaderThemeMode.DARK -> Color(0xFF121212)
        else -> MaterialTheme.colorScheme.surface
    }
    val contentColor = when (theme) {
        ReaderThemeMode.SEPIA -> Color(0xFF5B4636)
        ReaderThemeMode.DARK -> Color(0xFFECECEC)
        else -> MaterialTheme.colorScheme.onSurface
    }
    Column(
        modifier = modifier
            .background(backgroundColor)
            .verticalScroll(rememberScrollState())
            .padding(16.dp)
    ) {
        // For now, we'll display the raw HTML content as text
        // In a production app, you'd want to render the HTML properly
        Text(
            text = content,
            style = MaterialTheme.typography.bodyLarge.copy(fontSize = fontSizeSp.sp),
            lineHeight = MaterialTheme.typography.bodyLarge.lineHeight,
            color = contentColor,
            modifier = Modifier.fillMaxWidth()
        )
    }
}
