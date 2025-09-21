package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.tts.CoquiTTSService
import com.universalmedialibrary.services.metadata.MetadataApiService
import com.universalmedialibrary.services.metadata.ComprehensiveMetadataService
import com.universalmedialibrary.services.metadata.RealMetadataService
import com.universalmedialibrary.services.integration.IntegrationManager
import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
import com.universalmedialibrary.services.integration.calibre.CalibreIntegrationService
import com.universalmedialibrary.services.integration.cloud.CloudStorageService
import com.universalmedialibrary.services.integration.books.BookServicesIntegration
import com.universalmedialibrary.services.analysis.SmartContentAnalyzer
import com.universalmedialibrary.services.video.ComprehensiveVideoService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for providing service-layer dependencies.
 * This object is responsible for defining how to create and provide instances
 * of various services used throughout the application, such as metadata services,
 * integration services, and content analysis services.
 */
@Module
@InstallIn(SingletonComponent::class)
object ServicesModule {

    /**
     * Provides the main [AppDatabase] instance as a singleton.
     * @param context The application context.
     * @return A singleton instance of [AppDatabase].
     * @see DatabaseModule.provideAppDatabase for the primary provider. This is a duplicate and should be reviewed.
     */
    @Provides
    @Singleton
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            AppDatabase.DATABASE_NAME
        )
        .addMigrations(
            AppDatabase.MIGRATION_1_2,
            AppDatabase.MIGRATION_2_3,
            AppDatabase.MIGRATION_3_4,
            AppDatabase.MIGRATION_4_5
        )
        .build()
    }

    /**
     * Provides the [APIKeyDao] instance from the database.
     * @param database The application database.
     * @return An instance of [APIKeyDao].
     */
    @Provides
    @Singleton
    fun provideAPIKeyDao(database: AppDatabase): APIKeyDao = database.apiKeyDao()

    /**
     * Provides the [LibraryDao] instance from the database.
     * @param database The application database.
     * @return An instance of [LibraryDao].
     */
    @Provides
    @Singleton
    fun provideLibraryDao(database: AppDatabase): LibraryDao = database.libraryDao()

    /**
     * Provides the [MediaItemDao] instance from the database.
     * @param database The application database.
     * @return An instance of [MediaItemDao].
     */
    @Provides
    @Singleton
    fun provideMediaItemDao(database: AppDatabase): MediaItemDao = database.mediaItemDao()

    /**
     * Provides the [MetadataDao] instance from the database.
     * @param database The application database.
     * @return An instance of [MetadataDao].
     */
    @Provides
    @Singleton
    fun provideMetadataDao(database: AppDatabase): MetadataDao = database.metadataDao()

    /**
     * Provides the [BookmarkDao] instance from the database.
     * @param database The application database.
     * @return An instance of [BookmarkDao].
     */
    @Provides
    @Singleton
    fun provideBookmarkDao(database: AppDatabase): BookmarkDao = database.bookmarkDao()

    /**
     * Provides a singleton instance of [StorageAccessService].
     * @param libraryDao DAO for library operations.
     * @param mediaItemDao DAO for media item operations.
     * @param metadataDao DAO for metadata operations.
     * @return An instance of [StorageAccessService].
     */
    @Provides
    @Singleton
    fun provideStorageAccessService(
        libraryDao: LibraryDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): StorageAccessService = StorageAccessService(libraryDao, mediaItemDao, metadataDao)

    /**
     * Provides a singleton instance of [APIKeyRepository].
     * @param apiKeyDao DAO for API key operations.
     * @return An instance of [APIKeyRepository].
     */
    @Provides
    @Singleton
    fun provideAPIKeyRepository(apiKeyDao: APIKeyDao): APIKeyRepository = APIKeyRepository(apiKeyDao)

    /**
     * Provides a singleton instance of [CoquiTTSService] for text-to-speech functionality.
     * @param context The application context.
     * @return An instance of [CoquiTTSService].
     */
    @Provides
    @Singleton
    fun provideCoquiTTSService(@ApplicationContext context: Context): CoquiTTSService = CoquiTTSService(context)

    /**
     * Provides a singleton instance of [MetadataApiService] for fetching metadata from external APIs.
     * @param apiKeyRepository Repository to access necessary API keys.
     * @return An instance of [MetadataApiService].
     */
    @Provides
    @Singleton
    fun provideMetadataApiService(apiKeyRepository: APIKeyRepository): MetadataApiService = MetadataApiService(apiKeyRepository)

    /**
     * Provides a singleton instance of [ComprehensiveMetadataService] for advanced metadata operations.
     * @param apiKeyRepository Repository to access necessary API keys.
     * @return An instance of [ComprehensiveMetadataService].
     */
    @Provides
    @Singleton
    fun provideComprehensiveMetadataService(apiKeyRepository: APIKeyRepository): ComprehensiveMetadataService = ComprehensiveMetadataService(apiKeyRepository)

    /**
     * Provides a singleton instance of [RealMetadataService] as the concrete implementation for metadata fetching.
     * @param apiKeyRepository Repository to access necessary API keys.
     * @return An instance of [RealMetadataService].
     */
    @Provides
    @Singleton
    fun provideRealMetadataService(apiKeyRepository: APIKeyRepository): RealMetadataService = RealMetadataService(apiKeyRepository)

    /**
     * Provides a singleton instance of the WebFictionService.
     * @return An instance of [com.universalmedialibrary.services.webfiction.WebFictionService].
     */
    @Provides
    @Singleton
    fun provideWebFictionService(): com.universalmedialibrary.services.webfiction.WebFictionService = com.universalmedialibrary.services.webfiction.WebFictionService()

    /**
     * Provides a singleton instance of the PodcastService.
     * @param context The application context.
     * @return An instance of [com.universalmedialibrary.services.podcast.PodcastService].
     */
    @Provides
    @Singleton
    fun providePodcastService(@ApplicationContext context: Context): com.universalmedialibrary.services.podcast.PodcastService = com.universalmedialibrary.services.podcast.PodcastService(context)

    /**
     * Provides a singleton instance of the OCRService for text recognition.
     * @return An instance of [com.universalmedialibrary.services.analysis.ocr.OCRService].
     */
    @Provides
    @Singleton
    fun provideOCRService(): com.universalmedialibrary.services.analysis.ocr.OCRService = com.universalmedialibrary.services.analysis.ocr.OCRService()

    /**
     * Provides a singleton instance of the MetadataExtractor for NLP-based metadata extraction.
     * @param context The application context.
     * @return An instance of [com.universalmedialibrary.services.analysis.nlp.MetadataExtractor].
     */
    @Provides
    @Singleton
    fun provideMetadataExtractor(@ApplicationContext context: Context): com.universalmedialibrary.services.analysis.nlp.MetadataExtractor = com.universalmedialibrary.services.analysis.nlp.MetadataExtractor(context)

    /**
     * Provides a singleton instance of the ContentFingerprinter for identifying media.
     * @return An instance of [com.universalmedialibrary.services.analysis.fingerprint.ContentFingerprinter].
     */
    @Provides
    @Singleton
    fun provideContentFingerprinter(): com.universalmedialibrary.services.analysis.fingerprint.ContentFingerprinter = com.universalmedialibrary.services.analysis.fingerprint.ContentFingerprinter()

    /**
     * Provides a singleton instance of the ContentClassifier for categorizing media.
     * @return An instance of [com.universalmedialibrary.services.analysis.classification.ContentClassifier].
     */
    @Provides
    @Singleton
    fun provideContentClassifier(): com.universalmedialibrary.services.analysis.classification.ContentClassifier = com.universalmedialibrary.services.analysis.classification.ContentClassifier()

    /**
     * Provides a singleton instance of the ArchiveComparator for comparing media versions.
     * @param comprehensiveMetadataService A service to fetch detailed metadata for comparison.
     * @return An instance of [com.universalmedialibrary.services.analysis.comparison.ArchiveComparator].
     */
    @Provides
    @Singleton
    fun provideArchiveComparator(comprehensiveMetadataService: ComprehensiveMetadataService): com.universalmedialibrary.services.analysis.comparison.ArchiveComparator = com.universalmedialibrary.services.analysis.comparison.ArchiveComparator(comprehensiveMetadataService)

    /**
     * Provides a singleton instance of the MediaViewerManager.
     * @return An instance of [com.universalmedialibrary.ui.viewer.MediaViewerManager].
     */
    @Provides
    @Singleton
    fun provideMediaViewerManager(): com.universalmedialibrary.ui.viewer.MediaViewerManager = com.universalmedialibrary.ui.viewer.MediaViewerManager()

    /**
     * Provides a singleton instance of [SmartContentAnalyzer].
     * @param context The application context.
     * @param mediaViewerManager Manager for handling different media viewers.
     * @param ocrService Service for optical character recognition.
     * @param metadataExtractor Service for extracting metadata using NLP.
     * @param contentFingerprinter Service for creating content fingerprints.
     * @param contentClassifier Service for classifying content.
     * @param archiveComparator Service for comparing archive files.
     * @return An instance of [SmartContentAnalyzer].
     */
    @Provides
    @Singleton
    fun provideSmartContentAnalyzer(
        @ApplicationContext context: Context,
        mediaViewerManager: com.universalmedialibrary.ui.viewer.MediaViewerManager,
        ocrService: com.universalmedialibrary.services.analysis.ocr.OCRService,
        metadataExtractor: com.universalmedialibrary.services.analysis.nlp.MetadataExtractor,
        contentFingerprinter: com.universalmedialibrary.services.analysis.fingerprint.ContentFingerprinter,
        contentClassifier: com.universalmedialibrary.services.analysis.classification.ContentClassifier,
        archiveComparator: com.universalmedialibrary.services.analysis.comparison.ArchiveComparator
    ): SmartContentAnalyzer = SmartContentAnalyzer(
        context, mediaViewerManager, ocrService, metadataExtractor, contentFingerprinter, contentClassifier, archiveComparator
    )

    /**
     * Provides a singleton instance of [PlexIntegrationService].
     * @param context The application context.
     * @param contentAnalyzer The smart content analyzer for deep media analysis.
     * @return An instance of [PlexIntegrationService].
     */
    @Provides
    @Singleton
    fun providePlexIntegrationService(
        @ApplicationContext context: Context,
        contentAnalyzer: SmartContentAnalyzer
    ): PlexIntegrationService = PlexIntegrationService(context, contentAnalyzer)

    /**
     * Provides a singleton instance of [CalibreIntegrationService].
     * @param context The application context.
     * @param apiKeyRepository Repository to access necessary API keys.
     * @return An instance of [CalibreIntegrationService].
     */
    @Provides
    @Singleton
    fun provideCalibreIntegrationService(
        @ApplicationContext context: Context,
        apiKeyRepository: APIKeyRepository
    ): CalibreIntegrationService = CalibreIntegrationService(context, apiKeyRepository)

    /**
     * Provides a singleton instance of [CloudStorageService].
     * @param context The application context.
     * @param apiKeyRepository Repository to access necessary API keys.
     * @return An instance of [CloudStorageService].
     */
    @Provides
    @Singleton
    fun provideCloudStorageService(
        @ApplicationContext context: Context,
        apiKeyRepository: APIKeyRepository
    ): CloudStorageService = CloudStorageService(context, apiKeyRepository)

    /**
     * Provides a singleton instance of [BookServicesIntegration].
     * @param context The application context.
     * @param apiKeyRepository Repository to access necessary API keys.
     * @return An instance of [BookServicesIntegration].
     */
    @Provides
    @Singleton
    fun provideBookServicesIntegration(
        @ApplicationContext context: Context,
        apiKeyRepository: APIKeyRepository
    ): BookServicesIntegration = BookServicesIntegration(context, apiKeyRepository)

    /**
     * Provides a singleton instance of [IntegrationManager].
     * @param context The application context.
     * @param plexService Service for Plex integration.
     * @param calibreService Service for Calibre integration.
     * @param cloudService Service for cloud storage integration.
     * @param bookServices Service for book-related integrations.
     * @return An instance of [IntegrationManager].
     */
    @Provides
    @Singleton
    fun provideIntegrationManager(
        @ApplicationContext context: Context,
        plexService: PlexIntegrationService,
        calibreService: CalibreIntegrationService,
        cloudService: CloudStorageService,
        bookServices: BookServicesIntegration
    ): IntegrationManager = IntegrationManager(context, plexService, calibreService, cloudService, bookServices)

    /**
     * Provides a singleton instance of [ComprehensiveVideoService].
     * @param context The application context.
     * @return An instance of [ComprehensiveVideoService].
     */
    @Provides
    @Singleton
    fun provideComprehensiveVideoService(
        @ApplicationContext context: Context
    ): ComprehensiveVideoService = ComprehensiveVideoService(context)
}