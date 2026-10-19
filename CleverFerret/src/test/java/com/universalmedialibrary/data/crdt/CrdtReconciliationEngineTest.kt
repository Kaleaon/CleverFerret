package com.universalmedialibrary.data.crdt

import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito.mock

class CrdtReconciliationEngineTest {

    private lateinit var journalDao: com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao
    private lateinit var engine: CrdtReconciliationEngine

    @Before
    fun setUp() {
        journalDao = mock(com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao::class.java)
        engine = CrdtReconciliationEngine(journalDao)
    }

    @Test
    fun testLwwFieldScalarConvergenceWithTieBreaker() {
        val op1 = CrdtOperationRecord(
            operationId = "op-1",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "title",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "Title Old",
            elementId = null,
            deviceId = "device-A",
            lamportTimestamp = 10L,
            wallTimestamp = 1000L
        )

        val op2 = CrdtOperationRecord(
            operationId = "op-2",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "title",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "Title New",
            elementId = null,
            deviceId = "device-B",
            lamportTimestamp = 12L,
            wallTimestamp = 900L
        )

        // Out-of-order list
        val reconciled = engine.reconcileLwwField(listOf(op1, op2))
        assertEquals("Title New", reconciled?.valueJson)

        // Tie breaker on deviceId when timestamps match
        val op3 = op1.copy(
            operationId = "op-3",
            lamportTimestamp = 10L,
            wallTimestamp = 1000L,
            deviceId = "device-Z",
            valueJson = "Title Z"
        )
        val op4 = op1.copy(
            operationId = "op-4",
            lamportTimestamp = 10L,
            wallTimestamp = 1000L,
            deviceId = "device-A",
            valueJson = "Title A"
        )

        val tieBreakerReconciled = engine.reconcileLwwField(listOf(op4, op3))
        assertEquals("Title Z", tieBreakerReconciled?.valueJson)
    }

    @Test
    fun testOrSetAddAndRemoveConvergence() {
        val addTag1 = CrdtOperationRecord(
            operationId = "op-add-1",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "tags",
            operationType = CrdtOperationType.OR_SET_ADD,
            valueJson = "Sci-Fi",
            elementId = "tag-sci-fi",
            deviceId = "device-A",
            lamportTimestamp = 5L
        )

        val addTag2 = CrdtOperationRecord(
            operationId = "op-add-2",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "tags",
            operationType = CrdtOperationType.OR_SET_ADD,
            valueJson = "Fantasy",
            elementId = "tag-fantasy",
            deviceId = "device-B",
            lamportTimestamp = 6L
        )

        val removeTag1 = CrdtOperationRecord(
            operationId = "op-remove-1",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "tags",
            operationType = CrdtOperationType.OR_SET_REMOVE,
            valueJson = null,
            elementId = "tag-sci-fi",
            deviceId = "device-B",
            lamportTimestamp = 8L
        )

        val activeElements = engine.reconcileOrSet(listOf(addTag1, addTag2, removeTag1))
        assertFalse(activeElements.contains("tag-sci-fi"))
        assertTrue(activeElements.contains("tag-fantasy"))
    }

    @Test
    fun testPnCounterIncrementAndDecrementSum() {
        val inc1 = CrdtOperationRecord(
            operationId = "op-inc-1",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "playCount",
            operationType = CrdtOperationType.PN_COUNTER_INC,
            valueJson = "1",
            elementId = null,
            deviceId = "device-A",
            lamportTimestamp = 1L
        )

        val inc2 = CrdtOperationRecord(
            operationId = "op-inc-2",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "playCount",
            operationType = CrdtOperationType.PN_COUNTER_INC,
            valueJson = "5",
            elementId = null,
            deviceId = "device-B",
            lamportTimestamp = 2L
        )

        val dec1 = CrdtOperationRecord(
            operationId = "op-dec-1",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "playCount",
            operationType = CrdtOperationType.PN_COUNTER_DEC,
            valueJson = "2",
            elementId = null,
            deviceId = "device-A",
            lamportTimestamp = 3L
        )

        val count = engine.reconcilePnCounter(listOf(inc1, inc2, dec1))
        assertEquals(4L, count)
    }

    @Test
    fun testTombstoneSoftDelete() {
        val editOp = CrdtOperationRecord(
            operationId = "op-edit",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "title",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "Title",
            elementId = null,
            deviceId = "device-A",
            lamportTimestamp = 5L
        )

        val deleteOp = CrdtOperationRecord(
            operationId = "op-del",
            entityId = "media-123",
            entityType = "MEDIA_ITEM",
            fieldPath = "*",
            operationType = CrdtOperationType.TOMBSTONE_DELETE,
            valueJson = null,
            elementId = null,
            deviceId = "device-B",
            lamportTimestamp = 10L
        )

        val isDeleted = engine.isEntityDeleted(listOf(editOp, deleteOp))
        assertTrue(isDeleted)
    }
}
