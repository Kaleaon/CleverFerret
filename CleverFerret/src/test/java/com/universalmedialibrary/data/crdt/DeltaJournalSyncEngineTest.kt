package com.universalmedialibrary.data.crdt

import com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.mockito.ArgumentMatchers.any
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify

class DeltaJournalSyncEngineTest {

    private lateinit var journalDao: CrdtOperationJournalDao
    private lateinit var clockManager: LamportClockManager
    private lateinit var reconciliationEngine: CrdtReconciliationEngine
    private lateinit var syncEngine: DeltaJournalSyncEngine

    @Before
    fun setUp() {
        journalDao = mock(CrdtOperationJournalDao::class.java)
        clockManager = LamportClockManager("device-local", 5L)
        reconciliationEngine = mock(CrdtReconciliationEngine::class.java)
        syncEngine = DeltaJournalSyncEngine(journalDao, clockManager, reconciliationEngine)
    }

    @Test
    fun testReceiveRemoteDeltasFilterDuplicatesAndAdvanceClock() = runBlocking {
        val opRemoteNew = CrdtOperationRecord(
            operationId = "op-remote-1",
            entityId = "media-100",
            entityType = "MEDIA_ITEM",
            fieldPath = "progress",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "0.75",
            elementId = null,
            deviceId = "device-remote",
            lamportTimestamp = 20L
        )

        val opRemoteDuplicate = CrdtOperationRecord(
            operationId = "op-remote-existing",
            entityId = "media-100",
            entityType = "MEDIA_ITEM",
            fieldPath = "progress",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "0.50",
            elementId = null,
            deviceId = "device-remote",
            lamportTimestamp = 10L
        )

        `when`(journalDao.getOperationById("op-remote-1")).thenReturn(null)
        `when`(journalDao.getOperationById("op-remote-existing")).thenReturn(opRemoteDuplicate)

        val result = syncEngine.receiveRemoteDeltas(listOf(opRemoteNew, opRemoteDuplicate))

        assertEquals(1, result.appliedCount)
        assertEquals(1, result.duplicateCount)
        assertEquals(listOf("media-100"), result.affectedEntityIds)

        // Local clock should advance beyond remote timestamp (20 -> 21)
        assertEquals(21L, clockManager.getClock())
    }
}
