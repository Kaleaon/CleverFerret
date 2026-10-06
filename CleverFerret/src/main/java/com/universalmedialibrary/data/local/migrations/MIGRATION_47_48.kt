package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 47 to 48
 * Adds localCachePath, downloadStatus, and downloadProgress columns to media_items.
 */
val MIGRATION_47_48: Migration = object : Migration(47, 48) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL("ALTER TABLE media_items ADD COLUMN localCachePath TEXT DEFAULT NULL")
        database.execSQL("ALTER TABLE media_items ADD COLUMN downloadStatus TEXT NOT NULL DEFAULT 'NOT_DOWNLOADED'")
        database.execSQL("ALTER TABLE media_items ADD COLUMN downloadProgress REAL NOT NULL DEFAULT 0.0")
    }
}
