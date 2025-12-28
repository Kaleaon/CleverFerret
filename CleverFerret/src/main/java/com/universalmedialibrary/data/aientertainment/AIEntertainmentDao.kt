package com.universalmedialibrary.data.aientertainment

import androidx.room.*
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Objects for AI Entertainment (SynthChat) functionality
 */

@Dao
interface SynthUserDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(user: SynthUser): Long
    
    @Update
    suspend fun update(user: SynthUser)
    
    @Query("SELECT * FROM synth_users WHERE id = :id")
    suspend fun getById(id: Long): SynthUser?
    
    @Query("SELECT * FROM synth_users WHERE username = :username OR email = :email LIMIT 1")
    suspend fun findByUsernameOrEmail(username: String, email: String): SynthUser?
    
    @Query("SELECT * FROM synth_users WHERE username = :username LIMIT 1")
    suspend fun findByUsername(username: String): SynthUser?
    
    @Query("SELECT * FROM synth_users WHERE email = :email LIMIT 1")
    suspend fun findByEmail(email: String): SynthUser?
    
    @Query("SELECT * FROM synth_users WHERE bluesky_did = :did LIMIT 1")
    suspend fun findByBlueskyDid(did: String): SynthUser?
    
    @Query("SELECT EXISTS(SELECT 1 FROM synth_users WHERE username = :username)")
    suspend fun usernameExists(username: String): Boolean
    
    @Query("SELECT EXISTS(SELECT 1 FROM synth_users WHERE email = :email)")
    suspend fun emailExists(email: String): Boolean
    
    @Query("UPDATE synth_users SET last_login = :timestamp WHERE id = :userId")
    suspend fun updateLastLogin(userId: Long, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_users SET bluesky_did = :did, bluesky_handle = :handle WHERE id = :userId")
    suspend fun linkBlueskyAccount(userId: Long, did: String, handle: String)
    
    @Query("UPDATE synth_users SET bluesky_did = NULL, bluesky_handle = NULL, auth_provider = 'local' WHERE id = :userId")
    suspend fun unlinkBlueskyAccount(userId: Long)
}

