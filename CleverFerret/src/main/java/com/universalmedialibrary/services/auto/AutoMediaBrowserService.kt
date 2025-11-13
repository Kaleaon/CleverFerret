package com.universalmedialibrary.services.auto

import android.net.Uri
import android.os.Bundle
import android.support.v4.media.MediaBrowserCompat
import android.support.v4.media.MediaDescriptionCompat
import android.support.v4.media.MediaMetadataCompat
import android.support.v4.media.session.MediaSessionCompat
import android.support.v4.media.session.PlaybackStateCompat
import androidx.core.net.toUri
import androidx.media.MediaBrowserServiceCompat
import com.universalmedialibrary.R
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.coroutines.flow.first
import javax.inject.Inject

/**
 * Android Auto MediaBrowserService
 * 
 * Provides media browsing and playback control for Android Auto
 */
@AndroidEntryPoint
class AutoMediaBrowserService : MediaBrowserServiceCompat() {

    @Inject
    lateinit var mediaItemDao: MediaItemDao

    @Inject
    lateinit var exoPlayerService: ExoPlayerService
    
    @Inject
    lateinit var musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService

    private lateinit var mediaSession: MediaSessionCompat
    private val serviceJob = SupervisorJob()
    private val serviceScope = CoroutineScope(Dispatchers.Main + serviceJob)

    companion object {
        private const val TAG = "AutoMediaBrowserService"
        
        // Media IDs
        const val MEDIA_ID_ROOT = "__ROOT__"
        const val MEDIA_ID_MUSIC = "__MUSIC__"
        const val MEDIA_ID_AUDIOBOOKS = "__AUDIOBOOKS__"
        const val MEDIA_ID_PODCASTS = "__PODCASTS__"
        const val MEDIA_ID_PLAYLISTS = "__PLAYLISTS__"
        const val MEDIA_ID_RECENT = "__RECENT__"
        const val MEDIA_ID_FAVORITES = "__FAVORITES__"
    }

    override fun onCreate() {
        super.onCreate()

        // Create MediaSession
        mediaSession = MediaSessionCompat(this, TAG).apply {
            setFlags(
                MediaSessionCompat.FLAG_HANDLES_MEDIA_BUTTONS or
                MediaSessionCompat.FLAG_HANDLES_TRANSPORT_CONTROLS
            )
            setCallback(MediaSessionCallback())
            setPlaybackState(
                PlaybackStateCompat.Builder()
                    .setState(PlaybackStateCompat.STATE_NONE, 0, 1.0f)
                    .setActions(
                        PlaybackStateCompat.ACTION_PLAY or
                        PlaybackStateCompat.ACTION_PAUSE or
                        PlaybackStateCompat.ACTION_SKIP_TO_NEXT or
                        PlaybackStateCompat.ACTION_SKIP_TO_PREVIOUS or
                        PlaybackStateCompat.ACTION_STOP
                    )
                    .build()
            )
            isActive = true
        }

        sessionToken = mediaSession.sessionToken
    }

    override fun onDestroy() {
        super.onDestroy()
        serviceJob.cancel()
        mediaSession.release()
    }

    override fun onGetRoot(
        clientPackageName: String,
        clientUid: Int,
        rootHints: Bundle?
    ): BrowserRoot {
        // Allow all clients to browse
        return BrowserRoot(MEDIA_ID_ROOT, null)
    }

    override fun onLoadChildren(
        parentId: String,
        result: Result<MutableList<MediaBrowserCompat.MediaItem>>
    ) {
        result.detach()

        serviceScope.launch {
            try {
                val items = when (parentId) {
                    MEDIA_ID_ROOT -> getRootMenu()
                    MEDIA_ID_MUSIC -> getMusicItems()
                    MEDIA_ID_AUDIOBOOKS -> getAudiobookItems()
                    MEDIA_ID_PODCASTS -> getPodcastItems()
                    MEDIA_ID_RECENT -> getRecentItems()
                    MEDIA_ID_FAVORITES -> getFavoriteItems()
                    else -> {
                        // Load specific item by ID
                        if (parentId.startsWith("item_")) {
                            val itemId = parentId.removePrefix("item_").toLongOrNull()
                            itemId?.let { getMediaItemById(it) } ?: emptyList()
                        } else {
                            emptyList()
                        }
                    }
                }
                result.sendResult(items.toMutableList())
            } catch (e: Exception) {
                result.sendResult(mutableListOf())
            }
        }
    }

