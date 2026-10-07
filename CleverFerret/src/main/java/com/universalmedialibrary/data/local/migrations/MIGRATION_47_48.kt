package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from database version 47 to 48.
 * Removes plain-text password column from opds_catalogs table in favor of OPDSCredentialVault.
 */
val MIGRATION_47_48: Migration = object : Migration(47, 48) {
    override fun migrate(database: SupportSQLiteDatabase) {
        try {
            database.execSQL("ALTER TABLE opds_catalogs DROP COLUMN password")
        } catch (e: Exception) {
            // Fallback for older SQLite engines where DROP COLUMN isn't supported
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS opds_catalogs_new (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    url TEXT NOT NULL,
                    username TEXT,
                    description TEXT,
                    iconUrl TEXT,
                    isDefault INTEGER NOT NULL,
                    isEnabled INTEGER NOT NULL,
                    lastAccessedAt INTEGER NOT NULL,
                    accessCount INTEGER NOT NULL,
                    opdsVersion TEXT NOT NULL,
                    searchUrl TEXT,
                    createdAt INTEGER NOT NULL,
                    updatedAt INTEGER NOT NULL
                )
            """.trimIndent())
            database.execSQL("""
                INSERT INTO opds_catalogs_new (
                    id, name, url, username, description, iconUrl, isDefault, isEnabled,
                    lastAccessedAt, accessCount, opdsVersion, searchUrl, createdAt, updatedAt
                )
                SELECT
                    id, name, url, username, description, iconUrl, isDefault, isEnabled,
                    lastAccessedAt, accessCount, opdsVersion, searchUrl, createdAt, updatedAt
                FROM opds_catalogs
            """.trimIndent())
            database.execSQL("DROP TABLE opds_catalogs")
            database.execSQL("ALTER TABLE opds_catalogs_new RENAME TO opds_catalogs")
        }
    }
}
