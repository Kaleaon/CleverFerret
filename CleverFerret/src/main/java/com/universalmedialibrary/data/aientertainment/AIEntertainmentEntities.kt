package com.universalmedialibrary.data.aientertainment

import androidx.room.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import java.time.Instant

/**
 * SynthChat-style AI Entertainment entities converted from Flutter/Dart to Kotlin
 * 
 * This module provides SillyTavern-esque AI character chat functionality including:
 * - AI Character management with customizable personalities
 * - Chat rooms for collaborative interactions
 * - Memory branches for conversation forking
 * - Personality evolution tracking
 * - Document parsing for character creation
 */

// ==================== User Entity ====================

@Entity(tableName = "synth_users")
data class SynthUser(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "username")
    val username: String,
    @ColumnInfo(name = "email")
    val email: String,
    @ColumnInfo(name = "password_hash")
    val passwordHash: String = "",
    @ColumnInfo(name = "password_salt")
    val passwordSalt: String = "",
    @ColumnInfo(name = "bluesky_did")
    val blueskyDid: String? = null,
    @ColumnInfo(name = "bluesky_handle")
    val blueskyHandle: String? = null,
    @ColumnInfo(name = "auth_provider")
    val authProvider: String = "local",
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    @ColumnInfo(name = "last_login")
    val lastLogin: Long? = null
) {
    val isBlueskyUser: Boolean
        get() = authProvider == "bluesky" || blueskyDid != null
    
    val displayName: String
        get() = blueskyHandle ?: username
}

// ==================== Character Entity ====================

@Entity(tableName = "synth_characters")
data class SynthCharacter(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "user_id")
    val userId: Long,
    @ColumnInfo(name = "name")
    val name: String,
    @ColumnInfo(name = "avatar_path")
    val avatarPath: String = "default.png",
    @ColumnInfo(name = "description")
    val description: String = "",
    @ColumnInfo(name = "personality")
    val personality: String = "",
    @ColumnInfo(name = "system_prompt")
    val systemPrompt: String = "",
    @ColumnInfo(name = "greeting")
    val greeting: String = "",
    @ColumnInfo(name = "model")
    val model: String = "gpt-3.5-turbo",
    @ColumnInfo(name = "temperature")
    val temperature: Float = 0.7f,
    @ColumnInfo(name = "max_tokens")
    val maxTokens: Int = 500,
    @ColumnInfo(name = "traits")
    val traits: String = "{}",
    @ColumnInfo(name = "mood_state")
    val moodState: String = """{"current": "neutral", "intensity": 0.5}""",
    @ColumnInfo(name = "personality_evolution")
    val personalityEvolution: String = "[]",
    @ColumnInfo(name = "memory_context")
    val memoryContext: String = "",
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    @ColumnInfo(name = "updated_at")
    val updatedAt: Long = System.currentTimeMillis()
) {
    val fullSystemPrompt: String
        get() = if (systemPrompt.isNotEmpty()) {
            systemPrompt
        } else {
            "You are $name. $personality"
        }
    
    fun getTraitsMap(): Map<String, Double> {
        return try {
            Json.decodeFromString<Map<String, Double>>(traits)
        } catch (e: Exception) {
            emptyMap()
        }
    }
    
    fun getMoodStateMap(): MoodState {
        return try {
            Json.decodeFromString<MoodState>(moodState)
        } catch (e: Exception) {
            MoodState()
        }
    }
}

