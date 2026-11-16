package com.universalmedialibrary.ui.music

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.MusicRepository
import com.universalmedialibrary.services.playlist.MusicPlaylistManager
import com.universalmedialibrary.services.playlist.PlaylistOverview
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MusicLibraryViewModel @Inject constructor(
    private val musicRepository: MusicRepository,
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService,
    private val playlistManager: MusicPlaylistManager
) : ViewModel() {

    private val _uiState = MutableStateFlow(MusicLibraryUiState())
    val uiState: StateFlow<MusicLibraryUiState> = _uiState.asStateFlow()

    private var allTracks: List<Track> = emptyList()

    init {
        // Also observe repository for updates (future enhancement)
        viewModelScope.launch {
            musicRepository.tracks.collect { tracks ->
                if (tracks.isNotEmpty() && allTracks.isEmpty()) {
                    // Initial load from repository
                    allTracks = tracks
                    _uiState.value = _uiState.value.copy(
                        tracks = tracks,
                        albums = musicRepository.albums.value,
                        artists = musicRepository.artists.value,
                        genres = musicRepository.genres.value
                    )
                    applyFiltersAndSort()
                }
            }
        }

        viewModelScope.launch {
            playlistManager.getPlaylistOverviews().collect { overviews ->
                _uiState.value = _uiState.value.copy(
                    playlists = overviews.map { it.toSummary() }
                )
            }
        }
    }

    fun scan() {
        viewModelScope.launch(Dispatchers.IO) {
            _uiState.value = _uiState.value.copy(isLoading = true)
            
            try {
                // Use repository for scanning
                musicRepository.scanLibrary()
                
                // Get data from repository
                val tracks = musicRepository.tracks.value
                allTracks = tracks
                
                val albums = musicRepository.albums.value
                val artists = musicRepository.artists.value
                val genres = musicRepository.genres.value
                
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    tracks = tracks,
                    albums = albums,
                    artists = artists,
                    genres = genres
                )
                
                applyFiltersAndSort()
            } catch (e: Exception) {
                // Handle scan error gracefully
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    tracks = emptyList(),
                    albums = emptyList(),
                    artists = emptyList(),
                    genres = emptyList()
                )
            }
        }
    }

    fun setTab(tab: MusicTab) {
        _uiState.value = _uiState.value.copy(currentTab = tab)
        viewModelScope.launch(Dispatchers.Default) {
            applyFiltersAndSort()
        }
    }

    fun setSortOption(option: MusicSortOption) {
        _uiState.value = _uiState.value.copy(sortOption = option)
        viewModelScope.launch(Dispatchers.Default) {
            applyFiltersAndSort()
        }
    }

    fun setViewMode(mode: MusicViewMode) {
        _uiState.value = _uiState.value.copy(viewMode = mode)
    }

    fun setSearchQuery(query: String) {
        _uiState.value = _uiState.value.copy(searchQuery = query)
        // Run filtering on background thread to avoid UI hangs
        viewModelScope.launch(Dispatchers.Default) {
            applyFiltersAndSort()
        }
    }

    fun setGenreFilter(genre: String?) {
        _uiState.value = _uiState.value.copy(selectedGenre = genre)
        viewModelScope.launch(Dispatchers.Default) {
            applyFiltersAndSort()
        }
    }

    fun setArtistFilter(artist: String?) {
        _uiState.value = _uiState.value.copy(selectedArtist = artist)
        viewModelScope.launch(Dispatchers.Default) {
            applyFiltersAndSort()
        }
    }

    fun setAlbumFilter(album: String?) {
        _uiState.value = _uiState.value.copy(selectedAlbum = album)
        viewModelScope.launch(Dispatchers.Default) {
            applyFiltersAndSort()
        }
    }

    fun clearFilters() {
        _uiState.value = _uiState.value.copy(
            selectedGenre = null,
            selectedArtist = null,
            selectedAlbum = null,
            searchQuery = ""
        )
        viewModelScope.launch(Dispatchers.Default) {
            applyFiltersAndSort()
        }
    }

    fun toggleSortMenu() {
        _uiState.value = _uiState.value.copy(showSortMenu = !_uiState.value.showSortMenu)
    }

    fun toggleFilterMenu() {
        _uiState.value = _uiState.value.copy(showFilterMenu = !_uiState.value.showFilterMenu)
    }

    private fun applyFiltersAndSort() {
        try {
            var filtered = allTracks

            // Apply search filter
            val query = _uiState.value.searchQuery
            if (query.isNotBlank()) {
                filtered = filtered.filter { track ->
                    track.title?.contains(query, ignoreCase = true) == true ||
                    track.displayArtist.contains(query, ignoreCase = true) ||
                    track.displayAlbum.contains(query, ignoreCase = true) ||
                    track.displayGenre.contains(query, ignoreCase = true)
                }
            }

            // Apply filters
            _uiState.value.selectedGenre?.let { genre ->
                filtered = filtered.filter { it.displayGenre == genre }
            }
            
            _uiState.value.selectedArtist?.let { artist ->
                filtered = filtered.filter { it.displayArtist == artist }
            }
            
            _uiState.value.selectedAlbum?.let { album ->
                filtered = filtered.filter { it.displayAlbum == album }
            }

            // Apply sorting (with timeout protection for very large lists)
            val sorted = if (filtered.size > 10000) {
                // For huge libraries, use a simpler sort to avoid hangs
                filtered.take(10000).sortedWith(_uiState.value.sortOption.comparator())
            } else {
                filtered.sortedWith(_uiState.value.sortOption.comparator())
            }

            _uiState.value = _uiState.value.copy(tracks = sorted)
        } catch (e: Exception) {
            // If filtering/sorting fails, show unfiltered tracks
            _uiState.value = _uiState.value.copy(tracks = allTracks)
        }
    }

    fun playAll() {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val tracks = _uiState.value.tracks
                // Limit to 5000 tracks to prevent memory issues
                val limitedTracks = if (tracks.size > 5000) tracks.take(5000) else tracks
                if (limitedTracks.isNotEmpty()) {
                    // Play first track
                    val firstTrack = limitedTracks.first()
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

    fun playTrack(track: Track) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                musicPlayerService.playTrackFromUri(
                    uri = track.uri.toString(),
                    title = track.title ?: "Unknown",
                    artist = track.artist,
                    album = track.album,
                    duration = track.duration,
                    albumArtUrl = track.albumArtUri?.toString()
                )
            } catch (e: Exception) {
                // Handle playback error
            }
        }
    }

    fun createPlaylist(name: String, description: String? = null, isPublic: Boolean = false) {
        viewModelScope.launch(Dispatchers.IO) {
            playlistManager.createPlaylist(name = name, description = description, isPublic = isPublic)
        }
    }

    fun renamePlaylist(playlistId: Long, newName: String, description: String? = null) {
        viewModelScope.launch(Dispatchers.IO) {
            playlistManager.renamePlaylist(playlistId, newName, description)
        }
    }

    fun deletePlaylist(playlistId: Long) {
        viewModelScope.launch(Dispatchers.IO) {
            playlistManager.deletePlaylist(playlistId)
        }
    }

    fun playPlaylist(playlistId: Long, shuffle: Boolean = false) {
        viewModelScope.launch(Dispatchers.IO) {
            playlistManager.playPlaylist(playlistId, shuffle)
        }
    }

    fun queuePlaylist(playlistId: Long, playNext: Boolean = false) {
        viewModelScope.launch(Dispatchers.IO) {
            playlistManager.addPlaylistToQueue(playlistId, playNext)
        }
    }

    private fun PlaylistOverview.toSummary(): PlaylistSummary =
        PlaylistSummary(
            playlist = playlist,
            trackCount = trackCount
        )

    fun playAlbum(album: Album, startIndex: Int = 0) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val tracks = album.tracks
                if (tracks.isNotEmpty()) {
                    val trackToPlay = tracks.getOrNull(startIndex) ?: tracks.first()
                    musicPlayerService.playTrackFromUri(
                        uri = trackToPlay.uri.toString(),
                        title = trackToPlay.title ?: "Unknown",
                        artist = trackToPlay.artist,
                        album = trackToPlay.album,
                        duration = trackToPlay.duration,
                        albumArtUrl = trackToPlay.albumArtUri?.toString()
                    )
                }
            } catch (e: Exception) {
                // Handle playback error
            }
        }
    }

    fun playArtist(artist: Artist, shuffle: Boolean = false) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val tracks = if (shuffle) artist.tracks.shuffled() else artist.tracks
                // Limit to 1000 tracks for performance
                val limitedTracks = if (tracks.size > 1000) tracks.take(1000) else tracks
                if (limitedTracks.isNotEmpty()) {
                    val firstTrack = limitedTracks.first()
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

    fun playGenre(genre: Genre, shuffle: Boolean = false) {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val tracks = if (shuffle) genre.tracks.shuffled() else genre.tracks
                // Limit to 1000 tracks for performance
                val limitedTracks = if (tracks.size > 1000) tracks.take(1000) else tracks
                if (limitedTracks.isNotEmpty()) {
                    val firstTrack = limitedTracks.first()
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

    fun shuffleAll() {
        viewModelScope.launch(Dispatchers.IO) {
            try {
                val tracks = _uiState.value.tracks
                // Limit to 5000 tracks to prevent memory issues
                val limitedTracks = if (tracks.size > 5000) tracks.take(5000) else tracks
                val shuffledTracks = limitedTracks.shuffled()
                if (shuffledTracks.isNotEmpty()) {
                    val firstTrack = shuffledTracks.first()
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
}
