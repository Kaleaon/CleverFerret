package com.universalmedialibrary.ui.fanfiction

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.FanfictionDao
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.services.fanfiction.FanfictionDownloadService
import com.universalmedialibrary.services.fanfiction.models.StoryMetadata
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class FanfictionViewModel @Inject constructor(
    private val fanfictionService: FanfictionDownloadService,
    private val fanfictionDao: FanfictionDao
) : ViewModel() {
    
    val allStories = fanfictionDao.getAllStories()
        .stateIn(viewModelScope, SharingStarted.Eagerly, emptyList())
    
    private val _downloadState = MutableStateFlow<DownloadState>(DownloadState.Idle)
    val downloadState: StateFlow<DownloadState> = _downloadState.asStateFlow()
    
    private val _selectedFilter = MutableStateFlow(FilterType.ALL)
    val selectedFilter: StateFlow<FilterType> = _selectedFilter.asStateFlow()
    
    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()
    
    private val _updateStatus = MutableStateFlow<String?>(null)
    val updateStatus: StateFlow<String?> = _updateStatus.asStateFlow()
    
    fun downloadStory(url: String) {
        if (url.isBlank()) {
            _downloadState.value = DownloadState.Error("Please enter a URL")
            return
        }
        
        viewModelScope.launch {
            try {
                _downloadState.value = DownloadState.Downloading(0, 0, "Starting download...")
                
                val result = fanfictionService.downloadStory(url) { current, total, message ->
                    _downloadState.value = DownloadState.Downloading(current, total, message)
                }
                
                result.onSuccess { metadata ->
                    _downloadState.value = DownloadState.Success(metadata)
                }.onFailure { error ->
                    _downloadState.value = DownloadState.Error(
                        error.message ?: "Download failed"
                    )
                }
            } catch (e: Exception) {
                _downloadState.value = DownloadState.Error(
                    e.message ?: "An error occurred"
                )
            }
        }
    }
    
    fun checkForUpdates() {
        viewModelScope.launch {
            try {
                _updateStatus.value = "Checking for updates..."
                val updates = fanfictionService.checkAllForUpdates()
                
                if (updates.isEmpty()) {
                    _updateStatus.value = "All stories are up to date!"
                } else {
                    _updateStatus.value = "Found ${updates.size} stories with updates"
                }
            } catch (e: Exception) {
                _updateStatus.value = "Error checking updates: ${e.message}"
            }
        }
    }
    
    fun updateStory(storyId: String) {
        viewModelScope.launch {
            try {
                _downloadState.value = DownloadState.Downloading(0, 0, "Updating story...")
                
                val result = fanfictionService.updateStory(storyId) { current, total, message ->
                    _downloadState.value = DownloadState.Downloading(current, total, message)
                }
                
                result.onSuccess { metadata ->
                    _downloadState.value = DownloadState.Success(metadata)
                }.onFailure { error ->
                    _downloadState.value = DownloadState.Error(
                        error.message ?: "Update failed"
                    )
                }
            } catch (e: Exception) {
                _downloadState.value = DownloadState.Error(
                    e.message ?: "An error occurred"
                )
            }
        }
    }
    
    fun deleteStory(story: FanfictionStoryEntity) {
        viewModelScope.launch {
            fanfictionDao.deleteStory(story)
        }
    }
    
    fun setFilter(filter: FilterType) {
        _selectedFilter.value = filter
    }
    
    fun setSearchQuery(query: String) {
        _searchQuery.value = query
    }
    
    fun clearDownloadState() {
        _downloadState.value = DownloadState.Idle
    }
    
    fun clearUpdateStatus() {
        _updateStatus.value = null
    }
}

sealed class DownloadState {
    object Idle : DownloadState()
    data class Downloading(
        val current: Int,
        val total: Int,
        val message: String
    ) : DownloadState()
    data class Success(val metadata: StoryMetadata) : DownloadState()
    data class Error(val message: String) : DownloadState()
}

enum class FilterType {
    ALL,
    IN_PROGRESS,
    COMPLETE,
    AO3,
    FFN,
    ROYAL_ROAD
}
