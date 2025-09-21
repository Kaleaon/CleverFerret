package com.universalmedialibrary.ui.bookshelf

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.BookDetails
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * The view model for the bookshelf screen.
 * This class is responsible for loading and managing the data for the bookshelf.
 *
 * @param mediaItemDao The DAO for media items.
 * @param metadataDao The DAO for metadata.
 */
@HiltViewModel
class BookshelfViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : ViewModel() {

    private val _viewMode = MutableStateFlow(ViewMode.GRID)
    /** The current view mode for the bookshelf. */
    val viewMode = _viewMode.asStateFlow()

    private val _sortOption = MutableStateFlow(SortOption.TITLE)
    /** The current sort option for the bookshelf. */
    val sortOption = _sortOption.asStateFlow()

    private val _searchQuery = MutableStateFlow("")
    /** The current search query. */
    val searchQuery = _searchQuery.asStateFlow()

    private val _selectedGenre = MutableStateFlow<String?>(null)
    /** The currently selected genre for filtering. */
    val selectedGenre = _selectedGenre.asStateFlow()

    private val _showFilters = MutableStateFlow(false)
    /** Whether the filter controls are currently visible. */
    val showFilters = _showFilters.asStateFlow()

    private val _searchActive = MutableStateFlow(false)
    /** Whether the search bar is currently active. */
    val searchActive = _searchActive.asStateFlow()

    private val _allBooks = MutableStateFlow<List<BookDetails>>(emptyList())

    /** A [Flow] that emits the filtered and sorted list of books to display. */
    val books = combine(
        _allBooks,
        _searchQuery,
        _selectedGenre,
        _sortOption
    ) { allBooks, query, genre, sort ->
        var filteredBooks = allBooks

        // Apply search filter
        if (query.isNotEmpty()) {
            filteredBooks = filteredBooks.filter { book ->
                book.metadata.title.contains(query, ignoreCase = true) ||
                book.authorName?.contains(query, ignoreCase = true) == true
            }
        }

        // Apply genre filter
        if (genre != null) {
            // In a real implementation, you'd filter by actual genre data
            // For now, this is a placeholder
            filteredBooks = filteredBooks.filter {
                // Placeholder genre filtering logic
                true
            }
        }

        // Apply sorting
        when (sort) {
            SortOption.TITLE -> filteredBooks.sortedBy { it.metadata.title }
            SortOption.AUTHOR -> filteredBooks.sortedBy { it.authorName ?: "" }
            SortOption.DATE_ADDED -> filteredBooks.sortedByDescending { it.mediaItem.dateAdded }
            SortOption.RATING -> filteredBooks.sortedByDescending { it.metadata.rating ?: 0f }
            SortOption.RECENTLY_READ -> filteredBooks.sortedByDescending { it.mediaItem.lastScanned }
        }
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5000),
        initialValue = emptyList()
    )

    /** A [Flow] that emits the list of favorite books. */
    val favorites = _allBooks.map { books ->
        books.filter { it.metadata.isFavorite }
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5000),
        initialValue = emptyList()
    )

    /**
     * Loads the books for a specific library.
     * @param libraryId The ID of the library to load.
     */
    fun loadBooks(libraryId: Long) {
        viewModelScope.launch {
            mediaItemDao.getBookDetailsForLibrary(libraryId).collect { bookList ->
                _allBooks.value = bookList
            }
        }
    }

    /**
     * Sets the view mode for the bookshelf.
     * @param mode The new view mode.
     */
    fun setViewMode(mode: ViewMode) {
        _viewMode.value = mode
    }

    /**
     * Sets the sort option for the bookshelf.
     * @param option The new sort option.
     */
    fun setSortOption(option: SortOption) {
        _sortOption.value = option
    }

    /**
     * Sets the search query.
     * @param query The new search query.
     */
    fun setSearchQuery(query: String) {
        _searchQuery.value = query
        _searchActive.value = query.isNotEmpty()
    }

    /**
     * Clears the search query.
     */
    fun clearSearch() {
        _searchQuery.value = ""
        _searchActive.value = false
    }

    /**
     * Toggles the search bar's visibility.
     */
    fun toggleSearch() {
        _searchActive.value = !_searchActive.value
        if (!_searchActive.value) {
            _searchQuery.value = ""
        }
    }

    /**
     * Sets the selected genre for filtering.
     * @param genre The genre to filter by, or null to clear the filter.
     */
    fun setSelectedGenre(genre: String?) {
        _selectedGenre.value = genre
    }

    /**
     * Toggles the visibility of the filter controls.
     */
    fun toggleFilters() {
        _showFilters.value = !_showFilters.value
    }

    /**
     * Toggles the favorite status of a book.
     * @param book The book to toggle.
     */
    fun toggleFavorite(book: BookDetails) {
        viewModelScope.launch {
            try {
                // Update the metadata with toggled favorite status
                val updatedMetadata = book.metadata.copy(
                    isFavorite = !book.metadata.isFavorite
                )
                metadataDao.updateMetadata(metadataCommon = updatedMetadata)

                // Update local state immediately for better UX
                val updatedBooks = _allBooks.value.map { existingBook ->
                    if (existingBook.metadata.itemId == book.metadata.itemId) {
                        existingBook.copy(metadata = updatedMetadata)
                    } else {
                        existingBook
                    }
                }
                _allBooks.value = updatedBooks
            } catch (e: Exception) {
                // Handle error - in a real implementation, you'd show a snackbar or toast
                // For now, just log it
                e.printStackTrace()
            }
        }
    }
}