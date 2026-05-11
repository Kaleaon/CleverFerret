package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 30 to 31
 * Adds ambient sound feature tables
 */
internal val MIGRATION_30_31: Migration = object : Migration(30, 31) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create ambient_sounds table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS ambient_sounds (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                name TEXT NOT NULL,
                category TEXT NOT NULL,
                soundType TEXT NOT NULL,
                audioResourcePath TEXT,
                audioUrl TEXT,
                iconType TEXT NOT NULL DEFAULT 'nature',
                description TEXT NOT NULL DEFAULT '',
                keywords TEXT NOT NULL,
                volume REAL NOT NULL DEFAULT 0.5,
                isEnabled INTEGER NOT NULL DEFAULT 1,
                isFavorite INTEGER NOT NULL DEFAULT 0,
                createdAt INTEGER NOT NULL,
                updatedAt INTEGER NOT NULL
            )
        """.trimIndent())
        
        // Create ambient_playlists table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS ambient_playlists (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                name TEXT NOT NULL,
                description TEXT NOT NULL DEFAULT '',
                soundIds TEXT NOT NULL,
                autoSwitch INTEGER NOT NULL DEFAULT 0,
                isActive INTEGER NOT NULL DEFAULT 0,
                createdAt INTEGER NOT NULL,
                updatedAt INTEGER NOT NULL
            )
        """.trimIndent())
        
        // Create ambient_reading_sessions table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS ambient_reading_sessions (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                mediaItemId INTEGER NOT NULL,
                playlistId INTEGER,
                activeSoundIds TEXT NOT NULL,
                startTime INTEGER NOT NULL,
                endTime INTEGER,
                detectedContext TEXT,
                manualOverride INTEGER NOT NULL DEFAULT 0
            )
        """.trimIndent())
    }
}

