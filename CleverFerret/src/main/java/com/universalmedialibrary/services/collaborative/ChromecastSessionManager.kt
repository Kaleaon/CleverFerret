package com.universalmedialibrary.services.collaborative

import android.content.Context
import com.google.android.gms.cast.Cast
import com.google.android.gms.cast.CastDevice
import com.google.android.gms.cast.MediaInfo
import com.google.android.gms.cast.MediaLoadRequestData
import com.google.android.gms.cast.MediaMetadata
import com.google.android.gms.cast.MediaQueueItem
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.CastSession
import com.google.android.gms.cast.framework.SessionManagerListener
import com.google.android.gms.common.api.PendingResult
import com.google.android.gms.common.images.WebImage
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.CollaborativeSession
import com.universalmedialibrary.data.local.entity.SessionQueueItem
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manager for Chromecast integration with collaborative sessions
 * Handles casting media to Chromecast devices and syncing queue
 */
@Singleton
class ChromecastSessionManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaItemDao: MediaItemDao,
    private val collaborativeService: CollaborativeSessionService
) {
    private var castContext: CastContext? = null
    private var currentCastSession: CastSession? = null
    private var activeCollaborativeSession: CollaborativeSession? = null

    /**
     * Initialize Chromecast context
     */
    fun initialize() {
        try {
            castContext = CastContext.getSharedInstance(context)
            setupSessionListener()
        } catch (e: Exception) {
            // Chromecast not available
        }
    }

    /**
     * Setup session listener for Chromecast state changes
     */
    private fun setupSessionListener() {
        castContext?.sessionManager?.addSessionManagerListener(
            object : SessionManagerListener<CastSession> {
                override fun onSessionStarted(session: CastSession, sessionId: String) {
                    currentCastSession = session
                    // Update collaborative session with cast session ID
                    activeCollaborativeSession?.let { collabSession ->
                        // Would need to call suspend function here
                    }
                }

                override fun onSessionEnded(session: CastSession, error: Int) {
                    currentCastSession = null
                }

                override fun onSessionResumed(session: CastSession, wasSuspended: Boolean) {
                    currentCastSession = session
                }

                override fun onSessionSuspended(session: CastSession, reason: Int) {
                    // Handle session suspension
                }

                override fun onSessionStarting(session: CastSession) {
                    // Handle session starting
                }

                override fun onSessionStartFailed(session: CastSession, error: Int) {
                    // Handle session start failure
                }

                override fun onSessionEnding(session: CastSession) {
                    // Handle session ending
                }

                override fun onSessionResuming(session: CastSession, sessionId: String) {
                    // Handle session resuming
                }

                override fun onSessionResumeFailed(session: CastSession, error: Int) {
                    // Handle session resume failure
                }
            },
            CastSession::class.java
        )
    }

    /**
     * Start casting a collaborative session
     */
    suspend fun startCasting(session: CollaborativeSession) {
        activeCollaborativeSession = session
        val castSession = currentCastSession ?: return

        // Get queue items
        val queueItems = collaborativeService.getQueue(session.sessionId).first()
        if (queueItems.isEmpty()) return

        // Build media queue
        val mediaQueue = buildMediaQueue(queueItems)
        
        // Load queue to Chromecast
        val remoteMediaClient = castSession.remoteMediaClient
        remoteMediaClient?.load(
            MediaLoadRequestData.Builder()
                .setQueueData(
                    com.google.android.gms.cast.MediaQueueData.Builder()
                        .setItems(mediaQueue)
                        .setStartIndex(session.currentTrackIndex)
                        .build()
                )
                .build()
        )
    }

    /**
     * Build media queue from queue items
     */
    private suspend fun buildMediaQueue(queueItems: List<SessionQueueItem>): List<MediaQueueItem> {
        return queueItems.mapNotNull { item ->
            val mediaItem = mediaItemDao.getMediaItemById(item.mediaItemId)
                ?: return@mapNotNull null

            val metadata = MediaMetadata(MediaMetadata.MEDIA_TYPE_MUSIC_TRACK).apply {
                putString(MediaMetadata.KEY_TITLE, mediaItem.fileName)
                // For local files, we'd need to serve them via HTTP
                // For now, skip local files in casting
            }

            val mediaInfo = MediaInfo.Builder(mediaItem.filePath)
                .setMetadata(metadata)
                .setStreamType(MediaInfo.STREAM_TYPE_BUFFERED)
                .setContentType("audio/mp3") // Would need to detect actual type
                .build()

            MediaQueueItem.Builder(mediaInfo).build()
        }
    }

    /**
     * Add track to cast queue
     */
    suspend fun addTrackToQueue(queueItem: SessionQueueItem) {
        val castSession = currentCastSession ?: return
        val mediaItem = mediaItemDao.getMediaItemById(queueItem.mediaItemId) ?: return

        val metadata = MediaMetadata(MediaMetadata.MEDIA_TYPE_MUSIC_TRACK).apply {
            putString(MediaMetadata.KEY_TITLE, mediaItem.fileName)
        }

        val mediaInfo = MediaInfo.Builder(mediaItem.filePath)
            .setMetadata(metadata)
            .setStreamType(MediaInfo.STREAM_TYPE_BUFFERED)
            .setContentType("audio/mp3")
            .build()

        val mediaQueueItem = MediaQueueItem.Builder(mediaInfo).build()
        
        castSession.remoteMediaClient?.queueInsertItems(
            arrayOf(mediaQueueItem),
            MediaQueueItem.INVALID_ITEM_ID,
            null
        )
    }

    /**
     * Play/pause casting
     */
    fun togglePlayback() {
        val remoteMediaClient = currentCastSession?.remoteMediaClient
        if (remoteMediaClient?.isPlaying == true) {
            remoteMediaClient.pause()
        } else {
            remoteMediaClient?.play()
        }
    }

    /**
     * Skip to next track
     */
    fun skipToNext() {
        currentCastSession?.remoteMediaClient?.queueNext(null)
    }

    /**
     * Skip to previous track
     */
    fun skipToPrevious() {
        currentCastSession?.remoteMediaClient?.queuePrev(null)
    }

    /**
     * Get current Chromecast device
     */
    fun getCurrentDevice(): CastDevice? {
        return currentCastSession?.castDevice
    }

    /**
     * Check if currently casting
     */
    fun isCasting(): Boolean {
        return currentCastSession != null && currentCastSession?.remoteMediaClient != null
    }

    /**
     * Stop casting
     */
    fun stopCasting() {
        currentCastSession?.remoteMediaClient?.stop()
        activeCollaborativeSession = null
    }
}
