package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration 48 -> 49:
 * Adds `remote_sync_mutations` table for enqueuing outbound sync progress/rating updates.
 */
val MIGRATION_48_49 = object : Migration(48, 49) {
    override fun migrate(db: SupportSQLiteDatabase) {
        db.execSQL(
            """
            CREATE TABLE IF NOT EXISTS `remote_sync_mutations` (
                `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                `serverType` TEXT NOT NULL,
                `serverId` INTEGER NOT NULL,
                `targetItemId` TEXT NOT NULL,
                `mutationType` TEXT NOT NULL,
                `payloadJson` TEXT NOT NULL,
                `retryCount` INTEGER NOT NULL,
                `status` TEXT NOT NULL,
                `createdAt` INTEGER NOT NULL,
                `lastAttemptAt` INTEGER
            )
            """.trimIndent()
        )
    }
}
