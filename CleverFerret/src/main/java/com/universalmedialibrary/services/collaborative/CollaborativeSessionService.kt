package com.universalmedialibrary.services.collaborative

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Color
import com.google.zxing.BarcodeFormat
import com.google.zxing.qrcode.QRCodeWriter
import com.universalmedialibrary.data.local.dao.CollaborativeSessionDao
import com.universalmedialibrary.data.local.entity.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

/**
 * Service for managing collaborative playlist sessions
 * Handles session creation, QR code generation, and client management
 */
@Singleton
class CollaborativeSessionService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val sessionDao: CollaborativeSessionDao
) {
    private val json = Json { ignoreUnknownKeys = true }

    /**
     * Create a new collaborative session
     */
    suspend fun createSession(
        name: String,
        playlistId: Long,
        sessionType: SessionType,
        hostDeviceId: String,
        hostDeviceName: String,
        options: SessionOptions = SessionOptions()
    ): CollaborativeSession {
        val sessionId = UUID.randomUUID().toString()
        val connectionData = SessionConnectionData(
            sessionId = sessionId,
            hostDevice = hostDeviceName,
            port = options.port
        )
        val qrCodeData = json.encodeToString(connectionData)

        val session = CollaborativeSession(
            sessionId = sessionId,
            name = name,
            playlistId = playlistId,
            hostDeviceId = hostDeviceId,
            hostDeviceName = hostDeviceName,
            sessionType = sessionType,
            status = SessionStatus.CREATED,
            maxClients = options.maxClients,
            allowClientAdditions = options.allowClientAdditions,
            allowClientVoting = options.allowClientVoting,
            requiresApproval = options.requiresApproval,
            qrCodeData = qrCodeData,
            connectionPort = options.port
        )

        sessionDao.insertSession(session)
        return session
    }

    /**
     * Start a session
     */
    suspend fun startSession(sessionId: String) {
        val session = sessionDao.getSession(sessionId).first()
        session?.let {
            sessionDao.updateSession(
                it.copy(
                    status = SessionStatus.ACTIVE,
                    startedAt = System.currentTimeMillis()
                )
            )
        }
    }

    /**
     * End a session
     */
    suspend fun endSession(sessionId: String) {
        val session = sessionDao.getSession(sessionId).first()
        session?.let {
            sessionDao.updateSession(
                it.copy(
                    status = SessionStatus.ENDED,
                    endedAt = System.currentTimeMillis()
                )
            )
        }
        // Disconnect all clients
        sessionDao.disconnectInactiveClients(sessionId, System.currentTimeMillis())
    }

    /**
     * Generate QR code bitmap for session
     */
    fun generateQRCode(session: CollaborativeSession, size: Int = 512): Bitmap {
        val qrData = session.qrCodeData ?: throw IllegalStateException("Session has no QR code data")
        
        val writer = QRCodeWriter()
        val bitMatrix = writer.encode(qrData, BarcodeFormat.QR_CODE, size, size)
        
        val bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.RGB_565)
        for (x in 0 until size) {
            for (y in 0 until size) {
                bitmap.setPixel(x, y, if (bitMatrix[x, y]) Color.BLACK else Color.WHITE)
            }
        }
        return bitmap
    }

    /**
     * Join a session as a client
     */
    suspend fun joinSession(
        sessionId: String,
        deviceName: String,
        deviceType: String
    ): SessionClient {
        val session = sessionDao.getSession(sessionId).first()
            ?: throw IllegalArgumentException("Session not found")

        if (session.status != SessionStatus.ACTIVE) {
            throw IllegalStateException("Session is not active")
        }

        val connectedCount = sessionDao.getConnectedClientCount(sessionId)
        if (connectedCount >= session.maxClients) {
            throw IllegalStateException("Session is full")
        }

        val clientId = UUID.randomUUID().toString()
        val permissions = ClientPermissions(
            canAddTracks = session.allowClientAdditions,
            canVote = session.allowClientVoting
        )

        val client = SessionClient(
            clientId = clientId,
            sessionId = sessionId,
            deviceName = deviceName,
            deviceType = deviceType,
            permissions = permissions
        )

        sessionDao.insertClient(client)
        return client
    }

    /**
     * Add a track to the session queue
     */
    suspend fun addTrackToQueue(
        sessionId: String,
        clientId: String,
        mediaItemId: Long
    ): SessionQueueItem {
        val session = sessionDao.getSession(sessionId).first()
            ?: throw IllegalArgumentException("Session not found")
        
        val client = sessionDao.getClient(clientId).first()
            ?: throw IllegalArgumentException("Client not found")

        // Check permissions
        if (!client.permissions.canAddTracks) {
            throw IllegalStateException("Client does not have permission to add tracks")
        }

        // Check track limit
        val trackCount = sessionDao.getClientTrackCount(sessionId, clientId)
        if (trackCount >= client.permissions.maxTracksPerSession) {
            throw IllegalStateException("Client has reached track limit")
        }

        // Get next position
        val existingItems = sessionDao.getAllQueueItems(sessionId).first()
        val nextPosition = (existingItems.maxOfOrNull { it.position } ?: -1) + 1

        val item = SessionQueueItem(
            sessionId = sessionId,
            mediaItemId = mediaItemId,
            addedBy = clientId,
            position = nextPosition,
            status = if (session.requiresApproval) QueueItemStatus.QUEUED else QueueItemStatus.QUEUED
        )

        val itemId = sessionDao.insertQueueItem(item)
        
        // Update client stats
        sessionDao.updateClient(client.copy(contributedTracks = client.contributedTracks + 1))

        return item.copy(id = itemId)
    }

    /**
     * Vote on a queue item
     */
    suspend fun voteOnTrack(
        sessionId: String,
        clientId: String,
        queueItemId: Long,
        voteType: VoteType
    ) {
        val client = sessionDao.getClient(clientId).first()
            ?: throw IllegalArgumentException("Client not found")

        if (!client.permissions.canVote) {
            throw IllegalStateException("Client does not have permission to vote")
        }

        // Check if already voted
        val existingVote = sessionDao.getClientVoteForItem(clientId, queueItemId)
        if (existingVote != null) {
            // Remove existing vote and update counter
            sessionDao.deleteVote(existingVote)
            if (existingVote.voteType == VoteType.UPVOTE) {
                sessionDao.decrementVotes(queueItemId)
            }
        }

        // Add new vote
        val vote = SessionVote(
            sessionId = sessionId,
            clientId = clientId,
            queueItemId = queueItemId,
            voteType = voteType
        )
        sessionDao.insertVote(vote)

        // Update vote counter
        if (voteType == VoteType.UPVOTE) {
            sessionDao.incrementVotes(queueItemId)
        }

        // Update client stats
        sessionDao.updateClient(client.copy(votesUsed = client.votesUsed + 1))
    }

    /**
     * Get active sessions
     */
    fun getActiveSessions(): Flow<List<CollaborativeSession>> {
        return sessionDao.getActiveSessions(
            listOf(SessionStatus.CREATED, SessionStatus.ACTIVE, SessionStatus.PAUSED)
        )
    }

    /**
     * Get connected clients for a session
     */
    fun getConnectedClients(sessionId: String): Flow<List<SessionClient>> {
        return sessionDao.getConnectedClients(sessionId)
    }

    /**
     * Get queue for a session
     */
    fun getQueue(sessionId: String): Flow<List<SessionQueueItem>> {
        return sessionDao.getAllQueueItems(sessionId)
    }

    /**
     * Update playback state
     */
    suspend fun updatePlaybackState(sessionId: String, trackIndex: Int, isPlaying: Boolean) {
        sessionDao.updatePlaybackState(sessionId, trackIndex, isPlaying)
    }

    /**
     * Disconnect inactive clients
     */
    suspend fun cleanupInactiveClients(sessionId: String, timeoutMillis: Long = 60000) {
        val timeout = System.currentTimeMillis() - timeoutMillis
        sessionDao.disconnectInactiveClients(sessionId, timeout)
    }
}

/**
 * Options for creating a session
 */
data class SessionOptions(
    val maxClients: Int = 10,
    val allowClientAdditions: Boolean = true,
    val allowClientVoting: Boolean = true,
    val requiresApproval: Boolean = false,
    val port: Int = 8080
)

/**
 * Connection data encoded in QR code
 */
@Serializable
data class SessionConnectionData(
    val sessionId: String,
    val hostDevice: String,
    val port: Int
)
