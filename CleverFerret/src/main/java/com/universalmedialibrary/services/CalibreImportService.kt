package com.universalmedialibrary.services

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.*
import java.io.File
import java.io.FileInputStream
import java.security.MessageDigest
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for importing book libraries from Calibre metadata.db files
 *
 * RECENT CHANGES FROM MAIN:
 * - Fixed MediaItem constructor to use correct entity parameters
 * - Changed from bookRecord.path/format to file.name/extension
 * - Fixed fileSize from 0L to file.length()
 * - Commented out Person/Series/Genre DAO methods (not yet implemented)
 * - These changes ensure compatibility with the Room entity definitions
 */
@Singleton
class CalibreImportService @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val calibreReader: CalibreDatabaseReader
) {

    companion object {
        const val ACTION_IMPORT_CALIBRE = "com.universalmedialibrary.action.IMPORT_CALIBRE"
        const val EXTRA_LIBRARY_ID = "library_id"
        const val EXTRA_CALIBRE_PATH = "calibre_path"
    }

    suspend fun importCalibreDatabase(calibreDbPath: String, libraryRootPath: String, libraryId: Long) {
        val rawBooks = calibreReader.readBooks(calibreDbPath)

        for ((_, rawBook) in rawBooks) {
            val resolvedPath = resolveFullPath(libraryRootPath, rawBook.path) ?: continue
            val file = File(resolvedPath)
            if (!file.exists()) {
                continue
            }
            val fullPath = file.absolutePath

            // Conflict resolution: Skip if file already exists in database
            val existingMediaItem = mediaItemDao.getMediaItemByFilePath(fullPath)
            if (existingMediaItem != null) {
                continue // Skip duplicate
            }

            val cleanedTitle = cleanTitle(rawBook.title)
            val sortTitle = createSortTitle(cleanedTitle)
            val fileExtension = file.extension.lowercase()

            val mediaItem = MediaItem(
                libraryId = libraryId,
                filePath = fullPath,
                fileName = file.name,
                fileExtension = fileExtension,
                fileSize = file.length(),
                fileHash = calculateMD5(file),
                dateAdded = System.currentTimeMillis(),
                lastScanned = System.currentTimeMillis(),
                lastModified = file.lastModified(),
                mediaType = "BOOK",
                mimeType = null,
                isAvailable = true,
                hasMetadata = false,
                hasThumbnail = false,
                thumbnailPath = null
            )
            val newId = mediaItemDao.insertMediaItem(mediaItem)

            val metadataCommon = MetadataCommon(
                itemId = newId,
                title = cleanedTitle,
                sortTitle = sortTitle,
                originalTitle = null,
                year = null,
                releaseDate = null,
                rating = null,
                userRating = null,
                communityRating = null,
                summary = rawBook.comments,
                plot = null,
                tagline = null,
                coverImagePath = null,
                backdropImagePath = null,
                language = null,
                country = null,
                lastUpdated = System.currentTimeMillis(),
                metadataSource = "Calibre",
                externalId = null
            )
            metadataDao.insertMetadataCommon(metadataCommon)

            // Insert Book-specific metadata
            val metadataBook = MetadataBook(
                itemId = newId,
                subtitle = null, // Not available from Calibre easily
                publisher = rawBook.publisher,
                isbn = rawBook.isbn,
                pageCount = null, // Not available from Calibre easily
                series = null, // Will be set separately if series exists
                seriesIndex = null
            )
            metadataDao.insertMetadataBook(metadataBook)


            // Handle Authors
            for (authorName in rawBook.authorNames) {
                val cleanedAuthor = cleanAuthorName(authorName)
                val personId = metadataDao.findPersonByName(cleanedAuthor.name)
                    ?: metadataDao.insertPerson(cleanedAuthor)
                val itemPersonRole = ItemPersonRole(itemId = newId, personId = personId, role = "AUTHOR")
                metadataDao.insertItemPersonRole(itemPersonRole)
            }

            // Handle Series
            rawBook.seriesName?.let { seriesName ->
                val seriesId = metadataDao.findSeriesByName(seriesName)
                    ?: metadataDao.insertSeries(Series(name = seriesName, mediaType = "BOOK"))
                metadataDao.updateBookWithSeries(newId, seriesId)
            }

            // Handle Genres (from Tags)
            for (tagName in rawBook.tags) {
                val genreId = metadataDao.findGenreByName(tagName)
                    ?: metadataDao.insertGenre(Genre(name = tagName))
                metadataDao.insertItemGenre(ItemGenre(itemId = newId, genreId = genreId))
            }

        }
    }

    private fun resolveFullPath(libraryRootPath: String, relativePath: String): String? {
        val file = File(libraryRootPath, relativePath)
        if (file.isDirectory) {
            // File format preference order as specified in IMPORT_LOGIC.md
            val preferredExtensions = listOf("epub", "mobi", "azw3", "pdf", "cbz", "cbr")

            for (extension in preferredExtensions) {
                val matchingFile = file.listFiles()?.firstOrNull {
                    it.extension.equals(extension, ignoreCase = true)
                }
                if (matchingFile != null) {
                    return matchingFile.absolutePath
                }
            }

            // Fallback: return any e-book file if no preferred format found
            return file.listFiles()
                ?.firstOrNull { it.extension.lowercase() in listOf("epub", "pdf", "mobi", "azw3", "cbz", "cbr", "txt") }
                ?.absolutePath
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

    private fun String.myCapitalize(): String {
        if (this.isEmpty()) return ""
        return this.replaceFirstChar { if (it.isLowerCase()) it.titlecase(Locale.getDefault()) else it.toString() }
    }

    private fun calculateMD5(file: File): String {
        // PERFORMANCE & RESOURCE FIX: Use .use {} to ensure stream is properly closed
        val digest = MessageDigest.getInstance("MD5")
        FileInputStream(file).use { inputStream ->
            val buffer = ByteArray(8192)
            var read: Int
            while (inputStream.read(buffer).also { read = it } > 0) {
                digest.update(buffer, 0, read)
            }
        }
        val md5sum = digest.digest()
        return md5sum.joinToString("") { "%02x".format(it) }
    }
}
