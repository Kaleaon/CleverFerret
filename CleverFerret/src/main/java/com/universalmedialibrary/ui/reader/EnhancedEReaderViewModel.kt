package com.universalmedialibrary.ui.reader

import android.content.Context
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.util.Locale
import java.util.zip.ZipFile
import javax.inject.Inject
import com.universalmedialibrary.data.local.entity.ReaderSettings as ReaderSettingsModel

data class EnhancedReaderUiState(
    val bookTitle: String = "",
    val currentChapterContent: String = "",
    val totalChapters: Int = 0,
    val currentChapterIndex: Int = 0,
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
class EnhancedEReaderViewModel @Inject constructor() : ViewModel() {

    private val _uiState = MutableStateFlow(EnhancedReaderUiState())
    val uiState: StateFlow<EnhancedReaderUiState> = _uiState.asStateFlow()

    private val _readerSettings = MutableStateFlow(ReaderSettingsModel.fromEntity(com.universalmedialibrary.data.local.entity.ReaderSettingsEntity()))
    val readerSettings: StateFlow<ReaderSettingsModel> = _readerSettings.asStateFlow()

    private val _ttsState = MutableStateFlow(SimpleTtsState())
    val ttsState: StateFlow<SimpleTtsState> = _ttsState.asStateFlow()

    private var textToSpeech: TextToSpeech? = null
    private var chapters: List<String> = emptyList()

    fun loadBook(context: Context, bookFilePath: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            
            try {
                val file = File(bookFilePath)
                if (!file.exists()) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "File not found: $bookFilePath"
                    )
                    return@launch
                }

                when (file.extension.lowercase()) {
                    "txt", "md" -> loadTextFile(file)
                    "html", "htm" -> loadHtmlFile(file)
                    "epub" -> loadEpubFile(file)
                    else -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            error = "Unsupported format: ${file.extension}"
                        )
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load book: ${e.message}"
                )
            }
        }
    }

    private suspend fun loadTextFile(file: File) = withContext(Dispatchers.IO) {
        val content = file.readText()
        
        // Split into chapters
        chapters = content.split(Regex("\\n\\s*(Chapter|CHAPTER|Part|PART)\\s+\\d+[:\\s]"))
            .filter { it.isNotBlank() }
        
        if (chapters.isEmpty()) {
            chapters = listOf(content)
        }
        
        _uiState.value = _uiState.value.copy(
            bookTitle = file.nameWithoutExtension,
            currentChapterContent = chapters[0],
            totalChapters = chapters.size,
            currentChapterIndex = 0,
            isLoading = false,
            isLoaded = true,
            error = null
        )
    }

    private suspend fun loadHtmlFile(file: File) = withContext(Dispatchers.IO) {
        val content = file.readText()
        val strippedContent = content.replace(Regex("<[^>]*>"), "").trim()
        
        chapters = listOf(strippedContent)
        
        _uiState.value = _uiState.value.copy(
            bookTitle = file.nameWithoutExtension,
            currentChapterContent = strippedContent,
            totalChapters = 1,
            currentChapterIndex = 0,
            isLoading = false,
            isLoaded = true,
            error = null
        )
    }

    private suspend fun loadEpubFile(file: File) = withContext(Dispatchers.IO) {
        try {
            val zipFile = ZipFile(file)
            val entries = zipFile.entries().toList()
            
            val contentFiles = entries.filter { 
                it.name.endsWith(".html") || it.name.endsWith(".xhtml") || it.name.endsWith(".htm")
            }.sortedBy { it.name }
            
            chapters = contentFiles.mapNotNull { entry ->
                try {
                    val inputStream = zipFile.getInputStream(entry)
                    val content = inputStream.bufferedReader().use { it.readText() }
                    content.replace(Regex("<[^>]*>"), "")
                        .replace(Regex("&nbsp;"), " ")
                        .replace(Regex("&[a-z]+;"), "")
                        .trim()
                } catch (e: Exception) {
                    null
                }
            }.filter { it.isNotBlank() }
            
            zipFile.close()
            
            if (chapters.isEmpty()) {
                chapters = listOf("Unable to extract text content from EPUB file.")
            }
            
            _uiState.value = _uiState.value.copy(
                bookTitle = file.nameWithoutExtension,
                currentChapterContent = chapters[0],
                totalChapters = chapters.size,
                currentChapterIndex = 0,
                isLoading = false,
                isLoaded = true,
                error = null
            )
        } catch (e: Exception) {
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                error = "Failed to parse EPUB: ${e.message}"
            )
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
        val currentIndex = _uiState.value.currentChapterIndex
        if (currentIndex > 0 && chapters.isNotEmpty()) {
            val newIndex = currentIndex - 1
            _uiState.value = _uiState.value.copy(
                currentChapterIndex = newIndex,
                currentChapterContent = chapters[newIndex]
            )
            
            // Stop TTS when changing chapters
            stopTTS()
        }
    }

    fun nextChapter() {
        val currentIndex = _uiState.value.currentChapterIndex
        if (currentIndex < chapters.size - 1) {
            val newIndex = currentIndex + 1
            _uiState.value = _uiState.value.copy(
                currentChapterIndex = newIndex,
                currentChapterContent = chapters[newIndex]
            )
            
            // Stop TTS when changing chapters
            stopTTS()
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        textToSpeech?.stop()
        textToSpeech?.shutdown()
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
}
