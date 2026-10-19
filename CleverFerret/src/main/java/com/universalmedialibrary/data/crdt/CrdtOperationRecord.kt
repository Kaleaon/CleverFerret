package com.universalmedialibrary.data.crdt

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Represents an immutable operation record stored in the CRDT operation journal.
 *
 * Each record represents a fine-grained state mutation (e.g. LWW field register,
 * OR-Set element add/remove, PN-Counter delta increment/decrement, or soft-delete tombstone)
 * allowing conflict-free deterministic convergence across multi-device sync operations.
 */
@Serializable
@Entity(
    tableName = "crdt_operation_journal",
    indices = [
        Index(value = ["entityId", "fieldPath"]),
        Index(value = ["lamportTimestamp"]),
        Index(value = ["isSynced"]),
        Index(value = ["isCompacted"])
    ]
)
data class CrdtOperationRecord(
    @PrimaryKey
    val operationId: String,
    val entityId: String,
    val entityType: String,
    val fieldPath: String,
    val operationType: CrdtOperationType,
    val valueJson: String? = null,
    val elementId: String? = null,
    val deviceId: String,
    val lamportTimestamp: Long,
    val wallTimestamp: Long = System.currentTimeMillis(),
    val isSynced: Boolean = false,
    val isCompacted: Boolean = false
)
