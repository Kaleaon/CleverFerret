package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
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
import com.universalmedialibrary.services.media.MediaSessionManager
import com.universalmedialibrary.services.media.MediaController
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
    fun provideAppDatabase(
        @ApplicationContext context: Context
    ): AppDatabase {
        return Room.databaseBuilder(
            context.applicationContext,
            AppDatabase::class.java,
            AppDatabase.DATABASE_NAME
        )
        .addMigrations(
            AppDatabase.MIGRATION_1_2,
            AppDatabase.MIGRATION_2_3,
            AppDatabase.MIGRATION_3_4,
            AppDatabase.MIGRATION_4_5,
            AppDatabase.MIGRATION_5_6
        )
        .build()
    }
    
    // Legacy DAOs for existing content creation functionality
    @Provides
    fun provideDownloadedStoryDao(database: AppDatabase): DownloadedStoryDao {
        return database.downloadedStoryDao()
    }
    
    @Provides
    fun provideStoryUpdateDao(database: AppDatabase): StoryUpdateDao {
        return database.storyUpdateDao()
    }
    
    // Universal Media Library DAOs
    @Provides
    fun provideLibraryDao(database: AppDatabase): LibraryDao {
        return database.libraryDao()
    }
    
    @Provides
    fun provideMediaItemDao(database: AppDatabase): MediaItemDao {
        return database.mediaItemDao()
    }
    
    @Provides
    fun provideMetadataDao(database: AppDatabase): MetadataDao {
        return database.metadataDao()
    }
    
    @Provides
    fun provideAPIKeyDao(database: AppDatabase): APIKeyDao {
        return database.apiKeyDao()
    }
    
    @Provides
    fun provideBookmarkDao(database: AppDatabase): BookmarkDao {
        return database.bookmarkDao()
    }
    
    @Provides 
    fun provideReaderSettingsDao(database: AppDatabase): ReaderSettingsDao {
        return database.readerSettingsDao()
    }
    
    @Provides
    fun provideAnnotationDao(database: AppDatabase): AnnotationDao {
        return database.annotationDao()
    }
    
    @Provides
    fun provideSearchIndexDao(database: AppDatabase): SearchIndexDao {
        return database.searchIndexDao()
    }
    
    @Provides
    fun provideReadingStatisticsDao(database: AppDatabase): ReadingStatisticsDao {
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
        exoPlayerService: ExoPlayerService,
        mediaController: MediaController
    ): AudiobookService {
        return AudiobookService(context, mediaRepository, exoPlayerService, mediaController)
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
        database: AppDatabase
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
        musicMetadataService: com.universalmedialibrary.services.music.MusicMetadataService,
        mediaController: MediaController
    ): com.universalmedialibrary.services.music.AdvancedMusicPlayerService {
        return com.universalmedialibrary.services.music.AdvancedMusicPlayerService(
            context, 
            exoPlayerService, 
            musicMetadataService,
            mediaController
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
    

    // Plex Integration Services
    @Provides
    fun providePlexServerDao(database: AppDatabase): com.universalmedialibrary.data.local.dao.PlexServerDao {
        return database.plexServerDao()
    }
    
    @Provides
    fun providePlexMediaItemDao(database: AppDatabase): com.universalmedialibrary.data.local.dao.PlexMediaItemDao {
        return database.plexMediaItemDao()
    }
    
    @Provides
    fun providePlexSyncDao(database: AppDatabase): com.universalmedialibrary.data.local.dao.PlexSyncDao {
        return database.plexSyncDao()
    }
    
    @Provides
    @Singleton
    fun providePlexSyncService(
        @ApplicationContext context: Context,
        plexServerDao: com.universalmedialibrary.data.local.dao.PlexServerDao,
        plexMediaItemDao: com.universalmedialibrary.data.local.dao.PlexMediaItemDao,
        plexSyncDao: com.universalmedialibrary.data.local.dao.PlexSyncDao
    ): com.universalmedialibrary.services.plex.PlexSyncService {
        return com.universalmedialibrary.services.plex.PlexSyncService(
            context,
            plexServerDao,
            plexMediaItemDao,
            plexSyncDao
        )


    // MediaSession and Notification Services
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

    // Widget Services
    @Provides
    @Singleton
    fun provideMediaPlaybackWidgetService(
        @ApplicationContext context: Context,
        universalMediaPlayerService: UniversalMediaPlayerService
    ): com.universalmedialibrary.widgets.MediaPlaybackWidgetService {
        return com.universalmedialibrary.widgets.MediaPlaybackWidgetService(
            context,
            universalMediaPlayerService
        )


    }

    // eBook Reader Services
    @Provides
    @Singleton
    fun provideReaderEngineFactory(
        epubReaderEngine: com.universalmedialibrary.services.epub.EpubReaderEngine,
        pdfReaderEngine: com.universalmedialibrary.services.reader.PdfReaderEngine,
        comicReaderEngine: com.universalmedialibrary.services.reader.ComicReaderEngine
    ): com.universalmedialibrary.services.reader.ReaderEngineFactory {
        return com.universalmedialibrary.services.reader.ReaderEngineFactory(
            epubReaderEngine,
            pdfReaderEngine,
            comicReaderEngine
        )
    }

    @Provides
    @Singleton
    fun provideEpubReaderEngine(
        @ApplicationContext context: Context
    ): com.universalmedialibrary.services.epub.EpubReaderEngine {
        return com.universalmedialibrary.services.epub.EpubReaderEngine(context)
    }

    @Provides
    @Singleton
    fun providePdfReaderEngine(): com.universalmedialibrary.services.reader.PdfReaderEngine {
        return com.universalmedialibrary.services.reader.PdfReaderEngine()
    }

    @Provides
    @Singleton
    fun provideComicReaderEngine(): com.universalmedialibrary.services.reader.ComicReaderEngine {
        return com.universalmedialibrary.services.reader.ComicReaderEngine()
    }

    @Provides
    @Singleton
    fun provideEnhancedUniversalReaderService(
        @ApplicationContext context: Context,
        readerEngineFactory: com.universalmedialibrary.services.reader.ReaderEngineFactory,
        bookmarkDao: BookmarkDao
    ): com.universalmedialibrary.services.reader.EnhancedUniversalReaderService {
        return com.universalmedialibrary.services.reader.EnhancedUniversalReaderService(
            context,
            readerEngineFactory,
            bookmarkDao
        )
    }
}
}