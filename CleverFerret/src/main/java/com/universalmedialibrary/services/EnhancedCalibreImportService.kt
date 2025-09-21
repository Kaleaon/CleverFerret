package com.universalmedialibrary.services

import android.content.Context
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import java.io.File
import java.io.FileInputStream
import java.security.MessageDigest
import java.util.Date
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Enhanced Calibre Import Service
 * 
 * Comprehensive import system that handles all media types from Calibre libraries,
 * not just books. This service can import entire Calibre libraries including:
 * - Books (traditional Calibre content)
 * - Documents, Academic Papers, Magazines
 * - Comics and Graphic Novels
 * - Audio content (audiobooks, podcasts)
 * - Any other media stored in Calibre
 */
@Singleton
class EnhancedCalibreImportService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val universalReader: UniversalCalibreDatabaseReader
) {
    
    private val _importState = MutableStateFlow(CalibreImportState())
    val importState: StateFlow<CalibreImportState> = _importState.asStateFlow()

    /**
     * Import entire Calibre library with all media types
     */
    suspend fun importCalibreLibrary(
        calibreDbPath: String, 
        libraryRootPath: String, 
        libraryId: Long,
        importOptions: CalibreImportOptions = CalibreImportOptions()
    ): CalibreImportResult {
        try {
            _importState.value = _importState.value.copy(
                isImporting = true,
                progress = 0f,
                currentItem = "Reading Calibre database...",
                totalItems = 0,
                processedItems = 0
            )

            // Read all media items from Calibre database
            val rawMediaItems = universalReader.readUniversalMedia(calibreDbPath)
            
            _importState.value = _importState.value.copy(
                totalItems = rawMediaItems.size,
                currentItem = "Preparing import..."
            )

            var processedCount = 0
            var successCount = 0
            var skippedCount = 0
            val errors = mutableListOf<String>()
            val importedByType = mutableMapOf<MediaType, Int>()

            for ((_, rawItem) in rawMediaItems) {
                try {
                    _importState.value = _importState.value.copy(
                        currentItem = "Processing: ${rawItem.title}",
                        progress = processedCount.toFloat() / rawMediaItems.size
                    )

                    val importResult = importSingleItem(rawItem, libraryRootPath, libraryId, importOptions)
                    
                    when (importResult) {
                        is SingleImportResult.Success -> {
                            successCount++
                            importedByType[rawItem.mediaType] = importedByType.getOrDefault(rawItem.mediaType, 0) + 1
                        }
                        is SingleImportResult.Skipped -> {
                            skippedCount++
                        }
                        is SingleImportResult.Error -> {
                            errors.add("${rawItem.title}: ${importResult.message}")
                        }
                    }

                } catch (e: Exception) {
                    errors.add("${rawItem.title}: ${e.message}")
                }

                processedCount++
                _importState.value = _importState.value.copy(
                    processedItems = processedCount,
                    progress = processedCount.toFloat() / rawMediaItems.size
                )
            }

            _importState.value = _importState.value.copy(
                isImporting = false,
                progress = 1f,
                currentItem = "Import completed"
            )

            return CalibreImportResult(
                totalProcessed = processedCount,
                successfulImports = successCount,
                skippedItems = skippedCount,
                errors = errors,
                importedByType = importedByType
            )

        } catch (e: Exception) {
            _importState.value = _importState.value.copy(
                isImporting = false,
                error = "Import failed: ${e.message}"
            )
            throw e
        }
    }

    /**
     * Import a single media item based on its detected type
     */
    private suspend fun importSingleItem(
        rawItem: RawCalibreMediaItem,
        libraryRootPath: String,
        libraryId: Long,
        options: CalibreImportOptions
    ): SingleImportResult {
        // Resolve file path
        val resolvedPath = resolveFullPath(libraryRootPath, rawItem.path) ?: return SingleImportResult.Skipped("File not found")
        val file = File(resolvedPath)
        if (!file.exists()) return SingleImportResult.Skipped("File does not exist")

        // Check for duplicates if enabled
        if (options.skipDuplicates) {
            val existingItem = mediaItemDao.getMediaItemByFilePath(file.absolutePath)
            if (existingItem != null) return SingleImportResult.Skipped("Already exists")
        }

        try {
            // Create MediaItem
            val mediaItem = MediaItem(
                libraryId = libraryId,
                fileName = file.name,
                filePath = file.absolutePath,
                fileSize = file.length(),
                mediaType = rawItem.mediaType,
                dateAdded = parseDate(rawItem.dateAdded) ?: Date(),
                lastModified = Date(file.lastModified()),
                lastAccessed = null,
                playCount = 0,
                isLocal = true,
                fileHash = if (options.calculateHashes) calculateMD5(file) else null
            )

            val itemId = mediaItemDao.insertMediaItem(mediaItem)

            // Create common metadata
            val commonMetadata = MetadataCommon(
                itemId = itemId,
                title = cleanTitle(rawItem.title),
                sortTitle = createSortTitle(rawItem.title),
                year = extractYear(rawItem.publicationDate),
                releaseDate = parseDate(rawItem.publicationDate)?.time,
                rating = if (rawItem.userRating > 0) rawItem.userRating.toFloat() else null,
                summary = rawItem.comments,
                coverImagePath = null, // Could be enhanced to extract covers
                isFavorite = false,
                isDownloaded = true
            )
            metadataDao.insertMetadataCommon(commonMetadata)

            // Create type-specific metadata
            when (rawItem.mediaType) {
                MediaType.BOOK, MediaType.AUDIOBOOK -> importBookMetadata(itemId, rawItem)
                MediaType.DOCUMENT -> importDocumentMetadata(itemId, rawItem, file)
                MediaType.ACADEMIC_PAPER -> importAcademicPaperMetadata(itemId, rawItem)
                MediaType.MAGAZINE -> importMagazineMetadata(itemId, rawItem)
                MediaType.COMIC -> importBookMetadata(itemId, rawItem) // Comics use book structure
                MediaType.MOVIE -> importMovieMetadata(itemId, rawItem)
                MediaType.TV_SHOW -> importTvShowMetadata(itemId, rawItem)
                MediaType.MUSIC -> importMusicMetadata(itemId, rawItem)
                MediaType.PODCAST -> importPodcastMetadata(itemId, rawItem)
                else -> { /* No specific metadata for other types */ }
            }

            // Handle authors/creators
            for (authorName in rawItem.authorNames) {
                val cleanedAuthor = cleanAuthorName(authorName)
                val personId = metadataDao.findPersonByName(cleanedAuthor.name)
                    ?: metadataDao.insertPerson(cleanedAuthor)
                val role = when (rawItem.mediaType) {
                    MediaType.MOVIE, MediaType.TV_SHOW -> "DIRECTOR"
                    MediaType.MUSIC -> "ARTIST"
                    MediaType.ACADEMIC_PAPER -> "RESEARCHER"
                    else -> "AUTHOR"
                }
                metadataDao.insertItemPersonRole(ItemPersonRole(itemId = itemId, personId = personId, role = role))
            }

            // Handle series
            rawItem.seriesName?.let { seriesName ->
                val seriesId = metadataDao.findSeriesByName(seriesName)
                    ?: metadataDao.insertSeries(Series(name = seriesName))
                when (rawItem.mediaType) {
                    MediaType.BOOK, MediaType.AUDIOBOOK, MediaType.COMIC -> {
                        metadataDao.updateBookWithSeries(itemId, seriesId)
                    }
                    // Could extend to other media types that support series
                }
            }

            // Handle genres/tags
            for (tagName in rawItem.tags) {
                val genreId = metadataDao.findGenreByName(tagName)
                    ?: metadataDao.insertGenre(Genre(name = tagName))
                metadataDao.insertItemGenre(ItemGenre(itemId = itemId, genreId = genreId))
            }

            return SingleImportResult.Success(itemId)

        } catch (e: Exception) {
            return SingleImportResult.Error(e.message ?: "Import failed")
        }
    }

    // Type-specific metadata import methods
    private suspend fun importBookMetadata(itemId: Long, rawItem: RawCalibreMediaItem) {
        val bookMetadata = MetadataBook(
            itemId = itemId,
            subtitle = null,
            publisher = rawItem.publisher,
            isbn = rawItem.isbn,
            pageCount = null, // Would need file analysis
            seriesId = null // Handled separately
        )
        metadataDao.insertMetadataBook(bookMetadata)
    }

    private suspend fun importDocumentMetadata(itemId: Long, rawItem: RawCalibreMediaItem, file: File) {
        val documentMetadata = MetadataDocument(
            itemId = itemId,
            documentType = determineDocumentType(file, rawItem),
            author = rawItem.authorNames.joinToString(", "),
            creationDate = rawItem.dateAdded,
            modificationDate = Date(file.lastModified()).toString(),
            pageCount = null, // Would need file analysis
            wordCount = null, // Would need file analysis
            language = rawItem.languageCode,
            format = rawItem.formats.firstOrNull(),
            fileSize = file.length()
        )
        metadataDao.insertMetadataDocument(documentMetadata)
    }

    private suspend fun importAcademicPaperMetadata(itemId: Long, rawItem: RawCalibreMediaItem) {
        val paperMetadata = MetadataAcademicPaper(
            itemId = itemId,
            journalName = rawItem.publisher,
            doi = extractDOI(rawItem.comments),
            abstractText = rawItem.comments,
            publicationYear = extractYear(rawItem.publicationDate),
            citationCount = null,
            keywords = rawItem.tags.joinToString(", "),
            researchField = determineResearchField(rawItem.tags),
            peerReviewed = isPeerReviewed(rawItem.tags, rawItem.publisher),
            arxivId = extractArxivId(rawItem.comments)
        )
        metadataDao.insertMetadataAcademicPaper(paperMetadata)
    }

    private suspend fun importMagazineMetadata(itemId: Long, rawItem: RawCalibreMediaItem) {
        val magazineMetadata = MetadataMagazine(
            itemId = itemId,
            issueNumber = extractIssueNumber(rawItem.title),
            volumeNumber = extractVolumeNumber(rawItem.title),
            publicationDate = rawItem.publicationDate,
            issn = rawItem.isbn, // Sometimes ISSN is stored in ISBN field
            magazineTitle = extractMagazineTitle(rawItem.title),
            articleCount = null,
            coverStory = rawItem.comments,
            editor = rawItem.authorNames.firstOrNull()
        )
        metadataDao.insertMetadataMagazine(magazineMetadata)
    }

    private suspend fun importMovieMetadata(itemId: Long, rawItem: RawCalibreMediaItem) {
        val movieMetadata = MetadataMovie(
            itemId = itemId,
            director = rawItem.authorNames.firstOrNull(),
            runtime = null, // Would need file analysis
            rating = null,
            releaseYear = extractYear(rawItem.publicationDate),
            productionCompany = rawItem.publisher,
            budget = null,
            boxOffice = null,
            imdbId = extractImdbId(rawItem.comments),
            tmdbId = null
        )
        metadataDao.insertMetadataMovie(movieMetadata)
    }

    private suspend fun importTvShowMetadata(itemId: Long, rawItem: RawCalibreMediaItem) {
        val tvMetadata = MetadataTvShow(
            itemId = itemId,
            seasonNumber = extractSeasonNumber(rawItem.title),
            episodeNumber = extractEpisodeNumber(rawItem.title),
            seriesName = rawItem.seriesName,
            network = rawItem.publisher,
            airDate = rawItem.publicationDate,
            episodeRuntime = null,
            tvRating = null,
            tvdbId = null,
            imdbId = extractImdbId(rawItem.comments)
        )
        metadataDao.insertMetadataTvShow(tvMetadata)
    }

    private suspend fun importMusicMetadata(itemId: Long, rawItem: RawCalibreMediaItem) {
        val musicMetadata = MetadataMusicTrack(
            itemId = itemId,
            artist = rawItem.authorNames.joinToString(", "),
            album = rawItem.seriesName,
            trackNumber = rawItem.seriesIndex?.toInt(),
            discNumber = null,
            durationSeconds = null, // Would need file analysis
            genre = rawItem.tags.firstOrNull(),
            year = extractYear(rawItem.publicationDate),
            bitrate = null,
            sampleRate = null,
            musicbrainzId = null,
            spotifyId = null
        )
        metadataDao.insertMetadataMusicTrack(musicMetadata)
    }

    private suspend fun importPodcastMetadata(itemId: Long, rawItem: RawCalibreMediaItem) {
        val podcastMetadata = MetadataPodcast(
            itemId = itemId,
            showName = rawItem.seriesName ?: extractPodcastShow(rawItem.title),
            episodeNumber = extractEpisodeNumber(rawItem.title),
            seasonNumber = extractSeasonNumber(rawItem.title),
            durationSeconds = null, // Would need file analysis
            publicationDate = rawItem.publicationDate,
            description = rawItem.comments,
            transcriptPath = null,
            rssUrl = null,
            podcastGuid = null
        )
        metadataDao.insertMetadataPodcast(podcastMetadata)
    }

    // Utility methods (keeping existing ones and adding new ones)
    private fun resolveFullPath(libraryRootPath: String, relativePath: String): String? {
        val file = File(libraryRootPath, relativePath)
        if (file.isDirectory) {
            val preferredExtensions = listOf("epub", "pdf", "mobi", "azw3", "mp4", "mp3", "flac", "cbz", "cbr")
            for (extension in preferredExtensions) {
                val matchingFile = file.listFiles()?.firstOrNull {
                    it.extension.equals(extension, ignoreCase = true)
                }
                if (matchingFile != null) {
                    return matchingFile.absolutePath
                }
            }
            return file.listFiles()?.firstOrNull()?.absolutePath
        }
        return if (file.exists()) file.absolutePath else null
    }

    private fun cleanTitle(rawTitle: String): String {
        return rawTitle.split(' ').joinToString(" ") { it.myCapitalize() }
    }

    private fun createSortTitle(title: String): String {
        val articles = listOf("The ", "A ", "An ")
        for (article in articles) {
            if (title.startsWith(article, ignoreCase = true)) {
                return title.substring(article.length) + ", " + title.substring(0, article.length - 1)
            }
        }
        return title
    }

    private fun cleanAuthorName(rawName: String): People {
        val (lastName, firstName) = if (rawName.contains(",")) {
            val parts = rawName.split(",", limit = 2).map { it.trim() }
            Pair(parts.getOrElse(0) { "" }, parts.getOrElse(1) { "" })
        } else {
            val parts = rawName.split(" ").filter { it.isNotBlank() }
            Pair(parts.lastOrNull() ?: "", parts.dropLast(1).joinToString(" "))
        }

        val finalFirstName = firstName.myCapitalize()
        val finalLastName = lastName.myCapitalize()

        val cleanName = "$finalFirstName $finalLastName".trim()
        val sortName = "$finalLastName, $finalFirstName".trim().removeSuffix(",").trim()
        return People(personId = 0, name = cleanName, sortName = sortName)
    }

    private fun calculateMD5(file: File): String {
        val digest = MessageDigest.getInstance("MD5")
        val inputStream = FileInputStream(file)
        val buffer = ByteArray(8192)
        var read: Int
        while (inputStream.read(buffer).also { read = it } > 0) {
            digest.update(buffer, 0, read)
        }
        val md5sum = digest.digest()
        return md5sum.joinToString("") { "%02x".format(it) }
    }

    private fun String.myCapitalize(): String {
        if (this.isEmpty()) return ""
        return this.replaceFirstChar { if (it.isLowerCase()) it.titlecase(Locale.getDefault()) else it.toString() }
    }

    // New utility methods for enhanced metadata extraction
    private fun parseDate(dateString: String?): Date? {
        return try {
            dateString?.let { Date(it) }
        } catch (e: Exception) {
            null
        }
    }

    private fun extractYear(dateString: String?): Int? {
        return try {
            dateString?.let { 
                Regex("\\d{4}").find(it)?.value?.toInt()
            }
        } catch (e: Exception) {
            null
        }
    }

    private fun determineDocumentType(file: File, rawItem: RawCalibreMediaItem): String {
        return when (file.extension.lowercase()) {
            "pdf" -> "PDF Document"
            "doc", "docx" -> "Word Document"
            "txt" -> "Text Document"
            "rtf" -> "Rich Text Document"
            else -> "Document"
        }
    }

    private fun extractDOI(comments: String?): String? {
        return comments?.let { 
            Regex("10\\.\\d{4,}/[\\w\\d\\-\\.]+").find(it)?.value
        }
    }

    private fun extractArxivId(comments: String?): String? {
        return comments?.let {
            Regex("arXiv:\\d{4}\\.\\d{4,5}").find(it)?.value
        }
    }

    private fun determineResearchField(tags: List<String>): String? {
        val fieldKeywords = mapOf(
            "Computer Science" to listOf("cs", "computer", "software", "algorithm"),
            "Physics" to listOf("physics", "quantum", "relativity"),
            "Biology" to listOf("biology", "genetics", "medical"),
            "Mathematics" to listOf("mathematics", "math", "theorem")
        )
        
        for ((field, keywords) in fieldKeywords) {
            if (tags.any { tag -> keywords.any { keyword -> tag.contains(keyword, ignoreCase = true) } }) {
                return field
            }
        }
        return null
    }

    private fun isPeerReviewed(tags: List<String>, publisher: String?): Boolean {
        val peerReviewedIndicators = listOf("peer-reviewed", "journal", "ieee", "acm", "springer")
        return tags.any { tag -> peerReviewedIndicators.any { indicator -> tag.contains(indicator, ignoreCase = true) } } ||
               publisher?.let { pub -> peerReviewedIndicators.any { indicator -> pub.contains(indicator, ignoreCase = true) } } ?: false
    }

    private fun extractIssueNumber(title: String): String? {
        return Regex("(?i)(?:issue|no\\.?)\\s*(\\d+)").find(title)?.groupValues?.get(1)
    }

    private fun extractVolumeNumber(title: String): String? {
        return Regex("(?i)(?:vol(?:ume)?\\.?)\\s*(\\d+)").find(title)?.groupValues?.get(1)
    }

    private fun extractMagazineTitle(title: String): String {
        // Remove issue/volume info to get base magazine title
        return title.replace(Regex("(?i)\\b(?:vol(?:ume)?\\.?|issue|no\\.?)\\s*\\d+"), "").trim()
    }

    private fun extractImdbId(comments: String?): String? {
        return comments?.let {
            Regex("tt\\d{7,8}").find(it)?.value
        }
    }

    private fun extractSeasonNumber(title: String): Int? {
        return Regex("(?i)s(?:eason)?\\s*(\\d+)").find(title)?.groupValues?.get(1)?.toInt()
    }

    private fun extractEpisodeNumber(title: String): Int? {
        return Regex("(?i)e(?:pisode)?\\s*(\\d+)").find(title)?.groupValues?.get(1)?.toInt()
    }

    private fun extractPodcastShow(title: String): String {
        // Extract show name from episode title
        return title.split(Regex("[:-]")).firstOrNull()?.trim() ?: title
    }
}

// Data classes for import management
data class CalibreImportState(
    val isImporting: Boolean = false,
    val progress: Float = 0f,
    val currentItem: String = "",
    val totalItems: Int = 0,
    val processedItems: Int = 0,
    val error: String? = null
)

data class CalibreImportOptions(
    val skipDuplicates: Boolean = true,
    val calculateHashes: Boolean = false,
    val extractCovers: Boolean = true,
    val mediaTypesFilter: Set<MediaType>? = null // Import only specific types
)

data class CalibreImportResult(
    val totalProcessed: Int,
    val successfulImports: Int,
    val skippedItems: Int,
    val errors: List<String>,
    val importedByType: Map<MediaType, Int>
)

sealed class SingleImportResult {
    data class Success(val itemId: Long) : SingleImportResult()
    data class Skipped(val reason: String) : SingleImportResult()
    data class Error(val message: String) : SingleImportResult()
}