package com.universalmedialibrary.ui.oldtimeradio

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDao
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class OldTimeRadioPlayerViewModel @Inject constructor(
    private val oldTimeRadioDao: OldTimeRadioDao,
    private val audioPlaybackManager: AudioPlaybackManager
) : ViewModel() {

    fun playEpisode(episodeId: Long) {
        viewModelScope.launch {
            val episode = oldTimeRadioDao.getEpisodeById(episodeId) ?: return@launch
            
            val metadata = MediaMetadata.Builder()
                .setTitle(episode.displayTitle)
                .setArtist(episode.seriesTitle)
                .setAlbumTitle(episode.seriesTitle)
                .setReleaseYear(episode.originalAirDate?.take(4)?.toIntOrNull())
                .build()
                
            val uri = try {
                Uri.parse(episode.uri)
            } catch (e: Exception) {
                return@launch
            }

            audioPlaybackManager.loadSingle(uri, metadata, playWhenReady = true)
        }
    }
}