@Dao
interface SynthCharacterDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(character: SynthCharacter): Long
    
    @Update
    suspend fun update(character: SynthCharacter)
    
    @Delete
    suspend fun delete(character: SynthCharacter)
    
    @Query("DELETE FROM synth_characters WHERE id = :characterId")
    suspend fun deleteById(characterId: Long)
    
    @Query("SELECT * FROM synth_characters WHERE id = :id")
    suspend fun getById(id: Long): SynthCharacter?
    
    @Query("""
        SELECT c.*, 
               (SELECT COUNT(*) FROM synth_messages WHERE character_id = c.id) as message_count
        FROM synth_characters c
        WHERE c.id = :id
    """)
    suspend fun getByIdWithMessageCount(id: Long): CharacterWithMessageCount?
    
    @Query("""
        SELECT c.*, 
               (SELECT COUNT(*) FROM synth_messages WHERE character_id = c.id) as message_count
        FROM synth_characters c
        WHERE c.user_id = :userId
        ORDER BY c.updated_at DESC
    """)
    fun getCharactersByUserId(userId: Long): Flow<List<CharacterWithMessageCount>>
    
    @Query("""
        SELECT c.*, 
               (SELECT COUNT(*) FROM synth_messages WHERE character_id = c.id) as message_count
        FROM synth_characters c
        WHERE c.user_id = :userId
        ORDER BY c.updated_at DESC
    """)
    suspend fun getCharactersByUserIdOnce(userId: Long): List<CharacterWithMessageCount>
    
    @Query("UPDATE synth_characters SET updated_at = :timestamp WHERE id = :characterId")
    suspend fun updateTimestamp(characterId: Long, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_characters SET mood_state = :moodState, updated_at = :timestamp WHERE id = :characterId")
    suspend fun updateMoodState(characterId: Long, moodState: String, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_characters SET traits = :traits, updated_at = :timestamp WHERE id = :characterId")
    suspend fun updateTraits(characterId: Long, traits: String, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_characters SET personality_evolution = :evolution, updated_at = :timestamp WHERE id = :characterId")
    suspend fun updatePersonalityEvolution(characterId: Long, evolution: String, timestamp: Long = System.currentTimeMillis())
    
    @Query("UPDATE synth_characters SET memory_context = :context, updated_at = :timestamp WHERE id = :characterId")
    suspend fun updateMemoryContext(characterId: Long, context: String, timestamp: Long = System.currentTimeMillis())
}

@Dao
interface SynthMessageDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(message: SynthMessage): Long
    
    @Delete
    suspend fun delete(message: SynthMessage)
    
    @Query("SELECT * FROM synth_messages WHERE id = :id")
    suspend fun getById(id: Long): SynthMessage?
    
    @Query("SELECT * FROM synth_messages WHERE character_id = :characterId ORDER BY created_at ASC LIMIT :limit")
    fun getMessagesByCharacterId(characterId: Long, limit: Int = 100): Flow<List<SynthMessage>>
    
    @Query("SELECT * FROM synth_messages WHERE character_id = :characterId ORDER BY created_at ASC LIMIT :limit")
    suspend fun getMessagesByCharacterIdOnce(characterId: Long, limit: Int = 100): List<SynthMessage>
    
    @Query("SELECT * FROM synth_messages WHERE character_id = :characterId AND branch_id = :branchId ORDER BY created_at ASC LIMIT :limit")
    fun getMessagesByBranch(characterId: Long, branchId: Long?, limit: Int = 100): Flow<List<SynthMessage>>
    
    @Query("SELECT * FROM synth_messages WHERE character_id = :characterId ORDER BY created_at DESC LIMIT :limit")
    suspend fun getRecentMessages(characterId: Long, limit: Int = 10): List<SynthMessage>
    
    @Query("DELETE FROM synth_messages WHERE character_id = :characterId")
    suspend fun deleteByCharacterId(characterId: Long)
    
    @Query("DELETE FROM synth_messages WHERE character_id = :characterId AND branch_id = :branchId")
    suspend fun deleteByBranch(characterId: Long, branchId: Long)
    
    @Query("SELECT COUNT(*) FROM synth_messages WHERE character_id = :characterId")
    suspend fun getMessageCount(characterId: Long): Int
}

@Dao
interface SynthRoomDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(room: SynthRoom): Long
    
    @Update
    suspend fun update(room: SynthRoom)
    
    @Delete
    suspend fun delete(room: SynthRoom)
    
    @Query("SELECT * FROM synth_rooms WHERE id = :id")
    suspend fun getById(id: Long): SynthRoom?
    
    @Query("""
        SELECT DISTINCT r.*, 
               (SELECT COUNT(*) FROM synth_room_participants WHERE room_id = r.id) as participant_count
        FROM synth_rooms r
        LEFT JOIN synth_room_participants rp ON r.id = rp.room_id
        WHERE r.owner_id = :userId OR rp.user_id = :userId
        ORDER BY r.created_at DESC
    """)
    fun getRoomsByUserId(userId: Long): Flow<List<RoomWithParticipantCount>>
    
    @Query("""
        SELECT DISTINCT r.*, 
               (SELECT COUNT(*) FROM synth_room_participants WHERE room_id = r.id) as participant_count
        FROM synth_rooms r
        LEFT JOIN synth_room_participants rp ON r.id = rp.room_id
        WHERE r.owner_id = :userId OR rp.user_id = :userId
        ORDER BY r.created_at DESC
    """)
    suspend fun getRoomsByUserIdOnce(userId: Long): List<RoomWithParticipantCount>
    
    @Query("SELECT * FROM synth_rooms WHERE is_public = 1 ORDER BY created_at DESC")
    fun getPublicRooms(): Flow<List<SynthRoom>>
}

@Dao
interface SynthRoomParticipantDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(participant: SynthRoomParticipant): Long
    
    @Delete
    suspend fun delete(participant: SynthRoomParticipant)
    
    @Query("DELETE FROM synth_room_participants WHERE room_id = :roomId AND user_id = :userId")
    suspend fun deleteByRoomAndUser(roomId: Long, userId: Long)
    
    @Query("""
        SELECT rp.*, u.username, c.name as character_name
        FROM synth_room_participants rp
        LEFT JOIN synth_users u ON rp.user_id = u.id
        LEFT JOIN synth_characters c ON rp.character_id = c.id
        WHERE rp.room_id = :roomId
    """)
    fun getParticipantsByRoomId(roomId: Long): Flow<List<ParticipantWithDetails>>
    
    @Query("""
        SELECT rp.*, u.username, c.name as character_name
        FROM synth_room_participants rp
        LEFT JOIN synth_users u ON rp.user_id = u.id
        LEFT JOIN synth_characters c ON rp.character_id = c.id
        WHERE rp.room_id = :roomId
    """)
    suspend fun getParticipantsByRoomIdOnce(roomId: Long): List<ParticipantWithDetails>
    
    @Query("SELECT EXISTS(SELECT 1 FROM synth_room_participants WHERE room_id = :roomId AND user_id = :userId)")
    suspend fun isParticipant(roomId: Long, userId: Long): Boolean
}

