package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import android.content.Context
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*


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
        PlaybackSession::class

    ],
    version = 14,
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

        fun getDatabase(context: Context): AppDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AppDatabase::class.java,
                    DATABASE_NAME
                )
                .fallbackToDestructiveMigration() // For development - will implement proper migrations later
                .build()
                INSTANCE = instance
                instance
            }
        }
    }
}
