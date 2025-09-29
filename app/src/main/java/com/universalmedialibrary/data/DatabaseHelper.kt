package com.universalmedialibrary.data

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

/**
 * Manages the creation and version management of the application's SQLite database.
 *
 * This class is responsible for creating the database schema when the application is first installed
 * and for upgrading the schema when the database version number is increased.
 *
 * @param context The context to use for locating paths to the database.
 */
class DatabaseHelper(
    context: Context,
) : SQLiteOpenHelper(context, DATABASE_NAME, null, DATABASE_VERSION) {
    companion object {
        /** The name of the database file. */
        const val DATABASE_NAME = "universalmedialibrary.db"
        /** The current version of the database schema. */
        const val DATABASE_VERSION = 1
    }

    /**
     * Called when the database is created for the first time.
     * This is where the creation of tables and the initial population of the tables should happen.
     *
     * @param db The database.
     */
    override fun onCreate(db: SQLiteDatabase?) {
        db?.execSQL(DatabaseSchema.SQL_CREATE_MEDIA_ITEMS)
        db?.execSQL(DatabaseSchema.SQL_CREATE_BOOKS)
        db?.execSQL(DatabaseSchema.SQL_CREATE_AUTHORS)
        db?.execSQL(DatabaseSchema.SQL_CREATE_TAGS)
        db?.execSQL(DatabaseSchema.SQL_CREATE_MEDIA_ITEM_AUTHOR_JOIN)
        db?.execSQL(DatabaseSchema.SQL_CREATE_MEDIA_ITEM_TAG_JOIN)
    }

    /**
     * Called when the database needs to be upgraded.
     * The implementation here should drop all tables and recreate them.
     *
     * Note: This is a simple implementation for development purposes and will destroy all user data.
     * A proper migration strategy should be implemented for a production application.
     *
     * @param db The database.
     * @param oldVersion The old database version.
     * @param newVersion The new database version.
     */
    override fun onUpgrade(
        db: SQLiteDatabase?,
        oldVersion: Int,
        newVersion: Int,
    ) {
        // For now, we'll just drop and recreate the database on upgrade.
        // A real migration strategy would be needed for a production app.
        db?.execSQL("DROP TABLE IF EXISTS media_item_tag_join")
        db?.execSQL("DROP TABLE IF EXISTS media_item_author_join")
        db?.execSQL("DROP TABLE IF EXISTS tags")
        db?.execSQL("DROP TABLE IF EXISTS authors")
        db?.execSQL("DROP TABLE IF EXISTS books")
        db?.execSQL("DROP TABLE IF EXISTS media_items")
        onCreate(db)
    }
}
