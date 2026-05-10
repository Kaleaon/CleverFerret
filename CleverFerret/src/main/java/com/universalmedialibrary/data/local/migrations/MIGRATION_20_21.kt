package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 20 to 21
 * No-op: version bump only, no schema changes.
 */
internal val MIGRATION_20_21: Migration = object : Migration(20, 21) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // No schema changes — version bump only
    }
}

