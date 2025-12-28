package com.universalmedialibrary.di

import android.content.Context
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import com.universalmedialibrary.data.aientertainment.*
import com.universalmedialibrary.services.aientertainment.*
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
        eventDao: SynthPersonalityEventDao
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
            eventDao = eventDao
        )
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
        @ApplicationContext context: Context
    ): SynthChatService {
        return SynthChatService(repository, context)
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
}
