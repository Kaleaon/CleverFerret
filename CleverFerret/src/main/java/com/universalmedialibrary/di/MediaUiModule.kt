package com.universalmedialibrary.di

import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.video.ComprehensiveVideoService
import com.universalmedialibrary.ui.media.MiniPlayerState
import com.universalmedialibrary.ui.media.PlaybackStateManager
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Singleton

/**
 * Hilt DI Module for Media UI Layer
 * 
 * Provides dependencies for:
 * - Playback state management
 * - UI-specific services
 * - ViewModelScope management
 */
@Module
@InstallIn(SingletonComponent::class)
object MediaUiModule {
    
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
 * to provide a unified mini player experience.
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
        // Observe music player state
        scope.launch {
            combine(
                musicPlayerService.currentTrack,
                musicPlayerService.playbackState
            ) { track, state ->
                if (track != null && state.isPlaying) {
                    MiniPlayerState(
                        title = track.title,
                        artist = track.artist,
                        albumArtUrl = track.albumArtUrl,
                        isPlaying = state.isPlaying,
                        progress = if (track.duration > 0) state.currentPositionMs.toFloat() / track.duration else 0f,
                        duration = track.duration,
                        currentPosition = state.currentPositionMs,
                        playerType = "music"
                    )
                } else null
            }.collect { state ->
                if (state != null || activePlayerType == "music") {
                    _currentPlayback.value = state
                    activePlayerType = state?.playerType
                }
            }
        }
        
        // Observe audiobook player state
        scope.launch {
            audiobookService.playbackState.collect { state ->
                if (state.isPlaying || activePlayerType == "audiobook") {
                    val miniState = if (state.isPlaying) {
                        MiniPlayerState(
                            title = state.chapterTitle ?: "Audiobook",
                            artist = state.bookTitle,
                            albumArtUrl = state.coverUrl,
                            isPlaying = state.isPlaying,
                            progress = state.progress,
                            duration = state.duration,
                            currentPosition = state.currentPosition,
                            playerType = "audiobook"
                        )
                    } else null
                    
                    if (miniState != null || activePlayerType == "audiobook") {
                        _currentPlayback.value = miniState
                        activePlayerType = miniState?.playerType
                    }
                }
            }
        }
        
        // Observe podcast player state
        scope.launch {
            podcastService.playbackState.collect { state ->
                if (state.isPlaying || activePlayerType == "podcast") {
                    val miniState = if (state.isPlaying) {
                        MiniPlayerState(
                            title = state.episodeTitle ?: "Podcast",
                            artist = state.podcastTitle,
                            albumArtUrl = state.artworkUrl,
                            isPlaying = state.isPlaying,
                            progress = if (state.duration > 0) state.currentPosition.toFloat() / state.duration else 0f,
                            duration = state.duration,
                            currentPosition = state.currentPosition,
                            playerType = "podcast"
                        )
                    } else null
                    
                    if (miniState != null || activePlayerType == "podcast") {
                        _currentPlayback.value = miniState
                        activePlayerType = miniState?.playerType
                    }
                }
            }
        }
    }
    
    override fun playPause() {
        when (activePlayerType) {
            "music" -> musicPlayerService.togglePlayPause()
            "audiobook" -> audiobookService.togglePlayPause()
            "podcast" -> podcastService.togglePlayPause()
        }
    }
    
    override fun skipNext() {
        when (activePlayerType) {
            "music" -> musicPlayerService.skipNext()
            "audiobook" -> audiobookService.skipNext()
            "podcast" -> podcastService.skipNext()
        }
    }
    
    override fun skipPrevious() {
        when (activePlayerType) {
            "music" -> musicPlayerService.skipPrevious()
            "audiobook" -> audiobookService.skipPrevious()
            "podcast" -> podcastService.skipPrevious()
        }
    }
    
    /**
     * Update the current playback state
     * Called by services when their playback state changes
     */
    fun updatePlaybackState(state: MiniPlayerState?) {
        _currentPlayback.value = state
        activePlayerType = state?.playerType
    }
}

/**
 * Module for Repository dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
object MediaRepositoryModule {
    
    // Note: Actual repository implementations would be provided by existing modules
    // This module ensures the Media UI layer has access to all needed repositories
    
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
