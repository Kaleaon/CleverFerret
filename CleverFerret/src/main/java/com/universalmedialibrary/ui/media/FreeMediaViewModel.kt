package com.universalmedialibrary.ui.media

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.media.free.FreeMediaItem
import com.universalmedialibrary.services.media.free.FreeMediaService
import com.universalmedialibrary.services.media.free.FreeMediaType
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class FreeMediaViewModel @Inject constructor(
    private val freeMediaService: FreeMediaService
) : ViewModel() {

    private val _uiState = MutableStateFlow(FreeMediaUiState())
    val uiState: StateFlow<FreeMediaUiState> = _uiState.asStateFlow()

    private var currentType: FreeMediaType = FreeMediaType.COMIC
    private var currentQuery: String = ""
    private var loadJob: Job? = null

    init {
        loadMedia()
    }

    fun selectType(type: FreeMediaType) {
        if (type == currentType) return
        currentType = type
        currentQuery = ""
        loadMedia()
    }

    fun search(query: String) {
        currentQuery = query
        loadMedia()
    }

    private fun loadMedia() {
        loadJob?.cancel()
        loadJob = viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLoading = true,
                error = null,
                activeType = currentType,
                query = currentQuery
            )

            try {
                val results = when (currentType) {
                    FreeMediaType.COMIC -> {
                        if (currentQuery.isBlank()) {
                            freeMediaService.getFeaturedComics()
                        } else {
                            freeMediaService.searchComics(currentQuery)
                        }
                    }
                    FreeMediaType.FEATURE_FILM -> {
                        if (currentQuery.isBlank()) {
                            freeMediaService.getFeaturedFeatureFilms()
                        } else {
                            freeMediaService.searchFeatureFilms(currentQuery)
                        }
                    }
                    FreeMediaType.NATIONAL_SCREENING_ROOM -> {
                        if (currentQuery.isBlank()) {
                            freeMediaService.getNationalScreeningRoom()
                        } else {
                            freeMediaService.searchNationalScreeningRoom(currentQuery)
                        }
                    }
                }

                // Check if results are empty and provide a better message
                if (results.isEmpty() && currentQuery.isBlank()) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        results = emptyList(),
                        error = "No items available. The Internet Archive may be temporarily unavailable."
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        results = results,
                        error = null
                    )
                }
            } catch (e: kotlinx.coroutines.CancellationException) {
                // Job was cancelled (e.g., by user switching tabs), don't update state
                throw e
            } catch (e: java.net.UnknownHostException) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "No internet connection. Please check your network and try again."
                )
            } catch (e: java.net.SocketTimeoutException) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Connection timed out. The Internet Archive may be busy. Please try again."
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Failed to load media items. Please try again."
                )
            }
        }
    }
}

data class FreeMediaUiState(
    val isLoading: Boolean = false,
    val results: List<FreeMediaItem> = emptyList(),
    val error: String? = null,
    val activeType: FreeMediaType = FreeMediaType.COMIC,
    val query: String = ""
)
