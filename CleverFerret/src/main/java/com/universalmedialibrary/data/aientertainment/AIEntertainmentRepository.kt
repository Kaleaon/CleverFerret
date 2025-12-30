package com.universalmedialibrary.data.aientertainment

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.security.SecureRandom
import java.util.Base64
import javax.crypto.SecretKeyFactory
import javax.crypto.spec.PBEKeySpec
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for AI Entertainment (SynthChat) data operations
 */
@Singleton
class AIEntertainmentRepository @Inject constructor(
    private val userDao: SynthUserDao,
    private val characterDao: SynthCharacterDao,
    private val messageDao: SynthMessageDao,
    private val roomDao: SynthRoomDao,
    private val participantDao: SynthRoomParticipantDao,
    private val invitationDao: SynthRoomInvitationDao,
    private val branchDao: SynthMemoryBranchDao,
    private val documentDao: SynthDocumentImportDao,
    private val eventDao: SynthPersonalityEventDao,
    // AI Memory Expansion DAOs
    private val memoryStoreDao: SynthMemoryStoreDao,
    private val memoryCategoryDao: SynthMemoryCategoryDao,
    private val memoryDao: SynthMemoryDao,
    private val memoryBlockDao: SynthMemoryBlockDao,
    private val memorySyncRecordDao: SynthMemorySyncRecordDao,
    private val memoryAccessLogDao: SynthMemoryAccessLogDao
) {
    private val json = Json { ignoreUnknownKeys = true }
    
    // PBKDF2 Configuration
    private val pbkdf2Iterations = 100000
    private val saltLength = 32
    private val keyLength = 256
    
    // ==================== Password Hashing ====================
    
    private fun generateSalt(): ByteArray {
        val salt = ByteArray(saltLength)
        SecureRandom().nextBytes(salt)
        return salt
    }
    
    private fun hashPassword(password: String, salt: ByteArray): String {
        val spec = PBEKeySpec(password.toCharArray(), salt, pbkdf2Iterations, keyLength)
        val factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
        val hash = factory.generateSecret(spec).encoded
        return Base64.getEncoder().encodeToString(hash)
    }
    
    fun verifyPassword(password: String, storedHash: String, salt: String): Boolean {
        val saltBytes = Base64.getDecoder().decode(salt)
        val computedHash = hashPassword(password, saltBytes)
        return storedHash == computedHash
    }
    
    // ==================== User Operations ====================
    
    suspend fun createUser(username: String, email: String, password: String): SynthUser? {
        if (userDao.usernameExists(username) || userDao.emailExists(email.lowercase())) {
            return null
        }
        
        val salt = generateSalt()
        val saltString = Base64.getEncoder().encodeToString(salt)
        val passwordHash = hashPassword(password, salt)
        
        val user = SynthUser(
            username = username,
            email = email.lowercase(),
            passwordHash = passwordHash,
            passwordSalt = saltString
        )
        
        val id = userDao.insert(user)
        return userDao.getById(id)
    }
    
    suspend fun authenticateUser(usernameOrEmail: String, password: String): SynthUser? {
        val user = userDao.findByUsernameOrEmail(usernameOrEmail, usernameOrEmail.lowercase())
            ?: return null
        
        if (!verifyPassword(password, user.passwordHash, user.passwordSalt)) {
            return null
        }
        
        userDao.updateLastLogin(user.id)
        return user
    }
    
    suspend fun getUserById(id: Long): SynthUser? = userDao.getById(id)
    
    suspend fun createOrUpdateBlueskyUser(did: String, handle: String, email: String?): SynthUser? {
        val existing = userDao.findByBlueskyDid(did)
        if (existing != null) {
            val updated = existing.copy(
                blueskyHandle = handle,
                lastLogin = System.currentTimeMillis()
            )
            userDao.update(updated)
            return updated
        }
        
        val username = "${handle.split('.').first()}_bsky"
        val userEmail = email ?: "$handle@bsky.social"
        
        val user = SynthUser(
            username = username,
            email = userEmail,
            blueskyDid = did,
            blueskyHandle = handle,
            authProvider = "bluesky",
            lastLogin = System.currentTimeMillis()
        )
        
        val id = userDao.insert(user)
        return userDao.getById(id)
    }
    
    suspend fun linkBlueskyAccount(userId: Long, did: String, handle: String) {
        userDao.linkBlueskyAccount(userId, did, handle)
    }
    
    suspend fun unlinkBlueskyAccount(userId: Long) {
        userDao.unlinkBlueskyAccount(userId)
    }
    
    suspend fun findUserByUsernameOrEmail(query: String): SynthUser? {
        return userDao.findByUsernameOrEmail(query.trim(), query.trim().lowercase())
    }
    
    // ==================== Character Operations ====================
    
    suspend fun createCharacter(
        userId: Long,
        name: String,
        personality: String = "",
        systemPrompt: String = "",
        greeting: String = "",
        avatarPath: String = "default.png",
        description: String = "",
        model: String = "gpt-3.5-turbo",
        temperature: Float = 0.7f,
        maxTokens: Int = 500
    ): SynthCharacter? {
        val actualSystemPrompt = systemPrompt.ifEmpty { "You are $name. $personality" }
        val actualGreeting = greeting.ifEmpty { "Hello! I'm $name. How can I help you today?" }
        
        val character = SynthCharacter(
            userId = userId,
            name = name,
            personality = personality,
            systemPrompt = actualSystemPrompt,
            greeting = actualGreeting,
            avatarPath = avatarPath,
            description = description,
            model = model,
            temperature = temperature,
            maxTokens = maxTokens
        )
        
        val id = characterDao.insert(character)
        return characterDao.getById(id)
    }
    
    suspend fun getCharacter(id: Long): SynthCharacter? = characterDao.getById(id)
    
    suspend fun getCharacterWithMessageCount(id: Long): CharacterWithMessageCount? = 
        characterDao.getByIdWithMessageCount(id)
    
    fun getCharactersByUserId(userId: Long): Flow<List<CharacterWithMessageCount>> = 
        characterDao.getCharactersByUserId(userId)
    
    suspend fun getCharactersByUserIdOnce(userId: Long): List<CharacterWithMessageCount> =
        characterDao.getCharactersByUserIdOnce(userId)
    
    suspend fun updateCharacter(character: SynthCharacter) {
        characterDao.update(character.copy(updatedAt = System.currentTimeMillis()))
    }
    
    suspend fun deleteCharacter(characterId: Long) {
        messageDao.deleteByCharacterId(characterId)
        characterDao.deleteById(characterId)
    }
    
    suspend fun updateCharacterMood(characterId: Long, moodState: MoodState) {
        characterDao.updateMoodState(characterId, json.encodeToString(moodState))
    }
    
    suspend fun updateCharacterTraits(characterId: Long, traits: Map<String, Double>) {
        characterDao.updateTraits(characterId, json.encodeToString(traits))
    }
    
    suspend fun getCharacterMood(characterId: Long): MoodState {
        val character = characterDao.getById(characterId) ?: return MoodState()
        return character.getMoodStateMap()
    }
    
    // ==================== Message Operations ====================
    
    suspend fun addMessage(
        characterId: Long,
        role: String,
        content: String,
        thoughtPattern: String = "",
        emotion: String = "neutral",
        branchId: Long? = null
    ): SynthMessage? {
        val message = SynthMessage(
            characterId = characterId,
            role = role,
            content = content,
            thoughtPattern = thoughtPattern,
            emotion = emotion,
            branchId = branchId
        )
        
        val id = messageDao.insert(message)
        characterDao.updateTimestamp(characterId)
        return messageDao.getById(id)
    }
    
    fun getMessages(characterId: Long, limit: Int = 100): Flow<List<SynthMessage>> = 
        messageDao.getMessagesByCharacterId(characterId, limit)
    
    suspend fun getMessagesOnce(characterId: Long, limit: Int = 100): List<SynthMessage> =
        messageDao.getMessagesByCharacterIdOnce(characterId, limit)
    
    suspend fun getRecentMessages(characterId: Long, limit: Int = 10): List<SynthMessage> =
        messageDao.getRecentMessages(characterId, limit)
    
    fun getMessagesByBranch(characterId: Long, branchId: Long?): Flow<List<SynthMessage>> =
        messageDao.getMessagesByBranch(characterId, branchId)
    
    suspend fun clearMessages(characterId: Long) {
        messageDao.deleteByCharacterId(characterId)
    }
    
    // ==================== Room Operations ====================
    
    suspend fun createRoom(name: String, ownerId: Long, isPublic: Boolean = false): SynthRoom? {
        val room = SynthRoom(
            name = name,
            ownerId = ownerId,
            isPublic = isPublic
        )
        
        val id = roomDao.insert(room)
        
        // Add owner as participant
        participantDao.insert(SynthRoomParticipant(
            roomId = id,
            userId = ownerId
        ))
        
        return roomDao.getById(id)
    }
    
    suspend fun getRoom(id: Long): SynthRoom? = roomDao.getById(id)
    
    fun getRoomsByUserId(userId: Long): Flow<List<RoomWithParticipantCount>> = 
        roomDao.getRoomsByUserId(userId)
    
    suspend fun getRoomsByUserIdOnce(userId: Long): List<RoomWithParticipantCount> =
        roomDao.getRoomsByUserIdOnce(userId)
    
    fun getPublicRooms(): Flow<List<SynthRoom>> = roomDao.getPublicRooms()
    
    suspend fun joinRoom(roomId: Long, userId: Long, characterId: Long? = null): Boolean {
        if (participantDao.isParticipant(roomId, userId)) return false
        
        participantDao.insert(SynthRoomParticipant(
            roomId = roomId,
            userId = userId,
            characterId = characterId
        ))
        return true
    }
    
    suspend fun leaveRoom(roomId: Long, userId: Long) {
        participantDao.deleteByRoomAndUser(roomId, userId)
    }
    
    fun getRoomParticipants(roomId: Long): Flow<List<ParticipantWithDetails>> =
        participantDao.getParticipantsByRoomId(roomId)
    
    suspend fun getRoomParticipantsOnce(roomId: Long): List<ParticipantWithDetails> =
        participantDao.getParticipantsByRoomIdOnce(roomId)
    
    // ==================== Room Invitation Operations ====================
    
    suspend fun createInvitation(
        roomId: Long,
        inviterId: Long,
        inviteeId: Long,
        message: String = ""
    ): SynthRoomInvitation? {
        if (invitationDao.hasPendingInvitation(roomId, inviteeId)) return null
        if (participantDao.isParticipant(roomId, inviteeId)) return null
        
        val invitation = SynthRoomInvitation(
            roomId = roomId,
            inviterId = inviterId,
            inviteeId = inviteeId,
            message = message
        )
        
        val id = invitationDao.insert(invitation)
        return invitationDao.getById(id)
    }
    
    fun getPendingInvitations(userId: Long): Flow<List<InvitationWithDetails>> =
        invitationDao.getPendingInvitations(userId)
    
    fun getSentInvitations(userId: Long): Flow<List<InvitationWithDetails>> =
        invitationDao.getSentInvitations(userId)
    
    suspend fun acceptInvitation(invitationId: Long): Boolean {
        val invitation = invitationDao.getById(invitationId) ?: return false
        if (!invitation.isPending) return false
        
        invitationDao.updateStatus(invitationId, "accepted")
        participantDao.insert(SynthRoomParticipant(
            roomId = invitation.roomId,
            userId = invitation.inviteeId
        ))
        return true
    }
    
    suspend fun rejectInvitation(invitationId: Long): Boolean {
        val invitation = invitationDao.getById(invitationId) ?: return false
        if (!invitation.isPending) return false
        
        invitationDao.updateStatus(invitationId, "rejected")
        return true
    }
    
    suspend fun cancelInvitation(invitationId: Long) {
        val invitation = invitationDao.getById(invitationId) ?: return
        invitationDao.delete(invitation)
    }
    
    // ==================== Memory Branch Operations ====================
    
    suspend fun createMemoryBranch(
        characterId: Long,
        name: String,
        parentBranchId: Long? = null,
        isPrivate: Boolean = true
    ): SynthMemoryBranch? {
        val branch = SynthMemoryBranch(
            characterId = characterId,
            parentBranchId = parentBranchId,
            name = name,
            isPrivate = isPrivate
        )
        
        val id = branchDao.insert(branch)
        return branchDao.getById(id)
    }
    
    fun getMemoryBranches(characterId: Long): Flow<List<SynthMemoryBranch>> =
        branchDao.getBranchesByCharacterId(characterId)
    
    suspend fun getMemoryBranchesOnce(characterId: Long): List<SynthMemoryBranch> =
        branchDao.getBranchesByCharacterIdOnce(characterId)
    
    suspend fun mergeBranch(branchId: Long) {
        branchDao.mergeBranch(branchId)
    }
    
    // ==================== Document Import Operations ====================
    
    suspend fun createDocumentImport(
        userId: Long,
        filename: String,
        fileType: String
    ): SynthDocumentImport? {
        val import = SynthDocumentImport(
            userId = userId,
            filename = filename,
            fileType = fileType
        )
        
        val id = documentDao.insert(import)
        return documentDao.getById(id)
    }
    
    fun getDocumentImports(userId: Long): Flow<List<SynthDocumentImport>> =
        documentDao.getImportsByUserId(userId)
    
    suspend fun updateDocumentImportStatus(importId: Long, status: String, parsedData: String) {
        documentDao.updateStatusAndData(importId, status, parsedData)
    }
    
    suspend fun linkDocumentToCharacter(importId: Long, characterId: Long) {
        documentDao.linkToCharacter(importId, characterId)
    }
    
    // ==================== Personality Event Operations ====================
    
    suspend fun logPersonalityEvent(
        characterId: Long,
        eventType: String,
        description: String,
        traitChanges: Map<String, Any>? = null,
        moodChanges: Map<String, Any>? = null
    ): SynthPersonalityEvent? {
        val event = SynthPersonalityEvent(
            characterId = characterId,
            eventType = eventType,
            description = description,
            traitChanges = traitChanges?.let { json.encodeToString(it) } ?: "{}",
            moodChanges = moodChanges?.let { json.encodeToString(it) } ?: "{}"
        )
        
        val id = eventDao.insert(event)
        return eventDao.getById(id)
    }
    
    fun getPersonalityEvents(characterId: Long, limit: Int = 50): Flow<List<SynthPersonalityEvent>> =
        eventDao.getEventsByCharacterId(characterId, limit)
    
    suspend fun getPersonalityEventsOnce(characterId: Long, limit: Int = 50): List<SynthPersonalityEvent> =
        eventDao.getEventsByCharacterIdOnce(characterId, limit)
    
    // ==================== AI Memory Store Operations ====================
    
    suspend fun createMemoryStore(store: SynthMemoryStore): Long = 
        memoryStoreDao.insert(store)
    
    suspend fun getMemoryStore(id: Long): SynthMemoryStore? = 
        memoryStoreDao.getById(id)
    
    suspend fun getPrimaryMemoryStore(): SynthMemoryStore? = 
        memoryStoreDao.getPrimaryStore()
    
    fun getAvailableMemoryStores(): Flow<List<SynthMemoryStore>> = 
        memoryStoreDao.getAvailableStores()
    
    suspend fun getAllMemoryStores(): List<SynthMemoryStore> = 
        memoryStoreDao.getAllStoresOnce()
    
    suspend fun setPrimaryMemoryStore(storeId: Long) = 
        memoryStoreDao.setPrimaryStore(storeId)
    
    suspend fun updateMemoryStoreUsage(storeId: Long, usedBytes: Long) = 
        memoryStoreDao.updateUsage(storeId, usedBytes)
    
    suspend fun deleteMemoryStore(store: SynthMemoryStore) = 
        memoryStoreDao.delete(store)
    
    // ==================== AI Memory Category Operations ====================
    
    suspend fun createMemoryCategory(category: SynthMemoryCategory): Long = 
        memoryCategoryDao.insert(category)
    
    suspend fun createMemoryCategories(categories: List<SynthMemoryCategory>): List<Long> = 
        memoryCategoryDao.insertAll(categories)
    
    suspend fun getMemoryCategory(id: Long): SynthMemoryCategory? = 
        memoryCategoryDao.getById(id)
    
    fun getMemoryCategories(characterId: Long): Flow<List<SynthMemoryCategory>> = 
        memoryCategoryDao.getCategoriesByCharacterId(characterId)
    
    suspend fun getMemoryCategoriesOnce(characterId: Long): List<SynthMemoryCategory> = 
        memoryCategoryDao.getCategoriesByCharacterIdOnce(characterId)
    
    suspend fun updateMemoryCategory(category: SynthMemoryCategory) = 
        memoryCategoryDao.update(category)
    
    suspend fun deleteMemoryCategory(category: SynthMemoryCategory) = 
        memoryCategoryDao.delete(category)
    
    suspend fun findMemoryCategoryByName(characterId: Long, name: String): SynthMemoryCategory? = 
        memoryCategoryDao.findByName(characterId, name)
    
    // ==================== AI Memory Operations ====================
    
    suspend fun createMemory(memory: SynthMemory): Long = 
        memoryDao.insert(memory)
    
    suspend fun createMemories(memories: List<SynthMemory>): List<Long> = 
        memoryDao.insertAll(memories)
    
    suspend fun getMemory(id: Long): SynthMemory? = 
        memoryDao.getById(id)
    
    fun getMemories(characterId: Long, limit: Int = 100): Flow<List<SynthMemory>> = 
        memoryDao.getMemoriesByCharacterId(characterId, limit)
    
    suspend fun getMemoriesOnce(characterId: Long, limit: Int = 100): List<SynthMemory> = 
        memoryDao.getMemoriesByCharacterIdOnce(characterId, limit)
    
    fun getMemoriesByCategory(characterId: Long, categoryId: Long): Flow<List<SynthMemory>> = 
        memoryDao.getMemoriesByCategory(characterId, categoryId)
    
    suspend fun getMemoriesByCategoryOnce(characterId: Long, categoryId: Long): List<SynthMemory> = 
        memoryDao.getMemoriesByCategoryOnce(characterId, categoryId)
    
    suspend fun getMemoriesByType(characterId: Long, memoryType: String): List<SynthMemory> = 
        memoryDao.getMemoriesByType(characterId, memoryType)
    
    suspend fun getPinnedMemories(characterId: Long): List<SynthMemory> = 
        memoryDao.getPinnedMemories(characterId)
    
    suspend fun getArchivedMemories(characterId: Long): List<SynthMemory> = 
        memoryDao.getArchivedMemories(characterId)
    
    suspend fun getImportantMemories(characterId: Long, minImportance: Float = 0.7f, limit: Int = 20): List<SynthMemory> = 
        memoryDao.getImportantMemories(characterId, minImportance, limit)
    
    suspend fun getMostAccessedMemories(characterId: Long, limit: Int = 20): List<SynthMemory> = 
        memoryDao.getMostAccessedMemories(characterId, limit)
    
    suspend fun getRecentMemories(characterId: Long, limit: Int = 20): List<SynthMemory> = 
        memoryDao.getRecentMemories(characterId, limit)
    
    suspend fun searchMemories(characterId: Long, query: String, limit: Int = 50): List<SynthMemory> = 
        memoryDao.searchMemories(characterId, query, limit)
    
    suspend fun queryMemories(query: MemoryQuery): List<SynthMemory> = 
        memoryDao.queryMemories(
            characterId = query.characterId,
            categoryIds = query.categoryIds ?: emptyList(),
            memoryTypes = query.memoryTypes ?: emptyList(),
            minImportance = query.minImportance,
            sortBy = query.sortBy,
            sortOrder = query.sortOrder,
            limit = query.limit,
            offset = query.offset
        )
    
    suspend fun updateMemory(memory: SynthMemory) = 
        memoryDao.update(memory)
    
    suspend fun deleteMemory(memoryId: Long) = 
        memoryDao.deleteById(memoryId)
    
    suspend fun recordMemoryAccess(memoryId: Long) = 
        memoryDao.recordAccess(memoryId)
    
    suspend fun updateMemoryImportance(memoryId: Long, importance: Float) = 
        memoryDao.updateImportance(memoryId, importance)
    
    suspend fun setMemoryArchived(memoryId: Long, archived: Boolean) = 
        memoryDao.setArchived(memoryId, archived)
    
    suspend fun setMemoryPinned(memoryId: Long, pinned: Boolean) = 
        memoryDao.setPinned(memoryId, pinned)
    
    suspend fun updateMemoryCategory(memoryId: Long, categoryId: Long?) = 
        memoryDao.updateCategory(memoryId, categoryId)
    
    suspend fun setMemoryExternalStorage(memoryId: Long, storeId: Long?, path: String?) = 
        memoryDao.setExternalStorage(memoryId, storeId, path)
    
    suspend fun getMemoryCount(characterId: Long): Int = 
        memoryDao.getMemoryCount(characterId)
    
    suspend fun findMemoryByKey(characterId: Long, key: String): SynthMemory? = 
        memoryDao.findByKey(characterId, key)
    
    suspend fun deleteAllMemoriesForCharacter(characterId: Long) = 
        memoryDao.deleteAllForCharacter(characterId)
    
    suspend fun deleteArchivedMemories(characterId: Long) = 
        memoryDao.deleteArchivedMemories(characterId)
    
    suspend fun deleteExpiredMemories(characterId: Long) = 
        memoryDao.deleteExpiredMemories(characterId)
    
    fun getMemoriesWithCategory(characterId: Long): Flow<List<MemoryWithCategory>> = 
        memoryDao.getMemoriesWithCategory(characterId)
    
    suspend fun getMemoryStats(characterId: Long): MemoryStats {
        return MemoryStats(
            totalMemories = memoryDao.getMemoryCount(characterId),
            totalCategories = memoryCategoryDao.getCategoryCount(characterId),
            totalBlocks = memoryBlockDao.getBlocksCount(characterId),
            avgImportance = memoryDao.getAverageImportance(characterId) ?: 0.5f,
            mostAccessedCount = memoryDao.getMaxAccessCount(characterId) ?: 0,
            oldestMemoryDate = memoryDao.getOldestMemoryDate(characterId),
            newestMemoryDate = memoryDao.getNewestMemoryDate(characterId),
            pinnedCount = memoryDao.getPinnedCount(characterId),
            archivedCount = memoryDao.getArchivedCount(characterId)
        )
    }
    
    // ==================== AI Memory Block Operations ====================
    
    suspend fun createMemoryBlock(block: SynthMemoryBlock): Long = 
        memoryBlockDao.insert(block)
    
    suspend fun getMemoryBlock(id: Long): SynthMemoryBlock? = 
        memoryBlockDao.getById(id)
    
    fun getActiveMemoryBlocks(characterId: Long): Flow<List<SynthMemoryBlock>> = 
        memoryBlockDao.getActiveBlocks(characterId)
    
    suspend fun getActiveMemoryBlocksOnce(characterId: Long): List<SynthMemoryBlock> = 
        memoryBlockDao.getActiveBlocksOnce(characterId)
    
    suspend fun getAllMemoryBlocks(characterId: Long): List<SynthMemoryBlock> = 
        memoryBlockDao.getAllBlocks(characterId)
    
    suspend fun updateMemoryBlock(block: SynthMemoryBlock) = 
        memoryBlockDao.update(block)
    
    suspend fun deleteMemoryBlock(block: SynthMemoryBlock) = 
        memoryBlockDao.delete(block)
    
    suspend fun setMemoryBlockActive(blockId: Long, active: Boolean) = 
        memoryBlockDao.setActive(blockId, active)
    
    suspend fun updateMemoryBlockRelevance(blockId: Long, score: Float) = 
        memoryBlockDao.updateRelevanceScore(blockId, score)
    
    suspend fun getActiveMemoryTokenCount(characterId: Long): Int = 
        memoryBlockDao.getActiveTokenCount(characterId) ?: 0
    
    // ==================== AI Memory Sync Operations ====================
    
    suspend fun createMemorySyncRecord(record: SynthMemorySyncRecord): Long = 
        memorySyncRecordDao.insert(record)
    
    suspend fun findMemorySyncRecord(memoryId: Long, storeId: Long): SynthMemorySyncRecord? = 
        memorySyncRecordDao.findByMemoryAndStore(memoryId, storeId)
    
    suspend fun getPendingMemorySyncs(storeId: Long, limit: Int = 100): List<SynthMemorySyncRecord> = 
        memorySyncRecordDao.getPendingSync(storeId, limit)
    
    suspend fun updateMemorySyncStatus(recordId: Long, status: String, error: String? = null) = 
        memorySyncRecordDao.updateSyncStatus(recordId, status, error = error)
    
    suspend fun deleteMemorySyncRecords(memoryId: Long) = 
        memorySyncRecordDao.deleteByMemoryId(memoryId)
    
    // ==================== AI Memory Access Log Operations ====================
    
    suspend fun logMemoryAccess(log: SynthMemoryAccessLog): Long = 
        memoryAccessLogDao.insert(log)
    
    suspend fun getMemoryAccessLogs(memoryId: Long, limit: Int = 100): List<SynthMemoryAccessLog> = 
        memoryAccessLogDao.getLogsForMemory(memoryId, limit)
    
    suspend fun getMemoryAccessCount(memoryId: Long, accessType: String = "read"): Int = 
        memoryAccessLogDao.getAccessCount(memoryId, accessType)
    
    suspend fun deleteOldMemoryAccessLogs(beforeTime: Long) = 
        memoryAccessLogDao.deleteOldLogs(beforeTime)
    
    // ==================== Convenience Methods ====================
    
    /**
     * Initialize default memory categories for a character if they don't exist
     */
    suspend fun initializeMemoryCategoriesForCharacter(characterId: Long) {
        val existingCount = memoryCategoryDao.getCategoryCount(characterId)
        if (existingCount == 0) {
            val defaultCategories = SynthMemoryCategory.createSystemCategories(characterId)
            memoryCategoryDao.insertAll(defaultCategories)
        }
    }
}
