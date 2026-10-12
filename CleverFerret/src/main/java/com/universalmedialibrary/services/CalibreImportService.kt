package com.universalmedialibrary.services

import androidx.room.withTransaction
import com.universalmedialibrary.data.local.AppDatabase
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
 */
@Singleton
class CalibreImportService @Inject constructor(
    private val database: AppDatabase,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val calibreReader: CalibreDatabaseReader
) {

    companion object {
        const val ACTION_IMPORT_CALIBRE = "com.universalmedialibrary.action.IMPORT_CALIBRE"
        const val EXTRA_LIBRARY_ID = "library_id"
        const val EXTRA_CALIBRE_PATH = "calibre_path"
    }

    suspend fun importCalibreDatabase(
        calibreDbPath: String,
        libraryRootPath: String,
        libraryId: Long,
        chunkSize: Int = 250,
        onProgress: (imported: Int, total: Int) -> Unit = { _, _ -> }
    ) {
        val rawBooks = calibreReader.readBooks(calibreDbPath)
        val validItems = mutableListOf<Pair<String, RawCalibreBook>>()

        for ((_, rawBook) in rawBooks) {
            val resolvedPath = resolveFullPath(libraryRootPath, rawBook.path)
            val fullPath = resolvedPath ?: File(libraryRootPath, rawBook.path).absolutePath
            validItems.add(fullPath to rawBook)
        }

        val totalCount = validItems.size
        var importedCount = 0

        for (chunk in validItems.chunked(chunkSize.coerceAtLeast(1))) {
            val chunkPaths = chunk.map { it.first }
            val existingPathsSet = mediaItemDao.getExistingFilePaths(chunkPaths).toSet()

            database.withTransaction {
                for ((fullPath, rawBook) in chunk) {
                    if (existingPathsSet.contains(fullPath)) {
                        continue // Skip duplicate
                    }

                    val file = File(fullPath)
                    val isFileAvailable = file.exists()
                    val cleanedTitle = cleanTitle(rawBook.title)
                    val sortTitle = createSortTitle(cleanedTitle)
                    val fileExtension = if (file.extension.isNotBlank()) file.extension.lowercase() else "epub"
                    val fileSize = if (isFileAvailable) file.length() else 0L
                    val fileHash = if (isFileAvailable) calculateMD5(file) else "calibre_${rawBook.id}"
                    val lastModified = if (isFileAvailable) file.lastModified() else System.currentTimeMillis()

                    val mediaItem = MediaItem(
                        libraryId = libraryId,
                        filePath = fullPath,
                        fileName = file.name,
                        fileExtension = fileExtension,
                        fileSize = fileSize,
                        fileHash = fileHash,
                        dateAdded = System.currentTimeMillis(),
                        lastScanned = System.currentTimeMillis(),
                        lastModified = lastModified,
                        mediaType = "BOOK",
                        mimeType = null,
                        isAvailable = isFileAvailable,
                        hasMetadata = true,
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
                        externalId = rawBook.id.toString()
                    )
                    metadataDao.insertMetadataCommon(metadataCommon)

                    // Insert Book-specific metadata with preserved series name and series index ordering
                    val metadataBook = MetadataBook(
                        itemId = newId,
                        subtitle = null,
                        publisher = rawBook.publisher,
                        isbn = rawBook.isbn,
                        pageCount = null,
                        series = rawBook.seriesName,
                        seriesIndex = rawBook.seriesIndex?.toFloat()
                    )
                    metadataDao.insertMetadataBook(metadataBook)

                    // Handle Authors and author links
                    for (authorName in rawBook.authorNames) {
                        val cleanedAuthor = cleanAuthorName(authorName)
                        val personId = metadataDao.findPersonByName(cleanedAuthor.name)
                            ?: metadataDao.insertPerson(cleanedAuthor)
                        val itemPersonRole = ItemPersonRole(itemId = newId, personId = personId, role = "AUTHOR")
                        metadataDao.insertItemPersonRole(itemPersonRole)
                    }

                    // Handle Series entity linkage
                    rawBook.seriesName?.let { seriesName ->
                        val seriesId = metadataDao.findSeriesByName(seriesName)
                            ?: metadataDao.insertSeries(Series(name = seriesName, mediaType = "BOOK"))
                        metadataDao.updateBookWithSeries(newId, seriesId)
                    }

                    // Handle Custom Tags and Genres
                    for (tagName in rawBook.tags) {
                        val genreId = metadataDao.findGenreByName(tagName)
                            ?: metadataDao.insertGenre(Genre(name = tagName))
                        metadataDao.insertItemGenre(ItemGenre(itemId = newId, genreId = genreId))
                    }
                }
            }

            importedCount += chunk.size
            onProgress(importedCount, totalCount)
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
