package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.plex.player.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex-style Audio Player
 * 
 * Handles playback for:
 * - Music tracks
 * - Audiobooks
 * - Podcasts
 * 
 * Note: This is a simplified implementation with placeholder playback.
 * Full service integration will be added when the media playback
 * services are finalized.
 */
@HiltViewModel
class PlexAudioPlayerViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle
) : ViewModel() {
    
    private val playerType: PlayerType = when (savedStateHandle.get<String>("playerType")) {
        "audiobook" -> PlayerType.AUDIOBOOK
        "podcast" -> PlayerType.PODCAST
        else -> PlayerType.MUSIC
    }
    
    private val _uiState = MutableStateFlow(AudioPlayerState(
        title = "Sample Track",
        artist = "Sample Artist",
        albumTitle = "Sample Album",
        artworkUrl = null,
        currentPosition = 0L,
        duration = 180000L, // 3 minutes
        isPlaying = false,
        playerType = playerType
    ))
    val uiState: StateFlow<AudioPlayerState> = _uiState.asStateFlow()
    
    private var isSimulatingPlayback = false
    
    fun playPause() {
        val newIsPlaying = !_uiState.value.isPlaying
        _uiState.update { it.copy(isPlaying = newIsPlaying) }
        
        if (newIsPlaying && !isSimulatingPlayback) {
            simulatePlayback()
        }
    }
    
    private fun simulatePlayback() {
        isSimulatingPlayback = true
        viewModelScope.launch {
            while (_uiState.value.isPlaying && _uiState.value.currentPosition < _uiState.value.duration) {
                delay(1000)
                if (_uiState.value.isPlaying) {
                    _uiState.update { 
                        it.copy(currentPosition = (it.currentPosition + 1000).coerceAtMost(it.duration))
                    }
                }
            }
            isSimulatingPlayback = false
        }
    }
    
    fun seek(position: Float) {
        val newPosition = (position * _uiState.value.duration).toLong()
        _uiState.update { it.copy(currentPosition = newPosition) }
    }
    
    fun skipPrevious() {
        _uiState.update { it.copy(currentPosition = 0L) }
    }
    
    fun skipNext() {
        // In a real implementation, this would load the next track
        _uiState.update { it.copy(currentPosition = 0L) }
    }
    
    fun rewind() {
        val amount = when (playerType) {
            PlayerType.AUDIOBOOK, PlayerType.PODCAST -> 30000L
            else -> 10000L
        }
        _uiState.update { 
            it.copy(currentPosition = (it.currentPosition - amount).coerceAtLeast(0L))
        }
    }
    
    fun fastForward() {
        val amount = when (playerType) {
            PlayerType.AUDIOBOOK, PlayerType.PODCAST -> 30000L
            else -> 10000L
        }
        _uiState.update { 
            it.copy(currentPosition = (it.currentPosition + amount).coerceAtMost(it.duration))
        }
    }
    
    fun setPlaybackSpeed(speed: Float) {
        _uiState.update { it.copy(playbackSpeed = speed) }
    }
    
    fun toggleShuffle() {
        _uiState.update { it.copy(isShuffleEnabled = !it.isShuffleEnabled) }
    }
    
    fun toggleRepeat() {
        val nextMode = when (_uiState.value.repeatMode) {
            RepeatMode.OFF -> RepeatMode.ALL
            RepeatMode.ALL -> RepeatMode.ONE
            RepeatMode.ONE -> RepeatMode.OFF
        }
        _uiState.update { it.copy(repeatMode = nextMode) }
    }
    
    fun setSleepTimer(minutes: Int) {
        _uiState.update { 
            it.copy(
                sleepTimerActive = true,
                sleepTimerRemaining = minutes.toLong() * 60 * 1000
            )
        }
    }
    
    fun cancelSleepTimer() {
        _uiState.update { 
            it.copy(sleepTimerActive = false, sleepTimerRemaining = null)
        }
    }
    
    fun playQueueItem(index: Int) {
        // Placeholder - would play item at index in queue
    }
    
    fun removeFromQueue(index: Int) {
        _uiState.update { state ->
            state.copy(queue = state.queue.filterIndexed { i, _ -> i != index })
        }
    }
}

