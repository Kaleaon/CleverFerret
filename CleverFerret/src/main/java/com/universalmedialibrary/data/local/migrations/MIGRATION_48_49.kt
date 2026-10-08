package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from database version 48 to 49.
 * Adds index on lastModified column in media_items table to optimize background sync queries.
 */
val MIGRATION_48_49: Migration = object : Migration(48, 49) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL("CREATE INDEX IF NOT EXISTS index_media_items_lastModified ON media_items(lastModified)")
    }
}
