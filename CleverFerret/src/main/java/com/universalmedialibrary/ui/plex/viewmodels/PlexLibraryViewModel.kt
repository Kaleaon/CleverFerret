package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.ui.plex.components.PlexMediaItem
import com.universalmedialibrary.ui.plex.components.PlexMediaType
import com.universalmedialibrary.ui.plex.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex-style Library Screen
 * 
 * Handles:
 * - Loading items for a specific media type
 * - Filtering (unread, in-progress, favorites, etc.)
 * - Sorting (title, date added, rating, etc.)
 * - View mode persistence
 * - Search within library
 */
@HiltViewModel
class PlexLibraryViewModel @Inject constructor(
    private val savedStateHandle: SavedStateHandle,
    private val bookRepository: BookRepository,
    private val audiobookRepository: AudiobookRepository,
    private val musicRepository: MusicRepository,
    private val podcastRepository: PodcastRepository,
    private val comicRepository: ComicRepository,
    private val videoRepository: VideoRepository,
    private val webFictionRepository: WebFictionRepository,
    private val settingsRepository: SettingsRepository
) : ViewModel() {
    
    // Get media type from navigation argument
    private val mediaTypeArg: String = savedStateHandle.get<String>("mediaType") ?: "book"
    
    private val _mediaType = MutableStateFlow(PlexMediaType.fromString(mediaTypeArg))
    val mediaType: StateFlow<PlexMediaType> = _mediaType.asStateFlow()
    
    private val _uiState = MutableStateFlow(LibraryScreenState(
        libraryTitle = getLibraryTitle(PlexMediaType.fromString(mediaTypeArg)),
        mediaType = PlexMediaType.fromString(mediaTypeArg)
    ))
    val uiState: StateFlow<LibraryScreenState> = _uiState.asStateFlow()
    
    private val _currentFilter = MutableStateFlow(LibraryFilter.ALL)
    private val _currentSort = MutableStateFlow(LibrarySortOption.RECENTLY_ADDED)
    private val _viewMode = MutableStateFlow(LibraryViewMode.GRID)
    private val _searchQuery = MutableStateFlow("")
    
    init {
        loadLibraryItems()
        observeFilterChanges()
    }
    
    private fun observeFilterChanges() {
        viewModelScope.launch {
            combine(
                _currentFilter,
                _currentSort,
                _searchQuery
            ) { filter, sort, query ->
                Triple(filter, sort, query)
            }.collect { (filter, sort, query) ->
                loadLibraryItems(filter, sort, query)
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
        // Persist view mode preference
        viewModelScope.launch {
            settingsRepository.setLibraryViewMode(_mediaType.value, mode)
        }
    }
    
    fun search(query: String) {
        _searchQuery.value = query
    }
    
    fun refresh() {
        loadLibraryItems(_currentFilter.value, _currentSort.value, _searchQuery.value)
    }
    
    private fun loadLibraryItems(
        filter: LibraryFilter = LibraryFilter.ALL,
        sort: LibrarySortOption = LibrarySortOption.RECENTLY_ADDED,
        query: String = ""
    ) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            val items = when (_mediaType.value) {
                PlexMediaType.BOOK -> loadBooks(filter, sort, query)
                PlexMediaType.AUDIOBOOK -> loadAudiobooks(filter, sort, query)
                PlexMediaType.MUSIC -> loadMusic(filter, sort, query)
                PlexMediaType.PODCAST -> loadPodcasts(filter, sort, query)
                PlexMediaType.COMIC -> loadComics(filter, sort, query)
                PlexMediaType.MOVIE -> loadMovies(filter, sort, query)
                PlexMediaType.TV_SHOW -> loadTVShows(filter, sort, query)
                PlexMediaType.FANFICTION -> loadWebFiction(filter, sort, query)
                PlexMediaType.DOCUMENT -> loadDocuments(filter, sort, query)
                PlexMediaType.RADIO -> emptyList()
            }
            
            _uiState.update { state ->
                state.copy(
                    items = items,
                    totalItems = items.size,
                    isLoading = false,
                    availableFilters = getFilterGroupsForMediaType(_mediaType.value)
                )
            }
        }
    }
    
    private suspend fun loadBooks(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return bookRepository.getBooks(
            filter = filter.toBookFilter(),
            sort = sort.toBookSort(),
            query = query
        ).first().map { book ->
            PlexMediaItem(
                id = book.id.toString(),
                title = book.title,
                subtitle = book.author,
                imageUrl = book.coverPath,
                mediaType = PlexMediaType.BOOK,
                progress = book.readingProgress,
                rating = book.rating?.toFloat(),
                year = book.publishYear,
                duration = "${book.pageCount} pages",
                badges = buildBookBadges(book),
                lastAccessed = book.lastReadTime ?: 0L
            )
        }
    }
    
    private suspend fun loadAudiobooks(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return audiobookRepository.getAudiobooks(
            filter = filter.toAudiobookFilter(),
            sort = sort.toAudiobookSort(),
            query = query
        ).first().map { audiobook ->
            PlexMediaItem(
                id = audiobook.id.toString(),
                title = audiobook.title,
                subtitle = audiobook.author,
                imageUrl = audiobook.coverPath,
                mediaType = PlexMediaType.AUDIOBOOK,
                progress = audiobook.progress,
                rating = audiobook.rating?.toFloat(),
                year = audiobook.year,
                duration = formatDuration(audiobook.durationMs),
                badges = emptyList(),
                lastAccessed = audiobook.lastPlayedTime ?: 0L
            )
        }
    }
    
    private suspend fun loadMusic(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return musicRepository.getAlbums(
            filter = filter.toMusicFilter(),
            sort = sort.toMusicSort(),
            query = query
        ).first().map { album ->
            PlexMediaItem(
                id = album.id.toString(),
                title = album.title,
                subtitle = album.artist,
                imageUrl = album.artworkPath,
                mediaType = PlexMediaType.MUSIC,
                progress = 0f,
                rating = null,
                year = album.year,
                duration = "${album.trackCount} tracks",
                badges = emptyList(),
                lastAccessed = album.lastPlayedTime ?: 0L
            )
        }
    }
    
    private suspend fun loadPodcasts(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return podcastRepository.getSubscribedShows(
            query = query
        ).first().map { show ->
            PlexMediaItem(
                id = show.id.toString(),
                title = show.title,
                subtitle = show.author,
                imageUrl = show.artworkUrl,
                mediaType = PlexMediaType.PODCAST,
                progress = 0f,
                rating = null,
                year = null,
                duration = "${show.episodeCount} episodes",
                badges = if (show.unplayedCount > 0) listOf(
                    com.universalmedialibrary.ui.plex.components.PlexBadge(
                        text = "${show.unplayedCount} new",
                        type = com.universalmedialibrary.ui.plex.components.BadgeType.NEW
                    )
                ) else emptyList(),
                lastAccessed = show.lastUpdated ?: 0L
            )
        }
    }
    
    private suspend fun loadComics(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return comicRepository.getComics(
            filter = filter.toComicFilter(),
            sort = sort.toComicSort(),
            query = query
        ).first().map { comic ->
            PlexMediaItem(
                id = comic.id.toString(),
                title = comic.title,
                subtitle = comic.series ?: comic.writer,
                imageUrl = comic.coverPath,
                mediaType = PlexMediaType.COMIC,
                progress = comic.readingProgress,
                rating = comic.rating?.toFloat(),
                year = comic.year,
                duration = "${comic.pageCount} pages",
                badges = emptyList(),
                lastAccessed = comic.lastReadTime ?: 0L
            )
        }
    }
    
    private suspend fun loadMovies(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return videoRepository.getMovies(
            filter = filter.toVideoFilter(),
            sort = sort.toVideoSort(),
            query = query
        ).first().map { movie ->
            PlexMediaItem(
                id = movie.id.toString(),
                title = movie.title,
                subtitle = movie.director,
                imageUrl = movie.posterPath,
                mediaType = PlexMediaType.MOVIE,
                progress = movie.watchProgress,
                rating = movie.rating?.toFloat(),
                year = movie.year,
                duration = formatDuration(movie.durationMs),
                badges = emptyList(),
                lastAccessed = movie.lastWatchedTime ?: 0L
            )
        }
    }
    
    private suspend fun loadTVShows(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return videoRepository.getTVShows(
            filter = filter.toVideoFilter(),
            sort = sort.toVideoSort(),
            query = query
        ).first().map { show ->
            PlexMediaItem(
                id = show.id.toString(),
                title = show.title,
                subtitle = "${show.seasonCount} seasons",
                imageUrl = show.posterPath,
                mediaType = PlexMediaType.TV_SHOW,
                progress = show.watchProgress,
                rating = show.rating?.toFloat(),
                year = show.year,
                duration = "${show.episodeCount} episodes",
                badges = if (show.unwatchedCount > 0) listOf(
                    com.universalmedialibrary.ui.plex.components.PlexBadge(
                        text = "${show.unwatchedCount} unwatched",
                        type = com.universalmedialibrary.ui.plex.components.BadgeType.COUNT
                    )
                ) else emptyList(),
                lastAccessed = show.lastWatchedTime ?: 0L
            )
        }
    }
    
    private suspend fun loadWebFiction(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return webFictionRepository.getStories(
            filter = filter.toWebFictionFilter(),
            sort = sort.toWebFictionSort(),
            query = query
        ).first().map { story ->
            PlexMediaItem(
                id = story.id.toString(),
                title = story.title,
                subtitle = story.author,
                imageUrl = story.coverUrl,
                mediaType = PlexMediaType.FANFICTION,
                progress = story.readProgress,
                rating = story.rating?.toFloat(),
                year = null,
                duration = "${story.chapterCount} chapters",
                badges = if (story.unreadChapters > 0) listOf(
                    com.universalmedialibrary.ui.plex.components.PlexBadge(
                        text = "${story.unreadChapters} new",
                        type = com.universalmedialibrary.ui.plex.components.BadgeType.NEW
                    )
                ) else emptyList(),
                lastAccessed = story.lastReadTime ?: 0L
            )
        }
    }
    
    private suspend fun loadDocuments(
        filter: LibraryFilter,
        sort: LibrarySortOption,
        query: String
    ): List<PlexMediaItem> {
        return bookRepository.getDocuments(query = query).first().map { doc ->
            PlexMediaItem(
                id = doc.id.toString(),
                title = doc.title,
                subtitle = doc.format,
                imageUrl = null,
                mediaType = PlexMediaType.DOCUMENT,
                progress = doc.readingProgress,
                rating = null,
                year = null,
                duration = null,
                badges = emptyList(),
                lastAccessed = doc.lastAccessedTime ?: 0L
            )
        }
    }
    
    private fun getLibraryTitle(mediaType: PlexMediaType): String = when (mediaType) {
        PlexMediaType.BOOK -> "Books"
        PlexMediaType.AUDIOBOOK -> "Audiobooks"
        PlexMediaType.MUSIC -> "Music"
        PlexMediaType.PODCAST -> "Podcasts"
        PlexMediaType.COMIC -> "Comics"
        PlexMediaType.MOVIE -> "Movies"
        PlexMediaType.TV_SHOW -> "TV Shows"
        PlexMediaType.FANFICTION -> "Web Fiction"
        PlexMediaType.DOCUMENT -> "Documents"
        PlexMediaType.RADIO -> "Radio"
    }
    
    private fun getFilterGroupsForMediaType(mediaType: PlexMediaType): List<LibraryFilterGroup> {
        return when (mediaType) {
            PlexMediaType.BOOK, PlexMediaType.COMIC, PlexMediaType.FANFICTION -> listOf(
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
            PlexMediaType.AUDIOBOOK -> listOf(
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
            PlexMediaType.MUSIC -> listOf(
                LibraryFilterGroup("View", listOf(
                    LibraryFilter.ALL,
                    LibraryFilter.RECENTLY_PLAYED,
                    LibraryFilter.FAVORITES
                )),
                LibraryFilterGroup("Storage", listOf(
                    LibraryFilter.DOWNLOADED
                ))
            )
            PlexMediaType.MOVIE, PlexMediaType.TV_SHOW -> listOf(
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
            PlexMediaType.PODCAST -> listOf(
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
    
    private fun buildBookBadges(book: Any): List<com.universalmedialibrary.ui.plex.components.PlexBadge> {
        // Build badges based on book properties
        return emptyList()
    }
    
    private fun formatDuration(ms: Long?): String? {
        if (ms == null) return null
        val hours = ms / (1000 * 60 * 60)
        val minutes = (ms / (1000 * 60)) % 60
        return if (hours > 0) "${hours}h ${minutes}m" else "${minutes}m"
    }
}

// Extension functions to convert filters to repository-specific types
private fun LibraryFilter.toBookFilter(): String = name
private fun LibraryFilter.toAudiobookFilter(): String = name
private fun LibraryFilter.toMusicFilter(): String = name
private fun LibraryFilter.toComicFilter(): String = name
private fun LibraryFilter.toVideoFilter(): String = name
private fun LibraryFilter.toWebFictionFilter(): String = name

private fun LibrarySortOption.toBookSort(): String = name
private fun LibrarySortOption.toAudiobookSort(): String = name
private fun LibrarySortOption.toMusicSort(): String = name
private fun LibrarySortOption.toComicSort(): String = name
private fun LibrarySortOption.toVideoSort(): String = name
private fun LibrarySortOption.toWebFictionSort(): String = name

private fun PlexMediaType.Companion.fromString(value: String): PlexMediaType {
    return when (value.lowercase()) {
        "book" -> PlexMediaType.BOOK
        "audiobook" -> PlexMediaType.AUDIOBOOK
        "music" -> PlexMediaType.MUSIC
        "podcast" -> PlexMediaType.PODCAST
        "comic" -> PlexMediaType.COMIC
        "movie" -> PlexMediaType.MOVIE
        "tv_show", "tvshow" -> PlexMediaType.TV_SHOW
        "fanfiction", "webfiction" -> PlexMediaType.FANFICTION
        "document" -> PlexMediaType.DOCUMENT
        "radio" -> PlexMediaType.RADIO
        else -> PlexMediaType.BOOK
    }
}
