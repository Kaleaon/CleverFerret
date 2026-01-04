package com.universalmedialibrary.services.opds

import org.junit.Assert.*
import org.junit.Test
import com.universalmedialibrary.services.opds.OpdsFeedGenerator.MediaItemEntry

class OpdsFeedGeneratorTest {

    private val generator = OpdsFeedGenerator()

    @Test
    fun `generateAcquisitionFeed includes pagination links`() {
        val items = listOf(
            MediaItemEntry(
                id = 1L,
                title = "Book 1",
                author = "Author 1",
                description = "Description",
                mimeType = "application/epub+zip",
                thumbnailUrl = null
            )
        )

        val feed = generator.generateAcquisitionFeed(
            title = "Test Feed",
            items = items,
            selfLink = "/opds/test?page=1",
            nextLink = "/opds/test?page=2",
            prevLink = "/opds/test?page=0"
        )

        // Verify XML structure
        assertTrue(feed.contains("<title>Test Feed</title>"))
        assertTrue(feed.contains("<id>urn:uuid:cleverferret:feed</id>"))

        // Verify links
        assertTrue(feed.contains("rel=\"self\" href=\"/opds/test?page=1\""))
        assertTrue(feed.contains("rel=\"next\" href=\"/opds/test?page=2\""))
        assertTrue(feed.contains("rel=\"previous\" href=\"/opds/test?page=0\""))

        // Verify entry
        assertTrue(feed.contains("<entry>"))
        assertTrue(feed.contains("<title>Book 1</title>"))
        assertTrue(feed.contains("<name>Author 1</name>"))
        assertTrue(feed.contains("href=\"/opds/download/1\""))
    }

    @Test
    fun `generateAcquisitionFeed handles special characters`() {
        val items = listOf(
            MediaItemEntry(
                id = 2L,
                title = "Book & Symbols < >",
                author = "Author & Son",
                description = "Desc with \"quotes\"",
                mimeType = "application/epub+zip",
                thumbnailUrl = null
            )
        )

        val feed = generator.generateAcquisitionFeed(
            title = "Special Chars",
            items = items,
            selfLink = "/opds/test"
        )

        assertTrue(feed.contains("Book &amp; Symbols &lt; &gt;"))
        assertTrue(feed.contains("Author &amp; Son"))
        assertTrue(feed.contains("Desc with &quot;quotes&quot;"))
    }
}
