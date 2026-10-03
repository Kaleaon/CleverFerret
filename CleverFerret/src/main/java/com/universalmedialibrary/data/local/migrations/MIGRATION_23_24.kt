package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 23 to 24
 * Adds OPDS catalog support
 */
internal val MIGRATION_23_24: Migration = object : Migration(23, 24) {
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

