package com.universalmedialibrary.services

import android.database.sqlite.SQLiteDatabase
import com.universalmedialibrary.services.RawCalibreBook
import javax.inject.Inject
import javax.inject.Singleton

/**
 * A singleton service responsible for reading and parsing a Calibre `metadata.db` file.
 *
 * This class encapsulates the logic for connecting to a Calibre database,
 * executing a complex query to retrieve book data, and parsing the results into a
 * structured format. It is designed to be injected using Hilt.
 */
@Singleton
class CalibreDatabaseReader
    @Inject
    constructor() {
        /**
         * Reads all book data from the specified Calibre database file.
         *
         * This function opens a read-only connection to the Calibre SQLite database and executes a
         * comprehensive query to de-normalize the schema. It joins multiple tables (books, authors,
         * series, tags, etc.) to gather all relevant information for each book.
         *
         * The results are processed to aggregate multi-valued fields like authors and tags, which
         * are stored in separate tables in Calibre.
         *
         * @param calibreDbPath The absolute file path to the Calibre `metadata.db` file.
         * @return A map where the key is the Calibre book ID and the value is the corresponding [RawCalibreBook] object.
         *         Returns an empty map if the database cannot be opened or read.
         */
        fun readBooks(calibreDbPath: String): Map<Long, RawCalibreBook> {
            val calibreDb: SQLiteDatabase
            try {
                calibreDb = SQLiteDatabase.openDatabase(calibreDbPath, null, SQLiteDatabase.OPEN_READONLY)
            } catch (e: Exception) {
                // Log the exception or handle it as needed
                return emptyMap()
            }

            // This query is complex because Calibre uses a normalized schema.
            // We need to join multiple tables to get all the data for a single book.
            val query =
                """
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
                        booksMap[bookId] =
                            RawCalibreBook(
                                id = bookId,
                                title = it.getString(it.getColumnIndexOrThrow("title")),
                                path = it.getString(it.getColumnIndexOrThrow("path")),
                                authorNames = emptyList(), // Will be aggregated
                                seriesName = it.getString(it.getColumnIndexOrThrow("series_name")),
                                seriesIndex = it.getDouble(it.getColumnIndexOrThrow("series_index")),
                                publisher = it.getString(it.getColumnIndexOrThrow("publisher_name")),
                                isbn = it.getString(it.getColumnIndexOrThrow("isbn")),
                                tags = emptyList(), // Will be aggregated
                                comments = it.getString(it.getColumnIndexOrThrow("comments")),
                            )
                    }

                    // Aggregate authors for the current book
                    it.getString(it.getColumnIndexOrThrow("author_name"))?.let { author ->
                        authorsMap.getOrPut(bookId) { mutableListOf() }.add(author)
                    }

                    // Aggregate tags for the current book
                    it.getString(it.getColumnIndexOrThrow("tag_name"))?.let { tag ->
                        tagsMap.getOrPut(bookId) { mutableListOf() }.add(tag)
                    }
                }
            }
            calibreDb.close()

            // Combine the aggregated data into the final map
            return booksMap.mapValues { (id, book) ->
                book.copy(
                    authorNames = authorsMap[id]?.distinct() ?: emptyList(),
                    tags = tagsMap[id]?.distinct() ?: emptyList(),
                )
            }
        }
    }
