package com.universalmedialibrary.ui.aientertainment

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import com.universalmedialibrary.data.aientertainment.*
import com.universalmedialibrary.services.aientertainment.*
import javax.inject.Inject

/**
 * ViewModel for the Characters list screen
 */
@HiltViewModel
class CharactersViewModel @Inject constructor(
    private val authService: SynthAuthService,
    private val characterService: SynthCharacterService
) : ViewModel() {
    
    val currentUser = authService.currentUser
    val characters = characterService.characters
    val isLoading = characterService.isLoading
    
    init {
        viewModelScope.launch {
            authService.currentUser.collect { user ->
                characterService.setUserId(user?.id)
            }
        }
    }
    
    fun refreshCharacters() {
        viewModelScope.launch {
            characterService.refreshCharacters()
        }
    }
    
    fun selectCharacter(characterId: Long) {
        viewModelScope.launch {
            characterService.selectCharacter(characterId)
        }
    }
    
    fun logout() {
        viewModelScope.launch {
            authService.logout()
        }
    }
}

/**
 * ViewModel for the Chat screen
 */
@HiltViewModel
class ChatViewModel @Inject constructor(
    private val characterService: SynthCharacterService,
    private val chatService: SynthChatService,
    private val personalityService: SynthPersonalityEvolutionService,
    private val branchService: SynthMemoryBranchService
) : ViewModel() {
    
    val selectedCharacter = characterService.selectedCharacter
    val messages = chatService.messages
    val isLoading = chatService.isLoading
    val isTyping = chatService.isTyping
    val currentMood = chatService.currentMood
    val currentThoughtPattern = chatService.currentThoughtPattern
    val branches = branchService.branches
    val currentBranch = branchService.currentBranch
    
    private val _uiState = MutableStateFlow(ChatUiState())
    val uiState: StateFlow<ChatUiState> = _uiState.asStateFlow()
    
    init {
        // Connect personality service to chat service
        chatService.setPersonalityService(personalityService)
    }
    
    fun loadMessages(characterId: Long) {
        viewModelScope.launch {
            chatService.loadMessagesOnce(characterId)
            personalityService.loadCharacterPersonality(characterId)
            branchService.loadBranches(characterId)
            
            // Add greeting if needed
            characterService.selectedCharacter.value?.let { character ->
                chatService.addGreetingIfNeeded(character)
            }
        }
    }
    
    fun sendMessage(content: String) {
        val character = selectedCharacter.value ?: return
        
        viewModelScope.launch {
            _uiState.update { it.copy(isSending = true) }
            try {
                chatService.sendMessage(character, content)
            } finally {
                _uiState.update { it.copy(isSending = false) }
            }
        }
    }
    
    fun clearMessages() {
        val character = selectedCharacter.value ?: return
        
        viewModelScope.launch {
            chatService.clearMessages(character.id)
        }
    }
    
    fun createMemoryBranch(name: String) {
        val character = selectedCharacter.value ?: return
        
        viewModelScope.launch {
            branchService.createBranch(
                characterId = character.id,
                name = name,
                isPrivate = true
            )
        }
    }
    
    fun switchToBranch(branch: SynthMemoryBranch?) {
        branchService.setCurrentBranch(branch)
        // Reload messages for the branch
        val character = selectedCharacter.value ?: return
        viewModelScope.launch {
            chatService.loadMessagesOnce(character.id)
        }
    }
}

data class ChatUiState(
    val isSending: Boolean = false,
    val error: String? = null
)

/**
 * ViewModel for Character Edit screen
 */
