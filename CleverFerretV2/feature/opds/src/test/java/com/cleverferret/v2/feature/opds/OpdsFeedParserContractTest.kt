package com.cleverferret.v2.feature.opds

import com.cleverferret.v2.feature.opds.services.opds.OpdsFeedParser
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class OpdsFeedParserContractTest {
    private val parser = OpdsFeedParser()

    @Test
    fun `parses internet archive style malformed xml`() {
        val xml = loadFixture("internet_archive_malformed_entities.xml")

        val feed = parser.parse("https://archive.org/opds", xml)

        assertEquals("Internet Archive Books", feed.title)
        assertEquals(1, feed.entries.size)
        assertEquals("Alpha & Omega &#oops", feed.entries.first().title)
        assertTrue(feed.entries.first().acquisitionLinks.first().href.contains("foo=1&bar=2"))
    }

    @Test
    fun `parses encoded multilingual entities`() {
        val xml = loadFixture("encoding_edge_case.xml")

        val feed = parser.parse("https://example.org/opds", xml)

        assertEquals("François & Español", feed.entries.first().title)
        assertEquals("Niño", feed.entries.first().authors.first())
    }

    private fun loadFixture(name: String): String {
        val stream = javaClass.classLoader?.getResourceAsStream("opds/$name") ?: error("Missing fixture: $name")
        return stream.bufferedReader().use { it.readText() }
    }
}
