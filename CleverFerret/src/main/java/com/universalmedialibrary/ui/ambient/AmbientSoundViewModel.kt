package com.universalmedialibrary.ui.ambient

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientPlaylist
import com.universalmedialibrary.data.local.entity.AmbientCategory
import com.universalmedialibrary.services.ambient.AmbientSoundService
import com.universalmedialibrary.services.ambient.ContextDetectionService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for managing ambient sound playback and playlists
 */
@HiltViewModel
class AmbientSoundViewModel @Inject constructor(
    private val ambientSoundService: AmbientSoundService,
    private val contextDetectionService: ContextDetectionService
) : ViewModel() {

    private val _uiState = MutableStateFlow<AmbientSoundUiState>(AmbientSoundUiState.Loading)
    val uiState: StateFlow<AmbientSoundUiState> = _uiState.asStateFlow()

    private val _playingSounds = MutableStateFlow<Set<Long>>(emptySet())
    val playingSounds: StateFlow<Set<Long>> = _playingSounds.asStateFlow()

    init {
        loadSounds()
    }

    /**
     * Load all ambient sounds
     */
    fun loadSounds() {
        viewModelScope.launch {
            try {
                ambientSoundService.getAllEnabledSounds()
                    .catch { error ->
                        _uiState.value = AmbientSoundUiState.Error(error.message ?: "Failed to load sounds")
                    }
                    .collect { sounds ->
                        if (sounds.isEmpty()) {
                            // Initialize default sounds if none exist
                            ambientSoundService.initializeDefaultSounds()
                        } else {
                            _uiState.value = AmbientSoundUiState.Success(sounds)
                        }
                    }
            } catch (e: Exception) {
                _uiState.value = AmbientSoundUiState.Error(e.message ?: "Failed to load sounds")
            }
        }
    }

    /**
     * Load sounds by category
     */
    fun loadSoundsByCategory(category: AmbientCategory) {
        viewModelScope.launch {
            try {
                ambientSoundService.getSoundsByCategory(category)
                    .catch { error ->
                        _uiState.value = AmbientSoundUiState.Error(error.message ?: "Failed to load sounds")
                    }
                    .collect { sounds ->
                        _uiState.value = AmbientSoundUiState.Success(sounds)
                    }
            } catch (e: Exception) {
                _uiState.value = AmbientSoundUiState.Error(e.message ?: "Failed to load sounds")
            }
        }
    }

    /**
     * Load favorite sounds
     */
    fun loadFavoriteSounds() {
        viewModelScope.launch {
            try {
                ambientSoundService.getFavoriteSounds()
                    .catch { error ->
                        _uiState.value = AmbientSoundUiState.Error(error.message ?: "Failed to load favorites")
                    }
                    .collect { sounds ->
                        _uiState.value = AmbientSoundUiState.Success(sounds)
                    }
            } catch (e: Exception) {
                _uiState.value = AmbientSoundUiState.Error(e.message ?: "Failed to load favorites")
            }
        }
    }

    /**
     * Toggle sound playback
     */
    fun toggleSound(sound: AmbientSound) {
        viewModelScope.launch {
            if (_playingSounds.value.contains(sound.id)) {
                ambientSoundService.stopSound(sound.id)
                _playingSounds.value = _playingSounds.value - sound.id
            } else {
                ambientSoundService.playSound(sound)
                _playingSounds.value = _playingSounds.value + sound.id
            }
        }
    }

    /**
     * Stop all playing sounds
     */
    fun stopAllSounds() {
        viewModelScope.launch {
            ambientSoundService.stopAllSounds()
            _playingSounds.value = emptySet()
        }
    }

    /**
     * Toggle favorite status
     */
    fun toggleFavorite(sound: AmbientSound) {
        viewModelScope.launch {
            ambientSoundService.toggleFavorite(sound.id, !sound.isFavorite)
        }
    }

    /**
     * Update sound volume
     */
    fun updateVolume(soundId: Long, volume: Float) {
        viewModelScope.launch {
            ambientSoundService.updateVolume(soundId, volume)
        }
    }

    /**
     * Detect ambient context from text
     */
    fun detectContext(text: String) {
        viewModelScope.launch {
            try {
                val suggestions = contextDetectionService.getSuggestionsForChapter(text)
                // Handle suggestions (could emit as a separate state)
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    override fun onCleared() {
        super.onCleared()
        ambientSoundService.cleanup()
    }
}

/**
 * UI state for ambient sound screen
 */
sealed class AmbientSoundUiState {
    object Loading : AmbientSoundUiState()
    data class Success(val sounds: List<AmbientSound>) : AmbientSoundUiState()
    data class Error(val message: String) : AmbientSoundUiState()
}
