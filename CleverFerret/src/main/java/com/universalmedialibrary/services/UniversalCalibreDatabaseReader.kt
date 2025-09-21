package com.universalmedialibrary.services

import android.database.sqlite.SQLiteDatabase
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.services.RawCalibreBook
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Universal Calibre Database Reader
 * 
 * Extends the original CalibreDatabaseReader to support all media types that can be stored
 * in a Calibre library. While Calibre is primarily book-focused, users often store other
 * media types (documents, academic papers, magazines, etc.) in their Calibre libraries.
 * 
 * This reader intelligently detects media types based on:
 * - File extensions 
 * - Custom Calibre columns
 * - Metadata patterns
 * - Content analysis
 */
@Singleton
class UniversalCalibreDatabaseReader @Inject constructor() {

    /**
     * Enhanced book reading with media type detection
     */
    fun readUniversalMedia(calibreDbPath: String): Map<Long, RawCalibreMediaItem> {
        val calibreDb: SQLiteDatabase
        try {
            calibreDb = SQLiteDatabase.openDatabase(calibreDbPath, null, SQLiteDatabase.OPEN_READONLY)
        } catch (e: Exception) {
            e.printStackTrace()
            return emptyMap()
        }

        // Enhanced query that includes file format information for media type detection
        val query = """
            SELECT
                b.id, b.title, b.path, b.series_index, b.pubdate, b.timestamp,
                a.name as author_name,
                s.name as series_name,
                p.name as publisher_name,
                i.val as isbn,
                t.name as tag_name,
                c.text as comments,
                d.format as file_format,
                d.name as file_name,
                l.lang_code as language_code,
                r.rating as user_rating,
                cc1.value as custom_media_type
            FROM books b
            LEFT JOIN books_authors_link bal ON b.id = bal.book
            LEFT JOIN authors a ON bal.author = a.id
            LEFT JOIN books_series_link bsl ON b.id = bsl.book
            LEFT JOIN series s ON bsl.series = s.id
            LEFT JOIN books_publishers_link bpl ON b.id = bpl.book
            LEFT JOIN publishers p ON bpl.publisher = p.id
            LEFT JOIN identifiers i ON b.id = i.book AND i.type = 'isbn'
            LEFT JOIN books_tags_link btl ON b.id = btl.book
            LEFT JOIN tags t ON btl.tag = t.id
            LEFT JOIN comments c ON b.id = c.book
            LEFT JOIN data d ON b.id = d.book
            LEFT JOIN books_languages_link bll ON b.id = bll.book
            LEFT JOIN languages l ON bll.lang_code = l.id
            LEFT JOIN books_ratings_link brl ON b.id = brl.book
            LEFT JOIN ratings r ON brl.rating = r.id
            LEFT JOIN custom_column_1 cc1 ON b.id = cc1.book
        """.trimIndent()

        val cursor = calibreDb.rawQuery(query, null)

        val mediaMap = mutableMapOf<Long, RawCalibreMediaItem>()
        val tagsMap = mutableMapOf<Long, MutableList<String>>()
        val authorsMap = mutableMapOf<Long, MutableList<String>>()
        val formatsMap = mutableMapOf<Long, MutableList<String>>()

        cursor.use {
            while (it.moveToNext()) {
                val itemId = it.getLong(it.getColumnIndexOrThrow("id"))

                // Initialize the media item if we haven't seen it before
                if (!mediaMap.containsKey(itemId)) {
                    val title = it.getString(it.getColumnIndexOrThrow("title"))
                    val path = it.getString(it.getColumnIndexOrThrow("path"))
                    val customMediaType = it.getString(it.getColumnIndexOrThrow("custom_media_type"))
                    val fileFormat = it.getString(it.getColumnIndexOrThrow("file_format"))
                    
                    // Detect media type based on various factors
                    val detectedMediaType = detectMediaType(title, path, customMediaType, fileFormat)
                    
                    mediaMap[itemId] = RawCalibreMediaItem(
                        id = itemId,
                        title = title,
                        path = path,
                        mediaType = detectedMediaType,
                        authorNames = emptyList(), // Will be aggregated
                        seriesName = it.getString(it.getColumnIndexOrThrow("series_name")),
                        seriesIndex = it.getDouble(it.getColumnIndexOrThrow("series_index")),
                        publisher = it.getString(it.getColumnIndexOrThrow("publisher_name")),
                        isbn = it.getString(it.getColumnIndexOrThrow("isbn")),
                        tags = emptyList(), // Will be aggregated
                        comments = it.getString(it.getColumnIndexOrThrow("comments")),
                        publicationDate = it.getString(it.getColumnIndexOrThrow("pubdate")),
                        dateAdded = it.getString(it.getColumnIndexOrThrow("timestamp")),
                        languageCode = it.getString(it.getColumnIndexOrThrow("language_code")),
                        userRating = it.getInt(it.getColumnIndexOrThrow("user_rating")),
                        formats = emptyList() // Will be aggregated
                    )
                }

                // Aggregate authors
                it.getString(it.getColumnIndexOrThrow("author_name"))?.let { author ->
                    authorsMap.getOrPut(itemId) { mutableListOf() }.add(author)
                }

                // Aggregate tags
                it.getString(it.getColumnIndexOrThrow("tag_name"))?.let { tag ->
                    tagsMap.getOrPut(itemId) { mutableListOf() }.add(tag)
                }

                // Aggregate file formats
                it.getString(it.getColumnIndexOrThrow("file_format"))?.let { format ->
                    formatsMap.getOrPut(itemId) { mutableListOf() }.add(format.uppercase())
                }
            }
        }
        calibreDb.close()

        // Combine the aggregated data into the final map
        return mediaMap.mapValues { (id, item) ->
            item.copy(
                authorNames = (authorsMap[id] ?: emptyList()).distinct(),
                tags = (tagsMap[id] ?: emptyList()).distinct(),
                formats = (formatsMap[id] ?: emptyList()).distinct()
            )
        }
    }

