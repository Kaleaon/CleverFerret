package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import android.content.Context
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.local.dao.PlexServerDao
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
        ReadingSession::class,

        // Person, Series, Album, and Genre entities for metadata
        People::class,
        ItemPersonRole::class,
        Series::class,
        Album::class,
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
        RadioStation::class,
        // Maintenance proposals
        MaintenanceChange::class,

        // Emby/Jellyfin servers
        EmbyServer::class,
        JellyfinServer::class,

        // Sharing
        SharedLink::class,

        // Fanfiction/Story Management
        DownloadedStory::class,
        StoryUpdate::class,

        // Plex Integration
        PlexServer::class,
        PlexMediaItem::class,
        PlexProgress::class,
        PlexRating::class,
        PlexCollection::class,
        PlexCollectionItem::class,
        PlexTag::class,
        PlexMediaTag::class,

        // Reader enhancements
        TextAnnotation::class,
        SearchIndex::class,
        ReadingStatistics::class,
        ReaderSettingsEntity::class,
        BookReaderSettingsEntity::class,

        // Unified tagging
        UnifiedTag::class,
        ItemTag::class

    ],
    version = 22, // Incremented for Plex entities and reader enhancements
    exportSchema = false
)
@TypeConverters(Converters::class)
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

    // Story Management DAOs
    abstract fun downloadedStoryDao(): DownloadedStoryDao
    abstract fun storyUpdateDao(): StoryUpdateDao

    // Plex DAOs
    abstract fun plexServerDao(): PlexServerDao
    abstract fun plexMediaItemDao(): PlexMediaItemDao
    abstract fun plexSyncDao(): PlexSyncDao

    // Reader enhancement DAOs
    abstract fun annotationDao(): AnnotationDao
    abstract fun readerSettingsDao(): ReaderSettingsDao
    abstract fun searchIndexDao(): SearchIndexDao
    abstract fun readingStatisticsDao(): ReadingStatisticsDao

    // Tag DAO
    abstract fun tagDao(): TagDao


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
                .addMigrations(AppDatabaseMigrations.MIGRATION_20_21)
                .fallbackToDestructiveMigration() // Fallback for unexpected migrations only
                .build()
                INSTANCE = instance
                instance
            }
        }
    }
}
