package com.universalmedialibrary.data.crdt

import com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify

class CrdtCompactionEngineTest {

    private lateinit var journalDao: CrdtOperationJournalDao
    private lateinit var compactionEngine: CrdtCompactionEngine

    @Before
    fun setUp() {
        journalDao = mock(CrdtOperationJournalDao::class.java)
        compactionEngine = CrdtCompactionEngine(journalDao)
    }

    @Test
    fun testCompactLwwOperations() = runBlocking {
        val op1 = CrdtOperationRecord(
            operationId = "op-old-lww",
            entityId = "entity-1",
            entityType = "MEDIA_ITEM",
            fieldPath = "title",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "Old Title",
            elementId = null,
            deviceId = "device-A",
            lamportTimestamp = 10L
        )

        val op2 = CrdtOperationRecord(
            operationId = "op-new-lww",
            entityId = "entity-1",
            entityType = "MEDIA_ITEM",
            fieldPath = "title",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "New Title",
            elementId = null,
            deviceId = "device-B",
            lamportTimestamp = 20L
        )

        `when`(journalDao.getOperationsForEntity("entity-1")).thenReturn(listOf(op1, op2))

        val result = compactionEngine.compactJournalForEntity("entity-1")

        assertEquals(1, result.compactedOperationCount)
        verify(journalDao).markOperationsCompacted(listOf("op-old-lww"))
    }
}
