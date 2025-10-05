package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import android.content.Context
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.local.entity.podcast.PodcastEntity
import com.universalmedialibrary.data.local.entity.podcast.PodcastEpisodeEntity
import com.universalmedialibrary.data.local.entity.podcast.PodcastSubscriptionEntity
import com.universalmedialibrary.data.local.entity.podcast.PodcastChapterEntity


/**
 * CleverFerret Universal Media Library Database
 *
 * Modern Room database implementation supporting all media types with metadata,
 * progress tracking, bookmarks, and external service integration.
 */
@Database(
    entities = [
        // Core entities only for now
        Library::class,
        MediaItem::class,
        MetadataCommon::class,
        MetadataBook::class,
        MetadataMovie::class,
        MetadataMusicTrack::class,

        // Essential system entities
        APIKey::class,
        Bookmark::class,
        ReadingProgress::class,

        // Person, Series, and Genre entities for metadata
        People::class,
        ItemPersonRole::class,
        Series::class,
        Genre::class,
        ItemGenre::class,

        // Playlists
        Playlist::class,
        PlaylistItem::class,

        // Unified Collections
        UnifiedCollection::class,
        ItemCollection::class,

        // Unified playback queues
        PlaybackQueue::class,
        QueueItem::class,
        PlaybackSession::class,

        // Podcasts
        PodcastEntity::class,
        PodcastEpisodeEntity::class,
        PodcastSubscriptionEntity::class,
        PodcastChapterEntity::class,
        
        // Radio
        RadioStation::class

        ,
        // Maintenance proposals
        MaintenanceChange::class,

        // Emby/Jellyfin servers
        EmbyServer::class,
        JellyfinServer::class

        ,
        // Sharing
        SharedLink::class

    ],
    version = 20, // Incremented for podcast entities + radio station
    exportSchema = false
)
abstract class AppDatabase : RoomDatabase() {


    // Core DAOs

    abstract fun libraryDao(): LibraryDao
    abstract fun apiKeyDao(): APIKeyDao
    abstract fun mediaItemDao(): MediaItemDao
    abstract fun metadataDao(): MetadataDao
    abstract fun bookmarkDao(): BookmarkDao
    abstract fun readingProgressDao(): ReadingProgressDao
    abstract fun playlistDao(): PlaylistDao
    abstract fun playbackQueueDao(): PlaybackQueueDao
    abstract fun queueItemDao(): QueueItemDao
    abstract fun playbackSessionDao(): PlaybackSessionDao
    abstract fun unifiedCollectionDao(): UnifiedCollectionDao
    abstract fun maintenanceChangeDao(): MaintenanceChangeDao
    abstract fun embyServerDao(): EmbyServerDao
    abstract fun jellyfinServerDao(): JellyfinServerDao
    abstract fun sharedLinkDao(): SharedLinkDao

    // Podcast DAOs
    abstract fun podcastDao(): PodcastDao
    abstract fun podcastEpisodeDao(): PodcastEpisodeDao
    abstract fun podcastSubscriptionDao(): PodcastSubscriptionDao
    abstract fun podcastChapterDao(): PodcastChapterDao
    
    // Radio DAO
    abstract fun radioStationDao(): RadioStationDao

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

        @Volatile
        private var INSTANCE: AppDatabase? = null

        /**
         * Migration from version 19 to 20: Adds RadioStation table for internet radio streaming
         */
        private val MIGRATION_19_20 = object : Migration(19, 20) {
            override fun migrate(database: SupportSQLiteDatabase) {
                // Create RadioStation table
                database.execSQL("""
                    CREATE TABLE IF NOT EXISTS radio_stations (
                        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                        name TEXT NOT NULL,
                        description TEXT,
                        streamUrl TEXT NOT NULL,
                        websiteUrl TEXT,
                        logoUrl TEXT,
                        genre TEXT,
                        country TEXT,
                        language TEXT,
                        bitrate INTEGER,
                        codec TEXT,
                        isFavorite INTEGER NOT NULL DEFAULT 0,
                        customOrder INTEGER NOT NULL DEFAULT 0,
                        tags TEXT,
                        addedAt INTEGER NOT NULL,
                        lastPlayedAt INTEGER,
                        playCount INTEGER NOT NULL DEFAULT 0
                    )
                """.trimIndent())
                
                // Create indexes for better query performance
                database.execSQL("CREATE INDEX IF NOT EXISTS index_radio_stations_name ON radio_stations(name)")
                database.execSQL("CREATE INDEX IF NOT EXISTS index_radio_stations_genre ON radio_stations(genre)")
                database.execSQL("CREATE INDEX IF NOT EXISTS index_radio_stations_isFavorite ON radio_stations(isFavorite)")
            }
        }

        fun getDatabase(context: Context): AppDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AppDatabase::class.java,
                    DATABASE_NAME
                )
                .addMigrations(MIGRATION_19_20) // Add proper migration to preserve user data
                .fallbackToDestructiveMigrationOnDowngrade() // Only destructive on downgrades
                .build()
                INSTANCE = instance
                instance
            }
        }
    }
}
