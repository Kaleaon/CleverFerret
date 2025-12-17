package com.universalmedialibrary.data.repository

import android.content.ContentUris
import android.content.Context
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import com.universalmedialibrary.ui.music.Album
import com.universalmedialibrary.ui.music.Artist
import com.universalmedialibrary.ui.music.Genre
import com.universalmedialibrary.ui.music.Track
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for music library data.
 * Provides centralized access to music tracks, albums, artists, and genres.
 * This enables data sharing between ViewModels and easy backup/export.
 */
@Singleton
class MusicRepository @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val _tracks = MutableStateFlow<List<Track>>(emptyList())
    val tracks: StateFlow<List<Track>> = _tracks.asStateFlow()
    
    private val _albums = MutableStateFlow<List<Album>>(emptyList())
    val albums: StateFlow<List<Album>> = _albums.asStateFlow()
    
    private val _artists = MutableStateFlow<List<Artist>>(emptyList())
    val artists: StateFlow<List<Artist>> = _artists.asStateFlow()
    
    private val _genres = MutableStateFlow<List<Genre>>(emptyList())
    val genres: StateFlow<List<Genre>> = _genres.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    /**
     * Scan music library from MediaStore
     */
    suspend fun scanLibrary() = withContext(Dispatchers.IO) {
        _isLoading.value = true
        
        try {
            val scannedTracks = scanMusicFromMediaStore()
            _tracks.value = scannedTracks
            
            _albums.value = aggregateAlbums(scannedTracks)
            _artists.value = aggregateArtists(scannedTracks)
            _genres.value = aggregateGenres(scannedTracks)
            
            _isLoading.value = false
        } catch (e: Exception) {
            // Handle scan error gracefully
            _tracks.value = emptyList()
            _albums.value = emptyList()
            _artists.value = emptyList()
            _genres.value = emptyList()
            _isLoading.value = false
            throw e
        }
    }
    
    /**
     * Get album by name
     */
    fun getAlbum(albumName: String): Album? {
        return _albums.value.find { it.name == albumName }
    }
    
    /**
     * Get artist by name
     */
    fun getArtist(artistName: String): Artist? {
        return _artists.value.find { it.name == artistName }
    }
    
    /**
     * Get genre by name
     */
    fun getGenre(genreName: String): Genre? {
        return _genres.value.find { it.name == genreName }
    }
    
    /**
     * Get albums by artist
     */
    fun getAlbumsByArtist(artistName: String): List<Album> {
        return _albums.value.filter { it.artist == artistName }
    }
    
    /**
     * Scan music from Android MediaStore
     */
    private fun scanMusicFromMediaStore(): List<Track> {
        val songs = mutableListOf<Track>()
        
        val projection = mutableListOf(
            MediaStore.Audio.Media._ID,
            MediaStore.Audio.Media.TITLE,
            MediaStore.Audio.Media.ARTIST,
            MediaStore.Audio.Media.ALBUM,
            MediaStore.Audio.Media.ALBUM_ID,
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
            val albumIdCol = cursor.getColumnIndex(MediaStore.Audio.Media.ALBUM_ID)
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
                val albumId = if (albumIdCol >= 0) cursor.getLong(albumIdCol) else null
                val genre = if (genreCol >= 0) cursor.getString(genreCol) else null
                val year = if (yearCol >= 0) cursor.getInt(yearCol) else null
                val duration = cursor.getLong(durationCol)
                val trackNumber = if (trackCol >= 0) cursor.getInt(trackCol) else null
                val discNumber = if (cdTrackCol >= 0) {
                    // Try to parse disc number from CD track number
                    val cdTrack = cursor.getString(cdTrackCol)
                    cdTrack?.split("/")?.firstOrNull()?.toIntOrNull()
                } else null
                val bitrate = if (bitrateCol >= 0) cursor.getInt(bitrateCol) else null
                val dateAdded = cursor.getLong(dateAddedCol)
                val dateModified = cursor.getLong(dateModifiedCol)
                val path = cursor.getString(pathCol)
                val mimeType = cursor.getString(mimeCol)
                
                val uri = ContentUris.withAppendedId(
                    MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                    id
                )
                
                songs.add(
                    Track(
                        id = id,
                        title = title,
                        artist = artist,
                        album = album,
                        albumId = albumId,
                        albumArtist = albumArtist,
                        genre = genre,
                        year = year,
                        duration = duration,
                        trackNumber = trackNumber,
                        discNumber = discNumber,
                        bitrate = bitrate,
                        dateAdded = dateAdded,
                        dateModified = dateModified,
                        uri = uri,
                        path = path,
                        mimeType = mimeType
                    )
                )
            }
        }
        
        return songs
    }
    
    /**
     * Aggregate tracks into albums
     */
    private fun aggregateAlbums(tracks: List<Track>): List<Album> {
        if (tracks.isEmpty()) return emptyList()
        
        return try {
            tracks.groupBy { it.album }
                .map { (albumName, albumTracks) ->
                    val sortedTracks = albumTracks.sortedBy { it.trackNumber }
                    val artist = albumTracks.firstOrNull()?.albumArtist 
                        ?: albumTracks.firstOrNull()?.artist 
                        ?: "Unknown Artist"
                    
                      Album(
                          name = albumName ?: "Unknown Album",
                          artist = artist,
                          trackCount = albumTracks.size,
                          year = albumTracks.mapNotNull { it.year }.maxOrNull(),
                          tracks = sortedTracks,
                          artworkUri = sortedTracks.firstOrNull()?.albumArtUri
                      )
                }
                .sortedBy { it.name }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Aggregate tracks into artists
     */
    private fun aggregateArtists(tracks: List<Track>): List<Artist> {
        if (tracks.isEmpty()) return emptyList()
        
        return try {
            tracks.groupBy { it.artist }
                .map { (artistName, artistTracks) ->
                    val albums = artistTracks.groupBy { it.album }.size
                    
                    Artist(
                        name = artistName ?: "Unknown Artist",
                        trackCount = artistTracks.size,
                        albumCount = albums,
                        tracks = artistTracks.sortedBy { it.title }
                    )
                }
                .sortedBy { it.name }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Aggregate tracks into genres
     */
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
                .sortedBy { it.name }
        } catch (e: Exception) {
            emptyList()
        }
    }
}
