package com.universalmedialibrary.services.notification

import android.content.Context
import android.graphics.Bitmap
import android.support.v4.media.MediaMetadataCompat
import android.support.v4.media.session.MediaSessionCompat
import android.support.v4.media.session.PlaybackStateCompat
import com.universalmedialibrary.data.MediaType
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Lock Screen Media Controller
 * Manages media session for lock screen controls across all media types
 */
@Singleton
class LockScreenMediaController @Inject constructor(
    private val context: Context
) {
    private var mediaSession: MediaSessionCompat? = null
    private var currentMediaType: MediaType? = null

    fun initializeSession(mediaType: MediaType, tag: String = "UniversalMediaSession") {
        if (mediaSession == null || currentMediaType != mediaType) {
            mediaSession?.release()
            mediaSession = MediaSessionCompat(context, tag).apply {
                setFlags(
                    MediaSessionCompat.FLAG_HANDLES_MEDIA_BUTTONS or
                    MediaSessionCompat.FLAG_HANDLES_TRANSPORT_CONTROLS
                )
                isActive = true
            }
            currentMediaType = mediaType
        }
    }

    fun updateMusicMetadata(
        title: String,
        artist: String,
        album: String,
        albumArt: Bitmap?,
        duration: Long
    ) {
        mediaSession?.setMetadata(
            MediaMetadataCompat.Builder()
                .putString(MediaMetadataCompat.METADATA_KEY_TITLE, title)
                .putString(MediaMetadataCompat.METADATA_KEY_ARTIST, artist)
                .putString(MediaMetadataCompat.METADATA_KEY_ALBUM, album)
                .putBitmap(MediaMetadataCompat.METADATA_KEY_ALBUM_ART, albumArt)
                .putLong(MediaMetadataCompat.METADATA_KEY_DURATION, duration)
                .build()
        )
    }

    fun updateAudiobookMetadata(
        title: String,
        author: String,
        chapter: String,
        coverArt: Bitmap?,
        duration: Long,
        position: Long
    ) {
        mediaSession?.setMetadata(
            MediaMetadataCompat.Builder()
                .putString(MediaMetadataCompat.METADATA_KEY_TITLE, title)
                .putString(MediaMetadataCompat.METADATA_KEY_ARTIST, author)
                .putString(MediaMetadataCompat.METADATA_KEY_ALBUM, chapter)
                .putBitmap(MediaMetadataCompat.METADATA_KEY_ALBUM_ART, coverArt)
                .putLong(MediaMetadataCompat.METADATA_KEY_DURATION, duration)
                .build()
        )
    }

    fun updatePodcastMetadata(
        episodeTitle: String,
        podcastName: String,
        description: String,
        coverArt: Bitmap?,
        duration: Long
    ) {
        mediaSession?.setMetadata(
            MediaMetadataCompat.Builder()
                .putString(MediaMetadataCompat.METADATA_KEY_TITLE, episodeTitle)
                .putString(MediaMetadataCompat.METADATA_KEY_ARTIST, podcastName)
                .putString(MediaMetadataCompat.METADATA_KEY_ALBUM, description)
                .putBitmap(MediaMetadataCompat.METADATA_KEY_ALBUM_ART, coverArt)
                .putLong(MediaMetadataCompat.METADATA_KEY_DURATION, duration)
                .build()
        )
    }

    fun updateRadioMetadata(
        stationName: String,
        genre: String,
        nowPlaying: String?,
        stationLogo: Bitmap?
    ) {
        mediaSession?.setMetadata(
            MediaMetadataCompat.Builder()
                .putString(MediaMetadataCompat.METADATA_KEY_TITLE, stationName)
                .putString(MediaMetadataCompat.METADATA_KEY_ARTIST, genre)
                .putString(MediaMetadataCompat.METADATA_KEY_ALBUM, nowPlaying ?: "Live")
                .putBitmap(MediaMetadataCompat.METADATA_KEY_ALBUM_ART, stationLogo)
                .build()
        )
    }

    fun updateTTSMetadata(
        bookTitle: String,
        sentenceInfo: String,
        coverArt: Bitmap?
    ) {
        mediaSession?.setMetadata(
            MediaMetadataCompat.Builder()
                .putString(MediaMetadataCompat.METADATA_KEY_TITLE, bookTitle)
                .putString(MediaMetadataCompat.METADATA_KEY_ARTIST, "Text-to-Speech")
                .putString(MediaMetadataCompat.METADATA_KEY_ALBUM, sentenceInfo)
                .putBitmap(MediaMetadataCompat.METADATA_KEY_ALBUM_ART, coverArt)
                .build()
        )
    }

    fun updateVideoMetadata(
        title: String,
        subtitle: String?,
        thumbnail: Bitmap?,
        duration: Long
    ) {
        mediaSession?.setMetadata(
            MediaMetadataCompat.Builder()
                .putString(MediaMetadataCompat.METADATA_KEY_TITLE, title)
                .putString(MediaMetadataCompat.METADATA_KEY_ARTIST, subtitle ?: "Video")
                .putBitmap(MediaMetadataCompat.METADATA_KEY_ALBUM_ART, thumbnail)
                .putLong(MediaMetadataCompat.METADATA_KEY_DURATION, duration)
                .build()
        )
    }

    fun updatePlaybackState(
        state: Int,
        position: Long = 0L,
        playbackSpeed: Float = 1.0f,
        actions: Long = getDefaultActions()
    ) {
        mediaSession?.setPlaybackState(
            PlaybackStateCompat.Builder()
                .setState(state, position, playbackSpeed)
                .setActions(actions)
                .build()
        )
    }

    private fun getDefaultActions(): Long {
        return PlaybackStateCompat.ACTION_PLAY or
                PlaybackStateCompat.ACTION_PAUSE or
                PlaybackStateCompat.ACTION_PLAY_PAUSE or
                PlaybackStateCompat.ACTION_STOP or
                PlaybackStateCompat.ACTION_SKIP_TO_NEXT or
                PlaybackStateCompat.ACTION_SKIP_TO_PREVIOUS or
                PlaybackStateCompat.ACTION_SEEK_TO or
                PlaybackStateCompat.ACTION_FAST_FORWARD or
                PlaybackStateCompat.ACTION_REWIND
    }

    fun setCallback(callback: MediaSessionCompat.Callback) {
        mediaSession?.setCallback(callback)
    }

    fun getSession(): MediaSessionCompat? = mediaSession

    fun release() {
        mediaSession?.release()
        mediaSession = null
        currentMediaType = null
    }

    fun isActive(): Boolean = mediaSession?.isActive == true
}
