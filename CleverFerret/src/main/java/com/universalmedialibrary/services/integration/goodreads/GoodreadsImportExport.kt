package com.universalmedialibrary.services.integration.goodreads

import com.github.doyaaaaaken.kotlincsv.dsl.context.WriteQuoteMode
import com.github.doyaaaaaken.kotlincsv.dsl.csvReader
import com.github.doyaaaaaken.kotlincsv.dsl.csvWriter
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataBook
import com.universalmedialibrary.data.local.entity.MetadataCommon
import java.io.InputStream
import java.io.OutputStream
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Goodreads CSV Import/Export Service
 * 
 * Handles importing and exporting book libraries in Goodreads-compatible CSV format.
 * This enables users to:
 * - Import their existing Goodreads library into CleverFerret
 * - Export their CleverFerret library for backup or migration
 * - Maintain compatibility with Goodreads ecosystem
 * 
 * CSV Format based on Goodreads export standard:
 * https://www.goodreads.com/review/import
 * 
 * Adapted from badreads project: https://github.com/fenimore/badreads
 */
@Singleton
class GoodreadsImportExport @Inject constructor() {
    
    private val csvDateFormatter: DateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd")
    
    /**
     * Data class representing a book for import/export
     */
    data class GoodreadsBook(
        val title: String,
        val subtitle: String? = null,
        val author: String? = null,
        val additionalAuthors: String? = null,
        val isbn10: String? = null,
        val isbn13: String? = null,
        val publisher: String? = null,
        val year: Int? = null,
        val originalYear: Int? = null,
        val numberPages: Int? = null,
        val progress: Int? = null,
        val series: String? = null,
        val format: String? = null,
        val language: String? = null,
        val rating: Int? = null,
        val shelf: String = "to-read", // currently-reading, read, to-read
        val description: String? = null,
        val notes: String? = null,
        val bookmark: Boolean = false,
        val dateAdded: Long? = null,
        val dateRead: Long? = null,
        val dateStarted: Long? = null,
        val customCover: String? = null
    )
    
    /**
     * Import books from Goodreads CSV format
     * 
     * @param inputStream CSV input stream
     * @return List of imported books
     */
    fun importFromCSV(inputStream: InputStream): List<GoodreadsBook> {
        val rows = csvReader().readAllWithHeader(inputStream)
        val imports = mutableListOf<GoodreadsBook>()
        
        for (row in rows) {
            val fullTitle = row["Title"] ?: continue
            var title = fullTitle
            var subtitle: String? = null
            
            // Split title and subtitle if colon present
            if (title.contains(":")) {
                val parts = fullTitle.split(":", limit = 2)
                title = parts[0].trim()
                subtitle = parts.getOrNull(1)?.trim()
            }
            
            val additionalAuthors = row["Additional Authors"]?.ifBlank { null }
            val isbn10 = row["ISBN"]?.removeSurrounding("=\"", "\"")?.ifBlank { null }
            val isbn13 = row["ISBN13"]?.removeSurrounding("=\"", "\"")?.ifBlank { null }
            
            // Parse dates
            val startString = row["Date Started"]?.ifBlank { null }
            val started = startString?.let { 
                try {
                    LocalDate.parse(it, csvDateFormatter).toEpochDay()
                } catch (e: Exception) {
                    null
                }
            }
            
            val readString = row["Date Read"]?.ifBlank { null }
            val read = readString?.let {
                try {
                    LocalDate.parse(it, csvDateFormatter).toEpochDay()
                } catch (e: Exception) {
                    null
                }
            }
            
            val addedString = row["Date Added"]?.ifBlank { null }
            val added = addedString?.let {
                try {
                    LocalDate.parse(it, csvDateFormatter).toEpochDay()
                } catch (e: Exception) {
                    LocalDate.now().toEpochDay()
                }
            } ?: LocalDate.now().toEpochDay()
            
            val book = GoodreadsBook(
                title = title,
                subtitle = subtitle,
                isbn10 = isbn10,
                isbn13 = isbn13,
                author = row["Author"]?.ifBlank { null },
                additionalAuthors = additionalAuthors,
                publisher = row["Publisher"]?.ifBlank { null },
                year = row["Year Published"]?.toIntOrNull(),
                originalYear = row["Original Publication Year"]?.toIntOrNull(),
                numberPages = row["Number of Pages"]?.toIntOrNull(),
                progress = row["Progress"]?.toIntOrNull(),
                series = row["Series"]?.ifBlank { null },
                format = row["Format"]?.ifBlank { null },
                language = row["Language"]?.ifBlank { null },
                rating = row["My Rating"]?.toIntOrNull(),
                shelf = row.getOrDefault("Exclusive Shelf", "to-read"),
                description = row["Description"]?.ifBlank { null },
                notes = row["My Review"]?.ifBlank { null },
                bookmark = row["Bookmark"]?.let { it == "1" || it.equals("true", ignoreCase = true) } ?: false,
                dateAdded = added,
                dateRead = read,
                dateStarted = started,
                customCover = row["CustomCover"]?.ifBlank { null }
            )
            
            imports.add(book)
        }
        
        return imports
    }
    
