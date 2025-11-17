package com.universalmedialibrary.ui.reader

import android.content.Context
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import android.net.Uri
import com.universalmedialibrary.data.local.entity.EnhancedAnnotation
import com.universalmedialibrary.data.local.entity.AnnotationExportConfig
import com.universalmedialibrary.services.reader.EnhancedUniversalReaderService
import com.universalmedialibrary.services.reader.AnnotationService
import com.universalmedialibrary.services.reading.AnnotationExportService
import com.universalmedialibrary.services.reader.model.BookFormat
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import java.io.File
import java.util.Locale
import javax.inject.Inject
import com.universalmedialibrary.data.local.entity.ReaderSettings as ReaderSettingsModel

data class EnhancedReaderUiState(
    val bookTitle: String = "",
    val currentChapterContent: String = "",
    val totalChapters: Int = 0,
    val currentChapterIndex: Int = 0,
    val chapters: List<String> = emptyList(),
    val enhancedAnnotations: List<EnhancedAnnotation> = emptyList(),
    val isBookmarked: Boolean = false,
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val error: String? = null
)

data class SimpleTtsState(
    val isPlaying: Boolean = false,
    val isPaused: Boolean = false,
    val speed: Float = 1.0f,
    val isInitialized: Boolean = false
)

@HiltViewModel
class EnhancedEReaderViewModel @Inject constructor(
    private val readerService: EnhancedUniversalReaderService,
    private val annotationService: AnnotationService,
    private val annotationExportService: AnnotationExportService
) : ViewModel() {

    private val _uiState = MutableStateFlow(EnhancedReaderUiState())
    val uiState: StateFlow<EnhancedReaderUiState> = _uiState.asStateFlow()

    private val _readerSettings = MutableStateFlow(ReaderSettingsModel.fromEntity(com.universalmedialibrary.data.local.entity.ReaderSettingsEntity()))
    val readerSettings: StateFlow<ReaderSettingsModel> = _readerSettings.asStateFlow()

    private val _ttsState = MutableStateFlow(SimpleTtsState())
    val ttsState: StateFlow<SimpleTtsState> = _ttsState.asStateFlow()

    private var textToSpeech: TextToSpeech? = null
    private var currentBookId: Long = 0
    private var annotationsJob: Job? = null

    fun loadBook(bookFilePath: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)

            annotationsJob?.cancel()

            val file = File(bookFilePath)
            if (!file.exists()) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "File not found: $bookFilePath"
                )
                return@launch
            }

            val bookId = file.absolutePath.hashCode().toLong()
            currentBookId = bookId
            val format = determineFormat(file.extension)
            val uri = Uri.fromFile(file)

            val result = readerService.openBook(bookId, uri, format)
            if (result.isSuccess) {
                val chapters = readerService.getTableOfContents()
                val progress = readerService.getEpubProgress()
                val currentIndex = (progress?.currentChapter ?: 1).coerceAtLeast(1) - 1
                val content = readerService.getCurrentChapterContent().orEmpty()

                _uiState.value = _uiState.value.copy(
                    bookTitle = file.nameWithoutExtension,
                    currentChapterContent = content,
                    chapters = chapters.map { it.title },
                    totalChapters = chapters.size.coerceAtLeast(1),
                    currentChapterIndex = currentIndex.coerceIn(0, chapters.size.coerceAtLeast(1) - 1),
                    isLoading = false,
                    isLoaded = true,
                    error = null
                )

                annotationsJob?.cancel()
                annotationsJob = viewModelScope.launch {
                    annotationService.getEnhancedAnnotationsForBook(bookId).collect { annotations ->
                        _uiState.value = _uiState.value.copy(enhancedAnnotations = annotations)
                    }
                }
            } else {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = result.exceptionOrNull()?.message ?: "Failed to open book"
                )
                currentBookId = 0
            }
        }
    }

    fun initializeTTS(context: Context) {
        if (textToSpeech == null) {
            textToSpeech = TextToSpeech(context) { status ->
                if (status == TextToSpeech.SUCCESS) {
                    val result = textToSpeech?.setLanguage(Locale.US)
                    if (result == TextToSpeech.LANG_MISSING_DATA || result == TextToSpeech.LANG_NOT_SUPPORTED) {
                        _ttsState.value = _ttsState.value.copy(isInitialized = false)
                    } else {
                        textToSpeech?.setSpeechRate(_ttsState.value.speed)
                        _ttsState.value = _ttsState.value.copy(isInitialized = true)
                    }
                }
            }
            
            textToSpeech?.setOnUtteranceProgressListener(object : UtteranceProgressListener() {
                override fun onStart(utteranceId: String?) {
                    _ttsState.value = _ttsState.value.copy(isPlaying = true, isPaused = false)
                }
                
                override fun onDone(utteranceId: String?) {
                    _ttsState.value = _ttsState.value.copy(isPlaying = false, isPaused = false)
                }
                
                override fun onError(utteranceId: String?) {
                    _ttsState.value = _ttsState.value.copy(isPlaying = false, isPaused = false)
                }
            })
        }
    }

    fun startTTS(content: String) {
        if (textToSpeech != null && _ttsState.value.isInitialized) {
            if (_ttsState.value.isPaused) {
                // Resume if paused
                textToSpeech?.speak("", TextToSpeech.QUEUE_ADD, null, null)
            } else {
                // Start new TTS
                textToSpeech?.speak(content, TextToSpeech.QUEUE_FLUSH, null, "utteranceId")
            }
            _ttsState.value = _ttsState.value.copy(isPlaying = true, isPaused = false)
        }
    }

    fun pauseTTS() {
        textToSpeech?.stop()
        _ttsState.value = _ttsState.value.copy(isPlaying = false, isPaused = true)
    }

    fun stopTTS() {
        textToSpeech?.stop()
        _ttsState.value = _ttsState.value.copy(isPlaying = false, isPaused = false)
    }

    fun adjustTTSSpeed(delta: Float) {
        val newSpeed = (_ttsState.value.speed + delta).coerceIn(0.5f, 2.0f)
        textToSpeech?.setSpeechRate(newSpeed)
        _ttsState.value = _ttsState.value.copy(speed = newSpeed)
    }

    fun toggleBookmark() {
        _uiState.value = _uiState.value.copy(isBookmarked = !_uiState.value.isBookmarked)
    }

    fun previousChapter() {
        val targetIndex = (_uiState.value.currentChapterIndex - 1).coerceAtLeast(0)
        goToChapter(targetIndex)
    }

    fun nextChapter() {
        val total = _uiState.value.totalChapters
        val targetIndex = (_uiState.value.currentChapterIndex + 1).coerceAtMost(total - 1)
        goToChapter(targetIndex)
    }
    
    fun goToChapter(index: Int) {
        viewModelScope.launch {
            val total = _uiState.value.totalChapters
            val current = _uiState.value.currentChapterIndex
            if (index !in 0 until total || index == current) return@launch

            val success = readerService.goToChapter(index)
            if (success) {
                val content = readerService.getCurrentChapterContent().orEmpty()
                _uiState.value = _uiState.value.copy(
                    currentChapterIndex = index,
                    currentChapterContent = content
                )
                stopTTS()
            }
        }
    }
    
    override fun onCleared() {
        viewModelScope.launch {
            readerService.closeCurrentBook()
        }
        annotationsJob?.cancel()
        textToSpeech?.stop()
        textToSpeech?.shutdown()
        super.onCleared()
    }

    fun increaseFontSize() {
        val size = _readerSettings.value.fontSize + 1
        _readerSettings.value = _readerSettings.value.copy(fontSize = size)
    }

    fun decreaseFontSize() {
        val size = (_readerSettings.value.fontSize - 1).coerceAtLeast(10)
        _readerSettings.value = _readerSettings.value.copy(fontSize = size)
    }

    fun toggleDarkMode() {
        val newTheme = if (_readerSettings.value.theme == "Dark") "Light" else "Dark"
        _readerSettings.value = _readerSettings.value.copy(theme = newTheme)
    }

    fun toggleJustified() {
        val newAlignment = if (_readerSettings.value.textAlignment == "Justify") "Left" else "Justify"
        _readerSettings.value = _readerSettings.value.copy(textAlignment = newAlignment)
    }

    fun exportAnnotations(
        destination: File,
        config: AnnotationExportConfig,
        onResult: (Result<File>) -> Unit = {}
    ) {
        val bookId = currentBookId.takeIf { it != 0L } ?: return
        viewModelScope.launch {
            val result = annotationExportService.exportAnnotations(
                itemId = bookId,
                config = config,
                outputPath = destination.absolutePath
            )
            onResult(result)
        }
    }

    private fun determineFormat(extension: String): BookFormat = when (extension.lowercase()) {
        "epub" -> BookFormat.EPUB
        "pdf" -> BookFormat.PDF
        "cbz" -> BookFormat.CBZ
        "cbr" -> BookFormat.CBR
        else -> BookFormat.UNKNOWN
    }
}
