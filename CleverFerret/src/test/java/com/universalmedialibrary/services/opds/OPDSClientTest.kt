package com.universalmedialibrary.services.opds

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Unit tests for OPDSClient XML entity sanitization.
 * 
 * Tests verify that malformed XML with unescaped ampersands (common in Internet Archive feeds)
 * is properly sanitized before parsing.
 */
class OPDSClientTest {

    /**
     * Regex to match ampersands that are NOT part of valid XML entity references.
     * Duplicated from OPDSClient for testing purposes.
     */
    private val INVALID_AMPERSAND_REGEX = Regex(
        "&(?!(amp|lt|gt|quot|apos|#\\d+|#x[0-9a-fA-F]+);)"
    )
    
    private fun sanitizeXmlEntities(xmlContent: String): String {
        return xmlContent.replace(INVALID_AMPERSAND_REGEX, "&amp;")
    }

    @Test
    fun `sanitize unescaped ampersand in URL`() {
        val input = """<link href="http://example.com?foo=1&bar=2"/>"""
        val expected = """<link href="http://example.com?foo=1&amp;bar=2"/>"""
        assertEquals(expected, sanitizeXmlEntities(input))
    }

    @Test
    fun `sanitize multiple unescaped ampersands`() {
        val input = """<link href="http://example.com?a=1&b=2&c=3"/>"""
        val expected = """<link href="http://example.com?a=1&amp;b=2&amp;c=3"/>"""
        assertEquals(expected, sanitizeXmlEntities(input))
    }

    @Test
    fun `preserve valid amp entity`() {
        val input = """<title>Tom &amp; Jerry</title>"""
        assertEquals(input, sanitizeXmlEntities(input))
    }

    @Test
    fun `preserve valid lt entity`() {
        val input = """<title>a &lt; b</title>"""
        assertEquals(input, sanitizeXmlEntities(input))
    }

    @Test
    fun `preserve valid gt entity`() {
        val input = """<title>a &gt; b</title>"""
        assertEquals(input, sanitizeXmlEntities(input))
    }

    @Test
    fun `preserve valid quot entity`() {
        val input = """<title>Say &quot;Hello&quot;</title>"""
        assertEquals(input, sanitizeXmlEntities(input))
    }

    @Test
    fun `preserve valid apos entity`() {
        val input = """<title>It&apos;s fine</title>"""
        assertEquals(input, sanitizeXmlEntities(input))
    }

    @Test
    fun `preserve numeric entity decimal`() {
        val input = """<title>&#169; Copyright</title>"""
        assertEquals(input, sanitizeXmlEntities(input))
    }

    @Test
    fun `preserve numeric entity hexadecimal`() {
        val input = """<title>&#x00A9; Copyright</title>"""
        assertEquals(input, sanitizeXmlEntities(input))
    }

    @Test
    fun `sanitize mixed valid and invalid entities`() {
        val input = """<content>Tom &amp; Jerry visit http://foo.com?x=1&y=2 &lt;together&gt;</content>"""
        val expected = """<content>Tom &amp; Jerry visit http://foo.com?x=1&amp;y=2 &lt;together&gt;</content>"""
        assertEquals(expected, sanitizeXmlEntities(input))
    }

    @Test
    fun `sanitize Internet Archive style malformed URL`() {
        // This simulates the kind of malformed XML that Internet Archive OPDS feeds return
        val input = """<link href="https://archive.org/services/opds?search=foo&page=1"/>"""
        val expected = """<link href="https://archive.org/services/opds?search=foo&amp;page=1"/>"""
        assertEquals(expected, sanitizeXmlEntities(input))
    }

    @Test
    fun `sanitize content with ampersand at end of text`() {
        val input = """<title>Barnes & Noble Books</title>"""
        val expected = """<title>Barnes &amp; Noble Books</title>"""
        assertEquals(expected, sanitizeXmlEntities(input))
    }

    @Test
    fun `handle empty string`() {
        assertEquals("", sanitizeXmlEntities(""))
    }

    @Test
    fun `handle string with no ampersands`() {
        val input = """<title>Simple Title</title>"""
        assertEquals(input, sanitizeXmlEntities(input))
    }

    @Test
    fun `preserve valid OPDS feed with properly escaped entities`() {
        val validFeed = """<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <title>Test &amp; Catalog</title>
  <entry>
    <title>Book Title</title>
    <link href="http://example.com/book?id=1&amp;format=epub"/>
  </entry>
</feed>"""
        assertEquals(validFeed, sanitizeXmlEntities(validFeed))
    }

    @Test
    fun `fix malformed OPDS feed with unescaped ampersands`() {
        val malformedFeed = """<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <title>Test & Catalog</title>
  <entry>
    <title>Book Title</title>
    <link href="http://example.com/book?id=1&format=epub"/>
  </entry>
</feed>"""
        val expectedFeed = """<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <title>Test &amp; Catalog</title>
  <entry>
    <title>Book Title</title>
    <link href="http://example.com/book?id=1&amp;format=epub"/>
  </entry>
</feed>"""
        assertEquals(expectedFeed, sanitizeXmlEntities(malformedFeed))
    }
}
