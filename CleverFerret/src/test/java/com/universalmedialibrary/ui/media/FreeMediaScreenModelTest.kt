package com.universalmedialibrary.ui.media

import com.universalmedialibrary.services.media.free.FreeMediaItem
import com.universalmedialibrary.services.media.free.FreeMediaSource
import com.universalmedialibrary.services.media.free.FreeMediaType
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNull
import org.junit.Test

class FreeMediaScreenModelTest {

    @Test
    fun toUiModel_usesNullSafeFallbacks_whenOptionalFieldsAreMissing() {
        val item = FreeMediaItem(
            id = "missing-optionals",
            type = FreeMediaType.FEATURE_FILM,
            source = FreeMediaSource.INTERNET_ARCHIVE,
            title = "Untitled Test Movie",
            thumbnailUrl = null,
            runtimeSeconds = null,
            year = null
        )

        val uiModel = item.toUiModel()

        assertNull(uiModel.thumbnailUrl)
        assertEquals("Year unknown", uiModel.yearLabel)
        assertEquals("Duration unknown", uiModel.durationLabel)
    }

    @Test
    fun freeMediaItemKey_fallsBackToDeterministicKey_whenIdIsBlank() {
        val item = FreeMediaItem(
            id = " ",
            type = FreeMediaType.NATIONAL_SCREENING_ROOM,
            source = FreeMediaSource.LIBRARY_OF_CONGRESS,
            title = "Sample Record",
            year = null
        )

        val keyAtFirstIndex = freeMediaItemKey(item = item, index = 0)
        val keyAtSecondIndex = freeMediaItemKey(item = item, index = 1)

        assertEquals("NATIONAL_SCREENING_ROOM:Sample Record:unknown-year:0", keyAtFirstIndex)
        assertNotEquals(keyAtFirstIndex, keyAtSecondIndex)
    }
}
