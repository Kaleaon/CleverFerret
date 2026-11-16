package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import com.universalmedialibrary.data.crdt.VectorClock
import kotlinx.serialization.Serializable

/**
 * Entity representing an immutable playback progress transition in the local journal.
 *
 * Records offline and online seeks, pauses, rewinds, and playback updates with
 * sequential ordering and vector clock causality.
 */
@Serializable
@Entity(
    tableName = "progress_sync_journal",
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["isProcessed"]),
        Index(value = ["createdAt"]),
        Index(value = ["itemId", "sequenceNumber"])
    ]
)
data class ProgressSyncJournal(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val itemId: String,
    val position: Long,
    val actionType: String, // "SEEK", "PAUSE", "STOP", "PLAY", "PROGRESS"
    val sequenceNumber: Long,
    val vectorClock: String = "{}",
    val createdAt: Long = System.currentTimeMillis(),

    val isProcessed: Boolean = false,
    val processedAt: Long? = null
) {
    /**
     * Parses the JSON-serialized vector clock string into a [VectorClock] model.
     */
    fun parseVectorClock(): VectorClock = VectorClock.fromJson(vectorClock)
}
