package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.video.ComprehensiveVideoService
import com.universalmedialibrary.ui.plex.player.*
import dagger.hilt.android.lifecycle.HiltViewModel
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
 */
@HiltViewModel
class PlexAudioPlayerViewModel @Inject constructor(
    private val savedStateHandle: SavedStateHandle,
    private val musicPlayerService: AdvancedMusicPlayerService,
    private val audiobookService: AudiobookService,
    private val podcastService: PodcastService,
    private val musicRepository: MusicRepository,
    private val audiobookRepository: AudiobookRepository,
    private val podcastRepository: PodcastRepository,
    private val settingsRepository: SettingsRepository
) : ViewModel() {
    
    private val playerType: PlayerType = when (savedStateHandle.get<String>("playerType")) {
        "audiobook" -> PlayerType.AUDIOBOOK
        "podcast" -> PlayerType.PODCAST
        else -> PlayerType.MUSIC
    }
    
    private val _uiState = MutableStateFlow(AudioPlayerState(
        title = "",
        artist = "",
        albumTitle = null,
        artworkUrl = null,
        currentPosition = 0L,
        duration = 0L,
        isPlaying = false,
        playerType = playerType
    ))
    val uiState: StateFlow<AudioPlayerState> = _uiState.asStateFlow()
    
    init {
        observePlayback()
    }
    
    private fun observePlayback() {
        when (playerType) {
            PlayerType.MUSIC -> observeMusicPlayback()
            PlayerType.AUDIOBOOK -> observeAudiobookPlayback()
            PlayerType.PODCAST -> observePodcastPlayback()
        }
    }
    
    private fun observeMusicPlayback() {
        viewModelScope.launch {
            combine(
                musicPlayerService.currentTrack,
                musicPlayerService.position,
                musicPlayerService.isPlaying,
                musicPlayerService.queue,
                musicPlayerService.shuffleEnabled,
                musicPlayerService.repeatMode
            ) { track, position, isPlaying, queue, shuffle, repeat ->
                if (track != null) {
                    AudioPlayerState(
                        title = track.title,
                        artist = track.artist,
                        albumTitle = track.album,
                        artworkUrl = track.artworkPath,
                        currentPosition = position,
                        duration = track.duration,
                        isPlaying = isPlaying,
                        playerType = PlayerType.MUSIC,
                        playbackSpeed = 1.0f,
                        isShuffleEnabled = shuffle,
                        repeatMode = when (repeat) {
                            0 -> RepeatMode.OFF
                            1 -> RepeatMode.ALL
                            2 -> RepeatMode.ONE
                            else -> RepeatMode.OFF
                        },
                        queue = queue.map { queueItem ->
                            QueueItem(
                                id = queueItem.id.toString(),
                                title = queueItem.title,
                                artist = queueItem.artist,
                                artworkUrl = queueItem.artworkPath,
                                duration = queueItem.duration
                            )
                        },
                        currentQueueIndex = musicPlayerService.currentQueueIndex.value
                    )
                } else {
                    _uiState.value
                }
            }.collect { state ->
                _uiState.value = state
            }
        }
    }
    
    private fun observeAudiobookPlayback() {
        viewModelScope.launch {
            combine(
                audiobookService.currentAudiobook,
                audiobookService.currentChapter,
                audiobookService.position,
                audiobookService.isPlaying,
                audiobookService.playbackSpeed,
                audiobookService.sleepTimerRemaining
            ) { audiobook, chapter, position, isPlaying, speed, sleepTimer ->
                if (audiobook != null) {
                    AudioPlayerState(
                        title = chapter?.title ?: audiobook.title,
                        artist = audiobook.author,
                        albumTitle = audiobook.title,
                        artworkUrl = audiobook.coverPath,
                        currentPosition = position,
                        duration = chapter?.duration ?: audiobook.duration,
                        isPlaying = isPlaying,
                        playerType = PlayerType.AUDIOBOOK,
                        playbackSpeed = speed,
                        hasChapters = audiobook.chapters.isNotEmpty(),
                        chapterTitle = chapter?.title,
                        chapterInfo = ChapterPosition(
                            current = audiobook.chapters.indexOf(chapter) + 1,
                            total = audiobook.chapters.size
                        ),
                        sleepTimerActive = sleepTimer != null && sleepTimer > 0,
                        sleepTimerRemaining = sleepTimer
                    )
                } else {
                    _uiState.value
                }
            }.collect { state ->
                _uiState.value = state
            }
        }
    }
    
    private fun observePodcastPlayback() {
        viewModelScope.launch {
            combine(
                podcastService.currentEpisode,
                podcastService.position,
                podcastService.isPlaying,
                podcastService.playbackSpeed,
                podcastService.sleepTimerRemaining
            ) { episode, position, isPlaying, speed, sleepTimer ->
                if (episode != null) {
                    AudioPlayerState(
                        title = episode.title,
                        artist = episode.showTitle,
                        albumTitle = episode.showTitle,
                        artworkUrl = episode.showArtworkUrl,
                        currentPosition = position,
                        duration = episode.duration,
                        isPlaying = isPlaying,
                        playerType = PlayerType.PODCAST,
                        playbackSpeed = speed,
                        hasChapters = episode.chapters.isNotEmpty(),
                        chapterTitle = episode.currentChapter?.title,
                        chapterInfo = episode.currentChapter?.let {
                            ChapterPosition(
                                current = episode.chapters.indexOf(it) + 1,
                                total = episode.chapters.size
                            )
                        },
                        sleepTimerActive = sleepTimer != null && sleepTimer > 0,
                        sleepTimerRemaining = sleepTimer
                    )
                } else {
                    _uiState.value
                }
            }.collect { state ->
                _uiState.value = state
            }
        }
    }
    
    fun playPause() {
        when (playerType) {
            PlayerType.MUSIC -> musicPlayerService.playPause()
            PlayerType.AUDIOBOOK -> audiobookService.playPause()
            PlayerType.PODCAST -> podcastService.playPause()
        }
    }
    
    fun seek(position: Float) {
        when (playerType) {
            PlayerType.MUSIC -> musicPlayerService.seekTo(position.toLong())
            PlayerType.AUDIOBOOK -> audiobookService.seekTo(position.toLong())
            PlayerType.PODCAST -> podcastService.seekTo(position.toLong())
        }
    }
    
    fun skipPrevious() {
        musicPlayerService.skipToPrevious()
    }
    
    fun skipNext() {
        musicPlayerService.skipToNext()
    }
    
    fun rewind() {
        val amount = when (playerType) {
            PlayerType.AUDIOBOOK -> 30000L
            PlayerType.PODCAST -> 30000L
            else -> 10000L
        }
        when (playerType) {
            PlayerType.MUSIC -> musicPlayerService.rewind(amount)
            PlayerType.AUDIOBOOK -> audiobookService.rewind(amount)
            PlayerType.PODCAST -> podcastService.rewind(amount)
        }
    }
    
    fun fastForward() {
        val amount = when (playerType) {
            PlayerType.AUDIOBOOK -> 30000L
            PlayerType.PODCAST -> 30000L
            else -> 10000L
        }
        when (playerType) {
            PlayerType.MUSIC -> musicPlayerService.fastForward(amount)
            PlayerType.AUDIOBOOK -> audiobookService.fastForward(amount)
            PlayerType.PODCAST -> podcastService.fastForward(amount)
        }
    }
    
    fun setPlaybackSpeed(speed: Float) {
        when (playerType) {
            PlayerType.AUDIOBOOK -> audiobookService.setPlaybackSpeed(speed)
            PlayerType.PODCAST -> podcastService.setPlaybackSpeed(speed)
            else -> { /* Music doesn't typically use speed control */ }
        }
    }
    
    fun toggleShuffle() {
        musicPlayerService.toggleShuffle()
    }
    
    fun toggleRepeat() {
        musicPlayerService.toggleRepeat()
    }
    
    fun setSleepTimer(minutes: Int) {
        when (playerType) {
            PlayerType.AUDIOBOOK -> audiobookService.setSleepTimer(minutes)
            PlayerType.PODCAST -> podcastService.setSleepTimer(minutes)
            else -> { }
        }
    }
    
    fun cancelSleepTimer() {
        when (playerType) {
            PlayerType.AUDIOBOOK -> audiobookService.cancelSleepTimer()
            PlayerType.PODCAST -> podcastService.cancelSleepTimer()
            else -> { }
        }
    }
    
    fun playQueueItem(index: Int) {
        musicPlayerService.playQueueItem(index)
    }
    
    fun removeFromQueue(index: Int) {
        musicPlayerService.removeFromQueue(index)
    }
}