@HiltViewModel
class CharacterEditViewModel @Inject constructor(
    private val characterService: SynthCharacterService
) : ViewModel() {
    
    val selectedCharacter = characterService.selectedCharacter
    
    private val _uiState = MutableStateFlow(CharacterEditUiState())
    val uiState: StateFlow<CharacterEditUiState> = _uiState.asStateFlow()
    
    private val _formState = MutableStateFlow(CharacterFormState())
    val formState: StateFlow<CharacterFormState> = _formState.asStateFlow()
    
    fun initForEdit(characterId: Long) {
        viewModelScope.launch {
            characterService.selectCharacter(characterId)
            selectedCharacter.value?.let { character ->
                _formState.value = CharacterFormState(
                    name = character.name,
                    description = character.description,
                    personality = character.personality,
                    systemPrompt = character.systemPrompt,
                    greeting = character.greeting,
                    model = character.model,
                    temperature = character.temperature,
                    maxTokens = character.maxTokens
                )
            }
        }
    }
    
    fun initForNew() {
        characterService.clearSelection()
        _formState.value = CharacterFormState()
    }
    
    fun updateForm(update: CharacterFormState.() -> CharacterFormState) {
        _formState.update { it.update() }
    }
    
    fun save(isNew: Boolean, onSuccess: () -> Unit) {
        val form = _formState.value
        
        if (form.name.isBlank()) {
            _uiState.update { it.copy(error = "Character name is required") }
            return
        }
        
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true, error = null) }
            
            try {
                if (isNew) {
                    val result = characterService.createCharacter(
                        name = form.name,
                        description = form.description,
                        personality = form.personality,
                        systemPrompt = form.systemPrompt,
                        greeting = form.greeting,
                        model = form.model,
                        temperature = form.temperature,
                        maxTokens = form.maxTokens
                    )
                    
                    result.fold(
                        onSuccess = { onSuccess() },
                        onFailure = { _uiState.update { it.copy(error = "Failed to create character") } }
                    )
                } else {
                    val character = selectedCharacter.value ?: return@launch
                    
                    val updated = character.copy(
                        name = form.name,
                        description = form.description,
                        personality = form.personality,
                        systemPrompt = form.systemPrompt,
                        greeting = form.greeting,
                        model = form.model,
                        temperature = form.temperature,
                        maxTokens = form.maxTokens
                    )
                    
                    characterService.updateCharacter(updated).fold(
                        onSuccess = { onSuccess() },
                        onFailure = { _uiState.update { it.copy(error = "Failed to update character") } }
                    )
                }
            } finally {
                _uiState.update { it.copy(isLoading = false) }
            }
        }
    }
    
    fun delete(onSuccess: () -> Unit) {
        val character = selectedCharacter.value ?: return
        
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            
            try {
                characterService.deleteCharacter(character.id).fold(
                    onSuccess = { onSuccess() },
                    onFailure = { _uiState.update { it.copy(error = "Failed to delete character") } }
                )
            } finally {
                _uiState.update { it.copy(isLoading = false) }
            }
        }
    }
}

data class CharacterEditUiState(
    val isLoading: Boolean = false,
    val error: String? = null
)

data class CharacterFormState(
    val name: String = "",
    val description: String = "",
    val personality: String = "",
    val systemPrompt: String = "",
    val greeting: String = "",
    val model: String = "gpt-3.5-turbo",
    val temperature: Float = 0.7f,
    val maxTokens: Int = 500
)

/**
 * ViewModel for Rooms screen
 */
