package com.universalmedialibrary.services.ocr

import android.graphics.Bitmap
import android.graphics.Rect
import kotlinx.coroutines.test.runTest
import org.junit.Assert.*
import org.junit.Test

/**
 * Unit tests for OCR service
 */
class OcrServiceTest {

    @Test
    fun `OcrResult contains expected fields`() {
        val result = OcrResult(
            text = "Sample text",
            blocks = emptyList(),
            confidence = 0.9f
        )

        assertEquals("Sample text", result.text)
        assertEquals(0.9f, result.confidence, 0.001f)
        assertTrue(result.blocks.isEmpty())
    }

    @Test
    fun `TextBlock contains expected fields`() {
        val block = TextBlock(
            text = "Block text",
            boundingBox = Rect(0, 0, 100, 50),
            confidence = 0.95f,
            lines = emptyList()
        )

        assertEquals("Block text", block.text)
        assertEquals(0.95f, block.confidence, 0.001f)
        assertEquals(Rect(0, 0, 100, 50), block.boundingBox)
    }

    @Test
    fun `TextLine contains expected fields`() {
        val line = TextLine(
            text = "Line text",
            boundingBox = Rect(10, 10, 90, 40),
            confidence = 0.88f,
            words = emptyList()
        )

        assertEquals("Line text", line.text)
        assertEquals(0.88f, line.confidence, 0.001f)
        assertEquals(Rect(10, 10, 90, 40), line.boundingBox)
    }

    @Test
    fun `TextWord contains expected fields`() {
        val word = TextWord(
            text = "Word",
            boundingBox = Rect(20, 20, 40, 35),
            confidence = 0.92f
        )

        assertEquals("Word", word.text)
        assertEquals(0.92f, word.confidence, 0.001f)
        assertEquals(Rect(20, 20, 40, 35), word.boundingBox)
    }
}
