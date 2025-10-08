package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.repository.StoryRepository
import com.universalmedialibrary.services.podcast.PodcastService
import com.universalmedialibrary.services.contentcreation.FanfictionToEpubConverter
import com.universalmedialibrary.services.contentcreation.StoryUpdateManager
import com.universalmedialibrary.services.webfiction.RedditFanficDownloader
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
    fun provideStorageAccessService(
        libraryDao: LibraryDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): StorageAccessService = StorageAccessService(libraryDao, mediaItemDao, metadataDao)

    @Provides
    @Singleton
    fun provideAPIKeyRepository(apiKeyDao: APIKeyDao): APIKeyRepository = APIKeyRepository(apiKeyDao)

    @Provides
    @Singleton
    fun provideStoryUpdateManager(
        storyRepository: StoryRepository
    ): StoryUpdateManager = StoryUpdateManager(storyRepository)

    @Provides
    @Singleton
    fun providePodcastService(
        @ApplicationContext context: Context,
        podcastRepository: com.universalmedialibrary.data.repository.podcast.PodcastRepository
    ): PodcastService = PodcastService(context, podcastRepository)

    @Provides
    @Singleton
    fun provideFanfictionToEpubConverter(
        @ApplicationContext context: Context,
        updateManager: StoryUpdateManager
    ): FanfictionToEpubConverter = FanfictionToEpubConverter(context, updateManager)

    @Provides
    @Singleton
    fun provideRedditFanficDownloader(): RedditFanficDownloader = RedditFanficDownloader()
}
