package com.universalmedialibrary.data.crdt

import kotlinx.serialization.Serializable

/**
 * Operation types supported by the CRDT operation journal engine.
 */
@Serializable
enum class CrdtOperationType {
    /**
     * Last-Write-Wins Register set operation for atomic field updates.
     */
    LWW_SET,

    /**
     * Observed-Remove Set element addition operation.
     */
    OR_SET_ADD,

    /**
     * Observed-Remove Set element removal operation.
     */
    OR_SET_REMOVE,

    /**
     * Positive-Negative Counter increment operation.
     */
    PN_COUNTER_INC,

    /**
     * Positive-Negative Counter decrement operation.
     */
    PN_COUNTER_DEC,

    /**
     * Soft-delete tombstone operation for an entire entity.
     */
    TOMBSTONE_DELETE
}
