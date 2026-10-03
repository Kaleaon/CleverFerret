package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 24 to 25
 * Adds Comic Translation Cache table for Gemini AI translations
 */
internal val MIGRATION_24_25: Migration = object : Migration(24, 25) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create comic_translation_cache table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS comic_translation_cache (
                pageId TEXT PRIMARY KEY NOT NULL,
                comicId TEXT NOT NULL,
                pageNumber INTEGER NOT NULL,
                translationData TEXT NOT NULL,
                targetLanguage TEXT NOT NULL,
                cachedAt INTEGER NOT NULL
            )
        """.trimIndent())
        
        // Create index for faster queries by comicId
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_comic_translation_cache_comicId 
            ON comic_translation_cache (comicId)
        """.trimIndent())
    }
}

