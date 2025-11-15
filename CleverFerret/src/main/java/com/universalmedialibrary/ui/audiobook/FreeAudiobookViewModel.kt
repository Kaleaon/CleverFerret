package com.universalmedialibrary.ui.audiobook

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.audiobook.free.AudiobookDownloadOption
import com.universalmedialibrary.services.audiobook.free.FreeAudiobook
import com.universalmedialibrary.services.audiobook.free.FreeAudiobookDownloadService
import com.universalmedialibrary.services.audiobook.free.FreeAudiobookService
import com.universalmedialibrary.services.audiobook.free.FreeAudiobookSource
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class FreeAudiobookViewModel @Inject constructor(
    private val audiobookService: FreeAudiobookService,
    private val downloadService: FreeAudiobookDownloadService
) : ViewModel() {

    private val _uiState = MutableStateFlow(FreeAudiobookUiState())
    val uiState: StateFlow<FreeAudiobookUiState> = _uiState.asStateFlow()

    private var currentQuery: String = ""
    private var currentSource: FreeAudiobookSource? = null
    private var searchJob: Job? = null

    init {
        refresh()

        viewModelScope.launch {
            downloadService.events.collect { event ->
                val updated = _uiState.value.downloadStatus.toMutableMap()
                when (event) {
                    is FreeAudiobookDownloadService.DownloadEvent.Imported -> {
                        updated[event.audiobookId] = DownloadUiStatus.Imported(event.title)
                    }
                    is FreeAudiobookDownloadService.DownloadEvent.Saved -> {
                        updated[event.audiobookId] = DownloadUiStatus.Saved(event.title, event.message)
                    }
                    is FreeAudiobookDownloadService.DownloadEvent.Failed -> {
                        updated[event.audiobookId] = DownloadUiStatus.Error(event.message)
                    }
                }
                _uiState.value = _uiState.value.copy(downloadStatus = updated)
            }
        }
    }

    fun refresh() {
        loadAudiobooks(query = currentQuery, source = currentSource)
    }

    fun updateSource(source: FreeAudiobookSource?) {
        if (source == currentSource) return
        currentSource = source
        loadAudiobooks(query = currentQuery, source = currentSource)
    }

    fun updateQuery(query: String) {
        currentQuery = query
        loadAudiobooks(query = currentQuery, source = currentSource)
    }

    private fun loadAudiobooks(query: String, source: FreeAudiobookSource?) {
        searchJob?.cancel()
        searchJob = viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLoading = true,
                error = null,
                selectedSource = source,
                query = query
            )
            try {
                val results = if (query.isBlank()) {
                    audiobookService.getFeatured()
                } else {
                    audiobookService.search(query, source)
                }
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    results = results,
                    query = query
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Failed to load audiobooks",
                    query = query
                )
            }
        }
    }

    fun download(audiobook: FreeAudiobook, option: AudiobookDownloadOption) {
        viewModelScope.launch {
            runCatching {
                downloadService.enqueueDownload(audiobook, option)
            }.onSuccess { downloadId ->
                val status = _uiState.value.downloadStatus + (audiobook.id to DownloadUiStatus.Queued(downloadId))
                _uiState.value = _uiState.value.copy(downloadStatus = status)
            }.onFailure { error ->
                val status = _uiState.value.downloadStatus + (audiobook.id to DownloadUiStatus.Error(error.message ?: "Download failed"))
                _uiState.value = _uiState.value.copy(downloadStatus = status)
            }
        }
    }
}

data class FreeAudiobookUiState(
    val isLoading: Boolean = false,
    val results: List<FreeAudiobook> = emptyList(),
    val error: String? = null,
    val selectedSource: FreeAudiobookSource? = null,
    val query: String = "",
    val downloadStatus: Map<String, DownloadUiStatus> = emptyMap()
)

sealed class DownloadUiStatus {
    data class Queued(val downloadId: Long) : DownloadUiStatus()
    data class Imported(val title: String) : DownloadUiStatus()
    data class Saved(val title: String, val message: String) : DownloadUiStatus()
    data class Error(val message: String) : DownloadUiStatus()
}
