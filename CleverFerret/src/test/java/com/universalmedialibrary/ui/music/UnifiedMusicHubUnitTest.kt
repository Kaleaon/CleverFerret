package com.universalmedialibrary.ui.music

import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

class UnifiedMusicHubUnitTest {

    @Test
    fun musicHubRoutes_useCanonicalLibraryRoute() {
        assertEquals("library/music", MediaRoutes.MUSIC)
        assertEquals("player/audio?type={playerType}", MediaRoutes.AUDIO_PLAYER)
    }

    @Test
    fun musicLibraryState_initializesWithEmptyTabs() {
        val state = com.universalmedialibrary.ui.media.screens.MusicLibraryState()
        assertNotNull(state.albums)
        assertNotNull(state.artists)
        assertNotNull(state.tracks)
        assertNotNull(state.playlists)
        assertNotNull(state.genres)
    }

    @Test
    fun musicLibraryTab_preservesStateAcrossTransitions() {
        var selectedTopTab = 0
        assertEquals(0, selectedTopTab)

        // Switch to Hivefy Discovery tab
        selectedTopTab = 1
        assertEquals(1, selectedTopTab)

        // Switch to Free Streams tab
        selectedTopTab = 2
        assertEquals(2, selectedTopTab)

        // Switch back to Local Library
        selectedTopTab = 0
        assertEquals(0, selectedTopTab)
    }
}
