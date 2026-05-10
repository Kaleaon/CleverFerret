package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_28_29: Migration = object : Migration(28, 29) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Migration 28 to 29 - Add search history support
        // This was already applied but migration object was missing
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS search_history (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                query TEXT NOT NULL,
                timestamp INTEGER NOT NULL
            )
        """.trimIndent())
        
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS saved_searches (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                name TEXT NOT NULL,
                query TEXT NOT NULL,
                created_at INTEGER NOT NULL
            )
        """.trimIndent())
    }
}

