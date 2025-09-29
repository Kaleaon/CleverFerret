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
        // Legacy content creation entities
        DownloadedStory::class,
        StoryUpdate::class,
        
        // Core universal media library entities
        Library::class,
        MediaItem::class,
        MetadataCommon::class,
        MetadataBook::class,
        MetadataMovie::class,
        MetadataMusicTrack::class,
        
        // Relational entities
        People::class,
        ItemPersonRole::class,
        Genre::class,
        ItemGenre::class,
        Series::class,
        Album::class,
        
        // System entities
        APIKey::class,
        Bookmark::class,
        ReadingProgress::class,
        ReadingSession::class,
        
        // Reader settings entities
        ReaderSettingsEntity::class,
        BookReaderSettingsEntity::class,
        
        // Annotation and search entities
        TextAnnotation::class,
        SearchIndex::class,
        ReadingStatistics::class,
        
        // Plex integration entities
        PlexServer::class,
        PlexMediaItem::class,
        PlexProgress::class,
        PlexRating::class,
        PlexCollection::class,
        PlexCollectionItem::class,
        PlexTag::class,
        PlexMediaTag::class,

        // Unified playback queue entities
        PlaybackQueue::class,
        QueueItem::class,
        PlaybackSession::class

    ],
    version = 9,
    exportSchema = false
)
@TypeConverters(Converters::class)
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