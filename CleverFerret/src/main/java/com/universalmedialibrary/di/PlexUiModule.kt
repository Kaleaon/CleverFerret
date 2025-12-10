package com.universalmedialibrary.di

import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.video.ComprehensiveVideoService
import com.universalmedialibrary.ui.plex.MiniPlayerState
import com.universalmedialibrary.ui.plex.PlaybackStateManager
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.*
import javax.inject.Singleton

/**
 * Hilt DI Module for Plex UI Layer
 * 
 * Provides dependencies for:
 * - Playback state management
 * - UI-specific services
 * - ViewModelScope management
 */
@Module
@InstallIn(SingletonComponent::class)
object PlexUiModule {
    
    @Provides
    @Singleton
    fun provideApplicationScope(): CoroutineScope =
        CoroutineScope(SupervisorJob() + Dispatchers.Main)
    
    @Provides
    @Singleton
    fun providePlaybackStateManager(
        musicPlayerService: AdvancedMusicPlayerService,
        audiobookService: AudiobookService,
        podcastService: PodcastService,
        applicationScope: CoroutineScope
    ): PlaybackStateManager = PlaybackStateManagerImpl(
        musicPlayerService = musicPlayerService,
        audiobookService = audiobookService,
        podcastService = podcastService,
        scope = applicationScope
    )
}

/**
 * Implementation of PlaybackStateManager
 * 
 * Aggregates playback state from all audio services
 * to provide a unified mini player experience
 */
class PlaybackStateManagerImpl(
    private val musicPlayerService: AdvancedMusicPlayerService,
    private val audiobookService: AudiobookService,
    private val podcastService: PodcastService,
    private val scope: CoroutineScope
) : PlaybackStateManager {
    
    private val _currentPlayback = MutableStateFlow<MiniPlayerState?>(null)
    override val currentPlayback: StateFlow<MiniPlayerState?> = _currentPlayback.asStateFlow()
    
    private var activePlayerType: String? = null
    
    init {
        // Observe music playback
        scope.launchIn(musicPlayerService.currentTrack.combine(
            musicPlayerService.isPlaying
        ) { track, isPlaying ->
            if (track != null && isPlaying) {
                activePlayerType = "music"
                _currentPlayback.value = MiniPlayerState(
                    title = track.title,
                    subtitle = track.artist,
                    artworkUrl = track.artworkPath,
                    progress = musicPlayerService.progress.value,
                    isPlaying = true,
                    playerType = "music"
                )
            } else if (activePlayerType == "music" && !isPlaying) {
                // Keep showing but mark as paused
                _currentPlayback.update { it?.copy(isPlaying = false) }
            }
        })
        
        // Observe audiobook playback
        scope.launchIn(audiobookService.currentAudiobook.combine(
            audiobookService.isPlaying
        ) { audiobook, isPlaying ->
            if (audiobook != null && isPlaying) {
                activePlayerType = "audiobook"
                _currentPlayback.value = MiniPlayerState(
                    title = audiobookService.currentChapter.value?.title ?: audiobook.title,
                    subtitle = audiobook.author,
                    artworkUrl = audiobook.coverPath,
                    progress = audiobookService.progress.value,
                    isPlaying = true,
                    playerType = "audiobook"
                )
            } else if (activePlayerType == "audiobook" && !isPlaying) {
                _currentPlayback.update { it?.copy(isPlaying = false) }
            }
        })
        
        // Observe podcast playback
        scope.launchIn(podcastService.currentEpisode.combine(
            podcastService.isPlaying
        ) { episode, isPlaying ->
            if (episode != null && isPlaying) {
                activePlayerType = "podcast"
                _currentPlayback.value = MiniPlayerState(
                    title = episode.title,
                    subtitle = episode.showTitle,
                    artworkUrl = episode.showArtworkUrl,
                    progress = podcastService.progress.value,
                    isPlaying = true,
                    playerType = "podcast"
                )
            } else if (activePlayerType == "podcast" && !isPlaying) {
                _currentPlayback.update { it?.copy(isPlaying = false) }
            }
        })
        
        // Update progress periodically
        scope.launchIn(
            kotlinx.coroutines.flow.flow {
                while (true) {
                    kotlinx.coroutines.delay(1000)
                    emit(Unit)
                }
            }.collect {
                val progress = when (activePlayerType) {
                    "music" -> musicPlayerService.progress.value
                    "audiobook" -> audiobookService.progress.value
                    "podcast" -> podcastService.progress.value
                    else -> 0f
                }
                _currentPlayback.update { it?.copy(progress = progress) }
            }
        )
    }
    
    override fun playPause() {
        when (activePlayerType) {
            "music" -> musicPlayerService.playPause()
            "audiobook" -> audiobookService.playPause()
            "podcast" -> podcastService.playPause()
        }
    }
    
    override fun skipNext() {
        when (activePlayerType) {
            "music" -> musicPlayerService.skipToNext()
            "audiobook" -> audiobookService.skipToNextChapter()
            "podcast" -> { /* Podcasts don't typically skip to next */ }
        }
    }
    
    override fun skipPrevious() {
        when (activePlayerType) {
            "music" -> musicPlayerService.skipToPrevious()
            "audiobook" -> audiobookService.skipToPreviousChapter()
            "podcast" -> { /* Podcasts don't typically skip to previous */ }
        }
    }
    
    private fun <T> CoroutineScope.launchIn(flow: Flow<T>): kotlinx.coroutines.Job {
        return kotlinx.coroutines.launch {
            flow.collect()
        }
    }
}

/**
 * Module for Repository dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
object PlexRepositoryModule {
    
    // Note: Actual repository implementations would be provided by existing modules
    // This module ensures the Plex UI layer has access to all needed repositories
    
    @Provides
    @Singleton
    fun provideSearchHistoryRepository(
        // dependencies
    ): SearchHistoryRepository {
        return SearchHistoryRepositoryImpl()
    }
}

/**
 * Search history repository for tracking recent searches
 */
interface SearchHistoryRepository {
    fun getRecentSearches(limit: Int): Flow<List<String>>
    suspend fun addSearch(query: String)
    suspend fun clearHistory()
}

class SearchHistoryRepositoryImpl : SearchHistoryRepository {
    private val recentSearches = MutableStateFlow<List<String>>(emptyList())
    
    override fun getRecentSearches(limit: Int): Flow<List<String>> =
        recentSearches.map { it.take(limit) }
    
    override suspend fun addSearch(query: String) {
        val current = recentSearches.value.toMutableList()
        current.remove(query) // Remove if exists
        current.add(0, query) // Add to front
        recentSearches.value = current.take(20) // Keep last 20
    }
    
    override suspend fun clearHistory() {
        recentSearches.value = emptyList()
    }
}
