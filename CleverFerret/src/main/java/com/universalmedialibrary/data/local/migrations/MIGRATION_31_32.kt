package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 31 to 32
 * Adds audio pack import feature tables
 */
internal val MIGRATION_31_32: Migration = object : Migration(31, 32) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create audio_packs table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audio_packs (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                name TEXT NOT NULL,
                description TEXT NOT NULL DEFAULT '',
                sourceZipPath TEXT NOT NULL,
                extractedPath TEXT NOT NULL,
                soundCount INTEGER NOT NULL DEFAULT 0,
                totalSizeMB INTEGER NOT NULL DEFAULT 0,
                importedAt INTEGER NOT NULL,
                isEnabled INTEGER NOT NULL DEFAULT 1,
                metadata TEXT NOT NULL
            )
        """.trimIndent())
        
        // Create audio_pack_sounds linking table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audio_pack_sounds (
                packId INTEGER NOT NULL,
                soundId INTEGER NOT NULL,
                PRIMARY KEY (packId, soundId)
            )
        """.trimIndent())
    }
}

