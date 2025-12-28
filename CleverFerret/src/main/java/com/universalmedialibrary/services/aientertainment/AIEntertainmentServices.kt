package com.universalmedialibrary.services.aientertainment

import android.content.Context
import android.content.SharedPreferences
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import com.universalmedialibrary.data.aientertainment.*
import dagger.hilt.android.qualifiers.ApplicationContext
import java.io.File
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.abs

/**
 * Authentication Service - Handles local and Bluesky AT Protocol authentication
 */
@Singleton
class SynthAuthService @Inject constructor(
    private val repository: AIEntertainmentRepository,
    @ApplicationContext private val context: Context
) {
    private val prefs: SharedPreferences = context.getSharedPreferences("synth_auth", Context.MODE_PRIVATE)
    private val json = Json { ignoreUnknownKeys = true }
    
    private val _currentUser = MutableStateFlow<SynthUser?>(null)
    val currentUser: StateFlow<SynthUser?> = _currentUser.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    private var blueskySession: BlueskySession? = null
    
    val isLoggedIn: Boolean get() = _currentUser.value != null
    val isBlueskyUser: Boolean get() = _currentUser.value?.isBlueskyUser ?: false
    
    init {
        loadSession()
    }
    
    private fun loadSession() {
        val userId = prefs.getLong("user_id", -1)
        if (userId != -1L) {
            kotlinx.coroutines.GlobalScope.launch(Dispatchers.IO) {
                _currentUser.value = repository.getUserById(userId)
            }
        }
    }
    
    private fun saveSession(user: SynthUser) {
        prefs.edit().apply {
            putLong("user_id", user.id)
            putString("auth_provider", user.authProvider)
            apply()
        }
    }
    
    private fun clearSession() {
        prefs.edit().clear().apply()
    }
    
    suspend fun register(username: String, email: String, password: String): Result<SynthUser> {
        if (username.trim().length < 3) {
            return Result.failure(Exception("Username must be at least 3 characters"))
        }
        if (!email.contains("@")) {
            return Result.failure(Exception("Please enter a valid email address"))
        }
        if (password.length < 6) {
            return Result.failure(Exception("Password must be at least 6 characters"))
        }
        
        val user = repository.createUser(username.trim(), email.trim(), password)
        return if (user != null) {
            _currentUser.value = user
            saveSession(user)
            Result.success(user)
        } else {
            Result.failure(Exception("Username or email already exists"))
        }
    }
    
    suspend fun login(usernameOrEmail: String, password: String): Result<SynthUser> {
        val user = repository.authenticateUser(usernameOrEmail.trim(), password)
        return if (user != null) {
            _currentUser.value = user
            saveSession(user)
            Result.success(user)
        } else {
            Result.failure(Exception("Invalid username or password"))
        }
    }
    
    suspend fun logout() {
        blueskySession?.let { session ->
            try {
                deleteBlueskySession(session)
            } catch (e: Exception) {
                // Ignore logout errors
            }
        }
        blueskySession = null
        _currentUser.value = null
        clearSession()
    }
    
    // ==================== Bluesky AT Protocol Authentication ====================
    
    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .build()
    
    private fun getBlueskyPdsUrl(identifier: String): String {
        // For now, use the default Bluesky PDS
        return "https://bsky.social"
    }
    
    suspend fun loginWithBluesky(handle: String, appPassword: String): Result<SynthUser> {
        _isLoading.value = true
        
        return try {
            withContext(Dispatchers.IO) {
                val pdsUrl = getBlueskyPdsUrl(handle)
                val requestBody = json.encodeToString(mapOf(
                    "identifier" to handle,
                    "password" to appPassword
                ))
                
                val request = Request.Builder()
                    .url("$pdsUrl/xrpc/com.atproto.server.createSession")
                    .post(requestBody.toRequestBody("application/json".toMediaType()))
                    .build()
                
                val response = httpClient.newCall(request).execute()
                
                if (response.isSuccessful) {
                    val body = response.body?.string() ?: throw Exception("Empty response")
                    val data = json.decodeFromString<JsonObject>(body)
                    
                    val session = BlueskySession(
                        accessJwt = data["accessJwt"]?.jsonPrimitive?.content ?: "",
                        refreshJwt = data["refreshJwt"]?.jsonPrimitive?.content ?: "",
                        handle = data["handle"]?.jsonPrimitive?.content ?: "",
                        did = data["did"]?.jsonPrimitive?.content ?: "",
                        email = data["email"]?.jsonPrimitive?.content
                    )
                    
                    blueskySession = session
                    
                    val user = repository.createOrUpdateBlueskyUser(
                        did = session.did,
                        handle = session.handle,
                        email = session.email
                    ) ?: throw Exception("Failed to create local account")
                    
                    _currentUser.value = user
                    saveSession(user)
                    Result.success(user)
                } else {
                    val errorBody = response.body?.string() ?: "Unknown error"
                    Result.failure(Exception("Authentication failed: $errorBody"))
                }
            }
        } catch (e: Exception) {
            Result.failure(Exception("Bluesky login failed: ${e.message}"))
        } finally {
            _isLoading.value = false
        }
    }
    
    private suspend fun deleteBlueskySession(session: BlueskySession) {
        withContext(Dispatchers.IO) {
            try {
                val pdsUrl = getBlueskyPdsUrl(session.handle)
                val request = Request.Builder()
                    .url("$pdsUrl/xrpc/com.atproto.server.deleteSession")
                    .addHeader("Authorization", "Bearer ${session.accessJwt}")
                    .post("".toRequestBody())
                    .build()
                
                httpClient.newCall(request).execute()
            } catch (e: Exception) {
                // Ignore
            }
        }
    }
    
    suspend fun linkBlueskyAccount(handle: String, appPassword: String): Result<Unit> {
        val currentUserId = _currentUser.value?.id ?: return Result.failure(Exception("Not logged in"))
        
        return try {
            withContext(Dispatchers.IO) {
                val pdsUrl = getBlueskyPdsUrl(handle)
                val requestBody = json.encodeToString(mapOf(
                    "identifier" to handle,
                    "password" to appPassword
                ))
                
                val request = Request.Builder()
                    .url("$pdsUrl/xrpc/com.atproto.server.createSession")
                    .post(requestBody.toRequestBody("application/json".toMediaType()))
                    .build()
                
                val response = httpClient.newCall(request).execute()
                
                if (response.isSuccessful) {
                    val body = response.body?.string() ?: throw Exception("Empty response")
                    val data = json.decodeFromString<JsonObject>(body)
                    
                    val did = data["did"]?.jsonPrimitive?.content ?: ""
                    val sessionHandle = data["handle"]?.jsonPrimitive?.content ?: ""
                    
                    repository.linkBlueskyAccount(currentUserId, did, sessionHandle)
                    
                    // Refresh user data
                    _currentUser.value = repository.getUserById(currentUserId)
                    
                    Result.success(Unit)
                } else {
                    Result.failure(Exception("Failed to authenticate with Bluesky"))
                }
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    suspend fun unlinkBlueskyAccount(): Result<Unit> {
        val currentUserId = _currentUser.value?.id ?: return Result.failure(Exception("Not logged in"))
        
        if (_currentUser.value?.authProvider == "bluesky") {
            return Result.failure(Exception("Cannot unlink from Bluesky-only account"))
        }
        
        return try {
            repository.unlinkBlueskyAccount(currentUserId)
            blueskySession = null
            _currentUser.value = repository.getUserById(currentUserId)
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    private fun kotlinx.coroutines.GlobalScope.launch(
        dispatcher: kotlinx.coroutines.CoroutineDispatcher,
        block: suspend () -> Unit
    ) {
        kotlinx.coroutines.CoroutineScope(dispatcher).launch { block() }
    }
    
    private fun kotlinx.coroutines.CoroutineScope.launch(block: suspend () -> Unit): kotlinx.coroutines.Job {
        return kotlinx.coroutines.launch { block() }
    }
}

/**
 * Character Service - Manages AI characters
 */
@Singleton
class SynthCharacterService @Inject constructor(
    private val repository: AIEntertainmentRepository
) {
    private val _characters = MutableStateFlow<List<CharacterWithMessageCount>>(emptyList())
    val characters: StateFlow<List<CharacterWithMessageCount>> = _characters.asStateFlow()
    
    private val _selectedCharacter = MutableStateFlow<SynthCharacter?>(null)
    val selectedCharacter: StateFlow<SynthCharacter?> = _selectedCharacter.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    private var currentUserId: Long? = null
    
    fun setUserId(userId: Long?) {
        if (currentUserId != userId) {
            currentUserId = userId
            if (userId != null) {
                loadCharacters(userId)
            } else {
                _characters.value = emptyList()
                _selectedCharacter.value = null
            }
        }
    }
    
    private fun loadCharacters(userId: Long) {
        kotlinx.coroutines.CoroutineScope(Dispatchers.IO).launch {
            _isLoading.value = true
            try {
                repository.getCharactersByUserId(userId).collect { chars ->
                    _characters.value = chars
                }
            } finally {
                _isLoading.value = false
            }
        }
    }
    
    suspend fun refreshCharacters() {
        currentUserId?.let { userId ->
            _characters.value = repository.getCharactersByUserIdOnce(userId)
        }
    }
    
    suspend fun createCharacter(
        name: String,
        personality: String = "",
        systemPrompt: String = "",
        greeting: String = "",
        avatarPath: String = "default.png",
        description: String = "",
        model: String = "gpt-3.5-turbo",
        temperature: Float = 0.7f,
        maxTokens: Int = 500
    ): Result<SynthCharacter> {
        val userId = currentUserId ?: return Result.failure(Exception("Not logged in"))
        
        if (name.isBlank()) {
            return Result.failure(Exception("Character name is required"))
        }
        
        val character = repository.createCharacter(
            userId = userId,
            name = name,
            personality = personality,
            systemPrompt = systemPrompt,
            greeting = greeting,
            avatarPath = avatarPath,
            description = description,
            model = model,
            temperature = temperature,
            maxTokens = maxTokens
        )
        
        return if (character != null) {
            refreshCharacters()
            Result.success(character)
        } else {
            Result.failure(Exception("Failed to create character"))
        }
    }
    
    suspend fun updateCharacter(character: SynthCharacter): Result<Unit> {
        return try {
            repository.updateCharacter(character)
            refreshCharacters()
            if (_selectedCharacter.value?.id == character.id) {
                _selectedCharacter.value = repository.getCharacter(character.id)
            }
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    suspend fun deleteCharacter(characterId: Long): Result<Unit> {
        return try {
            repository.deleteCharacter(characterId)
            if (_selectedCharacter.value?.id == characterId) {
                _selectedCharacter.value = null
            }
            refreshCharacters()
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    suspend fun selectCharacter(characterId: Long) {
        _selectedCharacter.value = repository.getCharacter(characterId)
    }
    
    fun clearSelection() {
        _selectedCharacter.value = null
    }
    
    fun getCharacterById(id: Long): SynthCharacter? {
        return _characters.value.find { it.character.id == id }?.character
    }
    
    private fun kotlinx.coroutines.CoroutineScope.launch(block: suspend () -> Unit): kotlinx.coroutines.Job {
        return kotlinx.coroutines.launch { block() }
    }
}

/**
 * Chat Service - Manages conversations with AI characters
 */
@Singleton
class SynthChatService @Inject constructor(
    private val repository: AIEntertainmentRepository,
    @ApplicationContext private val context: Context
) {
    private val json = Json { ignoreUnknownKeys = true }
    private val prefs: SharedPreferences = context.getSharedPreferences("synth_chat", Context.MODE_PRIVATE)
    
    private val _messages = MutableStateFlow<List<SynthMessage>>(emptyList())
    val messages: StateFlow<List<SynthMessage>> = _messages.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    private val _isTyping = MutableStateFlow(false)
    val isTyping: StateFlow<Boolean> = _isTyping.asStateFlow()
    
    private val _currentThoughtPattern = MutableStateFlow<String?>(null)
    val currentThoughtPattern: StateFlow<String?> = _currentThoughtPattern.asStateFlow()
    
    private val _currentMood = MutableStateFlow<MoodState?>(null)
    val currentMood: StateFlow<MoodState?> = _currentMood.asStateFlow()
    
    private var personalityService: SynthPersonalityEvolutionService? = null
    
    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(60, TimeUnit.SECONDS)
        .readTimeout(60, TimeUnit.SECONDS)
        .build()
    
    var apiKey: String?
        get() = prefs.getString("openai_api_key", null)
        set(value) = prefs.edit().putString("openai_api_key", value).apply()
    
    fun setPersonalityService(service: SynthPersonalityEvolutionService) {
        personalityService = service
    }
    
    suspend fun loadMessages(characterId: Long) {
        _isLoading.value = true
        try {
            repository.getMessages(characterId).collect { msgs ->
                _messages.value = msgs
            }
        } finally {
            _isLoading.value = false
        }
    }
    
    suspend fun loadMessagesOnce(characterId: Long) {
        _isLoading.value = true
        try {
            _messages.value = repository.getMessagesOnce(characterId)
        } finally {
            _isLoading.value = false
        }
    }
    
    suspend fun sendMessage(character: SynthCharacter, content: String): SynthMessage? {
        if (content.isBlank()) return null
        
        // Add user message
        val userMessage = repository.addMessage(
            characterId = character.id,
            role = "user",
            content = content
        )
        
        if (userMessage != null) {
            _messages.value = _messages.value + userMessage
        }
        
        // Generate response
        _isTyping.value = true
        
        try {
            val response = generateResponse(character, content)
            
            val assistantMessage = repository.addMessage(
                characterId = character.id,
                role = "assistant",
                content = response.content,
                thoughtPattern = response.thoughtPattern,
                emotion = response.emotion
            )
            
            if (assistantMessage != null) {
                _messages.value = _messages.value + assistantMessage
                _isTyping.value = false
                return assistantMessage
            }
        } catch (e: Exception) {
            // Add error message
        }
        
        _isTyping.value = false
        return null
    }
    
    private data class ResponseData(
        val content: String,
        val thoughtPattern: String,
        val emotion: String
    )
    
    private suspend fun generateResponse(character: SynthCharacter, userInput: String): ResponseData {
        // Generate internal reasoning
        var thoughtPattern = ""
        personalityService?.let { service ->
            _currentMood.value = service.currentMood.value
            thoughtPattern = service.generateInternalReasoning(userInput, _currentMood.value)
            _currentThoughtPattern.value = thoughtPattern
        }
        
        if (thoughtPattern.isEmpty()) {
            val thoughts = mutableListOf<String>()
            if (userInput.contains("?")) {
                thoughts.add("User is asking a question")
            }
            if (_messages.value.isNotEmpty()) {
                thoughts.add("Building on ${_messages.value.size} previous messages")
            }
            thoughtPattern = thoughts.joinToString(" | ").ifEmpty { "Processing input" }
        }
        
        // Determine emotion
        var emotion = _currentMood.value?.current ?: "neutral"
        val userLower = userInput.lowercase()
        when {
            listOf("happy", "great", "thanks", "awesome", "wonderful").any { userLower.contains(it) } -> {
                emotion = "happy"
            }
            listOf("sad", "sorry", "bad", "upset").any { userLower.contains(it) } -> {
                emotion = "empathetic"
            }
            userInput.contains("?") -> {
                emotion = "curious"
            }
        }
        
        // Try OpenAI API
        var responseContent = ""
        val key = apiKey
        if (!key.isNullOrBlank()) {
            try {
                responseContent = callOpenAI(character, userInput) ?: ""
            } catch (e: Exception) {
                // Fall back to default response
            }
        }
        
        // Fallback response
        if (responseContent.isEmpty()) {
            val truncated = if (userInput.length > 100) "${userInput.take(100)}..." else userInput
            responseContent = "Hello! I'm ${character.name}. I received your message: \"$truncated\" (Configure OpenAI API key for full responses)"
        }
        
        // Update personality
        personalityService?.let { service ->
            try {
                emotion = service.analyzeAndUpdateMood(character.id, userInput, responseContent)
                _currentMood.value = service.currentMood.value
                service.autoEvolve(character.id, userInput, responseContent)
            } catch (e: Exception) {
                // Ignore personality errors
            }
        }
        
        return ResponseData(responseContent, thoughtPattern, emotion)
    }
    
    private suspend fun callOpenAI(character: SynthCharacter, userInput: String): String? = withContext(Dispatchers.IO) {
        val messages = mutableListOf<Map<String, String>>()
        
        // System prompt
        messages.add(mapOf("role" to "system", "content" to character.fullSystemPrompt))
        
        // Recent conversation history
        val recentMessages = _messages.value.takeLast(5)
        for (msg in recentMessages) {
            messages.add(mapOf("role" to msg.role, "content" to msg.content))
        }
        
        // Current user message
        messages.add(mapOf("role" to "user", "content" to userInput))
        
        val requestBody = json.encodeToString(mapOf(
            "model" to character.model,
            "messages" to messages,
            "temperature" to character.temperature,
            "max_tokens" to character.maxTokens
        ))
        
        val request = Request.Builder()
            .url("https://api.openai.com/v1/chat/completions")
            .addHeader("Content-Type", "application/json")
            .addHeader("Authorization", "Bearer $apiKey")
            .post(requestBody.toRequestBody("application/json".toMediaType()))
            .build()
        
        val response = httpClient.newCall(request).execute()
        
        if (response.isSuccessful) {
            val body = response.body?.string() ?: return@withContext null
            val data = json.decodeFromString<JsonObject>(body)
            
            val choices = data["choices"]?.jsonArray
            if (choices != null && choices.isNotEmpty()) {
                val message = choices[0].jsonObject["message"]?.jsonObject
                return@withContext message?.get("content")?.jsonPrimitive?.content
            }
        }
        
        return@withContext null
    }
    
    suspend fun clearMessages(characterId: Long) {
        repository.clearMessages(characterId)
        _messages.value = emptyList()
    }
    
    fun clearCurrentMessages() {
        _messages.value = emptyList()
    }
    
    suspend fun addGreetingIfNeeded(character: SynthCharacter) {
        if (_messages.value.isEmpty() && character.greeting.isNotEmpty()) {
            val greetingMessage = repository.addMessage(
                characterId = character.id,
                role = "assistant",
                content = character.greeting,
                emotion = "friendly"
            )
            
            if (greetingMessage != null) {
                _messages.value = listOf(greetingMessage)
            }
        }
    }
}

/**
 * Room Service - Manages collaborative interaction rooms
 */
@Singleton
class SynthRoomService @Inject constructor(
    private val repository: AIEntertainmentRepository
) {
    private val _rooms = MutableStateFlow<List<RoomWithParticipantCount>>(emptyList())
    val rooms: StateFlow<List<RoomWithParticipantCount>> = _rooms.asStateFlow()
    
    private val _currentRoom = MutableStateFlow<SynthRoom?>(null)
    val currentRoom: StateFlow<SynthRoom?> = _currentRoom.asStateFlow()
    
    private val _currentParticipants = MutableStateFlow<List<ParticipantWithDetails>>(emptyList())
    val currentParticipants: StateFlow<List<ParticipantWithDetails>> = _currentParticipants.asStateFlow()
    
    private val _pendingInvitations = MutableStateFlow<List<InvitationWithDetails>>(emptyList())
    val pendingInvitations: StateFlow<List<InvitationWithDetails>> = _pendingInvitations.asStateFlow()
    
    private val _sentInvitations = MutableStateFlow<List<InvitationWithDetails>>(emptyList())
    val sentInvitations: StateFlow<List<InvitationWithDetails>> = _sentInvitations.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    val pendingInvitationsCount: Int get() = _pendingInvitations.value.size
    
    suspend fun loadRooms(userId: Long) {
        _isLoading.value = true
        try {
            _rooms.value = repository.getRoomsByUserIdOnce(userId)
        } finally {
            _isLoading.value = false
        }
    }
    
    suspend fun createRoom(name: String, ownerId: Long, isPublic: Boolean = false): SynthRoom? {
        val room = repository.createRoom(name, ownerId, isPublic)
        if (room != null) {
            loadRooms(ownerId)
        }
        return room
    }
    
    suspend fun joinRoom(roomId: Long, userId: Long, characterId: Long? = null): Boolean {
        val success = repository.joinRoom(roomId, userId, characterId)
        if (success) {
            loadRoomParticipants(roomId)
        }
        return success
    }
    
    suspend fun leaveRoom(roomId: Long, userId: Long) {
        repository.leaveRoom(roomId, userId)
        loadRoomParticipants(roomId)
    }
    
    suspend fun setCurrentRoom(roomId: Long) {
        _currentRoom.value = repository.getRoom(roomId)
        loadRoomParticipants(roomId)
    }
    
    private suspend fun loadRoomParticipants(roomId: Long) {
        _currentParticipants.value = repository.getRoomParticipantsOnce(roomId)
    }
    
    fun clearCurrentRoom() {
        _currentRoom.value = null
        _currentParticipants.value = emptyList()
    }
    
    suspend fun loadPendingInvitations(userId: Long) {
        repository.getPendingInvitations(userId).collect {
            _pendingInvitations.value = it
        }
    }
    
    suspend fun loadSentInvitations(userId: Long) {
        repository.getSentInvitations(userId).collect {
            _sentInvitations.value = it
        }
    }
    
    suspend fun inviteUserToRoom(
        roomId: Long,
        inviterId: Long,
        usernameOrEmail: String,
        message: String = ""
    ): Result<String> {
        val user = repository.findUserByUsernameOrEmail(usernameOrEmail)
            ?: return Result.failure(Exception("User not found"))
        
        if (user.id == inviterId) {
            return Result.failure(Exception("You cannot invite yourself"))
        }
        
        val participants = repository.getRoomParticipantsOnce(roomId)
        if (participants.any { it.participant.userId == user.id }) {
            return Result.failure(Exception("User is already in this room"))
        }
        
        val invitation = repository.createInvitation(roomId, inviterId, user.id, message)
        
        return if (invitation != null) {
            Result.success("Invitation sent to ${user.username}")
        } else {
            Result.failure(Exception("User already has a pending invitation"))
        }
    }
    
    suspend fun acceptInvitation(invitationId: Long, userId: Long): Result<String> {
        return if (repository.acceptInvitation(invitationId)) {
            loadRooms(userId)
            Result.success("Invitation accepted!")
        } else {
            Result.failure(Exception("Failed to accept invitation"))
        }
    }
    
    suspend fun rejectInvitation(invitationId: Long): Result<String> {
        return if (repository.rejectInvitation(invitationId)) {
            Result.success("Invitation declined")
        } else {
            Result.failure(Exception("Failed to decline invitation"))
        }
    }
    
    suspend fun cancelInvitation(invitationId: Long, userId: Long): Result<String> {
        repository.cancelInvitation(invitationId)
        return Result.success("Invitation cancelled")
    }
}

/**
 * Memory Branch Service - Manages conversation forking
 */
@Singleton
class SynthMemoryBranchService @Inject constructor(
    private val repository: AIEntertainmentRepository
) {
    private val _branches = MutableStateFlow<List<SynthMemoryBranch>>(emptyList())
    val branches: StateFlow<List<SynthMemoryBranch>> = _branches.asStateFlow()
    
    private val _currentBranch = MutableStateFlow<SynthMemoryBranch?>(null)
    val currentBranch: StateFlow<SynthMemoryBranch?> = _currentBranch.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    suspend fun loadBranches(characterId: Long) {
        _isLoading.value = true
        try {
            _branches.value = repository.getMemoryBranchesOnce(characterId)
        } finally {
            _isLoading.value = false
        }
    }
    
    suspend fun createBranch(
        characterId: Long,
        name: String,
        parentBranchId: Long? = null,
        isPrivate: Boolean = true
    ): SynthMemoryBranch? {
        val branch = repository.createMemoryBranch(characterId, name, parentBranchId, isPrivate)
        if (branch != null) {
            _branches.value = listOf(branch) + _branches.value
        }
        return branch
    }
    
    suspend fun mergeBranch(branchId: Long): Boolean {
        return try {
            repository.mergeBranch(branchId)
            val index = _branches.value.indexOfFirst { it.id == branchId }
            if (index >= 0) {
                val updated = _branches.value.toMutableList()
                updated[index] = updated[index].copy(isPrivate = false)
                _branches.value = updated
            }
            true
        } catch (e: Exception) {
            false
        }
    }
    
    fun setCurrentBranch(branch: SynthMemoryBranch?) {
        _currentBranch.value = branch
    }
    
    fun getBranchHierarchy(branchId: Long): List<SynthMemoryBranch> {
        val hierarchy = mutableListOf<SynthMemoryBranch>()
        val visited = mutableSetOf<Long>()
        var currentId: Long? = branchId
        
        while (currentId != null && !visited.contains(currentId)) {
            visited.add(currentId)
            val branch = _branches.value.find { it.id == currentId } ?: break
            hierarchy.add(0, branch)
            currentId = branch.parentBranchId
        }
        
        return hierarchy
    }
}

/**
 * Personality Evolution Service - Manages character personality and mood tracking
 */
@Singleton
class SynthPersonalityEvolutionService @Inject constructor(
    private val repository: AIEntertainmentRepository
) {
    private val json = Json { ignoreUnknownKeys = true }
    
    private val _currentMood = MutableStateFlow<MoodState?>(null)
    val currentMood: StateFlow<MoodState?> = _currentMood.asStateFlow()
    
    private val _events = MutableStateFlow<List<SynthPersonalityEvent>>(emptyList())
    val events: StateFlow<List<SynthPersonalityEvent>> = _events.asStateFlow()
    
    private val _currentTraits = MutableStateFlow<Map<String, Double>>(emptyMap())
    val currentTraits: StateFlow<Map<String, Double>> = _currentTraits.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    suspend fun loadCharacterPersonality(characterId: Long) {
        _isLoading.value = true
        try {
            // Load mood
            _currentMood.value = repository.getCharacterMood(characterId)
            
            // Load events
            _events.value = repository.getPersonalityEventsOnce(characterId)
            
            // Load traits
            val character = repository.getCharacter(characterId)
            if (character != null) {
                _currentTraits.value = character.getTraitsMap()
            }
        } finally {
            _isLoading.value = false
        }
    }
    
    suspend fun updateMood(characterId: Long, newMood: String, intensity: Double) {
        val oldMood = _currentMood.value?.current ?: "neutral"
        
        val moodState = MoodState(
            current = newMood,
            intensity = intensity.coerceIn(0.0, 1.0)
        )
        
        repository.updateCharacterMood(characterId, moodState)
        _currentMood.value = moodState
        
        if (oldMood != newMood) {
            repository.logPersonalityEvent(
                characterId = characterId,
                eventType = "mood_shift",
                description = "Mood shifted from $oldMood to $newMood",
                moodChanges = mapOf("from" to oldMood, "to" to newMood, "intensity" to intensity)
            )
        }
    }
    
    suspend fun analyzeAndUpdateMood(characterId: Long, message: String, response: String): String {
        val sentiment = analyzeSentiment(message, response)
        val newMood = mapSentimentToMood(sentiment)
        val intensity = calculateIntensity(message, response)
        
        updateMood(characterId, newMood, intensity)
        
        return newMood
    }
    
    private fun analyzeSentiment(message: String, response: String): Double {
        val positiveWords = listOf(
            "happy", "love", "great", "wonderful", "amazing", "excellent",
            "fantastic", "awesome", "good", "nice", "thank", "appreciate",
            "excited", "joy", "fun", "beautiful", "perfect", "glad"
        )
        
        val negativeWords = listOf(
            "sad", "angry", "bad", "terrible", "awful", "hate",
            "horrible", "upset", "frustrated", "annoyed", "disappointed",
            "worried", "anxious", "afraid", "scared", "hurt", "sorry"
        )
        
        val combined = "$message $response".lowercase()
        
        var positiveCount = 0
        var negativeCount = 0
        
        for (word in positiveWords) {
            if (combined.contains(word)) positiveCount++
        }
        
        for (word in negativeWords) {
            if (combined.contains(word)) negativeCount++
        }
        
        if (positiveCount == 0 && negativeCount == 0) return 0.0
        
        return (positiveCount - negativeCount).toDouble() / (positiveCount + negativeCount)
    }
    
    private fun mapSentimentToMood(sentiment: Double): String {
        return when {
            sentiment > 0.5 -> "happy"
            sentiment > 0.2 -> "curious"
            sentiment < -0.5 -> "sad"
            sentiment < -0.2 -> "worried"
            else -> "neutral"
        }
    }
    
    private fun calculateIntensity(message: String, response: String): Double {
        var intensity = 0.5
        
        // Increase for exclamation marks
        intensity += (message.count { it == '!' }) * 0.1
        intensity += (response.count { it == '!' }) * 0.05
        
        // Increase for question marks
        intensity += (message.count { it == '?' }) * 0.05
        
        // Increase for all caps
        if (message.uppercase() == message && message.length > 3) {
            intensity += 0.2
        }
        
        return intensity.coerceIn(0.0, 1.0)
    }
    
    suspend fun evolveTrait(characterId: Long, traitName: String, change: Double) {
        val currentValue = _currentTraits.value[traitName] ?: 0.5
        val newValue = (currentValue + change).coerceIn(0.0, 1.0)
        
        val updatedTraits = _currentTraits.value.toMutableMap()
        updatedTraits[traitName] = newValue
        _currentTraits.value = updatedTraits
        
        repository.updateCharacterTraits(characterId, updatedTraits)
        
        val eventType = if (change > 0) "trait_growth" else "trait_decline"
        repository.logPersonalityEvent(
            characterId = characterId,
            eventType = eventType,
            description = "$traitName ${if (change > 0) "increased" else "decreased"} by ${(abs(change) * 100).toInt()}%",
            traitChanges = mapOf(traitName to mapOf("from" to currentValue, "to" to newValue, "change" to change))
        )
    }
    
    suspend fun autoEvolve(characterId: Long, userMessage: String, aiResponse: String) {
        val traitImpacts = analyzeTraitImpacts(userMessage, aiResponse)
        
        for ((trait, impact) in traitImpacts) {
            if (abs(impact) > 0.01) {
                evolveTrait(characterId, trait, impact)
            }
        }
    }
    
    private fun analyzeTraitImpacts(userMessage: String, aiResponse: String): Map<String, Double> {
        val impacts = mutableMapOf<String, Double>()
        val combined = "$userMessage $aiResponse".lowercase()
        
        if (combined.contains("help") || combined.contains("care") || combined.contains("understand")) {
            impacts["empathy"] = 0.02
        }
        
        if (combined.contains("why") || combined.contains("how") || combined.contains("what")) {
            impacts["curiosity"] = 0.02
        }
        
        if (combined.contains("joke") || combined.contains("funny") || combined.contains("laugh")) {
            impacts["humor"] = 0.02
        }
        
        if (combined.contains("can") || combined.contains("will") || combined.contains("definitely")) {
            impacts["confidence"] = 0.01
        }
        
        if (userMessage.length > 200) {
            impacts["patience"] = 0.01
        }
        
        return impacts
    }
    
    fun generateInternalReasoning(userMessage: String, mood: MoodState?): String {
        val reasoning = StringBuilder()
        
        mood?.let {
            reasoning.appendLine("[Internal State: ${it.current} (${(it.intensity * 100).toInt()}%)]")
        }
        
        when {
            userMessage.contains("?") -> reasoning.appendLine("*Notices they have a question*")
            userMessage.endsWith("!") -> reasoning.appendLine("*Senses their enthusiasm*")
            else -> reasoning.appendLine("*Considers their words carefully*")
        }
        
        val thoughts = listOf(
            "*Takes a moment to reflect*",
            "*Considers how to best respond*",
            "*Draws on past experiences*",
            "*Feels connection to this conversation*",
            "*Notices subtle emotions in their message*"
        )
        reasoning.appendLine(thoughts.random())
        
        return reasoning.toString()
    }
}

/**
 * Document Parser Service - Parses documents for character creation
 */
@Singleton
class SynthDocumentParserService @Inject constructor(
    private val repository: AIEntertainmentRepository,
    @ApplicationContext private val context: Context
) {
    private val json = Json { ignoreUnknownKeys = true }
    private val prefs: SharedPreferences = context.getSharedPreferences("synth_chat", Context.MODE_PRIVATE)
    
    private val _imports = MutableStateFlow<List<SynthDocumentImport>>(emptyList())
    val imports: StateFlow<List<SynthDocumentImport>> = _imports.asStateFlow()
    
    private val _isProcessing = MutableStateFlow(false)
    val isProcessing: StateFlow<Boolean> = _isProcessing.asStateFlow()
    
    private val _processingStatus = MutableStateFlow("")
    val processingStatus: StateFlow<String> = _processingStatus.asStateFlow()
    
    private val apiKey: String?
        get() = prefs.getString("openai_api_key", null)
    
    suspend fun loadImports(userId: Long) {
        repository.getDocumentImports(userId).collect { imports ->
            _imports.value = imports
        }
    }
    
    suspend fun importDocument(
        userId: Long,
        filePath: String,
        filename: String
    ): ExtractedCharacterData? {
        _isProcessing.value = true
        _processingStatus.value = "Reading file..."
        
        try {
            val fileType = getFileType(filename)
            
            val importRecord = repository.createDocumentImport(userId, filename, fileType)
                ?: throw Exception("Failed to create import record")
            
            _processingStatus.value = "Parsing document..."
            
            val content = readFileContent(filePath, fileType)
            
            _processingStatus.value = "Extracting character data..."
            
            val extractedData = extractCharacterData(content, fileType)
            
            repository.updateDocumentImportStatus(
                importRecord.id,
                "completed",
                json.encodeToString(extractedData)
            )
            
            _isProcessing.value = false
            _processingStatus.value = ""
            
            return extractedData
        } catch (e: Exception) {
            _isProcessing.value = false
            _processingStatus.value = "Error: ${e.message}"
            return null
        }
    }
    
    private fun getFileType(filename: String): String {
        val extension = filename.lowercase().substringAfterLast('.', "")
        return when (extension) {
            "md" -> "markdown"
            "txt" -> "text"
            "json" -> "json"
            "html", "htm" -> "html"
            "pdf" -> "pdf"
            else -> "text"
        }
    }
    
    private suspend fun readFileContent(filePath: String, fileType: String): String {
        if (fileType == "pdf") {
            return "PDF support requires additional configuration"
        }
        
        return File(filePath).readText()
    }
    
    private suspend fun extractCharacterData(content: String, fileType: String): ExtractedCharacterData {
        // Try AI extraction if API key is available
        val key = apiKey
        if (!key.isNullOrBlank()) {
            try {
                return extractWithAI(content, key)
            } catch (e: Exception) {
                // Fall back to heuristics
            }
        }
        
        return extractWithHeuristics(content, fileType)
    }
    
    private suspend fun extractWithAI(content: String, apiKey: String): ExtractedCharacterData {
        val truncatedContent = if (content.length > 12000) {
            "${content.take(12000)}...[truncated]"
        } else {
            content
        }
        
        val prompt = """
            Analyze the following document and extract character information. Return a JSON object with these fields:
            - name: The character's name
            - description: A brief description of the character
            - personality: Personality traits and characteristics
            - system_prompt: A system prompt for an AI to roleplay as this character
            - greeting: How the character would greet someone
            - traits: A JSON object of specific traits (e.g., {"brave": 0.8, "intelligent": 0.9})
            - backstory: The character's background story

            Document content:
            $truncatedContent

            Return only valid JSON.
        """.trimIndent()
        
        // Call OpenAI API (simplified)
        throw Exception("AI extraction not implemented - use heuristics")
    }
    
    private fun extractWithHeuristics(content: String, fileType: String): ExtractedCharacterData {
        if (fileType == "json") {
            try {
                return json.decodeFromString<ExtractedCharacterData>(content)
            } catch (e: Exception) {
                // Continue with text parsing
            }
        }
        
        var name = "Unknown Character"
        val description = StringBuilder()
        val personality = StringBuilder()
        val backstory = StringBuilder()
        var greeting = ""
        
        val lines = content.split("\n")
        var currentSection = ""
        
        for ((index, line) in lines.withIndex()) {
            val trimmedLine = line.trim()
            
            // Check for headers
            if (trimmedLine.startsWith("#")) {
                val headerText = trimmedLine.removePrefix("#").trim().lowercase()
                
                when {
                    headerText.contains("name") || index == 0 -> {
                        if (!headerText.contains("name")) {
                            name = trimmedLine.removePrefix("#").trim()
                        }
                        currentSection = "name"
                    }
                    headerText.contains("description") || headerText.contains("about") -> {
                        currentSection = "description"
                    }
                    headerText.contains("personality") || headerText.contains("traits") -> {
                        currentSection = "personality"
                    }
                    headerText.contains("backstory") || headerText.contains("background") -> {
                        currentSection = "backstory"
                    }
                    headerText.contains("greeting") || headerText.contains("hello") -> {
                        currentSection = "greeting"
                    }
                }
                continue
            }
            
            // Parse key: value pairs
            if (trimmedLine.contains(":")) {
                val parts = trimmedLine.split(":", limit = 2)
                val key = parts[0].trim().lowercase()
                val value = parts.getOrNull(1)?.trim() ?: ""
                
                when (key) {
                    "name" -> name = value
                    "description" -> description.append(value).append(" ")
                    "personality" -> personality.append(value).append(" ")
                    "greeting" -> greeting = value
                }
                continue
            }
            
            // Add to current section
            if (trimmedLine.isNotEmpty()) {
                when (currentSection) {
                    "name" -> if (name == "Unknown Character") name = trimmedLine
                    "description" -> description.append(trimmedLine).append(" ")
                    "personality" -> personality.append(trimmedLine).append(" ")
                    "backstory" -> backstory.append(trimmedLine).append(" ")
                    "greeting" -> greeting += "$trimmedLine "
                }
            }
        }
        
        // Generate system prompt
        val systemPrompt = buildString {
            appendLine("You are $name.")
            if (description.isNotEmpty()) appendLine("\nDescription: ${description.toString().trim()}")
            if (personality.isNotEmpty()) appendLine("\nPersonality: ${personality.toString().trim()}")
            if (backstory.isNotEmpty()) appendLine("\nBackstory: ${backstory.toString().trim()}")
            appendLine("\nStay in character at all times. Respond as $name would.")
        }
        
        if (greeting.isEmpty()) {
            greeting = "Hello! I'm $name. It's nice to meet you!"
        }
        
        return ExtractedCharacterData(
            name = name.trim(),
            description = description.toString().trim(),
            personality = personality.toString().trim(),
            systemPrompt = systemPrompt.trim(),
            greeting = greeting.trim(),
            backstory = backstory.toString().trim()
        )
    }
    
    suspend fun createCharacterFromExtracted(
        userId: Long,
        data: ExtractedCharacterData
    ): SynthCharacter? {
        return repository.createCharacter(
            userId = userId,
            name = data.name,
            description = data.description,
            personality = data.personality,
            systemPrompt = data.systemPrompt,
            greeting = data.greeting
        )
    }
}
