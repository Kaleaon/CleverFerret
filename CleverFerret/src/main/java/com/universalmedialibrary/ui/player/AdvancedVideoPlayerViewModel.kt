package com.universalmedialibrary.ui.player

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.*
import androidx.media3.common.util.UnstableApi
import androidx.media3.datasource.DefaultDataSourceFactory
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.source.MediaSource
import androidx.media3.exoplayer.source.ProgressiveMediaSource
import androidx.media3.exoplayer.trackselection.DefaultTrackSelector
import com.universalmedialibrary.ui.player.components.AudioTrack
import com.universalmedialibrary.ui.player.components.Chapter
import com.universalmedialibrary.ui.player.components.SubtitleTrack
import com.universalmedialibrary.ui.viewer.common.VideoSettings
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
@OptIn(UnstableApi::class)
class AdvancedVideoPlayerViewModel @Inject constructor() : ViewModel() {

    private val _uiState = MutableStateFlow(AdvancedVideoPlayerUiState())
    val uiState: StateFlow<AdvancedVideoPlayerUiState> = _uiState.asStateFlow()

    private var exoPlayer: ExoPlayer? = null
    private var trackSelector: DefaultTrackSelector? = null

    fun loadVideo(context: Context, videoUri: Uri) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(
                    isLoading = true,
                    error = null
                )

                // Initialize ExoPlayer with advanced configuration
                trackSelector = DefaultTrackSelector(context).apply {
                    setParameters(
                        buildUponParameters()
                            .setMaxVideoSizeSd()
                            .setMaxVideoFrameRate(60)
                            .build()
                    )
                }

                exoPlayer = ExoPlayer.Builder(context)
                    .setTrackSelector(trackSelector!!)
                    .setSeekBackIncrementMs(10000)
                    .setSeekForwardIncrementMs(10000)
                    .build()

                exoPlayer?.let { player ->
                    // Set up player listener
                    player.addListener(object : Player.Listener {
                        override fun onPlaybackStateChanged(playbackState: Int) {
                            _uiState.value = _uiState.value.copy(
                                isLoading = playbackState == Player.STATE_BUFFERING,
                                isLoaded = playbackState != Player.STATE_IDLE
                            )
                        }

                        override fun onIsPlayingChanged(isPlaying: Boolean) {
                            _uiState.value = _uiState.value.copy(isPlaying = isPlaying)
                        }

                        override fun onPlayerError(error: PlaybackException) {
                            _uiState.value = _uiState.value.copy(
                                isLoading = false,
                                error = error.message ?: "Unknown playback error"
                            )
                        }

                        override fun onTracksChanged(tracks: Tracks) {
                            updateAvailableTracks(tracks)
                        }

                        override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
                            mediaItem?.let {
                                _uiState.value = _uiState.value.copy(
                                    title = it.mediaMetadata.title?.toString()
                                        ?: videoUri.lastPathSegment
                                        ?: "Unknown Video"
                                )
                            }
                        }
                    })

                    // Create media source
                    val dataSourceFactory = DefaultDataSourceFactory(context, "CleverFerret")
                    val mediaSource: MediaSource = ProgressiveMediaSource.Factory(dataSourceFactory)
                        .createMediaSource(MediaItem.fromUri(videoUri))

                    // Prepare and start playback
                    player.setMediaSource(mediaSource)
                    player.prepare()

