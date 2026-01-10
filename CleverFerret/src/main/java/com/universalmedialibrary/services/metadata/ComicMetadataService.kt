package com.universalmedialibrary.services.metadata

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import java.net.URLEncoder
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Comic metadata service inspired by ComicTagger (https://github.com/comictagger/comictagger).
 * 
 * Features:
 * - Comic Vine API integration for online metadata
 * - ComicInfo.xml parsing (ComicRack format) from CBZ files
 * - Support for ComicBookLover metadata format
 * - Series, issue, volume tracking
 * - Credits (writer, artist, colorist, etc.)
 * - Story arc and crossover support
 * 
 * Metadata Sources:
 * - Comic Vine (comicvine.gamespot.com) - Primary source
 * - Embedded ComicInfo.xml in CBZ files
 * - Filename parsing for series/issue extraction
 */
@Singleton
class ComicMetadataService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val TAG = "ComicMetadataService"
        
        // Comic Vine API (requires API key)
        private const val COMIC_VINE_BASE = "https://comicvine.gamespot.com/api"
        private const val COMIC_VINE_SEARCH = "$COMIC_VINE_BASE/search"
        private const val COMIC_VINE_ISSUE = "$COMIC_VINE_BASE/issue"
        private const val COMIC_VINE_VOLUME = "$COMIC_VINE_BASE/volume"
        
        private const val USER_AGENT = "CleverFerret/1.0 (Android; Universal Media Library)"
        private const val TIMEOUT = 15000
        
        // ComicInfo.xml tag names (ComicRack format)
        object ComicInfoTags {
            const val TITLE = "Title"
            const val SERIES = "Series"
            const val NUMBER = "Number"
            const val VOLUME = "Volume"
            const val ALTERNATE_SERIES = "AlternateSeries"
            const val ALTERNATE_NUMBER = "AlternateNumber"
            const val STORY_ARC = "StoryArc"
            const val SERIES_GROUP = "SeriesGroup"
            const val COUNT = "Count"
            const val SUMMARY = "Summary"
            const val NOTES = "Notes"
            const val YEAR = "Year"
            const val MONTH = "Month"
            const val DAY = "Day"
            const val WRITER = "Writer"
            const val PENCILLER = "Penciller"
            const val INKER = "Inker"
            const val COLORIST = "Colorist"
            const val LETTERER = "Letterer"
            const val COVER_ARTIST = "CoverArtist"
            const val EDITOR = "Editor"
            const val PUBLISHER = "Publisher"
            const val IMPRINT = "Imprint"
            const val GENRE = "Genre"
            const val TAGS = "Tags"
            const val WEB = "Web"
            const val PAGE_COUNT = "PageCount"
            const val LANGUAGE_ISO = "LanguageISO"
            const val FORMAT = "Format"
            const val BLACK_AND_WHITE = "BlackAndWhite"
            const val MANGA = "Manga"
            const val CHARACTERS = "Characters"
            const val TEAMS = "Teams"
            const val LOCATIONS = "Locations"
            const val SCAN_INFORMATION = "ScanInformation"
            const val AGE_RATING = "AgeRating"
            const val COMMUNITY_RATING = "CommunityRating"
        }
        
        // Credit roles (like ComicTagger)
        val CREDIT_ROLES = listOf(
            "writer", "penciller", "inker", "colorist", "letterer",
            "cover artist", "editor", "assistant editor", "editor-in-chief",
            "plotter", "scripter", "artist", "other"
        )
    }
    
    // Comic Vine API key (user should provide this)
    private var comicVineApiKey: String? = null
    
    fun setComicVineApiKey(apiKey: String) {
        comicVineApiKey = apiKey
    }
    
    /**
     * Read ComicInfo.xml from a CBZ file.
     * This is the standard metadata format used by ComicRack and many other readers.
     */
    suspend fun readComicInfoXml(cbzPath: String): ComicMetadata? = withContext(Dispatchers.IO) {
        try {
            val zipFile = ZipFile(cbzPath)
            val entry = zipFile.getEntry("ComicInfo.xml") ?: zipFile.getEntry("comicinfo.xml")
            
            if (entry != null) {
                val inputStream = zipFile.getInputStream(entry)
                val xmlContent = inputStream.bufferedReader().readText()
                inputStream.close()
                zipFile.close()
                
                return@withContext parseComicInfoXml(xmlContent)
            }
            
            zipFile.close()
        } catch (e: Exception) {
            Log.e(TAG, "Error reading ComicInfo.xml from $cbzPath", e)
        }
        null
    }
    
    /**
     * Parse ComicInfo.xml content into ComicMetadata.
     */
    private fun parseComicInfoXml(xmlContent: String): ComicMetadata {
        val metadata = ComicMetadata()
        
        try {
            val factory = javax.xml.parsers.DocumentBuilderFactory.newInstance()
            val builder = factory.newDocumentBuilder()
            val document = builder.parse(xmlContent.byteInputStream())
            
            val root = document.documentElement
            
            // Parse basic info
            metadata.title = getXmlTagValue(root, ComicInfoTags.TITLE)
            metadata.series = getXmlTagValue(root, ComicInfoTags.SERIES)
            metadata.number = getXmlTagValue(root, ComicInfoTags.NUMBER)
            metadata.volume = getXmlTagValue(root, ComicInfoTags.VOLUME)?.toIntOrNull()
            metadata.alternateSeries = getXmlTagValue(root, ComicInfoTags.ALTERNATE_SERIES)
            metadata.alternateNumber = getXmlTagValue(root, ComicInfoTags.ALTERNATE_NUMBER)
            metadata.storyArc = getXmlTagValue(root, ComicInfoTags.STORY_ARC)
            metadata.seriesGroup = getXmlTagValue(root, ComicInfoTags.SERIES_GROUP)
            metadata.count = getXmlTagValue(root, ComicInfoTags.COUNT)?.toIntOrNull()
            metadata.summary = getXmlTagValue(root, ComicInfoTags.SUMMARY)
            metadata.notes = getXmlTagValue(root, ComicInfoTags.NOTES)
            
            // Parse date
            val year = getXmlTagValue(root, ComicInfoTags.YEAR)?.toIntOrNull()
            val month = getXmlTagValue(root, ComicInfoTags.MONTH)?.toIntOrNull()
            val day = getXmlTagValue(root, ComicInfoTags.DAY)?.toIntOrNull()
            metadata.year = year
            metadata.month = month
            metadata.day = day
            
            // Parse credits
            metadata.credits = mutableListOf<ComicCredit>().apply {
                getXmlTagValue(root, ComicInfoTags.WRITER)?.let { 
                    addAll(parseCredits(it, "Writer")) 
                }
                getXmlTagValue(root, ComicInfoTags.PENCILLER)?.let { 
                    addAll(parseCredits(it, "Penciller")) 
                }
                getXmlTagValue(root, ComicInfoTags.INKER)?.let { 
                    addAll(parseCredits(it, "Inker")) 
                }
                getXmlTagValue(root, ComicInfoTags.COLORIST)?.let { 
                    addAll(parseCredits(it, "Colorist")) 
                }
                getXmlTagValue(root, ComicInfoTags.LETTERER)?.let { 
                    addAll(parseCredits(it, "Letterer")) 
                }
                getXmlTagValue(root, ComicInfoTags.COVER_ARTIST)?.let { 
                    addAll(parseCredits(it, "Cover Artist")) 
                }
                getXmlTagValue(root, ComicInfoTags.EDITOR)?.let { 
                    addAll(parseCredits(it, "Editor")) 
                }
            }
            
            // Parse publisher info
            metadata.publisher = getXmlTagValue(root, ComicInfoTags.PUBLISHER)
            metadata.imprint = getXmlTagValue(root, ComicInfoTags.IMPRINT)
            
            // Parse tags and genres
            metadata.genre = getXmlTagValue(root, ComicInfoTags.GENRE)?.split(",")?.map { it.trim() } ?: emptyList()
            metadata.tags = getXmlTagValue(root, ComicInfoTags.TAGS)?.split(",")?.map { it.trim() } ?: emptyList()
            
            // Parse characters, teams, locations
            metadata.characters = getXmlTagValue(root, ComicInfoTags.CHARACTERS)?.split(",")?.map { it.trim() } ?: emptyList()
            metadata.teams = getXmlTagValue(root, ComicInfoTags.TEAMS)?.split(",")?.map { it.trim() } ?: emptyList()
            metadata.locations = getXmlTagValue(root, ComicInfoTags.LOCATIONS)?.split(",")?.map { it.trim() } ?: emptyList()
            
            // Parse other info
            metadata.webLink = getXmlTagValue(root, ComicInfoTags.WEB)
            metadata.pageCount = getXmlTagValue(root, ComicInfoTags.PAGE_COUNT)?.toIntOrNull()
            metadata.languageIso = getXmlTagValue(root, ComicInfoTags.LANGUAGE_ISO)
            metadata.format = getXmlTagValue(root, ComicInfoTags.FORMAT)
            metadata.blackAndWhite = getXmlTagValue(root, ComicInfoTags.BLACK_AND_WHITE)?.equals("Yes", ignoreCase = true) ?: false
            metadata.manga = getXmlTagValue(root, ComicInfoTags.MANGA)
            metadata.ageRating = getXmlTagValue(root, ComicInfoTags.AGE_RATING)
            metadata.communityRating = getXmlTagValue(root, ComicInfoTags.COMMUNITY_RATING)?.toFloatOrNull()
            
            metadata.source = ComicMetadataSource.COMICINFO_XML
            
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing ComicInfo.xml", e)
        }
        
        return metadata
    }
    
    private fun getXmlTagValue(element: org.w3c.dom.Element, tagName: String): String? {
        val nodeList = element.getElementsByTagName(tagName)
        return if (nodeList.length > 0) {
            nodeList.item(0).textContent?.trim()?.takeIf { it.isNotBlank() }
        } else null
    }
    
    private fun parseCredits(value: String, role: String): List<ComicCredit> {
        return value.split(",").map { name ->
            ComicCredit(person = name.trim(), role = role)
        }
    }
    
    /**
     * Search Comic Vine for comic metadata.
     */
    suspend fun searchComicVine(
        seriesName: String,
        issueNumber: String? = null
    ): ComicMetadata? = withContext(Dispatchers.IO) {
        val apiKey = comicVineApiKey
        if (apiKey.isNullOrBlank()) {
            Log.w(TAG, "Comic Vine API key not set")
            return@withContext null
        }
        
        try {
            // First search for the volume (series)
            val query = URLEncoder.encode(seriesName, "UTF-8")
            val searchUrl = "$COMIC_VINE_SEARCH/?api_key=$apiKey&format=json&resources=volume&query=$query&limit=10"
            
            val searchResponse = makeHttpRequest(searchUrl)
            if (searchResponse != null) {
                val json = JSONObject(searchResponse)
                val results = json.optJSONArray("results")
                
                if (results != null && results.length() > 0) {
                    // Get the first matching volume
                    val volume = results.getJSONObject(0)
                    val volumeId = volume.optInt("id")
                    val volumeName = volume.optString("name")
                    
                    // If we have an issue number, search for that specific issue
                    if (!issueNumber.isNullOrBlank() && volumeId > 0) {
                        return@withContext searchIssueInVolume(apiKey, volumeId, issueNumber, volumeName)
                    }
                    
                    // Otherwise return volume metadata
                    return@withContext ComicMetadata(
                        series = volumeName,
                        publisher = volume.optJSONObject("publisher")?.optString("name"),
                        summary = volume.optString("deck"),
                        count = volume.optInt("count_of_issues"),
                        year = volume.optString("start_year")?.toIntOrNull(),
                        coverUrl = volume.optJSONObject("image")?.optString("medium_url"),
                        comicVineVolumeId = volumeId,
                        source = ComicMetadataSource.COMIC_VINE
                    )
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error searching Comic Vine", e)
        }
        null
    }
    
    private suspend fun searchIssueInVolume(
        apiKey: String,
        volumeId: Int,
        issueNumber: String,
        volumeName: String
    ): ComicMetadata? = withContext(Dispatchers.IO) {
        try {
            // Search for issues in this volume
            val filter = URLEncoder.encode("volume:$volumeId,issue_number:$issueNumber", "UTF-8")
            val issueUrl = "$COMIC_VINE_BASE/issues/?api_key=$apiKey&format=json&filter=$filter&limit=1"
            
            val response = makeHttpRequest(issueUrl)
            if (response != null) {
                val json = JSONObject(response)
                val results = json.optJSONArray("results")
                
                if (results != null && results.length() > 0) {
                    val issue = results.getJSONObject(0)
                    return@withContext parseComicVineIssue(issue, volumeName, volumeId)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error searching for issue in volume", e)
        }
        null
    }
    
    private fun parseComicVineIssue(issue: JSONObject, volumeName: String, volumeId: Int): ComicMetadata {
        val metadata = ComicMetadata()
        
        metadata.title = issue.optString("name")
        metadata.series = volumeName
        metadata.number = issue.optString("issue_number")
        metadata.summary = issue.optString("description")?.let { 
            // Strip HTML tags
            it.replace(Regex("<[^>]*>"), "").trim()
        }
        
        // Parse date
        val coverDate = issue.optString("cover_date")
        if (coverDate.isNotBlank()) {
            val parts = coverDate.split("-")
            if (parts.size >= 1) metadata.year = parts[0].toIntOrNull()
            if (parts.size >= 2) metadata.month = parts[1].toIntOrNull()
            if (parts.size >= 3) metadata.day = parts[2].toIntOrNull()
        }
        
        // Parse credits
        val personCredits = issue.optJSONArray("person_credits")
        if (personCredits != null) {
            val credits = mutableListOf<ComicCredit>()
            for (i in 0 until personCredits.length()) {
                val person = personCredits.getJSONObject(i)
                credits.add(ComicCredit(
                    person = person.optString("name"),
                    role = person.optString("role")
                ))
            }
            metadata.credits = credits
        }
        
        // Parse characters
        val characterCredits = issue.optJSONArray("character_credits")
        if (characterCredits != null) {
            metadata.characters = (0 until characterCredits.length()).map { i ->
                characterCredits.getJSONObject(i).optString("name")
            }
        }
        
        // Parse teams
        val teamCredits = issue.optJSONArray("team_credits")
        if (teamCredits != null) {
            metadata.teams = (0 until teamCredits.length()).map { i ->
                teamCredits.getJSONObject(i).optString("name")
            }
        }
        
        // Parse locations
        val locationCredits = issue.optJSONArray("location_credits")
        if (locationCredits != null) {
            metadata.locations = (0 until locationCredits.length()).map { i ->
                locationCredits.getJSONObject(i).optString("name")
            }
        }
        
        // Parse story arcs
        val storyArcCredits = issue.optJSONArray("story_arc_credits")
        if (storyArcCredits != null && storyArcCredits.length() > 0) {
            metadata.storyArc = (0 until storyArcCredits.length()).map { i ->
                storyArcCredits.getJSONObject(i).optString("name")
            }.joinToString(", ")
        }
        
        // Cover image
        metadata.coverUrl = issue.optJSONObject("image")?.optString("medium_url")
        
        // IDs
        metadata.comicVineIssueId = issue.optInt("id")
        metadata.comicVineVolumeId = volumeId
        metadata.webLink = issue.optString("site_detail_url")
        
        metadata.source = ComicMetadataSource.COMIC_VINE
        
        return metadata
    }
    
    /**
     * Extract series name and issue number from filename.
     * Handles common patterns like:
     * - "Series Name 001.cbz"
     * - "Series Name #1.cbz"
     * - "Series Name v1 001.cbz"
     * - "Series Name (2020) 001.cbz"
     */
    fun parseFilename(filename: String): Pair<String, String?> {
        val nameWithoutExt = filename.substringBeforeLast(".")
        
        // Common patterns for issue numbers
        val patterns = listOf(
            // "Series Name #001" or "Series Name #1"
            Regex("""^(.+?)\s*#(\d+)$"""),
            // "Series Name 001" (3+ digit number at end)
            Regex("""^(.+?)\s+(\d{3,})$"""),
            // "Series Name v1 001"
            Regex("""^(.+?)\s+v\d+\s+(\d+)$""", RegexOption.IGNORE_CASE),
            // "Series Name (2020) 001"
            Regex("""^(.+?)\s*\(\d{4}\)\s*(\d+)$"""),
            // "Series Name 01" (2 digit number at end)
            Regex("""^(.+?)\s+(\d{2})$""")
        )
        
        for (pattern in patterns) {
            val match = pattern.find(nameWithoutExt)
            if (match != null) {
                val (series, issue) = match.destructured
                return Pair(series.trim(), issue.trimStart('0').ifEmpty { "0" })
            }
        }
        
        // No issue number found, return whole name as series
        return Pair(nameWithoutExt.trim(), null)
    }
    
    /**
     * Auto-tag a comic by combining embedded metadata with online lookup.
     */
    suspend fun autoTag(cbzPath: String, filename: String): ComicMetadata? = withContext(Dispatchers.IO) {
        // First, try to read embedded ComicInfo.xml
        val embedded = readComicInfoXml(cbzPath)
        
        // Parse filename for series/issue
        val (seriesFromFile, issueFromFile) = parseFilename(filename)
        
        // Determine series and issue to search
        val series = embedded?.series ?: seriesFromFile
        val issue = embedded?.number ?: issueFromFile
        
        // Try to fetch from Comic Vine
        val online = if (series.isNotBlank()) {
            searchComicVine(series, issue)
        } else null
        
        // Merge results
        if (embedded != null && online != null) {
            return@withContext mergeMetadata(embedded, online)
        }
        
        embedded ?: online
    }
    
    private fun mergeMetadata(embedded: ComicMetadata, online: ComicMetadata): ComicMetadata {
        return ComicMetadata(
            title = embedded.title ?: online.title,
            series = embedded.series ?: online.series,
            number = embedded.number ?: online.number,
            volume = embedded.volume ?: online.volume,
            alternateSeries = embedded.alternateSeries ?: online.alternateSeries,
            alternateNumber = embedded.alternateNumber ?: online.alternateNumber,
            storyArc = embedded.storyArc ?: online.storyArc,
            seriesGroup = embedded.seriesGroup ?: online.seriesGroup,
            count = embedded.count ?: online.count,
            summary = embedded.summary ?: online.summary,
            notes = embedded.notes ?: online.notes,
            year = embedded.year ?: online.year,
            month = embedded.month ?: online.month,
            day = embedded.day ?: online.day,
            credits = (embedded.credits + online.credits).distinctBy { "${it.person}-${it.role}" },
            publisher = embedded.publisher ?: online.publisher,
            imprint = embedded.imprint ?: online.imprint,
            genre = (embedded.genre + online.genre).distinct(),
            tags = (embedded.tags + online.tags).distinct(),
            characters = (embedded.characters + online.characters).distinct(),
            teams = (embedded.teams + online.teams).distinct(),
            locations = (embedded.locations + online.locations).distinct(),
            webLink = embedded.webLink ?: online.webLink,
            pageCount = embedded.pageCount ?: online.pageCount,
            languageIso = embedded.languageIso ?: online.languageIso,
            format = embedded.format ?: online.format,
            blackAndWhite = embedded.blackAndWhite,
            manga = embedded.manga ?: online.manga,
            ageRating = embedded.ageRating ?: online.ageRating,
            communityRating = embedded.communityRating ?: online.communityRating,
            coverUrl = embedded.coverUrl ?: online.coverUrl,
            comicVineIssueId = online.comicVineIssueId,
            comicVineVolumeId = online.comicVineVolumeId,
            source = ComicMetadataSource.MERGED
        )
    }
    
    private fun makeHttpRequest(urlString: String): String? {
        var connection: HttpURLConnection? = null
        try {
            val url = URL(urlString)
            connection = url.openConnection() as HttpURLConnection
            connection.requestMethod = "GET"
            connection.connectTimeout = TIMEOUT
            connection.readTimeout = TIMEOUT
            connection.setRequestProperty("User-Agent", USER_AGENT)
            
            if (connection.responseCode == HttpURLConnection.HTTP_OK) {
                val reader = BufferedReader(InputStreamReader(connection.inputStream))
                val response = reader.readText()
                reader.close()
                return response
            }
        } catch (e: Exception) {
            Log.e(TAG, "HTTP request failed: $urlString", e)
        } finally {
            connection?.disconnect()
        }
        return null
    }
}

/**
 * Comic metadata data class (based on ComicInfo.xml schema)
 */
data class ComicMetadata(
    // Basic info
    var title: String? = null,
    var series: String? = null,
    var number: String? = null,
    var volume: Int? = null,
    var alternateSeries: String? = null,
    var alternateNumber: String? = null,
    var storyArc: String? = null,
    var seriesGroup: String? = null,
    var count: Int? = null,
    var summary: String? = null,
    var notes: String? = null,
    
    // Date
    var year: Int? = null,
    var month: Int? = null,
    var day: Int? = null,
    
    // Credits
    var credits: List<ComicCredit> = emptyList(),
    
    // Publisher
    var publisher: String? = null,
    var imprint: String? = null,
    
    // Tags and categorization
    var genre: List<String> = emptyList(),
    var tags: List<String> = emptyList(),
    var characters: List<String> = emptyList(),
    var teams: List<String> = emptyList(),
    var locations: List<String> = emptyList(),
    
    // Links and IDs
    var webLink: String? = null,
    var comicVineIssueId: Int? = null,
    var comicVineVolumeId: Int? = null,
    
    // Technical
    var pageCount: Int? = null,
    var languageIso: String? = null,
    var format: String? = null,
    var blackAndWhite: Boolean = false,
    var manga: String? = null,
    var ageRating: String? = null,
    var communityRating: Float? = null,
    var coverUrl: String? = null,
    
    var source: ComicMetadataSource = ComicMetadataSource.UNKNOWN
)

data class ComicCredit(
    val person: String,
    val role: String
)

enum class ComicMetadataSource {
    COMICINFO_XML,
    COMIC_VINE,
    MERGED,
    UNKNOWN
}
