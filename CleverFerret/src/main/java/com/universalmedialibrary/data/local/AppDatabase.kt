package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.model.*
import com.universalmedialibrary.data.local.entity.*

// Temporarily disabled to resolve KSP build issues
/*
@Database(
    entities = [
        // Phase 2: Starting with minimal entities only for build fix
        com.universalmedialibrary.data.local.model.Library::class,
        com.universalmedialibrary.data.local.model.APIKey::class
    ],
    version = 6,
    exportSchema = false
)
*/
abstract class AppDatabase : RoomDatabase() {

    // Legacy DAOs for content creation - Temporarily disabled
    // abstract fun downloadedStoryDao(): DownloadedStoryDao
    // abstract fun storyUpdateDao(): StoryUpdateDao
    
    // Core DAOs - Minimized for build fix
    abstract fun libraryDao(): LibraryDao
    abstract fun apiKeyDao(): APIKeyDao
    
    // Temporarily disabled until build is fixed
    // abstract fun mediaItemDao(): MediaItemDao
    // abstract fun metadataDao(): MetadataDao
    // abstract fun bookmarkDao(): BookmarkDao
    
    // Additional DAOs - Temporarily disabled until entities are properly configured
    // abstract fun readerSettingsDao(): ReaderSettingsDao
    // abstract fun annotationDao(): AnnotationDao
    // abstract fun searchIndexDao(): SearchIndexDao
    // abstract fun readingStatisticsDao(): ReadingStatisticsDao
    
    // Plex DAOs - Temporarily disabled
    // abstract fun plexServerDao(): PlexServerDao
    // abstract fun plexMediaItemDao(): PlexMediaItemDao
    // abstract fun plexSyncDao(): PlexSyncDao
    
    // Playback queue DAOs - Temporarily disabled
    // abstract fun playbackQueueDao(): PlaybackQueueDao
    // abstract fun queueItemDao(): QueueItemDao
    // abstract fun playbackSessionDao(): PlaybackSessionDao

