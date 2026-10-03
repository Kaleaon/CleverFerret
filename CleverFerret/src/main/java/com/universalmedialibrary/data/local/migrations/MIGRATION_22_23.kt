package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 22 to 23
 * Adds comic panel detection and translation tables
 */
internal val MIGRATION_22_23: Migration = object : Migration(22, 23) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create comic_panels table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS comic_panels (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                comicId TEXT NOT NULL,
                pageNumber INTEGER NOT NULL,
                panelIndex INTEGER NOT NULL,
                x REAL NOT NULL,
                y REAL NOT NULL,
                width REAL NOT NULL,
                height REAL NOT NULL,
                confidence REAL NOT NULL,
                detectionMethod TEXT NOT NULL,
                createdAt INTEGER NOT NULL
            )
        """.trimIndent())
        
        // Create unique index
        database.execSQL("""
            CREATE UNIQUE INDEX IF NOT EXISTS index_comic_panels_comicId_pageNumber_panelIndex 
            ON comic_panels (comicId, pageNumber, panelIndex)
        """.trimIndent())
        
        // Create comic_translations table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS comic_translations (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                panelId INTEGER NOT NULL,
                originalText TEXT NOT NULL,
                translatedText TEXT NOT NULL,
                sourceLanguage TEXT NOT NULL,
                targetLanguage TEXT NOT NULL,
                bubbleX REAL NOT NULL,
                bubbleY REAL NOT NULL,
                bubbleWidth REAL NOT NULL,
                bubbleHeight REAL NOT NULL,
                confidence REAL NOT NULL,
                createdAt INTEGER NOT NULL,
                FOREIGN KEY(panelId) REFERENCES comic_panels(id) ON DELETE CASCADE
            )
        """.trimIndent())
        
        // Create comic_reading_sessions table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS comic_reading_sessions (
                comicId TEXT PRIMARY KEY NOT NULL,
                currentPage INTEGER NOT NULL,
                currentPanel INTEGER NOT NULL,
                totalPages INTEGER NOT NULL,
                readingMode TEXT NOT NULL,
                translationEnabled INTEGER NOT NULL,
                targetLanguage TEXT NOT NULL,
                lastReadAt INTEGER NOT NULL,
                createdAt INTEGER NOT NULL
            )
        """.trimIndent())
    }
}

