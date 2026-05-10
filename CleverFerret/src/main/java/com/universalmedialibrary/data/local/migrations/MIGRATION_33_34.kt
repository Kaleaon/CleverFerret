package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_33_34: Migration = object : Migration(33, 34) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create collaborative_sessions table for playlist sharing
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS collaborative_sessions (
                sessionId TEXT PRIMARY KEY NOT NULL,
                name TEXT NOT NULL,
                playlistId INTEGER NOT NULL,
                hostDeviceId TEXT NOT NULL,
                hostDeviceName TEXT NOT NULL,
                sessionType TEXT NOT NULL,
                status TEXT NOT NULL,
                createdAt INTEGER NOT NULL,
                startedAt INTEGER,
                endedAt INTEGER,
                maxClients INTEGER NOT NULL DEFAULT 10,
                allowClientAdditions INTEGER NOT NULL DEFAULT 1,
                allowClientVoting INTEGER NOT NULL DEFAULT 1,
                requiresApproval INTEGER NOT NULL DEFAULT 0,
                qrCodeData TEXT,
                connectionPort INTEGER NOT NULL DEFAULT 8080,
                castSessionId TEXT,
                currentTrackIndex INTEGER NOT NULL DEFAULT 0,
                isPlaying INTEGER NOT NULL DEFAULT 0
            )
        """.trimIndent())

        // Create session_clients table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS session_clients (
                clientId TEXT PRIMARY KEY NOT NULL,
                sessionId TEXT NOT NULL,
                deviceName TEXT NOT NULL,
                deviceType TEXT NOT NULL,
                joinedAt INTEGER NOT NULL,
                lastActiveAt INTEGER NOT NULL,
                permissions TEXT NOT NULL,
                isConnected INTEGER NOT NULL DEFAULT 1,
                contributedTracks INTEGER NOT NULL DEFAULT 0,
                votesUsed INTEGER NOT NULL DEFAULT 0,
                FOREIGN KEY(sessionId) REFERENCES collaborative_sessions(sessionId) ON DELETE CASCADE
            )
        """.trimIndent())

        // Create session_queue_items table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS session_queue_items (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                sessionId TEXT NOT NULL,
                mediaItemId INTEGER NOT NULL,
                addedBy TEXT NOT NULL,
                position INTEGER NOT NULL,
                votes INTEGER NOT NULL DEFAULT 0,
                addedAt INTEGER NOT NULL,
                playedAt INTEGER,
                status TEXT NOT NULL,
                approvedBy TEXT,
                FOREIGN KEY(sessionId) REFERENCES collaborative_sessions(sessionId) ON DELETE CASCADE
            )
        """.trimIndent())

        // Create session_votes table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS session_votes (
                sessionId TEXT NOT NULL,
                clientId TEXT NOT NULL,
                queueItemId INTEGER NOT NULL,
                voteType TEXT NOT NULL,
                timestamp INTEGER NOT NULL,
                PRIMARY KEY(sessionId, clientId, queueItemId),
                FOREIGN KEY(sessionId) REFERENCES collaborative_sessions(sessionId) ON DELETE CASCADE
            )
        """.trimIndent())

        // Create indices for better query performance
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_session_clients_sessionId 
            ON session_clients(sessionId)
        """.trimIndent())

        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_session_queue_items_sessionId 
            ON session_queue_items(sessionId)
        """.trimIndent())

        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_session_votes_sessionId 
            ON session_votes(sessionId)
        """.trimIndent())
    }
}

