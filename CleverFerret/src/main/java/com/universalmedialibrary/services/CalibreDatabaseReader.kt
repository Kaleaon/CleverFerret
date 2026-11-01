package com.universalmedialibrary.services

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.net.Uri
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.services.RawCalibreBook
import dagger.hilt.android.qualifiers.ApplicationContext
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Statistics retrieved directly from a local Calibre metadata.db database.
 */
data class CalibreDatabaseStats(
    val bookCount: Int = 0,
    val authorCount: Int = 0,
    val seriesCount: Int = 0,
    val tagCount: Int = 0
)

@Singleton
class CalibreDatabaseReader @Inject constructor(
    @ApplicationContext private val context: Context
) {

    /**
     * Executes a read-only block against a Calibre SQLite database.
     * Enforces read-only safety by copying the source database to a temporary file
     * and setting read-only permissions, preventing any modifications or write locks
     * on the source Calibre metadata.db file.
     */
    fun <T> openCalibreDatabase(
        dbPathOrUri: String,
        block: (SQLiteDatabase) -> T
    ): T {
        var tempFile: File? = null
        try {
            val resolvedFile = resolveDatabaseFile(dbPathOrUri)
            if (resolvedFile != null && resolvedFile.exists()) {
                // To guarantee 100% read-only safety and prevent sidecar -wal/-shm files on source media,
                // copy to a temporary cache file and mark as read-only.
                val temp = File.createTempFile("calibre_readonly_", ".db", context.cacheDir)
                tempFile = temp
                resolvedFile.inputStream().use { input ->
                    temp.outputStream().use { output ->
                        input.copyTo(output)
                    }
                }
                temp.setReadOnly()
                return SQLiteDatabase.openDatabase(temp.absolutePath, null, SQLiteDatabase.OPEN_READONLY).use { db ->
                    block(db)
                }
            }

            // Fallback for direct content:// URI input stream handling
            if (dbPathOrUri.startsWith("content://")) {
                val uri = Uri.parse(dbPathOrUri)
                val targetUri = locateMetadataDbUriInTree(uri) ?: uri
                val temp = File.createTempFile("calibre_readonly_uri_", ".db", context.cacheDir)
                tempFile = temp
                context.contentResolver.openInputStream(targetUri)?.use { input ->
                    FileOutputStream(temp).use { output ->
                        input.copyTo(output)
                    }
                }
                temp.setReadOnly()
                return SQLiteDatabase.openDatabase(temp.absolutePath, null, SQLiteDatabase.OPEN_READONLY).use { db ->
                    block(db)
                }
            }

            // Fallback direct open if copy was not possible
            val directPath = if (File(dbPathOrUri).isDirectory) {
                File(dbPathOrUri, "metadata.db").absolutePath
            } else {
                dbPathOrUri
            }
            return SQLiteDatabase.openDatabase(directPath, null, SQLiteDatabase.OPEN_READONLY).use { db ->
                block(db)
            }
        } finally {
            tempFile?.delete()
        }
    }

    private fun resolveDatabaseFile(dbPathOrUri: String): File? {
        val file = File(dbPathOrUri)
        if (file.isDirectory) {
            val dbFile = File(file, "metadata.db")
            if (dbFile.exists()) return dbFile
        } else if (file.exists()) {
            return file
        }
        return null
    }

    private fun locateMetadataDbUriInTree(uri: Uri): Uri? {
        val treeDoc = DocumentFile.fromTreeUri(context, uri) ?: return null
        return if (treeDoc.isDirectory) {
            treeDoc.findFile("metadata.db")?.uri
        } else {
            treeDoc.uri
        }
    }

    /**
     * Reads all e-book records and associated metadata from the Calibre database.
     */
    fun readBooks(calibreDbPath: String): Map<Long, RawCalibreBook> {
        return try {
            openCalibreDatabase(calibreDbPath) { calibreDb ->
                // This query is complex because Calibre uses a normalized schema.
                // We need to join multiple tables to get all the data for a single book.
                val query = """
                    SELECT
                        b.id, b.title, b.path, b.series_index,
                        a.name as author_name,
                        s.name as series_name,
                        p.name as publisher_name,
                        i.val as isbn,
                        t.name as tag_name,
                        c.text as comments
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
                """.trimIndent()

                calibreDb.rawQuery(query, null).use { cursor ->
                    val booksMap = mutableMapOf<Long, RawCalibreBook>()
                    val tagsMap = mutableMapOf<Long, MutableSet<String>>() // Use Set to avoid duplicates
                    val authorsMap = mutableMapOf<Long, MutableSet<String>>() // Use Set to avoid duplicates

                    try {
                        while (cursor.moveToNext()) {
                            val bookId = cursor.getLong(cursor.getColumnIndexOrThrow("id"))

                            // Initialize the book if we haven't seen it before
                            if (!booksMap.containsKey(bookId)) {
                                booksMap[bookId] = RawCalibreBook(
                                    id = bookId,
                                    title = cursor.getString(cursor.getColumnIndexOrThrow("title")) ?: "Unknown",
                                    path = cursor.getString(cursor.getColumnIndexOrThrow("path")) ?: "",
                                    authorNames = emptyList(), // Will be aggregated
                                    seriesName = cursor.getString(cursor.getColumnIndexOrThrow("series_name")),
                                    seriesIndex = if (cursor.isNull(cursor.getColumnIndexOrThrow("series_index"))) {
                                        null
                                    } else {
                                        cursor.getDouble(cursor.getColumnIndexOrThrow("series_index"))
                                    },
                                    publisher = cursor.getString(cursor.getColumnIndexOrThrow("publisher_name")),
                                    isbn = cursor.getString(cursor.getColumnIndexOrThrow("isbn")),
                                    tags = emptyList(), // Will be aggregated
                                    comments = cursor.getString(cursor.getColumnIndexOrThrow("comments"))
                                )
                            }

                            // Aggregate authors (avoid duplicates)
                            cursor.getString(cursor.getColumnIndexOrThrow("author_name"))?.takeIf { it.isNotBlank() }?.let {
                                authorsMap.getOrPut(bookId) { mutableSetOf() }.add(it)
                            }

                            // Aggregate tags (avoid duplicates)
                            cursor.getString(cursor.getColumnIndexOrThrow("tag_name"))?.takeIf { it.isNotBlank() }?.let {
                                tagsMap.getOrPut(bookId) { mutableSetOf() }.add(it)
                            }
                        }
                    } finally {
                        // Ensure cursor is properly closed even if exception occurs
                    }

                    // Combine the aggregated data into the final map
                    booksMap.mapValues { (id, book) ->
                        book.copy(
                            authorNames = (authorsMap[id] ?: emptySet()).toList(),
                            tags = (tagsMap[id] ?: emptySet()).toList()
                        )
                    }
                }
            }
        } catch (e: Exception) {
            emptyMap()
        }
    }

    /**
     * Calculates library statistics dynamically from local Calibre database records.
     */
    fun readLibraryStats(calibreDbPath: String): CalibreDatabaseStats {
        return try {
            openCalibreDatabase(calibreDbPath) { db ->
                val books = querySingleCount(db, "SELECT COUNT(*) FROM books")
                val authors = querySingleCount(db, "SELECT COUNT(*) FROM authors")
                val series = querySingleCount(db, "SELECT COUNT(*) FROM series")
                val tags = querySingleCount(db, "SELECT COUNT(*) FROM tags")
                CalibreDatabaseStats(
                    bookCount = books,
                    authorCount = authors,
                    seriesCount = series,
                    tagCount = tags
                )
            }
        } catch (e: Exception) {
            CalibreDatabaseStats()
        }
    }

    private fun querySingleCount(db: SQLiteDatabase, sql: String): Int {
        return try {
            db.rawQuery(sql, null).use { cursor ->
                if (cursor.moveToFirst()) cursor.getInt(0) else 0
            }
        } catch (e: Exception) {
            0
        }
    }
}

