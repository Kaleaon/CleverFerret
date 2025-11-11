package com.universalmedialibrary.ui.fanfiction

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.FanfictionDao
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.services.DownloadBlockedException
import com.universalmedialibrary.services.DownloadSafetyChecker
import com.universalmedialibrary.services.ContentPinRequiredException
import com.universalmedialibrary.services.fanfiction.FanfictionDownloadService
import com.universalmedialibrary.services.fanfiction.models.StoryMetadata
import com.universalmedialibrary.ui.components.pin.PinChallenge
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
    private val fanfictionDao: FanfictionDao,
    private val downloadSafetyChecker: DownloadSafetyChecker
) : ViewModel() {
    
    // PERFORMANCE FIX: Use WhileSubscribed to stop collecting when no UI is observing
    val allStories = fanfictionDao.getAllStories()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())
    
    private val _downloadState = MutableStateFlow<DownloadState>(DownloadState.Idle)
    val downloadState: StateFlow<DownloadState> = _downloadState.asStateFlow()
    
    private val _selectedFilter = MutableStateFlow(FilterType.ALL)
    val selectedFilter: StateFlow<FilterType> = _selectedFilter.asStateFlow()
    
    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()
    
    private val _updateStatus = MutableStateFlow<String?>(null)
    val updateStatus: StateFlow<String?> = _updateStatus.asStateFlow()
    private val _pendingPinChallenge = MutableStateFlow<PinChallenge?>(null)
    val pendingPinChallenge: StateFlow<PinChallenge?> = _pendingPinChallenge.asStateFlow()
    private var pendingPinAction: (() -> Unit)? = null
    
    fun downloadStory(url: String, bypassPin: Boolean = false) {
        if (url.isBlank()) {
            _downloadState.value = DownloadState.Error("Please enter a URL")
            return
        }
        
        viewModelScope.launch {
            try {
                _downloadState.value = DownloadState.Downloading(0, 0, "Starting download...")
                
                val result = fanfictionService.downloadStory(
                    url = url,
                    bypassPin = bypassPin
                ) { current, total, message ->
                    _downloadState.value = DownloadState.Downloading(current, total, message)
                }
                
                result.onSuccess { metadata ->
                    _downloadState.value = DownloadState.Success(metadata)
                }.onFailure { error ->
                    val handled = handlePinException(
                        throwable = error,
                        fallbackTitle = url,
                        rating = null,
                        tags = emptyList()
                    ) {
                        downloadStory(url, bypassPin = true)
                    }
                    if (!handled) {
                        val message = when (error) {
                            is DownloadBlockedException -> error.message
                                ?: "Parental controls are blocking this download. Update your parental control settings to continue."
                            else -> error.message ?: "Download failed"
                        }
                        _downloadState.value = DownloadState.Error(message)
                    } else {
                        _downloadState.value = DownloadState.Idle
                    }
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
    
    fun updateStory(storyId: String, bypassPin: Boolean = false) {
        if (storyId.isBlank()) {
            _downloadState.value = DownloadState.Error("Invalid story ID")
            return
        }
        
        viewModelScope.launch {
            try {
                _downloadState.value = DownloadState.Downloading(0, 0, "Updating story...")
                val story = fanfictionDao.getStoryById(storyId)

                val result = fanfictionService.updateStory(
                    storyId = storyId,
                    bypassPin = bypassPin
                ) { current, total, message ->
                    _downloadState.value = DownloadState.Downloading(current, total, message)
                }
                
                result.onSuccess { metadata ->
                    _downloadState.value = DownloadState.Success(metadata)
                }.onFailure { error ->
                    val handled = handlePinException(
                        throwable = error,
                        fallbackTitle = story?.title ?: storyId,
                        rating = story?.rating,
                        tags = story?.tags ?: emptyList()
                    ) {
                        updateStory(storyId, bypassPin = true)
                    }
                    if (!handled) {
                        val message = when (error) {
                            is DownloadBlockedException -> error.message
                                ?: "Parental controls are blocking this download. Update your parental control settings to continue."
                            else -> error.message ?: "Update failed"
                        }
                        _downloadState.value = DownloadState.Error(message)
                    } else {
                        _downloadState.value = DownloadState.Idle
                    }
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

    fun dismissPinChallenge() {
        pendingPinAction = null
        _pendingPinChallenge.value = null
    }

    suspend fun verifyPin(pin: String): Boolean = downloadSafetyChecker.verifyPinForDownload(pin)

    fun onPinUnlockGranted() {
        val action = pendingPinAction
        pendingPinAction = null
        _pendingPinChallenge.value = null
        action?.invoke()
    }

    private fun handlePinException(
        throwable: Throwable,
        fallbackTitle: String,
        rating: String?,
        tags: List<String>,
        retry: () -> Unit
    ): Boolean {
        val pinException = throwable as? ContentPinRequiredException ?: return false
        val title = pinException.contentTitle ?: fallbackTitle
        pendingPinAction = retry
        _pendingPinChallenge.value = PinChallenge(
            title = title,
            rating = pinException.contentRating ?: rating,
            mediaType = "STORY",
            tags = tags,
            description = pinException.localizedMessage
        )
        return true
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
