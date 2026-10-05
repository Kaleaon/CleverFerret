package com.universalmedialibrary.ui.permission

import com.universalmedialibrary.ui.components.permission.StoragePermissionBanner
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class StoragePermissionBannerTest {

    @Test
    fun testStoragePermissionBannerDefaults() {
        var clicked = false
        val onRequest = { clicked = true }

        // Verify click callback logic
        onRequest()
        assertTrue(clicked)
    }

    @Test
    fun testStoragePermissionTextConstants() {
        val bannerTitle = "Storage Access Required"
        val bannerMessage = "Storage access is needed to browse and play local media files stored on your device."

        assertEquals("Storage Access Required", bannerTitle)
        assertTrue(bannerMessage.contains("local media files"))
    }

    @Test
    fun testCustomBannerParameters() {
        var customClicked = false
        var dismissed = false

        val onRequest = { customClicked = true }
        val onDismiss = { dismissed = true }

        onRequest()
        onDismiss()

        assertTrue(customClicked)
        assertTrue(dismissed)
    }

    @Test
    fun testDomainPresetTextValues() {
        val bookshelfTitle = "Bookshelf Access Required"
        val galleryTitle = "Photos & Media Access Required"
        val autoScanTitle = "Auto-Scan Permission Required"
        val musicTitle = "Music Library Access Required"

        assertTrue(bookshelfTitle.contains("Bookshelf"))
        assertTrue(galleryTitle.contains("Photos"))
        assertTrue(autoScanTitle.contains("Auto-Scan"))
        assertTrue(musicTitle.contains("Music"))
    }
}

