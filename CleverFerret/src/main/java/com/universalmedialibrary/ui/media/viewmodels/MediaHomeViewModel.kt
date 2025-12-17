package com.universalmedialibrary.ui.media.viewmodels

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.data.repository.WebFictionRepository
import com.universalmedialibrary.services.ServiceAvailabilityManager
import com.universalmedialibrary.services.ServiceType
import com.universalmedialibrary.ui.media.components.MediaBadge
import com.universalmedialibrary.ui.media.components.MediaItem
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.screens.HomeLibraryStats
import com.universalmedialibrary.ui.media.screens.HomeCollection
import com.universalmedialibrary.ui.media.screens.MediaHomeState
import com.universalmedialibrary.ui.media.theme.MediaColors
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.async
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Clean media-centric Home Screen
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
class MediaHomeViewModel @Inject constructor(
    private val bookRepository: BookRepository,
    private val musicRepository: MusicRepository,
    private val audiobookRepository: AudiobookRepository,
    private val comicRepository: ComicRepository,
    private val videoRepository: VideoRepository,
    private val collectionRepository: CollectionRepository,
    private val podcastRepository: PodcastRepository,
    private val webFictionRepository: WebFictionRepository,
    private val serviceAvailabilityManager: ServiceAvailabilityManager
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MediaHomeState(isLoading = true))
    val uiState: StateFlow<MediaHomeState> = _uiState.asStateFlow()
    
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
                val podcastsDeferred = async { loadRecentPodcasts() }
                val fanfictionDeferred = async { loadRecentFanfiction() }
                val collectionsDeferred = async { loadCollections() }
                val statsDeferred = async { loadLibraryStats() }
                
                val recentBooks = booksDeferred.await()
                val recentMusic = musicDeferred.await()
                val recentAudiobooks = audiobooksDeferred.await()
                val recentComics = comicsDeferred.await()
                val recentVideos = videosDeferred.await()
                val recentPodcasts = podcastsDeferred.await()
                val recentFanfiction = fanfictionDeferred.await()
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
                    MediaHomeState(
                        isLoading = false,
                        featuredItems = featured,
                        continueItems = continueItems,
                        recentBooks = recentBooks,
                        recentMusic = recentMusic,
                        recentPodcasts = recentPodcasts,
                        recentVideos = recentVideos,
                        recentAudiobooks = recentAudiobooks,
                        recentComics = recentComics,
                        recentFanfiction = recentFanfiction,
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
    
    private suspend fun loadRecentBooks(): List<MediaItem> {
        return try {
            bookRepository.getRecentlyAddedBooks(20).first().map { book ->
                MediaItem(
                    id = book.id.toString(),
                    title = book.title,
                    subtitle = book.author,
                    imageUrl = book.thumbnailPath,
                    mediaType = MediaType.BOOK,
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
    
    private suspend fun loadRecentMusic(): List<MediaItem> {
        return try {
            musicRepository.albums.value.take(20).mapIndexed { index, album ->
                MediaItem(
                    id = "album_$index",
                    title = album.name,
                    subtitle = album.artist,
                    imageUrl = album.artworkUri?.toString(),
                    mediaType = MediaType.MUSIC,
                    progress = 0f,
                    year = album.year,
                    badges = emptyList()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun loadRecentAudiobooks(): List<MediaItem> {
        return try {
            audiobookRepository.getAllAudiobooks().first().take(20).map { audiobook ->
                MediaItem(
                    id = audiobook.id.toString(),
                    title = audiobook.title,
                    subtitle = audiobook.author,
                    imageUrl = audiobook.thumbnailPath,
                    mediaType = MediaType.AUDIOBOOK,
                    progress = 0f,
                    rating = audiobook.rating,
                    badges = emptyList()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun loadRecentComics(): List<MediaItem> {
        return try {
            comicRepository.getAllComics().first().take(20).map { comic ->
                MediaItem(
                    id = comic.id.toString(),
                    title = comic.title,
                    subtitle = comic.author,
                    imageUrl = comic.thumbnailPath,
                    mediaType = MediaType.COMIC,
                    progress = 0f,
                    badges = emptyList()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun loadRecentVideos(): List<MediaItem> {
        return try {
            // Pull from all relevant video types, not only MEDIA_TYPE_VIDEO.
            val videos = (videoRepository.getMovies().first() + videoRepository.getTvShows().first() + videoRepository.getAllVideos().first())
                .distinctBy { it.itemId }
                .sortedByDescending { it.dateAdded }
                .take(20)

            videos.map { video ->
                MediaItem(
                    id = video.id.toString(),
                    title = video.title,
                    subtitle = video.author,
                    imageUrl = video.thumbnailPath,
                    mediaType = when (video.mediaType) {
                        VideoRepository.MEDIA_TYPE_TV_SHOW -> MediaType.TV_SHOW
                        else -> MediaType.MOVIE
                    },
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

    private suspend fun loadRecentPodcasts(): List<MediaItem> {
        return try {
            podcastRepository.getNewEpisodes().first().take(20).map { episode ->
                val progress = if (episode.duration > 0) {
                    (episode.playPosition.toFloat() / episode.duration.toFloat()).coerceIn(0f, 1f)
                } else 0f
                MediaItem(
                    id = episode.id.toString(),
                    title = episode.title,
                    subtitle = "Podcast",
                    imageUrl = episode.imageUrl,
                    mediaType = MediaType.PODCAST,
                    progress = progress,
                    duration = if (episode.duration > 0) formatDuration(episode.duration) else null,
                    badges = buildList {
                        if (episode.isNew) add(MediaBadge("NEW"))
                        if (episode.isDownloaded) add(MediaBadge("DOWNLOADED"))
                    }
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }

    private suspend fun loadRecentFanfiction(): List<MediaItem> {
        return try {
            webFictionRepository.getRecentlyAddedWebFiction(20).first().map { story ->
                val progress = if (story.chapterCount > 0) {
                    (story.lastChapterDownloaded.toFloat() / story.chapterCount.toFloat()).coerceIn(0f, 1f)
                } else 0f
                MediaItem(
                    id = story.id,
                    title = story.title,
                    subtitle = story.author,
                    imageUrl = story.coverPath,
                    mediaType = MediaType.FANFICTION,
                    progress = progress,
                    badges = buildList {
                        if (story.status.equals("COMPLETE", ignoreCase = true)) {
                            add(MediaBadge("COMPLETED"))
                        }
                    }
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
                    color = MediaColors.AccentPrimary
                )
            }
        } catch (e: Exception) {
            // Return default collections
            listOf(
                HomeCollection("favorites", "Favorites", 0, Icons.Default.Favorite, MediaColors.AccentPrimary),
                HomeCollection("to_read", "To Read", 0, Icons.Default.BookmarkAdd, MediaColors.Success),
                HomeCollection("completed", "Completed", 0, Icons.Default.CheckCircle, MediaColors.Info)
            )
        }
    }
    
    private suspend fun loadLibraryStats(): HomeLibraryStats {
        return try {
            val bookCount = bookRepository.getBookCount()
            val audiobookCount = audiobookRepository.getAudiobookCount()
            val musicCount = musicRepository.tracks.value.size
            val comicCount = comicRepository.getComicCount()
            val podcastCount = podcastRepository.getSubscribedPodcasts().first().size
            val fanfictionCount = webFictionRepository.getWebFictionCount()
            val videoCount = videoRepository.getVideoCount()
            
            HomeLibraryStats(
                totalBooks = bookCount,
                totalAudiobooks = audiobookCount,
                totalMusic = musicCount,
                totalPodcasts = podcastCount,
                totalComics = comicCount,
                totalFanfiction = fanfictionCount,
                totalVideos = videoCount
            )
        } catch (e: Exception) {
            HomeLibraryStats()
        }
    }
    
    private fun createFeaturedItems(
        books: List<MediaItem>,
        audiobooks: List<MediaItem>,
        music: List<MediaItem>
    ): List<MediaItem> {
        val featured = mutableListOf<MediaItem>()
        
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

    private fun formatDuration(durationMs: Long): String {
        val hours = durationMs / (1000 * 60 * 60)
        val minutes = (durationMs / (1000 * 60)) % 60
        val seconds = (durationMs / 1000) % 60
        return when {
            hours > 0 -> "${hours}h ${minutes}m"
            minutes > 0 -> "${minutes}m ${seconds}s"
            else -> "${seconds}s"
        }
    }
}
