package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 45 to 46
 * Adds explicit indices on foreign key column (itemId) for metadata tables.
 */
val MIGRATION_45_46: Migration = object : Migration(45, 46) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL("CREATE INDEX IF NOT EXISTS index_metadata_common_itemId ON metadata_common(itemId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_metadata_book_itemId ON metadata_book(itemId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_metadata_movie_itemId ON metadata_movie(itemId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_metadata_music_track_itemId ON metadata_music_track(itemId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_extended_metadata_itemId ON extended_metadata(itemId)")
    }
}