@Dao
interface SynthRoomInvitationDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(invitation: SynthRoomInvitation): Long
    
    @Update
    suspend fun update(invitation: SynthRoomInvitation)
    
    @Delete
    suspend fun delete(invitation: SynthRoomInvitation)
    
    @Query("SELECT * FROM synth_room_invitations WHERE id = :id")
    suspend fun getById(id: Long): SynthRoomInvitation?
    
    @Query("""
        SELECT ri.*, r.name as room_name, 
               inviter.username as inviter_username,
               invitee.username as invitee_username
        FROM synth_room_invitations ri
        LEFT JOIN synth_rooms r ON ri.room_id = r.id
        LEFT JOIN synth_users inviter ON ri.inviter_id = inviter.id
        LEFT JOIN synth_users invitee ON ri.invitee_id = invitee.id
        WHERE ri.id = :id
    """)
    suspend fun getByIdWithDetails(id: Long): InvitationWithDetails?
    
    @Query("""
        SELECT ri.*, r.name as room_name, 
               inviter.username as inviter_username,
               NULL as invitee_username
        FROM synth_room_invitations ri
        LEFT JOIN synth_rooms r ON ri.room_id = r.id
        LEFT JOIN synth_users inviter ON ri.inviter_id = inviter.id
        WHERE ri.invitee_id = :userId AND ri.status = 'pending'
        ORDER BY ri.created_at DESC
    """)
    fun getPendingInvitations(userId: Long): Flow<List<InvitationWithDetails>>
    
    @Query("""
        SELECT ri.*, r.name as room_name, 
               NULL as inviter_username,
               invitee.username as invitee_username
        FROM synth_room_invitations ri
        LEFT JOIN synth_rooms r ON ri.room_id = r.id
        LEFT JOIN synth_users invitee ON ri.invitee_id = invitee.id
        WHERE ri.inviter_id = :userId
        ORDER BY ri.created_at DESC
    """)
    fun getSentInvitations(userId: Long): Flow<List<InvitationWithDetails>>
    
    @Query("SELECT EXISTS(SELECT 1 FROM synth_room_invitations WHERE room_id = :roomId AND invitee_id = :inviteeId AND status = 'pending')")
    suspend fun hasPendingInvitation(roomId: Long, inviteeId: Long): Boolean
    
    @Query("UPDATE synth_room_invitations SET status = :status, responded_at = :timestamp WHERE id = :invitationId")
    suspend fun updateStatus(invitationId: Long, status: String, timestamp: Long = System.currentTimeMillis())
}

@Dao
interface SynthMemoryBranchDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(branch: SynthMemoryBranch): Long
    
    @Update
    suspend fun update(branch: SynthMemoryBranch)
    
    @Delete
    suspend fun delete(branch: SynthMemoryBranch)
    
    @Query("SELECT * FROM synth_memory_branches WHERE id = :id")
    suspend fun getById(id: Long): SynthMemoryBranch?
    
    @Query("SELECT * FROM synth_memory_branches WHERE character_id = :characterId ORDER BY created_at DESC")
    fun getBranchesByCharacterId(characterId: Long): Flow<List<SynthMemoryBranch>>
    
    @Query("SELECT * FROM synth_memory_branches WHERE character_id = :characterId ORDER BY created_at DESC")
    suspend fun getBranchesByCharacterIdOnce(characterId: Long): List<SynthMemoryBranch>
    
    @Query("UPDATE synth_memory_branches SET is_private = 0 WHERE id = :branchId")
    suspend fun mergeBranch(branchId: Long)
}

@Dao
interface SynthDocumentImportDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(import: SynthDocumentImport): Long
    
    @Update
    suspend fun update(import: SynthDocumentImport)
    
    @Delete
    suspend fun delete(import: SynthDocumentImport)
    
    @Query("SELECT * FROM synth_document_imports WHERE id = :id")
    suspend fun getById(id: Long): SynthDocumentImport?
    
    @Query("SELECT * FROM synth_document_imports WHERE user_id = :userId ORDER BY created_at DESC")
    fun getImportsByUserId(userId: Long): Flow<List<SynthDocumentImport>>
    
    @Query("UPDATE synth_document_imports SET status = :status, parsed_data = :parsedData WHERE id = :importId")
    suspend fun updateStatusAndData(importId: Long, status: String, parsedData: String)
    
    @Query("UPDATE synth_document_imports SET character_id = :characterId WHERE id = :importId")
    suspend fun linkToCharacter(importId: Long, characterId: Long)
}

@Dao
interface SynthPersonalityEventDao {
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(event: SynthPersonalityEvent): Long
    
    @Query("SELECT * FROM synth_personality_events WHERE id = :id")
    suspend fun getById(id: Long): SynthPersonalityEvent?
    
    @Query("SELECT * FROM synth_personality_events WHERE character_id = :characterId ORDER BY created_at DESC LIMIT :limit")
    fun getEventsByCharacterId(characterId: Long, limit: Int = 50): Flow<List<SynthPersonalityEvent>>
    
    @Query("SELECT * FROM synth_personality_events WHERE character_id = :characterId ORDER BY created_at DESC LIMIT :limit")
    suspend fun getEventsByCharacterIdOnce(characterId: Long, limit: Int = 50): List<SynthPersonalityEvent>
    
    @Query("DELETE FROM synth_personality_events WHERE character_id = :characterId")
    suspend fun deleteByCharacterId(characterId: Long)
}
