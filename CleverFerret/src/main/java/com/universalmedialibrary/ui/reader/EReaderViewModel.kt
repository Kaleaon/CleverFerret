package com.universalmedialibrary.ui.reader

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.ReaderSettings
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.ReaderSettingsRepository
import com.universalmedialibrary.services.epub.EpubReaderService
import com.universalmedialibrary.services.epub.EpubChapter
import com.universalmedialibrary.services.tts.TextToSpeechService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the E-Reader screen
 * 
 * Manages:
 * - Loading and displaying EPUB content
 * - Reader settings and preferences
 * - Navigation between chapters
 * - Reading progress tracking
 */
@HiltViewModel
class EReaderViewModel @Inject constructor(
    private val mediaRepository: MediaRepository,
    private val epubReaderService: EpubReaderService,
    private val readerSettingsRepository: ReaderSettingsRepository,
    private val textToSpeechService: TextToSpeechService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(EReaderUiState())
    val uiState: StateFlow<EReaderUiState> = _uiState.asStateFlow()
    
    private var currentMediaId: Long = 0
    
    /**
     * Reader settings flow that combines global settings with book-specific overrides
     */
    val readerSettings: StateFlow<ReaderSettings> = _uiState
        .map { it.mediaId }
        .distinctUntilChanged()
        .flatMapLatest { mediaId ->
            if (mediaId > 0) {
                readerSettingsRepository.getReaderSettingsFlow(mediaId)
            } else {
                flowOf(ReaderSettings.merge(ReaderSettings.default(), null))
            }
        }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = ReaderSettings.merge(ReaderSettings.default(), null)
        )
    
    init {
        // Initialize TTS service
        viewModelScope.launch {
            textToSpeechService.initialize()
        }
        
        // Observe EPUB reader service state
        viewModelScope.launch {
            epubReaderService.readerState.collect { epubState ->
                _uiState.update { currentState ->
                    currentState.copy(
                        isLoading = epubState.isLoading,
                        isLoaded = epubState.isLoaded,
                        bookTitle = epubState.bookTitle,
                        bookAuthor = epubState.bookAuthor,
                        totalChapters = epubState.totalChapters,
                        currentChapter = epubState.currentChapter,
                        chapters = epubState.chapters.map { epubChapter ->
                            EReaderChapter(
                                index = epubChapter.index,
                                title = epubChapter.title
                            )
                        },
                        currentChapterContent = getCurrentChapterContent(epubState.chapters, epubState.currentChapter),
                        canGoNext = epubState.canGoNext,
                        canGoPrevious = epubState.canGoPrevious,
                        progress = epubState.progress,
                        error = epubState.error
                    )
                }
            }
        }
        
        // Observe TTS state
        viewModelScope.launch {
            textToSpeechService.ttsState.collect { ttsState ->
                _uiState.update { currentState ->
                    currentState.copy(
                        isTTSPlaying = ttsState.isPlaying,
                        ttsError = ttsState.error
                    )
                }
            }
        }
    }
    
    /**
     * Load a book by media ID
     */
    fun loadBook(mediaId: Long) {
        if (currentMediaId == mediaId && _uiState.value.isLoaded) {
            return // Book already loaded
        }
        
        currentMediaId = mediaId
        _uiState.update { it.copy(mediaId = mediaId) }
        
        viewModelScope.launch {
            try {
                _uiState.update { it.copy(isLoading = true, error = null) }
                
                val mediaItem = mediaRepository.getMediaItemById(mediaId)
                if (mediaItem != null) {
                    val success = epubReaderService.loadEPUB(java.io.File(mediaItem.filePath))
                    if (!success) {
                        _uiState.update { 
                            it.copy(
                                isLoading = false, 
                                error = "Failed to load EPUB file"
                            ) 
                        }
                    }
                } else {
                    _uiState.update { 
                        it.copy(
                            isLoading = false, 
                            error = "Media item not found"
                        ) 
                    }
                }
            } catch (e: Exception) {
                _uiState.update { 
                    it.copy(
                        isLoading = false, 
                        error = "Error loading book: ${e.message}"
                    ) 
                }
            }
        }
    }
    
    /**
     * Navigate to the next chapter
     */
    fun nextChapter() {
        val success = epubReaderService.nextChapter()
        if (success) {
            updateReadingProgress()
        }
    }
    
    /**
     * Navigate to the previous chapter
     */
    fun previousChapter() {
        val success = epubReaderService.previousChapter()
        if (success) {
            updateReadingProgress()
        }
    }
    
    /**
     * Jump to a specific chapter
     */
    fun jumpToChapter(chapterIndex: Int) {
        val success = epubReaderService.jumpToChapter(chapterIndex)
        if (success) {
            updateReadingProgress()
        }
    }
    
    /**
     * Toggle Text-to-Speech playback
     */
    fun toggleTTS() {
        viewModelScope.launch {
            val state = _uiState.value
            if (state.isTTSPlaying) {
                textToSpeechService.pause()
            } else {
                val chapterContent = getCurrentChapterContent(
                    epubReaderService.readerState.value.chapters,
                    state.currentChapter
                )
                if (chapterContent.isNotEmpty()) {
                    // Extract plain text from HTML
                    val plainText = chapterContent
                        .replace(Regex("<[^>]*>"), "") // Remove HTML tags
                        .replace(Regex("&[^;]*;"), " ") // Remove HTML entities
                        .replace(Regex("\\s+"), " ") // Normalize whitespace
                        .trim()
                    
                    if (plainText.isNotEmpty()) {
                        textToSpeechService.speak(plainText)
                    }
                }
            }
        }
    }
    
    /**
     * Stop TTS playback
     */
    fun stopTTS() {
        textToSpeechService.stop()
    }
    private fun updateReadingProgress() {
        viewModelScope.launch {
            val state = _uiState.value
            if (state.mediaId > 0) {
                readerSettingsRepository.updateReadingProgress(
                    mediaId = state.mediaId,
                    chapter = state.currentChapter,
                    position = 0, // For now, we don't track position within chapter
                    progress = state.progress
                )
            }
        }
    }
    
    /**
     * Get the current chapter content
     */
    private fun getCurrentChapterContent(chapters: List<EpubChapter>, currentChapter: Int): String {
        return if (currentChapter in chapters.indices) {
            chapters[currentChapter].content
        } else {
            ""
        }
    }
}

/**
 * UI State for the E-Reader screen
 */
data class EReaderUiState(
    val mediaId: Long = 0,
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val bookTitle: String = "",
    val bookAuthor: String = "",
    val totalChapters: Int = 0,
    val currentChapter: Int = 0,
    val chapters: List<EReaderChapter> = emptyList(),
    val currentChapterContent: String = "",
    val canGoNext: Boolean = false,
    val canGoPrevious: Boolean = false,
    val progress: Float = 0f,
    val error: String? = null,
    val isTTSPlaying: Boolean = false,
    val ttsError: String? = null
) {
    val hasError: Boolean get() = error != null || ttsError != null
}

/**
 * Simplified chapter representation for UI
 */
data class EReaderChapter(
    val index: Int,
    val title: String
)