    /**
     * Export books to Goodreads CSV format
     * 
     * @param output Output stream
     * @param books List of books to export
     * @return Output stream with CSV data
     */
    fun exportToCSV(output: OutputStream, books: List<GoodreadsBook>): OutputStream {
        val headers = listOf(
            // Basic info
            "Title", "Author", "Additional Authors",
            // More info
            "ISBN", "ISBN13", "Publisher",
            "Number of Pages", "Year Published", "Original Publication Year",
            "Progress", "Series", "Format", "Language",
            // Dates
            "Date Read", "Date Added", "Date Started",
            // Library status
            "My Rating", "My Review", "Bookmark", "Exclusive Shelf", "Description"
        )
        
        val rows = books.map { book ->
            val fullTitle = if (book.subtitle != null) {
                "${book.title}: ${book.subtitle}"
            } else {
                book.title
            }
            
            listOf(
                // Basic info
                fullTitle,
                book.author.orEmpty(),
                book.additionalAuthors.orEmpty(),
                // More info
                book.isbn10.orEmpty(),
                book.isbn13.orEmpty(),
                book.publisher.orEmpty(),
                book.numberPages?.toString().orEmpty(),
                book.year?.toString().orEmpty(),
                book.originalYear?.toString().orEmpty(),
                book.progress?.toString().orEmpty(),
                book.series.orEmpty(),
                book.format.orEmpty(),
                book.language.orEmpty(),
                // Dates
                book.dateRead?.let { LocalDate.ofEpochDay(it).format(csvDateFormatter) }.orEmpty(),
                book.dateAdded?.let { LocalDate.ofEpochDay(it).format(csvDateFormatter) }.orEmpty(),
                book.dateStarted?.let { LocalDate.ofEpochDay(it).format(csvDateFormatter) }.orEmpty(),
                // Library status
                book.rating?.toString().orEmpty(),
                book.notes.orEmpty(),
                if (book.bookmark) "1" else "",
                book.shelf,
                book.description.orEmpty()
            )
        }
        
        csvWriter {
            quote {
                mode = WriteQuoteMode.ALL
            }
        }.open(output) {
            writeRow(headers)
            writeRows(rows)
        }
        
        return output
    }
    
    /**
     * Convert GoodreadsBook to CleverFerret entities
     * This is a helper method for integration with CleverFerret's database
     */
    fun toCleverFerretEntities(
        book: GoodreadsBook,
        libraryId: Long
    ): Triple<MediaItem, MetadataCommon, MetadataBook> {
        // Create MediaItem
        val mediaItem = MediaItem(
            itemId = 0, // Auto-generate
            libraryId = libraryId,
            filePath = "", // Will be filled when file is located
            fileName = book.title,
            fileExtension = book.format?.lowercase() ?: "epub",
            fileSize = 0,
            fileHash = null,
            dateAdded = (book.dateAdded ?: LocalDate.now().toEpochDay()) * 86400000, // Convert days to ms
            lastScanned = System.currentTimeMillis(),
            lastModified = 0,
            mediaType = "BOOK",
            mimeType = null,
            isAvailable = false, // Mark as not available until file is found
            hasMetadata = true,
            hasThumbnail = false,
            thumbnailPath = null
        )
        
        // Create MetadataCommon
        val metadataCommon = MetadataCommon(
            itemId = 0, // Will be set after insert
            title = book.title,
            sortTitle = book.title.lowercase(),
            originalTitle = null,
            year = book.year,
            releaseDate = book.year?.let { year ->
                LocalDate.of(year, 1, 1).toEpochDay() * 86400000
            },
            rating = book.rating?.toFloat(),
            userRating = book.rating?.toFloat(),
            communityRating = null,
            summary = book.description,
            plot = book.description,
            tagline = null,
            coverImagePath = book.customCover,
            backdropImagePath = null,
            language = book.language,
            country = null,
            lastUpdated = System.currentTimeMillis(),
            metadataSource = "goodreads_import",
            externalId = null,
            isFavorite = book.bookmark,
            isDownloaded = false
        )
        
        // Create MetadataBook
        val metadataBook = MetadataBook(
            itemId = 0, // Will be set after insert
            subtitle = book.subtitle,
            publisher = book.publisher,
            isbn = book.isbn10,
            isbn13 = book.isbn13,
            asin = null,
            pageCount = book.numberPages,
            wordCount = null,
            chapterCount = null,
            series = book.series,
            seriesIndex = null,
            format = book.format,
            edition = null,
            printLength = book.numberPages,
            publicationDate = book.year?.let { year ->
                LocalDate.of(year, 1, 1).toEpochDay() * 86400000
            },
            firstPublishedDate = book.originalYear?.let { year ->
                LocalDate.of(year, 1, 1).toEpochDay() * 86400000
            },
            readingProgress = if (book.shelf == "read") 1.0f else 0f,
            isRead = book.shelf == "read",
            lastReadDate = book.dateRead?.let { it * 86400000 },
            currentPage = book.progress ?: 0,
            currentChapter = 0,
            averageRating = book.rating?.toFloat(),
            ratingsCount = null,
            reviewsCount = null,
            bookmarked = book.bookmark,
            shelf = book.shelf,
            notes = book.notes,
            additionalAuthors = book.additionalAuthors,
            customCoverUrl = book.customCover,
            scannedViaBarcode = false, // Imported from CSV, not scanned
            purchaseLinksShown = false,
            dateScanned = null
        )
        
        return Triple(mediaItem, metadataCommon, metadataBook)
    }
}
