package com.universalmedialibrary.ui.reader

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.epub.EpubReaderService
import com.universalmedialibrary.services.reader.AnnotationService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject
import kotlin.math.abs

private const val THIRTY_SECONDS_MS = 30_000L
private const val MILLIS_PER_MINUTE = 60_000L
private const val MILLIS_PER_DAY = 86_400_000L

@HiltViewModel
class EPUBReaderViewModel @Inject constructor(
    private val epubReaderService: EpubReaderService,
    private val annotationService: AnnotationService
) : ViewModel() {

    internal var ioScope: CoroutineScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)

    private val _uiState = MutableStateFlow(EpubReaderUiState())
    val uiState: StateFlow<EpubReaderUiState> = _uiState.asStateFlow()

    internal var currentItemId: Long = 0L
    internal var sessionStartTime: Long = 0L
    internal var sessionStartProgress: Float = 0f
    internal var pendingChaptersCompleted: Int = 0

    init {
        viewModelScope.launch {
            epubReaderService.readerState.collectLatest { state ->
                _uiState.update { current ->
                    current.copy(
                        bookTitle = state.bookTitle,
                        bookAuthor = state.bookAuthor,
                        isLoaded = state.isLoaded,
                        currentChapter = state.currentChapter,
                        totalChapters = state.totalChapters,
                        error = state.error,
                        chapters = state.chapters.map { it.title },
                        currentContent = state.currentContent.ifBlank { current.currentContent }
                    )
                }
            }
        }
    }

    fun loadBook(bookUri: String, itemId: Long = 0L) {
        viewModelScope.launch {
            closeReader()
            _uiState.update { it.copy(error = null, isLoaded = false) }
            val resolvedItemId = if (itemId != 0L) {
                itemId
            } else {
                val code = bookUri.hashCode().toLong()
                if (code == Long.MIN_VALUE) 0L else abs(code)
            }
            currentItemId = resolvedItemId
            val uri = parseUri(bookUri)
            val success = epubReaderService.loadEPUB(uri)
            if (success) {
                sessionStartTime = System.currentTimeMillis()
                sessionStartProgress = calculateCurrentProgress()
                pendingChaptersCompleted = 0
            } else {
                _uiState.update {
                    it.copy(error = "Failed to load EPUB content.")
                }
            }
        }
    }

    fun nextChapter() {
        if (epubReaderService.nextChapter()) {
            pendingChaptersCompleted++
            recordActiveSession()
            updateContent()
        }
    }

    fun previousChapter() {
        if (epubReaderService.previousChapter()) {
            recordActiveSession()
            updateContent()
        }
    }

    fun jumpToChapter(index: Int) {
        if (epubReaderService.jumpToChapter(index)) {
            recordActiveSession()
            updateContent()
        }
    }

    fun closeReader() {
        recordActiveSession()
        sessionStartTime = 0L
        pendingChaptersCompleted = 0
    }

    override fun onCleared() {
        closeReader()
        super.onCleared()
    }

    internal fun recordActiveSession(
        currentTime: Long = System.currentTimeMillis()
    ) {
        val startTime = sessionStartTime
        if (startTime <= 0L) return
        val durationMs = currentTime - startTime

        if (durationMs < THIRTY_SECONDS_MS) {
            return
        }

        val currentProgress = calculateCurrentProgress()
        val startProg = sessionStartProgress
        val chapters = pendingChaptersCompleted
        val itemId = currentItemId

        val dayStart1 = (startTime / MILLIS_PER_DAY) * MILLIS_PER_DAY
        val dayStart2 = (currentTime / MILLIS_PER_DAY) * MILLIS_PER_DAY

        if (dayStart1 == dayStart2) {
            val minutes = maxOf(1, ((durationMs + THIRTY_SECONDS_MS) / MILLIS_PER_MINUTE).toInt())
            dispatchSessionRecording(minutes, chapters, startProg, currentProgress, dayStart1)
        } else {
            handleMidnightTransition(
                currentTime = currentTime,
                dayStart1 = dayStart1,
                dayStart2 = dayStart2,
                currentProgress = currentProgress
            )
        }

        sessionStartTime = currentTime
        sessionStartProgress = currentProgress
        pendingChaptersCompleted = 0
    }

    private fun handleMidnightTransition(
        currentTime: Long,
        dayStart1: Long,
        dayStart2: Long,
        currentProgress: Float
    ) {
        val startTime = sessionStartTime
        val chapters = pendingChaptersCompleted
        val startProg = sessionStartProgress
        val midnight = dayStart2
        val durationDay1 = midnight - startTime
        val durationDay2 = currentTime - midnight

        if (durationDay1 >= THIRTY_SECONDS_MS) {
            val minutes1 = maxOf(1, ((durationDay1 + THIRTY_SECONDS_MS) / MILLIS_PER_MINUTE).toInt())
            dispatchSessionRecording(minutes1, chapters, startProg, currentProgress, dayStart1)
        }

        if (durationDay2 >= THIRTY_SECONDS_MS) {
            val minutes2 = maxOf(1, ((durationDay2 + THIRTY_SECONDS_MS) / MILLIS_PER_MINUTE).toInt())
            dispatchSessionRecording(minutes2, 0, currentProgress, currentProgress, dayStart2)
        }
    }

    private fun dispatchSessionRecording(
        minutes: Int,
        chapters: Int,
        startProgress: Float,
        endProgress: Float,
        date: Long
    ) {
        val itemId = currentItemId
        ioScope.launch {
            annotationService.recordReadingSession(
                itemId = itemId,
                readingTimeMinutes = minutes,
                pagesRead = chapters,
                chaptersCompleted = chapters,
                wordsRead = 0,
                startProgress = startProgress,
                endProgress = endProgress,
                date = date
            )
        }
    }

    private fun calculateCurrentProgress(): Float {
        val total = epubReaderService.readerState.value.totalChapters
        val current = epubReaderService.readerState.value.currentChapter
        return if (total > 0) {
            (current.toFloat() / total.toFloat()).coerceIn(0f, 1f)
        } else {
            0f
        }
    }

    private fun updateContent() {
        val content = epubReaderService.readerState.value.currentContent
        _uiState.update { it.copy(currentContent = content) }
    }

    private fun parseUri(bookUri: String): Uri {
        val decoded = Uri.decode(bookUri)
        val uri = Uri.parse(decoded)
        return if (uri.scheme.isNullOrBlank()) {
            Uri.fromFile(File(decoded))
        } else {
            uri
        }
    }
}
