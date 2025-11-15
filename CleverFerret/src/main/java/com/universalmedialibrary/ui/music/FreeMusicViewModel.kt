package com.universalmedialibrary.ui.music

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.music.free.FreeMusicService
import com.universalmedialibrary.services.music.free.FreeMusicSource
import com.universalmedialibrary.services.music.free.FreeMusicTrack
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class FreeMusicViewModel @Inject constructor(
    private val freeMusicService: FreeMusicService
) : ViewModel() {

    private val _uiState = MutableStateFlow(FreeMusicUiState())
    val uiState: StateFlow<FreeMusicUiState> = _uiState.asStateFlow()

    private var currentSource: FreeMusicSource? = null
    private var currentQuery: String = ""
    private var loadJob: Job? = null

    init {
        loadTracks()
    }

    fun selectSource(source: FreeMusicSource?) {
        if (source == currentSource) return
        currentSource = source
        loadTracks()
    }

    fun search(query: String) {
        currentQuery = query
        loadTracks()
    }

    private fun loadTracks() {
        loadJob?.cancel()
        loadJob = viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLoading = true,
                error = null,
                selectedSource = currentSource,
                query = currentQuery
            )

            try {
                val results = when {
                    currentQuery.isNotBlank() -> freeMusicService.search(currentQuery)
                    currentSource != null -> freeMusicService.getTracksBySource(currentSource!!)
                    else -> freeMusicService.getAllTracks()
                }

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    tracks = results
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Failed to load tracks"
                )
            }
        }
    }
}

data class FreeMusicUiState(
    val isLoading: Boolean = false,
    val tracks: List<FreeMusicTrack> = emptyList(),
    val error: String? = null,
    val selectedSource: FreeMusicSource? = null,
    val query: String = ""
)
