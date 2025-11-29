package com.universalmedialibrary.ui.home

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import javax.inject.Inject
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.map

import com.universalmedialibrary.services.reading.ReadingStats

/**
 * ViewModel for Home Screen
 */
@HiltViewModel
class HomeViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val readingProgressDao: ReadingProgressDao
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(HomeUiState())
    val uiState: StateFlow<HomeUiState> = _uiState.asStateFlow()
    
    init {
        loadData()
    }
    
    private fun loadData() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)

            // Combine data streams
            val recentProgressFlow = readingProgressDao.getRecentlyRead(10)
            val favoriteItemsFlow = mediaItemDao.getFavoriteMediaItems()

            combine(recentProgressFlow, favoriteItemsFlow) { recentProgress, favorites ->
                val continueList = recentProgress.mapNotNull { progress ->
                    val mediaItem = mediaItemDao.getMediaItemById(progress.itemId)
                    mediaItem?.let {
                        MediaItemUiModel(
                            id = it.itemId,
                            title = it.fileName, // Ideally fetch metadata title
                            subtitle = null,
                            type = it.mediaType.lowercase(),
                            artworkUrl = null, // Fetch cover
                            progress = progress.percentage
                        )
                    }
                }

                val showcase = favorites.firstOrNull()?.let {
                    MediaItemUiModel(
                        id = it.itemId,
                        title = it.fileName,
                        subtitle = "Featured Favorite",
                        type = it.mediaType.lowercase(),
                        artworkUrl = null,
                        progress = 0f
                    )
                }

                // For "Recently Added" / "Showcase"
                // In a real app we'd have a separate flow for "Recently Added"
                // For now using favorites as showcase source, or just random
                
                HomeUiState(
                    continueItems = continueList,
                    recentItems = emptyList(), // Populate with history if available
                    showcaseItem = showcase,
                    isLoading = false
                )
            }.collect { newState ->
                _uiState.value = newState
            }
        }
    }
    
    fun refresh() {
        // Trigger refresh logic
    }
}

data class HomeUiState(
    val userName: String? = null,
    val continueItems: List<MediaItemUiModel> = emptyList(),
    val recentItems: List<MediaItemUiModel> = emptyList(),
    val showcaseItem: MediaItemUiModel? = null,
    val statistics: ReadingStats? = null,
    val isLoading: Boolean = false
)

// Renamed to avoid conflict with Entity
data class MediaItemUiModel(
    val id: Long,
    val title: String,
    val subtitle: String?,
    val type: String,
    val artworkUrl: String?,
    val progress: Float = 0f
)
