package com.universalmedialibrary.ui.media.viewmodels

import androidx.compose.ui.graphics.Color
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Clean media-centric Music Library
 * 
 * Note: This is a simplified implementation with placeholder data.
 * Full repository and service integration will be added when the
 * complete data layer is finalized.
 */
@HiltViewModel
class MusicViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(MusicLibraryState())
    val uiState: StateFlow<MusicLibraryState> = _uiState.asStateFlow()
    
    private val _nowPlaying = MutableStateFlow<MusicTrack?>(null)
    val nowPlaying: StateFlow<MusicTrack?> = _nowPlaying.asStateFlow()
    
    init {
        loadMusicLibrary()
    }
    
    private fun loadMusicLibrary() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            // Simulate loading delay
            delay(300)
            
            _uiState.update {
                MusicLibraryState(
                    albums = generateSampleAlbums(),
                    artists = generateSampleArtists(),
                    tracks = generateSampleTracks(),
                    playlists = generateSamplePlaylists(),
                    genres = generateSampleGenres(),
                    isLoading = false
                )
            }
        }
    }
    
    private fun generateSampleAlbums(): List<MusicAlbum> {
        return (1..10).map { index ->
            MusicAlbum(
                id = "album_$index",
                title = "Sample Album $index",
                artist = "Sample Artist ${(index % 5) + 1}",
                artworkUrl = null,
                year = 2020 + (index % 5),
                trackCount = 8 + (index % 5),
                duration = "${(35 + index * 2)}:00"
            )
        }
    }
    
    private fun generateSampleArtists(): List<MusicArtist> {
        return (1..5).map { index ->
            MusicArtist(
                id = "artist_$index",
                name = "Sample Artist $index",
                imageUrl = null,
                albumCount = 2 + (index % 3),
                trackCount = 15 + (index * 5)
            )
        }
    }
    
    private fun generateSampleTracks(): List<MusicTrack> {
        return (1..20).map { index ->
            MusicTrack(
                id = "track_$index",
                title = "Sample Track $index",
                artist = "Sample Artist ${(index % 5) + 1}",
                album = "Sample Album ${(index % 10) + 1}",
                albumArtUrl = null,
                duration = "${3 + (index % 3)}:${(index * 7) % 60}",
                trackNumber = (index % 12) + 1
            )
        }
    }
    
    private fun generateSamplePlaylists(): List<MusicPlaylist> {
        return listOf(
            MusicPlaylist("pl_1", "Favorites", 25, emptyList(), true),
            MusicPlaylist("pl_2", "Recently Played", 15, emptyList(), false),
            MusicPlaylist("pl_3", "Workout Mix", 30, emptyList(), true)
        )
    }
    
    private fun generateSampleGenres(): List<MusicGenre> {
        val genreNames = listOf("Pop", "Rock", "Jazz", "Classical", "Electronic", "Hip Hop")
        return genreNames.mapIndexed { index, name ->
            MusicGenre(
                name = name,
                trackCount = 10 + (index * 5),
                color = getGenreColor(index)
            )
        }
    }
    
    fun playAlbum(album: MusicAlbum) {
        viewModelScope.launch {
            _nowPlaying.value = MusicTrack(
                id = "playing_album_${album.id}",
                title = "Track 1",
                artist = album.artist,
                album = album.title,
                albumArtUrl = album.artworkUrl,
                duration = "3:30",
                trackNumber = 1,
                isPlaying = true
            )
            _uiState.update { it.copy(nowPlaying = _nowPlaying.value) }
        }
    }
    
    fun playArtist(artist: MusicArtist) {
        viewModelScope.launch {
            _nowPlaying.value = MusicTrack(
                id = "playing_artist_${artist.id}",
                title = "Track 1",
                artist = artist.name,
                album = "Album 1",
                albumArtUrl = artist.imageUrl,
                duration = "4:15",
                trackNumber = 1,
                isPlaying = true
            )
            _uiState.update { it.copy(nowPlaying = _nowPlaying.value) }
        }
    }
    
    fun playTrack(track: MusicTrack) {
        viewModelScope.launch {
            _nowPlaying.value = track.copy(isPlaying = true)
            _uiState.update { it.copy(nowPlaying = _nowPlaying.value) }
        }
    }
    
    fun playPlaylist(playlist: MusicPlaylist) {
        viewModelScope.launch {
            _nowPlaying.value = MusicTrack(
                id = "playing_pl_${playlist.id}",
                title = "Playlist Track 1",
                artist = "Various Artists",
                album = playlist.name,
                albumArtUrl = null,
                duration = "3:45",
                trackNumber = 1,
                isPlaying = true
            )
            _uiState.update { it.copy(nowPlaying = _nowPlaying.value) }
        }
    }
    
    fun shuffleAll() {
        viewModelScope.launch {
            val tracks = _uiState.value.tracks
            if (tracks.isNotEmpty()) {
                val randomTrack = tracks.random()
                _nowPlaying.value = randomTrack.copy(isPlaying = true)
                _uiState.update { it.copy(nowPlaying = _nowPlaying.value) }
            }
        }
    }
    
    fun togglePlayPause() {
        _nowPlaying.value?.let { track ->
            _nowPlaying.value = track.copy(isPlaying = !track.isPlaying)
            _uiState.update { it.copy(nowPlaying = _nowPlaying.value) }
        }
    }
    
    private fun getGenreColor(index: Int): Color {
        val colors = listOf(
            Color(0xFFE91E63),
            Color(0xFF9C27B0),
            Color(0xFF673AB7),
            Color(0xFF3F51B5),
            Color(0xFF2196F3),
            Color(0xFF00BCD4),
            Color(0xFF009688),
            Color(0xFF4CAF50),
            Color(0xFF8BC34A),
            Color(0xFFFF9800)
        )
        return colors[index % colors.size]
    }
}
