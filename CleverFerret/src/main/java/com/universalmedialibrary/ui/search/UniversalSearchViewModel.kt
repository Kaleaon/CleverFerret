package com.universalmedialibrary.ui.search

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.core.FormatRegistry
import com.universalmedialibrary.core.TagRegistry
import com.universalmedialibrary.core.UniversalSearchService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class UniversalSearchViewModel @Inject constructor(
    private val universalSearchService: UniversalSearchService
) : ViewModel() {
    
    private val _query = MutableStateFlow("")
    val query: StateFlow<String> = _query.asStateFlow()
    
    private val _selectedCategory = MutableStateFlow<FormatRegistry.FormatCategory?>(null)
    
    private val formatResults = _query
        .debounce(300)
        .flatMapLatest { query ->
            if (query.isEmpty()) {
                flowOf(emptyList())
            } else {
                flowOf(universalSearchService.searchFormats(query, _selectedCategory.value))
            }
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())
    
    private val tagResults = _query
        .debounce(300)
        .flatMapLatest { query ->
            if (query.isEmpty()) {
                flowOf(emptyList())
            } else {
                universalSearchService.searchTags(query)
            }
        }
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())
    
    val uiState: StateFlow<UniversalSearchUiState> = combine(
        _query,
        formatResults,
        tagResults,
        _selectedCategory
    ) { query, formats, tags, category ->
        UniversalSearchUiState(
            query = query,
            formatResults = formats,
            tagResults = tags,
            selectedCategory = category,
            isLoading = false
        )
    }.stateIn(
        viewModelScope,
        SharingStarted.WhileSubscribed(5000),
        UniversalSearchUiState()
    )
    
    fun updateQuery(newQuery: String) {
        _query.value = newQuery
    }
    
    fun clearQuery() {
        _query.value = ""
        _selectedCategory.value = null
    }
    
    fun selectCategory(category: FormatRegistry.FormatCategory) {
        _selectedCategory.value = category
        viewModelScope.launch {
            val formats = universalSearchService.getFormatsByCategory(category)
            // Update format results for selected category
        }
    }
}

data class UniversalSearchUiState(
    val query: String = "",
    val formatResults: List<FormatRegistry.FormatInfo> = emptyList(),
    val tagResults: List<TagRegistry.UnifiedTagInfo> = emptyList(),
    val selectedCategory: FormatRegistry.FormatCategory? = null,
    val isLoading: Boolean = false
)