@HiltViewModel
class RoomsViewModel @Inject constructor(
    private val authService: SynthAuthService,
    private val roomService: SynthRoomService,
    private val characterService: SynthCharacterService
) : ViewModel() {
    
    val currentUser = authService.currentUser
    val rooms = roomService.rooms
    val currentRoom = roomService.currentRoom
    val currentParticipants = roomService.currentParticipants
    val pendingInvitations = roomService.pendingInvitations
    val sentInvitations = roomService.sentInvitations
    val isLoading = roomService.isLoading
    val characters = characterService.characters
    
    private val _uiState = MutableStateFlow(RoomsUiState())
    val uiState: StateFlow<RoomsUiState> = _uiState.asStateFlow()
    
    fun loadData() {
        val userId = currentUser.value?.id ?: return
        
        viewModelScope.launch {
            roomService.loadRooms(userId)
            launch { roomService.loadPendingInvitations(userId) }
            launch { roomService.loadSentInvitations(userId) }
        }
    }
    
    fun createRoom(name: String, isPublic: Boolean) {
        val userId = currentUser.value?.id ?: return
        
        viewModelScope.launch {
            _uiState.update { it.copy(isCreating = true) }
            try {
                roomService.createRoom(name, userId, isPublic)
            } finally {
                _uiState.update { it.copy(isCreating = false) }
            }
        }
    }
    
    fun selectRoom(roomId: Long) {
        viewModelScope.launch {
            roomService.setCurrentRoom(roomId)
        }
    }
    
    fun clearCurrentRoom() {
        roomService.clearCurrentRoom()
    }
    
    fun inviteUser(roomId: Long, usernameOrEmail: String, message: String) {
        val userId = currentUser.value?.id ?: return
        
        viewModelScope.launch {
            _uiState.update { it.copy(isInviting = true) }
            
            val result = roomService.inviteUserToRoom(
                roomId = roomId,
                inviterId = userId,
                usernameOrEmail = usernameOrEmail,
                message = message
            )
            
            result.fold(
                onSuccess = { msg -> _uiState.update { it.copy(message = msg, isInviting = false) } },
                onFailure = { e -> _uiState.update { it.copy(error = e.message, isInviting = false) } }
            )
        }
    }
    
    fun acceptInvitation(invitationId: Long) {
        val userId = currentUser.value?.id ?: return
        
        viewModelScope.launch {
            val result = roomService.acceptInvitation(invitationId, userId)
            result.fold(
                onSuccess = { msg -> _uiState.update { it.copy(message = msg) } },
                onFailure = { e -> _uiState.update { it.copy(error = e.message) } }
            )
        }
    }
    
    fun rejectInvitation(invitationId: Long) {
        viewModelScope.launch {
            val result = roomService.rejectInvitation(invitationId)
            result.fold(
                onSuccess = { msg -> _uiState.update { it.copy(message = msg) } },
                onFailure = { e -> _uiState.update { it.copy(error = e.message) } }
            )
        }
    }
    
    fun joinRoom(roomId: Long, characterId: Long?) {
        val userId = currentUser.value?.id ?: return
        
        viewModelScope.launch {
            roomService.joinRoom(roomId, userId, characterId)
        }
    }
    
    fun clearMessage() {
        _uiState.update { it.copy(message = null, error = null) }
    }
}

data class RoomsUiState(
    val isCreating: Boolean = false,
    val isInviting: Boolean = false,
    val message: String? = null,
    val error: String? = null
)

/**
 * ViewModel for Login screen
 */
@HiltViewModel
class LoginViewModel @Inject constructor(
    private val authService: SynthAuthService
) : ViewModel() {
    
    val currentUser = authService.currentUser
    val isLoading = authService.isLoading
    
    private val _uiState = MutableStateFlow(LoginUiState())
    val uiState: StateFlow<LoginUiState> = _uiState.asStateFlow()
    
    fun login(usernameOrEmail: String, password: String, onSuccess: () -> Unit) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true, error = null) }
            
            val result = authService.login(usernameOrEmail, password)
            
            result.fold(
                onSuccess = { 
                    _uiState.update { it.copy(isLoading = false) }
                    onSuccess() 
                },
                onFailure = { e ->
                    _uiState.update { it.copy(isLoading = false, error = e.message) }
                }
            )
        }
    }
    
    fun loginWithBluesky(handle: String, appPassword: String, onSuccess: () -> Unit) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true, error = null) }
            
            val result = authService.loginWithBluesky(handle, appPassword)
            
            result.fold(
                onSuccess = { 
                    _uiState.update { it.copy(isLoading = false) }
                    onSuccess() 
                },
                onFailure = { e ->
                    _uiState.update { it.copy(isLoading = false, error = e.message) }
                }
            )
        }
    }
    
    fun clearError() {
        _uiState.update { it.copy(error = null) }
    }
}

