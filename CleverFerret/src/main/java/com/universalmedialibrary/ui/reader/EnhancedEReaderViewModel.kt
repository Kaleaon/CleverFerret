package com.universalmedialibrary.ui.reader

import android.content.Context
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
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
    val speed: Float = 1.0f
)

@HiltViewModel
class EnhancedEReaderViewModel @Inject constructor() : ViewModel() {

    private val _uiState = MutableStateFlow(EnhancedReaderUiState())
    val uiState: StateFlow<EnhancedReaderUiState> = _uiState.asStateFlow()

    private val _readerSettings = MutableStateFlow(ReaderSettingsModel.fromEntity(com.universalmedialibrary.data.local.entity.ReaderSettingsEntity()))
    val readerSettings: StateFlow<ReaderSettingsModel> = _readerSettings.asStateFlow()

    private val _ttsState = MutableStateFlow(SimpleTtsState())
    val ttsState: StateFlow<SimpleTtsState> = _ttsState.asStateFlow()

    fun loadBook(context: Context, bookFilePath: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true, error = null)
            // TODO: Parse EPUB/PDF and load metadata/content. For now, stub content.
            val fakeChapters = 12
            _uiState.value = _uiState.value.copy(
                bookTitle = bookFilePath.substringAfterLast('/'),
                currentChapterContent = "Sample chapter content for $bookFilePath\n\n" +
                    ("Lorem ipsum dolor sit amet, consectetur adipiscing elit. ".repeat(50)),
                totalChapters = fakeChapters,
                currentChapterIndex = 0,
                isLoading = false,
                isLoaded = true,
                error = null
            )
        }
    }

    fun initializeTTS(context: Context) {
        // No-op for now; real impl would initialize android.speech.tts.TextToSpeech
        _ttsState.value = _ttsState.value.copy(isPlaying = false, speed = 1.0f)
    }

    fun startTTS(content: String) {
        _ttsState.value = _ttsState.value.copy(isPlaying = true)
    }

    fun pauseTTS() {
        _ttsState.value = _ttsState.value.copy(isPlaying = false)
    }

    fun stopTTS() {
        _ttsState.value = _ttsState.value.copy(isPlaying = false)
    }

    fun adjustTTSSpeed(delta: Float) {
        val newSpeed = (_ttsState.value.speed + delta).coerceIn(0.5f, 2.0f)
        _ttsState.value = _ttsState.value.copy(speed = newSpeed)
    }

    fun toggleBookmark() {
        _uiState.value = _uiState.value.copy(isBookmarked = !_uiState.value.isBookmarked)
    }

    fun previousChapter() {
        val idx = (_uiState.value.currentChapterIndex - 1).coerceAtLeast(0)
        _uiState.value = _uiState.value.copy(currentChapterIndex = idx)
    }

    fun nextChapter() {
        val idx = (_uiState.value.currentChapterIndex + 1).coerceAtMost((_uiState.value.totalChapters - 1).coerceAtLeast(0))
        _uiState.value = _uiState.value.copy(currentChapterIndex = idx)
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
