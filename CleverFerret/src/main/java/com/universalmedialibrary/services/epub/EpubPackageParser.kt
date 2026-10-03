package com.universalmedialibrary.services.epub

import org.jsoup.Jsoup
import org.jsoup.nodes.Document

object EpubPackageParser {

    fun parseMetadata(opfContent: String): SimpleEpubMetadata {
        val opfDoc = Jsoup.parse(opfContent, "", org.jsoup.parser.Parser.xmlParser())

        val title = selectText(opfDoc, "metadata", "dc|title", "dc\\:title", "title").ifEmpty { "Unknown Title" }
        val authors = selectAll(opfDoc, "metadata", "dc|creator", "dc\\:creator", "creator")
        val description = selectText(opfDoc, "metadata", "dc|description", "dc\\:description", "description")
        val language = selectText(opfDoc, "metadata", "dc|language", "dc\\:language", "language").ifEmpty { "en" }
        val publisher = selectText(opfDoc, "metadata", "dc|publisher", "dc\\:publisher", "publisher")
        val isbn = selectText(
            opfDoc,
            "metadata",
            "dc|identifier[scheme=ISBN]", "dc\\:identifier[scheme=ISBN]",
            "dc|identifier[opf|scheme=ISBN]", "dc\\:identifier[opf\\:scheme=ISBN]",
            "identifier[scheme=ISBN]"
        )

        return SimpleEpubMetadata(
            title = title,
            authors = authors,
            description = description,
            language = language,
            publisher = publisher,
            publishDate = "",
            isbn = isbn,
            coverImageData = null
        )
    }

    fun parseSpine(opfContent: String): List<String> {
        val opfDoc = Jsoup.parse(opfContent, "", org.jsoup.parser.Parser.xmlParser())
        return opfDoc.select("spine itemref")
            .mapNotNull { it.attr("idref").takeIf(String::isNotBlank) }
    }

    fun parseManifest(opfContent: String): Map<String, ManifestItem> {
        val opfDoc = Jsoup.parse(opfContent, "", org.jsoup.parser.Parser.xmlParser())
        val manifest = mutableMapOf<String, ManifestItem>()

        opfDoc.select("manifest item").forEach { item ->
            val id = item.attr("id")
            val href = item.attr("href")
            val mediaType = item.attr("media-type")

            if (id.isNotEmpty() && href.isNotEmpty()) {
                manifest[id] = ManifestItem(id, href, mediaType)
            }
        }

        return manifest
    }

    private fun selectText(doc: Document, parent: String, vararg selectors: String): String {
        for (selector in selectors) {
            val text = doc.select("$parent $selector").text()
            if (text.isNotEmpty()) return text
        }
        return ""
    }

    private fun selectAll(doc: Document, parent: String, vararg selectors: String): List<String> {
        for (selector in selectors) {
            val elements = doc.select("$parent $selector")
            if (elements.isNotEmpty()) return elements.map { it.text() }
        }
        return emptyList()
    }
}