    private fun getRootMenu(): List<MediaBrowserCompat.MediaItem> {
        return listOf(
            createBrowsableMediaItem(
                MEDIA_ID_RECENT,
                "Recently Played",
                "Your recent media",
                null
            ),
            createBrowsableMediaItem(
                MEDIA_ID_FAVORITES,
                "Favorites",
                "Your favorite items",
                null
            ),
            createBrowsableMediaItem(
                MEDIA_ID_MUSIC,
                "Music",
                "Music library",
                null
            ),
            createBrowsableMediaItem(
                MEDIA_ID_AUDIOBOOKS,
                "Audiobooks",
                "Audiobook library",
                null
            ),
            createBrowsableMediaItem(
                MEDIA_ID_PODCASTS,
                "Podcasts",
                "Podcast library",
                null
            )
        )
    }

    private suspend fun getMusicItems(): List<MediaBrowserCompat.MediaItem> {
        val items = withContext(Dispatchers.IO) {
            mediaItemDao.searchMediaItems("AUDIO", limit = 100)
        }
        return items.filter { it.mediaType == "AUDIO" || it.mediaType == "MUSIC_TRACK" }
            .map { createPlayableMediaItem(it) }
    }

    private suspend fun getAudiobookItems(): List<MediaBrowserCompat.MediaItem> {
        val items = withContext(Dispatchers.IO) {
            mediaItemDao.searchMediaItems("AUDIOBOOK", limit = 100)
        }
        return items.filter { it.mediaType == "AUDIOBOOK" }
            .map { createPlayableMediaItem(it) }
    }

    private suspend fun getPodcastItems(): List<MediaBrowserCompat.MediaItem> {
        val items = withContext(Dispatchers.IO) {
            mediaItemDao.searchMediaItems("PODCAST", limit = 100)
        }
        return items.filter { it.mediaType == "PODCAST" }
            .map { createPlayableMediaItem(it) }
    }

    private suspend fun getRecentItems(): List<MediaBrowserCompat.MediaItem> {
        val items = withContext(Dispatchers.IO) {
            mediaItemDao.getAllMediaItems().take(50)
        }
        return items.map { createPlayableMediaItem(it) }
    }

    private suspend fun getFavoriteItems(): List<MediaBrowserCompat.MediaItem> {
        val favorites = withContext(Dispatchers.IO) {
            mediaItemDao.getFavoriteMediaItems().first()
        }
        if (favorites.isEmpty()) {
            return emptyList()
        }
        return favorites.map { createPlayableMediaItem(it) }
    }

    private suspend fun getMediaItemById(itemId: Long): List<MediaBrowserCompat.MediaItem> {
        val item = withContext(Dispatchers.IO) {
            mediaItemDao.getMediaItemById(itemId)
        }
        return item?.let { listOf(createPlayableMediaItem(it)) } ?: emptyList()
    }

    private fun createBrowsableMediaItem(
        mediaId: String,
        title: String,
        subtitle: String,
        iconUri: Uri?
    ): MediaBrowserCompat.MediaItem {
        val description = MediaDescriptionCompat.Builder()
            .setMediaId(mediaId)
            .setTitle(title)
            .setSubtitle(subtitle)
            .setIconUri(iconUri)
            .build()

        return MediaBrowserCompat.MediaItem(
            description,
            MediaBrowserCompat.MediaItem.FLAG_BROWSABLE
        )
    }

    private fun createPlayableMediaItem(mediaItem: MediaItem): MediaBrowserCompat.MediaItem {
        val description = MediaDescriptionCompat.Builder()
            .setMediaId("item_${mediaItem.itemId}")
            .setTitle(mediaItem.title.ifBlank { mediaItem.fileName })
            .setSubtitle(mediaItem.creator ?: mediaItem.mediaType)
            .setMediaUri(mediaItem.filePath.toUri())
            .setIconUri(
                Uri.parse("android.resource://${packageName}/${R.drawable.ic_ferret_blue_bitmap}")
            )
            .setExtras(Bundle().apply {
                putLong("itemId", mediaItem.itemId)
                putString("mediaType", mediaItem.mediaType)
                putLong("fileSize", mediaItem.fileSize)
            })
            .build()

        return MediaBrowserCompat.MediaItem(
            description,
            MediaBrowserCompat.MediaItem.FLAG_PLAYABLE
        )
    }

