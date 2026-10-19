package com.universalmedialibrary.data.crdt

import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class MultiDeviceCrdtConvergenceTest {

    private val reconciliationEngine = CrdtReconciliationEngine(
        org.mockito.Mockito.mock(com.universalmedialibrary.data.local.dao.CrdtOperationJournalDao::class.java)
    )

    @Test
    fun testThreeDeviceOfflinePartitionConvergenceWithZeroConflicts() {
        val (deviceAOp1, deviceAOp2) = createDeviceAOperations()
        val (deviceBOp1, deviceBOp2, deviceBOp3) = createDeviceBOperations()
        val (deviceCOp1, deviceCOp2) = createDeviceCOperations()

        val order1 = listOf(deviceAOp1, deviceAOp2, deviceBOp1, deviceBOp2, deviceBOp3, deviceCOp1, deviceCOp2)
        val order2 = listOf(deviceCOp2, deviceCOp1, deviceBOp3, deviceBOp2, deviceBOp1, deviceAOp2, deviceAOp1)
        val order3 = listOf(deviceBOp2, deviceAOp1, deviceCOp1, deviceBOp1, deviceCOp2, deviceAOp2, deviceBOp3)

        verifyTitleConvergence(order1, order2, order3)
        verifyTagsConvergence(order1, order2, order3)
        verifyPlayCountConvergence(order1, order2, order3)
    }

    private fun createDeviceAOperations(): Pair<CrdtOperationRecord, CrdtOperationRecord> {
        val op1 = CrdtOperationRecord(
            operationId = "devA-op1",
            entityId = "item-777",
            entityType = "MEDIA_ITEM",
            fieldPath = "title",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "Action Hero (A)",
            elementId = null,
            deviceId = "device-A",
            lamportTimestamp = 100L,
            wallTimestamp = 1000L
        )
        val op2 = CrdtOperationRecord(
            operationId = "devA-op2",
            entityId = "item-777",
            entityType = "MEDIA_ITEM",
            fieldPath = "tags",
            operationType = CrdtOperationType.OR_SET_ADD,
            valueJson = "Action",
            elementId = "tag-action",
            deviceId = "device-A",
            lamportTimestamp = 101L,
            wallTimestamp = 1010L
        )
        return op1 to op2
    }

    private fun createDeviceBOperations(): Triple<CrdtOperationRecord, CrdtOperationRecord, CrdtOperationRecord> {
        val op1 = CrdtOperationRecord(
            operationId = "devB-op1",
            entityId = "item-777",
            entityType = "MEDIA_ITEM",
            fieldPath = "title",
            operationType = CrdtOperationType.LWW_SET,
            valueJson = "Action Hero Final (B)",
            elementId = null,
            deviceId = "device-B",
            lamportTimestamp = 105L,
            wallTimestamp = 1050L
        )
        val op2 = CrdtOperationRecord(
            operationId = "devB-op2",
            entityId = "item-777",
            entityType = "MEDIA_ITEM",
            fieldPath = "tags",
            operationType = CrdtOperationType.OR_SET_ADD,
            valueJson = "Drama",
            elementId = "tag-drama",
            deviceId = "device-B",
            lamportTimestamp = 106L,
            wallTimestamp = 1060L
        )
        val op3 = CrdtOperationRecord(
            operationId = "devB-op3",
            entityId = "item-777",
            entityType = "MEDIA_ITEM",
            fieldPath = "playCount",
            operationType = CrdtOperationType.PN_COUNTER_INC,
            valueJson = "3",
            elementId = null,
            deviceId = "device-B",
            lamportTimestamp = 107L,
            wallTimestamp = 1070L
        )
        return Triple(op1, op2, op3)
    }

    private fun createDeviceCOperations(): Pair<CrdtOperationRecord, CrdtOperationRecord> {
        val op1 = CrdtOperationRecord(
            operationId = "devC-op1",
            entityId = "item-777",
            entityType = "MEDIA_ITEM",
            fieldPath = "tags",
            operationType = CrdtOperationType.OR_SET_REMOVE,
            valueJson = null,
            elementId = "tag-action",
            deviceId = "device-C",
            lamportTimestamp = 110L,
            wallTimestamp = 1100L
        )
        val op2 = CrdtOperationRecord(
            operationId = "devC-op2",
            entityId = "item-777",
            entityType = "MEDIA_ITEM",
            fieldPath = "playCount",
            operationType = CrdtOperationType.PN_COUNTER_INC,
            valueJson = "2",
            elementId = null,
            deviceId = "device-C",
            lamportTimestamp = 111L,
            wallTimestamp = 1110L
        )
        return op1 to op2
    }

    private fun verifyTitleConvergence(
        order1: List<CrdtOperationRecord>,
        order2: List<CrdtOperationRecord>,
        order3: List<CrdtOperationRecord>
    ) {
        val convergedTitle1 = reconciliationEngine.reconcileLwwField(order1.filter { it.fieldPath == "title" })?.valueJson
        val convergedTitle2 = reconciliationEngine.reconcileLwwField(order2.filter { it.fieldPath == "title" })?.valueJson
        val convergedTitle3 = reconciliationEngine.reconcileLwwField(order3.filter { it.fieldPath == "title" })?.valueJson

        assertEquals("Action Hero Final (B)", convergedTitle1)
        assertEquals(convergedTitle1, convergedTitle2)
        assertEquals(convergedTitle2, convergedTitle3)
    }

    private fun verifyTagsConvergence(
        order1: List<CrdtOperationRecord>,
        order2: List<CrdtOperationRecord>,
        order3: List<CrdtOperationRecord>
    ) {
        val convergedTags1 = reconciliationEngine.reconcileOrSet(order1.filter { it.fieldPath == "tags" })
        val convergedTags2 = reconciliationEngine.reconcileOrSet(order2.filter { it.fieldPath == "tags" })
        val convergedTags3 = reconciliationEngine.reconcileOrSet(order3.filter { it.fieldPath == "tags" })

        assertFalse(convergedTags1.contains("tag-action"))
        assertTrue(convergedTags1.contains("tag-drama"))
        assertEquals(convergedTags1, convergedTags2)
        assertEquals(convergedTags2, convergedTags3)
    }

    private fun verifyPlayCountConvergence(
        order1: List<CrdtOperationRecord>,
        order2: List<CrdtOperationRecord>,
        order3: List<CrdtOperationRecord>
    ) {
        val convergedPlayCount1 = reconciliationEngine.reconcilePnCounter(order1.filter { it.fieldPath == "playCount" })
        val convergedPlayCount2 = reconciliationEngine.reconcilePnCounter(order2.filter { it.fieldPath == "playCount" })
        val convergedPlayCount3 = reconciliationEngine.reconcilePnCounter(order3.filter { it.fieldPath == "playCount" })

        assertEquals(5L, convergedPlayCount1)
        assertEquals(convergedPlayCount1, convergedPlayCount2)
        assertEquals(convergedPlayCount2, convergedPlayCount3)
    }
}
