package com.universalmedialibrary.di

import dagger.Binds
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton
import com.universalmedialibrary.services.search.*
import com.universalmedialibrary.services.search.engine.*
import com.universalmedialibrary.services.tagging.UniversalTagManager
import com.universalmedialibrary.services.relationships.ContentRelationshipService
import com.universalmedialibrary.services.ai.*
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.UniversalMediaLibraryDatabase

/**
 * Dependency Injection module for Universal Search and Tagging System.
 * Provides all the services and dependencies for the universal system.
 */
@Module
@InstallIn(SingletonComponent::class)
abstract class UniversalSystemModule {
    
    // ========== Bind Search Engines ==========
    
    @Binds
    @Singleton
    abstract fun bindBookSearchEngine(bookSearchEngine: BookSearchEngine): MediaSearchEngine
    
    @Binds
    @Singleton
    abstract fun bindAudioSearchEngine(audioSearchEngine: AudioSearchEngine): MediaSearchEngine
    
    @Binds
    @Singleton
    abstract fun bindVideoSearchEngine(videoSearchEngine: VideoSearchEngine): MediaSearchEngine
    
    @Binds
    @Singleton
    abstract fun bindDocumentSearchEngine(documentSearchEngine: DocumentSearchEngine): MediaSearchEngine
    
    // ========== Bind LLM Providers ==========
    
    @Binds
    @Singleton
    abstract fun bindOpenAIProvider(openAIProvider: OpenAIProvider): LLMProvider
    
    @Binds
    @Singleton
    abstract fun bindGeminiProvider(geminiProvider: GeminiProvider): LLMProvider
    
    @Binds
    @Singleton
    abstract fun bindOllamaProvider(ollamaProvider: OllamaProvider): LLMProvider
    
    companion object {
        
        // ========== Database DAOs ==========
        
        @Provides
        @Singleton
        fun provideUniversalTagDao(database: UniversalMediaLibraryDatabase): UniversalTagDao {
            return database.universalTagDao()
        }
        
        @Provides
        @Singleton
        fun provideMediaTagRelationDao(database: UniversalMediaLibraryDatabase): MediaTagRelationDao {
            return database.mediaTagRelationDao()
        }
        
        @Provides
        @Singleton
        fun provideSearchHistoryDao(database: UniversalMediaLibraryDatabase): SearchHistoryDao {
            return database.searchHistoryDao()
        }
        
        @Provides
        @Singleton
        fun provideContentRelationshipDao(database: UniversalMediaLibraryDatabase): ContentRelationshipDao {
            return database.contentRelationshipDao()
        }
        
        // ========== Universal Services ==========
        
        @Provides
        @Singleton
        fun provideUniversalTagManager(
            universalTagDao: UniversalTagDao,
            mediaTagRelationDao: MediaTagRelationDao,
            aiService: AIContentAnalysisService
        ): UniversalTagManager {
            return UniversalTagManager(universalTagDao, mediaTagRelationDao, aiService)
        }
        
        @Provides
        @Singleton
        fun provideUniversalSearchService(
            searchHistoryDao: SearchHistoryDao,
            mediaTagRelationDao: MediaTagRelationDao,
            contentRelationshipDao: ContentRelationshipDao,
            tagManager: UniversalTagManager,
            bookSearchEngine: BookSearchEngine,
            audioSearchEngine: AudioSearchEngine,
            videoSearchEngine: VideoSearchEngine,
            documentSearchEngine: DocumentSearchEngine
        ): UniversalSearchService {
            return UniversalSearchService(
                searchHistoryDao,
                mediaTagRelationDao,
                contentRelationshipDao,
                tagManager,
                bookSearchEngine,
                audioSearchEngine,
                videoSearchEngine,
                documentSearchEngine
            )
        }
        
        @Provides
        @Singleton
        fun provideContentRelationshipService(
            contentRelationshipDao: ContentRelationshipDao,
            universalTagDao: UniversalTagDao,
            mediaTagRelationDao: MediaTagRelationDao,
            aiService: AIContentAnalysisService
        ): ContentRelationshipService {
            return ContentRelationshipService(
                contentRelationshipDao,
                universalTagDao,
                mediaTagRelationDao,
                aiService
            )
        }
        
        @Provides
        @Singleton
        fun provideAIContentAnalysisService(
            openAIProvider: OpenAIProvider,
            geminiProvider: GeminiProvider,
            ollamaProvider: OllamaProvider,
            localEmbeddingProvider: LocalEmbeddingProvider
        ): AIContentAnalysisService {
            return AIContentAnalysisService(
                openAIProvider,
                geminiProvider,
                ollamaProvider,
                localEmbeddingProvider
            )
        }
        
        // ========== AI Clients ==========
        
        @Provides
        @Singleton
        fun provideOpenAIClient(): OpenAIClient {
            // In a real implementation, get API key from secure storage
            val apiKey = "your-openai-api-key-here"
            return OpenAIClient(apiKey)
        }
        
        @Provides
        @Singleton
        fun provideGeminiClient(): GeminiClient {
            // In a real implementation, get API key from secure storage
            val apiKey = "your-gemini-api-key-here"
            return GeminiClient(apiKey)
        }
        
        @Provides
        @Singleton
        fun provideOllamaClient(): OllamaClient {
            return OllamaClient()
        }
        
        @Provides
        @Singleton
        fun provideLocalEmbeddingProvider(): LocalEmbeddingProvider {
            return LocalEmbeddingProvider(LocalEmbeddingModel())
        }
        
        // ========== Search Engine Implementations ==========
        
        @Provides
        @Singleton
        fun provideBookSearchEngine(
            mediaTagRelationDao: MediaTagRelationDao,
            universalTagDao: UniversalTagDao
        ): BookSearchEngine {
            return BookSearchEngine(mediaTagRelationDao, universalTagDao)
        }
        
        @Provides
        @Singleton
        fun provideAudioSearchEngine(): AudioSearchEngine {
            return AudioSearchEngine()
        }
        
        @Provides
        @Singleton
        fun provideVideoSearchEngine(): VideoSearchEngine {
            return VideoSearchEngine()
        }
        
        @Provides
        @Singleton
        fun provideDocumentSearchEngine(): DocumentSearchEngine {
            return DocumentSearchEngine()
        }
        
        // ========== LLM Provider Implementations ==========
        
        @Provides
        @Singleton
        fun provideOpenAIProvider(openAIClient: OpenAIClient): OpenAIProvider {
            return OpenAIProvider(openAIClient)
        }
        
        @Provides
        @Singleton
        fun provideGeminiProvider(geminiClient: GeminiClient): GeminiProvider {
            return GeminiProvider(geminiClient)
        }
        
        @Provides
        @Singleton
        fun provideOllamaProvider(ollamaClient: OllamaClient): OllamaProvider {
            return OllamaProvider(ollamaClient)
        }
    }
}