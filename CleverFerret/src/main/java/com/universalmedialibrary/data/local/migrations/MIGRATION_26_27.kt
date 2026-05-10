package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 26 to 27
 * Adds YAACC (DLNA/UPnP) server support
 */
internal val MIGRATION_26_27: Migration = object : Migration(26, 27) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create yaacc_servers table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS yaacc_servers (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                name TEXT NOT NULL,
                host TEXT NOT NULL,
                port INTEGER NOT NULL DEFAULT 8200,
                deviceType TEXT,
                friendlyName TEXT,
                manufacturer TEXT,
                modelName TEXT,
                udn TEXT,
                lastSynced INTEGER NOT NULL DEFAULT 0,
                isActive INTEGER NOT NULL DEFAULT 1,
                dateAdded INTEGER NOT NULL
            )
        """.trimIndent())
        
        // Create unique index for host and port combination
        database.execSQL("""
            CREATE UNIQUE INDEX IF NOT EXISTS index_yaacc_servers_host_port 
            ON yaacc_servers (host, port)
        """.trimIndent())
    }
}

