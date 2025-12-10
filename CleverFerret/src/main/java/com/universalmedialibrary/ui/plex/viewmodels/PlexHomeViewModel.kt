package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.ui.plex.components.PlexMediaItem
import com.universalmedialibrary.ui.plex.components.PlexMediaType
import com.universalmedialibrary.ui.plex.screens.LibraryStats
import com.universalmedialibrary.ui.plex.screens.PlexCollection
import com.universalmedialibrary.ui.plex.screens.PlexHomeState
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex-style Home Screen
 * 
 * Aggregates data from all media repositories to provide:
 * - Featured/hero items
 * - Continue where you left off
 * - Recently added across all media types
 * - Library statistics
 * - Collections
 */
@HiltViewModel
class PlexHomeViewModel @Inject constructor(
    private val bookRepository: BookRepository,
    private val audiobookRepository: AudiobookRepository,
    private val musicRepository: MusicRepository,
    private val podcastRepository: PodcastRepository,
    private val comicRepository: ComicRepository,
    private val videoRepository: VideoRepository,
    private val webFictionRepository: WebFictionRepository,
    private val readingProgressRepository: ReadingProgressRepository,
    private val collectionRepository: CollectionRepository,
    private val settingsRepository: SettingsRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(PlexHomeState())
    val uiState: StateFlow<PlexHomeState> = _uiState.asStateFlow()
    
    private val _isRefreshing = MutableStateFlow(false)
    val isRefreshing: StateFlow<Boolean> = _isRefreshing.asStateFlow()
    
    init {
        loadHomeData()
    }
    
    fun refresh() {
        viewModelScope.launch {
            _isRefreshing.value = true
            loadHomeData()
            _isRefreshing.value = false
        }
    }
    
    private fun loadHomeData() {
        viewModelScope.launch {
            // Load all data in parallel
            combine(
                loadFeaturedItems(),
                loadContinueItems(),
                loadRecentlyAddedBooks(),
                loadRecentlyAddedMusic(),
                loadRecentlyAddedPodcasts(),
                loadRecentlyAddedVideos(),
                loadRecentlyAddedAudiobooks(),
                loadRecentlyAddedComics(),
                loadRecentlyAddedWebFiction(),
                loadLibraryStats(),
                loadCollections()
            ) { featured, continueItems, books, music, podcasts, videos, audiobooks, comics, webfiction, stats, collections ->
                PlexHomeState(
                    isLoading = false,
                    featuredItems = featured,
                    continueItems = continueItems,
                    recentBooks = books,
                    recentMusic = music,
                    recentPodcasts = podcasts,
                    recentVideos = videos,
                    recentAudiobooks = audiobooks,
                    recentComics = comics,
                    recentWebFiction = webfiction,
                    libraryStats = stats,
                    collections = collections
                )
            }.collect { state ->
                _uiState.value = state
            }
        }
    }
    
    private fun loadFeaturedItems(): Flow<List<PlexMediaItem>> = flow {
        // Get highly-rated or featured items across all media types
        val featured = mutableListOf<PlexMediaItem>()
        
        // Add top-rated books
        bookRepository.getTopRatedBooks(limit = 3).collect { books ->
            featured.addAll(books.map { it.toPlexMediaItem() })
        }
        
        // Add featured audiobooks
        audiobookRepository.getFeaturedAudiobooks(limit = 2).collect { audiobooks ->
            featured.addAll(audiobooks.map { it.toPlexMediaItem() })
        }
        
        emit(featured.shuffled().take(5))
    }
    
    private fun loadContinueItems(): Flow<List<PlexMediaItem>> = flow {
        val continueItems = mutableListOf<PlexMediaItem>()
        
        // Get in-progress items from all media types
        readingProgressRepository.getInProgressItems().collect { items ->
            continueItems.addAll(items.map { it.toPlexMediaItem() })
        }
        
        emit(continueItems.sortedByDescending { it.lastAccessed }.take(10))
    }
    
    private fun loadRecentlyAddedBooks(): Flow<List<PlexMediaItem>> =
        bookRepository.getRecentlyAdded(limit = 20).map { books ->
            books.map { it.toPlexMediaItem() }
        }
    
    private fun loadRecentlyAddedMusic(): Flow<List<PlexMediaItem>> =
        musicRepository.getRecentlyAdded(limit = 20).map { albums ->
            albums.map { it.toPlexMediaItem() }
        }
    
    private fun loadRecentlyAddedPodcasts(): Flow<List<PlexMediaItem>> =
        podcastRepository.getLatestEpisodes(limit = 20).map { episodes ->
            episodes.map { it.toPlexMediaItem() }
        }
    
    private fun loadRecentlyAddedVideos(): Flow<List<PlexMediaItem>> =
        videoRepository.getRecentlyAdded(limit = 20).map { videos ->
            videos.map { it.toPlexMediaItem() }
        }
    
    private fun loadRecentlyAddedAudiobooks(): Flow<List<PlexMediaItem>> =
        audiobookRepository.getRecentlyAdded(limit = 20).map { audiobooks ->
            audiobooks.map { it.toPlexMediaItem() }
        }
    
    private fun loadRecentlyAddedComics(): Flow<List<PlexMediaItem>> =
        comicRepository.getRecentlyAdded(limit = 20).map { comics ->
            comics.map { it.toPlexMediaItem() }
        }
    
    private fun loadRecentlyAddedWebFiction(): Flow<List<PlexMediaItem>> =
        webFictionRepository.getRecentlyUpdated(limit = 20).map { stories ->
            stories.map { it.toPlexMediaItem() }
        }
    
    private fun loadLibraryStats(): Flow<LibraryStats> = flow {
        val stats = LibraryStats(
            totalBooks = bookRepository.getCount(),
            totalAudiobooks = audiobookRepository.getCount(),
            totalMusic = musicRepository.getTrackCount(),
            totalPodcasts = podcastRepository.getEpisodeCount(),
            totalVideos = videoRepository.getCount(),
            totalComics = comicRepository.getCount(),
            totalWebFiction = webFictionRepository.getCount(),
            storageUsed = calculateStorageUsed()
        )
        emit(stats)
    }
    
    private fun loadCollections(): Flow<List<PlexCollection>> =
        collectionRepository.getAllCollections().map { collections ->
            collections.map { it.toPlexCollection() }
        }
    
    private suspend fun calculateStorageUsed(): String {
        // Calculate total storage used by media files
        val totalBytes = bookRepository.getTotalFileSize() +
                audiobookRepository.getTotalFileSize() +
                musicRepository.getTotalFileSize() +
                comicRepository.getTotalFileSize()
        
        return when {
            totalBytes >= 1_000_000_000 -> "%.1f GB".format(totalBytes / 1_000_000_000.0)
            totalBytes >= 1_000_000 -> "%.1f MB".format(totalBytes / 1_000_000.0)
            else -> "%.1f KB".format(totalBytes / 1_000.0)
        }
    }
}

// Extension functions to convert domain models to PlexMediaItem
// These would be implemented based on the actual domain model classes

private fun Any.toPlexMediaItem(): PlexMediaItem {
    // This is a placeholder - implement based on actual model types
    return PlexMediaItem(
        id = hashCode().toString(),
        title = toString(),
        subtitle = null,
        imageUrl = null,
        mediaType = PlexMediaType.BOOK,
        progress = 0f,
        rating = null,
        year = null,
        duration = null,
        badges = emptyList(),
        lastAccessed = System.currentTimeMillis()
    )
}

private fun Any.toPlexCollection(): PlexCollection {
    return PlexCollection(
        id = hashCode().toString(),
        name = toString(),
        itemCount = 0,
        coverUrls = emptyList()
    )
}
