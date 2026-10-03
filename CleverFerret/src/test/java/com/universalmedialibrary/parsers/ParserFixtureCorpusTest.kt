package com.universalmedialibrary.parsers

import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

class ParserFixtureCorpusTest {

    @Test
    fun `fixture corpus should include happy corrupted and edge encoding for each format`() {
        val root = File("src/test/resources/parsers")
        val formats = listOf("mobi", "djvu", "rtf", "docx")
        val fixtureKinds = listOf("happy", "corrupted", "edge-encoding")

        formats.forEach { format ->
            fixtureKinds.forEach { kind ->
                val matching = root.resolve(format).listFiles().orEmpty().any { it.name.startsWith(kind) }
                assertTrue("Missing $kind fixture for $format", matching)
            }
        }
    }
}
