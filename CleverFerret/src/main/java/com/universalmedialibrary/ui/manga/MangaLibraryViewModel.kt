package com.universalmedialibrary.ui.manga

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.manga.library.LibraryFilter
import com.universalmedialibrary.services.manga.library.LibraryManga
import com.universalmedialibrary.services.manga.library.LibrarySortOrder
import com.universalmedialibrary.services.manga.library.MangaCategory
import com.universalmedialibrary.services.manga.library.MangaLibraryRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Manga Library Screen
 */
@HiltViewModel
class MangaLibraryViewModel @Inject constructor(
    private val libraryRepository: MangaLibraryRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MangaLibraryUiState())
    val uiState: StateFlow<MangaLibraryUiState> = _uiState.asStateFlow()
    
    init {
        loadLibrary()
        loadCategories()
        observeLibraryChanges()
    }
    
    private fun observeLibraryChanges() {
        viewModelScope.launch {
            libraryRepository.observeLibrary().collect { library ->
                _uiState.update { it.copy(library = library) }
                applyFilter()
            }
        }
    }
    
    private fun loadLibrary() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            try {
                val library = libraryRepository.getAllLibraryManga()
                _uiState.update { it.copy(
                    library = library,
                    filteredLibrary = library,
                    isLoading = false
                )}
            } catch (e: Exception) {
                _uiState.update { it.copy(
                    error = e.message,
                    isLoading = false
                )}
            }
        }
    }
    
    private fun loadCategories() {
        viewModelScope.launch {
            val categories = libraryRepository.getAllCategories()
            _uiState.update { state ->
                state.copy(
                    categories = categories.map { category ->
                        category.copy(
                            mangaCount = state.library.count { manga ->
                                category.id in manga.categoryIds
                            }
                        )
                    }
                )
            }
        }
    }
    
    fun selectCategory(category: MangaCategory?) {
        _uiState.update { it.copy(selectedCategory = category) }
        applyFilter()
    }
    
    fun setSortOrder(order: LibrarySortOrder) {
        _uiState.update { it.copy(sortOrder = order) }
        applyFilter()
    }
    
    fun toggleSortDirection() {
        _uiState.update { it.copy(sortDescending = !it.sortDescending) }
        applyFilter()
    }
    
    fun setSearchQuery(query: String) {
        _uiState.update { it.copy(searchQuery = query) }
        applyFilter()
    }
    
    fun toggleUnreadFilter() {
        _uiState.update { it.copy(showUnreadOnly = !it.showUnreadOnly) }
        applyFilter()
    }
    
    fun toggleFavorite(mangaId: Long) {
        viewModelScope.launch {
            libraryRepository.toggleFavorite(mangaId)
        }
    }
    
    fun removeManga(mangaId: Long) {
        viewModelScope.launch {
            libraryRepository.removeFromLibrary(mangaId)
        }
    }
    
    fun updateMangaCategories(mangaId: Long, categoryIds: Set<Long>) {
        viewModelScope.launch {
            libraryRepository.updateMangaCategories(mangaId, categoryIds)
            loadCategories()
        }
    }
    
    fun createCategory(name: String) {
        viewModelScope.launch {
            libraryRepository.createCategory(name)
            loadCategories()
        }
    }
    
    fun deleteCategory(categoryId: Long) {
        viewModelScope.launch {
            libraryRepository.deleteCategory(categoryId)
            loadCategories()
            
            // Reset selection if deleted category was selected
            if (_uiState.value.selectedCategory?.id == categoryId) {
                _uiState.update { it.copy(selectedCategory = null) }
            }
        }
    }
    
    private fun applyFilter() {
        viewModelScope.launch {
            val state = _uiState.value
            
            val filter = LibraryFilter(
                query = state.searchQuery.takeIf { it.isNotBlank() },
                categories = state.selectedCategory?.let { setOf(it.id) },
                unreadOnly = state.showUnreadOnly,
                sortOrder = state.sortOrder,
                sortDescending = state.sortDescending
            )
            
            val filtered = libraryRepository.getFilteredLibrary(filter)
            _uiState.update { it.copy(filteredLibrary = filtered) }
        }
    }
    
    fun refresh() {
        loadLibrary()
        loadCategories()
    }
}

/**
 * UI State for Manga Library
 */
data class MangaLibraryUiState(
    val isLoading: Boolean = false,
    val error: String? = null,
    
    // Library
    val library: List<LibraryManga> = emptyList(),
    val filteredLibrary: List<LibraryManga> = emptyList(),
    
    // Categories
    val categories: List<MangaCategory> = emptyList(),
    val selectedCategory: MangaCategory? = null,
    
    // Filters
    val searchQuery: String = "",
    val showUnreadOnly: Boolean = false,
    val sortOrder: LibrarySortOrder = LibrarySortOrder.LAST_READ,
    val sortDescending: Boolean = true
)
