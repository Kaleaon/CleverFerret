package com.universalmedialibrary.ui.aientertainment

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.aientertainment.AIEntertainmentRepository
import com.universalmedialibrary.data.aientertainment.ChatPreset
import com.universalmedialibrary.data.aientertainment.ChatPresetDao
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Chat Presets management
 */
@HiltViewModel
class ChatPresetsViewModel @Inject constructor(
    private val aiEntertainmentRepository: AIEntertainmentRepository
) : ViewModel() {

    private val _presets = MutableStateFlow<List<ChatPreset>>(emptyList())
    val presets: StateFlow<List<ChatPreset>> = _presets.asStateFlow()

    private val _isLoading = MutableStateFlow(true)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    private val _currentUserId = MutableStateFlow<Long?>(null)

    init {
        loadCurrentUser()
    }

    private fun loadCurrentUser() {
        viewModelScope.launch {
            try {
                val user = aiEntertainmentRepository.getCurrentUser()
                _currentUserId.value = user?.id
                user?.id?.let { userId ->
                    loadPresets(userId)
                }
            } catch (e: Exception) {
                _isLoading.value = false
            }
        }
    }

    private fun loadPresets(userId: Long) {
        viewModelScope.launch {
            try {
                aiEntertainmentRepository.getPresetsForUser(userId).collect { presetList ->
                    _presets.value = presetList
                    _isLoading.value = false
                }
            } catch (e: Exception) {
                _isLoading.value = false
            }
        }
    }

    fun createPreset(preset: ChatPreset) {
        viewModelScope.launch {
            val userId = _currentUserId.value ?: return@launch
            val newPreset = preset.copy(userId = userId)
            aiEntertainmentRepository.createPreset(newPreset)
        }
    }

    fun createFromTemplate(template: ChatPreset) {
        viewModelScope.launch {
            val userId = _currentUserId.value ?: return@launch
            val newPreset = template.copy(
                id = 0, // Reset ID for new insert
                userId = userId,
                createdAt = System.currentTimeMillis(),
                updatedAt = System.currentTimeMillis()
            )
            aiEntertainmentRepository.createPreset(newPreset)
        }
    }

    fun updatePreset(preset: ChatPreset) {
        viewModelScope.launch {
            aiEntertainmentRepository.updatePreset(preset)
        }
    }

    fun deletePreset(presetId: Long) {
        viewModelScope.launch {
            aiEntertainmentRepository.deletePreset(presetId)
        }
    }

    fun toggleFavorite(presetId: Long) {
        viewModelScope.launch {
            val preset = _presets.value.find { it.id == presetId } ?: return@launch
            aiEntertainmentRepository.setPresetFavorite(presetId, !preset.isFavorite)
        }
    }

    fun usePreset(presetId: Long) {
        viewModelScope.launch {
            aiEntertainmentRepository.incrementPresetUseCount(presetId)
        }
    }
}
