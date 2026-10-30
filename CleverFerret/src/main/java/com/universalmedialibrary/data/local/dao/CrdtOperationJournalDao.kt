package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.crdt.CrdtOperationRecord

/**
 * Data Access Object for the CRDT Operation Journal table.
 */
@Dao
interface CrdtOperationJournalDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOperation(record: CrdtOperationRecord)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOperations(records: List<CrdtOperationRecord>)

    @Query("SELECT * FROM crdt_operation_journal WHERE operationId = :operationId")
    suspend fun getOperationById(operationId: String): CrdtOperationRecord?

    @Query("SELECT * FROM crdt_operation_journal WHERE entityId = :entityId AND isCompacted = 0 ORDER BY lamportTimestamp ASC")
    suspend fun getOperationsForEntity(entityId: String): List<CrdtOperationRecord>

    @Query("""
        SELECT * FROM crdt_operation_journal
        WHERE entityId = :entityId AND fieldPath = :fieldPath AND isCompacted = 0
        ORDER BY lamportTimestamp ASC
    """)
    suspend fun getOperationsForEntityField(entityId: String, fieldPath: String): List<CrdtOperationRecord>

    @Query("SELECT * FROM crdt_operation_journal WHERE isSynced = 0 AND isCompacted = 0 ORDER BY lamportTimestamp ASC")
    suspend fun getUnsyncedOperations(): List<CrdtOperationRecord>

    @Query("""
        SELECT * FROM crdt_operation_journal
        WHERE lamportTimestamp > :lamportTimestamp AND isCompacted = 0
        ORDER BY lamportTimestamp ASC
    """)
    suspend fun getOperationsSinceLamport(lamportTimestamp: Long): List<CrdtOperationRecord>

    @Query("SELECT * FROM crdt_operation_journal WHERE isCompacted = 0 ORDER BY lamportTimestamp ASC")
    suspend fun getAllActiveOperations(): List<CrdtOperationRecord>

    @Query("SELECT MAX(lamportTimestamp) FROM crdt_operation_journal")
    suspend fun getHighestLamportTimestamp(): Long?

    @Query("UPDATE crdt_operation_journal SET isSynced = 1 WHERE operationId IN (:operationIds)")
    suspend fun markOperationsSynced(operationIds: List<String>)

    @Query("UPDATE crdt_operation_journal SET isCompacted = 1 WHERE operationId IN (:operationIds)")
    suspend fun markOperationsCompacted(operationIds: List<String>)

    @Query("DELETE FROM crdt_operation_journal WHERE operationId IN (:operationIds)")
    suspend fun deleteOperationsByIds(operationIds: List<String>)

    @Query("DELETE FROM crdt_operation_journal WHERE isCompacted = 1 AND lamportTimestamp < :lamportTimestamp")
    suspend fun deleteCompactedOperationsBeforeLamport(lamportTimestamp: Long)
}
