package com.universalmedialibrary.ui.organization

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.services.organization.DuplicateDetectionService
import com.universalmedialibrary.services.organization.DuplicateGroup
import com.universalmedialibrary.services.organization.SeriesManagementService
import com.universalmedialibrary.services.organization.SeriesSuggestion
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class OrganizationViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val duplicateDetectionService: DuplicateDetectionService,
    private val seriesManagementService: SeriesManagementService
) : ViewModel() {
    
    private val _duplicateGroups = MutableStateFlow<List<DuplicateGroup>>(emptyList())
    val duplicateGroups: StateFlow<List<DuplicateGroup>> = _duplicateGroups.asStateFlow()
    
    private val _seriesSuggestions = MutableStateFlow<List<SeriesSuggestion>>(emptyList())
    val seriesSuggestions: StateFlow<List<SeriesSuggestion>> = _seriesSuggestions.asStateFlow()
    
    private val _isScanning = MutableStateFlow(false)
    val isScanning: StateFlow<Boolean> = _isScanning.asStateFlow()
    
    private val _duplicateThreshold = MutableStateFlow(0.85f)
    val duplicateThreshold: StateFlow<Float> = _duplicateThreshold.asStateFlow()
    
    fun scanForDuplicates() {
        viewModelScope.launch {
            try {
                _isScanning.value = true
                
                // Get all media items
                val items = mediaItemDao.getAllMediaItems().first()
                
                // Find duplicates
                val result = duplicateDetectionService.findDuplicates(
                    items = items,
                    threshold = _duplicateThreshold.value
                )
                
                _duplicateGroups.value = result
            } catch (e: Exception) {
                // Handle error
            } finally {
                _isScanning.value = false
            }
        }
    }
    
    fun scanForSeries() {
        viewModelScope.launch {
            try {
                _isScanning.value = true
                
                // Get all media items
                val items = mediaItemDao.getAllMediaItems().first()
                
                // Find series
                val suggestions = seriesManagementService.autoDetectSeries(items)
                
                _seriesSuggestions.value = suggestions
            } catch (e: Exception) {
                // Handle error
            } finally {
                _isScanning.value = false
            }
        }
    }
    
    fun deleteMediaItem(itemId: String) {
        viewModelScope.launch {
            try {
                mediaItemDao.deleteMediaItem(itemId.toLong())
                
                // Refresh duplicates
                scanForDuplicates()
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
    
    fun keepOneDeleteOthers(keepItemId: String, groupIndex: Int) {
        viewModelScope.launch {
            try {
                val group = _duplicateGroups.value.getOrNull(groupIndex) ?: return@launch
                
                group.matches.forEach { match ->
                    if (match.item.id.toString() != keepItemId) {
                        mediaItemDao.deleteMediaItem(match.item.id)
                    }
                }
                
                // Refresh duplicates
                scanForDuplicates()
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
    
    fun setThreshold(threshold: Float) {
        _duplicateThreshold.value = threshold
    }
    
    fun createSeries(suggestionIndex: Int) {
        viewModelScope.launch {
            try {
                val suggestion = _seriesSuggestions.value.getOrNull(suggestionIndex) 
                    ?: return@launch
                
                seriesManagementService.createSeries(
                    seriesName = suggestion.seriesName,
                    books = suggestion.books
                )
                
                // Refresh suggestions
                scanForSeries()
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
}
