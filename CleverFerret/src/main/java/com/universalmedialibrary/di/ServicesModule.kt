package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.tts.CoquiTTSService
import com.universalmedialibrary.services.metadata.MetadataApiService
import com.universalmedialibrary.services.metadata.ComprehensiveMetadataService
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

@Module
@InstallIn(SingletonComponent::class)
object ServicesModule {

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
            AppDatabase.MIGRATION_3_4
        )
        .build()
    }

    @Provides
    @Singleton
    fun provideAPIKeyDao(database: AppDatabase): APIKeyDao {
        return database.apiKeyDao()
    }

    @Provides
    @Singleton
    fun provideAPIKeyRepository(apiKeyDao: APIKeyDao): APIKeyRepository {
        return APIKeyRepository(apiKeyDao)
    }

    @Provides
    @Singleton
    fun provideCoquiTTSService(@ApplicationContext context: Context): CoquiTTSService {
        return CoquiTTSService(context)
    }

    @Provides
    @Singleton
    fun provideMetadataApiService(apiKeyRepository: APIKeyRepository): MetadataApiService {
        return MetadataApiService(apiKeyRepository)
    }

    @Provides
    @Singleton
    fun provideComprehensiveMetadataService(apiKeyRepository: APIKeyRepository): ComprehensiveMetadataService {
        return ComprehensiveMetadataService(apiKeyRepository)
    }

    @Provides
    @Singleton
    fun provideWebFictionService(): com.universalmedialibrary.services.webfiction.WebFictionService {
        return com.universalmedialibrary.services.webfiction.WebFictionService()
    }

    @Provides
    @Singleton
    fun providePodcastService(@ApplicationContext context: Context): com.universalmedialibrary.services.podcast.PodcastService {
        return com.universalmedialibrary.services.podcast.PodcastService(context)
    }

    // Smart Content Analysis Services
    @Provides
    @Singleton
    fun provideOCRService(): com.universalmedialibrary.services.analysis.ocr.OCRService {
        return com.universalmedialibrary.services.analysis.ocr.OCRService()
    }

    @Provides
    @Singleton
    fun provideMetadataExtractor(): com.universalmedialibrary.services.analysis.nlp.MetadataExtractor {
        return com.universalmedialibrary.services.analysis.nlp.MetadataExtractor()
    }

    @Provides
    @Singleton
    fun provideContentFingerprinter(): com.universalmedialibrary.services.analysis.fingerprint.ContentFingerprinter {
        return com.universalmedialibrary.services.analysis.fingerprint.ContentFingerprinter()
    }

    @Provides
    @Singleton
    fun provideContentClassifier(): com.universalmedialibrary.services.analysis.classification.ContentClassifier {
        return com.universalmedialibrary.services.analysis.classification.ContentClassifier()
    }

    @Provides
    @Singleton
    fun provideArchiveComparator(comprehensiveMetadataService: ComprehensiveMetadataService): com.universalmedialibrary.services.analysis.comparison.ArchiveComparator {
        return com.universalmedialibrary.services.analysis.comparison.ArchiveComparator(comprehensiveMetadataService)
    }

    @Provides
    @Singleton
    fun provideMediaViewerManager(): com.universalmedialibrary.ui.viewer.MediaViewerManager {
        return com.universalmedialibrary.ui.viewer.MediaViewerManager()
    }

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
    ): SmartContentAnalyzer {
        return SmartContentAnalyzer(
            context, mediaViewerManager, ocrService, metadataExtractor, 
            contentFingerprinter, contentClassifier, archiveComparator
        )
    }

    // Integration Services
    @Provides
    @Singleton
    fun providePlexIntegrationService(
        @ApplicationContext context: Context,
        contentAnalyzer: SmartContentAnalyzer
    ): PlexIntegrationService {
        return PlexIntegrationService(context, contentAnalyzer)
    }

    @Provides
    @Singleton
    fun provideCalibreIntegrationService(
        @ApplicationContext context: Context,
        apiKeyRepository: APIKeyRepository
    ): CalibreIntegrationService {
        return CalibreIntegrationService(context, apiKeyRepository)
    }

    @Provides
    @Singleton
    fun provideCloudStorageService(
        @ApplicationContext context: Context,
        apiKeyRepository: APIKeyRepository
    ): CloudStorageService {
        return CloudStorageService(context, apiKeyRepository)
    }

    @Provides
    @Singleton
    fun provideBookServicesIntegration(
        @ApplicationContext context: Context,
        apiKeyRepository: APIKeyRepository
    ): BookServicesIntegration {
        return BookServicesIntegration(context, apiKeyRepository)
    }

    @Provides
    @Singleton
    fun provideIntegrationManager(
        @ApplicationContext context: Context,
        plexService: PlexIntegrationService,
        calibreService: CalibreIntegrationService,
        cloudService: CloudStorageService,
        bookServices: BookServicesIntegration
    ): IntegrationManager {
        return IntegrationManager(context, plexService, calibreService, cloudService, bookServices)
    }

    @Provides
    @Singleton
    fun provideComprehensiveVideoService(
        @ApplicationContext context: Context
    ): ComprehensiveVideoService {
        return ComprehensiveVideoService(context)
    }
}