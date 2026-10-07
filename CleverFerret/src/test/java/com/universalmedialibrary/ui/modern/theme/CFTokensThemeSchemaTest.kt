package com.universalmedialibrary.ui.modern.theme

import androidx.compose.ui.graphics.Color
import com.universalmedialibrary.services.manga.source.MangaState
import com.universalmedialibrary.services.webfiction.DownloadStatus
import com.universalmedialibrary.services.webfiction.StoryStatus
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

class CFTokensThemeSchemaTest {

    @Test
    fun testAllThemesRegisteredInRegistry() {
        val themes = CFThemes.All
        assertEquals(10, themes.size)

        val themeIds = themes.map { it.tokens.id }
        assertTrue(themeIds.contains("navy-gold"))
        assertTrue(themeIds.contains("rose-gold"))
        assertTrue(themeIds.contains("emerald-silver"))
        assertTrue(themeIds.contains("midnight-amber"))
        assertTrue(themeIds.contains("paper-ink"))
        assertTrue(themeIds.contains("neo-noir-neon"))
        assertTrue(themeIds.contains("lcars"))
        assertTrue(themeIds.contains("metro"))
        assertTrue(themeIds.contains("e-ink"))
        assertTrue(themeIds.contains("high-contrast"))
    }

    @Test
    fun testStatusColorsResolutionForStoryStatus() {
        for (palette in CFThemes.All) {
            val status = palette.tokens.status
            assertNotNull(status.forStoryStatus(StoryStatus.COMPLETED))
            assertNotNull(status.forStoryStatus(StoryStatus.ONGOING))
            assertNotNull(status.forStoryStatus(StoryStatus.HIATUS))
            assertNotNull(status.forStoryStatus(StoryStatus.CANCELLED))
            assertNotNull(status.forStoryStatus(StoryStatus.UNKNOWN))
        }
    }

    @Test
    fun testStatusColorsResolutionForDownloadStatus() {
        for (palette in CFThemes.All) {
            val status = palette.tokens.status
            assertNotNull(status.forDownloadStatus(DownloadStatus.DOWNLOADED))
            assertNotNull(status.forDownloadStatus(DownloadStatus.DOWNLOADING))
            assertNotNull(status.forDownloadStatus(DownloadStatus.OUTDATED))
            assertNotNull(status.forDownloadStatus(DownloadStatus.FAILED))
            assertNotNull(status.forDownloadStatus(DownloadStatus.NOT_DOWNLOADED))
        }
    }

    @Test
    fun testStatusColorsResolutionForMangaState() {
        for (palette in CFThemes.All) {
            val status = palette.tokens.status
            assertNotNull(status.forMangaState(MangaState.ONGOING))
            assertNotNull(status.forMangaState(MangaState.FINISHED))
            assertNotNull(status.forMangaState(MangaState.ABANDONED))
            assertNotNull(status.forMangaState(MangaState.PAUSED))
            assertNotNull(status.forMangaState(MangaState.UPCOMING))
            assertNotNull(status.forMangaState(MangaState.UNKNOWN))
        }
    }

    @Test
    fun testPlayerControlsNonUnspecified() {
        for (palette in CFThemes.All) {
            val player = palette.tokens.playerControls
            assertNotNull(player.playButtonContainer)
            assertNotNull(player.playButtonIcon)
            assertNotNull(player.controlIcon)
            assertNotNull(player.secondaryControlContainer)
            assertNotNull(player.activeTrack)
            assertNotNull(player.inactiveTrack)
            assertNotNull(player.thumb)
            assertNotNull(player.activeAccent)
            assertNotNull(player.surfaceOverlay)
            assertNotNull(player.sheetBackground)
        }
    }

    @Test
    fun testCFTokensBackwardsCompatibilityDefaults() {
        val defaultTokens = CFTokens(
            id = "test-custom",
            displayName = "Custom Test Theme",
            layout = CFLayout.Compose,
            metal = CFMetal(
                shadow = Color.Black,
                base = Color.Gray,
                highlight = Color.LightGray,
                shimmer = Color.White
            )
        )
        assertNotNull(defaultTokens.status)
        assertNotNull(defaultTokens.playerControls)
        assertEquals(Color(0xFF4CAF50), defaultTokens.status.completed)
        assertEquals(Color(0xFFFFD166), defaultTokens.playerControls.playButtonContainer)
    }

    @Test
    fun testEInkTokensMonochromeContract() {
        val eInk = CFThemes.byId("e-ink").tokens
        assertEquals(Color.Black, eInk.status.completed)
        assertEquals(Color.Black, eInk.status.ongoing)
        assertEquals(Color.Black, eInk.playerControls.playButtonContainer)
        assertEquals(Color.White, eInk.playerControls.playButtonIcon)
    }

    @Test
    fun testHighContrastTokensContract() {
        val hc = CFThemes.byId("high-contrast").tokens
        assertEquals(Color(0xFF00FF00), hc.status.completed)
        assertEquals(Color(0xFF00FFFF), hc.status.ongoing)
        assertEquals(Color.Yellow, hc.playerControls.playButtonContainer)
        assertEquals(Color.Black, hc.playerControls.playButtonIcon)
    }
}