    /**
     * Intelligent media type detection based on multiple factors
     */
    private fun detectMediaType(
        title: String, 
        path: String, 
        customMediaType: String?,
        fileFormat: String?
    ): MediaType {
        // Check custom column first if available
        customMediaType?.let { customType ->
            when (customType.uppercase()) {
                "MOVIE", "FILM" -> return MediaType.MOVIE
                "TV_SHOW", "TV", "SERIES" -> return MediaType.TV_SHOW
                "MUSIC", "ALBUM" -> return MediaType.MUSIC
                "PODCAST" -> return MediaType.PODCAST
                "COMIC", "MANGA" -> return MediaType.COMIC
                "MAGAZINE", "PERIODICAL" -> return MediaType.MAGAZINE
                "DOCUMENT", "DOC" -> return MediaType.DOCUMENT
                "ACADEMIC", "PAPER", "RESEARCH" -> return MediaType.ACADEMIC_PAPER
                "AUDIOBOOK" -> return MediaType.AUDIOBOOK
                "WEB_FICTION", "FANFICTION" -> return MediaType.WEB_FICTION
            }
        }

        // Detect by file format
        fileFormat?.let { format ->
            when (format.uppercase()) {
                "MP4", "MKV", "AVI", "MOV", "WMV" -> return MediaType.MOVIE
                "MP3", "FLAC", "WAV", "M4A", "OGG" -> return MediaType.MUSIC
                "CBZ", "CBR", "CBT" -> return MediaType.COMIC
                "PDF" -> {
                    // PDFs could be books, documents, or academic papers
                    return when {
                        isAcademicPaper(title, path) -> MediaType.ACADEMIC_PAPER
                        isMagazine(title, path) -> MediaType.MAGAZINE
                        else -> MediaType.DOCUMENT
                    }
                }
                "EPUB", "MOBI", "AZW3", "AZW" -> {
                    // E-books could be various types
                    return when {
                        isComic(title, path) -> MediaType.COMIC
                        isMagazine(title, path) -> MediaType.MAGAZINE
                        isAcademicPaper(title, path) -> MediaType.ACADEMIC_PAPER
                        else -> MediaType.BOOK
                    }
                }
                "TXT", "RTF", "DOC", "DOCX" -> return MediaType.DOCUMENT
            }
        }

        // Detect by title and path patterns
        when {
            isAcademicPaper(title, path) -> return MediaType.ACADEMIC_PAPER
            isMagazine(title, path) -> return MediaType.MAGAZINE
            isComic(title, path) -> return MediaType.COMIC
            isPodcast(title, path) -> return MediaType.PODCAST
            isWebFiction(title, path) -> return MediaType.WEB_FICTION
            else -> return MediaType.BOOK // Default for Calibre items
        }
    }

    private fun isAcademicPaper(title: String, path: String): Boolean {
        val academicKeywords = listOf(
            "journal", "paper", "research", "study", "analysis", "proceedings",
            "conference", "ieee", "acm", "doi", "arxiv", "pubmed"
        )
        val titleLower = title.lowercase()
        val pathLower = path.lowercase()
        
        return academicKeywords.any { keyword ->
            titleLower.contains(keyword) || pathLower.contains(keyword)
        }
    }

