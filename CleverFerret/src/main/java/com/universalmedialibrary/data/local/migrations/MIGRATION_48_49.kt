package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from database version 48 to 49.
 * Adds custom_fonts table for imported custom TTF/OTF font registry
 * and remote_sync_mutations table for enqueuing outbound sync progress/rating updates.
 */
val MIGRATION_48_49: Migration = object : Migration(48, 49) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL(
            """
            CREATE TABLE IF NOT EXISTS `custom_fonts` (
                `id` TEXT NOT NULL,
                `displayName` TEXT NOT NULL,
                `filePath` TEXT NOT NULL,
                `importedAt` INTEGER NOT NULL,
                PRIMARY KEY(`id`)
            )
            """.trimIndent()
        )

        database.execSQL(
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
