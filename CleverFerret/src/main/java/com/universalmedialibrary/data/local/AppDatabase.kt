package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.*

/**
 * CleverFerret Universal Media Library Database
 *
 * This is the main Room database class that defines the complete schema for the CleverFerret
 * universal media library system. It supports multiple media types with specialized metadata
 * storage, user progress tracking, and comprehensive library management.
 *
 * ## Database Architecture:
 * - **Entity Relationships**: Well-designed foreign key constraints for data integrity.
 * - **Migration Strategy**: Comprehensive migration system for schema evolution.
 * - **Query Optimization**: Indexed columns for fast search and filtering.
 * - **Data Integrity**: Cascade delete operations and referential integrity.
 *
 * ## Supported Media Types:
 * Each media type has specialized metadata tables:
 * - **Books**: ISBN, page count, reading progress, bookmarks.
 * - **Movies**: IMDB/TMDB IDs, director, cast, ratings, runtime.
 * - **Music**: Album info, artist, genre, bitrate, lyrics.
 * - **TV Shows**: Season/episode info, network, air dates, series data.
 * - **Podcasts**: RSS feeds, episode info, transcripts, show metadata.
 * - **Magazines**: Issue numbers, publication dates, ISSN, articles.
 * - **Documents**: Page count, word count, document type, creation dates.
 * - **Academic Papers**: DOI, journal info, citations, research fields.
 *
 * @property libraryDao Access to library CRUD operations and queries.
 * @property mediaItemDao Access to media item management and search.
 * @property metadataDao Access to specialized metadata for all media types.
 * @property apiKeyDao Access to API key management for external services.
 * @property bookmarkDao Access to bookmark and reading progress features.
 *
 * @see LibraryDao for library management operations.
 * @see MediaItemDao for media item CRUD and search.
 * @see MetadataDao for metadata extraction and storage.
 * @see APIKeyDao for external service integration.
 * @see BookmarkDao for reading progress and bookmarks.
 */
@Database(
    entities = [
        Library::class,
        MediaItem::class,
        MetadataCommon::class,
        MetadataBook::class,
        MetadataMovie::class,
        MetadataTvShow::class,
        Album::class,
        MetadataMusicTrack::class,
        MetadataPodcast::class,
        MetadataMagazine::class,
        MetadataDocument::class,
        MetadataAcademicPaper::class,
        Genre::class,
        ItemGenre::class,
        People::class,
        ItemPersonRole::class,
        Series::class,
        APIKey::class,
        Bookmark::class,
        ReadingProgress::class,
        ReadingSession::class
    ],
    version = 6,
    exportSchema = false // For now, we can disable schema exporting
)
abstract class AppDatabase : RoomDatabase() {

    /**
     * Provides access to the Library Data Access Object.
     *
     * Handles all library-related database operations including creation,
     * deletion, updates, and queries. Libraries are the top-level organization
     * structure for media items.
     *
     * @return An instance of [LibraryDao] for library operations.
     */
    abstract fun libraryDao(): LibraryDao

    /**
     * Provides access to the Media Item Data Access Object.
     *
     * Manages the core media item entities that represent individual files
     * in the user's collection. Handles file metadata, paths, and basic
     * information common to all media types.
     *
     * @return An instance of [MediaItemDao] for media item operations.
     */
    abstract fun mediaItemDao(): MediaItemDao

    /**
     * Provides access to the Metadata Data Access Object.
     *
     * Handles specialized metadata for different media types, including
     * automatic metadata extraction, external API data fetching, and
     * user-provided metadata management.
     *
     * @return An instance of [MetadataDao] for metadata operations.
     */
    abstract fun metadataDao(): MetadataDao

    /**
     * Provides access to the API Key Data Access Object.
     *
     * Manages API keys for external services like TMDB, OpenLibrary,
     * MusicBrainz, and other metadata providers. Includes validation
     * and secure storage capabilities.
     *
     * @return An instance of [APIKeyDao] for API key management.
     */
    abstract fun apiKeyDao(): APIKeyDao

    /**
     * Provides access to the Bookmark Data Access Object.
     *
     * Handles user reading progress, bookmarks, and session tracking
     * for all media types that support position-based navigation
     * (books, documents, videos, podcasts).
     *
     * @return An instance of [BookmarkDao] for bookmark and progress operations.
     */
    abstract fun bookmarkDao(): BookmarkDao

    companion object {

        /** The name of the database file used by Room. */
        const val DATABASE_NAME = "universal-media-library.db"

        /**
         * Migration from database version 1 to 2.
         *
         * Adds favorite and download status tracking to the `metadata_common` table.
         * These fields enable users to mark items as favorites and track which
         * items are available offline.
         */
        val MIGRATION_1_2 = object : Migration(1, 2) {
            override fun migrate(database: SupportSQLiteDatabase) {
                // Add new columns to metadata_common table
                database.execSQL("ALTER TABLE metadata_common ADD COLUMN isFavorite INTEGER NOT NULL DEFAULT 0")
                database.execSQL("ALTER TABLE metadata_common ADD COLUMN isDownloaded INTEGER NOT NULL DEFAULT 1")
            }
        }

        /**
         * Migration from database version 2 to 3.
         *
         * Major expansion to support additional media types beyond books and music.
         * Adds comprehensive metadata tables for TV shows, podcasts, magazines,
         * documents, and academic papers.
         */
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

        /**
         * Migration from database version 3 to 4.
         *
         * Adds a comprehensive API key management system to support integration
         * with external metadata services and content providers.
         */
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

        /**
         * Migration from database version 4 to 5.
         *
         * Introduces a comprehensive reading progress and bookmark system for
         * position-based media consumption tracking. Supports books, documents,
         * videos, and audio content with detailed session tracking.
         */
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

        /**
         * Migration from database version 5 to 6.
         *
         * Adds usage tracking and last access timestamps to improve user experience
         * with recently accessed items and usage analytics.
         */
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