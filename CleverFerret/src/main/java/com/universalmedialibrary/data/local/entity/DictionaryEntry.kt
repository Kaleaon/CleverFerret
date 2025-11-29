package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Dictionary Entry for custom spell-checking and glossaries.
 *
 * Stores words that should be:
 * 1. Whitelisted (fictional terms like "Cannidor")
 * 2. Auto-corrected (typos like "teh" -> "the")
 * 3. Defined (glossary terms)
 *
 * Can be global (bookId = null) or specific to a book (bookId = X).
 */
@Serializable
@Entity(
    tableName = "dictionary_entries",
    indices = [
        Index(value = ["word", "bookId"], unique = true),
        Index(value = ["bookId"])
    ]
)
data class DictionaryEntry(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    /**
     * The word to match (case-insensitive usually).
     */
    val word: String,

    /**
     * If not null, this word is an error and should be replaced with this value.
     * If null, this word is valid (whitelisted).
     */
    val replacement: String? = null,

    /**
     * Optional definition for Glossary usage.
     */
    val definition: String? = null,

    /**
     * Link to a specific MediaItem (Book).
     * If null, applies globally to all books.
     */
    val bookId: Long? = null,

    /**
     * Language code (e.g., "en", "fr")
     */
    val language: String = "en",

    /**
     * Timestamp of creation
     */
    val dateAdded: Long = System.currentTimeMillis()
)
