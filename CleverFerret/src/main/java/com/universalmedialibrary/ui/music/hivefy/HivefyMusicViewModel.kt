package com.universalmedialibrary.ui.music.hivefy

import android.net.Uri
import android.os.Bundle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.music.hivefy.SaavnLanguage
import com.universalmedialibrary.data.music.hivefy.SaavnPlaylist
import com.universalmedialibrary.data.music.hivefy.SaavnSong
import com.universalmedialibrary.data.music.hivefy.bestAudioSource
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.music.hivefy.HivefyPlaybackContract
import com.universalmedialibrary.services.music.hivefy.HivefyMusicRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class HivefyMusicViewModel @Inject constructor(
    private val repository: HivefyMusicRepository,
    private val audioPlaybackManager: AudioPlaybackManager
) : ViewModel() {

    private val _uiState = MutableStateFlow(HivefyMusicUiState())
    val uiState: StateFlow<HivefyMusicUiState> = _uiState.asStateFlow()

    private val _events = MutableSharedFlow<HivefyMusicEvent>(
        replay = 0,
        extraBufferCapacity = 1
    )
    val events: SharedFlow<HivefyMusicEvent> = _events.asSharedFlow()

    private var refreshToken = 0L

    init {
        refresh(forceRefresh = false)
    }

    fun selectLanguage(language: SaavnLanguage) {
        if (language == _uiState.value.selectedLanguage) return
        _uiState.update {
            it.copy(
                selectedLanguage = language,
                isLoading = true,
                errorMessage = null
            )
        }
        refreshForLanguage(language, forceRefresh = false)
    }

    fun refresh(forceRefresh: Boolean = true) {
        refreshForLanguage(_uiState.value.selectedLanguage, forceRefresh)
    }

    private fun refreshForLanguage(language: SaavnLanguage, forceRefresh: Boolean) {
        val token = ++refreshToken
        viewModelScope.launch {
            _uiState.update {
                it.copy(
                    isLoading = it.playlists.isEmpty() || forceRefresh,
                    isRefreshing = true,
                    errorMessage = null
                )
            }

            val result = runCatching {
                repository.loadDiscovery(language, forceRefresh)
            }

            if (token != refreshToken) return@launch

            result.onSuccess { payload ->
                _uiState.update {
                    it.copy(
                        playlists = payload.playlists,
                        albums = payload.albums,
                        selectedLanguage = language,
                        lastFetchedTimestamp = payload.fetchedAtEpochMillis,
                        isLoading = false,
                        isRefreshing = false,
                        errorMessage = null
                    )
                }
            }.onFailure { throwable ->
                _uiState.update {
                    it.copy(
                        isLoading = false,
                        isRefreshing = false,
                        errorMessage = throwable.message ?: "Unable to reach Hivefy servers"
                    )
                }
                _events.tryEmit(
                    HivefyMusicEvent.Message(
                        throwable.message ?: "Unable to refresh Hivefy discovery"
                    )
                )
            }
        }
    }

    fun playSong(song: SaavnSong) {
        viewModelScope.launch {
            val mediaItem = buildMediaItem(song)
            if (mediaItem == null) {
                _events.tryEmit(HivefyMusicEvent.Message("Streaming link missing for ${song.title}"))
                return@launch
            }
            runCatching {
                audioPlaybackManager.loadSingle(mediaItem, playWhenReady = true)
            }.onFailure { throwable ->
                _events.tryEmit(
                    HivefyMusicEvent.Message(
                        "Playback failed: ${throwable.message ?: "unknown error"}"
                    )
                )
            }
        }
    }

    fun playPlaylist(playlist: SaavnPlaylist, startIndex: Int = 0) {
        viewModelScope.launch {
            val mediaItems = playlist.songs.mapNotNull { buildMediaItem(it, emitErrors = false) }
            if (mediaItems.isEmpty()) {
                _events.tryEmit(HivefyMusicEvent.Message("No playable tracks found in ${playlist.title}"))
                return@launch
            }
            val safeIndex = startIndex.coerceIn(0, mediaItems.lastIndex)
            runCatching {
                audioPlaybackManager.setQueue(mediaItems, safeIndex, playWhenReady = true)
            }.onFailure { throwable ->
                _events.tryEmit(
                    HivefyMusicEvent.Message(
                        "Unable to start playlist: ${throwable.message ?: "unknown error"}"
                    )
                )
            }
        }
    }

    private fun buildMediaItem(song: SaavnSong, emitErrors: Boolean = true): MediaItem? {
        val source = song.bestAudioSource()
        if (source == null) {
            if (emitErrors) {
                _events.tryEmit(HivefyMusicEvent.Message("Streaming link missing for ${song.title}"))
            }
            return null
        }
        val metadata = MediaMetadata.Builder()
            .setTitle(song.title)
            .setArtist(song.primaryArtists.joinToString { it.name })
            .setAlbumTitle(song.albumName)
            .setArtworkUri(song.artworkUrl?.let(Uri::parse))
            .setExtras(Bundle().apply {
                putString(HivefyPlaybackContract.EXTRA_CANONICAL_URL, song.url)
                putString(HivefyPlaybackContract.EXTRA_TRACK_ID, song.id)
            })
            .build()

        return MediaItem.Builder()
            .setUri(Uri.parse(source.url))
            .setMediaId(song.url)
            .setMediaMetadata(metadata)
            .build()
    }

    data class HivefyMusicUiState(
        val selectedLanguage: SaavnLanguage = SaavnLanguage.DEFAULT,
        val playlists: List<com.universalmedialibrary.data.music.hivefy.SaavnPlaylist> = emptyList(),
        val albums: List<com.universalmedialibrary.data.music.hivefy.SaavnAlbum> = emptyList(),
        val isLoading: Boolean = true,
        val isRefreshing: Boolean = false,
        val errorMessage: String? = null,
        val lastFetchedTimestamp: Long? = null
    ) {
        val hasContent: Boolean get() = playlists.isNotEmpty() || albums.isNotEmpty()
    }

    sealed interface HivefyMusicEvent {
        data class Message(val text: String) : HivefyMusicEvent
    }
}
