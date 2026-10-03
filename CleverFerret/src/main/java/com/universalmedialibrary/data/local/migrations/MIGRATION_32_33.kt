package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_32_33: Migration = object : Migration(32, 33) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Add OCR cache table (from main branch)
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS ocr_cache (
                id TEXT PRIMARY KEY NOT NULL,
                mediaItemId TEXT NOT NULL,
                pageNumber INTEGER NOT NULL DEFAULT 0,
                text TEXT NOT NULL,
                blocksJson TEXT NOT NULL,
                confidence REAL NOT NULL DEFAULT 0.0,
                timestamp INTEGER NOT NULL,
                language TEXT NOT NULL DEFAULT 'en'
            )
        """.trimIndent())
        
        // Create indices for better query performance
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_ocr_cache_mediaItemId 
            ON ocr_cache(mediaItemId)
        """.trimIndent())
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_ocr_cache_mediaItemId_pageNumber 
            ON ocr_cache(mediaItemId, pageNumber)
        """.trimIndent())
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_ocr_cache_timestamp 
            ON ocr_cache(timestamp)
        """.trimIndent())
    }
}

