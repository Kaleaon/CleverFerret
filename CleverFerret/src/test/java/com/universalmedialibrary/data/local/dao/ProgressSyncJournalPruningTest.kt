package com.universalmedialibrary.data.local.dao

import com.universalmedialibrary.data.local.entity.ProgressSyncJournal
import io.mockk.*
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Test

class ProgressSyncJournalPruningTest {

    @Test
    fun `pruneSyncedEntries deletes records older than 30 days`() = runBlocking {
        val dao = mockk<ProgressSyncJournalDao>(relaxed = true)
        val cutoffSlot = slot<Long>()

        coEvery { dao.pruneSyncedEntries(any()) } coAnswers {
            callOriginal()
        }
        coEvery { dao.deleteProcessedOlderThan(capture(cutoffSlot)) } returns 5

        val retentionPeriod = 30L * 24 * 60 * 60 * 1000L
        val beforeCall = System.currentTimeMillis() - retentionPeriod
        val deletedCount = dao.pruneSyncedEntries(retentionPeriod)
        val afterCall = System.currentTimeMillis() - retentionPeriod

        assertEquals(5, deletedCount)
        val captured = cutoffSlot.captured
        assert(captured in beforeCall..afterCall) { "Captured threshold $captured should be around $beforeCall" }
    }
}
