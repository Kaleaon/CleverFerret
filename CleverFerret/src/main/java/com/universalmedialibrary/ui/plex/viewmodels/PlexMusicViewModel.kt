package com.universalmedialibrary.ui.plex.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.*
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.LyricsService
import com.universalmedialibrary.services.music.LastFmScrobblerService
import com.universalmedialibrary.ui.plex.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Plex-style Music Library
 */
@HiltViewModel
class PlexMusicViewModel @Inject constructor(
    private val musicRepository: MusicRepository,
    private val musicPlayerService: AdvancedMusicPlayerService,
    private val lyricsService: LyricsService,
    private val lastFmService: LastFmScrobblerService,
    private val playlistRepository: PlaylistRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MusicLibraryState())
    val uiState: StateFlow<MusicLibraryState> = _uiState.asStateFlow()
    
    private val _nowPlaying = MutableStateFlow<MusicTrack?>(null)
    val nowPlaying: StateFlow<MusicTrack?> = _nowPlaying.asStateFlow()
    
    init {
        loadMusicLibrary()
        observeNowPlaying()
    }
    
    private fun loadMusicLibrary() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            combine(
                loadAlbums(),
                loadArtists(),
                loadTracks(),
                loadPlaylists(),
                loadGenres()
            ) { albums, artists, tracks, playlists, genres ->
                MusicLibraryState(
                    albums = albums,
                    artists = artists,
                    tracks = tracks,
                    playlists = playlists,
                    genres = genres,
                    isLoading = false
                )
            }.collect { state ->
                _uiState.value = state.copy(nowPlaying = _nowPlaying.value)
            }
        }
    }
    
    private fun observeNowPlaying() {
        viewModelScope.launch {
            musicPlayerService.currentTrack.collect { track ->
                val musicTrack = track?.let {
                    MusicTrack(
                        id = it.id.toString(),
                        title = it.title,
                        artist = it.artist,
                        album = it.album,
                        albumArtUrl = it.artworkPath,
                        duration = formatDuration(it.duration),
                        trackNumber = it.trackNumber,
                        playbackProgress = musicPlayerService.progress.value,
                        isPlaying = musicPlayerService.isPlaying.value
                    )
                }
                _nowPlaying.value = musicTrack
                _uiState.update { it.copy(nowPlaying = musicTrack) }
            }
        }
    }
    
    private fun loadAlbums(): Flow<List<MusicAlbum>> =
        musicRepository.getAllAlbums().map { albums ->
            albums.map { album ->
                MusicAlbum(
                    id = album.id.toString(),
                    title = album.title,
                    artist = album.artist,
                    artworkUrl = album.artworkPath,
                    year = album.year,
                    trackCount = album.trackCount,
                    duration = album.duration?.let { formatDuration(it) }
                )
            }
        }
    
    private fun loadArtists(): Flow<List<MusicArtist>> =
        musicRepository.getAllArtists().map { artists ->
            artists.map { artist ->
                MusicArtist(
                    id = artist.id.toString(),
                    name = artist.name,
                    imageUrl = artist.imageUrl,
                    albumCount = artist.albumCount,
                    trackCount = artist.trackCount
                )
            }
        }
    
    private fun loadTracks(): Flow<List<MusicTrack>> =
        musicRepository.getAllTracks().map { tracks ->
            tracks.map { track ->
                MusicTrack(
                    id = track.id.toString(),
                    title = track.title,
                    artist = track.artist,
                    album = track.album,
                    albumArtUrl = track.artworkPath,
                    duration = formatDuration(track.duration),
                    trackNumber = track.trackNumber
                )
            }
        }
    
    private fun loadPlaylists(): Flow<List<MusicPlaylist>> =
        playlistRepository.getMusicPlaylists().map { playlists ->
            playlists.map { playlist ->
                MusicPlaylist(
                    id = playlist.id.toString(),
                    name = playlist.name,
                    trackCount = playlist.trackCount,
                    artworkUrls = playlist.artworkUrls,
                    isUserCreated = playlist.isUserCreated
                )
            }
        }
    
    private fun loadGenres(): Flow<List<MusicGenre>> =
        musicRepository.getAllGenres().map { genres ->
            genres.mapIndexed { index, genre ->
                MusicGenre(
                    name = genre.name,
                    trackCount = genre.trackCount,
                    color = getGenreColor(index)
                )
            }
        }
    
    fun playAlbum(album: MusicAlbum) {
        viewModelScope.launch {
            val tracks = musicRepository.getAlbumTracks(album.id.toLong()).first()
            musicPlayerService.playQueue(tracks.map { it.id }, 0)
        }
    }
    
    fun playArtist(artist: MusicArtist) {
        viewModelScope.launch {
            val tracks = musicRepository.getArtistTracks(artist.id.toLong()).first()
            musicPlayerService.playQueue(tracks.map { it.id }, 0)
        }
    }
    
    fun playTrack(track: MusicTrack) {
        viewModelScope.launch {
            musicPlayerService.play(track.id.toLong())
        }
    }
    
    fun playPlaylist(playlist: MusicPlaylist) {
        viewModelScope.launch {
            val tracks = playlistRepository.getPlaylistTracks(playlist.id.toLong()).first()
            musicPlayerService.playQueue(tracks.map { it.id }, 0)
        }
    }
    
    fun shuffleAll() {
        viewModelScope.launch {
            val allTracks = musicRepository.getAllTracks().first()
            musicPlayerService.playQueue(allTracks.shuffled().map { it.id }, 0)
        }
    }
    
    private fun formatDuration(ms: Long): String {
        val seconds = (ms / 1000) % 60
        val minutes = (ms / (1000 * 60)) % 60
        val hours = ms / (1000 * 60 * 60)
        return if (hours > 0) {
            "%d:%02d:%02d".format(hours, minutes, seconds)
        } else {
            "%d:%02d".format(minutes, seconds)
        }
    }
    
    private fun getGenreColor(index: Int): androidx.compose.ui.graphics.Color {
        val colors = listOf(
            androidx.compose.ui.graphics.Color(0xFFE91E63),
            androidx.compose.ui.graphics.Color(0xFF9C27B0),
            androidx.compose.ui.graphics.Color(0xFF673AB7),
            androidx.compose.ui.graphics.Color(0xFF3F51B5),
            androidx.compose.ui.graphics.Color(0xFF2196F3),
            androidx.compose.ui.graphics.Color(0xFF00BCD4),
            androidx.compose.ui.graphics.Color(0xFF009688),
            androidx.compose.ui.graphics.Color(0xFF4CAF50),
            androidx.compose.ui.graphics.Color(0xFF8BC34A),
            androidx.compose.ui.graphics.Color(0xFFFF9800)
        )
        return colors[index % colors.size]
    }
}
