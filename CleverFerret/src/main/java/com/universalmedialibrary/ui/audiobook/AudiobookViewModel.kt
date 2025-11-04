package com.universalmedialibrary.ui.audiobook

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.AudiobookDao
import com.universalmedialibrary.data.local.entity.AudiobookEntity
import com.universalmedialibrary.services.audiobook.AudiobookService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AudiobookViewModel @Inject constructor(
    private val audiobookService: AudiobookService,
    private val audiobookDao: AudiobookDao
) : ViewModel() {
    
    // PERFORMANCE FIX: Use WhileSubscribed instead of Eagerly to stop collecting
    // when no UI is observing, preventing unnecessary database queries
    val allAudiobooks = audiobookDao.getAll()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())
    
    val inProgress = audiobookDao.getInProgress()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())
    
    val finished = audiobookDao.getFinished()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())
    
    private val _importState = MutableStateFlow<ImportState>(ImportState.Idle)
    val importState: StateFlow<ImportState> = _importState.asStateFlow()
    
    private val _selectedFilter = MutableStateFlow(AudiobookFilter.ALL)
    val selectedFilter: StateFlow<AudiobookFilter> = _selectedFilter.asStateFlow()
    
    fun importAudiobook(filePath: String) {
        viewModelScope.launch {
            try {
                _importState.value = ImportState.Importing("Extracting metadata...")
                
                val result = audiobookService.importAudiobook(filePath)
                
                result.onSuccess { audiobook ->
                    _importState.value = ImportState.Success(audiobook)
                }.onFailure { error ->
                    _importState.value = ImportState.Error(
                        error.message ?: "Import failed"
                    )
                }
            } catch (e: Exception) {
                _importState.value = ImportState.Error(
                    e.message ?: "An error occurred"
                )
            }
        }
    }
    
    fun updatePosition(audiobookId: String, positionSeconds: Long) {
        viewModelScope.launch {
            audiobookService.updatePosition(audiobookId, positionSeconds)
        }
    }
    
    fun markFinished(audiobookId: String, finished: Boolean = true) {
        viewModelScope.launch {
            audiobookService.markFinished(audiobookId, finished)
        }
    }
    
    fun deleteAudiobook(audiobookId: String) {
        viewModelScope.launch {
            audiobookService.deleteAudiobook(audiobookId)
        }
    }
    
    fun setFilter(filter: AudiobookFilter) {
        _selectedFilter.value = filter
    }
    
    fun clearImportState() {
        _importState.value = ImportState.Idle
    }
}

sealed class ImportState {
    object Idle : ImportState()
    data class Importing(val message: String) : ImportState()
    data class Success(val audiobook: AudiobookEntity) : ImportState()
    data class Error(val message: String) : ImportState()
}

enum class AudiobookFilter {
    ALL,
    IN_PROGRESS,
    FINISHED,
    BY_AUTHOR,
    BY_GENRE
}
