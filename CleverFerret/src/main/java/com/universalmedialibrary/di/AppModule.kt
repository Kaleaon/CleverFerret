package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.CleverFerretDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.contentcreation.FanfictionToEpubConverter
import com.universalmedialibrary.services.contentcreation.NewsToEpubConverter
import com.universalmedialibrary.services.contentcreation.StoryUpdateManager
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
import com.universalmedialibrary.services.audiobook.SynchronizedReadingService
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.reader.AnnotationService
import com.universalmedialibrary.data.repository.ReaderSettingsRepository
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Main Hilt module for dependency injection
 * Provides database and service dependencies for the Universal Media Library
 */
@Module
@InstallIn(SingletonComponent::class)
object AppModule {
    
    @Provides
    @Singleton
    fun provideCleverFerretDatabase(
        @ApplicationContext context: Context
    ): CleverFerretDatabase {
        return Room.databaseBuilder(
            context.applicationContext,
            CleverFerretDatabase::class.java,
            CleverFerretDatabase.DATABASE_NAME
        )
        // TODO: Add proper migration objects below to handle schema changes safely
        // .addMigrations(MIGRATION_1_2, MIGRATION_2_3, ...) // Example usage
        .build()
    }
    
    // Legacy DAOs for existing content creation functionality
    @Provides
    fun provideDownloadedStoryDao(database: CleverFerretDatabase): DownloadedStoryDao {
        return database.downloadedStoryDao()
    }
    
    @Provides
    fun provideStoryUpdateDao(database: CleverFerretDatabase): StoryUpdateDao {
        return database.storyUpdateDao()
    }
    
    // Universal Media Library DAOs
    @Provides
    fun provideLibraryDao(database: CleverFerretDatabase): LibraryDao {
        return database.libraryDao()
    }
    
    @Provides
    fun provideMediaItemDao(database: CleverFerretDatabase): MediaItemDao {
        return database.mediaItemDao()
    }
    
    @Provides
    fun provideMetadataDao(database: CleverFerretDatabase): MetadataDao {
        return database.metadataDao()
    }
    
    @Provides
    fun provideAPIKeyDao(database: CleverFerretDatabase): APIKeyDao {
        return database.apiKeyDao()
    }
    
    @Provides
    fun provideBookmarkDao(database: CleverFerretDatabase): BookmarkDao {
        return database.bookmarkDao()
    }
    
    @Provides 
    fun provideReaderSettingsDao(database: CleverFerretDatabase): ReaderSettingsDao {
        return database.readerSettingsDao()
    }
    
    @Provides
    fun provideAnnotationDao(database: CleverFerretDatabase): AnnotationDao {
        return database.annotationDao()
    }
    
    @Provides
    fun provideSearchIndexDao(database: CleverFerretDatabase): SearchIndexDao {
        return database.searchIndexDao()
    }
    
    @Provides
    fun provideReadingStatisticsDao(database: CleverFerretDatabase): ReadingStatisticsDao {
        return database.readingStatisticsDao()
    }
    
    // Repositories
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
    
    // Universal Media Services
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
    fun provideUniversalReaderService(
        @ApplicationContext context: Context,
        mediaRepository: MediaRepository,
        epubReaderService: EpubReaderService
    ): UniversalReaderService {
        return UniversalReaderService(context, mediaRepository, epubReaderService)
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
    fun provideReaderSettingsRepository(
        readerSettingsDao: ReaderSettingsDao
    ): ReaderSettingsRepository {
        return ReaderSettingsRepository(readerSettingsDao)
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
    fun provideAPIKeyRepository(
        apiKeyDao: APIKeyDao
    ): APIKeyRepository {
        return APIKeyRepository(apiKeyDao)
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
    fun provideExoPlayerService(
        @ApplicationContext context: Context
    ): ExoPlayerService {
        return ExoPlayerService(context)
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
    fun provideAnnotationService(
        @ApplicationContext context: Context,
        annotationDao: AnnotationDao,
        searchIndexDao: SearchIndexDao,
        readingStatisticsDao: ReadingStatisticsDao
    ): AnnotationService {
        return AnnotationService(context, annotationDao, searchIndexDao, readingStatisticsDao)
    }
    
    @Provides
    @Singleton
    fun provideAudiobookService(
        @ApplicationContext context: Context,
        mediaRepository: MediaRepository,
        exoPlayerService: ExoPlayerService
    ): AudiobookService {
        return AudiobookService(context, mediaRepository, exoPlayerService)
    }
    
    @Provides
    @Singleton
    fun provideSynchronizedReadingService(
        @ApplicationContext context: Context,
        epubReaderService: EpubReaderService,
        geminiService: GeminiService
    ): SynchronizedReadingService {
        return SynchronizedReadingService(context, epubReaderService, geminiService)
    }
    
    // Legacy services for content creation
    @Provides
    @Singleton
    fun provideStoryUpdateManager(
        @ApplicationContext context: Context,
        database: CleverFerretDatabase
    ): StoryUpdateManager {
        return StoryUpdateManager(context, database)
    }
    
    @Provides
    @Singleton
    fun provideNewsToEpubConverter(
        @ApplicationContext context: Context
    ): NewsToEpubConverter {
        return NewsToEpubConverter(context)
    }
    
    // Advanced Music Services
    @Provides
    @Singleton
    fun provideMusicMetadataService(
        @ApplicationContext context: Context,
        apiKeyRepository: APIKeyRepository
    ): com.universalmedialibrary.services.music.MusicMetadataService {
        return com.universalmedialibrary.services.music.MusicMetadataService(context, apiKeyRepository)
    }
    
    @Provides
    @Singleton
    fun provideAdvancedMusicPlayerService(
        @ApplicationContext context: Context,
        exoPlayerService: ExoPlayerService,
        musicMetadataService: com.universalmedialibrary.services.music.MusicMetadataService
    ): com.universalmedialibrary.services.music.AdvancedMusicPlayerService {
        return com.universalmedialibrary.services.music.AdvancedMusicPlayerService(
            context, 
            exoPlayerService, 
            musicMetadataService
        )
    }
    
    // Advanced Podcast Services
    @Provides
    @Singleton
    fun provideAdvancedPodcastPlayerService(
        @ApplicationContext context: Context,
        exoPlayerService: ExoPlayerService,
        podcastService: PodcastService
    ): com.universalmedialibrary.services.podcast.AdvancedPodcastPlayerService {
        return com.universalmedialibrary.services.podcast.AdvancedPodcastPlayerService(
            context,
            exoPlayerService,
            podcastService
        )
    }
}