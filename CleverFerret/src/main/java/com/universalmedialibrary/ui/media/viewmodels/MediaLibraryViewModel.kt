package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.data.local.entity.MediaItem as DbMediaItem
import com.universalmedialibrary.data.repository.AudiobookRepository
import com.universalmedialibrary.data.repository.BookRepository
import com.universalmedialibrary.data.repository.ComicRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.VideoRepository
import com.universalmedialibrary.data.repository.WebFictionRepository
import com.universalmedialibrary.ui.media.components.MediaItem
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Clean media-centric Library Screen
 * 
 * Handles:
 * - Loading items for a specific media type
 * - Filtering (unread, in-progress, favorites, etc.)
 * - Sorting (title, date added, rating, etc.)
 * - View mode persistence
 * - Search within library
 * 
 * Loads real library data (no sample placeholders).
 */
@HiltViewModel
class MediaLibraryViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle,
    private val bookRepository: BookRepository,
    private val audiobookRepository: AudiobookRepository,
    private val comicRepository: ComicRepository,
    private val videoRepository: VideoRepository,
    private val webFictionRepository: WebFictionRepository,
    private val mediaRepository: MediaRepository
) : ViewModel() {
    
    // Get media type from navigation argument
    private val mediaTypeArg: String = savedStateHandle.get<String>("mediaType") ?: "book"
    
    private val _mediaType = MutableStateFlow(MediaType.fromString(mediaTypeArg))
    val mediaType: StateFlow<MediaType> = _mediaType.asStateFlow()
    
    private val _uiState = MutableStateFlow(LibraryScreenState(
        libraryTitle = getLibraryTitle(MediaType.fromString(mediaTypeArg)),
        mediaType = MediaType.fromString(mediaTypeArg)
    ))
    val uiState: StateFlow<LibraryScreenState> = _uiState.asStateFlow()
    
    private val _currentFilter = MutableStateFlow(LibraryFilter.ALL)
    private val _currentSort = MutableStateFlow(LibrarySortOption.RECENTLY_ADDED)
    private val _viewMode = MutableStateFlow(LibraryViewMode.GRID)
    private val _searchQuery = MutableStateFlow("")
    
    init {
        observeAndLoad()
    }
    
    private fun observeAndLoad() {
        viewModelScope.launch {
            combine(
                _mediaType,
                _currentFilter,
                _currentSort,
                _searchQuery
            ) { mediaType, filter, sort, query ->
                Params(mediaType, filter, sort, query)
            }
                .distinctUntilChanged()
                .collectLatest { params ->
                    _uiState.update { state ->
                        state.copy(
                            isLoading = true,
                            mediaType = params.mediaType,
                            libraryTitle = getLibraryTitle(params.mediaType),
                            currentFilter = params.filter,
                            sortOption = params.sort,
                            availableFilters = getFilterGroupsForMediaType(params.mediaType)
                        )
                    }

                    var first = true
                    itemsFlowFor(params).collect { items ->
                        _uiState.update { state ->
                            state.copy(
                                items = items,
                                totalItems = items.size,
                                isLoading = if (first) false else state.isLoading
                            )
                        }
                        first = false
                    }
                }
        }
    }
    
    fun setFilter(filter: LibraryFilter) {
        _currentFilter.value = filter
        _uiState.update { it.copy(currentFilter = filter) }
    }
    
    fun setSort(sort: LibrarySortOption) {
        _currentSort.value = sort
        _uiState.update { it.copy(sortOption = sort) }
    }
    
    fun setViewMode(mode: LibraryViewMode) {
        _viewMode.value = mode
        _uiState.update { it.copy(viewMode = mode) }
    }
    
    fun search(query: String) {
        _searchQuery.value = query
    }
    
    fun refresh() {
        // Data flows update automatically; force re-emit by nudging search query.
        _searchQuery.value = _searchQuery.value
    }
    
    private fun itemsFlowFor(params: Params): Flow<List<MediaItem>> {
        return when (params.mediaType) {
            MediaType.BOOK -> bookRepository.getAllBooks()
                .map { list -> mapDbItems(list, params) }
            MediaType.AUDIOBOOK -> audiobookRepository.getAllAudiobooks()
                .map { list -> mapDbItems(list, params) }
            MediaType.COMIC -> comicRepository.getAllComics()
                .map { list -> mapDbItems(list, params) }
            MediaType.MOVIE -> videoRepository.getMovies()
                .map { list -> mapDbItems(list, params) }
            MediaType.TV_SHOW -> videoRepository.getTvShows()
                .map { list -> mapDbItems(list, params) }
            MediaType.DOCUMENT -> mediaRepository.getMediaItemsByType("DOCUMENT")
                .map { list -> mapDbItems(list, params) }
            MediaType.FANFICTION -> webFictionRepository.getAllWebFiction()
                .map { list -> mapFanfictionItems(list, params) }
            else -> flowOf(emptyList())
        }
    }

    private fun mapDbItems(
        items: List<DbMediaItem>,
        params: Params
    ): List<MediaItem> {
        val filtered = items
            .let { list ->
                when (params.filter) {
                    LibraryFilter.FAVORITES -> list.filter { it.isFavorite }
                    else -> list
                }
            }
            .let { list ->
                if (params.query.isBlank()) list else list.filter {
                    it.title.contains(params.query, ignoreCase = true) ||
                        it.fileName.contains(params.query, ignoreCase = true)
                }
            }

        val sorted = when (params.sort) {
            LibrarySortOption.TITLE -> filtered.sortedBy { it.title.lowercase() }
            LibrarySortOption.RECENTLY_ADDED -> filtered.sortedByDescending { it.dateAdded }
            else -> filtered
        }

        return sorted.map { db ->
            MediaItem(
                id = db.itemId.toString(),
                title = db.title,
                subtitle = db.creator,
                imageUrl = db.thumbnailPath,
                mediaType = params.mediaType,
                progress = 0f,
                rating = db.rating
            )
        }
    }

    private fun mapFanfictionItems(
        items: List<FanfictionStoryEntity>,
        params: Params
    ): List<MediaItem> {
        val filtered = items
            .let { list ->
                if (params.query.isBlank()) list else list.filter {
                    it.title.contains(params.query, ignoreCase = true) ||
                        it.author.contains(params.query, ignoreCase = true)
                }
            }

        val sorted = when (params.sort) {
            LibrarySortOption.TITLE -> filtered.sortedBy { it.title.lowercase() }
            else -> filtered
        }

        return sorted.map { story ->
            val progress = if (story.chapterCount > 0) {
                (story.lastChapterDownloaded.toFloat() / story.chapterCount.toFloat()).coerceIn(0f, 1f)
            } else 0f

            MediaItem(
                id = story.id,
                title = story.title,
                subtitle = story.author,
                imageUrl = story.coverPath,
                mediaType = MediaType.FANFICTION,
                progress = progress
            )
        }
    }
    
    private fun getMediaTypeName(mediaType: MediaType): String = when (mediaType) {
        MediaType.BOOK -> "Book"
        MediaType.AUDIOBOOK -> "Audiobook"
        MediaType.MUSIC -> "Album"
        MediaType.PODCAST -> "Podcast"
        MediaType.COMIC -> "Comic"
        MediaType.MOVIE -> "Movie"
        MediaType.TV_SHOW -> "TV Show"
        MediaType.FANFICTION -> "Story"
        MediaType.DOCUMENT -> "Document"
        MediaType.RADIO -> "Station"
        MediaType.NEWS -> "Article"
        MediaType.UNKNOWN -> "Item"
    }
    
    private fun getDurationString(mediaType: MediaType, index: Int): String? = when (mediaType) {
        MediaType.BOOK, MediaType.COMIC -> "${100 + index * 20} pages"
        MediaType.AUDIOBOOK, MediaType.MOVIE -> "${1 + index % 3}h ${index * 5 % 60}m"
        MediaType.MUSIC -> "${8 + index % 5} tracks"
        MediaType.PODCAST -> "${10 + index % 20} episodes"
        MediaType.TV_SHOW -> "${2 + index % 5} seasons"
        MediaType.FANFICTION -> "${10 + index * 5} chapters"
        else -> null
    }
    
    private fun getLibraryTitle(mediaType: MediaType): String = when (mediaType) {
        MediaType.BOOK -> "Books"
        MediaType.AUDIOBOOK -> "Audiobooks"
        MediaType.MUSIC -> "Music"
        MediaType.PODCAST -> "Podcasts"
        MediaType.COMIC -> "Comics"
        MediaType.MOVIE -> "Movies"
        MediaType.TV_SHOW -> "TV Shows"
        MediaType.FANFICTION -> "Web Fiction"
        MediaType.DOCUMENT -> "Documents"
        MediaType.RADIO -> "Radio"
        MediaType.NEWS -> "News"
        MediaType.UNKNOWN -> "Library"
    }
    
    private fun getFilterGroupsForMediaType(mediaType: MediaType): List<LibraryFilterGroup> {
        return when (mediaType) {
            MediaType.BOOK, MediaType.COMIC, MediaType.FANFICTION -> listOf(
                LibraryFilterGroup("Status", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.UNREAD,
                    LibraryFilter.IN_PROGRESS,
                    LibraryFilter.COMPLETED
                )),
                LibraryFilterGroup("Collection", listOf(
                    LibraryFilter.FAVORITES,
                    LibraryFilter.DOWNLOADED
                ))
            )
            MediaType.AUDIOBOOK -> listOf(
                LibraryFilterGroup("Status", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.UNPLAYED,
                    LibraryFilter.IN_PROGRESS,
                    LibraryFilter.COMPLETED
                )),
                LibraryFilterGroup("Collection", listOf(
                    LibraryFilter.FAVORITES,
                    LibraryFilter.DOWNLOADED
                ))
            )
            MediaType.MUSIC -> listOf(
                LibraryFilterGroup("View", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.RECENTLY_PLAYED,
                    LibraryFilter.FAVORITES
                )),
                LibraryFilterGroup("Storage", listOf(
                    LibraryFilter.DOWNLOADED
                ))
            )
            MediaType.MOVIE, MediaType.TV_SHOW -> listOf(
                LibraryFilterGroup("Status", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.UNWATCHED,
                    LibraryFilter.IN_PROGRESS,
                    LibraryFilter.COMPLETED
                )),
                LibraryFilterGroup("Collection", listOf(
                    LibraryFilter.FAVORITES
                ))
            )
            MediaType.PODCAST -> listOf(
                LibraryFilterGroup("Status", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.UNPLAYED,
                    LibraryFilter.IN_PROGRESS
                )),
                LibraryFilterGroup("Storage", listOf(
                    LibraryFilter.DOWNLOADED
                ))
            )
            else -> listOf(
                LibraryFilterGroup("All", listOf(LibraryFilter.ALL))
            )
        }
    }

    private data class Params(
        val mediaType: MediaType,
        val filter: LibraryFilter,
        val sort: LibrarySortOption,
        val query: String
    )
}

private fun MediaType.Companion.fromString(value: String): MediaType {
    return when (value.lowercase()) {
        "book" -> MediaType.BOOK
        "audiobook" -> MediaType.AUDIOBOOK
        "music" -> MediaType.MUSIC
        "podcast" -> MediaType.PODCAST
        "comic" -> MediaType.COMIC
        "movie" -> MediaType.MOVIE
        "tv_show", "tvshow" -> MediaType.TV_SHOW
        "fanfiction", "webfiction" -> MediaType.FANFICTION
        "document" -> MediaType.DOCUMENT
        "radio" -> MediaType.RADIO
        "news" -> MediaType.NEWS
        else -> MediaType.UNKNOWN
    }
}
