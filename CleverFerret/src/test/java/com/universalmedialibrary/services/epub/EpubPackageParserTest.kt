package com.universalmedialibrary.services.epub

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class EpubPackageParserTest {

    @Test
    fun `parseMetadata reads namespaced Dublin Core fields`() {
        val opf = """
            <package xmlns:dc="http://purl.org/dc/elements/1.1/">
              <metadata>
                <dc:title>Sample Book</dc:title>
                <dc:creator>Author One</dc:creator>
                <dc:creator>Author Two</dc:creator>
                <dc:language>en</dc:language>
                <dc:publisher>Test Pub</dc:publisher>
                <dc:identifier scheme="ISBN">1234567890</dc:identifier>
              </metadata>
            </package>
        """.trimIndent()

        val metadata = EpubPackageParser.parseMetadata(opf)

        assertEquals("Sample Book", metadata.title)
        assertEquals(listOf("Author One", "Author Two"), metadata.authors)
        assertEquals("en", metadata.language)
        assertEquals("Test Pub", metadata.publisher)
        assertEquals("1234567890", metadata.isbn)
    }

    @Test
    fun `parseSpine preserves declared reading order`() {
        val opf = """
            <package>
              <manifest>
                <item id="c1" href="chapter1.xhtml" media-type="application/xhtml+xml"/>
                <item id="c2" href="chapter2.xhtml" media-type="application/xhtml+xml"/>
                <item id="c3" href="chapter3.xhtml" media-type="application/xhtml+xml"/>
              </manifest>
              <spine>
                <itemref idref="c2"/>
                <itemref idref="c1"/>
                <itemref idref="c3"/>
              </spine>
            </package>
        """.trimIndent()

        val spine = EpubPackageParser.parseSpine(opf)

        assertEquals(listOf("c2", "c1", "c3"), spine)
    }

    @Test
    fun `chapter navigator enforces next previous and bounds`() {
        val state = EpubReaderState(
            isLoaded = true,
            totalChapters = 3,
            currentChapter = 1
        )

        assertEquals(2, EpubChapterNavigator.nextIndex(state))
        assertEquals(0, EpubChapterNavigator.previousIndex(state))
        assertEquals(2, EpubChapterNavigator.validIndex(state, 2))
        assertNull(EpubChapterNavigator.validIndex(state, 3))
    }
}
