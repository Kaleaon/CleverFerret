package com.universalmedialibrary.utils.media

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Test
import java.io.File

class AudioMetadataUtilsTest {

    @Test
    fun testParseNumberPair() {
        assertEquals(3 to 12, AudioMetadataUtils.parseNumberPair("3/12"))
        assertEquals(3 to 12, AudioMetadataUtils.parseNumberPair("3-12"))
        assertEquals(3 to null, AudioMetadataUtils.parseNumberPair("3"))
        assertEquals(1 to null, AudioMetadataUtils.parseNumberPair(" 01 "))
        assertEquals(null to null, AudioMetadataUtils.parseNumberPair(null))
        assertEquals(null to null, AudioMetadataUtils.parseNumberPair(""))
        assertEquals(null to null, AudioMetadataUtils.parseNumberPair("invalid"))
    }

    @Test
    fun testNonExistentFileReturnsBasicMetadata() {
        val nonExistentFile = File("non_existent_song.flac")
        val metadata = AudioMetadataUtils.extractAudioMetadata(nonExistentFile)

        assertNotNull(metadata)
        assertEquals("non_existent_song", metadata.title)
        assertNull(metadata.artist)
        assertNull(metadata.album)
        assertNull(metadata.durationMs)
    }

    @Test
    fun testMusicTrackInfoExtractionFallback() {
        val oggFile = File("test_track.ogg")
        val trackInfo = AudioMetadataUtils.extractMusicTrackInfo(oggFile)

        assertNotNull(trackInfo)
        assertEquals("test_track", trackInfo.title)
        assertNull(trackInfo.artist)
        assertNull(trackInfo.album)
    }

    @Test
    fun testDurationAndAlbumArtFallback() {
        val aiffFile = File("sample_audio.aiff")
        val duration = AudioMetadataUtils.extractAudioDuration(aiffFile)
        val albumArt = AudioMetadataUtils.extractEmbeddedAlbumArtBytes(aiffFile.absolutePath)

        assertNull(duration)
        assertNull(albumArt)
    }
}
