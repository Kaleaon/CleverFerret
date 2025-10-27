package com.universalmedialibrary.services

import android.database.sqlite.SQLiteDatabase
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.*
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for exporting CleverFerret library to Calibre metadata.db format
 * Creates a Calibre-compatible library structure with metadata
 */
@Singleton
class CalibreExportService @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {

    /**
     * Export library to Calibre format
     * @param exportPath Path where to create the Calibre library
     * @param libraryId Library to export (null = export all libraries)
     * @return Result with success/failure and message
     */
    suspend fun exportToCalibre(
        exportPath: String,
        libraryId: Long? = null
    ): ExportResult {
        return try {
            val exportDir = File(exportPath)
            if (!exportDir.exists()) {
                exportDir.mkdirs()
            }

            val dbPath = File(exportDir, "metadata.db").absolutePath
            createCalibreDatabase(dbPath)

            val items = if (libraryId != null) {
                mediaItemDao.getMediaItemsByLibrary(libraryId)
            } else {
                mediaItemDao.getAllMediaItems()
            }

            val bookItems = items.filter { it.mediaType == "BOOK" }
            
            if (bookItems.isEmpty()) {
                return ExportResult(false, "No books found to export")
            }

            val db = SQLiteDatabase.openDatabase(dbPath, null, SQLiteDatabase.OPEN_READWRITE)
            
            var successCount = 0
            var failureCount = 0

            for (item in bookItems) {
                try {
                    exportBookToCalibre(db, item, exportDir)
                    successCount++
                } catch (e: Exception) {
                    failureCount++
                }
            }

            db.close()

            ExportResult(
                success = true,
                message = "Exported $successCount books successfully" +
                    (if (failureCount > 0) ", $failureCount failed" else "")
            )
        } catch (e: Exception) {
            ExportResult(false, "Export failed: ${e.message}")
        }
    }

    private fun createCalibreDatabase(dbPath: String) {
        val db = SQLiteDatabase.openOrCreateDatabase(dbPath, null)
        
        // Create Calibre database schema
        db.execSQL("""
            CREATE TABLE IF NOT EXISTS books (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL,
                sort TEXT,
                timestamp TEXT,
                pubdate TEXT,
                series_index REAL,
                author_sort TEXT,
                isbn TEXT,
                lccn TEXT,
                path TEXT NOT NULL,
                flags INTEGER,
                uuid TEXT,
                has_cover BOOL,
                last_modified TEXT
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS authors (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL COLLATE NOCASE,
                sort TEXT COLLATE NOCASE,
                link TEXT
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS books_authors_link (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                book INTEGER NOT NULL,
                author INTEGER NOT NULL,
                UNIQUE(book, author)
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS publishers (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL COLLATE NOCASE
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS books_publishers_link (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                book INTEGER NOT NULL,
                publisher INTEGER NOT NULL,
                UNIQUE(book, publisher)
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS tags (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL COLLATE NOCASE
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS books_tags_link (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                book INTEGER NOT NULL,
                tag INTEGER NOT NULL,
                UNIQUE(book, tag)
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS series (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL COLLATE NOCASE,
                sort TEXT COLLATE NOCASE
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS books_series_link (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                book INTEGER NOT NULL,
                series INTEGER NOT NULL,
                UNIQUE(book, series)
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS comments (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                book INTEGER NOT NULL,
                text TEXT NOT NULL COLLATE NOCASE
            )
        """)

        db.execSQL("""
            CREATE TABLE IF NOT EXISTS identifiers (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                book INTEGER NOT NULL,
                type TEXT NOT NULL,
                val TEXT NOT NULL COLLATE NOCASE,
                UNIQUE(book, type)
            )
        """)

        db.close()
    }

