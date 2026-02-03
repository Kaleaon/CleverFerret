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
 * 
 * Note: This is a simplified stub implementation. The full implementation
 * would observe each service's playback state and aggregate them.
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
        observeMusic()
        observeAudiobook()
    }
    
    override fun playPause() {
        // Delegate to the active player service
        // Implementation depends on which service is currently active
        when (activePlayerType) {
            PLAYER_MUSIC -> {
                if (musicPlayerService.playbackState.value.isPlaying) {
                    musicPlayerService.pause()
                } else {
                    musicPlayerService.play()
                }
            }
            PLAYER_AUDIOBOOK -> {
                if (audiobookService.audiobookState.value.isPlaying) {
                    audiobookService.pause()
                } else {
                    audiobookService.play()
                }
            }
        }
    }
    
    override fun skipNext() {
        // Delegate to the active player service
        if (activePlayerType == PLAYER_MUSIC) {
            musicPlayerService.skipNext()
        }
    }
    
    override fun skipPrevious() {
        // Delegate to the active player service
        if (activePlayerType == PLAYER_MUSIC) {
            musicPlayerService.skipPrevious()
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

    private fun observeMusic() {
        scope.launch {
            combine(
                musicPlayerService.currentTrack,
                musicPlayerService.playbackState
            ) { track, playback ->
                if (track == null) return@combine null
                MiniPlayerState(
                    title = track.title,
                    subtitle = track.artist ?: track.album ?: "",
                    artworkUrl = track.albumArtUrl,
                    progress = if (track.duration > 0) {
                        playback.currentPositionMs.toFloat() / track.duration
                    } else 0f,
                    isPlaying = playback.isPlaying,
                    playerType = PLAYER_MUSIC
                ) to playback.isPlaying
            }.collect { result ->
                result?.let { (state, isPlaying) ->
                    _currentPlayback.value = state
                    if (isPlaying) {
                        activePlayerType = PLAYER_MUSIC
                    }
                }
            }
        }
    }

    private fun observeAudiobook() {
        scope.launch {
            audiobookService.audiobookState.collect { state ->
                val book = state.audiobook ?: return@collect
                val duration = state.duration.takeIf { it > 0 } ?: state.totalDuration
                val progress = if (duration > 0) {
                    state.currentPosition.toFloat() / duration
                } else 0f
                val miniState = MiniPlayerState(
                    title = state.title.ifBlank { book.title },
                    subtitle = state.author.ifBlank { book.author ?: "" },
                    artworkUrl = book.coverPath,
                    progress = progress.coerceIn(0f, 1f),
                    isPlaying = state.isPlaying,
                    playerType = PLAYER_AUDIOBOOK
                )
                _currentPlayback.value = miniState
                if (state.isPlaying) {
                    activePlayerType = PLAYER_AUDIOBOOK
                }
            }
        }
    }

    private companion object {
        const val PLAYER_MUSIC = "music"
        const val PLAYER_AUDIOBOOK = "audiobook"
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
