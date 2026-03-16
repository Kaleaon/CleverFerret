package com.universalmedialibrary.ui.ambient

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.AudioPack
import com.universalmedialibrary.services.ambient.AudioPackImporter
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for audio pack import screen
 */
@HiltViewModel
class AudioPackImportViewModel @Inject constructor(
    private val audioPackImporter: AudioPackImporter,
    private val audioPackDao: com.universalmedialibrary.data.local.dao.AudioPackDao
) : ViewModel() {

    private val _uiState = MutableStateFlow<AudioPackImportUiState>(AudioPackImportUiState.Idle)
    val uiState: StateFlow<AudioPackImportUiState> = _uiState.asStateFlow()

    private val _audioPacks = MutableStateFlow<List<AudioPack>>(emptyList())
    val audioPacks: StateFlow<List<AudioPack>> = _audioPacks.asStateFlow()

    private val _storageInfo = MutableStateFlow<AudioPackImporter.StorageInfo?>(null)
    val storageInfo: StateFlow<AudioPackImporter.StorageInfo?> = _storageInfo.asStateFlow()

    private var selectedZipUri: Uri? = null

    init {
        loadPacks()
        loadStorageInfo()
    }

    private fun loadPacks() {
        viewModelScope.launch {
            audioPackDao.getAllPacks().collect { packs ->
                _audioPacks.value = packs
            }
        }
    }

    private fun loadStorageInfo() {
        viewModelScope.launch {
            _storageInfo.value = audioPackImporter.getStorageInfo()
        }
    }

    fun setSelectedZip(uri: Uri) {
        selectedZipUri = uri
    }

    fun importPack(packName: String) {
        val uri = selectedZipUri ?: return

        viewModelScope.launch {
            _uiState.value = AudioPackImportUiState.Importing(0, "Starting import...")

            val result = audioPackImporter.importAudioPack(uri, packName) { progress, message ->
                _uiState.value = AudioPackImportUiState.Importing(progress, message)
            }

            _uiState.value = if (result.success) {
                AudioPackImportUiState.Success(result.message, result.soundsImported)
            } else {
                AudioPackImportUiState.Error(result.message, result.errors)
            }

            loadStorageInfo()
        }
    }

    fun deletePack(packId: Long) {
        viewModelScope.launch {
            audioPackImporter.deleteAudioPack(packId)
            loadStorageInfo()
        }
    }

    fun togglePackEnabled(packId: Long, enabled: Boolean) {
        viewModelScope.launch {
            audioPackDao.setPackEnabled(packId, enabled)
        }
    }

    fun clearState() {
        _uiState.value = AudioPackImportUiState.Idle
    }
}

sealed class AudioPackImportUiState {
    object Idle : AudioPackImportUiState()
    data class Importing(val progress: Int, val message: String) : AudioPackImportUiState()
    data class Success(val message: String, val soundsImported: Int) : AudioPackImportUiState()
    data class Error(val message: String, val errors: List<String>) : AudioPackImportUiState()
}
