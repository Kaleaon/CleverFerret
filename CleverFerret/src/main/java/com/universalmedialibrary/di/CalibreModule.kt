package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.dao.AudiobookDao
import com.universalmedialibrary.data.local.dao.FanfictionDao
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.ai.GrokAnalysisService
import com.universalmedialibrary.services.ai.TranslationService
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.comic.ComicInfoHandler
import com.universalmedialibrary.services.comic.ComicvineMetadataSource
import com.universalmedialibrary.services.epub.EpubCreatorService
import com.universalmedialibrary.services.epub.EpubMergeService
import com.universalmedialibrary.services.epub.EpubSplitService
import com.universalmedialibrary.services.epub.EpubValidationService
import com.universalmedialibrary.services.fanfiction.FanfictionDownloadService
import com.universalmedialibrary.services.metadata.MetadataService
import com.universalmedialibrary.services.metadata.covers.AmazonCoverSource
import com.universalmedialibrary.services.metadata.covers.AppleBooksCoverSource
import com.universalmedialibrary.services.metadata.covers.CoverService
import com.universalmedialibrary.services.metadata.covers.GoogleBooksCoverSource
import com.universalmedialibrary.services.metadata.sources.GoodreadsMetadataSource
import com.universalmedialibrary.services.metadata.sources.MetadataSource
import com.universalmedialibrary.services.metadata.sources.OpenLibraryMetadataSource
import com.universalmedialibrary.services.organization.DuplicateDetectionService
import com.universalmedialibrary.services.organization.SeriesManagementService
import dagger.Binds
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import dagger.multibindings.IntoSet
import okhttp3.OkHttpClient
import javax.inject.Singleton

/**
 * Hilt module for Calibre plugin features
 * Provides all services for fanfiction, covers, metadata, comics, audiobooks, organization, and AI
 */
@Module
@InstallIn(SingletonComponent::class)
object CalibreModule {
    
    // ========== Fanfiction Services ==========
    
    @Provides
    @Singleton
    fun provideFanfictionDownloadService(
        @ApplicationContext context: Context,
        httpClient: OkHttpClient,
        epubCreator: EpubCreatorService,
        fanfictionDao: FanfictionDao
    ): FanfictionDownloadService {
        return FanfictionDownloadService(context, httpClient, epubCreator, fanfictionDao)
    }
    
    @Provides
    @Singleton
    fun provideEpubCreatorService(): EpubCreatorService {
        return EpubCreatorService()
    }
    
    // ========== EPUB Tools ==========
    
    @Provides
    @Singleton
    fun provideEpubMergeService(
        @ApplicationContext context: Context,
        epubCreator: EpubCreatorService
    ): EpubMergeService {
        return EpubMergeService(context, epubCreator)
    }
    
    @Provides
    @Singleton
    fun provideEpubSplitService(
        @ApplicationContext context: Context,
        epubCreator: EpubCreatorService
    ): EpubSplitService {
        return EpubSplitService(context, epubCreator)
    }
    
    @Provides
    @Singleton
    fun provideEpubValidationService(): EpubValidationService {
        return EpubValidationService()
    }
    
    // ========== Audiobook Services ==========
    
    @Provides
    @Singleton
    fun provideAudiobookService(
        @ApplicationContext context: Context,
        audiobookDao: AudiobookDao
    ): AudiobookService {
        return AudiobookService(context, audiobookDao)
    }
    
    // ========== Cover Services ==========
    
    @Provides
    @Singleton
    fun provideAppleBooksCoverSource(
        httpClient: OkHttpClient
    ): AppleBooksCoverSource {
        return AppleBooksCoverSource(httpClient)
    }
    
    @Provides
    @Singleton
    fun provideAmazonCoverSource(
        httpClient: OkHttpClient
    ): AmazonCoverSource {
        return AmazonCoverSource(httpClient)
    }
    
    @Provides
    @Singleton
    fun provideGoogleBooksCoverSource(
        httpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): GoogleBooksCoverSource {
        return GoogleBooksCoverSource(httpClient, apiKeyRepository)
    }
    
    @Provides
    @Singleton
    fun provideCoverService(
        @ApplicationContext context: Context,
        appleBooksCoverSource: AppleBooksCoverSource,
        amazonCoverSource: AmazonCoverSource,
        googleBooksCoverSource: GoogleBooksCoverSource
    ): CoverService {
        return CoverService(context, appleBooksCoverSource, amazonCoverSource, googleBooksCoverSource)
    }
    
    // ========== Metadata Service ==========
    
    @Provides
    @Singleton
    fun provideMetadataService(
        metadataSources: Set<@JvmSuppressWildcards MetadataSource>
    ): MetadataService {
        return MetadataService(metadataSources)
    }
    
    // ========== Comic Services ==========
    
    @Provides
    @Singleton
    fun provideComicInfoHandler(): ComicInfoHandler {
        return ComicInfoHandler()
    }
    
    @Provides
    @Singleton
    fun provideComicvineMetadataSource(
        httpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): ComicvineMetadataSource {
        return ComicvineMetadataSource(httpClient, apiKeyRepository)
    }
    
    // ========== Organization Services ==========
    
    @Provides
    @Singleton
    fun provideDuplicateDetectionService(): DuplicateDetectionService {
        return DuplicateDetectionService()
    }
    
    @Provides
    @Singleton
    fun provideSeriesManagementService(
        mediaItemDao: com.universalmedialibrary.data.local.dao.MediaItemDao
    ): SeriesManagementService {
        return SeriesManagementService(mediaItemDao)
    }
    
    // ========== AI Services ==========
    
    @Provides
    @Singleton
    fun provideTranslationService(
        httpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): TranslationService {
        return TranslationService(httpClient, apiKeyRepository)
    }
    
    @Provides
    @Singleton
    fun provideGrokAnalysisService(
        httpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): GrokAnalysisService {
        return GrokAnalysisService(httpClient, apiKeyRepository)
    }
}

/**
 * Module for binding metadata sources into a set for parallel searching
 */
@Module
@InstallIn(SingletonComponent::class)
abstract class MetadataSourcesModule {
    
    @Binds
    @IntoSet
    abstract fun bindGoodreads(impl: GoodreadsMetadataSource): MetadataSource
    
    @Binds
    @IntoSet
    abstract fun bindOpenLibrary(impl: OpenLibraryMetadataSource): MetadataSource
}
