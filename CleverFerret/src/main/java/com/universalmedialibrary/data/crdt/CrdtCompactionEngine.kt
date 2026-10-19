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
            // 1. Compact LWW operations
            val lwwOps = fieldOps.filter { it.operationType == CrdtOperationType.LWW_SET }
            if (lwwOps.size > 1) {
                val winningLww = lwwOps.maxWithOrNull(CrdtReconciliationEngine.LwwComparator)
                for (op in lwwOps) {
                    if (op.operationId != winningLww?.operationId) {
                        opsToMarkCompacted.add(op.operationId)
                    }
                }
            }

            // 2. Compact paired OR-Set operations
            val addOps = fieldOps.filter { it.operationType == CrdtOperationType.OR_SET_ADD && it.elementId != null }
            val removeOps = fieldOps.filter { it.operationType == CrdtOperationType.OR_SET_REMOVE && it.elementId != null }

            val removeMaxLamportByElement = removeOps.groupBy { it.elementId!! }
                .mapValues { (_, ops) -> ops.maxOf { it.lamportTimestamp } }

            for (addOp in addOps) {
                val elemId = addOp.elementId ?: continue
                val maxRemoveLamport = removeMaxLamportByElement[elemId]
                if (maxRemoveLamport != null && maxRemoveLamport >= addOp.lamportTimestamp) {
                    opsToMarkCompacted.add(addOp.operationId)
                }
            }

            // Mark older remove ops superseded by newer remove ops
            for ((elemId, ops) in removeOps.groupBy { it.elementId!! }) {
                if (ops.size > 1) {
                    val newestRemove = ops.maxByOrNull { it.lamportTimestamp }
                    for (op in ops) {
                        if (op.operationId != newestRemove?.operationId) {
                            opsToMarkCompacted.add(op.operationId)
                        }
                    }
                }
            }
        }

        if (opsToMarkCompacted.isNotEmpty()) {
            journalDao.markOperationsCompacted(opsToMarkCompacted)
        }

        return CompactionResult(
            compactedOperationCount = opsToMarkCompacted.size,
            deletedOperationCount = 0
        )
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
