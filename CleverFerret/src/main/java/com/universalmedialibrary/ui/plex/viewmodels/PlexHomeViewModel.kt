package com.universalmedialibrary.ui.plex.viewmodels

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.ServiceAvailabilityManager
import com.universalmedialibrary.services.ServiceType
import com.universalmedialibrary.ui.plex.components.PlexMediaItem
import com.universalmedialibrary.ui.plex.components.PlexMediaType
import com.universalmedialibrary.ui.plex.screens.HomeLibraryStats
import com.universalmedialibrary.ui.plex.screens.HomeCollection
import com.universalmedialibrary.ui.plex.screens.PlexHomeState
import com.universalmedialibrary.ui.plex.theme.PlexColors
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.async
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
 * 
 * Integrates with actual repositories and provides graceful
 * fallbacks when data isn't available.
 */
@HiltViewModel
class PlexHomeViewModel @Inject constructor(
    private val bookRepository: BookRepository,
    private val musicRepository: MusicRepository,
    private val audiobookRepository: AudiobookRepository,
    private val comicRepository: ComicRepository,
    private val videoRepository: VideoRepository,
    private val collectionRepository: CollectionRepository,
    private val serviceAvailabilityManager: ServiceAvailabilityManager
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(PlexHomeState(isLoading = true))
    val uiState: StateFlow<PlexHomeState> = _uiState.asStateFlow()
    
    private val _isRefreshing = MutableStateFlow(false)
    val isRefreshing: StateFlow<Boolean> = _isRefreshing.asStateFlow()
    
    private val _serviceStatuses = MutableStateFlow<Map<ServiceType, Boolean>>(emptyMap())
    val serviceStatuses: StateFlow<Map<ServiceType, Boolean>> = _serviceStatuses.asStateFlow()
    
    init {
        loadHomeData()
        checkServiceAvailability()
    }
    
    fun refresh() {
        viewModelScope.launch {
            _isRefreshing.value = true
            loadHomeData()
            _isRefreshing.value = false
        }
    }
    
    private fun checkServiceAvailability() {
        viewModelScope.launch {
            val statuses = mapOf(
                ServiceType.GEMINI_AI to serviceAvailabilityManager.isServiceAvailable(ServiceType.GEMINI_AI),
                ServiceType.LASTFM to serviceAvailabilityManager.isServiceAvailable(ServiceType.LASTFM),
                ServiceType.TMDB to serviceAvailabilityManager.isServiceAvailable(ServiceType.TMDB),
                ServiceType.GOOGLE_BOOKS to serviceAvailabilityManager.isServiceAvailable(ServiceType.GOOGLE_BOOKS)
            )
            _serviceStatuses.value = statuses
        }
    }
    
    private fun loadHomeData() {
        viewModelScope.launch {
            try {
                // Load data from repositories in parallel
                val booksDeferred = async { loadRecentBooks() }
                val musicDeferred = async { loadRecentMusic() }
                val audiobooksDeferred = async { loadRecentAudiobooks() }
                val comicsDeferred = async { loadRecentComics() }
                val videosDeferred = async { loadRecentVideos() }
                val collectionsDeferred = async { loadCollections() }
                val statsDeferred = async { loadLibraryStats() }
                
                val recentBooks = booksDeferred.await()
                val recentMusic = musicDeferred.await()
                val recentAudiobooks = audiobooksDeferred.await()
                val recentComics = comicsDeferred.await()
                val recentVideos = videosDeferred.await()
                val collections = collectionsDeferred.await()
                val stats = statsDeferred.await()
                
                // Create featured items from recent content
                val featured = createFeaturedItems(recentBooks, recentAudiobooks, recentMusic)
                
                // Create continue items (items with progress > 0)
                val continueItems = (recentBooks + recentAudiobooks + recentComics)
                    .filter { it.progress > 0f && it.progress < 1f }
                    .sortedByDescending { it.progress }
                    .take(10)
                
                _uiState.update {
                    PlexHomeState(
                        isLoading = false,
                        featuredItems = featured,
                        continueItems = continueItems,
                        recentBooks = recentBooks,
                        recentMusic = recentMusic,
                        recentPodcasts = emptyList(), // Podcast repo integration
                        recentVideos = recentVideos,
                        recentAudiobooks = recentAudiobooks,
                        recentComics = recentComics,
                        recentFanfiction = emptyList(), // Web fiction integration
                        libraryStats = stats,
                        collections = collections
                    )
                }
            } catch (e: Exception) {
                _uiState.update {
                    it.copy(isLoading = false)
                }
            }
        }
    }
    
    private suspend fun loadRecentBooks(): List<PlexMediaItem> {
        return try {
            bookRepository.getRecentlyAddedBooks(20).first().map { book ->
                PlexMediaItem(
                    id = book.id.toString(),
                    title = book.title,
                    subtitle = book.author,
                    imageUrl = book.thumbnailPath,
                    mediaType = PlexMediaType.BOOK,
                    progress = 0f, // Progress tracked separately
                    rating = book.rating,
                    year = null,
                    badges = emptyList()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun loadRecentMusic(): List<PlexMediaItem> {
        return try {
            musicRepository.albums.value.take(20).mapIndexed { index, album ->
                PlexMediaItem(
                    id = "album_$index",
                    title = album.name,
                    subtitle = album.artist,
                    imageUrl = album.artworkUri?.toString(),
                    mediaType = PlexMediaType.MUSIC,
                    progress = 0f,
                    year = album.year,
                    badges = emptyList()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun loadRecentAudiobooks(): List<PlexMediaItem> {
        return try {
            audiobookRepository.getAllAudiobooks().first().take(20).map { audiobook ->
                PlexMediaItem(
                    id = audiobook.id.toString(),
                    title = audiobook.title,
                    subtitle = audiobook.author,
                    imageUrl = audiobook.thumbnailPath,
                    mediaType = PlexMediaType.AUDIOBOOK,
                    progress = 0f,
                    rating = audiobook.rating,
                    badges = emptyList()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun loadRecentComics(): List<PlexMediaItem> {
        return try {
            comicRepository.getAllComics().first().take(20).map { comic ->
                PlexMediaItem(
                    id = comic.id.toString(),
                    title = comic.title,
                    subtitle = comic.author,
                    imageUrl = comic.thumbnailPath,
                    mediaType = PlexMediaType.COMIC,
                    progress = 0f,
                    badges = emptyList()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun loadRecentVideos(): List<PlexMediaItem> {
        return try {
            videoRepository.getAllVideos().first().take(20).map { video ->
                PlexMediaItem(
                    id = video.id.toString(),
                    title = video.title,
                    subtitle = video.author,
                    imageUrl = video.thumbnailPath,
                    mediaType = PlexMediaType.MOVIE,
                    progress = 0f,
                    year = null,
                    duration = formatDuration(video.duration),
                    badges = emptyList()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun loadCollections(): List<HomeCollection> {
        return try {
            collectionRepository.getCollections().first().map { collection ->
                HomeCollection(
                    id = collection.collectionId.toString(),
                    name = collection.name,
                    itemCount = 0, // Would need to fetch item count
                    icon = Icons.Default.Folder,
                    color = PlexColors.AccentPrimary
                )
            }
        } catch (e: Exception) {
            // Return default collections
            listOf(
                HomeCollection("favorites", "Favorites", 0, Icons.Default.Favorite, PlexColors.AccentPrimary),
                HomeCollection("to_read", "To Read", 0, Icons.Default.BookmarkAdd, PlexColors.Success),
                HomeCollection("completed", "Completed", 0, Icons.Default.CheckCircle, PlexColors.Info)
            )
        }
    }
    
    private suspend fun loadLibraryStats(): HomeLibraryStats {
        return try {
            val bookCount = bookRepository.getBookCount()
            val audiobookCount = audiobookRepository.getAudiobookCount()
            val musicCount = musicRepository.tracks.value.size
            val comicCount = comicRepository.getComicCount()
            
            HomeLibraryStats(
                totalBooks = bookCount,
                totalAudiobooks = audiobookCount,
                totalMusic = musicCount,
                totalPodcasts = 0, // Podcast repo integration
                totalComics = comicCount
            )
        } catch (e: Exception) {
            HomeLibraryStats()
        }
    }
    
    private fun createFeaturedItems(
        books: List<PlexMediaItem>,
        audiobooks: List<PlexMediaItem>,
        music: List<PlexMediaItem>
    ): List<PlexMediaItem> {
        val featured = mutableListOf<PlexMediaItem>()
        
        // Add highest rated items as featured
        val topRatedBooks = books.filter { it.rating != null }.sortedByDescending { it.rating }.take(2)
        val topRatedAudiobooks = audiobooks.filter { it.rating != null }.sortedByDescending { it.rating }.take(1)
        
        featured.addAll(topRatedBooks)
        featured.addAll(topRatedAudiobooks)
        
        // Fill with recent items if not enough rated items
        if (featured.size < 3) {
            val remaining = 3 - featured.size
            val recentItems = (books + audiobooks + music)
                .filterNot { featured.contains(it) }
                .take(remaining)
            featured.addAll(recentItems)
        }
        
        return featured.take(5)
    }
    
    private fun formatDuration(durationMs: Long?): String? {
        if (durationMs == null) return null
        val hours = durationMs / (1000 * 60 * 60)
        val minutes = (durationMs / (1000 * 60)) % 60
        return if (hours > 0) "${hours}h ${minutes}m" else "${minutes}m"
    }
}
