package com.universalmedialibrary.services.opds

import javax.inject.Inject
import javax.inject.Singleton

/**
 * OPDS feed generator for exposing library content via OPDS protocol.
 * Generates Atom XML feeds compatible with OPDS readers.
 * 
 * OPDS (Open Publication Distribution System) is a syndication format for electronic publications
 * based on Atom and HTTP. It enables the aggregation, distribution, discovery, and acquisition
 * of electronic publications.
 */
@Singleton
class OpdsFeedGenerator @Inject constructor() {
    
    /**
     * Generate root catalog feed
     */
    fun generateCatalogFeed(title: String = "CleverFerret OPDS"): String {
        val timestamp = java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", java.util.Locale.US).apply {
            timeZone = java.util.TimeZone.getTimeZone("UTC")
        }.format(java.util.Date())
        
        return """
            <?xml version="1.0" encoding="utf-8"?>
            <feed xmlns="http://www.w3.org/2005/Atom" xmlns:opds="http://opds-spec.org/2010/catalog">
              <title>$title</title>
              <id>urn:uuid:cleverferret:catalog</id>
              <updated>$timestamp</updated>
              <author>
                <name>CleverFerret</name>
              </author>
              <link rel="self" href="/opds/catalog" type="application/atom+xml;profile=opds-catalog;kind=navigation"/>
              <link rel="start" href="/opds/catalog" type="application/atom+xml;profile=opds-catalog;kind=navigation"/>
              
              <entry>
                <title>All Books</title>
                <id>urn:uuid:cleverferret:books</id>
                <updated>$timestamp</updated>
                <link rel="subsection" href="/opds/books" type="application/atom+xml;profile=opds-catalog;kind=acquisition"/>
                <content type="text">Browse all books in the library</content>
              </entry>
              
              <entry>
                <title>Recent Additions</title>
                <id>urn:uuid:cleverferret:recent</id>
                <updated>$timestamp</updated>
                <link rel="subsection" href="/opds/recent" type="application/atom+xml;profile=opds-catalog;kind=acquisition"/>
                <content type="text">Recently added items</content>
              </entry>
            </feed>
        """.trimIndent()
    }
    
    /**
     * Generate acquisition feed for a list of media items
     */
    fun generateAcquisitionFeed(
        title: String,
        items: List<MediaItemEntry>,
        selfLink: String
    ): String {
        val timestamp = java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", java.util.Locale.US).apply {
            timeZone = java.util.TimeZone.getTimeZone("UTC")
        }.format(java.util.Date())
        
        val entries = items.joinToString("\n") { item ->
            """
              <entry>
                <title>${escapeXml(item.title)}</title>
                <id>urn:uuid:cleverferret:item:${item.id}</id>
                <updated>$timestamp</updated>
                <author>
                  <name>${escapeXml(item.author ?: "Unknown")}</name>
                </author>
                <link rel="http://opds-spec.org/acquisition" href="/opds/download/${item.id}" type="${item.mimeType}"/>
                ${if (item.thumbnailUrl != null) """<link rel="http://opds-spec.org/image/thumbnail" href="${item.thumbnailUrl}" type="image/jpeg"/>""" else ""}
                <content type="text">${escapeXml(item.description ?: "")}</content>
              </entry>
            """.trimIndent()
        }
        
        return """
            <?xml version="1.0" encoding="utf-8"?>
            <feed xmlns="http://www.w3.org/2005/Atom" xmlns:opds="http://opds-spec.org/2010/catalog">
              <title>$title</title>
              <id>urn:uuid:cleverferret:$selfLink</id>
              <updated>$timestamp</updated>
              <link rel="self" href="/opds/$selfLink" type="application/atom+xml;profile=opds-catalog;kind=acquisition"/>
              <link rel="start" href="/opds/catalog" type="application/atom+xml;profile=opds-catalog;kind=navigation"/>
              
              $entries
            </feed>
        """.trimIndent()
    }
    
    /**
     * Escape XML special characters
     */
    private fun escapeXml(text: String): String {
        return text
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&apos;")
    }
    
    /**
     * Data class for media item entries in OPDS feeds
     */
    data class MediaItemEntry(
        val id: Long,
        val title: String,
        val author: String?,
        val description: String?,
        val mimeType: String,
        val thumbnailUrl: String?
    )
}
