package com.universalmedialibrary.data.crdt

import com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao
import javax.inject.Inject
import javax.inject.Singleton

/**
 * State reconciliation engine implementing conflict-free replicated data type (CRDT) rules.
 *
 * Guarantees mathematical convergence across distributed nodes without manual user conflict prompts:
 * - LWW-Register: Timestamp + Device ID tie-breaking for scalar attributes.
 * - OR-Set: Observed-Remove Set semantics for tag and collection membership.
 * - PN-Counter: Commutative sum of increments and decrements for counter metrics.
 * - Soft-Delete Tombstones: Conflict-free deletion handling.
 */
@Singleton
class CrdtReconciliationEngine @Inject constructor(
    private val journalDao: CrdtOperationJournalDao
) {
    /**
     * Reconciles scalar Last-Write-Wins field value from a list of operations.
     */
    fun reconcileLwwField(operations: List<CrdtOperationRecord>): CrdtOperationRecord? {
        val lwwOps = operations.filter { it.operationType == CrdtOperationType.LWW_SET }
        if (lwwOps.isEmpty()) return null

        return lwwOps.maxWithOrNull(LwwComparator)
    }

    /**
     * Reconciles Observed-Remove Set elements from a list of operations.
     * Returns set of elementIds currently active in the set.
     */
    fun reconcileOrSet(operations: List<CrdtOperationRecord>): Set<String> {
        val addOps = operations.filter { it.operationType == CrdtOperationType.OR_SET_ADD && it.elementId != null }
        val removeOps = operations.filter { it.operationType == CrdtOperationType.OR_SET_REMOVE && it.elementId != null }

        val highestRemoveLamportByElement = mutableMapOf<String, Long>()
        for (removeOp in removeOps) {
            val elemId = removeOp.elementId ?: continue
            val currentMax = highestRemoveLamportByElement[elemId] ?: -1L
            if (removeOp.lamportTimestamp > currentMax) {
                highestRemoveLamportByElement[elemId] = removeOp.lamportTimestamp
            }
        }

        val activeElements = mutableSetOf<String>()
        for (addOp in addOps) {
            val elemId = addOp.elementId ?: continue
            val maxRemoveLamport = highestRemoveLamportByElement[elemId]
            if (maxRemoveLamport == null || addOp.lamportTimestamp > maxRemoveLamport) {
                activeElements.add(elemId)
            }
        }

        return activeElements
    }

    /**
     * Reconciles Positive-Negative Counter value from a list of operations.
     */
    fun reconcilePnCounter(operations: List<CrdtOperationRecord>): Long {
        var total = 0L
        for (op in operations) {
            val delta = parseCounterDelta(op.valueJson)
            when (op.operationType) {
                CrdtOperationType.PN_COUNTER_INC -> total += delta
                CrdtOperationType.PN_COUNTER_DEC -> total -= delta
                else -> { /* Ignore non-counter ops */ }
            }
        }
        return total
    }

    /**
     * Determines whether an entity is tombstoned (deleted).
     */
    fun isEntityDeleted(operations: List<CrdtOperationRecord>): Boolean {
        val deleteOp = operations.filter { it.operationType == CrdtOperationType.TOMBSTONE_DELETE }
            .maxWithOrNull(LwwComparator) ?: return false

        val nonDeleteOps = operations.filter { it.operationType != CrdtOperationType.TOMBSTONE_DELETE }
        val latestEditOp = nonDeleteOps.maxWithOrNull(LwwComparator)

        return latestEditOp == null || LwwComparator.compare(deleteOp, latestEditOp) > 0
    }

    /**
     * Reconciles all fields for a given entity from the operation journal database.
     */
    suspend fun reconcileEntityState(entityId: String): ReconciledEntityState {
        val ops = journalDao.getOperationsForEntity(entityId)
        val isDeleted = isEntityDeleted(ops)

        val fieldsByPath = ops.groupBy { it.fieldPath }
        val lwwValues = mutableMapOf<String, String?>()
        val orSets = mutableMapOf<String, Set<String>>()
        val pnCounters = mutableMapOf<String, Long>()

        for ((fieldPath, fieldOps) in fieldsByPath) {
            val lwwOp = reconcileLwwField(fieldOps)
            if (lwwOp != null) {
                lwwValues[fieldPath] = lwwOp.valueJson
            }

            val setElements = reconcileOrSet(fieldOps)
            val isOrSetOp = fieldOps.any {
                it.operationType == CrdtOperationType.OR_SET_ADD ||
                    it.operationType == CrdtOperationType.OR_SET_REMOVE
            }
            if (setElements.isNotEmpty() || isOrSetOp) {
                orSets[fieldPath] = setElements
            }

            val isPnOp = fieldOps.any {
                it.operationType == CrdtOperationType.PN_COUNTER_INC ||
                    it.operationType == CrdtOperationType.PN_COUNTER_DEC
            }
            if (isPnOp) {
                pnCounters[fieldPath] = reconcilePnCounter(fieldOps)
            }
        }

        return ReconciledEntityState(
            entityId = entityId,
            isDeleted = isDeleted,
            lwwFields = lwwValues,
            orSets = orSets,
            pnCounters = pnCounters
        )
    }

    private fun parseCounterDelta(valueJson: String?): Long {
        if (valueJson.isNullOrEmpty()) return 1L
        return try {
            valueJson.toLong()
        } catch (e: NumberFormatException) {
            1L
        }
    }

    companion object {
        /**
         * LWW Deterministic Tie-Breaker Comparator:
         * 1. Higher Lamport timestamp
         * 2. Higher wall-clock timestamp
         * 3. Higher Device ID (lexicographical string comparison)
         */
        val LwwComparator: Comparator<CrdtOperationRecord> = Comparator { op1, op2 ->
            if (op1.lamportTimestamp != op2.lamportTimestamp) {
                op1.lamportTimestamp.compareTo(op2.lamportTimestamp)
            } else if (op1.wallTimestamp != op2.wallTimestamp) {
                op1.wallTimestamp.compareTo(op2.wallTimestamp)
            } else {
                op1.deviceId.compareTo(op2.deviceId)
            }
        }
    }
}

/**
 * Materialized converged state for an entity after CRDT reconciliation.
 */
data class ReconciledEntityState(
    val entityId: String,
    val isDeleted: Boolean,
    val lwwFields: Map<String, String?>,
    val orSets: Map<String, Set<String>>,
    val pnCounters: Map<String, Long>
)
