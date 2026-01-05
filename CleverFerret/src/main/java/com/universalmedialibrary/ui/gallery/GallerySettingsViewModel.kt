package com.universalmedialibrary.ui.gallery

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.gallery.GalleryPreferencesStore
import com.universalmedialibrary.services.gallery.GallerySettings
import com.universalmedialibrary.services.gallery.GallerySortOrder
import com.universalmedialibrary.services.gallery.GalleryViewMode
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Gallery Settings Screen
 */
@HiltViewModel
class GallerySettingsViewModel @Inject constructor(
    private val preferencesStore: GalleryPreferencesStore
) : ViewModel() {
    
    val settings: StateFlow<GallerySettings> = preferencesStore.settings
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = GallerySettings()
        )
    
    fun setViewMode(mode: GalleryViewMode) {
        viewModelScope.launch {
            preferencesStore.setViewMode(mode)
        }
    }
    
    fun setSortOrder(order: GallerySortOrder) {
        viewModelScope.launch {
            preferencesStore.setSortOrder(order)
        }
    }
    
    fun setGridColumns(columns: Int) {
        viewModelScope.launch {
            preferencesStore.setGridColumns(columns)
        }
    }
    
    fun setShowHidden(show: Boolean) {
        viewModelScope.launch {
            preferencesStore.setShowHidden(show)
        }
    }
    
    fun setShowFileInfo(show: Boolean) {
        viewModelScope.launch {
            preferencesStore.setShowFileInfo(show)
        }
    }
    
    fun setShowExifData(show: Boolean) {
        viewModelScope.launch {
            preferencesStore.setShowExifData(show)
        }
    }
    
    fun setAutoPlayVideos(autoPlay: Boolean) {
        viewModelScope.launch {
            preferencesStore.setAutoPlayVideos(autoPlay)
        }
    }
    
    fun setLoopVideos(loop: Boolean) {
        viewModelScope.launch {
            preferencesStore.setLoopVideos(loop)
        }
    }
    
    fun setEnableFaceDetection(enabled: Boolean) {
        viewModelScope.launch {
            preferencesStore.setEnableFaceDetection(enabled)
        }
    }
    
    fun setEnableAiTags(enabled: Boolean) {
        viewModelScope.launch {
            preferencesStore.setEnableAiTags(enabled)
        }
    }
    
    fun setEnableLocationGrouping(enabled: Boolean) {
        viewModelScope.launch {
            preferencesStore.setEnableLocationGrouping(enabled)
        }
    }
    
    fun setEnableMemories(enabled: Boolean) {
        viewModelScope.launch {
            preferencesStore.setEnableMemories(enabled)
        }
    }
    
    // Dialog triggers (would be managed by UI state in a full implementation)
    fun showViewModePicker() {
        // UI would handle showing picker dialog
    }
    
    fun showSortOrderPicker() {
        // UI would handle showing picker dialog
    }
    
    fun showGridColumnsPicker() {
        // UI would handle showing picker dialog
    }
}
