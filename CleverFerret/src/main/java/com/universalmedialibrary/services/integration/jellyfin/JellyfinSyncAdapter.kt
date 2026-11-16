package com.universalmedialibrary.services.integration.jellyfin

import android.util.Log
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.ProgressSyncJournalDao
import com.universalmedialibrary.data.local.dao.RemoteSyncMutationDao
import com.universalmedialibrary.data.local.entity.JellyfinServer
import com.universalmedialibrary.data.local.entity.RemoteSyncMutation
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Sync adapter for Jellyfin media servers consuming progress journal events
 * and reporting playback session progress via REST endpoints.
 */
@Singleton
class JellyfinSyncAdapter @Inject constructor(
    private val database: AppDatabase,
    private val jellyfinIntegration: JellyfinIntegrationService,
    private val remoteSyncMutationDao: RemoteSyncMutationDao? = null,
    private val progressSyncJournalDao: ProgressSyncJournalDao = database.progressSyncJournalDao()
) {

    companion object {
        private const val TAG = "JellyfinSyncAdapter"
        private const val TICKS_PER_MILLISECOND = 10000L
    }

    /**
     * Reports playback progress to Jellyfin REST endpoint /Sessions/Playing/Progress
     */
    suspend fun reportPlaybackProgress(
        server: JellyfinServer,
        itemId: String,
        positionTicks: Long,
        isPaused: Boolean = false
    ): Result<Unit> {
        return try {
            val serverUrl = "http://${server.host}:${server.port}"
            val api = jellyfinIntegration.createApi(serverUrl)
            val response = api.reportPlaybackProgress(
                token = server.apiKey ?: "",
                itemId = itemId,
                positionTicks = positionTicks,
                isPaused = isPaused
            )

            if (response.isSuccessful && response.code() == 200) {
                Result.success(Unit)
            } else {
                enqueueMutation(
                    serverId = server.id,
                    targetItemId = itemId,
                    mutationType = "PROGRESS",
                    payloadJson = "{\"positionTicks\":$positionTicks,\"isPaused\":$isPaused}"
                )
                Result.failure(Exception("Jellyfin progress reporting failed with HTTP ${response.code()}"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error reporting playback progress to Jellyfin for item $itemId", e)
            enqueueMutation(
                serverId = server.id,
                targetItemId = itemId,
                mutationType = "PROGRESS",
                payloadJson = "{\"positionTicks\":$positionTicks,\"isPaused\":$isPaused}"
            )
            Result.failure(e)
        }
    }

    /**
     * Reports playback stopped to Jellyfin REST endpoint /Sessions/Playing/Stopped
     */
    suspend fun reportPlaybackStopped(
        server: JellyfinServer,
        itemId: String,
        positionTicks: Long? = null
    ): Result<Unit> {
        return try {
            val serverUrl = "http://${server.host}:${server.port}"
            val api = jellyfinIntegration.createApi(serverUrl)
            val response = api.reportPlaybackStopped(
                token = server.apiKey ?: "",
                itemId = itemId,
                positionTicks = positionTicks
            )

            if (response.isSuccessful && response.code() == 200) {
                Result.success(Unit)
            } else {
                enqueueMutation(
                    serverId = server.id,
                    targetItemId = itemId,
                    mutationType = "STOPPED",
                    payloadJson = "{\"positionTicks\":$positionTicks}"
                )
                Result.failure(Exception("Jellyfin stop reporting failed with HTTP ${response.code()}"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error reporting playback stopped to Jellyfin for item $itemId", e)
            enqueueMutation(
                serverId = server.id,
                targetItemId = itemId,
                mutationType = "STOPPED",
                payloadJson = "{\"positionTicks\":$positionTicks}"
            )
            Result.failure(e)
        }
    }

    /**
     * Consumes pending journal entries sequentially per media item and reports them to Jellyfin.
     * Enforces Guardrail 3 (sequential per media item replay).
     */
    suspend fun processPendingJournal(server: JellyfinServer): Result<Int> {
        val pendingEvents = progressSyncJournalDao.getPendingEvents()
        if (pendingEvents.isEmpty()) return Result.success(0)

        var processedCount = 0

        // Guardrail 3: Sync adapters must execute sequentially per media item to guarantee strict ordered replay
        val groupedByItem = pendingEvents.groupBy { it.itemId }

        for ((itemId, events) in groupedByItem) {
            val sortedEvents = events.sortedBy { it.sequenceNumber }

            for (entry in sortedEvents) {
                val positionTicks = entry.position * TICKS_PER_MILLISECOND
                val result = if (entry.actionType.equals("STOP", ignoreCase = true)) {
                    reportPlaybackStopped(server, itemId, positionTicks)
                } else {
                    val isPaused = entry.actionType.equals("PAUSE", ignoreCase = true)
                    reportPlaybackProgress(server, itemId, positionTicks, isPaused = isPaused)
                }

                if (result.isSuccess) {
                    progressSyncJournalDao.markProcessed(entry.id, System.currentTimeMillis())
                    processedCount++
                } else {
                    // Break out of sequential processing for this item on error to guarantee strict ordered replay
                    break
                }
            }
        }

        return Result.success(processedCount)
    }

    private suspend fun enqueueMutation(
        serverId: Long,
        targetItemId: String,
        mutationType: String,
        payloadJson: String
    ) {
        try {
            remoteSyncMutationDao?.insert(
                RemoteSyncMutation(
                    serverType = "JELLYFIN",
                    serverId = serverId,
                    targetItemId = targetItemId,
                    mutationType = mutationType,
                    payloadJson = payloadJson,
                    retryCount = 0,
                    status = "PENDING",
                    createdAt = System.currentTimeMillis()
                )
            )
        } catch (e: Exception) {
            Log.e(TAG, "Failed to enqueue fallback mutation for $targetItemId", e)
        }
    }
}
