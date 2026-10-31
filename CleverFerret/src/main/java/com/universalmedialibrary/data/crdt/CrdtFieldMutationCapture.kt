package com.universalmedialibrary.data.crdt

import com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Mutation capture helper that intercepts domain model updates and records fine-grained
 * operation journal entries (LWW, OR-Set, PN-Counter, Tombstones) with logical Lamport clock timestamps.
 */
@Singleton
class CrdtFieldMutationCapture @Inject constructor(
    private val journalDao: CrdtOperationJournalDao,
    private val clockManager: LamportClockManager
) {

    /**
     * Records an LWW (Last-Write-Wins) scalar field update operation.
     */
    suspend fun recordLwwMutation(
        entityId: String,
        entityType: String,
        fieldPath: String,
        valueJson: String?
    ): CrdtOperationRecord {
        val lamport = clockManager.tick()
        val record = CrdtOperationRecord(
            operationId = UUID.randomUUID().toString(),
            entityId = entityId,
            entityType = entityType,
            fieldPath = fieldPath,
            operationType = CrdtOperationType.LWW_SET,
            valueJson = valueJson,
            elementId = null,
            deviceId = clockManager.getDeviceId(),
            lamportTimestamp = lamport,
            wallTimestamp = System.currentTimeMillis(),
            isSynced = false,
            isCompacted = false
        )
        journalDao.insertOperation(record)
        return record
    }

    /**
     * Records an Observed-Remove Set element addition operation.
     */
    suspend fun recordOrSetAdd(
        entityId: String,
        entityType: String,
        fieldPath: String,
        elementId: String,
        valueJson: String? = null
    ): CrdtOperationRecord {
        val lamport = clockManager.tick()
        val record = CrdtOperationRecord(
            operationId = UUID.randomUUID().toString(),
            entityId = entityId,
            entityType = entityType,
            fieldPath = fieldPath,
            operationType = CrdtOperationType.OR_SET_ADD,
            valueJson = valueJson ?: elementId,
            elementId = elementId,
            deviceId = clockManager.getDeviceId(),
            lamportTimestamp = lamport,
            wallTimestamp = System.currentTimeMillis(),
            isSynced = false,
            isCompacted = false
        )
        journalDao.insertOperation(record)
        return record
    }

    /**
     * Records an Observed-Remove Set element removal operation.
     */
    suspend fun recordOrSetRemove(
        entityId: String,
        entityType: String,
        fieldPath: String,
        elementId: String
    ): CrdtOperationRecord {
        val lamport = clockManager.tick()
        val record = CrdtOperationRecord(
            operationId = UUID.randomUUID().toString(),
            entityId = entityId,
            entityType = entityType,
            fieldPath = fieldPath,
            operationType = CrdtOperationType.OR_SET_REMOVE,
            valueJson = null,
            elementId = elementId,
            deviceId = clockManager.getDeviceId(),
            lamportTimestamp = lamport,
            wallTimestamp = System.currentTimeMillis(),
            isSynced = false,
            isCompacted = false
        )
        journalDao.insertOperation(record)
        return record
    }

    /**
     * Records a PN-Counter increment operation.
     */
    suspend fun recordPnCounterInc(
        entityId: String,
        entityType: String,
        fieldPath: String,
        delta: Long = 1L
    ): CrdtOperationRecord {
        val lamport = clockManager.tick()
        val record = CrdtOperationRecord(
            operationId = UUID.randomUUID().toString(),
            entityId = entityId,
            entityType = entityType,
            fieldPath = fieldPath,
            operationType = CrdtOperationType.PN_COUNTER_INC,
            valueJson = delta.toString(),
            elementId = null,
            deviceId = clockManager.getDeviceId(),
            lamportTimestamp = lamport,
            wallTimestamp = System.currentTimeMillis(),
            isSynced = false,
            isCompacted = false
        )
        journalDao.insertOperation(record)
        return record
    }

    /**
     * Records a PN-Counter decrement operation.
     */
    suspend fun recordPnCounterDec(
        entityId: String,
        entityType: String,
        fieldPath: String,
        delta: Long = 1L
    ): CrdtOperationRecord {
        val lamport = clockManager.tick()
        val record = CrdtOperationRecord(
            operationId = UUID.randomUUID().toString(),
            entityId = entityId,
            entityType = entityType,
            fieldPath = fieldPath,
            operationType = CrdtOperationType.PN_COUNTER_DEC,
            valueJson = delta.toString(),
            elementId = null,
            deviceId = clockManager.getDeviceId(),
            lamportTimestamp = lamport,
            wallTimestamp = System.currentTimeMillis(),
            isSynced = false,
            isCompacted = false
        )
        journalDao.insertOperation(record)
        return record
    }

    /**
     * Records a soft-delete tombstone operation for an entity.
     */
    suspend fun recordTombstoneDelete(
        entityId: String,
        entityType: String
    ): CrdtOperationRecord {
        val lamport = clockManager.tick()
        val record = CrdtOperationRecord(
            operationId = UUID.randomUUID().toString(),
            entityId = entityId,
            entityType = entityType,
            fieldPath = "*",
            operationType = CrdtOperationType.TOMBSTONE_DELETE,
            valueJson = null,
            elementId = null,
            deviceId = clockManager.getDeviceId(),
            lamportTimestamp = lamport,
            wallTimestamp = System.currentTimeMillis(),
            isSynced = false,
            isCompacted = false
        )
        journalDao.insertOperation(record)
        return record
    }
}
