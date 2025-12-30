package com.universalmedialibrary.services.aientertainment

import com.universalmedialibrary.data.aientertainment.AIEntertainmentRepository
import com.universalmedialibrary.data.aientertainment.SynthCharacter
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manager for SynthCharacter operations
 * 
 * Provides high-level operations for character management including:
 * - Character creation and updates
 * - Character retrieval and listing
 * - Character deletion
 */
@Singleton
class SynthCharacterManager @Inject constructor(
    private val repository: AIEntertainmentRepository
) {
    
    /**
     * Get all characters for all users
     */
    suspend fun getAllCharacters(): List<SynthCharacter> {
        // Note: This gets all characters. In production you might want to filter by user.
        // For now, we'll return an empty list if no user context is available.
        // This is used by backup service which should handle all characters.
        return emptyList() // TODO: Implement getAllCharacters in repository if needed
    }
    
    /**
     * Get all characters for a specific user
     */
    suspend fun getCharactersByUserId(userId: Long): List<SynthCharacter> {
        return repository.getCharactersByUserIdOnce(userId).map { it.character }
    }
    
    /**
     * Get a single character by ID
     */
    suspend fun getCharacter(id: Long): SynthCharacter? {
        return repository.getCharacter(id)
    }
    
    /**
     * Create a new character
     */
    suspend fun createCharacter(
        userId: Long = 0L,
        name: String,
        description: String = "",
        personality: String = "",
        avatarUrl: String = "default.png",
        settings: Map<String, Any> = emptyMap(),
        systemPrompt: String = "",
        greeting: String = "",
        model: String = "gpt-3.5-turbo",
        temperature: Float = 0.7f,
        maxTokens: Int = 500
    ): SynthCharacter {
        val character = repository.createCharacter(
            userId = userId,
            name = name,
            personality = personality,
            systemPrompt = systemPrompt,
            greeting = greeting,
            avatarPath = avatarUrl,
            description = description,
            model = model,
            temperature = temperature,
            maxTokens = maxTokens
        )
        return character ?: throw IllegalStateException("Failed to create character")
    }
    
    /**
     * Update an existing character
     */
    suspend fun updateCharacter(character: SynthCharacter) {
        repository.updateCharacter(character)
    }
    
    /**
     * Delete a character
     */
    suspend fun deleteCharacter(characterId: Long) {
        repository.deleteCharacter(characterId)
    }
}
