package com.universalmedialibrary.services.comic

import android.util.Xml
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlSerializer
import java.io.File
import java.io.FileOutputStream
import java.io.StringWriter
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Handles reading and writing ComicInfo.xml in CBZ files
 */
@Singleton
class ComicInfoHandler @Inject constructor() {
    
    /**
     * Read ComicInfo.xml from a CBZ file
     */
    fun readFromCBZ(cbzPath: String): ComicInfo? {
        return try {
            ZipFile(cbzPath).use { zip ->
                val entry = zip.getEntry("ComicInfo.xml") ?: return null
                zip.getInputStream(entry).use { inputStream ->
                    val xml = inputStream.bufferedReader().readText()
                    parseComicInfo(xml)
                }
            }
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Write ComicInfo.xml to a CBZ file
     */
    fun writeToCBZ(cbzPath: String, comicInfo: ComicInfo) {
        try {
            val xml = generateComicInfoXml(comicInfo)
            val tempFile = File.createTempFile("comic", ".cbz")
            
            // Create new ZIP with ComicInfo.xml
            ZipOutputStream(FileOutputStream(tempFile)).use { zipOut ->
                // Copy existing entries except ComicInfo.xml
                ZipFile(cbzPath).use { zipIn ->
                    zipIn.entries().asSequence()
                        .filter { it.name != "ComicInfo.xml" }
                        .forEach { entry ->
                            zipOut.putNextEntry(ZipEntry(entry.name))
                            zipIn.getInputStream(entry).use { inputStream ->
                                inputStream.copyTo(zipOut)
                            }
                            zipOut.closeEntry()
                        }
                }
                
                // Add new ComicInfo.xml
                zipOut.putNextEntry(ZipEntry("ComicInfo.xml"))
                zipOut.write(xml.toByteArray())
                zipOut.closeEntry()
            }
            
            // Replace original file
            File(cbzPath).delete()
            tempFile.renameTo(File(cbzPath))
        } catch (e: Exception) {
            throw Exception("Failed to write ComicInfo.xml: ${e.message}", e)
        }
    }
    
    /**
     * Parse ComicInfo.xml from string
     */
    private fun parseComicInfo(xml: String): ComicInfo {
        val parser = Xml.newPullParser()
        parser.setInput(xml.reader())
        
        var eventType = parser.eventType
        val values = mutableMapOf<String, String>()
        
        while (eventType != XmlPullParser.END_DOCUMENT) {
            when (eventType) {
                XmlPullParser.START_TAG -> {
                    val tagName = parser.name
                    if (tagName != "ComicInfo") {
                        parser.next()
                        if (parser.eventType == XmlPullParser.TEXT) {
                            values[tagName] = parser.text
                        }
                    }
                }
            }
            eventType = parser.next()
        }
        
        return ComicInfo(
            title = values["Title"],
            series = values["Series"],
            number = values["Number"],
            count = values["Count"]?.toIntOrNull(),
            volume = values["Volume"]?.toIntOrNull(),
            alternateSeries = values["AlternateSeries"],
            alternateNumber = values["AlternateNumber"],
            storyTitle = values["StoryTitle"],
            summary = values["Summary"],
            notes = values["Notes"],
            year = values["Year"]?.toIntOrNull(),
            month = values["Month"]?.toIntOrNull(),
            day = values["Day"]?.toIntOrNull(),
            writer = values["Writer"],
            penciller = values["Penciller"],
            inker = values["Inker"],
            colorist = values["Colorist"],
            letterer = values["Letterer"],
            coverArtist = values["CoverArtist"],
            editor = values["Editor"],
            publisher = values["Publisher"],
            imprint = values["Imprint"],
            genre = values["Genre"],
            tags = values["Tags"],
            web = values["Web"],
            pageCount = values["PageCount"]?.toIntOrNull(),
            languageISO = values["LanguageISO"],
            format = values["Format"],
            blackAndWhite = values["BlackAndWhite"],
            manga = values["Manga"],
            characters = values["Characters"],
            teams = values["Teams"],
            locations = values["Locations"],
            scanInformation = values["ScanInformation"],
            storyArc = values["StoryArc"],
            seriesGroup = values["SeriesGroup"],
            ageRating = values["AgeRating"]
        )
    }
    
    /**
     * Generate ComicInfo.xml from ComicInfo object
     */
    private fun generateComicInfoXml(comicInfo: ComicInfo): String {
        val writer = StringWriter()
        val serializer = Xml.newSerializer()
        serializer.setOutput(writer)
        
        serializer.startDocument("UTF-8", true)
        serializer.startTag(null, "ComicInfo")
        
        comicInfo.title?.let { writeTag(serializer, "Title", it) }
        comicInfo.series?.let { writeTag(serializer, "Series", it) }
        comicInfo.number?.let { writeTag(serializer, "Number", it) }
        comicInfo.count?.let { writeTag(serializer, "Count", it.toString()) }
        comicInfo.volume?.let { writeTag(serializer, "Volume", it.toString()) }
        comicInfo.alternateSeries?.let { writeTag(serializer, "AlternateSeries", it) }
        comicInfo.alternateNumber?.let { writeTag(serializer, "AlternateNumber", it) }
        comicInfo.storyTitle?.let { writeTag(serializer, "StoryTitle", it) }
        comicInfo.summary?.let { writeTag(serializer, "Summary", it) }
        comicInfo.notes?.let { writeTag(serializer, "Notes", it) }
        comicInfo.year?.let { writeTag(serializer, "Year", it.toString()) }
        comicInfo.month?.let { writeTag(serializer, "Month", it.toString()) }
        comicInfo.day?.let { writeTag(serializer, "Day", it.toString()) }
        comicInfo.writer?.let { writeTag(serializer, "Writer", it) }
        comicInfo.penciller?.let { writeTag(serializer, "Penciller", it) }
        comicInfo.inker?.let { writeTag(serializer, "Inker", it) }
        comicInfo.colorist?.let { writeTag(serializer, "Colorist", it) }
        comicInfo.letterer?.let { writeTag(serializer, "Letterer", it) }
        comicInfo.coverArtist?.let { writeTag(serializer, "CoverArtist", it) }
        comicInfo.editor?.let { writeTag(serializer, "Editor", it) }
        comicInfo.publisher?.let { writeTag(serializer, "Publisher", it) }
        comicInfo.imprint?.let { writeTag(serializer, "Imprint", it) }
        comicInfo.genre?.let { writeTag(serializer, "Genre", it) }
        comicInfo.tags?.let { writeTag(serializer, "Tags", it) }
        comicInfo.web?.let { writeTag(serializer, "Web", it) }
        comicInfo.pageCount?.let { writeTag(serializer, "PageCount", it.toString()) }
        comicInfo.languageISO?.let { writeTag(serializer, "LanguageISO", it) }
        comicInfo.format?.let { writeTag(serializer, "Format", it) }
        comicInfo.blackAndWhite?.let { writeTag(serializer, "BlackAndWhite", it) }
        comicInfo.manga?.let { writeTag(serializer, "Manga", it) }
        comicInfo.characters?.let { writeTag(serializer, "Characters", it) }
        comicInfo.teams?.let { writeTag(serializer, "Teams", it) }
        comicInfo.locations?.let { writeTag(serializer, "Locations", it) }
        comicInfo.scanInformation?.let { writeTag(serializer, "ScanInformation", it) }
        comicInfo.storyArc?.let { writeTag(serializer, "StoryArc", it) }
        comicInfo.seriesGroup?.let { writeTag(serializer, "SeriesGroup", it) }
        comicInfo.ageRating?.let { writeTag(serializer, "AgeRating", it) }
        
        serializer.endTag(null, "ComicInfo")
        serializer.endDocument()
        
        return writer.toString()
    }
    
    private fun writeTag(serializer: XmlSerializer, name: String, value: String) {
        serializer.startTag(null, name)
        serializer.text(value)
        serializer.endTag(null, name)
    }
}