                    // Update duration when available
                    player.addListener(object : Player.Listener {
                        override fun onPlaybackStateChanged(playbackState: Int) {
                            if (playbackState == Player.STATE_READY) {
                                _uiState.value = _uiState.value.copy(
                                    duration = player.duration,
                                    isLoaded = true,
                                    isLoading = false
                                )
                                startPositionUpdates()
                            }
                        }
                    })
                }

            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load video: ${e.message}"
                )
            }
        }
    }

    private fun startPositionUpdates() {
        viewModelScope.launch {
            while (exoPlayer != null) {
                exoPlayer?.let { player ->
                    _uiState.value = _uiState.value.copy(
                        currentPosition = player.currentPosition,
                        bufferedPosition = player.bufferedPosition
                    )
                }
                kotlinx.coroutines.delay(1000) // Update every second
            }
        }
    }

    private fun updateAvailableTracks(tracks: Tracks) {
        val subtitleTracks = mutableListOf<SubtitleTrack>()
        val audioTracks = mutableListOf<AudioTrack>()

        for (trackGroupInfo in tracks.groups) {
            val trackGroup = trackGroupInfo.mediaTrackGroup
            val trackType = trackGroup.getFormat(0).sampleMimeType

            when {
                trackType?.startsWith("text/") == true ||
                trackType?.startsWith("application/") == true -> {
                    // Subtitle tracks
                    for (i in 0 until trackGroup.length) {
                        val format = trackGroup.getFormat(i)
                        subtitleTracks.add(
                            SubtitleTrack(
                                id = i,
                                language = format.language ?: "Unknown",
                                label = format.label ?: "Subtitle ${i + 1}",
                                isDefault = trackGroupInfo.isSelected,
                                format = format.sampleMimeType
                            )
                        )
                    }
                }
                trackType?.startsWith("audio/") == true -> {
                    // Audio tracks
                    for (i in 0 until trackGroup.length) {
                        val format = trackGroup.getFormat(i)
                        audioTracks.add(
                            AudioTrack(
                                id = i,
                                language = format.language ?: "Unknown",
                                label = format.label ?: "Audio ${i + 1}",
                                isDefault = trackGroupInfo.isSelected,
                                channels = format.channelCount ?: 2,
                                sampleRate = format.sampleRate ?: 44100
                            )
                        )
                    }
                }
            }
        }

        _uiState.value = _uiState.value.copy(
            subtitleTracks = subtitleTracks,
            audioTracks = audioTracks
        )
    }

    fun togglePlayPause() {
        exoPlayer?.let { player ->
            if (player.isPlaying) {
                player.pause()
            } else {
                player.play()
            }
        }
    }

    fun seekTo(positionMs: Long) {
        exoPlayer?.seekTo(positionMs)
    }

    fun seekRelative(deltaMs: Long) {
        exoPlayer?.let { player ->
            val newPosition = (player.currentPosition + deltaMs)
                .coerceIn(0L, player.duration.coerceAtLeast(0L))
            player.seekTo(newPosition)
        }
    }

    fun setPlaybackSpeed(speed: Float) {
        exoPlayer?.setPlaybackSpeed(speed)
        _uiState.value = _uiState.value.copy(playbackSpeed = speed)
    }

    fun selectSubtitleTrack(trackId: Int) {
        trackSelector?.let { selector ->
            val parameters = selector.buildUponParameters()
            if (trackId >= 0) {
                parameters.setRendererDisabled(C.TRACK_TYPE_TEXT, false)
                // In a real implementation, you'd set the specific track
            } else {
                parameters.setRendererDisabled(C.TRACK_TYPE_TEXT, true)
            }
            selector.setParameters(parameters)
        }
        _uiState.value = _uiState.value.copy(selectedSubtitleTrack = trackId)
    }

    fun selectAudioTrack(trackId: Int) {
        trackSelector?.let { selector ->
            val parameters = selector.buildUponParameters()
            // In a real implementation, you'd set the specific audio track
            selector.setParameters(parameters)
        }
        _uiState.value = _uiState.value.copy(selectedAudioTrack = trackId)
    }

    fun updateSettings(settings: VideoSettings) {
        _uiState.value = _uiState.value.copy(settings = settings)
    }

    fun getExoPlayer(): ExoPlayer? = exoPlayer

    override fun onCleared() {
        super.onCleared()
        exoPlayer?.release()
        exoPlayer = null
        trackSelector = null
    }
}

data class AdvancedVideoPlayerUiState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val isPlaying: Boolean = false,
    val error: String? = null,
    val title: String = "",
    val currentPosition: Long = 0L,
    val duration: Long = 0L,
    val bufferedPosition: Long = 0L,
    val playbackSpeed: Float = 1.0f,
    val volume: Float = 0.8f,

    // Tracks
    val subtitleTracks: List<SubtitleTrack> = emptyList(),
    val audioTracks: List<AudioTrack> = emptyList(),
    val selectedSubtitleTrack: Int = -1,
    val selectedAudioTrack: Int = 0,

    // Chapters
    val chapters: List<Chapter> = emptyList(),
    val currentChapter: String? = null,

    // Settings
    val settings: VideoSettings = VideoSettings()
)
