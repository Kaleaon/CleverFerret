package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration 48 -> 49:
 * - Adds index on lastModified column in media_items table to optimize background sync queries.
 * - Adds `remote_sync_mutations` table for enqueuing outbound sync progress/rating updates.
 * - Adds `crdt_operation_journal` table and indexes for operation-based delta CRDT syncing.
 */
val MIGRATION_48_49: Migration = object : Migration(48, 49) {
    override fun migrate(db: SupportSQLiteDatabase) {
        db.execSQL("CREATE INDEX IF NOT EXISTS index_media_items_lastModified ON media_items(lastModified)")
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
        db.execSQL(
            """
            CREATE TABLE IF NOT EXISTS `crdt_operation_journal` (
                `operationId` TEXT NOT NULL,
                `entityId` TEXT NOT NULL,
                `entityType` TEXT NOT NULL,
                `fieldPath` TEXT NOT NULL,
                `operationType` TEXT NOT NULL,
                `valueJson` TEXT,
                `elementId` TEXT,
                `deviceId` TEXT NOT NULL,
                `lamportTimestamp` INTEGER NOT NULL,
                `wallTimestamp` INTEGER NOT NULL,
                `isSynced` INTEGER NOT NULL,
                `isCompacted` INTEGER NOT NULL,
                PRIMARY KEY(`operationId`)
            )
            """.trimIndent()
        )
        db.execSQL(
            "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_entityId_fieldPath` " +
                "ON `crdt_operation_journal` (`entityId`, `fieldPath`)"
        )
        db.execSQL(
            "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_lamportTimestamp` " +
                "ON `crdt_operation_journal` (`lamportTimestamp`)"
        )
        db.execSQL(
            "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_isSynced` " +
                "ON `crdt_operation_journal` (`isSynced`)"
        )
        db.execSQL(
            "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_isCompacted` " +
                "ON `crdt_operation_journal` (`isCompacted`)"
        )
    }
}