data class LoginUiState(
    val isLoading: Boolean = false,
    val error: String? = null
)

/**
 * ViewModel for Register screen
 */
@HiltViewModel
class RegisterViewModel @Inject constructor(
    private val authService: SynthAuthService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(RegisterUiState())
    val uiState: StateFlow<RegisterUiState> = _uiState.asStateFlow()
    
    fun register(username: String, email: String, password: String, onSuccess: () -> Unit) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true, error = null) }
            
            val result = authService.register(username, email, password)
            
            result.fold(
                onSuccess = { 
                    _uiState.update { it.copy(isLoading = false) }
                    onSuccess() 
                },
                onFailure = { e ->
                    _uiState.update { it.copy(isLoading = false, error = e.message) }
                }
            )
        }
    }
    
    fun clearError() {
        _uiState.update { it.copy(error = null) }
    }
}

data class RegisterUiState(
    val isLoading: Boolean = false,
    val error: String? = null
)

/**
 * ViewModel for Personality screen
 */
@HiltViewModel
class PersonalityViewModel @Inject constructor(
    private val characterService: SynthCharacterService,
    private val personalityService: SynthPersonalityEvolutionService
) : ViewModel() {
    
    val selectedCharacter = characterService.selectedCharacter
    val currentMood = personalityService.currentMood
    val currentTraits = personalityService.currentTraits
    val events = personalityService.events
    val isLoading = personalityService.isLoading
    
    fun loadPersonality(characterId: Long) {
        viewModelScope.launch {
            personalityService.loadCharacterPersonality(characterId)
        }
    }
    
    fun updateMood(characterId: Long, mood: String, intensity: Double) {
        viewModelScope.launch {
            personalityService.updateMood(characterId, mood, intensity)
        }
    }
}

/**
 * ViewModel for Document Import screen
 */
@HiltViewModel
class DocumentImportViewModel @Inject constructor(
    private val authService: SynthAuthService,
    private val documentService: SynthDocumentParserService,
    private val characterService: SynthCharacterService
) : ViewModel() {
    
    val imports = documentService.imports
    val isProcessing = documentService.isProcessing
    val processingStatus = documentService.processingStatus
    
    private val _uiState = MutableStateFlow(DocumentImportUiState())
    val uiState: StateFlow<DocumentImportUiState> = _uiState.asStateFlow()
    
    private val _extractedData = MutableStateFlow<ExtractedCharacterData?>(null)
    val extractedData: StateFlow<ExtractedCharacterData?> = _extractedData.asStateFlow()
    
    fun loadImports() {
        val userId = authService.currentUser.value?.id ?: return
        
        viewModelScope.launch {
            documentService.loadImports(userId)
        }
    }
    
    fun importDocument(filePath: String, filename: String) {
        val userId = authService.currentUser.value?.id ?: return
        
        viewModelScope.launch {
            val data = documentService.importDocument(userId, filePath, filename)
            _extractedData.value = data
            
            if (data != null) {
                _uiState.update { it.copy(showPreview = true) }
            }
        }
    }
    
    fun createCharacterFromExtracted() {
        val userId = authService.currentUser.value?.id ?: return
        val data = _extractedData.value ?: return
        
        viewModelScope.launch {
            _uiState.update { it.copy(isCreating = true) }
            
            try {
                val character = documentService.createCharacterFromExtracted(userId, data)
                if (character != null) {
                    characterService.refreshCharacters()
                    _uiState.update { it.copy(isCreating = false, showPreview = false, success = true) }
                    _extractedData.value = null
                }
            } finally {
                _uiState.update { it.copy(isCreating = false) }
            }
        }
    }
    
    fun dismissPreview() {
        _uiState.update { it.copy(showPreview = false) }
        _extractedData.value = null
    }
}

data class DocumentImportUiState(
    val showPreview: Boolean = false,
    val isCreating: Boolean = false,
    val success: Boolean = false,
    val error: String? = null
)
