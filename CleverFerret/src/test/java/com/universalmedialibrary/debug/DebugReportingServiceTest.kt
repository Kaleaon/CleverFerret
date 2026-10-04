package com.universalmedialibrary.debug

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import com.google.common.truth.Truth.assertThat
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import org.junit.Before
import org.junit.Test
import java.io.File

class DebugReportingServiceTest {

    @MockK
    lateinit var context: Context

    @MockK
    lateinit var packageManager: PackageManager

    private lateinit var tempFilesDir: File
    private lateinit var debugReportingService: DebugReportingService

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        tempFilesDir = File.createTempFile("test_files", "").apply {
            delete()
            mkdirs()
        }

        every { context.filesDir } returns tempFilesDir
        every { context.packageName } returns "com.universalmedialibrary"
        every { context.packageManager } returns packageManager

        val packageInfo = PackageInfo().apply {
            versionName = "1.0.0"
            versionCode = 1
        }
        every { packageManager.getPackageInfo("com.universalmedialibrary", 0) } returns packageInfo

        val resources = mockk<android.content.res.Resources>(relaxed = true)
        val metrics = android.util.DisplayMetrics().apply {
            density = 2.0f
            widthPixels = 1080
            heightPixels = 1920
        }
        every { context.resources } returns resources
        every { resources.displayMetrics } returns metrics

        debugReportingService = DebugReportingService(context)
    }

    @Test
    fun `getPerformanceMetrics returns valid on-demand snapshot and updates state flow`() {
        val metrics = debugReportingService.getPerformanceMetrics()

        assertThat(metrics.memoryMaxMB).isGreaterThan(0L)
        assertThat(metrics.lastUpdated).isGreaterThan(0L)
        assertThat(debugReportingService.performanceMetrics.value).isEqualTo(metrics)
    }

    @Test
    fun `createBugReport calculates fresh performance metrics on demand`() {
        val bugReport = debugReportingService.createBugReport(
            title = "Test Bug",
            description = "Test Description",
            steps = "Steps to reproduce"
        )

        assertThat(bugReport.title).isEqualTo("Test Bug")
        assertThat(bugReport.performanceSnapshot.memoryMaxMB).isGreaterThan(0L)
        assertThat(bugReport.performanceSnapshot.lastUpdated).isGreaterThan(0L)
    }

    @Test
    fun `exportAllLogs includes fresh performance metrics on demand`() {
        val logFile = debugReportingService.exportAllLogs()

        assertThat(logFile.exists()).isTrue()
        assertThat(logFile.length()).isGreaterThan(0L)
        assertThat(debugReportingService.performanceMetrics.value.lastUpdated).isGreaterThan(0L)
    }
}
