package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.services.StorageAccessService
// Temporarily disabled imports for removed DAOs
// import com.universalmedialibrary.data.local.dao.APIKeyDao
// import com.universalmedialibrary.data.local.dao.BookmarkDao
// import com.universalmedialibrary.data.local.dao.MetadataDao
// import com.universalmedialibrary.data.repository.APIKeyRepository
// import com.universalmedialibrary.services.tts.CoquiTTSService
// import com.universalmedialibrary.services.metadata.MetadataApiService
// import com.universalmedialibrary.services.metadata.ComprehensiveMetadataService
// import com.universalmedialibrary.services.metadata.RealMetadataService
// import com.universalmedialibrary.services.integration.IntegrationManager
// import com.universalmedialibrary.services.integration.plex.PlexIntegrationService
// import com.universalmedialibrary.services.integration.calibre.CalibreIntegrationService
// import com.universalmedialibrary.services.integration.cloud.CloudStorageService
// import com.universalmedialibrary.services.integration.books.BookServicesIntegration
// import com.universalmedialibrary.services.analysis.SmartContentAnalyzer
// import com.universalmedialibrary.services.video.ComprehensiveVideoService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object ServicesModule {

    // Database providers are now handled by DatabaseModule
    // @Provides
    // @Singleton 
    // fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase = ...

    // These providers are temporarily disabled until DAOs are restored
    // @Provides
    // @Singleton
    // fun provideAPIKeyDao(database: AppDatabase): APIKeyDao = database.apiKeyDao()

    // @Provides
    // @Singleton
    // fun provideMetadataDao(database: AppDatabase): MetadataDao = database.metadataDao()
    
    // @Provides
    // @Singleton
    // fun provideBookmarkDao(database: AppDatabase): BookmarkDao = database.bookmarkDao()
    
    // @Provides
    // @Singleton
    // fun provideStorageAccessService(
    //     libraryDao: LibraryDao,
    //     mediaItemDao: MediaItemDao,
    //     metadataDao: MetadataDao
    // ): StorageAccessService = StorageAccessService(libraryDao, mediaItemDao, metadataDao)

    // Temporarily disabled until dependencies are resolved
    // All service providers commented out for minimal build
    
    // @Provides
    // @Singleton
    // fun provideAPIKeyRepository(apiKeyDao: APIKeyDao): APIKeyRepository = APIKeyRepository(apiKeyDao)

    // @Provides
    // @Singleton
    // fun provideCoquiTTSService(@ApplicationContext context: Context): CoquiTTSService = CoquiTTSService(context)

    // All other service providers temporarily disabled...
    // Will be restored once DAOs are working

}