    private suspend fun exportBookToCalibre(
        db: SQLiteDatabase,
        item: MediaItem,
        exportDir: File
    ) {
        // Get metadata
        val metadata = metadataDao.getMetadataCommonById(item.itemId)
        val bookMetadata = metadataDao.getMetadataBookById(item.itemId)
        val authors = metadataDao.getItemAuthors(item.itemId)
        val genres = metadataDao.getItemGenres(item.itemId)

        // Copy book file to Calibre structure
        val sourceFile = File(item.filePath)
        if (!sourceFile.exists()) return

        val authorName = authors.firstOrNull()?.name ?: "Unknown"
        val bookTitle = metadata?.title ?: item.fileName
        val sanitizedAuthor = sanitizePath(authorName)
        val sanitizedTitle = sanitizePath(bookTitle)

        val bookDir = File(exportDir, "$sanitizedAuthor/$sanitizedTitle (${item.itemId})")
        bookDir.mkdirs()

        val destFile = File(bookDir, sourceFile.name)
        sourceFile.copyTo(destFile, overwrite = true)

        // Insert book record
        val bookId = db.insert("books", null, android.content.ContentValues().apply {
            put("title", bookTitle)
            put("sort", metadata?.sortTitle ?: bookTitle)
            put("path", "$sanitizedAuthor/$sanitizedTitle (${item.itemId})")
            put("timestamp", item.dateAdded.toString())
            put("last_modified", item.lastModified.toString())
            put("uuid", java.util.UUID.randomUUID().toString())
            put("has_cover", if (metadata?.coverImagePath != null) 1 else 0)
        })

        // Insert authors
        for (author in authors) {
            val authorId = getOrCreateAuthor(db, author.name, author.sortName)
            db.insert("books_authors_link", null, android.content.ContentValues().apply {
                put("book", bookId)
                put("author", authorId)
            })
        }

        // Insert publisher
        bookMetadata?.publisher?.let { publisherName ->
            val publisherId = getOrCreatePublisher(db, publisherName)
            db.insert("books_publishers_link", null, android.content.ContentValues().apply {
                put("book", bookId)
                put("publisher", publisherId)
            })
        }

        // Insert tags/genres
        for (genre in genres) {
            val tagId = getOrCreateTag(db, genre.name)
            db.insert("books_tags_link", null, android.content.ContentValues().apply {
                put("book", bookId)
                put("tag", tagId)
            })
        }

        // Insert ISBN
        bookMetadata?.isbn?.let { isbn ->
            db.insert("identifiers", null, android.content.ContentValues().apply {
                put("book", bookId)
                put("type", "isbn")
                put("val", isbn)
            })
        }

        // Insert comments/description
        metadata?.summary?.let { summary ->
            db.insert("comments", null, android.content.ContentValues().apply {
                put("book", bookId)
                put("text", summary)
            })
        }
    }

    private fun getOrCreateAuthor(db: SQLiteDatabase, name: String, sort: String): Long {
        val cursor = db.query(
            "authors",
            arrayOf("id"),
            "name = ?",
            arrayOf(name),
            null, null, null
        )

        val id = if (cursor.moveToFirst()) {
            cursor.getLong(0)
        } else {
            db.insert("authors", null, android.content.ContentValues().apply {
                put("name", name)
                put("sort", sort)
            })
        }
        cursor.close()
        return id
    }

    private fun getOrCreatePublisher(db: SQLiteDatabase, name: String): Long {
        val cursor = db.query(
            "publishers",
            arrayOf("id"),
            "name = ?",
            arrayOf(name),
            null, null, null
        )

        val id = if (cursor.moveToFirst()) {
            cursor.getLong(0)
        } else {
            db.insert("publishers", null, android.content.ContentValues().apply {
                put("name", name)
            })
        }
        cursor.close()
        return id
    }

    private fun getOrCreateTag(db: SQLiteDatabase, name: String): Long {
        val cursor = db.query(
            "tags",
            arrayOf("id"),
            "name = ?",
            arrayOf(name),
            null, null, null
        )

        val id = if (cursor.moveToFirst()) {
            cursor.getLong(0)
        } else {
            db.insert("tags", null, android.content.ContentValues().apply {
                put("name", name)
            })
        }
        cursor.close()
        return id
    }

    private fun sanitizePath(name: String): String {
        return name
            .replace(Regex("[^a-zA-Z0-9 _-]"), "")
            .replace(Regex("\\s+"), " ")
            .trim()
            .take(100)
    }
}

data class ExportResult(
    val success: Boolean,
    val message: String
)
