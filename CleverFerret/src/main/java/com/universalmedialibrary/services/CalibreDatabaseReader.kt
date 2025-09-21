package com.universalmedialibrary.services

import android.database.sqlite.SQLiteDatabase
import com.universalmedialibrary.services.RawCalibreBook
import javax.inject.Inject
import javax.inject.Singleton

/**
 * A utility class for reading data directly from a Calibre `metadata.db` SQLite file.
 * This class handles the complex queries required to de-normalize the Calibre database schema.
 */
@Singleton
class CalibreDatabaseReader @Inject constructor() {

    /**
     * Reads book information from the specified Calibre database file.
     *
     * This function performs a complex SQL query with multiple JOINs to aggregate
     * all relevant book data, including authors, series, tags, and comments,
     * into a map of [RawCalibreBook] objects.
     *
     * @param calibreDbPath The absolute path to the Calibre `metadata.db` file.
     * @return A map where the key is the book ID and the value is the [RawCalibreBook] object.
     *         Returns an empty map if the database cannot be opened or read.
     */
    fun readBooks(calibreDbPath: String): Map<Long, RawCalibreBook> {
        val calibreDb: SQLiteDatabase
        try {
            calibreDb = SQLiteDatabase.openDatabase(calibreDbPath, null, SQLiteDatabase.OPEN_READONLY)
        } catch (e: Exception) {
            // Log the exception in a real application
            e.printStackTrace()
            return emptyMap()
        }

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

        val cursor = calibreDb.rawQuery(query, null)

        val booksMap = mutableMapOf<Long, RawCalibreBook>()
        val tagsMap = mutableMapOf<Long, MutableList<String>>()
        val authorsMap = mutableMapOf<Long, MutableList<String>>()

        cursor.use {
            while (it.moveToNext()) {
                val bookId = it.getLong(it.getColumnIndexOrThrow("id"))

                // Initialize the book if we haven't seen it before
                if (!booksMap.containsKey(bookId)) {
                    booksMap[bookId] = RawCalibreBook(
                        id = bookId,
                        title = it.getString(it.getColumnIndexOrThrow("title")),
                        path = it.getString(it.getColumnIndexOrThrow("path")),
                        authorNames = emptyList(), // Will be aggregated
                        seriesName = it.getString(it.getColumnIndexOrThrow("series_name")),
                        seriesIndex = it.getDouble(it.getColumnIndexOrThrow("series_index")),
                        publisher = it.getString(it.getColumnIndexOrThrow("publisher_name")),
                        isbn = it.getString(it.getColumnIndexOrThrow("isbn")),
                        tags = emptyList(), // Will be aggregated
                        comments = it.getString(it.getColumnIndexOrThrow("comments"))
                    )
                }

                // Aggregate authors
                it.getString(it.getColumnIndexOrThrow("author_name"))?.let { author ->
                    authorsMap.getOrPut(bookId) { mutableListOf() }.add(author)
                }

                // Aggregate tags
                it.getString(it.getColumnIndexOrThrow("tag_name"))?.let { tag ->
                    tagsMap.getOrPut(bookId) { mutableListOf() }.add(tag)
                }
            }
        }
        calibreDb.close()

        // Combine the aggregated data into the final map
        return booksMap.mapValues { (id, book) ->
            book.copy(
                authorNames = (authorsMap[id] ?: emptyList()).distinct(),
                tags = (tagsMap[id] ?: emptyList()).distinct()
            )
        }
    }
}
