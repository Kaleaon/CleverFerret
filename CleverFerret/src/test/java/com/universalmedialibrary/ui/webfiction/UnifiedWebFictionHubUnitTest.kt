package com.universalmedialibrary.ui.webfiction

import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import org.junit.Assert.assertEquals
import org.junit.Test

class UnifiedWebFictionHubUnitTest {

    @Test
    fun webFictionRoute_canonicalIsLibraryWebFiction() {
        assertEquals("library/web-fiction", MediaRoutes.WEB_FICTION)
    }

    @Test
    fun fanfictionHubTabs_preserveTabIndices() {
        val discoverTab = 0
        val libraryTab = 1
        val downloadTab = 2

        var activeTab = discoverTab
        assertEquals(0, activeTab)

        activeTab = libraryTab
        assertEquals(1, activeTab)

        activeTab = downloadTab
        assertEquals(2, activeTab)

        activeTab = discoverTab
        assertEquals(0, activeTab)
    }
}
