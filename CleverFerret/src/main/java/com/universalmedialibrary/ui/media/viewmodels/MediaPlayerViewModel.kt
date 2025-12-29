package com.universalmedialibrary.ui.media.viewmodels

import android.content.Context
import android.util.Log
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.AudiobookRepository
import com.universalmedialibrary.data.repository.MusicRepository
import com.universalmedialibrary.data.repository.VideoRepository
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.PlaylistMode
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.media.SleepTimerManager
import com.universalmedialibrary.ui.media.player.*
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

private const val TAG = "MediaPlayerViewModel"

/**
 * ViewModel for Media-centric Audio Player
 * 
 * Handles playback for:
 * - Music tracks
 * - Audiobooks
 * - Podcasts
 * 
 * Properly integrated with actual playback services.
 */
@HiltViewModel
class AudioPlayerViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle,
    @ApplicationContext private val context: Context,
    private val musicPlayerService: AdvancedMusicPlayerService,
    private val exoPlayerService: ExoPlayerService,
    private val sleepTimerManager: SleepTimerManager,
    private val musicRepository: MusicRepository,
    private val audiobookRepository: AudiobookRepository,
    private val podcastRepository: PodcastRepository
) : ViewModel() {
    
    private val playerType: PlayerType = when (savedStateHandle.get<String>("playerType")) {
        "audiobook" -> PlayerType.AUDIOBOOK
        "podcast" -> PlayerType.PODCAST
        else -> PlayerType.MUSIC
    }
    
    // Map from actual service state to UI state
    private val _uiState = MutableStateFlow(AudioPlayerState(
        title = "",
        artist = null,
        albumTitle = null,
        artworkUrl = null,
        currentPosition = 0L,
        duration = 0L,
        isPlaying = false,
        playerType = playerType
    ))
    val uiState: StateFlow<AudioPlayerState> = _uiState.asStateFlow()
    
    init {
        // Observe actual playback state from service
        viewModelScope.launch {
            musicPlayerService.currentTrack.collect { track ->
                if (track != null) {
                    _uiState.update { 
                        it.copy(
                            title = track.title,
                            artist = track.artist,
                            albumTitle = track.album,
                            artworkUrl = track.albumArtUrl,
                            duration = track.duration
                        )
                    }
                }
            }
        }
        
        viewModelScope.launch {
            musicPlayerService.playbackState.collect { state ->
                _uiState.update { 
                    it.copy(
                        isPlaying = state.isPlaying,
                        currentPosition = state.currentPositionMs,
                        isShuffleEnabled = state.isShuffling,
                        repeatMode = when {
                            state.repeatMode == 1 -> RepeatMode.ONE
                            state.repeatMode == 2 -> RepeatMode.ALL
                            else -> RepeatMode.OFF
                        }
                    )
                }
            }
        }
        
        // Use combine to react to both queue AND currentTrack changes
        // This ensures isCurrentItem stays accurate when the track changes
        viewModelScope.launch {
            combine(
                musicPlayerService.queue,
                musicPlayerService.currentTrack
            ) { queueTracks, currentTrack ->
                queueTracks.map { track ->
                    QueueItem(
                        id = track.id,
                        title = track.title,
                        artist = track.artist,
                        artworkUrl = track.albumArtUrl,
                        duration = track.duration,
                        isCurrentItem = track.id == currentTrack?.id
                    )
                }
            }.collect { queueItems ->
                _uiState.update { it.copy(queue = queueItems) }
            }
        }
        
        // Observe sleep timer
        viewModelScope.launch {
            sleepTimerManager.state.collect { timerState ->
                _uiState.update { 
                    it.copy(
                        sleepTimerActive = timerState.isActive,
                        sleepTimerRemaining = timerState.remainingMs
                    )
                }
            }
        }
    }
    
    fun playPause() {
        musicPlayerService.togglePlayPause()
    }
    
    fun seek(position: Float) {
        val newPosition = (position * _uiState.value.duration).toLong()
        musicPlayerService.seekTo(newPosition)
    }
    
    fun skipPrevious() {
        musicPlayerService.skipPrevious()
    }
    
    fun skipNext() {
        musicPlayerService.skipNext()
    }
    
    fun rewind() {
        val amount = when (playerType) {
            PlayerType.AUDIOBOOK, PlayerType.PODCAST -> 30000L
            else -> 10000L
        }
        val currentPos = musicPlayerService.getCurrentPosition()
        musicPlayerService.seekTo((currentPos - amount).coerceAtLeast(0L))
    }
    
    fun fastForward() {
        val amount = when (playerType) {
            PlayerType.AUDIOBOOK, PlayerType.PODCAST -> 30000L
            else -> 10000L
        }
        val currentPos = musicPlayerService.getCurrentPosition()
        val duration = _uiState.value.duration
        musicPlayerService.seekTo((currentPos + amount).coerceAtMost(duration))
    }
    
    fun setPlaybackSpeed(speed: Float) {
        // Route through musicPlayerService for consistency with other playback controls
        musicPlayerService.setPlaybackSpeed(speed)
        _uiState.update { it.copy(playbackSpeed = speed) }
    }
    
    fun toggleShuffle() {
        musicPlayerService.toggleShuffle()
    }
    
    fun toggleRepeat() {
        musicPlayerService.toggleRepeat()
    }
    
    fun setSleepTimer(minutes: Int) {
        sleepTimerManager.startTimer(
            durationMinutes = minutes,
            fadeOut = true,
            onComplete = { musicPlayerService.pause() }
        )
    }
    
    fun cancelSleepTimer() {
        sleepTimerManager.stopTimer()
    }
    
    fun playQueueItem(index: Int) {
        musicPlayerService.skipToQueuePosition(index)
    }
    
    fun removeFromQueue(index: Int) {
        val queueItem = _uiState.value.queue.getOrNull(index) ?: return
        musicPlayerService.removeFromQueue(queueItem.id)
    }
}