    companion object {
        const val DATABASE_NAME = "universal-media-library.db"
        
        val MIGRATION_1_2 = object : Migration(1, 2) {
            override fun migrate(database: SupportSQLiteDatabase) {
                // Add new columns to metadata_common table
                database.execSQL("ALTER TABLE metadata_common ADD COLUMN isFavorite INTEGER NOT NULL DEFAULT 0")
                database.execSQL("ALTER TABLE metadata_common ADD COLUMN isDownloaded INTEGER NOT NULL DEFAULT 1")
            }
        }
        
        val MIGRATION_2_3 = object : Migration(2, 3) {
            override fun migrate(database: SupportSQLiteDatabase) {
                // Create new metadata tables for additional media types
                database.execSQL("""
                    CREATE TABLE metadata_tv_show (
                        itemId INTEGER PRIMARY KEY,
                        seasonNumber INTEGER,
                        episodeNumber INTEGER,
                        seriesName TEXT,
                        network TEXT,
                        airDate TEXT,
                        episodeRuntime INTEGER,
                        tvRating TEXT,
                        tvdbId TEXT,
                        imdbId TEXT,
                        FOREIGN KEY (itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                    )
                """)
                
                database.execSQL("""
                    CREATE TABLE metadata_podcast (
                        itemId INTEGER PRIMARY KEY,
                        showName TEXT,
                        episodeNumber INTEGER,
                        seasonNumber INTEGER,
                        durationSeconds INTEGER,
                        publicationDate TEXT,
                        description TEXT,
                        transcriptPath TEXT,
                        rssUrl TEXT,
                        podcastGuid TEXT,
                        FOREIGN KEY (itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                    )
                """)
                
                database.execSQL("""
                    CREATE TABLE metadata_magazine (
                        itemId INTEGER PRIMARY KEY,
                        issueNumber TEXT,
                        volumeNumber TEXT,
                        publicationDate TEXT,
                        issn TEXT,
                        magazineTitle TEXT,
                        articleCount INTEGER,
                        coverStory TEXT,
                        editor TEXT,
                        FOREIGN KEY (itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                    )
                """)
                
                database.execSQL("""
                    CREATE TABLE metadata_document (
                        itemId INTEGER PRIMARY KEY,
                        documentType TEXT,
                        author TEXT,
                        creationDate TEXT,
                        modificationDate TEXT,
                        pageCount INTEGER,
                        wordCount INTEGER,
                        language TEXT,
                        format TEXT,
                        fileSize INTEGER,
                        FOREIGN KEY (itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                    )
                """)
                
                database.execSQL("""
                    CREATE TABLE metadata_academic_paper (
                        itemId INTEGER PRIMARY KEY,
                        journalName TEXT,
                        doi TEXT,
                        abstractText TEXT,
                        publicationYear INTEGER,
                        citationCount INTEGER,
                        keywords TEXT,
                        researchField TEXT,
                        peerReviewed INTEGER DEFAULT 0,
                        arxivId TEXT,
                        FOREIGN KEY (itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                    )
                """)
                
                // Update existing metadata_movie table with new fields
                database.execSQL("ALTER TABLE metadata_movie ADD COLUMN director TEXT")
                database.execSQL("ALTER TABLE metadata_movie ADD COLUMN rating TEXT")
                database.execSQL("ALTER TABLE metadata_movie ADD COLUMN releaseYear INTEGER")
                database.execSQL("ALTER TABLE metadata_movie ADD COLUMN productionCompany TEXT")
                database.execSQL("ALTER TABLE metadata_movie ADD COLUMN budget INTEGER")
                database.execSQL("ALTER TABLE metadata_movie ADD COLUMN boxOffice INTEGER")
                database.execSQL("ALTER TABLE metadata_movie ADD COLUMN imdbId TEXT")
                database.execSQL("ALTER TABLE metadata_movie ADD COLUMN tmdbId TEXT")
            }
        }
        val MIGRATION_3_4 = object : Migration(3, 4) {
            override fun migrate(database: SupportSQLiteDatabase) {
                // Create API keys table
                database.execSQL("""
                    CREATE TABLE api_keys (
                        id TEXT PRIMARY KEY NOT NULL,
                        keyName TEXT NOT NULL,
                        keyValue TEXT NOT NULL,
                        isActive INTEGER NOT NULL DEFAULT 1,
                        lastValidated INTEGER,
                        validationStatus TEXT,
                        provider TEXT NOT NULL,
                        category TEXT NOT NULL,
                        isRequired INTEGER NOT NULL DEFAULT 0,
                        createdAt INTEGER NOT NULL,
                        updatedAt INTEGER NOT NULL
                    )
                """)
                
                // Create unique index on provider
                database.execSQL("CREATE UNIQUE INDEX index_api_keys_provider ON api_keys(provider)")
            }
        }
        
        val MIGRATION_4_5 = object : Migration(4, 5) {
            override fun migrate(database: SupportSQLiteDatabase) {
                // Create bookmarks table
                database.execSQL("""
                    CREATE TABLE bookmarks (
                        bookmarkId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                        mediaItemId INTEGER NOT NULL,
                        position TEXT NOT NULL,
                        timestamp INTEGER NOT NULL,
                        note TEXT,
                        type TEXT NOT NULL,
                        FOREIGN KEY (mediaItemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                    )
                """)
                database.execSQL("CREATE INDEX index_bookmarks_mediaItemId ON bookmarks(mediaItemId)")
                
                // Create reading progress table
                database.execSQL("""
                    CREATE TABLE reading_progress (
                        mediaItemId INTEGER PRIMARY KEY NOT NULL,
                        currentPosition TEXT NOT NULL,
                        totalPages INTEGER NOT NULL DEFAULT 0,
                        pagesRead INTEGER NOT NULL DEFAULT 0,
                        percentComplete REAL NOT NULL DEFAULT 0,
                        lastReadTimestamp INTEGER NOT NULL,
                        totalReadingTime INTEGER NOT NULL DEFAULT 0,
                        readingSessions INTEGER NOT NULL DEFAULT 0,
                        FOREIGN KEY (mediaItemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                    )
                """)
                database.execSQL("CREATE UNIQUE INDEX index_reading_progress_mediaItemId ON reading_progress(mediaItemId)")
                
                // Create reading sessions table
                database.execSQL("""
                    CREATE TABLE reading_sessions (
                        sessionId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                        mediaItemId INTEGER NOT NULL,
                        startTime INTEGER NOT NULL,
                        endTime INTEGER,
                        pagesRead INTEGER NOT NULL DEFAULT 0,
                        startPosition TEXT NOT NULL,
                        endPosition TEXT,
                        FOREIGN KEY (mediaItemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                    )
                """)
                database.execSQL("CREATE INDEX index_reading_sessions_mediaItemId ON reading_sessions(mediaItemId)")
            }
        }

        val MIGRATION_5_6 = object : Migration(5, 6) {
            override fun migrate(database: SupportSQLiteDatabase) {
                // Add dateModified column to libraries table
                database.execSQL("ALTER TABLE libraries ADD COLUMN dateModified INTEGER NOT NULL DEFAULT ${System.currentTimeMillis()}")
                
                // Add lastAccessed and playCount columns to media_items table  
                database.execSQL("ALTER TABLE media_items ADD COLUMN lastAccessed INTEGER NOT NULL DEFAULT ${System.currentTimeMillis()}")
                database.execSQL("ALTER TABLE media_items ADD COLUMN playCount INTEGER NOT NULL DEFAULT 0")
            }
        }
    }
}
