package com.universalmedialibrary.ui.open

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MediaOpenViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val musicPlayerService: AdvancedMusicPlayerService
) : ViewModel() {

    data class UiState(
        val isLoading: Boolean = true,
        val mediaItem: MediaItem? = null,
        val error: String? = null,
        val audioPlaybackStarted: Boolean = false
    )

    private val _uiState = MutableStateFlow(UiState())
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()

    fun load(itemId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = UiState(isLoading = true)
                val item = mediaItemDao.getMediaItemById(itemId)
                if (item == null) {
                    _uiState.value = UiState(isLoading = false, error = "Media item not found")
                } else {
                    _uiState.value = UiState(isLoading = false, mediaItem = item)
                }
            } catch (e: Exception) {
                _uiState.value = UiState(isLoading = false, error = e.message ?: "Unknown error")
            }
        }
    }

    fun playAudioFile(mediaItem: MediaItem) {
        viewModelScope.launch {
            try {
                musicPlayerService.playTrack(mediaItem)
                _uiState.value = _uiState.value.copy(audioPlaybackStarted = true)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = "Error playing audio: ${e.message}")
            }
        }
    }
}
