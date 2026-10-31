package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration 48 -> 49:
 * 1. Introduces central `external_media_entities` mapping table and updates `media_fts` triggers
 *    to index unified entities directly without artificial row ID offsets.
 * 2. Adds index on lastModified column in media_items table to optimize background sync queries.
 * 3. Adds `remote_sync_mutations` table for enqueuing outbound sync progress/rating updates.
 * 4. Adds multi-column composite indices for collaborative session queries.
 * 5. Adds `crdt_operation_journal` table and indexes for operation-based delta CRDT syncing.
 */
val MIGRATION_48_49: Migration = object : Migration(48, 49) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL("CREATE INDEX IF NOT EXISTS index_media_items_lastModified ON media_items(lastModified)")

        // 1. Create central external_media_entities table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS `external_media_entities` (
                `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                `providerId` TEXT NOT NULL,
                `externalId` TEXT NOT NULL,
                `mediaItemId` INTEGER,
                `title` TEXT NOT NULL,
                `creator` TEXT,
                `series` TEXT,
                `mediaType` TEXT NOT NULL,
                `uri` TEXT,
                `coverUrl` TEXT,
                `summary` TEXT,
                `tags` TEXT,
                `progress` REAL NOT NULL DEFAULT 0.0,
                `lastSyncedAt` INTEGER NOT NULL DEFAULT 0,
                `extraMetadata` TEXT
            );
        """.trimIndent())

        database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS `index_external_media_entities_providerId_externalId` ON `external_media_entities` (`providerId`, `externalId`)")
        database.execSQL("CREATE INDEX IF NOT EXISTS `index_external_media_entities_mediaItemId` ON `external_media_entities` (`mediaItemId`)")
        database.execSQL("CREATE INDEX IF NOT EXISTS `index_external_media_entities_providerId` ON `external_media_entities` (`providerId`)")

        // 2. Migrate existing plex_media_items data into external_media_entities
        try {
            database.execSQL("""
                INSERT INTO external_media_entities (providerId, externalId, mediaItemId, title, creator, mediaType, summary, tags, lastSyncedAt)
                SELECT 'plex', plexRatingKey, localMediaItemId, title, libraryName, type, libraryName, 'plex', lastSynced
                FROM plex_media_items
            """.trimIndent())
        } catch (e: Exception) {
            // Ignore if table or rows are missing
        }

        // 3. Clean up legacy triggers and PLEX FTS entries
        database.execSQL("DROP TRIGGER IF EXISTS plex_media_items_ai")
        database.execSQL("DROP TRIGGER IF EXISTS plex_media_items_ad")
        database.execSQL("DELETE FROM media_fts WHERE item_source = 'PLEX'")

        // 4. Re-populate media_fts from external_media_entities without artificial offsets
        database.execSQL("""
            INSERT INTO media_fts(rowid, title, creator, series, tags, summary, media_type, item_id, item_source)
            SELECT
                eme.id AS rowid,
                eme.title AS title,
                eme.creator AS creator,
                eme.series AS series,
                eme.tags AS tags,
                eme.summary AS summary,
                eme.mediaType AS media_type,
                eme.id AS item_id,
                UPPER(eme.providerId) AS item_source
            FROM external_media_entities eme
        """.trimIndent())

        // 5. Create triggers on external_media_entities
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS external_media_entities_ai AFTER INSERT ON external_media_entities
            BEGIN
                INSERT INTO media_fts(rowid, title, creator, series, tags, summary, media_type, item_id, item_source)
                VALUES (
                    NEW.id,
                    NEW.title,
                    NEW.creator,
                    NEW.series,
                    NEW.tags,
                    NEW.summary,
                    NEW.mediaType,
                    NEW.id,
                    UPPER(NEW.providerId)
                );
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS external_media_entities_au AFTER UPDATE ON external_media_entities
            BEGIN
                UPDATE media_fts
                SET title = NEW.title,
                    creator = NEW.creator,
                    series = NEW.series,
                    tags = NEW.tags,
                    summary = NEW.summary,
                    media_type = NEW.mediaType
                WHERE rowid = NEW.id AND item_source = UPPER(NEW.providerId);
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS external_media_entities_ad AFTER DELETE ON external_media_entities
            BEGIN
                DELETE FROM media_fts WHERE rowid = OLD.id AND item_source = UPPER(OLD.providerId);
            END;
        """.trimIndent())

        // 6. Create remote_sync_mutations table
        createRemoteSyncMutationsTable(database)

        // 7. Create collaborative session and queue composite indices
        createSessionIndices(database)
        createQueueAndVoteIndices(database)

        // 8. Create crdt_operation_journal table and indices
        createCrdtOperationJournalTable(database)
    }
}

private fun createRemoteSyncMutationsTable(database: SupportSQLiteDatabase) {
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

private fun createSessionIndices(database: SupportSQLiteDatabase) {
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_collaborative_sessions_status_createdAt
        ON collaborative_sessions(status, createdAt)
        """.trimIndent()
    )
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_collaborative_sessions_hostDeviceId_createdAt
        ON collaborative_sessions(hostDeviceId, createdAt)
        """.trimIndent()
    )
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_session_clients_sessionId_isConnected
        ON session_clients(sessionId, isConnected)
        """.trimIndent()
    )
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_session_clients_sessionId_lastActiveAt
        ON session_clients(sessionId, lastActiveAt)
        """.trimIndent()
    )
}

private fun createQueueAndVoteIndices(database: SupportSQLiteDatabase) {
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_session_queue_items_sessionId_status_position
        ON session_queue_items(sessionId, status, position)
        """.trimIndent()
    )
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_session_queue_items_sessionId_position
        ON session_queue_items(sessionId, position)
        """.trimIndent()
    )
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_session_queue_items_sessionId_status_votes_addedAt
        ON session_queue_items(sessionId, status, votes, addedAt)
        """.trimIndent()
    )
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_session_queue_items_sessionId_addedBy
        ON session_queue_items(sessionId, addedBy)
        """.trimIndent()
    )
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_session_votes_sessionId_queueItemId_voteType
        ON session_votes(sessionId, queueItemId, voteType)
        """.trimIndent()
    )
    database.execSQL(
        """
        CREATE INDEX IF NOT EXISTS index_session_votes_clientId_queueItemId
        ON session_votes(clientId, queueItemId)
        """.trimIndent()
    )
}

private fun createCrdtOperationJournalTable(database: SupportSQLiteDatabase) {
    database.execSQL(
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
    database.execSQL(
        "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_entityId_fieldPath` " +
            "ON `crdt_operation_journal` (`entityId`, `fieldPath`)"
    )
    database.execSQL(
        "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_lamportTimestamp` " +
            "ON `crdt_operation_journal` (`lamportTimestamp`)"
    )
    database.execSQL(
        "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_isSynced` " +
            "ON `crdt_operation_journal` (`isSynced`)"
    )
    database.execSQL(
        "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_isCompacted` " +
            "ON `crdt_operation_journal` (`isCompacted`)"
    )
}