    private fun isMagazine(title: String, path: String): Boolean {
        val magazineKeywords = listOf(
            "magazine", "issue", "vol", "volume", "no.", "number",
            "monthly", "weekly", "quarterly", "periodical"
        )
        val titleLower = title.lowercase()
        val pathLower = path.lowercase()
        
        return magazineKeywords.any { keyword ->
            titleLower.contains(keyword) || pathLower.contains(keyword)
        } || title.matches(Regex(".*\\b\\d+\\b.*")) // Contains issue numbers
    }

    private fun isComic(title: String, path: String): Boolean {
        val comicKeywords = listOf(
            "comic", "manga", "graphic novel", "superhero", "batman", "superman",
            "marvel", "dc", "issue", "#", "vol", "chapter"
        )
        val titleLower = title.lowercase()
        val pathLower = path.lowercase()
        
        return comicKeywords.any { keyword ->
            titleLower.contains(keyword) || pathLower.contains(keyword)
        }
    }

    private fun isPodcast(title: String, path: String): Boolean {
        val podcastKeywords = listOf(
            "podcast", "episode", "ep", "show", "interview", "talk",
            "radio", "audio", "cast"
        )
        val titleLower = title.lowercase()
        val pathLower = path.lowercase()
        
        return podcastKeywords.any { keyword ->
            titleLower.contains(keyword) || pathLower.contains(keyword)
        }
    }

    private fun isWebFiction(title: String, path: String): Boolean {
        val webFictionKeywords = listOf(
            "fanfiction", "fanfic", "webnovel", "web novel", "online",
            "archive of our own", "ao3", "wattpad", "royal road"
        )
        val titleLower = title.lowercase()
        val pathLower = path.lowercase()
        
        return webFictionKeywords.any { keyword ->
            titleLower.contains(keyword) || pathLower.contains(keyword)
        }
    }

    /**
     * Get Calibre library statistics with media type breakdown
     */
    fun getLibraryStatistics(calibreDbPath: String): CalibreLibraryStatistics {
        val mediaItems = readUniversalMedia(calibreDbPath)
        
        val typeCount = mutableMapOf<MediaType, Int>()
        var totalAuthors = 0
        var totalSeries = 0
        val uniqueAuthors = mutableSetOf<String>()
        val uniqueSeries = mutableSetOf<String>()
        
        mediaItems.values.forEach { item ->
            typeCount[item.mediaType] = typeCount.getOrDefault(item.mediaType, 0) + 1
            uniqueAuthors.addAll(item.authorNames)
            item.seriesName?.let { uniqueSeries.add(it) }
        }
        
        return CalibreLibraryStatistics(
            totalItems = mediaItems.size,
            mediaTypeBreakdown = typeCount,
            totalAuthors = uniqueAuthors.size,
            totalSeries = uniqueSeries.size,
            hasCustomColumns = hasCustomColumns(calibreDbPath)
        )
    }

    private fun hasCustomColumns(calibreDbPath: String): Boolean {
        return try {
            val calibreDb = SQLiteDatabase.openDatabase(calibreDbPath, null, SQLiteDatabase.OPEN_READONLY)
            val cursor = calibreDb.rawQuery("SELECT COUNT(*) FROM custom_columns", null)
            val hasColumns = cursor.use {
                it.moveToFirst()
                it.getInt(0) > 0
            }
            calibreDb.close()
            hasColumns
        } catch (e: Exception) {
            false
        }
    }
}

/**
 * Enhanced data class for universal Calibre media items
 */
data class RawCalibreMediaItem(
    val id: Long,
    val title: String,
    val path: String,
    val mediaType: MediaType,
    val authorNames: List<String>,
    val seriesName: String?,
    val seriesIndex: Double?,
    val publisher: String?,
    val isbn: String?,
    val tags: List<String>,
    val comments: String?,
    val publicationDate: String?,
    val dateAdded: String?,
    val languageCode: String?,
    val userRating: Int,
    val formats: List<String>
)

/**
 * Statistics for a Calibre library with universal media support
 */
data class CalibreLibraryStatistics(
    val totalItems: Int,
    val mediaTypeBreakdown: Map<MediaType, Int>,
    val totalAuthors: Int,
    val totalSeries: Int,
    val hasCustomColumns: Boolean
)