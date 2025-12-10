package com.universalmedialibrary.ui.plex.viewmodels

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.plex.components.PlexMediaItem
import com.universalmedialibrary.ui.plex.components.PlexMediaType
import com.universalmedialibrary.ui.plex.screens.HomeLibraryStats
import com.universalmedialibrary.ui.plex.screens.HomeCollection
import com.universalmedialibrary.ui.plex.screens.PlexHomeState
import com.universalmedialibrary.ui.plex.theme.PlexColors
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
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
 * Note: This is a simplified implementation. Full integration with repositories
 * will be added when the complete data layer is finalized.
 */
@HiltViewModel
class PlexHomeViewModel @Inject constructor() : ViewModel() {
    
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
            delay(500) // Simulate refresh
            _isRefreshing.value = false
        }
    }
    
    private fun loadHomeData() {
        viewModelScope.launch {
            // Simulate loading with placeholder data
            delay(300)
            
            _uiState.update {
                PlexHomeState(
                    isLoading = false,
                    featuredItems = generateSampleFeaturedItems(),
                    continueItems = generateSampleContinueItems(),
                    recentBooks = generateSampleBooks(),
                    recentMusic = generateSampleMusic(),
                    recentPodcasts = generateSamplePodcasts(),
                    recentVideos = generateSampleVideos(),
                    recentAudiobooks = generateSampleAudiobooks(),
                    recentComics = generateSampleComics(),
                    recentFanfiction = generateSampleFanfiction(),
                    libraryStats = generateSampleStats(),
                    collections = generateSampleCollections()
                )
            }
        }
    }
    
    private fun generateSampleFeaturedItems(): List<PlexMediaItem> {
        return listOf(
            createSampleItem("featured_1", "Welcome to Clever Ferret", PlexMediaType.BOOK),
            createSampleItem("featured_2", "Getting Started Guide", PlexMediaType.AUDIOBOOK),
            createSampleItem("featured_3", "Sample Podcast", PlexMediaType.PODCAST)
        )
    }
    
    private fun generateSampleContinueItems(): List<PlexMediaItem> {
        return listOf(
            createSampleItem("continue_1", "Currently Reading", PlexMediaType.BOOK, progress = 0.45f),
            createSampleItem("continue_2", "Now Listening", PlexMediaType.AUDIOBOOK, progress = 0.72f)
        )
    }
    
    private fun generateSampleBooks(): List<PlexMediaItem> {
        return (1..5).map {
            createSampleItem("book_$it", "Sample Book $it", PlexMediaType.BOOK)
        }
    }
    
    private fun generateSampleMusic(): List<PlexMediaItem> {
        return (1..5).map {
            createSampleItem("music_$it", "Sample Album $it", PlexMediaType.MUSIC)
        }
    }
    
    private fun generateSamplePodcasts(): List<PlexMediaItem> {
        return (1..5).map {
            createSampleItem("podcast_$it", "Sample Podcast $it", PlexMediaType.PODCAST)
        }
    }
    
    private fun generateSampleVideos(): List<PlexMediaItem> {
        return (1..5).map {
            createSampleItem("video_$it", "Sample Video $it", PlexMediaType.MOVIE)
        }
    }
    
    private fun generateSampleAudiobooks(): List<PlexMediaItem> {
        return (1..5).map {
            createSampleItem("audiobook_$it", "Sample Audiobook $it", PlexMediaType.AUDIOBOOK)
        }
    }
    
    private fun generateSampleComics(): List<PlexMediaItem> {
        return (1..5).map {
            createSampleItem("comic_$it", "Sample Comic $it", PlexMediaType.COMIC)
        }
    }
    
    private fun generateSampleFanfiction(): List<PlexMediaItem> {
        return (1..5).map {
            createSampleItem("fanfic_$it", "Sample Fanfiction $it", PlexMediaType.FANFICTION)
        }
    }
    
    private fun generateSampleStats(): HomeLibraryStats {
        return HomeLibraryStats(
            totalBooks = 0,
            totalAudiobooks = 0,
            totalMusic = 0,
            totalPodcasts = 0,
            totalComics = 0
        )
    }
    
    private fun generateSampleCollections(): List<HomeCollection> {
        return listOf(
            HomeCollection(
                id = "col_1",
                name = "Favorites",
                itemCount = 0,
                icon = Icons.Default.Favorite,
                color = PlexColors.AccentPrimary
            ),
            HomeCollection(
                id = "col_2",
                name = "To Read",
                itemCount = 0,
                icon = Icons.Default.BookmarkAdd,
                color = PlexColors.Success
            ),
            HomeCollection(
                id = "col_3",
                name = "Recently Finished",
                itemCount = 0,
                icon = Icons.Default.CheckCircle,
                color = PlexColors.Info
            )
        )
    }
    
    private fun createSampleItem(
        id: String,
        title: String,
        mediaType: PlexMediaType,
        progress: Float = 0f
    ): PlexMediaItem {
        return PlexMediaItem(
            id = id,
            title = title,
            subtitle = "Sample ${mediaType.name.lowercase().replace("_", " ")}",
            imageUrl = null,
            mediaType = mediaType,
            progress = progress,
            rating = null,
            year = null,
            duration = null,
            badges = emptyList()
        )
    }
}
