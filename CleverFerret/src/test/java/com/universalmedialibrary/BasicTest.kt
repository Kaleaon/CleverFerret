package com.universalmedialibrary

import org.junit.Test
import org.junit.Assert.*

/**
 * Simple unit test to verify basic functionality
 */
class BasicTest {

    @Test
    fun mediaType_enum_shouldHaveCorrectValues() {
        val mediaTypes = com.universalmedialibrary.data.MediaType.values()
        assertTrue("MediaType should contain BOOK", mediaTypes.contains(com.universalmedialibrary.data.MediaType.BOOK))
        assertTrue("MediaType should contain MOVIE", mediaTypes.contains(com.universalmedialibrary.data.MediaType.MOVIE))
        assertTrue("MediaType should contain MUSIC_TRACK", mediaTypes.contains(com.universalmedialibrary.data.MediaType.MUSIC_TRACK))
    }

    @Test
    fun addition_isCorrect() {
        assertEquals(4, 2 + 2)
    }
}