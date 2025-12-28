package com.universalmedialibrary.ui.media.viewmodels

import android.content.Context
import androidx.compose.ui.graphics.Color
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.MusicRepository
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.playlist.MusicPlaylistManager
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.music.Album
import com.universalmedialibrary.ui.music.Artist
import com.universalmedialibrary.ui.music.Genre
import com.universalmedialibrary.ui.music.Track
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Clean media-centric Music Library
 * 
 * Connects to real music services for actual playback and library management.
 */
@HiltViewModel
class MusicViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val musicRepository: MusicRepository,
    private val musicPlayerService: AdvancedMusicPlayerService,
    private val playlistManager: MusicPlaylistManager
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MusicLibraryState())
    val uiState: StateFlow<MusicLibraryState> = _uiState.asStateFlow()
    
    private val _nowPlaying = MutableStateFlow<MusicTrack?>(null)
    val nowPlaying: StateFlow<MusicTrack?> = _nowPlaying.asStateFlow()
    
    init {
        loadMusicLibrary()
        observePlaybackState()
        observePlaylists()
    }
    
    private fun loadMusicLibrary() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            // Trigger library scan
            try {
                musicRepository.scanLibrary()
            } catch (e: Exception) {
                // Log but don't fail - we'll still try to show cached data
            }
            
            // Observe tracks from repository
            musicRepository.tracks.collect { tracks ->
                val albums = musicRepository.albums.value
                val artists = musicRepository.artists.value
                val genres = musicRepository.genres.value
                
                _uiState.update {
                    MusicLibraryState(
                        albums = albums.map { it.toMusicAlbum() },
                        artists = artists.map { it.toMusicArtist() },
                        tracks = tracks.map { it.toMusicTrack() },
                        playlists = _uiState.value.playlists,
                        genres = genres.map { it.toMusicGenre() },
                        isLoading = false,
                        nowPlaying = _nowPlaying.value
                    )
                }
            }
        }
    }
    
    private fun observePlaybackState() {
        viewModelScope.launch {
            musicPlayerService.currentTrack.collect { trackInfo ->
                if (trackInfo != null) {
                    _nowPlaying.value = MusicTrack(
                        id = trackInfo.id,
                        title = trackInfo.title,
                        artist = trackInfo.artist ?: "Unknown Artist",
                        album = trackInfo.album ?: "Unknown Album",
                        albumArtUrl = trackInfo.albumArtUrl,
                        duration = formatDuration(trackInfo.duration),
                        trackNumber = 0,
                        isPlaying = musicPlayerService.playbackState.value.isPlaying
                    )
                    _uiState.update { it.copy(nowPlaying = _nowPlaying.value) }
                } else {
                    _nowPlaying.value = null
                    _uiState.update { it.copy(nowPlaying = null) }
                }
            }
        }
    }
    
    private fun observePlaylists() {
        viewModelScope.launch {
            playlistManager.getPlaylistOverviews().collect { overviews ->
                val playlists = overviews.map { overview ->
                    MusicPlaylist(
                        id = "playlist_${overview.playlist.playlistId}",
                        name = overview.playlist.name,
                        trackCount = overview.trackCount,
                        artworkUrls = emptyList(),
                        isUserCreated = true
                    )
                }
                _uiState.update { it.copy(playlists = playlists) }
            }
        }
    }
    
    fun playAlbum(album: MusicAlbum) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                // Find tracks for this album from repository
                val tracks = musicRepository.tracks.value
                    .filter { it.displayAlbum == album.title }
                    .sortedBy { it.trackNumber }
                
                if (tracks.isNotEmpty()) {
                    val firstTrack = tracks.first()
                    musicPlayerService.playTrackFromUri(
                        uri = firstTrack.uri.toString(),
                        title = firstTrack.title ?: "Unknown",
                        artist = firstTrack.artist,
                        album = firstTrack.album,
                        duration = firstTrack.duration,
                        albumArtUrl = firstTrack.albumArtUri?.toString()
                    )
                }
            } catch (e: Exception) {
                // Handle playback error
            }
        }
    }
    
    fun playArtist(artist: MusicArtist) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val tracks = musicRepository.tracks.value
                    .filter { it.displayArtist == artist.name }
                
                if (tracks.isNotEmpty()) {
                    val firstTrack = tracks.first()
                    musicPlayerService.playTrackFromUri(
                        uri = firstTrack.uri.toString(),
                        title = firstTrack.title ?: "Unknown",
                        artist = firstTrack.artist,
                        album = firstTrack.album,
                        duration = firstTrack.duration,
                        albumArtUrl = firstTrack.albumArtUri?.toString()
                    )
                }
            } catch (e: Exception) {
                // Handle playback error
            }
        }
    }
    
    fun playTrack(track: MusicTrack) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                // Find the real track from repository
                val realTrack = musicRepository.tracks.value
                    .find { it.id.toString() == track.id || it.title == track.title }
                
                if (realTrack != null) {
                    musicPlayerService.playTrackFromUri(
                        uri = realTrack.uri.toString(),
                        title = realTrack.title ?: "Unknown",
                        artist = realTrack.artist,
                        album = realTrack.album,
                        duration = realTrack.duration,
                        albumArtUrl = realTrack.albumArtUri?.toString()
                    )
                }
            } catch (e: Exception) {
                // Handle playback error
            }
        }
    }
    
    fun playPlaylist(playlist: MusicPlaylist) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val playlistId = playlist.id.removePrefix("playlist_").toLongOrNull() ?: return@launch
                playlistManager.playPlaylist(playlistId, shuffle = false)
            } catch (e: Exception) {
                // Handle playback error
            }
        }
    }
    
    fun shuffleAll() {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val tracks = musicRepository.tracks.value
                if (tracks.isNotEmpty()) {
                    val randomTrack = tracks.random()
                    musicPlayerService.playTrackFromUri(
                        uri = randomTrack.uri.toString(),
                        title = randomTrack.title ?: "Unknown",
                        artist = randomTrack.artist,
                        album = randomTrack.album,
                        duration = randomTrack.duration,
                        albumArtUrl = randomTrack.albumArtUri?.toString()
                    )
                    // Enable shuffle mode
                    musicPlayerService.toggleShuffle()
                }
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
    
    fun togglePlayPause() {
        musicPlayerService.togglePlayPause()
    }
    
    fun skipPrevious() {
        musicPlayerService.skipPrevious()
    }
    
    fun skipNext() {
        musicPlayerService.skipNext()
    }
    
    private fun formatDuration(durationMs: Long): String {
        val totalSeconds = durationMs / 1000
        val minutes = totalSeconds / 60
        val seconds = totalSeconds % 60
        return "$minutes:${seconds.toString().padStart(2, '0')}"
    }
    
    // Extension functions to convert between data models
    private fun Album.toMusicAlbum(): MusicAlbum = MusicAlbum(
        id = "album_${this.name}_${this.artist}",
        title = this.name,
        artist = this.artist ?: "Unknown Artist",
        artworkUrl = this.artworkUri?.toString(),
        year = this.year ?: 0,
        trackCount = this.trackCount,
        duration = formatDuration(this.tracks.sumOf { it.duration })
    )
    
    private fun Artist.toMusicArtist(): MusicArtist = MusicArtist(
        id = "artist_${this.name}",
        name = this.name,
        imageUrl = null,
        albumCount = this.albumCount,
        trackCount = this.trackCount
    )
    
    private fun Track.toMusicTrack(): MusicTrack = MusicTrack(
        id = this.id.toString(),
        title = this.title ?: "Unknown Title",
        artist = this.displayArtist,
        album = this.displayAlbum,
        albumArtUrl = this.albumArtUri?.toString(),
        duration = formatDuration(this.duration),
        trackNumber = this.trackNumber ?: 0
    )
    
    private fun Genre.toMusicGenre(): MusicGenre = MusicGenre(
        name = this.name,
        trackCount = this.trackCount,
        color = getGenreColor(this.name.hashCode())
    )
    
    private fun getGenreColor(hash: Int): Color {
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
        return colors[kotlin.math.abs(hash) % colors.size]
    }
}