/**
 * ViewModel for Plex-style Video Player
 */
@HiltViewModel
class PlexVideoPlayerViewModel @Inject constructor(
    private val savedStateHandle: SavedStateHandle,
    private val videoService: ComprehensiveVideoService,
    private val videoRepository: VideoRepository,
    private val settingsRepository: SettingsRepository
) : ViewModel() {
    
    private val videoId: String = savedStateHandle.get<String>("videoId") ?: ""
    
    private val _uiState = MutableStateFlow(VideoPlayerState(
        title = "",
        currentPosition = 0L,
        duration = 0L,
        bufferedPosition = 0L,
        isPlaying = false
    ))
    val uiState: StateFlow<VideoPlayerState> = _uiState.asStateFlow()
    
    init {
        loadVideo()
        observePlayback()
    }
    
    private fun loadVideo() {
        viewModelScope.launch {
            val video = videoRepository.getVideo(videoId.toLongOrNull() ?: 0L)
            if (video != null) {
                // Get watch progress
                val progress = videoRepository.getWatchProgress(video.id)
                
                // Get subtitle and audio tracks
                val subtitleTracks = video.subtitleTracks.map { track ->
                    SubtitleTrack(
                        id = track.id.toString(),
                        language = track.language,
                        label = track.label,
                        url = track.url
                    )
                }
                
                val audioTracks = video.audioTracks.map { track ->
                    AudioTrack(
                        id = track.id.toString(),
                        language = track.language,
                        label = track.label,
                        codec = track.codec
                    )
                }
                
                // Get chapters
                val chapters = video.chapters.map { chapter ->
                    VideoChapter(
                        title = chapter.title,
                        startPosition = chapter.startTime
                    )
                }
                
                // Get episodes if TV show
                val episodes = if (video.isEpisode) {
                    videoRepository.getSeasonEpisodes(video.showId, video.season).first().map { ep ->
                        EpisodeInfo(
                            id = ep.id.toString(),
                            number = ep.episodeNumber,
                            title = ep.title,
                            duration = formatDuration(ep.duration),
                            thumbnailUrl = ep.thumbnailPath,
                            progress = ep.watchProgress
                        )
                    }
                } else {
                    emptyList()
                }
                
                _uiState.update {
                    it.copy(
                        title = video.title,
                        subtitle = video.showTitle?.let { show -> "S${video.season}E${video.episodeNumber} • $show" },
                        thumbnailUrl = video.posterPath,
                        duration = video.duration,
                        currentPosition = progress?.position ?: 0L,
                        isEpisode = video.isEpisode,
                        currentEpisodeId = videoId,
                        episodes = episodes,
                        hasNext = episodes.any { it.number > video.episodeNumber },
                        hasPrevious = episodes.any { it.number < video.episodeNumber },
                        chapters = chapters,
                        subtitleTracks = subtitleTracks,
                        audioTracks = audioTracks,
                        availableQualities = listOf(
                            VideoQuality.AUTO,
                            VideoQuality.SD,
                            VideoQuality.HD,
                            VideoQuality.FULL_HD
                        )
                    )
                }
                
                // Start playback
                videoService.play(video.filePath, progress?.position ?: 0L)
            }
        }
    }
    
    private fun observePlayback() {
        viewModelScope.launch {
            combine(
                videoService.position,
                videoService.bufferedPosition,
                videoService.isPlaying,
                videoService.isBuffering
            ) { position, buffered, isPlaying, isBuffering ->
                _uiState.value.copy(
                    currentPosition = position,
                    bufferedPosition = buffered,
                    isPlaying = isPlaying,
                    isBuffering = isBuffering
                )
            }.collect { state ->
                _uiState.value = state
            }
        }
        
        // Observe skip intro timing
        viewModelScope.launch {
            videoService.introRange.collect { range ->
                val position = _uiState.value.currentPosition
                val showSkip = range != null && position >= range.first && position < range.second
                _uiState.update { it.copy(showSkipIntro = showSkip) }
            }
        }
    }
    
    fun playPause() {
        videoService.playPause()
    }
    
    fun seek(position: Long) {
        videoService.seekTo(position)
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
        viewModelScope.launch {
            videoService.introRange.value?.let { range ->
                seek(range.second)
            }
        }
    }
    
    fun setSubtitle(track: SubtitleTrack?) {
        viewModelScope.launch {
            videoService.setSubtitleTrack(track?.id?.toLongOrNull())
            _uiState.update { it.copy(currentSubtitle = track) }
        }
    }
    
    fun setAudioTrack(track: AudioTrack) {
        viewModelScope.launch {
            videoService.setAudioTrack(track.id.toLong())
            _uiState.update { it.copy(currentAudioTrack = track) }
        }
    }
    
    fun setQuality(quality: VideoQuality) {
        viewModelScope.launch {
            videoService.setQuality(quality.resolution)
            _uiState.update { it.copy(currentQuality = quality) }
        }
    }
    
    fun playEpisode(episode: EpisodeInfo) {
        viewModelScope.launch {
            // Save progress of current episode
            saveProgress()
            
            // Load new episode
            savedStateHandle["videoId"] = episode.id
            loadVideo()
        }
    }
    
    private suspend fun saveProgress() {
        videoRepository.updateWatchProgress(
            videoId = videoId.toLong(),
            position = _uiState.value.currentPosition,
            duration = _uiState.value.duration
        )
    }
    
    private fun formatDuration(ms: Long): String {
        val minutes = (ms / (1000 * 60)) % 60
        val hours = ms / (1000 * 60 * 60)
        return if (hours > 0) "${hours}h ${minutes}m" else "${minutes}m"
    }
    
    override fun onCleared() {
        super.onCleared()
        viewModelScope.launch {
            saveProgress()
            videoService.stop()
        }
    }
}
