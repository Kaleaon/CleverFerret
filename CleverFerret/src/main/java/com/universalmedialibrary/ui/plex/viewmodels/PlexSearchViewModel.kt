package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.search.EnhancedSearchService
import com.universalmedialibrary.services.opds.OPDSCatalogService
import com.universalmedialibrary.ui.plex.components.PlexMediaType
import com.universalmedialibrary.ui.plex.screens.SearchCategory
import com.universalmedialibrary.ui.plex.screens.SearchResult
import com.universalmedialibrary.ui.plex.screens.SearchScreenState
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex-style Universal Search
 * 
 * Searches across:
 * - Local library (all media types)
 * - OPDS catalogs
 * - External metadata providers
 * - Podcast directories
 * - Web fiction sources
 */
@HiltViewModel
class PlexSearchViewModel @Inject constructor(
    private val enhancedSearchService: EnhancedSearchService,
    private val bookRepository: BookRepository,
    private val audiobookRepository: AudiobookRepository,
    private val musicRepository: MusicRepository,
    private val podcastRepository: PodcastRepository,
    private val comicRepository: ComicRepository,
    private val videoRepository: VideoRepository,
    private val webFictionRepository: WebFictionRepository,
    private val opdsService: OPDSCatalogService,
    private val searchHistoryRepository: SearchHistoryRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(SearchScreenState())
    val uiState: StateFlow<SearchScreenState> = _uiState.asStateFlow()
    
    private var searchJob: Job? = null
    
    init {
        loadRecentSearches()
    }
    
    private fun loadRecentSearches() {
        viewModelScope.launch {
            searchHistoryRepository.getRecentSearches(limit = 10).collect { searches ->
                _uiState.update { it.copy(recentSearches = searches) }
            }
        }
    }
    
    fun updateQuery(query: String) {
        _uiState.update { it.copy(query = query) }
        
        // Debounce search
        searchJob?.cancel()
        if (query.length >= 2) {
            searchJob = viewModelScope.launch {
                delay(300) // Debounce
                performSearch(query)
            }
        } else {
            _uiState.update { it.copy(results = emptyList(), groupedResults = emptyMap()) }
        }
    }
    
    fun search(query: String) {
        if (query.isBlank()) return
        
        // Save to history
        viewModelScope.launch {
            searchHistoryRepository.addSearch(query)
        }
        
        performSearch(query)
    }
    
    fun clearSearch() {
        _uiState.update { it.copy(query = "", results = emptyList(), groupedResults = emptyMap()) }
    }
    
    fun setCategory(category: SearchCategory?) {
        _uiState.update { it.copy(selectedCategory = category) }
        
        // Re-filter results if we have any
        if (_uiState.value.query.isNotBlank()) {
            filterResults(category)
        }
    }
    
    fun clearRecentSearches() {
        viewModelScope.launch {
            searchHistoryRepository.clearHistory()
            _uiState.update { it.copy(recentSearches = emptyList()) }
        }
    }
    
    fun useRecentSearch(query: String) {
        _uiState.update { it.copy(query = query) }
        search(query)
    }
    
    private fun performSearch(query: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isSearching = true) }
            
            val allResults = mutableListOf<SearchResult>()
            
            // Search local library in parallel
            val localResults = searchLocalLibrary(query)
            allResults.addAll(localResults)
            
            // Search external sources (based on selected category or all)
            val selectedCategory = _uiState.value.selectedCategory
            
            if (selectedCategory == null || selectedCategory == SearchCategory.BOOKS) {
                val opdsResults = searchOpds(query)
                allResults.addAll(opdsResults)
            }
            
            if (selectedCategory == null || selectedCategory == SearchCategory.PODCASTS) {
                val podcastResults = searchPodcastDirectories(query)
                allResults.addAll(podcastResults)
            }
            
            if (selectedCategory == null || selectedCategory == SearchCategory.WEB_FICTION) {
                val webFictionResults = searchWebFictionSources(query)
                allResults.addAll(webFictionResults)
            }
            
            // Group results by category
            val groupedResults = allResults.groupBy { it.category }
            
            // Filter if category selected
            val filteredResults = if (selectedCategory != null) {
                allResults.filter { it.category == selectedCategory }
            } else {
                allResults
            }
            
            _uiState.update {
                it.copy(
                    results = filteredResults,
                    groupedResults = groupedResults,
                    isSearching = false
                )
            }
        }
    }
    
    private suspend fun searchLocalLibrary(query: String): List<SearchResult> {
        val results = mutableListOf<SearchResult>()
        
        // Search books
        bookRepository.search(query).first().forEach { book ->
            results.add(SearchResult(
                id = "book_${book.id}",
                title = book.title,
                subtitle = book.author,
                imageUrl = book.coverPath,
                category = SearchCategory.BOOKS,
                source = "Local",
                mediaType = PlexMediaType.BOOK
            ))
        }
        
        // Search audiobooks
        audiobookRepository.search(query).first().forEach { audiobook ->
            results.add(SearchResult(
                id = "audiobook_${audiobook.id}",
                title = audiobook.title,
                subtitle = audiobook.author,
                imageUrl = audiobook.coverPath,
                category = SearchCategory.AUDIOBOOKS,
                source = "Local",
                mediaType = PlexMediaType.AUDIOBOOK
            ))
        }
        
        // Search comics
        comicRepository.search(query).first().forEach { comic ->
            results.add(SearchResult(
                id = "comic_${comic.id}",
                title = comic.title,
                subtitle = comic.series,
                imageUrl = comic.coverPath,
                category = SearchCategory.COMICS,
                source = "Local",
                mediaType = PlexMediaType.COMIC
            ))
        }
        
        // Search music
        musicRepository.searchAlbums(query).first().forEach { album ->
            results.add(SearchResult(
                id = "album_${album.id}",
                title = album.title,
                subtitle = album.artist,
                imageUrl = album.artworkPath,
                category = SearchCategory.MUSIC,
                source = "Local",
                mediaType = PlexMediaType.MUSIC
            ))
        }
        
        musicRepository.searchArtists(query).first().forEach { artist ->
            results.add(SearchResult(
                id = "artist_${artist.id}",
                title = artist.name,
                subtitle = "${artist.albumCount} albums",
                imageUrl = artist.imageUrl,
                category = SearchCategory.MUSIC,
                source = "Local",
                mediaType = PlexMediaType.MUSIC
            ))
        }
        
        // Search podcasts
        podcastRepository.searchShows(query).first().forEach { show ->
            results.add(SearchResult(
                id = "podcast_${show.id}",
                title = show.title,
                subtitle = show.author,
                imageUrl = show.artworkUrl,
                category = SearchCategory.PODCASTS,
                source = "Local",
                mediaType = PlexMediaType.PODCAST
            ))
        }
        
        // Search movies
        videoRepository.searchMovies(query).first().forEach { movie ->
            results.add(SearchResult(
                id = "movie_${movie.id}",
                title = movie.title,
                subtitle = movie.year?.toString(),
                imageUrl = movie.posterPath,
                category = SearchCategory.MOVIES,
                source = "Local",
                mediaType = PlexMediaType.MOVIE
            ))
        }
        
        // Search TV shows
        videoRepository.searchTVShows(query).first().forEach { show ->
            results.add(SearchResult(
                id = "tvshow_${show.id}",
                title = show.title,
                subtitle = "${show.seasonCount} seasons",
                imageUrl = show.posterPath,
                category = SearchCategory.TV_SHOWS,
                source = "Local",
                mediaType = PlexMediaType.TV_SHOW
            ))
        }
        
        // Search web fiction
        webFictionRepository.search(query).first().forEach { story ->
            results.add(SearchResult(
                id = "webfiction_${story.id}",
                title = story.title,
                subtitle = story.author,
                imageUrl = story.coverUrl,
                category = SearchCategory.WEB_FICTION,
                source = "Local",
                mediaType = PlexMediaType.FANFICTION
            ))
        }
        
        return results
    }
    
    private suspend fun searchOpds(query: String): List<SearchResult> {
        val results = mutableListOf<SearchResult>()
        
        try {
            opdsService.searchCatalogs(query).collect { entries ->
                entries.forEach { entry ->
                    results.add(SearchResult(
                        id = "opds_${entry.id}",
                        title = entry.title,
                        subtitle = entry.author,
                        imageUrl = entry.coverUrl,
                        category = SearchCategory.BOOKS,
                        source = entry.catalogName,
                        mediaType = PlexMediaType.BOOK
                    ))
                }
            }
        } catch (e: Exception) {
            // Log error but don't fail the entire search
        }
        
        return results
    }
    
    private suspend fun searchPodcastDirectories(query: String): List<SearchResult> {
        val results = mutableListOf<SearchResult>()
        
        try {
            podcastRepository.searchDirectories(query).first().forEach { podcast ->
                results.add(SearchResult(
                    id = "podcast_ext_${podcast.id}",
                    title = podcast.title,
                    subtitle = podcast.author,
                    imageUrl = podcast.artworkUrl,
                    category = SearchCategory.PODCASTS,
                    source = podcast.directory,
                    mediaType = PlexMediaType.PODCAST
                ))
            }
        } catch (e: Exception) {
            // Log error
        }
        
        return results
    }
    
    private suspend fun searchWebFictionSources(query: String): List<SearchResult> {
        val results = mutableListOf<SearchResult>()
        
        try {
            webFictionRepository.searchExternalSources(query).first().forEach { story ->
                results.add(SearchResult(
                    id = "webfiction_ext_${story.id}",
                    title = story.title,
                    subtitle = story.author,
                    imageUrl = story.coverUrl,
                    category = SearchCategory.WEB_FICTION,
                    source = story.source,
                    mediaType = PlexMediaType.FANFICTION
                ))
            }
        } catch (e: Exception) {
            // Log error
        }
        
        return results
    }
    
    private fun filterResults(category: SearchCategory?) {
        val allResults = _uiState.value.groupedResults.values.flatten()
        val filtered = if (category != null) {
            allResults.filter { it.category == category }
        } else {
            allResults
        }
        _uiState.update { it.copy(results = filtered) }
    }
}
