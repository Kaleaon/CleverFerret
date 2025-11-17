package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.MetadataFetchRepository
import com.universalmedialibrary.data.repository.SearchRepository
import com.universalmedialibrary.data.repository.ImportExportRepository
import com.universalmedialibrary.services.metadata.RealMetadataService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module providing database-related dependencies
 * 
 * Provides:
 * - AppDatabase instance (singleton)
 * - All DAO implementations from the database
 */
@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {

    @Provides
    @Singleton
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return AppDatabase.getDatabase(context)
    }

    // Core DAOs
    @Provides
    fun provideLibraryDao(database: AppDatabase): LibraryDao {
        return database.libraryDao()
    }

      @Provides
      fun provideLibraryScanSettingsDao(database: AppDatabase): LibraryScanSettingsDao {
          return database.libraryScanSettingsDao()
      }

    @Provides
    fun provideAPIKeyDao(appDatabase: AppDatabase): APIKeyDao {
        return appDatabase.apiKeyDao()
    }

    @Provides
    fun provideMediaItemDao(appDatabase: AppDatabase): MediaItemDao {
        return appDatabase.mediaItemDao()
    }

      @Provides
      fun provideListenHistoryDao(appDatabase: AppDatabase): ListenHistoryDao {
          return appDatabase.listenHistoryDao()
      }

    @Provides
    fun provideMetadataDao(database: AppDatabase): MetadataDao {
        return database.metadataDao()
    }

    @Provides
    fun provideBookmarkDao(database: AppDatabase): BookmarkDao {
        return database.bookmarkDao()
    }

    @Provides
    fun provideReadingProgressDao(database: AppDatabase): ReadingProgressDao {
        return database.readingProgressDao()
    }

    // Plex DAOs
    @Provides
    fun providePlexServerDao(database: AppDatabase): PlexServerDao {
        return database.plexServerDao()
    }

    @Provides
    fun providePlexMediaItemDao(database: AppDatabase): PlexMediaItemDao {
        return database.plexMediaItemDao()
    }

    @Provides
    fun providePlexSyncDao(database: AppDatabase): PlexSyncDao {
        return database.plexSyncDao()
    }

    // Emby/Jellyfin/YAACC DAOs
    @Provides
    fun provideEmbyServerDao(database: AppDatabase): EmbyServerDao {
        return database.embyServerDao()
    }

    @Provides
    fun provideJellyfinServerDao(database: AppDatabase): JellyfinServerDao {
        return database.jellyfinServerDao()
    }

    @Provides
    fun provideYaaccServerDao(database: AppDatabase): YaaccServerDao {
        return database.yaaccServerDao()
    }

    // OPDS DAO
    @Provides
    fun provideOPDSCatalogDao(database: AppDatabase): OPDSCatalogDao {
        return database.opdsCatalogDao()
    }

    // Reader enhancement DAOs
    @Provides
    fun provideAnnotationDao(database: AppDatabase): AnnotationDao =
        database.annotationDao()

    @Provides
    fun provideEnhancedAnnotationDao(database: AppDatabase): EnhancedAnnotationDao =
        database.enhancedAnnotationDao()

    @Provides
    fun provideBookSourceDao(database: AppDatabase): BookSourceDao =
        database.bookSourceDao()

    @Provides
    fun provideBookChapterDao(database: AppDatabase): BookChapterDao =
        database.bookChapterDao()

    @Provides
    fun provideSearchIndexDao(database: AppDatabase): SearchIndexDao {
        return database.searchIndexDao()
    }

    @Provides
    fun provideReadingStatisticsDao(database: AppDatabase): ReadingStatisticsDao =
        database.readingStatisticsDao()

    @Provides
    fun provideReadingAnalyticsDao(database: AppDatabase): ReadingAnalyticsDao =
        database.readingAnalyticsDao()

    @Provides
    fun provideReaderSettingsDao(database: AppDatabase): ReaderSettingsDao {
        return database.readerSettingsDao()
    }

    @Provides
    fun provideGeneralSettingsDao(database: AppDatabase): GeneralSettingsDao {
        return database.generalSettingsDao()
    }

    @Provides
    fun provideSecuritySettingsDao(database: AppDatabase): SecuritySettingsDao {
        return database.securitySettingsDao()
    }

    @Provides
    fun provideApiSettingsDao(database: AppDatabase): ApiSettingsDao {
        return database.apiSettingsDao()
    }

    @Provides
    fun provideComicPanelDao(database: AppDatabase): ComicPanelDao {
        return database.comicPanelDao()
    }

    /**
     * Provides the TagDao instance from the application database.
     *
     * @return The TagDao used for tag-related persistence operations.
     */
    @Provides
    fun provideTagDao(database: AppDatabase): TagDao {
        return database.tagDao()
    }

    /**
     * Exposes the SharedLinkDao from the provided AppDatabase for injection.
     *
     * @return The SharedLinkDao instance backed by the given AppDatabase.
     */
    @Provides
    fun provideSharedLinkDao(database: AppDatabase): SharedLinkDao {
        return database.sharedLinkDao()
    }

    /**
     * Exposes the UnifiedCollectionDao instance from the provided AppDatabase for dependency injection.
     *
     * @param database The app database to obtain the DAO from.
     * @return The UnifiedCollectionDao instance.
     */
    @Provides
    fun provideUnifiedCollectionDao(database: AppDatabase): UnifiedCollectionDao {
        return database.unifiedCollectionDao()
    }

    /**
     * Obtains the MaintenanceChangeDao instance from the provided AppDatabase for dependency injection.
     *
     * @param database AppDatabase instance to retrieve the DAO from.
     * @return The MaintenanceChangeDao backed by the given database.
     */
    @Provides
    fun provideMaintenanceChangeDao(database: AppDatabase): MaintenanceChangeDao {
        return database.maintenanceChangeDao()
    }

    // Metadata Fetch Repository
    @Provides
    @Singleton
    fun provideMetadataFetchRepository(
        realMetadataService: RealMetadataService,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): MetadataFetchRepository {
        return MetadataFetchRepository(realMetadataService, mediaItemDao, metadataDao)
    }

    // Search Repository
    @Provides
    @Singleton
    fun provideSearchRepository(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): SearchRepository {
        return SearchRepository(mediaItemDao, metadataDao)
    }

    // Import/Export Repository
    @Provides
    @Singleton
    fun provideImportExportRepository(
        @ApplicationContext context: Context,
        libraryDao: LibraryDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao,
        readingProgressDao: ReadingProgressDao,
        bookmarkDao: BookmarkDao,
        collectionDao: UnifiedCollectionDao,
        settingsRepository: com.universalmedialibrary.data.repository.SettingsRepository
    ): ImportExportRepository {
        return ImportExportRepository(
            context,
            libraryDao,
            mediaItemDao,
            metadataDao,
            readingProgressDao,
            bookmarkDao,
            collectionDao,
            settingsRepository
        )
    }

    // Calibre Features DAOs
    @Provides
    fun provideFanfictionDao(database: AppDatabase): FanfictionDao {
        return database.fanfictionDao()
    }

    @Provides
    fun provideAudiobookDao(database: AppDatabase): AudiobookDao {
        return database.audiobookDao()
    }

    // Story Management DAOs
    @Provides
    fun provideDownloadedStoryDao(database: AppDatabase): DownloadedStoryDao {
        return database.downloadedStoryDao()
    }

    @Provides
    fun provideStoryUpdateDao(database: AppDatabase): StoryUpdateDao {
        return database.storyUpdateDao()
    }

    // Playlist DAO
    @Provides
    fun providePlaylistDao(database: AppDatabase): PlaylistDao {
        return database.playlistDao()
    }

    // Playback DAOs
    @Provides
    fun providePlaybackQueueDao(database: AppDatabase): PlaybackQueueDao {
        return database.playbackQueueDao()
    }

    @Provides
    fun provideQueueItemDao(database: AppDatabase): QueueItemDao {
        return database.queueItemDao()
    }

    @Provides
    fun providePlaybackSessionDao(database: AppDatabase): PlaybackSessionDao {
        return database.playbackSessionDao()
    }

    // Unified Tag DAO
    @Provides
    fun provideUnifiedTagDao(database: AppDatabase): UnifiedTagDao {
        return database.unifiedTagDao()
    }
    
    // Ambient Sound DAO
    @Provides
    fun provideAmbientSoundDao(database: AppDatabase): AmbientSoundDao =
        database.ambientSoundDao()

    @Provides
    fun provideAudioWaveformDao(database: AppDatabase): AudioWaveformDao =
        database.audioWaveformDao()

    @Provides
    fun provideAudioSyncServerDao(database: AppDatabase): AudioSyncServerDao =
        database.audioSyncServerDao()

    @Provides
    fun provideAudioSyncClientDao(database: AppDatabase): AudioSyncClientDao =
        database.audioSyncClientDao()

    @Provides
    fun provideAudioSyncGroupDao(database: AppDatabase): AudioSyncGroupDao =
        database.audioSyncGroupDao()

    @Provides
    fun provideAudioStreamDao(database: AppDatabase): AudioStreamDao =
        database.audioStreamDao()

    @Provides
    fun provideSyncStatisticsDao(database: AppDatabase): SyncStatisticsDao =
        database.syncStatisticsDao()
    
    // Audio Pack DAO
    @Provides
    fun provideAudioPackDao(database: AppDatabase): AudioPackDao {
        return database.audioPackDao()
    }

    /**
     * Provides the DAO for accessing the OCR cache table.
     * The OCR cache stores results of text recognition (OCR) on media items,
     * allowing the app to avoid redundant OCR processing and improve performance.
     */
    @Provides
    fun provideOcrCacheDao(database: AppDatabase): OcrCacheDao {
        return database.ocrCacheDao()
    }

    /**
     * Provides the DAO for accessing collaborative session tables.
     * Supports collaborative playlist sharing over Chromecast and Android Auto.
     */
    @Provides
    fun provideCollaborativeSessionDao(database: AppDatabase): CollaborativeSessionDao {
        return database.collaborativeSessionDao()
    }

}