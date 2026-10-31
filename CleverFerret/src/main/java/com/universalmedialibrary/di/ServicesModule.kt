package com.universalmedialibrary.di

import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.security.EncryptedCredentialVault
import com.universalmedialibrary.data.repository.StoryRepository
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.services.audio.MultiRoomAudioService
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.utils.FileNameSanitizer
import com.universalmedialibrary.services.contentcreation.StoryUpdateManager
import com.universalmedialibrary.services.webfiction.RedditFanficDownloader
import com.universalmedialibrary.services.reading.AnnotationExportService
import com.universalmedialibrary.services.reading.BookSourceService
import com.universalmedialibrary.services.reading.ReadingAnalyticsService
import com.universalmedialibrary.services.ai.AIServiceManager
import com.universalmedialibrary.utils.FilebotDataService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module providing service-layer dependencies.
 * 
 * This module provides singleton instances of various services including
 * storage access, API key management, fanfiction conversion, and web fiction downloading.
 */
@Module
@InstallIn(SingletonComponent::class)
object ServicesModule {

    /**
     * Provides a singleton StorageAccessService for managing media library storage.
     * 
     * @param libraryDao DAO for accessing library data
     * @param mediaItemDao DAO for accessing media items
     * @param metadataDao DAO for accessing metadata
     * @return Singleton StorageAccessService instance
     */
    @Provides
    @Singleton
    fun provideStorageAccessService(
        libraryDao: LibraryDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao,
        fileNameSanitizer: FileNameSanitizer,
        filebotDataService: FilebotDataService
    ): StorageAccessService = StorageAccessService(
        libraryDao,
        mediaItemDao,
        metadataDao,
        fileNameSanitizer,
        filebotDataService
    )

    /**
     * Provides a singleton APIKeyRepository for managing third-party API keys.
     * 
     * @param apiKeyDao DAO for accessing API key data
     * @return Singleton APIKeyRepository instance
     */
    @Provides
    @Singleton
    fun provideAPIKeyRepository(
        apiKeyDao: APIKeyDao,
        credentialVault: EncryptedCredentialVault
    ): APIKeyRepository = APIKeyRepository(apiKeyDao, credentialVault)

    /**
     * Creates a singleton StoryUpdateManager using the provided StoryRepository.
     *
     * @param storyRepository Repository used by the manager to fetch, update, and persist stories
     * @return The configured StoryUpdateManager instance
     */
    @Provides
    @Singleton
    fun provideStoryUpdateManager(
        storyRepository: StoryRepository
    ): StoryUpdateManager = StoryUpdateManager(storyRepository)

    /**
     * Provides a singleton RedditFanficDownloader for downloading fanfiction from Reddit.
     * 
     * @return Singleton RedditFanficDownloader instance
     */
    @Provides
    @Singleton
    fun provideRedditFanficDownloader(): RedditFanficDownloader = RedditFanficDownloader()

    @Provides
    @Singleton
    fun provideBookSourceService(
        bookSourceDao: BookSourceDao,
        okHttpClient: okhttp3.OkHttpClient
    ): BookSourceService = BookSourceService(bookSourceDao, okHttpClient)

    @Provides
    @Singleton
    fun provideReadingAnalyticsService(
        readingAnalyticsDao: ReadingAnalyticsDao,
        aiServiceManager: AIServiceManager
    ): ReadingAnalyticsService = ReadingAnalyticsService(readingAnalyticsDao, aiServiceManager)

    @Provides
    @Singleton
    fun provideAnnotationExportService(
        enhancedAnnotationDao: EnhancedAnnotationDao
    ): AnnotationExportService = AnnotationExportService(enhancedAnnotationDao)

    @Provides
    @Singleton
    fun provideMultiRoomAudioService(
        audioSyncServerDao: AudioSyncServerDao,
        audioSyncClientDao: AudioSyncClientDao,
        audioSyncGroupDao: AudioSyncGroupDao,
        audioStreamDao: AudioStreamDao,
        syncStatisticsDao: SyncStatisticsDao
    ): MultiRoomAudioService = MultiRoomAudioService(
        audioSyncServerDao,
        audioSyncClientDao,
        audioSyncGroupDao,
        audioStreamDao,
        syncStatisticsDao
    )

    // Integration and Metadata Service Providers
    @Provides
    @Singleton
    fun provideSmartContentAnalyzer(
        @dagger.hilt.android.qualifiers.ApplicationContext context: android.content.Context
    ): com.universalmedialibrary.services.ai.SmartContentAnalyzer =
        com.universalmedialibrary.services.ai.SmartContentAnalyzer(context)

