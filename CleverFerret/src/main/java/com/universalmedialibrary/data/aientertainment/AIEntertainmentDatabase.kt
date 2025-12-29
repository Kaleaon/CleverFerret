package com.universalmedialibrary.data.aientertainment

import android.content.Context
import androidx.room.*
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Room Database for AI Entertainment (SynthChat) functionality
 * 
 * This database stores all data for the SynthChat-style AI character chat system:
 * - Users with local and Bluesky AT Protocol authentication
 * - AI Characters with customizable personalities
 * - Chat messages with emotion and thought tracking
 * - Collaborative rooms and invitations
 * - Memory branches for conversation forking
 * - Document imports for character creation
 * - Personality evolution events
 */
@Database(
    entities = [
        SynthUser::class,
        SynthCharacter::class,
        SynthMessage::class,
        SynthRoom::class,
        SynthRoomParticipant::class,
        SynthRoomInvitation::class,
        SynthMemoryBranch::class,
        SynthDocumentImport::class,
        SynthPersonalityEvent::class,
        // AI Memory Expansion entities
        SynthMemoryStore::class,
        SynthMemoryCategory::class,
        SynthMemory::class,
        SynthMemoryBlock::class,
        SynthMemorySyncRecord::class,
        SynthMemoryAccessLog::class
    ],
    version = 2,
    exportSchema = true
)
abstract class AIEntertainmentDatabase : RoomDatabase() {
    
    abstract fun synthUserDao(): SynthUserDao
    abstract fun synthCharacterDao(): SynthCharacterDao
    abstract fun synthMessageDao(): SynthMessageDao
    abstract fun synthRoomDao(): SynthRoomDao
    abstract fun synthRoomParticipantDao(): SynthRoomParticipantDao
    abstract fun synthRoomInvitationDao(): SynthRoomInvitationDao
    abstract fun synthMemoryBranchDao(): SynthMemoryBranchDao
    abstract fun synthDocumentImportDao(): SynthDocumentImportDao
    abstract fun synthPersonalityEventDao(): SynthPersonalityEventDao
    
    // AI Memory Expansion DAOs
    abstract fun synthMemoryStoreDao(): SynthMemoryStoreDao
    abstract fun synthMemoryCategoryDao(): SynthMemoryCategoryDao
    abstract fun synthMemoryDao(): SynthMemoryDao
    abstract fun synthMemoryBlockDao(): SynthMemoryBlockDao
    abstract fun synthMemorySyncRecordDao(): SynthMemorySyncRecordDao
    abstract fun synthMemoryAccessLogDao(): SynthMemoryAccessLogDao
    
    companion object {
        const val DATABASE_NAME = "synth_chat.db"
        
        @Volatile
        private var INSTANCE: AIEntertainmentDatabase? = null
        
        fun getInstance(context: Context): AIEntertainmentDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AIEntertainmentDatabase::class.java,
                    DATABASE_NAME
                )
                    .fallbackToDestructiveMigration()
                    .build()
                INSTANCE = instance
                instance
            }
        }
    }
}

/**
 * Dagger module for providing the AI Entertainment database
 */
@Module
@InstallIn(SingletonComponent::class)
object AIEntertainmentDatabaseModule {
    
    @Provides
    @Singleton
    fun provideAIEntertainmentDatabase(
        @ApplicationContext context: Context
    ): AIEntertainmentDatabase {
        return AIEntertainmentDatabase.getInstance(context)
    }
}