@Serializable
data class MoodState(
    val current: String = "neutral",
    val intensity: Double = 0.5,
    val lastUpdated: Long = System.currentTimeMillis()
) {
    val emoji: String
        get() = when (current.lowercase()) {
            "happy", "joyful" -> "😊"
            "sad", "melancholy" -> "😢"
            "angry", "frustrated" -> "😠"
            "excited", "enthusiastic" -> "🤩"
            "curious", "interested" -> "🤔"
            "calm", "peaceful" -> "😌"
            "anxious", "worried" -> "😰"
            "playful", "mischievous" -> "😏"
            "loving", "affectionate" -> "🥰"
            "confused" -> "😕"
            else -> "😐"
        }
    
    val color: Int
        get() = when (current.lowercase()) {
            "happy", "joyful" -> 0xFFFFD700.toInt() // Gold
            "sad", "melancholy" -> 0xFF4169E1.toInt() // Royal Blue
            "angry", "frustrated" -> 0xFFDC143C.toInt() // Crimson
            "excited", "enthusiastic" -> 0xFFFF4500.toInt() // Orange Red
            "curious", "interested" -> 0xFF9370DB.toInt() // Medium Purple
            "calm", "peaceful" -> 0xFF98FB98.toInt() // Pale Green
            "anxious", "worried" -> 0xFFFFB347.toInt() // Pastel Orange
            "playful", "mischievous" -> 0xFFFF69B4.toInt() // Hot Pink
            "loving", "affectionate" -> 0xFFFF1493.toInt() // Deep Pink
            else -> 0xFF808080.toInt() // Gray
        }
    
    companion object {
        val availableMoods = listOf(
            "neutral", "happy", "sad", "angry", "excited", "curious",
            "calm", "anxious", "playful", "loving", "confused",
            "frustrated", "melancholy", "enthusiastic", "peaceful",
            "worried", "mischievous", "affectionate"
        )
    }
}

// ==================== Message Entity ====================

