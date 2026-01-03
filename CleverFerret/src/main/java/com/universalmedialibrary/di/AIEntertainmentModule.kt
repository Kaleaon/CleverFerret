package com.universalmedialibrary.di

import android.content.Context
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import com.universalmedialibrary.data.aientertainment.*
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.ReadingAnalyticsDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.preferences.AISettingsPreferencesStore
import com.universalmedialibrary.services.aientertainment.*
import com.universalmedialibrary.services.ai.*
import com.universalmedialibrary.services.reading.ReadingAnalyticsService
import javax.inject.Singleton

/**
 * Dagger Hilt module for AI Entertainment (SynthChat) dependencies
 * 
 * This module provides all the DAOs, repositories, and services needed
 * for the SynthChat-style AI Entertainment functionality.
 */
@Module
@InstallIn(SingletonComponent::class)
object AIEntertainmentModule {
    
    // ==================== DAO Providers ====================
    // Note: These would typically come from your Room database
    // You'll need to add these tables to your existing AppDatabase
    
    @Provides
    @Singleton
    fun provideSynthUserDao(database: AIEntertainmentDatabase): SynthUserDao {
        return database.synthUserDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthCharacterDao(database: AIEntertainmentDatabase): SynthCharacterDao {
        return database.synthCharacterDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthMessageDao(database: AIEntertainmentDatabase): SynthMessageDao {
        return database.synthMessageDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthRoomDao(database: AIEntertainmentDatabase): SynthRoomDao {
        return database.synthRoomDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthRoomParticipantDao(database: AIEntertainmentDatabase): SynthRoomParticipantDao {
        return database.synthRoomParticipantDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthRoomInvitationDao(database: AIEntertainmentDatabase): SynthRoomInvitationDao {
        return database.synthRoomInvitationDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthMemoryBranchDao(database: AIEntertainmentDatabase): SynthMemoryBranchDao {
        return database.synthMemoryBranchDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthDocumentImportDao(database: AIEntertainmentDatabase): SynthDocumentImportDao {
        return database.synthDocumentImportDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthPersonalityEventDao(database: AIEntertainmentDatabase): SynthPersonalityEventDao {
        return database.synthPersonalityEventDao()
    }
    
    // ==================== AI Memory DAO Providers ====================
    
    @Provides
    @Singleton
    fun provideSynthMemoryStoreDao(database: AIEntertainmentDatabase): SynthMemoryStoreDao {
        return database.synthMemoryStoreDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthMemoryCategoryDao(database: AIEntertainmentDatabase): SynthMemoryCategoryDao {
        return database.synthMemoryCategoryDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthMemoryDao(database: AIEntertainmentDatabase): SynthMemoryDao {
        return database.synthMemoryDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthMemoryBlockDao(database: AIEntertainmentDatabase): SynthMemoryBlockDao {
        return database.synthMemoryBlockDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthMemorySyncRecordDao(database: AIEntertainmentDatabase): SynthMemorySyncRecordDao {
        return database.synthMemorySyncRecordDao()
    }
    
    @Provides
    @Singleton
    fun provideSynthMemoryAccessLogDao(database: AIEntertainmentDatabase): SynthMemoryAccessLogDao {
        return database.synthMemoryAccessLogDao()
    }
    
    // ==================== Repository Provider ====================
    
    @Provides
    @Singleton
    fun provideAIEntertainmentRepository(
        userDao: SynthUserDao,
        characterDao: SynthCharacterDao,
        messageDao: SynthMessageDao,
        roomDao: SynthRoomDao,
        participantDao: SynthRoomParticipantDao,
        invitationDao: SynthRoomInvitationDao,
        branchDao: SynthMemoryBranchDao,
        documentDao: SynthDocumentImportDao,
        eventDao: SynthPersonalityEventDao,
        // AI Memory DAOs
        memoryStoreDao: SynthMemoryStoreDao,
        memoryCategoryDao: SynthMemoryCategoryDao,
        memoryDao: SynthMemoryDao,
        memoryBlockDao: SynthMemoryBlockDao,
        memorySyncRecordDao: SynthMemorySyncRecordDao,
        memoryAccessLogDao: SynthMemoryAccessLogDao
    ): AIEntertainmentRepository {
        return AIEntertainmentRepository(
            userDao = userDao,
            characterDao = characterDao,
            messageDao = messageDao,
            roomDao = roomDao,
            participantDao = participantDao,
            invitationDao = invitationDao,
            branchDao = branchDao,
            documentDao = documentDao,
            eventDao = eventDao,
            memoryStoreDao = memoryStoreDao,
            memoryCategoryDao = memoryCategoryDao,
            memoryDao = memoryDao,
            memoryBlockDao = memoryBlockDao,
            memorySyncRecordDao = memorySyncRecordDao,
            memoryAccessLogDao = memoryAccessLogDao
        )
    }
    
    // ==================== AI Memory Services ====================
    // NOTE: These are declared early because SynthChatService depends on MCPMemoryService
    
    @Provides
    @Singleton
    fun provideAIMemoryStorageService(
        @ApplicationContext context: Context
    ): AIMemoryStorageService {
        return AIMemoryStorageService(context)
    }
    
    @Provides
    @Singleton
    fun provideMCPMemoryService(
        @ApplicationContext context: Context,
        memoryStorageService: AIMemoryStorageService,
        repository: AIEntertainmentRepository
    ): MCPMemoryService {
        return MCPMemoryService(context, memoryStorageService).apply {
            // Initialize with repository for data access
            initialize(repository)
        }
    }
    
    // ==================== Service Providers ====================
    
    @Provides
    @Singleton
    fun provideSynthAuthService(
        repository: AIEntertainmentRepository,
        @ApplicationContext context: Context
    ): SynthAuthService {
        return SynthAuthService(repository, context)
    }
    
    @Provides
    @Singleton
    fun provideSynthCharacterService(
        repository: AIEntertainmentRepository
    ): SynthCharacterService {
        return SynthCharacterService(repository)
    }
    
    @Provides
    @Singleton
    fun provideSynthChatService(
        repository: AIEntertainmentRepository,
        @ApplicationContext context: Context,
        mcpMemoryService: MCPMemoryService
    ): SynthChatService {
        return SynthChatService(repository, context).apply {
            setMCPMemoryService(mcpMemoryService)
            // Note: AIReadingAgentService should be set separately after initialization
            // to avoid circular dependencies. Use SynthChatService.setAIReadingAgentService()
        }
    }
    
    @Provides
    @Singleton
    fun provideSynthRoomService(
        repository: AIEntertainmentRepository
    ): SynthRoomService {
        return SynthRoomService(repository)
    }
    
    @Provides
    @Singleton
    fun provideSynthMemoryBranchService(
        repository: AIEntertainmentRepository
    ): SynthMemoryBranchService {
        return SynthMemoryBranchService(repository)
    }
    
    @Provides
    @Singleton
    fun provideSynthPersonalityEvolutionService(
        repository: AIEntertainmentRepository
    ): SynthPersonalityEvolutionService {
        return SynthPersonalityEvolutionService(repository)
    }
    
    @Provides
    @Singleton
    fun provideSynthDocumentParserService(
        repository: AIEntertainmentRepository,
        @ApplicationContext context: Context
    ): SynthDocumentParserService {
        return SynthDocumentParserService(repository, context)
    }
    
    // ==================== AI Tools & Services ====================
    
    @Provides
    @Singleton
    fun provideAILogStorageService(
        @ApplicationContext context: Context,
        aiSettings: AISettingsPreferencesStore
    ): AILogStorageService {
        return AILogStorageService(context, aiSettings)
    }
    
    @Provides
    @Singleton
    fun provideAIContentCacheService(
        @ApplicationContext context: Context,
        aiSettings: AISettingsPreferencesStore
    ): AIContentCacheService {
        return AIContentCacheService(context, aiSettings)
    }
    
    @Provides
    @Singleton
    fun provideAILibraryBrowserService(
        @ApplicationContext context: Context,
        libraryDao: LibraryDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao,
        readingProgressDao: ReadingProgressDao
    ): AILibraryBrowserService {
        return AILibraryBrowserService(
            context = context,
            libraryDao = libraryDao,
            mediaItemDao = mediaItemDao,
            metadataDao = metadataDao,
            readingProgressDao = readingProgressDao
        )
    }
    
    // AIToolsService is now provided by provideConfiguredAIToolsService with reading services
    
    // ==================== Enhanced AI Services ====================
    
    @Provides
    @Singleton
    fun provideEnhancedAIContentCacheService(
        @ApplicationContext context: Context,
        aiRateLimitService: AIRateLimitService
    ): EnhancedAIContentCacheService {
        return EnhancedAIContentCacheService(context, aiRateLimitService)
    }
    
    @Provides
    @Singleton
    fun provideAIRateLimitService(
        @ApplicationContext context: Context
    ): AIRateLimitService {
        return AIRateLimitService(context)
    }
    
    @Provides
    @Singleton
    fun provideAIBackupAutomationService(
        @ApplicationContext context: Context,
        aiMemoryStorageService: AIMemoryStorageService,
        synthCharacterService: SynthCharacterService,
        synthCharacterManager: SynthCharacterManager,
        synthMemoryManager: SynthMemoryManager
    ): AIBackupAutomationService {
        return AIBackupAutomationService(
            context = context,
            aiMemoryStorageService = aiMemoryStorageService,
            synthCharacterManager = synthCharacterManager,
            synthMemoryManager = synthMemoryManager
        )
    }
    
    @Provides
    @Singleton
    fun provideEnhancedAIPersonalityService(
        @ApplicationContext context: Context,
        synthCharacterManager: SynthCharacterManager,
        synthMemoryManager: SynthMemoryManager
    ): EnhancedAIPersonalityService {
        return EnhancedAIPersonalityService(
            context = context,
            synthCharacterManager = synthCharacterManager,
            synthMemoryManager = synthMemoryManager
        )
    }
    
    // ==================== Character & Memory Managers ====================
    
    @Provides
    @Singleton
    fun provideSynthCharacterManager(
        repository: AIEntertainmentRepository
    ): SynthCharacterManager {
        return SynthCharacterManager(repository)
    }
    
    @Provides
    @Singleton
    fun provideSynthMemoryManager(
        repository: AIEntertainmentRepository
    ): SynthMemoryManager {
        return SynthMemoryManager(repository)
    }
    
    // ==================== AI Reading Agent Services ====================
    
    @Provides
    @Singleton
    fun provideAIReadingProgressService(
        @ApplicationContext context: Context,
        readingProgressDao: ReadingProgressDao,
        readingAnalyticsDao: ReadingAnalyticsDao,
        mediaItemDao: MediaItemDao,
        metadataDao: MetadataDao,
        readingAnalyticsService: ReadingAnalyticsService
    ): AIReadingProgressService {
        return AIReadingProgressService(
            context = context,
            readingProgressDao = readingProgressDao,
            readingAnalyticsDao = readingAnalyticsDao,
            mediaItemDao = mediaItemDao,
            metadataDao = metadataDao,
            readingAnalyticsService = readingAnalyticsService
        )
    }
    
    @Provides
    @Singleton
    fun provideAIBookDiscussionService(
        @ApplicationContext context: Context,
        aiReadingProgressService: AIReadingProgressService,
        readingAnalyticsDao: ReadingAnalyticsDao,
        aiEntertainmentRepository: AIEntertainmentRepository
    ): AIBookDiscussionService {
        return AIBookDiscussionService(
            context = context,
            aiReadingProgressService = aiReadingProgressService,
            readingAnalyticsDao = readingAnalyticsDao,
            aiEntertainmentRepository = aiEntertainmentRepository
        )
    }
    
    @Provides
    @Singleton
    fun provideAIReadingAgentService(
        @ApplicationContext context: Context,
        aiReadingProgressService: AIReadingProgressService,
        aiBookDiscussionService: AIBookDiscussionService,
        aiLibraryBrowserService: AILibraryBrowserService,
        aiEntertainmentRepository: AIEntertainmentRepository
    ): AIReadingAgentService {
        return AIReadingAgentService(
            context = context,
            aiReadingProgressService = aiReadingProgressService,
            aiBookDiscussionService = aiBookDiscussionService,
            aiLibraryBrowserService = aiLibraryBrowserService,
            aiEntertainmentRepository = aiEntertainmentRepository
        )
    }
    
    /**
     * Provide AIToolsService configured with reading services for
     * enhanced book discussion capabilities
     */
    @Provides
    @Singleton
    fun provideAIToolsService(
        @ApplicationContext context: Context,
        aiContentCacheService: AIContentCacheService,
        aiLibraryBrowserService: AILibraryBrowserService,
        aiReadingProgressService: AIReadingProgressService,
        aiBookDiscussionService: AIBookDiscussionService
    ): AIToolsService {
        return AIToolsService(
            context = context,
            aiContentCacheService = aiContentCacheService,
            aiLibraryBrowserService = aiLibraryBrowserService
        ).apply {
            setAIReadingProgressService(aiReadingProgressService)
            setAIBookDiscussionService(aiBookDiscussionService)
        }
    }
}
