package com.universalmedialibrary.ui.bookshelf

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.data.local.entity.BookDetails
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch
import javax.inject.Inject
import com.universalmedialibrary.utils.ErrorLogger

@HiltViewModel
class BookshelfViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val readingProgressDao: ReadingProgressDao
) : ViewModel() {

    private val _viewMode = MutableStateFlow(ViewMode.GRID)
    val viewMode = _viewMode.asStateFlow()

    private val _sortOption = MutableStateFlow(SortOption.TITLE)
    val sortOption = _sortOption.asStateFlow()

    private val _searchQuery = MutableStateFlow("")
    val searchQuery = _searchQuery.asStateFlow()

    private val _selectedGenre = MutableStateFlow<String?>(null)
    val selectedGenre = _selectedGenre.asStateFlow()

    private val _showFilters = MutableStateFlow(false)
    val showFilters = _showFilters.asStateFlow()

    private val _searchActive = MutableStateFlow(false)
    val searchActive = _searchActive.asStateFlow()

    private val _allBooks = MutableStateFlow<List<BookDetails>>(emptyList())

    // Expose reading progress for currently loaded books by itemId
    val progressMap: StateFlow<Map<Long, ReadingProgress>> = _allBooks
        .flatMapLatest { books ->
            val ids = books.map { it.mediaItem.itemId }
            if (ids.isEmpty()) flowOf(emptyList()) else readingProgressDao.getProgressForItems(ids)
        }
        .map { progresses -> progresses.associateBy { it.itemId } }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyMap()
        )

    // Filtered and sorted books
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
            SortOption.TITLE_ASC -> filteredBooks.sortedBy { it.metadata.title }
            SortOption.TITLE_DESC -> filteredBooks.sortedByDescending { it.metadata.title }
            SortOption.AUTHOR_ASC -> filteredBooks.sortedBy { it.authorName ?: "" }
            SortOption.AUTHOR_DESC -> filteredBooks.sortedByDescending { it.authorName ?: "" }
            SortOption.DATE_ADDED_NEW -> filteredBooks.sortedByDescending { it.mediaItem.dateAdded }
            SortOption.DATE_ADDED_OLD -> filteredBooks.sortedBy { it.mediaItem.dateAdded }
            SortOption.RATING_HIGH -> filteredBooks.sortedByDescending { it.metadata.rating ?: 0f }
            SortOption.RATING_LOW -> filteredBooks.sortedBy { it.metadata.rating ?: 0f }
            SortOption.RATING -> filteredBooks.sortedByDescending { it.metadata.rating ?: 0f }
            SortOption.RECENTLY_READ -> filteredBooks.sortedByDescending { it.mediaItem.lastScanned }
            SortOption.PROGRESS -> filteredBooks.sortedByDescending { it.progress }
            SortOption.FILE_SIZE -> filteredBooks.sortedByDescending { it.fileSize }
        }
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5000),
        initialValue = emptyList()
    )

    // Favorites (books with isFavorite = true)
    val favorites = _allBooks.map { books ->
        books.filter { it.metadata.isFavorite }
    }.stateIn(
        scope = viewModelScope,
        started = SharingStarted.WhileSubscribed(5000),
        initialValue = emptyList()
    )

    fun loadBooks(libraryId: Long) {
        viewModelScope.launch {
            mediaItemDao.getBookDetailsForLibrary(libraryId).collect { mediaItems ->
                // PERFORMANCE OPTIMIZATION: Use batch queries to avoid N+1 problem
                // Instead of querying metadata for each item individually, fetch all at once
                
                if (mediaItems.isEmpty()) {
                    _allBooks.value = emptyList()
                    return@collect
                }
                
                val itemIds = mediaItems.map { it.itemId }
                
                // Batch fetch all metadata at once
                val metadataMap = metadataDao.getMetadataCommonBatch(itemIds)
                    .associateBy { it.itemId }
                val bookMetadataMap = metadataDao.getMetadataBookBatch(itemIds)
                    .associateBy { it.itemId }
                
                // Batch fetch authors and series
                val authorsMap = metadataDao.getAuthorsBatch(itemIds)
                    .groupBy({ it.itemId }, { it.name })
                val seriesMap = metadataDao.getSeriesBatch(itemIds)
                    .associateBy({ it.itemId }, { it.name })
                
                // Convert MediaItems to BookDetails using pre-fetched data
                val bookDetailsList = mediaItems.map { mediaItem ->
                    val metadata = metadataMap[mediaItem.itemId]
                        ?: com.universalmedialibrary.data.local.entity.MetadataCommon(
                            itemId = mediaItem.itemId,
                            title = mediaItem.fileName,
                            sortTitle = mediaItem.fileName
                        )
                    val bookMetadata = bookMetadataMap[mediaItem.itemId]
                    val authors = authorsMap[mediaItem.itemId] ?: emptyList()
                    val seriesName = seriesMap[mediaItem.itemId]
                    
                    BookDetails(
                        mediaItem = mediaItem,
                        metadata = metadata,
                        bookMetadata = bookMetadata,
                        authorName = authors.firstOrNull(),
                        seriesName = seriesName
                    )
                }
                _allBooks.value = bookDetailsList
            }
        }
    }

    fun setViewMode(mode: ViewMode) {
        _viewMode.value = mode
    }

    fun setSortOption(option: SortOption) {
        _sortOption.value = option
    }

    fun setSearchQuery(query: String) {
        _searchQuery.value = query
        _searchActive.value = query.isNotEmpty()
    }

    fun clearSearch() {
        _searchQuery.value = ""
        _searchActive.value = false
    }

    fun toggleSearch() {
        _searchActive.value = !_searchActive.value
        if (!_searchActive.value) {
            _searchQuery.value = ""
        }
    }

    fun setSelectedGenre(genre: String?) {
        _selectedGenre.value = genre
    }

    fun toggleFilters() {
        _showFilters.value = !_showFilters.value
    }

    fun toggleFavorite(book: BookDetails) {
        viewModelScope.launch {
            try {
                val newFavorite = !book.metadata.isFavorite

                val updatedMetadata = book.metadata.copy(isFavorite = newFavorite)
                metadataDao.setFavorite(book.mediaItem.itemId, newFavorite)
                mediaItemDao.setFavorite(book.mediaItem.itemId, newFavorite)

                // Update local state immediately for better UX
                val updatedBooks = _allBooks.value.map { existingBook ->
                    if (existingBook.metadata.itemId == book.metadata.itemId) {
                        existingBook.copy(
                            metadata = updatedMetadata,
                            mediaItem = existingBook.mediaItem.copy(isFavorite = newFavorite)
                        )
                    } else {
                        existingBook
                    }
                }
                _allBooks.value = updatedBooks
            } catch (e: Exception) {
                // Handle error - in a real implementation, you'd show a snackbar or toast
                // For now, just log it
                ErrorLogger.logError("BookshelfViewModel", "Error toggling favorite", e)
            }
        }
    }
}
