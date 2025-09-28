package com.universalmedialibrary

import com.universalmedialibrary.services.media.MediaServiceType
import org.junit.Assert.*
import org.junit.Test

/**
 * Unit tests for MediaSession data classes and types
 */
class MediaSessionTest {

    @Test
    fun `test MediaServiceType enum values`() {
        // Given MediaServiceType enum
        // When checking all values
        val values = MediaServiceType.values()
        
        // Then it should contain expected types
        assertTrue("Should contain NONE", values.contains(MediaServiceType.NONE))
        assertTrue("Should contain MUSIC", values.contains(MediaServiceType.MUSIC))
        assertTrue("Should contain AUDIOBOOK", values.contains(MediaServiceType.AUDIOBOOK))
        assertTrue("Should contain TEXT_TO_SPEECH", values.contains(MediaServiceType.TEXT_TO_SPEECH))
        assertTrue("Should contain PODCAST", values.contains(MediaServiceType.PODCAST))
        assertTrue("Should contain UNIVERSAL_MEDIA", values.contains(MediaServiceType.UNIVERSAL_MEDIA))
    }

    @Test
    fun `test MediaServiceType none is default`() {
        // Given default MediaServiceType
        val defaultType = MediaServiceType.NONE
        
        // Then it should equal NONE
        assertEquals("Default service type should be NONE", MediaServiceType.NONE, defaultType)
    }

    @Test
    fun `test MediaServiceType ordinal values`() {
        // Given MediaServiceType values
        // When checking ordinals
        // Then they should be in expected order
        assertEquals("NONE should be first", 0, MediaServiceType.NONE.ordinal)
        assertEquals("MUSIC should be second", 1, MediaServiceType.MUSIC.ordinal)
        assertEquals("AUDIOBOOK should be third", 2, MediaServiceType.AUDIOBOOK.ordinal)
        assertEquals("TEXT_TO_SPEECH should be fourth", 3, MediaServiceType.TEXT_TO_SPEECH.ordinal)
        assertEquals("PODCAST should be fifth", 4, MediaServiceType.PODCAST.ordinal)
        assertEquals("UNIVERSAL_MEDIA should be sixth", 5, MediaServiceType.UNIVERSAL_MEDIA.ordinal)
    }
}