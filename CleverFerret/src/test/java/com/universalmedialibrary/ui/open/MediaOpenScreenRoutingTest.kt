package com.universalmedialibrary.ui.open

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Test

class MediaOpenScreenRoutingTest {

    @Test
    fun resolveViewerTarget_routesMusicTrackToAudio() {
        val target = resolveViewerTarget(
            fileExtension = "",
            fileName = "stream",
            mediaTypeRaw = "MUSIC_TRACK"
        )

        assertEquals(OpenViewerTarget.AUDIO, target)
        assertNotEquals(OpenViewerTarget.NONE, target)
    }

    @Test
    fun resolveViewerTarget_routesMusicToAudio() {
        val target = resolveViewerTarget(
            fileExtension = "",
            fileName = "stream",
            mediaTypeRaw = "MUSIC"
        )

        assertEquals(OpenViewerTarget.AUDIO, target)
        assertNotEquals(OpenViewerTarget.NONE, target)
    }

    @Test
    fun resolveViewerTarget_routesMusicAlbumToAudio() {
        val target = resolveViewerTarget(
            fileExtension = "",
            fileName = "stream",
            mediaTypeRaw = "MUSIC_ALBUM"
        )

        assertEquals(OpenViewerTarget.AUDIO, target)
        assertNotEquals(OpenViewerTarget.NONE, target)
    }
}
