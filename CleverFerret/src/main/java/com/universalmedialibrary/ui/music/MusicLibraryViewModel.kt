package com.universalmedialibrary.ui.music

import android.content.ContentUris
import android.content.Context
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.MusicRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class MusicLibraryViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val musicRepository: MusicRepository,
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService
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

    private fun scanMusicFromMediaStore(): List<Track> {
        val songs = mutableListOf<Track>()
        
        val projection = mutableListOf(
            MediaStore.Audio.Media._ID,
            MediaStore.Audio.Media.TITLE,
            MediaStore.Audio.Media.ARTIST,
            MediaStore.Audio.Media.ALBUM,
            MediaStore.Audio.Media.ALBUM_ARTIST,
            MediaStore.Audio.Media.YEAR,
            MediaStore.Audio.Media.DURATION,
            MediaStore.Audio.Media.TRACK,
            MediaStore.Audio.Media.CD_TRACK_NUMBER,
            MediaStore.Audio.Media.BITRATE,
            MediaStore.Audio.Media.DATE_ADDED,
            MediaStore.Audio.Media.DATE_MODIFIED,
            MediaStore.Audio.Media.DATA,
            MediaStore.Audio.Media.MIME_TYPE
        )

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            projection.add(MediaStore.Audio.Media.GENRE)
        }
        
        val selection = "${MediaStore.Audio.Media.IS_MUSIC} != 0"
        val sortOrder = "${MediaStore.Audio.Media.TITLE} ASC"
        
        context.contentResolver.query(
            MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
            projection.toTypedArray(),
            selection,
            null,
            sortOrder
        )?.use { cursor ->
            val idCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media._ID)
            val titleCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE)
            val artistCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST)
            val albumCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.ALBUM)
            val albumArtistCol = cursor.getColumnIndex(MediaStore.Audio.Media.ALBUM_ARTIST)
            val genreCol = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                cursor.getColumnIndex(MediaStore.Audio.Media.GENRE)
            } else {
                -1
            }
            val yearCol = cursor.getColumnIndex(MediaStore.Audio.Media.YEAR)
            val durationCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.DURATION)
            val trackCol = cursor.getColumnIndex(MediaStore.Audio.Media.TRACK)
            val cdTrackCol = cursor.getColumnIndex(MediaStore.Audio.Media.CD_TRACK_NUMBER)
            val bitrateCol = cursor.getColumnIndex(MediaStore.Audio.Media.BITRATE)
            val dateAddedCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.DATE_ADDED)
            val dateModifiedCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.DATE_MODIFIED)
            val pathCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)
            val mimeCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.MIME_TYPE)
            
            while (cursor.moveToNext()) {
                val id = cursor.getLong(idCol)
                val title = cursor.getString(titleCol)
                val artist = cursor.getString(artistCol)
                val album = cursor.getString(albumCol)
                val albumArtist = if (albumArtistCol >= 0) cursor.getString(albumArtistCol) else null
                val genre = if (genreCol >= 0) cursor.getString(genreCol) else null
                val year = if (yearCol >= 0) cursor.getInt(yearCol).takeIf { it > 0 } else null
                val duration = cursor.getLong(durationCol)
                val track = if (trackCol >= 0) cursor.getInt(trackCol).takeIf { it > 0 } else null
                val cdTrack = if (cdTrackCol >= 0) cursor.getInt(cdTrackCol).takeIf { it > 0 } else null
                val bitrate = if (bitrateCol >= 0) cursor.getInt(bitrateCol).takeIf { it > 0 } else null
                val dateAdded = cursor.getLong(dateAddedCol)
                val dateModified = cursor.getLong(dateModifiedCol)
                val path = cursor.getString(pathCol)
                val mimeType = cursor.getString(mimeCol)
                
                val contentUri: Uri = ContentUris.withAppendedId(
                    MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                    id
                )
                
                songs.add(
                    Track(
                        id = id,
                        title = title,
                        artist = artist,
                        album = album,
                        albumArtist = albumArtist ?: artist,
                        genre = genre,
                        year = year,
                        duration = duration,
                        trackNumber = track ?: cdTrack,
                        discNumber = null, // DISC_NUMBER not widely supported
                        bitrate = bitrate,
                        dateAdded = dateAdded,
                        dateModified = dateModified,
                        uri = contentUri,
                        path = path,
                        mimeType = mimeType
                    )
                )
            }
        }
        
        return songs
    }

    private fun aggregateAlbums(tracks: List<Track>): List<Album> {
        if (tracks.isEmpty()) return emptyList()
        
        return try {
            tracks.groupBy { it.displayAlbum to it.albumArtist }
                .mapNotNull { (key, albumTracks) ->
                    if (albumTracks.isEmpty()) return@mapNotNull null
                    
                    val (albumName, artist) = key
                    Album(
                        name = albumName,
                        artist = artist,
                        year = albumTracks.mapNotNull { it.year }.minOrNull(),
                        trackCount = albumTracks.size,
                        tracks = albumTracks.sortedBy { it.trackNumber },
                        artworkUri = getAlbumArtUri(albumTracks.firstOrNull()?.id ?: 0)
                    )
                }
                .sortedBy { it.displayName.lowercase() }
        } catch (e: Exception) {
            emptyList()
        }
    }

    private fun aggregateArtists(tracks: List<Track>): List<Artist> {
        if (tracks.isEmpty()) return emptyList()
        
        return try {
            tracks.groupBy { it.displayArtist }
                .map { (artistName, artistTracks) ->
                    Artist(
                        name = artistName,
                        trackCount = artistTracks.size,
                        albumCount = artistTracks.map { it.displayAlbum }.distinct().size,
                        tracks = artistTracks
                    )
                }
                .sortedBy { it.displayName.lowercase() }
        } catch (e: Exception) {
            emptyList()
        }
    }

    private fun aggregateGenres(tracks: List<Track>): List<Genre> {
        if (tracks.isEmpty()) return emptyList()
        
        return try {
            tracks.groupBy { it.displayGenre }
                .map { (genreName, genreTracks) ->
                    Genre(
                        name = genreName,
                        trackCount = genreTracks.size,
                        tracks = genreTracks
                    )
                }
                .sortedBy { it.displayName.lowercase() }
        } catch (e: Exception) {
            emptyList()
        }
    }

    private fun getAlbumArtUri(trackId: Long): Uri? {
        return try {
            val artworkUri = Uri.parse("content://media/external/audio/albumart")
            ContentUris.withAppendedId(artworkUri, trackId)
        } catch (e: Exception) {
            null
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
                        albumArtUrl = null
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
                    albumArtUrl = null
                )
            } catch (e: Exception) {
                // Handle playback error
            }
        }
    }

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
                        albumArtUrl = null
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
                        albumArtUrl = null
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
                        albumArtUrl = null
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
                        albumArtUrl = null
                    )
                }
            } catch (e: Exception) {
                // Handle playback error
            }
        }
    }
}
