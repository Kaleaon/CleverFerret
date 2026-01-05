package com.universalmedialibrary.data.local.entity

import org.junit.Assert.*
import org.junit.Test

class ReaderSettingsTest {

    @Test
    fun `merge uses book settings when available`() {
        val global = ReaderSettingsEntity(
            fontSize = 18,
            theme = "Light"
        )
        val book = BookReaderSettingsEntity(
            bookId = 1L,
            fontSize = 24, // Override
            theme = null   // Inherit
        )

        val merged = ReaderSettings.merge(global, book)

        assertEquals(24, merged.fontSize)
        assertEquals("Light", merged.theme)
    }

    @Test
    fun `merge falls back to global when book settings are null`() {
        val global = ReaderSettingsEntity(
            fontSize = 18,
            theme = "Light"
        )

        val merged = ReaderSettings.merge(global, null)

        assertEquals(18, merged.fontSize)
        assertEquals("Light", merged.theme)
    }

    @Test
    fun `computed colors match theme`() {
        val dark = ReaderSettings(
            fontSize = 18, fontFamily = "Default", lineHeight = 1.5f,
            theme = "Dark", brightness = 1.0f,
            currentPage = 0, currentChapter = 0, currentPosition = 0f, lastReadAt = 0,
            marginTop = 0, marginBottom = 0, marginLeft = 0, marginRight = 0,
            keepScreenOn = false, fullScreenMode = false
        )

        assertEquals("#000000", dark.backgroundColor)
        assertEquals("#FFFFFF", dark.textColor)

        val light = dark.copy(theme = "Light")
        assertEquals("#FFFFFF", light.backgroundColor)
        assertEquals("#000000", light.textColor)
    }
}
