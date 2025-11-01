package com.universalmedialibrary.utils

import android.util.Xml
import org.xmlpull.v1.XmlPullParser
import java.io.InputStream

/**
 * Parser for ComicInfo.xml metadata found in CBZ/CBR archives
 * Based on the ComicInfo.xml specification used by Calibre and other comic readers
 */
data class ComicInfo(
    val title: String? = null,
    val series: String? = null,
    val number: String? = null,
    val summary: String? = null,
    val writer: String? = null,
    val penciller: String? = null,
    val inker: String? = null,
    val colorist: String? = null,
    val letterer: String? = null,
    val coverArtist: String? = null,
    val editor: String? = null,
    val publisher: String? = null,
    val genre: String? = null,
    val pageCount: Int? = null,
    val languageISO: String? = null,
    val format: String? = null,
    val ageRating: String? = null,
    val communityRating: Float? = null,
    val year: Int? = null,
    val month: Int? = null,
    val day: Int? = null
)

object ComicInfoParser {
    
    /**
     * Parse ComicInfo.xml from an input stream
     */
    fun parse(inputStream: InputStream): ComicInfo {
        var title: String? = null
        var series: String? = null
        var number: String? = null
        var summary: String? = null
        var writer: String? = null
        var penciller: String? = null
        var inker: String? = null
        var colorist: String? = null
        var letterer: String? = null
        var coverArtist: String? = null
        var editor: String? = null
        var publisher: String? = null
        var genre: String? = null
        var pageCount: Int? = null
        var languageISO: String? = null
        var format: String? = null
        var ageRating: String? = null
        var communityRating: Float? = null
        var year: Int? = null
        var month: Int? = null
        var day: Int? = null

        try {
            val parser = Xml.newPullParser()
            parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, false)
            parser.setInput(inputStream, null)

            var eventType = parser.eventType
            var currentTag: String? = null
            
            while (eventType != XmlPullParser.END_DOCUMENT) {
                when (eventType) {
                    XmlPullParser.START_TAG -> {
                        currentTag = parser.name
                    }
                    XmlPullParser.TEXT -> {
                        val text = parser.text?.trim()
                        if (!text.isNullOrEmpty() && currentTag != null) {
                            when (currentTag) {
                                "Title" -> title = text
                                "Series" -> series = text
                                "Number" -> number = text
                                "Summary" -> summary = text
                                "Writer" -> writer = text
                                "Penciller" -> penciller = text
                                "Inker" -> inker = text
                                "Colorist" -> colorist = text
                                "Letterer" -> letterer = text
                                "CoverArtist" -> coverArtist = text
                                "Editor" -> editor = text
                                "Publisher" -> publisher = text
                                "Genre" -> genre = text
                                "PageCount" -> pageCount = text.toIntOrNull()
                                "LanguageISO" -> languageISO = text
                                "Format" -> format = text
                                "AgeRating" -> ageRating = text
                                "CommunityRating" -> communityRating = text.toFloatOrNull()
                                "Year" -> year = text.toIntOrNull()
                                "Month" -> month = text.toIntOrNull()
                                "Day" -> day = text.toIntOrNull()
                            }
                        }
                    }
                    XmlPullParser.END_TAG -> {
                        currentTag = null
                    }
                }
                eventType = parser.next()
            }
        } catch (e: Exception) {
            // Return partial data if parsing fails
        }

        return ComicInfo(
            title = title,
            series = series,
            number = number,
            summary = summary,
            writer = writer,
            penciller = penciller,
            inker = inker,
            colorist = colorist,
            letterer = letterer,
            coverArtist = coverArtist,
            editor = editor,
            publisher = publisher,
            genre = genre,
            pageCount = pageCount,
            languageISO = languageISO,
            format = format,
            ageRating = ageRating,
            communityRating = communityRating,
            year = year,
            month = month,
            day = day
        )
    }
}
