package com.universalmedialibrary.parsers

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class ParserFactoryCapabilityTest {

    @Test
    fun `selectParser should expose explicit capabilities by format`() {
        val cases = listOf(
            "fixture.mobi" to "mobi-parser",
            "fixture.djvu" to "djvu-parser",
            "fixture.rtf" to "rtf-parser",
            "fixture.docx" to "docx-parser"
        )

        cases.forEach { (fileName, parserId) ->
            val selection = ParserFactory.selectParser(fileName)
            assertEquals(parserId, selection.capability.parserId)
            assertTrue(selection.capability.extensions.isNotEmpty())
            assertTrue(selection.capability.baselineConfidence in 0f..1f)
        }
    }

    @Test
    fun `normalizer should produce consistent paragraphs headings tables and warnings`() {
        val selection = ParserFactory.selectParser("fixture.mobi")
        val normalized = ParsedDocumentNormalizer.normalize(
            ParsedDocument(
                content = "Title\n\nFirst paragraph.\n\nSecond paragraph.",
                metadata = DocumentMetadata(),
                parserConfidence = 0.9f
            ),
            selection.capability
        )

        assertTrue(normalized.extractedParagraphs.size >= 2)
        assertTrue(normalized.extractedHeadings.isNotEmpty())
        assertTrue(normalized.parserConfidence in 0f..1f)
        assertTrue(normalized.warnings.any { it.contains("Heading extraction", ignoreCase = true) })
    }
}
