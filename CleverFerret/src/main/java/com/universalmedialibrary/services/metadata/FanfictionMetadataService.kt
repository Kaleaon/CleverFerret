package com.universalmedialibrary.services.metadata

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import org.jsoup.Jsoup
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Fanfiction metadata service for extracting metadata from fanfiction files and online sources.
 * 
 * Supported sources:
 * - Archive of Our Own (AO3) - via web scraping
 * - FanFiction.net - via web scraping  
 * - EPUB files with embedded metadata
 * - Filename parsing
 * 
 * Metadata fields based on AO3's extensive tagging system:
 * - Fandoms, relationships, characters
 * - Rating, warnings, categories
 * - Additional tags (freeform)
 * - Word count, chapter count
 * - Kudos, hits, bookmarks
 */
@Singleton
class FanfictionMetadataService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val TAG = "FanfictionMetadataService"
        
        // AO3 URLs
        private const val AO3_BASE = "https://archiveofourown.org"
        private const val AO3_WORK = "$AO3_BASE/works"
        private const val AO3_SEARCH = "$AO3_BASE/works/search"
        
        // FFN URLs
        private const val FFN_BASE = "https://www.fanfiction.net"
        private const val FFN_STORY = "$FFN_BASE/s"
        
        private const val USER_AGENT = "CleverFerret/1.0 (Android; Universal Media Library; Contact: cleverferret@example.com)"
        private const val TIMEOUT = 15000
        
        // AO3 Rating mappings
        val AO3_RATINGS = mapOf(
            "General Audiences" to "G",
            "Teen And Up Audiences" to "T",
            "Mature" to "M",
            "Explicit" to "E",
            "Not Rated" to "NR"
        )
        
        // AO3 Warning tags
        val AO3_WARNINGS = listOf(
            "No Archive Warnings Apply",
            "Creator Chose Not To Use Archive Warnings",
            "Graphic Depictions Of Violence",
            "Major Character Death",
            "Rape/Non-Con",
            "Underage"
        )
        
        // AO3 Category tags
        val AO3_CATEGORIES = listOf(
            "F/F", "F/M", "Gen", "M/M", "Multi", "Other"
        )
    }
    
    /**
     * Fetch metadata from AO3 by work ID.
     */
    suspend fun fetchFromAO3(workId: Long): FanfictionMetadata? = withContext(Dispatchers.IO) {
        try {
            val url = "$AO3_WORK/$workId"
            val doc = Jsoup.connect(url)
                .userAgent(USER_AGENT)
                .timeout(TIMEOUT)
                .get()
            
            return@withContext parseAO3WorkPage(doc, workId)
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching from AO3: $workId", e)
        }
        null
    }
    
    /**
     * Search AO3 for works by title and fandom.
     */
    suspend fun searchAO3(
        title: String? = null,
        fandom: String? = null,
        author: String? = null
    ): List<FanfictionMetadata> = withContext(Dispatchers.IO) {
        val results = mutableListOf<FanfictionMetadata>()
        
        try {
            val params = mutableListOf<String>()
            title?.let { params.add("work_search[title]=${URLEncoder.encode(it, "UTF-8")}") }
            fandom?.let { params.add("work_search[fandom_names]=${URLEncoder.encode(it, "UTF-8")}") }
            author?.let { params.add("work_search[creators]=${URLEncoder.encode(it, "UTF-8")}") }
            
            if (params.isEmpty()) return@withContext emptyList()
            
            val url = "$AO3_SEARCH?${params.joinToString("&")}"
            val doc = Jsoup.connect(url)
                .userAgent(USER_AGENT)
                .timeout(TIMEOUT)
                .get()
            
            // Parse search results
            val workElements = doc.select("li.work.blurb")
            for (element in workElements.take(10)) {
                try {
                    val workLink = element.select("h4.heading a").first()
                    val workUrl = workLink?.attr("href") ?: continue
                    val workId = workUrl.substringAfter("/works/").substringBefore("/").toLongOrNull() ?: continue
                    val workTitle = workLink.text()
                    
                    val authorLink = element.select("a[rel=author]").first()
                    val authorName = authorLink?.text()
                    
                    val fandoms = element.select("h5.fandoms a").map { it.text() }
                    val rating = element.select("span.rating").first()?.attr("title")
                    
                    val requiredTags = element.select("ul.required-tags span")
                    val warnings = requiredTags.getOrNull(1)?.attr("title")?.split(", ") ?: emptyList()
                    val categories = requiredTags.getOrNull(2)?.attr("title")?.split(", ") ?: emptyList()
                    
                    val relationships = element.select("li.relationships a").map { it.text() }
                    val characters = element.select("li.characters a").map { it.text() }
                    val freeformTags = element.select("li.freeforms a").map { it.text() }
                    
                    val summary = element.select("blockquote.summary").text()
                    
                    // Stats
                    val statsElement = element.select("dl.stats")
                    val words = statsElement.select("dd.words").text().replace(",", "").toIntOrNull()
                    val chapters = statsElement.select("dd.chapters").text()
                    val kudos = statsElement.select("dd.kudos").text().replace(",", "").toIntOrNull()
                    val hits = statsElement.select("dd.hits").text().replace(",", "").toIntOrNull()
                    
                    results.add(FanfictionMetadata(
                        title = workTitle,
                        author = authorName,
                        ao3WorkId = workId,
                        fandoms = fandoms,
                        rating = rating,
                        warnings = warnings,
                        categories = categories,
                        relationships = relationships,
                        characters = characters,
                        additionalTags = freeformTags,
                        summary = summary,
                        wordCount = words,
                        chapterInfo = chapters,
                        kudos = kudos,
                        hits = hits,
                        source = FanfictionSource.AO3
                    ))
                } catch (e: Exception) {
                    Log.w(TAG, "Error parsing search result", e)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error searching AO3", e)
        }
        
        results
    }
    
    private fun parseAO3WorkPage(doc: org.jsoup.nodes.Document, workId: Long): FanfictionMetadata {
        val metadata = FanfictionMetadata(ao3WorkId = workId)
        
        try {
            // Title
            metadata.title = doc.select("h2.title").text()
            
            // Author
            metadata.author = doc.select("a[rel=author]").first()?.text()
            
            // Rating
            metadata.rating = doc.select("dd.rating a").text()
            
            // Warnings
            metadata.warnings = doc.select("dd.warning a").map { it.text() }
            
            // Categories
            metadata.categories = doc.select("dd.category a").map { it.text() }
            
            // Fandoms
            metadata.fandoms = doc.select("dd.fandom a").map { it.text() }
            
            // Relationships
            metadata.relationships = doc.select("dd.relationship a").map { it.text() }
            
            // Characters
            metadata.characters = doc.select("dd.character a").map { it.text() }
            
            // Additional tags (freeform)
            metadata.additionalTags = doc.select("dd.freeform a").map { it.text() }
            
            // Language
            metadata.language = doc.select("dd.language").text()
            
            // Series info
            val seriesElement = doc.select("dd.series span.position")
            if (seriesElement.isNotEmpty()) {
                metadata.seriesName = doc.select("dd.series a").text()
                metadata.seriesPart = seriesElement.text().replace(Regex("[^0-9]"), "").toIntOrNull()
            }
            
            // Collections
            metadata.collections = doc.select("dd.collections a").map { it.text() }
            
            // Stats
            val statsElement = doc.select("dl.stats")
            metadata.publishedDate = statsElement.select("dd.published").text()
            metadata.updatedDate = statsElement.select("dd.status").text()
            metadata.wordCount = statsElement.select("dd.words").text().replace(",", "").toIntOrNull()
            metadata.chapterInfo = statsElement.select("dd.chapters").text()
            metadata.kudos = statsElement.select("dd.kudos").text().replace(",", "").toIntOrNull()
            metadata.comments = statsElement.select("dd.comments").text().replace(",", "").toIntOrNull()
            metadata.bookmarks = statsElement.select("dd.bookmarks").text().replace(",", "").toIntOrNull()
            metadata.hits = statsElement.select("dd.hits").text().replace(",", "").toIntOrNull()
            
            // Summary
            metadata.summary = doc.select("div.summary blockquote").text()
            
            // Notes (beginning)
            metadata.beginningNotes = doc.select("div.notes blockquote").first()?.text()
            
            metadata.webLink = "$AO3_WORK/$workId"
            metadata.source = FanfictionSource.AO3
            
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing AO3 work page", e)
        }
        
        return metadata
    }
    
    /**
     * Fetch metadata from FanFiction.net by story ID.
     */
    suspend fun fetchFromFFN(storyId: Long): FanfictionMetadata? = withContext(Dispatchers.IO) {
        try {
            val url = "$FFN_STORY/$storyId"
            val doc = Jsoup.connect(url)
                .userAgent(USER_AGENT)
                .timeout(TIMEOUT)
                .get()
            
            return@withContext parseFFNStoryPage(doc, storyId)
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching from FFN: $storyId", e)
        }
        null
    }
    
    private fun parseFFNStoryPage(doc: org.jsoup.nodes.Document, storyId: Long): FanfictionMetadata {
        val metadata = FanfictionMetadata(ffnStoryId = storyId)
        
        try {
            // Title - typically in the first span with specific styling
            metadata.title = doc.select("#profile_top b.xcontrast_txt").first()?.text()
            
            // Author
            metadata.author = doc.select("#profile_top a.xcontrast_txt").first()?.text()
            
            // Summary
            metadata.summary = doc.select("#profile_top div.xcontrast_txt").first()?.text()
            
            // Metadata string (contains rating, language, genre, characters, etc.)
            val metaText = doc.select("#profile_top span.xgray").text()
            
            // Parse rating from meta
            val ratingMatch = Regex("Rated:\\s*(\\w+)").find(metaText)
            metadata.rating = ratingMatch?.groupValues?.get(1)
            
            // Parse language
            val langMatch = Regex("- (English|Spanish|French|German|Chinese|Japanese|Korean|Russian|Portuguese|Italian)").find(metaText)
            metadata.language = langMatch?.groupValues?.get(1)
            
            // Parse genre
            val genreMatch = Regex("- ([A-Za-z]+(?:/[A-Za-z]+)?)\\s+-").find(metaText)
            metadata.genre = genreMatch?.groupValues?.get(1)
            
            // Parse characters
            val charsMatch = Regex("\\[([^\\]]+)\\]").find(metaText)
            if (charsMatch != null) {
                metadata.characters = charsMatch.groupValues[1].split(",").map { it.trim() }
            }
            
            // Parse word count
            val wordsMatch = Regex("Words:\\s*([\\d,]+)").find(metaText)
            metadata.wordCount = wordsMatch?.groupValues?.get(1)?.replace(",", "")?.toIntOrNull()
            
            // Parse chapter count
            val chaptersMatch = Regex("Chapters:\\s*(\\d+)").find(metaText)
            val totalChapters = chaptersMatch?.groupValues?.get(1)?.toIntOrNull() ?: 1
            metadata.chapterInfo = "$totalChapters/$totalChapters"
            
            // Parse reviews (as comments)
            val reviewsMatch = Regex("Reviews:\\s*([\\d,]+)").find(metaText)
            metadata.comments = reviewsMatch?.groupValues?.get(1)?.replace(",", "")?.toIntOrNull()
            
            // Parse favs (as kudos equivalent)
            val favsMatch = Regex("Favs:\\s*([\\d,]+)").find(metaText)
            metadata.kudos = favsMatch?.groupValues?.get(1)?.replace(",", "")?.toIntOrNull()
            
            // Parse follows (as bookmarks equivalent)
            val followsMatch = Regex("Follows:\\s*([\\d,]+)").find(metaText)
            metadata.bookmarks = followsMatch?.groupValues?.get(1)?.replace(",", "")?.toIntOrNull()
            
            // Parse published date
            val publishedMatch = Regex("Published:\\s*([^-]+)").find(metaText)
            metadata.publishedDate = publishedMatch?.groupValues?.get(1)?.trim()
            
            // Parse updated date
            val updatedMatch = Regex("Updated:\\s*([^-]+)").find(metaText)
            metadata.updatedDate = updatedMatch?.groupValues?.get(1)?.trim()
            
            // Fandom - from breadcrumb
            val fandom = doc.select("#pre_story_links a").last()?.text()
            if (fandom != null) {
                metadata.fandoms = listOf(fandom)
            }
            
            metadata.webLink = "$FFN_STORY/$storyId"
            metadata.source = FanfictionSource.FFN
            
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing FFN story page", e)
        }
        
        return metadata
    }
    
    /**
     * Extract metadata from a fanfiction EPUB file.
     * Many fanfiction EPUBs contain AO3 or FFN metadata in the OPF file.
     */
    suspend fun readEpubMetadata(epubPath: String): FanfictionMetadata? = withContext(Dispatchers.IO) {
        try {
            val zipFile = java.util.zip.ZipFile(epubPath)
            
            // Find OPF file
            val opfEntry = zipFile.entries().asSequence().find { 
                it.name.endsWith(".opf", ignoreCase = true) 
            }
            
            if (opfEntry != null) {
                val opfContent = zipFile.getInputStream(opfEntry).bufferedReader().readText()
                zipFile.close()
                return@withContext parseEpubOpf(opfContent)
            }
            
            zipFile.close()
        } catch (e: Exception) {
            Log.e(TAG, "Error reading EPUB metadata", e)
        }
        null
    }
    
    private fun parseEpubOpf(opfContent: String): FanfictionMetadata {
        val metadata = FanfictionMetadata()
        
        try {
            val factory = javax.xml.parsers.DocumentBuilderFactory.newInstance()
            factory.isNamespaceAware = true
            val builder = factory.newDocumentBuilder()
            val document = builder.parse(opfContent.byteInputStream())
            
            // Title
            metadata.title = getOpfValue(document, "title")
            
            // Author/Creator
            metadata.author = getOpfValue(document, "creator")
            
            // Description/Summary
            metadata.summary = getOpfValue(document, "description")
            
            // Publisher (often contains AO3 or FFN)
            val publisher = getOpfValue(document, "publisher")
            if (publisher?.contains("Archive of Our Own", ignoreCase = true) == true) {
                metadata.source = FanfictionSource.AO3
            } else if (publisher?.contains("FanFiction.net", ignoreCase = true) == true) {
                metadata.source = FanfictionSource.FFN
            }
            
            // Subjects (tags)
            val subjects = getOpfValues(document, "subject")
            
            // Categorize tags
            val fandoms = mutableListOf<String>()
            val relationships = mutableListOf<String>()
            val characters = mutableListOf<String>()
            val additionalTags = mutableListOf<String>()
            
            for (tag in subjects) {
                when {
                    // Relationship patterns
                    tag.contains("/") || tag.contains(" & ") -> relationships.add(tag)
                    // Fandom patterns (usually have parentheses or specific keywords)
                    tag.contains("(") && tag.contains(")") -> fandoms.add(tag)
                    // Rating
                    AO3_RATINGS.containsKey(tag) -> metadata.rating = tag
                    // Warnings
                    AO3_WARNINGS.contains(tag) -> metadata.warnings += tag
                    // Categories
                    AO3_CATEGORIES.contains(tag) -> metadata.categories += tag
                    // Everything else
                    else -> additionalTags.add(tag)
                }
            }
            
            metadata.fandoms = fandoms
            metadata.relationships = relationships
            metadata.additionalTags = additionalTags
            
            // Language
            metadata.language = getOpfValue(document, "language")
            
            // Date
            metadata.publishedDate = getOpfValue(document, "date")
            
            // Source URL
            val source = getOpfValue(document, "source")
            if (source != null) {
                metadata.webLink = source
                
                // Extract work ID from URL
                if (source.contains("archiveofourown.org/works/")) {
                    val workId = source.substringAfter("/works/").substringBefore("/").toLongOrNull()
                    metadata.ao3WorkId = workId
                    metadata.source = FanfictionSource.AO3
                } else if (source.contains("fanfiction.net/s/")) {
                    val storyId = source.substringAfter("/s/").substringBefore("/").toLongOrNull()
                    metadata.ffnStoryId = storyId
                    metadata.source = FanfictionSource.FFN
                }
            }
            
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing EPUB OPF", e)
        }
        
        return metadata
    }
    
    private fun getOpfValue(document: org.w3c.dom.Document, localName: String): String? {
        val elements = document.getElementsByTagNameNS("http://purl.org/dc/elements/1.1/", localName)
        return if (elements.length > 0) {
            elements.item(0).textContent?.trim()?.takeIf { it.isNotBlank() }
        } else null
    }
    
    private fun getOpfValues(document: org.w3c.dom.Document, localName: String): List<String> {
        val elements = document.getElementsByTagNameNS("http://purl.org/dc/elements/1.1/", localName)
        return (0 until elements.length).mapNotNull { i ->
            elements.item(i).textContent?.trim()?.takeIf { it.isNotBlank() }
        }
    }
    
    /**
     * Parse filename to extract potential metadata.
     * Common patterns:
     * - "Title by Author.epub"
     * - "Author - Title.epub"
     * - "[Fandom] Title.epub"
     */
    fun parseFilename(filename: String): FanfictionMetadata {
        val nameWithoutExt = filename.substringBeforeLast(".")
        val metadata = FanfictionMetadata()
        
        // Try various patterns
        
        // Pattern: "[Fandom] Title by Author"
        val bracketPattern = Regex("""^\[([^\]]+)\]\s*(.+?)\s+by\s+(.+)$""", RegexOption.IGNORE_CASE)
        bracketPattern.find(nameWithoutExt)?.let { match ->
            val (fandom, title, author) = match.destructured
            metadata.fandoms = listOf(fandom.trim())
            metadata.title = title.trim()
            metadata.author = author.trim()
            return metadata
        }
        
        // Pattern: "Title by Author"
        val byPattern = Regex("""^(.+?)\s+by\s+(.+)$""", RegexOption.IGNORE_CASE)
        byPattern.find(nameWithoutExt)?.let { match ->
            val (title, author) = match.destructured
            metadata.title = title.trim()
            metadata.author = author.trim()
            return metadata
        }
        
        // Pattern: "Author - Title"
        val dashPattern = Regex("""^(.+?)\s*[-–—]\s*(.+)$""")
        dashPattern.find(nameWithoutExt)?.let { match ->
            val (author, title) = match.destructured
            metadata.author = author.trim()
            metadata.title = title.trim()
            return metadata
        }
        
        // Fallback: whole name is title
        metadata.title = nameWithoutExt.trim()
        return metadata
    }
    
    /**
     * Auto-tag a fanfiction file by combining local and online metadata.
     */
    suspend fun autoTag(filePath: String, filename: String): FanfictionMetadata? = withContext(Dispatchers.IO) {
        // Start with filename parsing
        val fromFilename = parseFilename(filename)
        
        // Try to read embedded EPUB metadata
        val embedded = if (filename.endsWith(".epub", ignoreCase = true)) {
            readEpubMetadata(filePath)
        } else null
        
        // If we have an AO3 work ID, fetch full metadata
        val online = when {
            embedded?.ao3WorkId != null -> fetchFromAO3(embedded.ao3WorkId!!)
            embedded?.ffnStoryId != null -> fetchFromFFN(embedded.ffnStoryId!!)
            else -> null
        }
        
        // Merge all sources
        mergeMetadata(fromFilename, embedded, online)
    }
    
    private fun mergeMetadata(
        fromFilename: FanfictionMetadata,
        embedded: FanfictionMetadata?,
        online: FanfictionMetadata?
    ): FanfictionMetadata {
        return FanfictionMetadata(
            title = online?.title ?: embedded?.title ?: fromFilename.title,
            author = online?.author ?: embedded?.author ?: fromFilename.author,
            ao3WorkId = online?.ao3WorkId ?: embedded?.ao3WorkId,
            ffnStoryId = online?.ffnStoryId ?: embedded?.ffnStoryId,
            fandoms = (online?.fandoms ?: embedded?.fandoms ?: fromFilename.fandoms).ifEmpty { emptyList() },
            rating = online?.rating ?: embedded?.rating,
            warnings = (online?.warnings ?: embedded?.warnings).orEmpty(),
            categories = (online?.categories ?: embedded?.categories).orEmpty(),
            relationships = (online?.relationships ?: embedded?.relationships).orEmpty(),
            characters = (online?.characters ?: embedded?.characters).orEmpty(),
            additionalTags = ((online?.additionalTags ?: emptyList()) + (embedded?.additionalTags ?: emptyList())).distinct(),
            summary = online?.summary ?: embedded?.summary,
            language = online?.language ?: embedded?.language,
            seriesName = online?.seriesName ?: embedded?.seriesName,
            seriesPart = online?.seriesPart ?: embedded?.seriesPart,
            collections = (online?.collections ?: embedded?.collections).orEmpty(),
            publishedDate = online?.publishedDate ?: embedded?.publishedDate,
            updatedDate = online?.updatedDate ?: embedded?.updatedDate,
            wordCount = online?.wordCount ?: embedded?.wordCount,
            chapterInfo = online?.chapterInfo ?: embedded?.chapterInfo,
            kudos = online?.kudos,
            comments = online?.comments,
            bookmarks = online?.bookmarks,
            hits = online?.hits,
            webLink = online?.webLink ?: embedded?.webLink,
            beginningNotes = online?.beginningNotes,
            endingNotes = online?.endingNotes,
            genre = online?.genre ?: embedded?.genre,
            source = online?.source ?: embedded?.source ?: FanfictionSource.LOCAL
        )
    }
}

/**
 * Fanfiction metadata data class based on AO3's tagging system.
 */
data class FanfictionMetadata(
    // Basic info
    var title: String? = null,
    var author: String? = null,
    
    // Source IDs
    var ao3WorkId: Long? = null,
    var ffnStoryId: Long? = null,
    
    // Taxonomic tags (AO3-style)
    var fandoms: List<String> = emptyList(),
    var rating: String? = null,
    var warnings: List<String> = emptyList(),
    var categories: List<String> = emptyList(),
    var relationships: List<String> = emptyList(),
    var characters: List<String> = emptyList(),
    var additionalTags: List<String> = emptyList(),
    
    // Content
    var summary: String? = null,
    var language: String? = null,
    var genre: String? = null,
    
    // Series
    var seriesName: String? = null,
    var seriesPart: Int? = null,
    var collections: List<String> = emptyList(),
    
    // Dates
    var publishedDate: String? = null,
    var updatedDate: String? = null,
    var completedDate: String? = null,
    
    // Stats
    var wordCount: Int? = null,
    var chapterInfo: String? = null, // "3/5" format
    var kudos: Int? = null,
    var comments: Int? = null,
    var bookmarks: Int? = null,
    var hits: Int? = null,
    
    // Links
    var webLink: String? = null,
    
    // Notes
    var beginningNotes: String? = null,
    var endingNotes: String? = null,
    
    // Status
    var isComplete: Boolean = false,
    
    var source: FanfictionSource = FanfictionSource.UNKNOWN
)

enum class FanfictionSource {
    AO3,
    FFN,
    WATTPAD,
    LOCAL,
    UNKNOWN
}
