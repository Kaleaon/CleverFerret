package com.universalmedialibrary.data.local

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Database migrations for AppDatabase
 * 
 * CRITICAL: Always add migrations when incrementing database version
 * to prevent data loss on app upgrades.
 */
object AppDatabaseMigrations {
    
    /**
     * Migration from version 20 to 21
     */
    val MIGRATION_20_21 = object : Migration(20, 21) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Add any schema changes for version 21
        }
    }
    
    /**
     * Migration from version 21 to 22
     */
    val MIGRATION_21_22 = object : Migration(21, 22) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Add any schema changes for version 22
        }
    }
    
    /**
     * Migration from version 22 to 23
     * Adds comic panel detection and translation tables
     */
    val MIGRATION_22_23 = object : Migration(22, 23) {
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
    
    /**
     * Migration from version 23 to 24
     * Adds OPDS catalog support
     */
    val MIGRATION_23_24 = object : Migration(23, 24) {
        /**
         * Adds OPDS-related tables to the database schema for this migration.
         *
         * Creates `opds_catalogs` (catalog metadata and access info) and `opds_downloads` (download records linked to catalogs)
         * with the columns and constraints required for OPDS catalogs, including a foreign key from `opds_downloads.catalogId`
         * to `opds_catalogs.id` with ON DELETE CASCADE.
         *
         * @param database The SupportSQLiteDatabase to which the migration SQL statements are applied.
         */
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create opds_catalogs table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS opds_catalogs (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    url TEXT NOT NULL,
                    username TEXT,
                    password TEXT,
                    description TEXT,
                    iconUrl TEXT,
                    isDefault INTEGER NOT NULL,
                    isEnabled INTEGER NOT NULL,
                    lastAccessedAt INTEGER NOT NULL,
                    accessCount INTEGER NOT NULL,
                    opdsVersion TEXT NOT NULL,
                    searchUrl TEXT,
                    createdAt INTEGER NOT NULL,
                    updatedAt INTEGER NOT NULL
                )
            """.trimIndent())
            
            // Create opds_downloads table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS opds_downloads (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    catalogId INTEGER NOT NULL,
                    title TEXT NOT NULL,
                    authors TEXT NOT NULL,
                    downloadUrl TEXT NOT NULL,
                    localPath TEXT,
                    status TEXT NOT NULL,
                    progress INTEGER NOT NULL,
                    fileSize INTEGER NOT NULL,
                    downloadedBytes INTEGER NOT NULL,
                    mimeType TEXT,
                    coverUrl TEXT,
                    identifier TEXT,
                    publisher TEXT,
                    publishedDate TEXT,
                    language TEXT,
                    description TEXT,
                    createdAt INTEGER NOT NULL,
                    startedAt INTEGER,
                    completedAt INTEGER,
                    errorMessage TEXT,
                    FOREIGN KEY(catalogId) REFERENCES opds_catalogs(id) ON DELETE CASCADE
                )
            """.trimIndent())
        }
    }
    
    /**
     * Migration from version 24 to 25
     * Adds Comic Translation Cache table for Gemini AI translations
     */
    val MIGRATION_24_25 = object : Migration(24, 25) {
        /**
         * Adds the `comic_translation_cache` table and an index on `comicId` as part of the migration.
         *
         * Creates the `comic_translation_cache` table with primary key `pageId` and columns `comicId`, `pageNumber`,
         * `translationData`, `targetLanguage`, and `cachedAt`, and creates the `index_comic_translation_cache_comicId`
         * index on `comicId` to optimize lookups.
         */
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
}