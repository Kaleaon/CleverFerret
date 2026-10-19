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
        // Device A mutates title and adds tag "Action" offline
        val deviceA_op1 = CrdtOperationRecord(
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

        val deviceA_op2 = CrdtOperationRecord(
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

        // Device B mutates title, adds tag "Drama", and increments playCount offline
        val deviceB_op1 = CrdtOperationRecord(
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

        val deviceB_op2 = CrdtOperationRecord(
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

        val deviceB_op3 = CrdtOperationRecord(
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

        // Device C removes tag "Action" and increments playCount offline
        val deviceC_op1 = CrdtOperationRecord(
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

        val deviceC_op2 = CrdtOperationRecord(
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

        // Scenario 1: Sync order A -> B -> C
        val order1 = listOf(deviceA_op1, deviceA_op2, deviceB_op1, deviceB_op2, deviceB_op3, deviceC_op1, deviceC_op2)

        // Scenario 2: Reverse sync order C -> B -> A
        val order2 = listOf(deviceC_op2, deviceC_op1, deviceB_op3, deviceB_op2, deviceB_op1, deviceA_op2, deviceA_op1)

        // Scenario 3: Interleaved arbitrary sync order
        val order3 = listOf(deviceB_op2, deviceA_op1, deviceC_op1, deviceB_op1, deviceC_op2, deviceA_op2, deviceB_op3)

        val convergedTitle1 = reconciliationEngine.reconcileLwwField(order1.filter { it.fieldPath == "title" })?.valueJson
        val convergedTitle2 = reconciliationEngine.reconcileLwwField(order2.filter { it.fieldPath == "title" })?.valueJson
        val convergedTitle3 = reconciliationEngine.reconcileLwwField(order3.filter { it.fieldPath == "title" })?.valueJson

        assertEquals("Action Hero Final (B)", convergedTitle1)
        assertEquals(convergedTitle1, convergedTitle2)
        assertEquals(convergedTitle2, convergedTitle3)

        val convergedTags1 = reconciliationEngine.reconcileOrSet(order1.filter { it.fieldPath == "tags" })
        val convergedTags2 = reconciliationEngine.reconcileOrSet(order2.filter { it.fieldPath == "tags" })
        val convergedTags3 = reconciliationEngine.reconcileOrSet(order3.filter { it.fieldPath == "tags" })

        assertFalse(convergedTags1.contains("tag-action"))
        assertTrue(convergedTags1.contains("tag-drama"))
        assertEquals(convergedTags1, convergedTags2)
        assertEquals(convergedTags2, convergedTags3)

        val convergedPlayCount1 = reconciliationEngine.reconcilePnCounter(order1.filter { it.fieldPath == "playCount" })
        val convergedPlayCount2 = reconciliationEngine.reconcilePnCounter(order2.filter { it.fieldPath == "playCount" })
        val convergedPlayCount3 = reconciliationEngine.reconcilePnCounter(order3.filter { it.fieldPath == "playCount" })

        assertEquals(5L, convergedPlayCount1)
        assertEquals(convergedPlayCount1, convergedPlayCount2)
        assertEquals(convergedPlayCount2, convergedPlayCount3)
    }
}