@Entity(
    tableName = "synth_messages",
    foreignKeys = [
        ForeignKey(
            entity = SynthCharacter::class,
            parentColumns = ["id"],
            childColumns = ["character_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("character_id")]
)
data class SynthMessage(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "character_id")
    val characterId: Long,
    @ColumnInfo(name = "role")
    val role: String, // "user" or "assistant"
    @ColumnInfo(name = "content")
    val content: String,
    @ColumnInfo(name = "thought_pattern")
    val thoughtPattern: String = "",
    @ColumnInfo(name = "emotion")
    val emotion: String = "neutral",
    @ColumnInfo(name = "mood_impact")
    val moodImpact: Float = 0.0f,
    @ColumnInfo(name = "branch_id")
    val branchId: Long? = null,
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
) {
    val isUser: Boolean get() = role == "user"
    val isAssistant: Boolean get() = role == "assistant"
    
    val emotionEmoji: String
        get() = when (emotion) {
            "happy" -> "😊"
            "sad" -> "😢"
            "empathetic" -> "🤗"
            "curious" -> "🤔"
            "helpful" -> "💡"
            "friendly" -> "😄"
            else -> "😐"
        }
}

// ==================== Room Entity (V2: Collaborative Interactions) ====================

@Entity(tableName = "synth_rooms")
data class SynthRoom(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "name")
    val name: String,
    @ColumnInfo(name = "owner_id")
    val ownerId: Long,
    @ColumnInfo(name = "is_public")
    val isPublic: Boolean = false,
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
)

@Entity(
    tableName = "synth_room_participants",
    foreignKeys = [
        ForeignKey(
            entity = SynthRoom::class,
            parentColumns = ["id"],
            childColumns = ["room_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("room_id"), Index("user_id")]
)
data class SynthRoomParticipant(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "room_id")
    val roomId: Long,
    @ColumnInfo(name = "user_id")
    val userId: Long,
    @ColumnInfo(name = "character_id")
    val characterId: Long? = null,
    @ColumnInfo(name = "joined_at")
    val joinedAt: Long = System.currentTimeMillis()
)

@Entity(
    tableName = "synth_room_invitations",
    foreignKeys = [
        ForeignKey(
            entity = SynthRoom::class,
            parentColumns = ["id"],
            childColumns = ["room_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("room_id"), Index("inviter_id"), Index("invitee_id")]
)
data class SynthRoomInvitation(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "room_id")
    val roomId: Long,
    @ColumnInfo(name = "inviter_id")
    val inviterId: Long,
    @ColumnInfo(name = "invitee_id")
    val inviteeId: Long,
    @ColumnInfo(name = "status")
    val status: String = "pending", // pending, accepted, rejected
    @ColumnInfo(name = "message")
    val message: String = "",
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    @ColumnInfo(name = "responded_at")
    val respondedAt: Long? = null
) {
    val isPending: Boolean get() = status == "pending"
    val isAccepted: Boolean get() = status == "accepted"
    val isRejected: Boolean get() = status == "rejected"
}

// ==================== Memory Branch Entity (V3: Conversation Forking) ====================

@Entity(
    tableName = "synth_memory_branches",
    foreignKeys = [
        ForeignKey(
            entity = SynthCharacter::class,
            parentColumns = ["id"],
            childColumns = ["character_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("character_id"), Index("parent_branch_id")]
)
data class SynthMemoryBranch(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "character_id")
    val characterId: Long,
    @ColumnInfo(name = "parent_branch_id")
    val parentBranchId: Long? = null,
    @ColumnInfo(name = "name")
    val name: String,
    @ColumnInfo(name = "is_private")
    val isPrivate: Boolean = true,
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
)

// ==================== Document Import Entity (V4: AI Document Parsing) ====================

@Entity(
    tableName = "synth_document_imports",
    foreignKeys = [
        ForeignKey(
            entity = SynthUser::class,
            parentColumns = ["id"],
            childColumns = ["user_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("user_id")]
)
data class SynthDocumentImport(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "user_id")
    val userId: Long,
    @ColumnInfo(name = "filename")
    val filename: String,
    @ColumnInfo(name = "file_type")
    val fileType: String,
    @ColumnInfo(name = "parsed_data")
    val parsedData: String = "",
    @ColumnInfo(name = "character_id")
    val characterId: Long? = null,
    @ColumnInfo(name = "status")
    val status: String = "pending", // pending, processing, completed, failed
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
)

@Serializable
data class ExtractedCharacterData(
    val name: String,
    val description: String = "",
    val personality: String = "",
    val systemPrompt: String = "",
    val greeting: String = "",
    val traits: Map<String, Double> = emptyMap(),
    val backstory: String = ""
)

// ==================== Personality Event Entity (V5: Personality Evolution) ====================

@Entity(
    tableName = "synth_personality_events",
    foreignKeys = [
        ForeignKey(
            entity = SynthCharacter::class,
            parentColumns = ["id"],
            childColumns = ["character_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("character_id")]
)
data class SynthPersonalityEvent(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    @ColumnInfo(name = "character_id")
    val characterId: Long,
    @ColumnInfo(name = "event_type")
    val eventType: String,
    @ColumnInfo(name = "description")
    val description: String,
    @ColumnInfo(name = "trait_changes")
    val traitChanges: String = "{}",
    @ColumnInfo(name = "mood_changes")
    val moodChanges: String = "{}",
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
) {
    val icon: String
        get() = when (eventType.lowercase()) {
            "mood_shift" -> "🌡️"
            "trait_growth" -> "📈"
            "trait_decline" -> "📉"
            "memory_formed" -> "💭"
            "relationship_change" -> "💫"
            "insight" -> "💡"
            "conflict" -> "⚡"
            "resolution" -> "🤝"
            else -> "📝"
        }
}

// ==================== Relation Classes ====================

data class CharacterWithMessageCount(
    @Embedded val character: SynthCharacter,
    @ColumnInfo(name = "message_count")
    val messageCount: Int
)

data class RoomWithParticipantCount(
    @Embedded val room: SynthRoom,
    @ColumnInfo(name = "participant_count")
    val participantCount: Int
)

data class ParticipantWithDetails(
    @Embedded val participant: SynthRoomParticipant,
    @ColumnInfo(name = "username")
    val username: String?,
    @ColumnInfo(name = "character_name")
    val characterName: String?
)

data class InvitationWithDetails(
    @Embedded val invitation: SynthRoomInvitation,
    @ColumnInfo(name = "room_name")
    val roomName: String?,
    @ColumnInfo(name = "inviter_username")
    val inviterUsername: String?,
    @ColumnInfo(name = "invitee_username")
    val inviteeUsername: String?
)

// ==================== Bluesky AT Protocol Session ====================

@Serializable
data class BlueskySession(
    val accessJwt: String,
    val refreshJwt: String,
    val handle: String,
    val did: String,
    val email: String? = null,
    val expiresAt: Long? = null
) {
    val isExpired: Boolean
        get() = expiresAt?.let { System.currentTimeMillis() > it } ?: false
}