    @Provides
    @Singleton
    fun providePlexIntegrationService(
        @dagger.hilt.android.qualifiers.ApplicationContext context: android.content.Context,
        contentAnalyzer: com.universalmedialibrary.services.ai.SmartContentAnalyzer,
        plexAuthService: com.universalmedialibrary.services.plex.PlexAuthService,
        externalMediaEntityDao: ExternalMediaEntityDao
    ): com.universalmedialibrary.services.integration.plex.PlexIntegrationService =
        com.universalmedialibrary.services.integration.plex.PlexIntegrationService(context, contentAnalyzer, plexAuthService, externalMediaEntityDao)

    @Provides
    @Singleton
    fun provideCalibreIntegrationService(
        @dagger.hilt.android.qualifiers.ApplicationContext context: android.content.Context,
        apiKeyRepository: APIKeyRepository,
        externalMediaEntityDao: ExternalMediaEntityDao
    ): com.universalmedialibrary.services.integration.calibre.CalibreIntegrationService {
        // CalibreIntegrationService(context, apiKeyRepository)
        return com.universalmedialibrary.services.integration.calibre.CalibreIntegrationService(
            context,
            apiKeyRepository,
            externalMediaEntityDao
        )
    }

    @Provides
    @Singleton
    fun provideCloudStorageService(
        @dagger.hilt.android.qualifiers.ApplicationContext context: android.content.Context,
        apiKeyRepository: APIKeyRepository
    ): com.universalmedialibrary.services.integration.cloud.CloudStorageService =
        com.universalmedialibrary.services.integration.cloud.CloudStorageService(context, apiKeyRepository)

    @Provides
    @Singleton
    fun provideBookServicesIntegration(
        @dagger.hilt.android.qualifiers.ApplicationContext context: android.content.Context,
        apiKeyRepository: APIKeyRepository
    ): com.universalmedialibrary.services.integration.books.BookServicesIntegration =
        com.universalmedialibrary.services.integration.books.BookServicesIntegration(context, apiKeyRepository)

    @Provides
    @Singleton
    fun provideIntegrationManager(
        @dagger.hilt.android.qualifiers.ApplicationContext context: android.content.Context,
        plexService: com.universalmedialibrary.services.integration.plex.PlexIntegrationService,
        calibreService: com.universalmedialibrary.services.integration.calibre.CalibreIntegrationService,
        jellyfinService: com.universalmedialibrary.services.integration.jellyfin.JellyfinIntegrationService,
        embyService: com.universalmedialibrary.services.integration.emby.EmbyIntegrationService,
        yaaccAdapter: com.universalmedialibrary.services.integration.yaacc.YaaccIntegrationAdapter,
        powerampAdapter: com.universalmedialibrary.services.integration.poweramp.PowerampIntegrationAdapter,
        cloudService: com.universalmedialibrary.services.integration.cloud.CloudStorageService,
        bookServices: com.universalmedialibrary.services.integration.books.BookServicesIntegration
    ): com.universalmedialibrary.services.integration.IntegrationManager {
        // IntegrationManager(context, plexService, calibreService, cloudService, bookServices)
        return com.universalmedialibrary.services.integration.IntegrationManager(
            context,
            plexService,
            calibreService,
            jellyfinService,
            embyService,
            yaaccAdapter,
            powerampAdapter,
            cloudService,
            bookServices
        )
    }

    // Database and Metadata Providers
    @Provides
    @Singleton
    fun provideAppDatabase(
        @dagger.hilt.android.qualifiers.ApplicationContext context: android.content.Context
    ): AppDatabase {
        // AppDatabase configuration with addMigrations for MIGRATION_3_4
        return AppDatabase.getDatabase(context)
    }

    @Provides
    @Singleton
    fun provideAPIKeyDao(appDatabase: AppDatabase): APIKeyDao = appDatabase.apiKeyDao()

    @Provides
    @Singleton
    fun provideMetadataApiService(
        apiKeyRepository: APIKeyRepository,
        tvMazeService: com.universalmedialibrary.services.metadata.TVMazeService
    ): com.universalmedialibrary.services.metadata.MetadataApiService =
        com.universalmedialibrary.services.metadata.MetadataApiService(apiKeyRepository, tvMazeService)

    @Provides
    @Singleton
    fun provideComprehensiveMetadataService(
        realMetadataService: com.universalmedialibrary.services.metadata.RealMetadataService,
        movieTrailerService: com.universalmedialibrary.services.metadata.MovieTrailerService,
        movieReviewService: com.universalmedialibrary.services.metadata.MovieReviewService,
        artworkLoader: com.universalmedialibrary.services.artwork.ArtworkLoader,
        apiKeyRepository: APIKeyRepository,
        mediaItemDao: com.universalmedialibrary.data.local.dao.MediaItemDao,
        metadataDao: com.universalmedialibrary.data.local.dao.MetadataDao
    ): com.universalmedialibrary.services.metadata.ComprehensiveMetadataService =
        com.universalmedialibrary.services.metadata.ComprehensiveMetadataService(
            realMetadataService,
            movieTrailerService,
            movieReviewService,
            artworkLoader,
            apiKeyRepository,
            mediaItemDao,
            metadataDao
        )
}
