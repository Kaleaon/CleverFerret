package com.universalmedialibrary.services

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.*
import java.io.File
import java.io.FileInputStream
import java.security.MessageDigest
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * A singleton service that orchestrates the import of a Calibre library into the application's database.
 *
 * This service coordinates the process of reading from a Calibre `metadata.db` file,
 * cleaning and transforming the raw data, and then inserting it into the app's own
 * Room database using the appropriate DAOs.
 *
 * @property mediaItemDao DAO for media item database operations.
 * @property metadataDao DAO for metadata-related database operations.
 * @property calibreReader Service to read and parse the Calibre database.
 */
@Singleton
class CalibreImportService
    @Inject
    constructor(
        private val mediaItemDao: MediaItemDao,
        private val metadataDao: MetadataDao,
        private val calibreReader: CalibreDatabaseReader,
    ) {
        /**
         * Imports a complete Calibre library from a specified database path.
         *
         * This function performs the following steps for each book found in the Calibre database:
         * 1. Reads the raw book data using [CalibreDatabaseReader].
         * 2. Resolves the full path to the book file and verifies its existence.
         * 3. Calculates an MD5 hash of the file for future change detection.
         * 4. Cleans and formats titles, author names, and other metadata.
         * 5. Inserts the data into the application's database, creating records in
         *    `MediaItem`, `MetadataCommon`, `MetadataBook`, and linking related entities
         *    like `People` (authors), `Series`, and `Genre` (tags).
         *
         * @param calibreDbPath The absolute file path to the Calibre `metadata.db` file.
         * @param libraryRootPath The absolute file path to the root directory of the Calibre library.
         * @param libraryId The ID of the app's library into which the books will be imported.
         */
        suspend fun importCalibreDatabase(
            calibreDbPath: String,
            libraryRootPath: String,
            libraryId: Long,
        ) {
            val rawBooks = calibreReader.readBooks(calibreDbPath)

            for ((_, rawBook) in rawBooks) {
                val file = File(resolveFullPath(libraryRootPath, rawBook.path) ?: continue)
                if (!file.exists()) {
                    continue
                }
                val fullPath = file.absolutePath

                val cleanedTitle = cleanTitle(rawBook.title)
                val sortTitle = createSortTitle(cleanedTitle)

                val mediaItem =
                    MediaItem(
                        libraryId = libraryId,
                        filePath = fullPath,
                        dateAdded = System.currentTimeMillis(),
                        lastScanned = System.currentTimeMillis(),
                        fileHash = calculateMD5(file),
                    )
                val newId = mediaItemDao.insertMediaItem(mediaItem)

                val metadataCommon =
                    MetadataCommon(
                        itemId = newId,
                        title = cleanedTitle,
                        sortTitle = sortTitle,
                        year = null, // Not available from Calibre easily
                        releaseDate = null, // Not available from Calibre easily
                        rating = null, // Not available from Calibre easily
                        summary = rawBook.comments,
                        coverImagePath = null,
                    )
                metadataDao.insertMetadataCommon(metadataCommon)

                // Insert Book-specific metadata
                val metadataBook =
                    MetadataBook(
                        itemId = newId,
                        subtitle = null, // Not available from Calibre easily
                        publisher = rawBook.publisher,
                        isbn = rawBook.isbn,
                        pageCount = null, // Not available from Calibre easily
                        seriesId = null, // Will be handled next
                    )
                metadataDao.insertMetadataBook(metadataBook)

                // Handle Authors
                for (authorName in rawBook.authorNames) {
                    val cleanedAuthor = cleanAuthorName(authorName)
                    val personId =
                        metadataDao.findPersonByName(cleanedAuthor.name)
                            ?: metadataDao.insertPerson(cleanedAuthor)
                    val itemPersonRole = ItemPersonRole(itemId = newId, personId = personId, role = "AUTHOR")
                    metadataDao.insertItemPersonRole(itemPersonRole)
                }

                // Handle Series
                rawBook.seriesName?.let { seriesName ->
                    val seriesId =
                        metadataDao.findSeriesByName(seriesName)
                            ?: metadataDao.insertSeries(Series(name = seriesName))
                    metadataDao.updateBookWithSeries(newId, seriesId)
                }

                // Handle Genres (from Tags)
                for (tagName in rawBook.tags) {
                    val genreId =
                        metadataDao.findGenreByName(tagName)
                            ?: metadataDao.insertGenre(Genre(name = tagName))
                    metadataDao.insertItemGenre(ItemGenre(itemId = newId, genreId = genreId))
                }
            }
        }

        /**
         * Resolves the full path to a book file from its relative path in the Calibre library.
         * Calibre sometimes stores books in a directory with the same name as the file. This function handles that case.
         *
         * @param libraryRootPath The root path of the Calibre library.
         * @param relativePath The relative path of the book from the Calibre database.
         * @return The absolute path to a valid book file (epub, mobi, pdf), or null if not found.
         */
        private fun resolveFullPath(
            libraryRootPath: String,
            relativePath: String,
        ): String? {
            val file = File(libraryRootPath, relativePath)
            if (file.isDirectory) {
                return file
                    .listFiles()
                    ?.firstOrNull { it.extension in listOf("epub", "mobi", "pdf") }
                    ?.absolutePath
            }
            return file.absolutePath
        }

        /**
         * Cleans a raw title string by capitalizing each word.
         */
        private fun cleanTitle(rawTitle: String): String = rawTitle.split(' ').joinToString(" ") { it.myCapitalize() }

        /**
         * Creates a sort-friendly title by moving leading articles ("The", "A", "An") to the end.
         * For example, "The Lord of the Rings" becomes "Lord of the Rings, The".
         */
        private fun createSortTitle(title: String): String {
            val articles = listOf("The ", "A ", "An ")
            for (article in articles) {
                if (title.startsWith(article, ignoreCase = true)) {
                    return title.substring(article.length) + ", " + title.substring(0, article.length - 1)
                }
            }
            return title
        }

        /**
         * Parses a raw author name from Calibre and converts it into a structured [People] object.
         * This handles both "FirstName LastName" and "LastName, FirstName" formats.
         *
         * @param rawName The raw author name string.
         * @return A [People] object with cleaned `name` and `sortName` fields.
         */
        private fun cleanAuthorName(rawName: String): People {
            val (lastName, firstName) =
                if (rawName.contains(",")) {
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

        /**
         * A helper extension function to capitalize the first letter of a string.
         */
        private fun String.myCapitalize(): String {
            if (this.isEmpty()) return ""
            return this.replaceFirstChar { if (it.isLowerCase()) it.titlecase(Locale.getDefault()) else it.toString() }
        }

        /**
         * Calculates the MD5 hash of a file.
         *
         * @param file The file to hash.
         * @return A hex string representation of the MD5 hash.
         */
        private fun calculateMD5(file: File): String {
            val digest = MessageDigest.getInstance("MD5")
            val inputStream = FileInputStream(file)
            val buffer = ByteArray(8192)
            var read: Int
            inputStream.use {
                while (it.read(buffer).also { read = it } > 0) {
                    digest.update(buffer, 0, read)
                }
            }
            val md5sum = digest.digest()
            return md5sum.joinToString("") { "%02x".format(it) }
        }
    }
