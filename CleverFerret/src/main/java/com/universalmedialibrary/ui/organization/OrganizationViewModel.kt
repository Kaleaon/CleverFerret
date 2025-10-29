package com.universalmedialibrary.ui.organization

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.services.duplicates.DuplicateDetectionService
import com.universalmedialibrary.services.duplicates.DuplicateScanResult
import com.universalmedialibrary.services.duplicates.DuplicateGroup
import com.universalmedialibrary.services.organization.SeriesManagementService
import com.universalmedialibrary.services.organization.SeriesSuggestion
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class OrganizationViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val libraryDao: LibraryDao,
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
                
                // Use the first library for now (should be parameterized)
                // TODO: Allow user to select library
                val libraries = libraryDao.getAllLibraries().first()
                if (libraries.isEmpty()) {
                    _duplicateGroups.value = emptyList()
                    return@launch
                }
                
                // Collect duplicate scan results
                duplicateDetectionService.scanLibraryForDuplicates(libraries.first().libraryId)
                    .collect { result ->
                        when (result) {
                            is DuplicateScanResult.Complete -> {
                                _duplicateGroups.value = result.groups
                            }
                            is DuplicateScanResult.Scanning -> {
                                // Could update progress UI here
                            }
                            is DuplicateScanResult.Error -> {
                                // Handle error
                                _duplicateGroups.value = emptyList()
                            }
                        }
                    }
            } catch (e: Exception) {
                // Handle error
                _duplicateGroups.value = emptyList()
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
                val items = mediaItemDao.getAllMediaItems()
                
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
                val item = mediaItemDao.getMediaItemById(itemId.toLong())
                if (item != null) {
                    mediaItemDao.deleteMediaItem(item)
                    
                    // Refresh duplicates
                    scanForDuplicates()
                }
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
    
    fun keepOneDeleteOthers(keepItemId: String, groupIndex: Int) {
        viewModelScope.launch {
            try {
                val group = _duplicateGroups.value.getOrNull(groupIndex) ?: return@launch
                
                group.items.forEach { item ->
                    if (item.itemId.toString() != keepItemId) {
                        mediaItemDao.deleteMediaItem(item)
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
