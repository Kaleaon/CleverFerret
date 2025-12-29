package com.universalmedialibrary.ui.aientertainment

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.aientertainment.*
import com.universalmedialibrary.services.aientertainment.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the Memory Management Screen
 * Handles AI memory CRUD operations and storage management
 */
@HiltViewModel
class MemoryManagementViewModel @Inject constructor(
    private val repository: AIEntertainmentRepository,
    private val mcpMemoryService: MCPMemoryService,
    private val memoryStorageService: AIMemoryStorageService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MemoryManagementUiState())
    val uiState: StateFlow<MemoryManagementUiState> = _uiState.asStateFlow()
    
    private val _memories = MutableStateFlow<List<SynthMemory>>(emptyList())
    val memories: StateFlow<List<SynthMemory>> = _memories.asStateFlow()
    
    private val _categories = MutableStateFlow<List<SynthMemoryCategory>>(emptyList())
    val categories: StateFlow<List<SynthMemoryCategory>> = _categories.asStateFlow()
    
    private val _memoryStats = MutableStateFlow<MemoryStats?>(null)
    val memoryStats: StateFlow<MemoryStats?> = _memoryStats.asStateFlow()
    
    private val _storageStates = MutableStateFlow<List<StorageState>>(emptyList())
    val storageStates: StateFlow<List<StorageState>> = _storageStates.asStateFlow()
    
    private var currentCharacterId: Long? = null
    
    init {
        // Initialize MCP Memory Service with DAOs
        mcpMemoryService.initialize(
            memoryDao = repository.getMemoryDao(),
            categoryDao = repository.getMemoryCategoryDao(),
            storeDao = repository.getMemoryStoreDao(),
            blockDao = repository.getMemoryBlockDao(),
            accessLogDao = repository.getMemoryAccessLogDao()
        )
        
        // Observe storage states
        viewModelScope.launch {
            memoryStorageService.storageStates.collect { states ->
                _storageStates.value = states
            }
        }
        
        // Refresh storage on init
        memoryStorageService.refreshStorageStates()
    }
    
    /**
     * Load memories for a character
     */
    fun loadCharacterMemories(characterId: Long) {
        currentCharacterId = characterId
        _uiState.value = _uiState.value.copy(isLoading = true)
        
        viewModelScope.launch {
            try {
                // Initialize default categories if needed
                repository.initializeMemoryCategoriesForCharacter(characterId)
                
                // Set active character in MCP service
                mcpMemoryService.setActiveCharacter(characterId)
                
                // Load categories
                _categories.value = repository.getMemoryCategoriesOnce(characterId)
                
                // Load memories
                _memories.value = repository.getMemoriesOnce(characterId)
                
                // Load stats
                _memoryStats.value = repository.getMemoryStats(characterId)
                
                _uiState.value = _uiState.value.copy(isLoading = false)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Create a new memory
     */
    fun createMemory(
        characterId: Long,
        key: String,
        content: String,
        memoryType: String,
        categoryId: Long?,
        importance: Float
    ) {
        viewModelScope.launch {
            try {
                val memory = SynthMemory(
                    characterId = characterId,
                    key = key,
                    content = content,
                    memoryType = memoryType,
                    categoryId = categoryId,
                    importance = importance
                )
                
                repository.createMemory(memory)
                
                // Refresh memories
                _memories.value = repository.getMemoriesOnce(characterId)
                _memoryStats.value = repository.getMemoryStats(characterId)
                
                // Update category memory count
                categoryId?.let { catId ->
                    val category = repository.getMemoryCategory(catId)
                    category?.let { cat ->
                        repository.updateMemoryCategory(cat.copy(
                            memoryCount = cat.memoryCount + 1
                        ))
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message)
            }
        }
    }
    
    /**
     * Update an existing memory
     */
    fun updateMemory(memory: SynthMemory) {
        viewModelScope.launch {
            try {
                repository.updateMemory(memory)
                
                // Refresh memories
                currentCharacterId?.let { characterId ->
                    _memories.value = repository.getMemoriesOnce(characterId)
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message)
            }
        }
    }
    
    /**
     * Delete a memory
     */
    fun deleteMemory(memoryId: Long) {
        viewModelScope.launch {
            try {
                val memory = repository.getMemory(memoryId)
                
                // Delete from external storage if applicable
                memory?.externalFilePath?.let { path ->
                    memoryStorageService.deleteMemoryFromStorage(path)
                }
                
                repository.deleteMemory(memoryId)
                
                // Refresh memories
                currentCharacterId?.let { characterId ->
                    _memories.value = repository.getMemoriesOnce(characterId)
                    _memoryStats.value = repository.getMemoryStats(characterId)
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message)
            }
        }
    }
    
    /**
     * Toggle memory pinned status
     */
    fun toggleMemoryPinned(memory: SynthMemory) {
        viewModelScope.launch {
            try {
                repository.setMemoryPinned(memory.id, !memory.isPinned)
                
                // Refresh memories
                currentCharacterId?.let { characterId ->
                    _memories.value = repository.getMemoriesOnce(characterId)
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message)
            }
        }
    }
    
    /**
     * Archive a memory
     */
    fun archiveMemory(memory: SynthMemory) {
        viewModelScope.launch {
            try {
                repository.setMemoryArchived(memory.id, true)
                
                // Refresh memories
                currentCharacterId?.let { characterId ->
                    _memories.value = repository.getMemoriesOnce(characterId)
                    _memoryStats.value = repository.getMemoryStats(characterId)
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message)
            }
        }
    }
    
    /**
     * Set storage location for memories
     */
    fun setStorageLocation(storage: StorageState) {
        viewModelScope.launch {
            try {
                // Create or update memory store
                val existingStores = repository.getAllMemoryStores()
                val matchingStore = existingStores.find { it.storagePath == storage.path }
                
                if (matchingStore != null) {
                    // Set as primary
                    repository.setPrimaryMemoryStore(matchingStore.id)
                } else {
                    // Create new store
                    val newStore = memoryStorageService.createMemoryStore(
                        name = storage.displayName,
                        storageType = storage.type
                    )
                    
                    if (newStore != null) {
                        val storeId = repository.createMemoryStore(newStore.copy(isPrimary = true))
                        repository.setPrimaryMemoryStore(storeId)
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message)
            }
        }
    }
    
    /**
     * Export memories for a character
     */
    fun exportMemories(
        characterId: Long,
        characterName: String,
        storage: StorageState,
        options: MemoryExportOptions
    ) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isExporting = true)
                
                val memories = repository.getMemoriesOnce(characterId)
                val categories = repository.getMemoryCategoriesOnce(characterId)
                
                val result = memoryStorageService.exportMemoriesToArchive(
                    memories = memories,
                    categories = categories,
                    characterName = characterName,
                    destinationPath = storage.path,
                    options = options
                )
                
                result.onSuccess { exportResult ->
                    _uiState.value = _uiState.value.copy(
                        isExporting = false,
                        successMessage = "Exported ${exportResult.memoryCount} memories to ${exportResult.fileName}"
                    )
                }
                
                result.onFailure { error ->
                    _uiState.value = _uiState.value.copy(
                        isExporting = false,
                        error = "Export failed: ${error.message}"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isExporting = false,
                    error = e.message
                )
            }
        }
    }
    
    /**
     * Search memories
     */
    fun searchMemories(query: String) {
        val characterId = currentCharacterId ?: return
        
        viewModelScope.launch {
            try {
                _memories.value = if (query.isBlank()) {
                    repository.getMemoriesOnce(characterId)
                } else {
                    repository.searchMemories(characterId, query)
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(error = e.message)
            }
        }
    }
    
    /**
     * Clear error message
     */
    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }
    
    /**
     * Clear success message
     */
    fun clearSuccessMessage() {
        _uiState.value = _uiState.value.copy(successMessage = null)
    }
}

/**
 * UI state for the Memory Management Screen
 */
data class MemoryManagementUiState(
    val isLoading: Boolean = false,
    val isExporting: Boolean = false,
    val error: String? = null,
    val successMessage: String? = null
)
