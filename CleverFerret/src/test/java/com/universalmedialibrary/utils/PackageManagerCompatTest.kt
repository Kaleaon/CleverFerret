package com.universalmedialibrary.utils

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test
import org.mockito.kotlin.any
import org.mockito.kotlin.eq
import org.mockito.kotlin.mock
import org.mockito.kotlin.whenever

class PackageManagerCompatTest {

    companion object {
        private const val TEST_FLAGS_LONG = 128L
        private const val TEST_FLAGS_INT = 64
    }

    @Test
    fun `getPackageInfoCompat resolves package info when installed`() {
        val mockPm = mock<PackageManager>()
        val expectedInfo = PackageInfo().apply {
            packageName = "com.example.app"
            versionName = "2.1.0"
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            whenever(mockPm.getPackageInfo(eq("com.example.app"), any<PackageManager.PackageInfoFlags>()))
                .thenReturn(expectedInfo)
        } else {
            @Suppress("DEPRECATION")
            whenever(mockPm.getPackageInfo(eq("com.example.app"), any<Int>()))
                .thenReturn(expectedInfo)
        }

        val result = mockPm.getPackageInfoCompat("com.example.app")
        assertNotNull(result)
        assertEquals("com.example.app", result.packageName)
        assertEquals("2.1.0", result.versionName)
    }

    @Test(expected = PackageManager.NameNotFoundException::class)
    fun `getPackageInfoCompat propagates NameNotFoundException when package not found`() {
        val mockPm = mock<PackageManager>()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            whenever(mockPm.getPackageInfo(eq("com.missing.app"), any<PackageManager.PackageInfoFlags>()))
                .thenThrow(PackageManager.NameNotFoundException())
        } else {
            @Suppress("DEPRECATION")
            whenever(mockPm.getPackageInfo(eq("com.missing.app"), any<Int>()))
                .thenThrow(PackageManager.NameNotFoundException())
        }

        mockPm.getPackageInfoCompat("com.missing.app")
    }

    @Test
    fun `getPackageInfoCompat forwards custom flags`() {
        val mockPm = mock<PackageManager>()
        val expectedInfo = PackageInfo().apply {
            packageName = "com.example.app"
        }
        val flags = TEST_FLAGS_LONG

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            whenever(mockPm.getPackageInfo(eq("com.example.app"), any<PackageManager.PackageInfoFlags>()))
                .thenReturn(expectedInfo)
        } else {
            @Suppress("DEPRECATION")
            whenever(mockPm.getPackageInfo(eq("com.example.app"), eq(flags.toInt())))
                .thenReturn(expectedInfo)
        }

        val result = mockPm.getPackageInfoCompat("com.example.app", flags)
        assertEquals("com.example.app", result.packageName)
    }

    @Test
    fun `getPackageInfoCompat with Int flags delegates correctly`() {
        val mockPm = mock<PackageManager>()
        val expectedInfo = PackageInfo().apply {
            packageName = "com.example.app"
        }
        val flags = TEST_FLAGS_INT

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            whenever(mockPm.getPackageInfo(eq("com.example.app"), any<PackageManager.PackageInfoFlags>()))
                .thenReturn(expectedInfo)
        } else {
            @Suppress("DEPRECATION")
            whenever(mockPm.getPackageInfo(eq("com.example.app"), eq(flags)))
                .thenReturn(expectedInfo)
        }

        val result = mockPm.getPackageInfoCompat("com.example.app", flags)
        assertEquals("com.example.app", result.packageName)
    }
}
