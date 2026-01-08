package com.universalmedialibrary.di

import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.data.repository.UnifiedCollectionRepository
import com.universalmedialibrary.services.collections.SmartCollectionEngine
import com.universalmedialibrary.services.search.*
import com.universalmedialibrary.services.suggestions.AutoSuggestionService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for Universal Tagging and Search system dependencies
 *
 * Provides:
 * - SmartCollectionEngine for auto-suggested collections
 * - UniversalSearchEngine for cross-media search
 * - AutoSuggestionService for intelligent suggestions
 * - Media-type specific search engines
 * - UniversalSearchService for unified search across media types
 */
@Module
@InstallIn(SingletonComponent::class)
object UniversalTagSearchModule {

    @Provides
    @Singleton
    fun provideSmartCollectionEngine(
        smartCollectionDao: SmartCollectionDao,
        collectionRepository: UnifiedCollectionRepository
    ): SmartCollectionEngine {
        return SmartCollectionEngine(smartCollectionDao, collectionRepository)
    }

    @Provides
    @Singleton
    fun provideUniversalSearchEngine(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao,
        tagRepository: TagRepository,
        tagHierarchyDao: TagHierarchyDao,
        searchHistoryDao: SearchHistoryDao
    ): UniversalSearchEngine {
        return UniversalSearchEngine(
            mediaItemDao,
            metadataDao,
            tagRepository,
            tagHierarchyDao,
            searchHistoryDao
        )
    }

    @Provides
    @Singleton
    fun provideAutoSuggestionService(
        smartCollectionEngine: SmartCollectionEngine,
        tagRepository: TagRepository,
        tagHierarchyDao: TagHierarchyDao,
        smartCollectionDao: SmartCollectionDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): AutoSuggestionService {
        return AutoSuggestionService(
            smartCollectionEngine,
            tagRepository,
            tagHierarchyDao,
            smartCollectionDao,
            mediaItemDao,
            metadataDao
        )
    }
    
    // Search engines for different media types
    
    @Provides
    @Singleton
    fun provideBookSearchEngine(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): BookSearchEngine {
        return BookSearchEngine(mediaItemDao, metadataDao)
    }
    
    @Provides
    @Singleton
    fun provideAudioSearchEngine(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): AudioSearchEngine {
        return AudioSearchEngine(mediaItemDao, metadataDao)
    }
    
    @Provides
    @Singleton
    fun provideVideoSearchEngine(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): VideoSearchEngine {
        return VideoSearchEngine(mediaItemDao, metadataDao)
    }
    
    @Provides
    @Singleton
    fun provideDocumentSearchEngine(
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao
    ): DocumentSearchEngine {
        return DocumentSearchEngine(mediaItemDao, metadataDao)
    }
    
    @Provides
    @Singleton
    fun provideUniversalSearchService(
        bookSearchEngine: BookSearchEngine,
        audioSearchEngine: AudioSearchEngine,
        videoSearchEngine: VideoSearchEngine,
        documentSearchEngine: DocumentSearchEngine,
        searchHistoryManager: SearchHistoryManager
    ): UniversalSearchService {
        return UniversalSearchService(
            bookSearchEngine,
            audioSearchEngine,
            videoSearchEngine,
            documentSearchEngine,
            searchHistoryManager
        )
    }
}
