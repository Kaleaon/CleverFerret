package com.universalmedialibrary.debug

import android.content.Context
import com.google.common.truth.Truth.assertThat
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.advanceTimeBy
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test
import java.io.File

@OptIn(ExperimentalCoroutinesApi::class)
class DebugReportingServiceTest {

    @MockK
    lateinit var context: Context

    private val dispatcher = StandardTestDispatcher()
    private lateinit var service: DebugReportingService
    private val testDir = File("/tmp/debug_service_test_${System.currentTimeMillis()}").also { it.mkdirs() }

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        Dispatchers.setMain(dispatcher)

        every { context.filesDir } returns testDir
        every { context.packageName } returns "com.universalmedialibrary"

        service = DebugReportingService(context)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
        testDir.deleteRecursively()
    }

    @Test
    fun `getPerformanceSnapshot returns valid performance metrics on demand`() {
        val snapshot = service.getPerformanceSnapshot()
        
        assertThat(snapshot).isNotNull()
        assertThat(snapshot.lastUpdated).isGreaterThan(0L)
        assertThat(snapshot.memoryUsedMB).isAtLeast(0L)
    }

    @Test
    fun `createBugReport retrieves accurate performance snapshot on demand`() {
        val bugReport = service.createBugReport(
            title = "Test Bug",
            description = "Test Description",
            steps = "Step 1"
        )

        assertThat(bugReport.performanceSnapshot).isNotNull()
        assertThat(bugReport.performanceSnapshot.lastUpdated).isGreaterThan(0L)
    }

    @Test
    fun `exportAllLogs retrieves accurate performance snapshot on demand`() {
        val exportFile = service.exportAllLogs()

        assertThat(exportFile.exists()).isTrue()
        val text = exportFile.readText()
        assertThat(text).contains("performance")
    }

    @Test
    fun `performanceMetrics flow emits metrics when subscribed`() = runTest {
        var emittedMetrics: PerformanceMetrics? = null
        val job = launch {
            service.performanceMetrics.collect { metrics ->
                emittedMetrics = metrics
            }
        }

        advanceTimeBy(100)
        assertThat(emittedMetrics).isNotNull()

        job.cancel()
    }
}
