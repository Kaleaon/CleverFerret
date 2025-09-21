package com.universalmedialibrary.ui.music

import android.content.ContentUris
import android.content.Context
import android.net.Uri
import android.provider.MediaStore
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * The view model for the music library screen.
 *
 * @param context The application context.
 * @param playback The audio playback manager.
 */
@HiltViewModel
class MusicLibraryViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val playback: AudioPlaybackManager
) : ViewModel() {

    private val _uiState = MutableStateFlow(MusicLibraryUiState())
    /** The UI state for the music library screen. */
    val uiState: StateFlow<MusicLibraryUiState> = _uiState.asStateFlow()

    /**
     * Scans the device for music files.
     */
    fun scan() {
        viewModelScope.launch(Dispatchers.IO) {
            val songs = mutableListOf<Track>()
            val projection = arrayOf(
                MediaStore.Audio.Media._ID,
                MediaStore.Audio.Media.TITLE,
                MediaStore.Audio.Media.ARTIST,
                MediaStore.Audio.Media.ALBUM
            )
            val selection = MediaStore.Audio.Media.IS_MUSIC + "!= 0"
            val sortOrder = MediaStore.Audio.Media.TITLE + " ASC"
            context.contentResolver.query(
                MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                projection,
                selection,
                null,
                sortOrder
            )?.use { cursor ->
                val idCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media._ID)
                val titleCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE)
                val artistCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST)
                val albumCol = cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.ALBUM)
                while (cursor.moveToNext()) {
                    val id = cursor.getLong(idCol)
                    val title = cursor.getString(titleCol)
                    val artist = cursor.getString(artistCol)
                    val album = cursor.getString(albumCol)
                    val contentUri: Uri = ContentUris.withAppendedId(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, id)
                    songs.add(Track(title, artist, album, contentUri))
                }
            }
            _uiState.value = _uiState.value.copy(
                isLoading = false,
                tracks = songs,
                artists = songs.groupBy { it.artist ?: "Unknown" }.keys.sorted(),
                albums = songs.groupBy { it.album ?: "Unknown" }.keys.sorted()
            )
        }
    }

    /**
     * Plays all the tracks in the library.
     */
    fun playAll() {
        val uris = _uiState.value.tracks.map { it.uri }
        playback.setQueue(uris, 0, true)
    }

    /**
     * Plays a single track.
     * @param track The track to play.
     */
    fun playTrack(track: Track) {
        playback.loadSingle(track.uri)
    }
}

/**
 * Represents the UI state for the music library screen.
 *
 * @property isLoading Whether the screen is currently loading.
 * @property tracks The list of tracks in the library.
 * @property artists The list of artists in the library.
 * @property albums The list of albums in the library.
 */
data class MusicLibraryUiState(
    val isLoading: Boolean = true,
    val tracks: List<Track> = emptyList(),
    val artists: List<String> = emptyList(),
    val albums: List<String> = emptyList()
)

/**
 * Represents a single music track.
 *
 * @property title The title of the track.
 * @property artist The artist of the track.
 * @property album The album the track belongs to.
 * @property uri The URI of the track's audio file.
 */
data class Track(
    val title: String?,
    val artist: String?,
    val album: String?,
    val uri: Uri
)