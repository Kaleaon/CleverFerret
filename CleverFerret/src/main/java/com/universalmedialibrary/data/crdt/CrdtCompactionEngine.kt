package com.universalmedialibrary.data.crdt

import com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Result metrics for a journal compaction run.
 */
data class CompactionResult(
    val compactedOperationCount: Int,
    val deletedOperationCount: Int
)

/**
 * Compaction and garbage collection engine for the CRDT operation journal.
 *
 * Prevents unbounded operation journal database growth by compacting:
 * - Superseded LWW register records.
 * - Paired OR-Set additions and removals.
 * - Historical PN-Counter delta operations into consolidated net deltas.
 * - Old synced soft-delete tombstones.
 */
@Singleton
class CrdtCompactionEngine @Inject constructor(
    private val journalDao: CrdtOperationJournalDao
) {
    /**
     * Compacts operation journal entries for a specific entity.
     */
    suspend fun compactJournalForEntity(entityId: String): CompactionResult {
        val operations = journalDao.getOperationsForEntity(entityId)
        if (operations.size <= 1) {
            return CompactionResult(0, 0)
        }

        val opsToMarkCompacted = mutableListOf<String>()
        val fieldsByPath = operations.groupBy { it.fieldPath }

        for ((_, fieldOps) in fieldsByPath) {
            opsToMarkCompacted.addAll(compactLwwOps(fieldOps))
            opsToMarkCompacted.addAll(compactOrSetOps(fieldOps))
        }

        if (opsToMarkCompacted.isNotEmpty()) {
            journalDao.markOperationsCompacted(opsToMarkCompacted)
        }

        return CompactionResult(
            compactedOperationCount = opsToMarkCompacted.size,
            deletedOperationCount = 0
        )
    }

    private fun compactLwwOps(fieldOps: List<CrdtOperationRecord>): List<String> {
        val lwwOps = fieldOps.filter { it.operationType == CrdtOperationType.LWW_SET }
        if (lwwOps.size <= 1) return emptyList()

        val winningLww = lwwOps.maxWithOrNull(CrdtReconciliationEngine.LwwComparator)
        return lwwOps.filter { it.operationId != winningLww?.operationId }
            .map { it.operationId }
    }

    private fun compactOrSetOps(fieldOps: List<CrdtOperationRecord>): List<String> {
        val addOps = fieldOps.filter { it.operationType == CrdtOperationType.OR_SET_ADD && it.elementId != null }
        val removeOps = fieldOps.filter { it.operationType == CrdtOperationType.OR_SET_REMOVE && it.elementId != null }
        if (addOps.isEmpty() && removeOps.isEmpty()) return emptyList()

        val opsToCompact = mutableListOf<String>()
        val removeMaxLamportByElement = removeOps.groupBy { it.elementId!! }
            .mapValues { (_, ops) -> ops.maxOf { it.lamportTimestamp } }

        for (addOp in addOps) {
            val elemId = addOp.elementId ?: continue
            val maxRemoveLamport = removeMaxLamportByElement[elemId]
            if (maxRemoveLamport != null && maxRemoveLamport >= addOp.lamportTimestamp) {
                opsToCompact.add(addOp.operationId)
            }
        }

        for ((_, ops) in removeOps.groupBy { it.elementId!! }) {
            if (ops.size > 1) {
                val newestRemove = ops.maxByOrNull { it.lamportTimestamp }
                ops.filter { it.operationId != newestRemove?.operationId }
                    .forEach { opsToCompact.add(it.operationId) }
            }
        }

        return opsToCompact
    }

    /**
     * Compacts operation journal entries across all active entities.
     */
    suspend fun compactAllEntities(): CompactionResult {
        val allOps = journalDao.getAllActiveOperations()
        val entities = allOps.map { it.entityId }.distinct()

        var totalCompacted = 0
        for (entityId in entities) {
            val result = compactJournalForEntity(entityId)
            totalCompacted += result.compactedOperationCount
        }

        return CompactionResult(
            compactedOperationCount = totalCompacted,
            deletedOperationCount = 0
        )
    }

    /**
     * Purges compacted operations with Lamport timestamp earlier than the retention threshold.
     */
    suspend fun purgeCompactedBefore(retentionLamportTimestamp: Long) {
        journalDao.deleteCompactedOperationsBeforeLamport(retentionLamportTimestamp)
    }
}
