package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.media.MediaScanningService
import com.universalmedialibrary.services.media.MetadataExtractionService
import com.universalmedialibrary.services.media.UniversalMediaPlayerService
import com.universalmedialibrary.services.media.UniversalReaderService
import com.universalmedialibrary.services.epub.EpubReaderService
import com.universalmedialibrary.services.tts.TextToSpeechService
import com.universalmedialibrary.services.tts.AndroidTextToSpeechService
import com.universalmedialibrary.services.gemini.GeminiService
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.media.MediaSessionManager
import com.universalmedialibrary.services.media.MediaController
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Minimal Hilt module for dependency injection - core services only
 * Provides essential database and service dependencies for the Universal Media Library
 */
@Module
@InstallIn(SingletonComponent::class)
object AppModule {
    
    // Repositories - using DatabaseModule for core DAOs
    @Provides
    @Singleton
    fun provideLibraryRepository(libraryDao: LibraryDao): LibraryRepository {
        return LibraryRepository(libraryDao)
    }
    
    @Provides
    @Singleton
    fun provideMediaRepository(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): MediaRepository {
        return MediaRepository(mediaItemDao, metadataDao)
    }
    
    @Provides
    @Singleton
    fun provideAPIKeyRepository(
        apiKeyDao: APIKeyDao
    ): APIKeyRepository {
        return APIKeyRepository(apiKeyDao)
    }
    
    // Core Media Services
    @Provides
    @Singleton
    fun provideMediaScanningService(
        @ApplicationContext context: Context,
        libraryRepository: LibraryRepository,
        mediaRepository: MediaRepository
    ): MediaScanningService {
        return MediaScanningService(context, libraryRepository, mediaRepository)
    }
    
    @Provides
    @Singleton
    fun provideMetadataExtractionService(
        @ApplicationContext context: Context,
        mediaRepository: MediaRepository
    ): MetadataExtractionService {
        return MetadataExtractionService(context, mediaRepository)
    }
    
    @Provides
    @Singleton
    fun provideUniversalMediaPlayerService(
        @ApplicationContext context: Context
    ): UniversalMediaPlayerService {
        return UniversalMediaPlayerService(context)
    }
    
    @Provides
    @Singleton
    fun provideEpubReaderService(
        @ApplicationContext context: Context
    ): EpubReaderService {
        return EpubReaderService(context)
    }
    
    @Provides
    @Singleton
    fun provideUniversalReaderService(
        @ApplicationContext context: Context,
        mediaRepository: MediaRepository,
        epubReaderService: EpubReaderService
    ): UniversalReaderService {
        return UniversalReaderService(context, mediaRepository, epubReaderService)
    }
    
    @Provides
    @Singleton
    fun provideTextToSpeechService(
        @ApplicationContext context: Context
    ): TextToSpeechService {
        return AndroidTextToSpeechService(context)
    }
    
    @Provides
    @Singleton
    fun provideGeminiService(
        @ApplicationContext context: Context,
        apiKeyRepository: APIKeyRepository
    ): GeminiService {
        return GeminiService(context, apiKeyRepository)
    }
    
    @Provides
    @Singleton
    fun provideMediaSessionManager(
        @ApplicationContext context: Context
    ): MediaSessionManager {
        return MediaSessionManager(context)
    }
    
    @Provides
    @Singleton
    fun provideMediaController(
        @ApplicationContext context: Context,
        mediaSessionManager: MediaSessionManager
    ): MediaController {
        return MediaController(context, mediaSessionManager)
    }
    
    @Provides
    @Singleton
    fun provideExoPlayerService(
        @ApplicationContext context: Context,
        mediaController: MediaController
    ): ExoPlayerService {
        return ExoPlayerService(context, mediaController)
    }
    
    @Provides
    @Singleton
    fun providePodcastService(
        @ApplicationContext context: Context
    ): PodcastService {
        return PodcastService(context)
    }
    
    @Provides
    @Singleton
    fun provideAudiobookService(
        @ApplicationContext context: Context,
        mediaRepository: MediaRepository,
        exoPlayerService: ExoPlayerService,
        mediaController: MediaController
    ): AudiobookService {
        return AudiobookService(context, mediaRepository, exoPlayerService, mediaController)
    }
}
