package com.universalmedialibrary.data.crdt

import com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Result metrics returned after receiving and applying remote operation deltas.
 */
data class DeltaSyncResult(
    val appliedCount: Int,
    val duplicateCount: Int,
    val affectedEntityIds: List<String>,
    val latestLamportTimestamp: Long
)

/**
 * Handles delta exchange, application of remote operations, clock alignment,
 * and invocation of CRDT reconciliation.
 */
@Singleton
class DeltaJournalSyncEngine @Inject constructor(
    private val journalDao: CrdtOperationJournalDao,
    private val clockManager: LamportClockManager,
    private val reconciliationEngine: CrdtReconciliationEngine
) {

    /**
     * Retrieves all pending operations that have not yet been transmitted to sync peers.
     */
    suspend fun getPendingUnsyncedDeltas(): List<CrdtOperationRecord> {
        return journalDao.getUnsyncedOperations()
    }

    /**
     * Retrieves operation deltas recorded after a given logical Lamport timestamp.
     */
    suspend fun getDeltasSinceLamport(lamportTimestamp: Long): List<CrdtOperationRecord> {
        return journalDao.getOperationsSinceLamport(lamportTimestamp)
    }

    /**
     * Marks operations as successfully synced to remote server/peers.
     */
    suspend fun markDeltasSynced(operationIds: List<String>) {
        if (operationIds.isNotEmpty()) {
            journalDao.markOperationsSynced(operationIds)
        }
    }

    /**
     * Atomically ingests incoming remote operation records:
     * - Filters out duplicates already present in the journal.
     * - Advances local Lamport clock beyond remote timestamps.
     * - Inserts new remote operation records into the operation journal.
     * - Reconciles entity states for impacted entities.
     */
    suspend fun receiveRemoteDeltas(remoteDeltas: List<CrdtOperationRecord>): DeltaSyncResult {
        if (remoteDeltas.isEmpty()) {
            return DeltaSyncResult(
                appliedCount = 0,
                duplicateCount = 0,
                affectedEntityIds = emptyList(),
                latestLamportTimestamp = clockManager.getClock()
            )
        }

        var appliedCount = 0
        var duplicateCount = 0
        val affectedEntities = mutableSetOf<String>()
        val newOpsToInsert = mutableListOf<CrdtOperationRecord>()

        for (remoteOp in remoteDeltas) {
            val existing = journalDao.getOperationById(remoteOp.operationId)
            if (existing != null) {
                duplicateCount++
                continue
            }

            // Advance logical clock for received remote timestamp
            clockManager.updateClock(remoteOp.lamportTimestamp)

            // Mark incoming remote delta as synced locally since it originated remotely
            val opToStore = remoteOp.copy(isSynced = true)
            newOpsToInsert.add(opToStore)
            affectedEntities.add(remoteOp.entityId)
            appliedCount++
        }

        if (newOpsToInsert.isNotEmpty()) {
            journalDao.insertOperations(newOpsToInsert)
        }

        // Reconcile state for all affected entities
        for (entityId in affectedEntities) {
            reconciliationEngine.reconcileEntityState(entityId)
        }

        val highestClock = journalDao.getHighestLamportTimestamp() ?: clockManager.getClock()

        return DeltaSyncResult(
            appliedCount = appliedCount,
            duplicateCount = duplicateCount,
            affectedEntityIds = affectedEntities.toList(),
            latestLamportTimestamp = maxOf(highestClock, clockManager.getClock())
        )
    }
}