/**
 * ViewModel for Plex-style Video Player
 * 
 * Note: This is a simplified implementation with placeholder playback.
 * Full service integration will be added when the video playback
 * services are finalized.
 */
@HiltViewModel
class PlexVideoPlayerViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle
) : ViewModel() {
    
    private val videoId: String = savedStateHandle.get<String>("videoId") ?: ""
    
    private val _uiState = MutableStateFlow(VideoPlayerState(
        title = "Sample Video",
        currentPosition = 0L,
        duration = 7200000L, // 2 hours
        bufferedPosition = 0L,
        isPlaying = false
    ))
    val uiState: StateFlow<VideoPlayerState> = _uiState.asStateFlow()
    
    private var isSimulatingPlayback = false
    
    init {
        loadVideo()
    }
    
    private fun loadVideo() {
        // Load placeholder video data
        _uiState.update {
            it.copy(
                title = "Sample Movie",
                subtitle = null,
                duration = 7200000L,
                availableQualities = listOf(
                    VideoQuality.AUTO,
                    VideoQuality.SD,
                    VideoQuality.HD,
                    VideoQuality.FULL_HD
                ),
                currentQuality = VideoQuality.AUTO
            )
        }
    }
    
    fun playPause() {
        val newIsPlaying = !_uiState.value.isPlaying
        _uiState.update { it.copy(isPlaying = newIsPlaying) }
        
        if (newIsPlaying && !isSimulatingPlayback) {
            simulatePlayback()
        }
    }
    
    private fun simulatePlayback() {
        isSimulatingPlayback = true
        viewModelScope.launch {
            while (_uiState.value.isPlaying && _uiState.value.currentPosition < _uiState.value.duration) {
                delay(1000)
                if (_uiState.value.isPlaying) {
                    _uiState.update { 
                        it.copy(
                            currentPosition = (it.currentPosition + 1000).coerceAtMost(it.duration),
                            bufferedPosition = (it.currentPosition + 30000).coerceAtMost(it.duration)
                        )
                    }
                }
            }
            isSimulatingPlayback = false
        }
    }
    
    fun seek(position: Long) {
        _uiState.update { it.copy(currentPosition = position.coerceIn(0L, it.duration)) }
    }
    
    fun seekRelative(offset: Long) {
        val newPosition = (_uiState.value.currentPosition + offset).coerceIn(0L, _uiState.value.duration)
        seek(newPosition)
    }
    
    fun skipPrevious() {
        val episodes = _uiState.value.episodes
        val currentIndex = episodes.indexOfFirst { it.id == _uiState.value.currentEpisodeId }
        if (currentIndex > 0) {
            playEpisode(episodes[currentIndex - 1])
        }
    }
    
    fun skipNext() {
        val episodes = _uiState.value.episodes
        val currentIndex = episodes.indexOfFirst { it.id == _uiState.value.currentEpisodeId }
        if (currentIndex < episodes.size - 1) {
            playEpisode(episodes[currentIndex + 1])
        }
    }
    
    fun skipIntro() {
        // Skip to after intro (placeholder: skip 90 seconds)
        seek(_uiState.value.currentPosition + 90000)
        _uiState.update { it.copy(showSkipIntro = false) }
    }
    
    fun setSubtitle(track: SubtitleTrack?) {
        _uiState.update { it.copy(currentSubtitle = track) }
    }
    
    fun setAudioTrack(track: AudioTrack) {
        _uiState.update { it.copy(currentAudioTrack = track) }
    }
    
    fun setQuality(quality: VideoQuality) {
        _uiState.update { it.copy(currentQuality = quality) }
    }
    
    fun playEpisode(episode: EpisodeInfo) {
        _uiState.update { 
            it.copy(
                title = episode.title,
                currentEpisodeId = episode.id,
                currentPosition = 0L
            )
        }
    }
}