/**
 * ViewModel for Media-centric Video Player
 * 
 * Properly integrated with video repository and playback.
 */
@HiltViewModel
class VideoPlayerViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle,
    @ApplicationContext private val context: Context,
    private val videoRepository: VideoRepository,
    private val exoPlayerService: ExoPlayerService
) : ViewModel() {
    
    private val videoId: String = savedStateHandle.get<String>("videoId") ?: ""
    
    private val _uiState = MutableStateFlow(VideoPlayerState(
        title = "Loading...",
        currentPosition = 0L,
        duration = 0L,
        bufferedPosition = 0L,
        isPlaying = false
    ))
    val uiState: StateFlow<VideoPlayerState> = _uiState.asStateFlow()
    
    init {
        loadVideo()
    }
    
    private fun loadVideo() {
        viewModelScope.launch {
            try {
                val videoIdLong = videoId.toLongOrNull()
                if (videoIdLong == null) {
                    Log.w(TAG, "Invalid video ID: $videoId")
                    _uiState.update { it.copy(title = "Invalid video ID") }
                    return@launch
                }
                
                // Use direct ID lookup instead of loading all videos
                val video = videoRepository.getVideoById(videoIdLong)
                
                if (video == null) {
                    Log.w(TAG, "Video not found for ID: $videoIdLong")
                    _uiState.update { it.copy(title = "Video not found") }
                    return@launch
                }
                
                _uiState.update {
                    it.copy(
                        title = video.title,
                        subtitle = video.creator,
                        duration = video.duration ?: 0L,
                        availableQualities = listOf(
                            VideoQuality.AUTO,
                            VideoQuality.SD,
                            VideoQuality.HD,
                            VideoQuality.FULL_HD
                        ),
                        currentQuality = VideoQuality.AUTO
                    )
                }
                
                // Start playback using loadMedia
                video.filePath?.let { path ->
                    exoPlayerService.loadMediaWithSession(
                        mediaPath = path,
                        title = video.title,
                        artist = video.creator
                    )
                    exoPlayerService.play()
                } ?: run {
                    Log.w(TAG, "Video has no file path: ${video.title}")
                    _uiState.update { it.copy(title = "Video file not available") }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error loading video", e)
                _uiState.update { it.copy(title = "Error loading video: ${e.message}") }
            }
        }
        
        // Observe playback state from ExoPlayerService
        viewModelScope.launch {
            exoPlayerService.playerState.collect { state ->
                _uiState.update { 
                    it.copy(
                        isPlaying = state.isPlaying,
                        currentPosition = state.currentPosition,
                        bufferedPosition = state.currentPosition // ExoPlayer state doesn't expose buffered separately here
                    )
                }
            }
        }
    }
    
    fun playPause() {
        if (_uiState.value.isPlaying) {
            exoPlayerService.pause()
        } else {
            exoPlayerService.play()
        }
    }
    
    fun seek(position: Long) {
        exoPlayerService.seekTo(position.coerceIn(0L, _uiState.value.duration))
    }
    
    fun seekRelative(offset: Long) {
        val newPosition = (_uiState.value.currentPosition + offset).coerceIn(0L, _uiState.value.duration)
        seek(newPosition)
    }
    
    fun skipPrevious() {
        val episodes = _uiState.value.episodes
        if (episodes.isEmpty()) return
        
        val currentIndex = episodes.indexOfFirst { it.id == _uiState.value.currentEpisodeId }
        if (currentIndex > 0) {
            playEpisode(episodes[currentIndex - 1])
        }
    }
    
    fun skipNext() {
        val episodes = _uiState.value.episodes
        if (episodes.isEmpty()) return
        
        val currentIndex = episodes.indexOfFirst { it.id == _uiState.value.currentEpisodeId }
        if (currentIndex < episodes.size - 1) {
            playEpisode(episodes[currentIndex + 1])
        }
    }
    
    fun skipIntro() {
        seek(_uiState.value.currentPosition + 90000)
        _uiState.update { it.copy(showSkipIntro = false) }
    }
    
    fun setSubtitle(track: SubtitleTrack?) {
        // TODO: Wire to ExoPlayerService when subtitle support is implemented
        _uiState.update { it.copy(currentSubtitle = track) }
    }
    
    fun setAudioTrack(track: AudioTrack) {
        // TODO: Wire to ExoPlayerService when audio track selection is implemented
        _uiState.update { it.copy(currentAudioTrack = track) }
    }
    
    fun setQuality(quality: VideoQuality) {
        // TODO: Wire to ExoPlayerService when quality selection is implemented
        _uiState.update { it.copy(currentQuality = quality) }
    }
    
    fun playEpisode(episode: EpisodeInfo) {
        // Update UI state to reflect the new episode
        _uiState.update { 
            it.copy(
                title = episode.title,
                currentEpisodeId = episode.id,
                currentPosition = 0L
            )
        }
        
        // Note: Episode playback would typically need to look up the episode's
        // media file from a repository. For now, we update the UI state.
        // TODO: Load actual episode media file when episode data includes file path
    }
    
    override fun onCleared() {
        super.onCleared()
        exoPlayerService.release()
    }
}
