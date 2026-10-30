package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration 48 -> 49:
 * - Adds index on lastModified column in media_items table to optimize background sync queries.
 * - Adds `remote_sync_mutations` table for enqueuing outbound sync progress/rating updates.
 * - Adds multi-column composite indices for collaborative session queries.
 */
val MIGRATION_48_49: Migration = object : Migration(48, 49) {
    override fun migrate(db: SupportSQLiteDatabase) {
        db.execSQL("CREATE INDEX IF NOT EXISTS index_media_items_lastModified ON media_items(lastModified)")
        createRemoteSyncMutationsTable(db)
        createSessionIndices(db)
        createQueueAndVoteIndices(db)
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
