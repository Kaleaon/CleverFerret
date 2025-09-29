package com.universalmedialibrary.ui.viewer

import android.net.Uri
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.automirrored.filled.*
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.BookmarkService
import com.universalmedialibrary.services.epub.EPUBReaderService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class EPUBViewerViewModel @Inject constructor(
    private val epubReaderService: EPUBReaderService,
    private val bookmarkService: BookmarkService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(EPUBViewerUiState())
    val uiState: StateFlow<EPUBViewerUiState> = _uiState.asStateFlow()
    
    val readerState = epubReaderService.readerState
    
    data class EPUBViewerUiState(
        val isLoading: Boolean = false,
        val showTOC: Boolean = false,
        val showSettings: Boolean = false,
        val fontSize: Float = 16f,
        val backgroundColor: Color = Color.White,
        val textColor: Color = Color.Black,
        val nightMode: Boolean = false,
        val bookmarks: List<BookmarkService.Bookmark> = emptyList()
    )
    
    fun loadEPUB(uri: Uri) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            epubReaderService.loadEPUB(uri)
            _uiState.value = _uiState.value.copy(isLoading = false)
        }
    }
    
    fun nextChapter() {
        epubReaderService.nextChapter()
    }
    
    fun previousChapter() {
        epubReaderService.previousChapter()
    }
    
    fun goToChapter(index: Int) {
        epubReaderService.goToChapter(index)
        _uiState.value = _uiState.value.copy(showTOC = false)
    }
    
    fun toggleTOC() {
        _uiState.value = _uiState.value.copy(
            showTOC = !_uiState.value.showTOC,
            showSettings = false
        )
    }
    
    fun toggleSettings() {
        _uiState.value = _uiState.value.copy(
            showSettings = !_uiState.value.showSettings,
            showTOC = false
        )
    }
    
    fun updateFontSize(size: Float) {
        _uiState.value = _uiState.value.copy(fontSize = size)
    }
    
    fun toggleNightMode() {
        val nightMode = !_uiState.value.nightMode
        _uiState.value = _uiState.value.copy(
            nightMode = nightMode,
            backgroundColor = if (nightMode) Color.Black else Color.White,
            textColor = if (nightMode) Color.White else Color.Black
        )
    }
    
    fun addBookmark() {
        viewModelScope.launch {
            val state = readerState.value
            if (state.isLoaded) {
                val bookmark = BookmarkService.Bookmark(
                    mediaItemId = 0, // Would be the actual media item ID
                    position = """{"chapter": ${state.currentChapter}, "title": "${state.chapters[state.currentChapter].title}"}""",
                    type = BookmarkService.BookmarkType.MANUAL
                )
                bookmarkService.saveBookmark(bookmark)
                loadBookmarks()
            }
        }
    }
    
    private fun loadBookmarks() {
        viewModelScope.launch {
            // Load bookmarks for current book
            // _uiState.value = _uiState.value.copy(bookmarks = bookmarks)
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EPUBViewerScreen(
    uri: Uri,
    onBack: () -> Unit,
    viewModel: EPUBViewerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val readerState by viewModel.readerState.collectAsState()
    
    LaunchedEffect(uri) {
        viewModel.loadEPUB(uri)
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Column {
                        Text(
                            text = readerState.bookTitle,
                            style = MaterialTheme.typography.titleMedium
                        )
                        if (readerState.bookAuthor.isNotEmpty()) {
                            Text(
                                text = readerState.bookAuthor,
                                style = MaterialTheme.typography.bodySmall
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
                    IconButton(onClick = { viewModel.addBookmark() }) {
                        Icon(Icons.Default.BookmarkAdd, contentDescription = "Add Bookmark")
                    }
                    IconButton(onClick = { viewModel.toggleTOC() }) {
                        Icon(Icons.AutoMirrored.Filled.List, contentDescription = "Table of Contents")
                    }
                    IconButton(onClick = { viewModel.toggleSettings() }) {
                        Icon(Icons.Default.Settings, contentDescription = "Settings")
                    }
                }
            )
        },
        bottomBar = {
            if (readerState.isLoaded) {
                BottomAppBar {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(
                            onClick = { viewModel.previousChapter() },
                            enabled = readerState.currentChapter > 0
                        ) {
                            Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Previous Chapter")
                        }
                        
                        Text(
                            text = "Chapter ${readerState.currentChapter + 1} of ${readerState.totalChapters}",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        
                        IconButton(
                            onClick = { viewModel.nextChapter() },
                            enabled = readerState.currentChapter < readerState.totalChapters - 1
                        ) {
                            Icon(Icons.AutoMirrored.Filled.ArrowForward, contentDescription = "Next Chapter")
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
                .background(uiState.backgroundColor)
        ) {
            when {
                uiState.isLoading -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                }
                
                readerState.error != null -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Icon(
                                Icons.Default.Error,
                                contentDescription = "Error",
                                modifier = Modifier.size(48.dp),
                                tint = MaterialTheme.colorScheme.error
                            )
                            Spacer(modifier = Modifier.height(16.dp))
                            Text(
                                text = readerState.error,
                                style = MaterialTheme.typography.bodyLarge,
                                color = MaterialTheme.colorScheme.error,
                                textAlign = TextAlign.Center
                            )
                        }
                    }
                }
                
                readerState.isLoaded -> {
                    Column(
                        modifier = Modifier.fillMaxSize()
                    ) {
                        if (readerState.chapters.isNotEmpty()) {
                            Text(
                                text = readerState.chapters[readerState.currentChapter].title,
                                style = MaterialTheme.typography.headlineSmall,
                                modifier = Modifier
                                    .padding(16.dp)
                                    .fillMaxWidth(),
                                textAlign = TextAlign.Center,
                                color = uiState.textColor
                            )
                            
                            Box(
                                modifier = Modifier
                                    .weight(1f)
                                    .fillMaxWidth()
                                    .verticalScroll(rememberScrollState())
                                    .padding(horizontal = 16.dp)
                            ) {
                                Text(
                                    text = readerState.currentContent,
                                    style = MaterialTheme.typography.bodyLarge.copy(
                                        fontSize = uiState.fontSize.sp
                                    ),
                                    color = uiState.textColor
                                )
                            }
                        }
                    }
                }
            }
            
            // Table of Contents Drawer
            if (uiState.showTOC) {
                Surface(
                    modifier = Modifier
                        .fillMaxHeight()
                        .fillMaxWidth(0.8f)
                        .align(Alignment.CenterStart),
                    shadowElevation = 8.dp
                ) {
                    TOCDrawer(
                        chapters = readerState.chapters,
                        currentChapter = readerState.currentChapter,
                        onChapterClick = { viewModel.goToChapter(it) },
                        onClose = { viewModel.toggleTOC() }
                    )
                }
            }
            
            // Settings Panel
            if (uiState.showSettings) {
                Surface(
                    modifier = Modifier
                        .fillMaxHeight()
                        .fillMaxWidth(0.8f)
                        .align(Alignment.CenterEnd),
                    shadowElevation = 8.dp
                ) {
                    ReaderSettingsPanel(
                        fontSize = uiState.fontSize,
                        nightMode = uiState.nightMode,
                        onFontSizeChange = { viewModel.updateFontSize(it) },
                        onNightModeToggle = { viewModel.toggleNightMode() },
                        onClose = { viewModel.toggleSettings() }
                    )
                }
            }
        }
    }
}

@Composable
fun TOCDrawer(
    chapters: List<EPUBReaderService.Chapter>,
    currentChapter: Int,
    onChapterClick: (Int) -> Unit,
    onClose: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Table of Contents",
                style = MaterialTheme.typography.headlineSmall
            )
            IconButton(onClick = onClose) {
                Icon(Icons.Default.Close, contentDescription = "Close")
            }
        }
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .verticalScroll(rememberScrollState())
        ) {
            chapters.forEach { chapter ->
                TextButton(
                    onClick = { onChapterClick(chapter.index) },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text(
                        text = chapter.title,
                        style = if (chapter.index == currentChapter) {
                            MaterialTheme.typography.bodyLarge.copy(
                                color = MaterialTheme.colorScheme.primary
                            )
                        } else {
                            MaterialTheme.typography.bodyLarge
                        },
                        modifier = Modifier.fillMaxWidth()
                    )
                }
                Divider()
            }
        }
    }
}

@Composable
fun ReaderSettingsPanel(
    fontSize: Float,
    nightMode: Boolean,
    onFontSizeChange: (Float) -> Unit,
    onNightModeToggle: () -> Unit,
    onClose: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Reading Settings",
                style = MaterialTheme.typography.headlineSmall
            )
            IconButton(onClick = onClose) {
                Icon(Icons.Default.Close, contentDescription = "Close")
            }
        }
        
        Spacer(modifier = Modifier.height(24.dp))
        
        Text(
            text = "Font Size",
            style = MaterialTheme.typography.titleMedium
        )
        
        Slider(
            value = fontSize,
            onValueChange = onFontSizeChange,
            valueRange = 12f..24f,
            steps = 5,
            modifier = Modifier.fillMaxWidth()
        )
        
        Text(
            text = "${fontSize.toInt()}sp",
            style = MaterialTheme.typography.bodyMedium,
            modifier = Modifier.align(Alignment.CenterHorizontally)
        )
        
        Spacer(modifier = Modifier.height(24.dp))
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Night Mode",
                style = MaterialTheme.typography.titleMedium
            )
            Switch(
                checked = nightMode,
                onCheckedChange = { onNightModeToggle() }
            )
        }
    }
}