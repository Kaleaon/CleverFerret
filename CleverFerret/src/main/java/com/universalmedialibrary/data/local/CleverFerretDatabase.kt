package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import android.content.Context
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*

/**
 * CleverFerret Universal Media Library Database
 * 
 * Comprehensive database supporting all media types with metadata,
 * progress tracking, bookmarks, and external service integration.
 * 
 * Schema based on Calibre's library structure with modern Android 
 * Room database patterns and full media type support.
 */
@Database(
    entities = [
        // Legacy entities (entity directory)
        com.universalmedialibrary.data.local.entity.DownloadedStory::class,
        com.universalmedialibrary.data.local.entity.Library::class,
        com.universalmedialibrary.data.local.entity.MediaItem::class,
        com.universalmedialibrary.data.local.entity.MetadataCommon::class,
        com.universalmedialibrary.data.local.entity.MetadataBook::class,
        com.universalmedialibrary.data.local.entity.MetadataMovie::class,
        com.universalmedialibrary.data.local.entity.MetadataMusicTrack::class,
        com.universalmedialibrary.data.local.entity.People::class,
        com.universalmedialibrary.data.local.entity.Genre::class,
        com.universalmedialibrary.data.local.entity.Series::class,
        com.universalmedialibrary.data.local.entity.APIKey::class,
        com.universalmedialibrary.data.local.entity.Bookmark::class,
        
        // Plex entities (entity directory)
        com.universalmedialibrary.data.local.entity.PlexServer::class,
        com.universalmedialibrary.data.local.entity.PlexMediaItem::class,
        com.universalmedialibrary.data.local.entity.PlexProgress::class,
        com.universalmedialibrary.data.local.entity.PlexRating::class,
        com.universalmedialibrary.data.local.entity.PlexCollection::class,
        com.universalmedialibrary.data.local.entity.PlexTag::class,
        
        // Playback entities (entity directory)
        com.universalmedialibrary.data.local.entity.PlaybackQueue::class,
        com.universalmedialibrary.data.local.entity.QueueItem::class,
        com.universalmedialibrary.data.local.entity.PlaybackSession::class
    ],
    version = 9,
    exportSchema = false
)
abstract class CleverFerretDatabase : RoomDatabase() {
    
    // Legacy DAOs
    abstract fun downloadedStoryDao(): DownloadedStoryDao
    abstract fun storyUpdateDao(): StoryUpdateDao
    
    // Core universal media library DAOs
    abstract fun libraryDao(): LibraryDao
    abstract fun mediaItemDao(): MediaItemDao
    abstract fun metadataDao(): MetadataDao
    abstract fun apiKeyDao(): APIKeyDao
    abstract fun bookmarkDao(): BookmarkDao
    abstract fun readerSettingsDao(): ReaderSettingsDao
    abstract fun annotationDao(): AnnotationDao
    abstract fun searchIndexDao(): SearchIndexDao
    abstract fun readingStatisticsDao(): ReadingStatisticsDao
    

    // Plex integration DAOs
    abstract fun plexServerDao(): PlexServerDao
    abstract fun plexMediaItemDao(): PlexMediaItemDao
    abstract fun plexSyncDao(): PlexSyncDao

    // Unified playback queue DAOs
    abstract fun playbackQueueDao(): PlaybackQueueDao
    abstract fun queueItemDao(): QueueItemDao
    abstract fun playbackSessionDao(): PlaybackSessionDao

    
    companion object {
        const val DATABASE_NAME = "universal-media-library.db"
        
        @Volatile
        private var INSTANCE: CleverFerretDatabase? = null
        
        fun getDatabase(context: Context): CleverFerretDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    CleverFerretDatabase::class.java,
                    DATABASE_NAME
                )
                // .fallbackToDestructiveMigration() // REMOVED: Do not use destructive migration in production
                .build()
                INSTANCE = instance
                instance
            }
        }
    }
}