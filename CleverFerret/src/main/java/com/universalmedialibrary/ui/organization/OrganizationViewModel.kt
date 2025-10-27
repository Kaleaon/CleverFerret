package com.universalmedialibrary.ui.organization

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.BookDao
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
    private val bookDao: BookDao,
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
                
                // Get all books
                val books = bookDao.getAllBooks().first()
                
                // Find duplicates
                val result = duplicateDetectionService.findDuplicates(
                    books = books,
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
                
                // Get all books
                val books = bookDao.getAllBooks().first()
                
                // Find series
                val suggestions = seriesManagementService.autoDetectSeries(books)
                
                _seriesSuggestions.value = suggestions
            } catch (e: Exception) {
                // Handle error
            } finally {
                _isScanning.value = false
            }
        }
    }
    
    fun deleteBook(bookId: String) {
        viewModelScope.launch {
            try {
                val book = bookDao.getBook(bookId.toLong())
                book?.let { bookDao.deleteBook(it) }
                
                // Refresh duplicates
                scanForDuplicates()
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
    
    fun keepOneDeleteOthers(keepBookId: String, groupIndex: Int) {
        viewModelScope.launch {
            try {
                val group = _duplicateGroups.value.getOrNull(groupIndex) ?: return@launch
                
                group.matches.forEach { match ->
                    if (match.book.id.toString() != keepBookId) {
                        bookDao.deleteBook(match.book)
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