    private inner class MediaSessionCallback : MediaSessionCompat.Callback() {

        override fun onPlay() {
            exoPlayerService.play()
            updatePlaybackState(PlaybackStateCompat.STATE_PLAYING)
        }

        override fun onPause() {
            exoPlayerService.pause()
            updatePlaybackState(PlaybackStateCompat.STATE_PAUSED)
        }

        override fun onStop() {
            exoPlayerService.stop()
            updatePlaybackState(PlaybackStateCompat.STATE_STOPPED)
        }

        override fun onSkipToNext() {
            // Use the music player's queue management
            musicPlayerService.skipNext()
            updatePlaybackState(PlaybackStateCompat.STATE_SKIPPING_TO_NEXT)
        }

        override fun onSkipToPrevious() {
            // Use the music player's queue management
            musicPlayerService.skipPrevious()
            updatePlaybackState(PlaybackStateCompat.STATE_SKIPPING_TO_PREVIOUS)
        }

        override fun onPlayFromSearch(query: String?, extras: Bundle?) {
            // Handle voice search from Android Auto
            if (query.isNullOrBlank()) {
                // Play last played or random content
                onPlay()
                return
            }
            
            // Search and play matching media
            serviceScope.launch {
                try {
                    val searchResults = mediaItemDao.searchMediaItems(query, limit = 1)
                    if (searchResults.isNotEmpty()) {
                        val item = searchResults.first()
                        exoPlayerService.loadMediaWithSession(
                            mediaPath = item.filePath,
                            title = item.fileName
                        )
                        updateMediaMetadata(item)
                        updatePlaybackState(PlaybackStateCompat.STATE_PLAYING)
                    } else {
                        // No results, play something random
                        onPlay()
                    }
                } catch (e: Exception) {
                    // Fallback to just playing
                    onPlay()
                }
            }
        }

        override fun onSeekTo(pos: Long) {
            exoPlayerService.seekTo(pos)
            updatePlaybackState(PlaybackStateCompat.STATE_PLAYING)
        }

        override fun onPlayFromMediaId(mediaId: String?, extras: Bundle?) {
            mediaId?.let {
                if (it.startsWith("item_")) {
                    val itemId = it.removePrefix("item_").toLongOrNull()
                    itemId?.let { id ->
                        serviceScope.launch {
                            val item = mediaItemDao.getMediaItemById(id)
                            item?.let { mediaItem ->
                                // Load and play the item
                                exoPlayerService.loadMediaWithSession(
                                    mediaPath = mediaItem.filePath,
                                    title = mediaItem.fileName
                                )
                                updateMediaMetadata(mediaItem)
                                updatePlaybackState(PlaybackStateCompat.STATE_PLAYING)
                            }
                        }
                    }
                }
            }
        }

        override fun onPlayFromUri(uri: Uri?, extras: Bundle?) {
            uri?.let {
                exoPlayerService.loadMediaWithSession(
                    mediaPath = it.toString(),
                    title = "Media"
                )
                updatePlaybackState(PlaybackStateCompat.STATE_PLAYING)
            }
        }

        private fun updatePlaybackState(state: Int) {
            val position = exoPlayerService.getCurrentPosition()
            val playbackState = PlaybackStateCompat.Builder()
                .setState(state, position, 1.0f)
                .setActions(
                    PlaybackStateCompat.ACTION_PLAY or
                    PlaybackStateCompat.ACTION_PAUSE or
                    PlaybackStateCompat.ACTION_SKIP_TO_NEXT or
                    PlaybackStateCompat.ACTION_SKIP_TO_PREVIOUS or
                    PlaybackStateCompat.ACTION_STOP or
                    PlaybackStateCompat.ACTION_SEEK_TO
                )
                .build()

            mediaSession.setPlaybackState(playbackState)
        }

        private fun updateMediaMetadata(mediaItem: MediaItem) {
            val metadata = MediaMetadataCompat.Builder()
                .putString(MediaMetadataCompat.METADATA_KEY_MEDIA_ID, "item_${mediaItem.itemId}")
                .putString(MediaMetadataCompat.METADATA_KEY_TITLE, mediaItem.fileName)
                .putString(MediaMetadataCompat.METADATA_KEY_DISPLAY_TITLE, mediaItem.fileName)
                .putString(MediaMetadataCompat.METADATA_KEY_DISPLAY_SUBTITLE, "CleverFerret")
                .build()

            mediaSession.setMetadata(metadata)
        }
    }
}
