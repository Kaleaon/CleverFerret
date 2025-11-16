package com.universalmedialibrary.ui.music.hivefy

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.music.hivefy.SaavnLanguage
import com.universalmedialibrary.data.music.hivefy.SaavnPlaylist
import com.universalmedialibrary.data.music.hivefy.SaavnSong
import com.universalmedialibrary.data.music.hivefy.bestAudioSource
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.hivefy.HivefyMusicRepository
import dagger.hilt.android.lifecycle.HiltViewModel
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
    private val musicPlayerService: AdvancedMusicPlayerService
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
            val source = song.bestAudioSource()
            if (source == null) {
                _events.tryEmit(HivefyMusicEvent.Message("Streaming link missing for ${song.title}"))
                return@launch
            }

            runCatching {
                musicPlayerService.playTrackFromUri(
                    uri = source.url,
                    title = song.title,
                    artist = song.primaryArtists.firstOrNull()?.name,
                    album = song.albumName,
                    duration = (song.durationSeconds ?: 0) * 1000L,
                    albumArtUrl = song.artworkUrl
                )
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
        val targetSong = playlist.songs.getOrNull(startIndex) ?: playlist.songs.firstOrNull()
        if (targetSong == null) {
            _events.tryEmit(HivefyMusicEvent.Message("Playlist is still loading songs"))
            return
        }
        playSong(targetSong)
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
