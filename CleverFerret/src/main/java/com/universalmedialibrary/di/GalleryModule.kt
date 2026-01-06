package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.dao.UnifiedTagDao
import com.universalmedialibrary.services.gallery.GalleryManager
import com.universalmedialibrary.services.gallery.GalleryPreferencesStore
import com.universalmedialibrary.services.gallery.GalleryRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for Gallery feature dependencies
 * 
 * Provides gallery-related services including:
 * - GalleryManager: MediaStore access and caching
 * - GalleryRepository: Unified gallery operations
 * - GalleryPreferencesStore: User preferences and metadata persistence
 */
@Module
@InstallIn(SingletonComponent::class)
object GalleryModule {
    
    @Provides
    @Singleton
    fun provideGalleryManager(
        @ApplicationContext context: Context
    ): GalleryManager {
        return GalleryManager(context)
    }
    
    @Provides
    @Singleton
    fun provideGalleryPreferencesStore(
        @ApplicationContext context: Context
    ): GalleryPreferencesStore {
        return GalleryPreferencesStore(context)
    }
    
    @Provides
    @Singleton
    fun provideGalleryRepository(
        @ApplicationContext context: Context,
        galleryManager: GalleryManager,
        unifiedTagDao: UnifiedTagDao,
        preferencesStore: GalleryPreferencesStore
    ): GalleryRepository {
        return GalleryRepository(
            context = context,
            galleryManager = galleryManager,
            unifiedTagDao = unifiedTagDao,
            galleryPreferencesStore = preferencesStore
        )
    }
}
