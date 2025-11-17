package com.universalmedialibrary.services.audiobook.maker

import com.universalmedialibrary.services.ai.GeminiTTSService
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manages character voices for audiobook generation
 * Creates and maintains consistent voice profiles for each character
 */
@Singleton
class CharacterVoiceService @Inject constructor(
    private val geminiTtsService: GeminiTTSService
) {
    
    // Cache of character voices
    private val characterVoices = mutableMapOf<String, CharacterVoiceProfile>()
    
    /**
     * Generate a voice profile for a character using AI
     */
    suspend fun generateVoiceProfile(
        character: BookCharacter,
        bookGenre: BookGenre
    ): CharacterVoiceProfile = withContext(Dispatchers.IO) {
        try {
            // Check cache first
            characterVoices[character.id]?.let { return@withContext it }
            
            // Use Gemini TTS to generate voice profile
            val geminiProfile = geminiTtsService.generateVoiceProfile(
                characterName = character.name,
                characterDescription = character.description,
                sampleDialogue = character.sampleDialogue
            )
            
            // Convert to our CharacterVoiceProfile format
            val voiceProfile = CharacterVoiceProfile(
                characterId = character.id,
                characterName = character.name,
                pitch = geminiProfile.pitch,
                speed = geminiProfile.speed,
                tone = mapTone(geminiProfile.tone),
                emotion = mapEmotion(geminiProfile.emotion),
                voiceType = mapVoiceType(geminiProfile.voiceType),
                gender = inferGender(character.name, character.description),
                age = inferAge(character.description),
                description = geminiProfile.description,
                aiGenerated = true
            )
            
            // Apply genre-specific adjustments
            val adjustedProfile = applyGenreAdjustments(voiceProfile, bookGenre)
            
            // Cache the profile
            characterVoices[character.id] = adjustedProfile
            
            adjustedProfile
            
        } catch (e: Exception) {
            // Fallback to default profile
            val defaultProfile = createDefaultVoiceProfile(character, bookGenre)
            characterVoices[character.id] = defaultProfile
            defaultProfile
        }
    }
    
    /**
     * Get a cached voice profile for a character
     */
    fun getVoiceProfile(characterId: String): CharacterVoiceProfile? {
        return characterVoices[characterId]
    }
    
    /**
     * Update a voice profile
     */
    fun updateVoiceProfile(profile: CharacterVoiceProfile) {
        characterVoices[profile.characterId] = profile
    }
    
    /**
     * Create narrator voice profile
     */
    fun createNarratorVoice(bookGenre: BookGenre): CharacterVoiceProfile {
        return CharacterVoiceProfile(
            characterId = "narrator",
            characterName = "Narrator",
            pitch = 1.0f,
            speed = 1.0f,
            tone = VoiceTone.NEUTRAL,
            emotion = EmotionStyle.CALM,
            voiceType = VoiceType.MEDIUM,
            gender = VoiceGender.NEUTRAL,
            age = VoiceAge.ADULT,
            description = "Professional narrator voice"
        )
    }
    
    /**
     * Apply genre-specific voice adjustments
     */
    private fun applyGenreAdjustments(
        profile: CharacterVoiceProfile,
        genre: BookGenre
    ): CharacterVoiceProfile {
        return when (genre) {
            BookGenre.FANTASY -> profile.copy(
                // Fantasy often has more dramatic voices
                tone = if (profile.tone == VoiceTone.NEUTRAL) VoiceTone.WARM else profile.tone
            )
            
            BookGenre.SCIENCE_FICTION -> profile.copy(
                // Sci-fi can have slightly more mechanical delivery
                emotion = if (profile.emotion == EmotionStyle.VARIABLE) EmotionStyle.CALM else profile.emotion
            )
            
            BookGenre.HORROR -> profile.copy(
                // Horror often has more tense delivery
                emotion = EmotionStyle.ANXIOUS,
                speed = profile.speed * 0.95f // Slightly slower for tension
            )
            
            BookGenre.ROMANCE -> profile.copy(
                // Romance often has warmer tones
                tone = VoiceTone.WARM,
                emotion = EmotionStyle.CHEERFUL
            )
            
            else -> profile
        }
    }
    
    /**
     * Create a default voice profile based on character traits
     */
    private fun createDefaultVoiceProfile(
        character: BookCharacter,
        genre: BookGenre
    ): CharacterVoiceProfile {
        // Basic heuristics based on role and name
        val (gender, age) = inferCharacterTraits(character)
        
        val pitch = when (gender) {
            VoiceGender.MALE -> 0.9f
            VoiceGender.FEMALE -> 1.1f
            else -> 1.0f
        }
        
        val voiceType = when (gender) {
            VoiceGender.MALE -> VoiceType.BASS
            VoiceGender.FEMALE -> VoiceType.ALTO
            else -> VoiceType.MEDIUM
        }
        
        val tone = when (character.role) {
            CharacterRole.PROTAGONIST -> VoiceTone.WARM
            CharacterRole.ANTAGONIST -> VoiceTone.COLD
            else -> VoiceTone.NEUTRAL
        }
        
        return CharacterVoiceProfile(
            characterId = character.id,
            characterName = character.name,
            pitch = pitch,
            speed = 1.0f,
            tone = tone,
            emotion = EmotionStyle.CALM,
            voiceType = voiceType,
            gender = gender,
            age = age,
            aiGenerated = false
        )
    }
    
    /**
     * Infer character traits from name and description
     */
    private fun inferCharacterTraits(character: BookCharacter): Pair<VoiceGender, VoiceAge> {
        val lowerName = character.name.lowercase()
        val lowerDesc = character.description.lowercase()
        
        // Gender inference (basic heuristics)
        val gender = when {
            lowerDesc.contains("he ") || lowerDesc.contains(" him ") -> VoiceGender.MALE
            lowerDesc.contains("she ") || lowerDesc.contains(" her ") -> VoiceGender.FEMALE
            else -> VoiceGender.NEUTRAL
        }
        
        // Age inference
        val age = when {
            lowerDesc.contains("child") || lowerDesc.contains("kid") -> VoiceAge.CHILD
            lowerDesc.contains("teen") || lowerDesc.contains("young") -> VoiceAge.TEEN
            lowerDesc.contains("old") || lowerDesc.contains("elderly") -> VoiceAge.ELDERLY
            lowerDesc.contains("middle-aged") -> VoiceAge.MIDDLE_AGED
            else -> VoiceAge.ADULT
        }
        
        return Pair(gender, age)
    }
    
    /**
     * Infer gender from name and description
     */
    private fun inferGender(name: String, description: String): VoiceGender {
        val lowerDesc = description.lowercase()
        return when {
            lowerDesc.contains("he ") || lowerDesc.contains(" him ") -> VoiceGender.MALE
            lowerDesc.contains("she ") || lowerDesc.contains(" her ") -> VoiceGender.FEMALE
            else -> VoiceGender.NEUTRAL
        }
    }
    
    /**
     * Infer age from description
     */
    private fun inferAge(description: String): VoiceAge {
        val lowerDesc = description.lowercase()
        return when {
            lowerDesc.contains("child") || lowerDesc.contains("kid") -> VoiceAge.CHILD
            lowerDesc.contains("teen") || lowerDesc.contains("young") -> VoiceAge.TEEN
            lowerDesc.contains("old") || lowerDesc.contains("elderly") -> VoiceAge.ELDERLY
            lowerDesc.contains("middle-aged") -> VoiceAge.MIDDLE_AGED
            else -> VoiceAge.ADULT
        }
    }
    
    /**
     * Map Gemini tone to our VoiceTone enum
     */
    private fun mapTone(tone: String): VoiceTone {
        return when (tone.lowercase()) {
            "warm" -> VoiceTone.WARM
            "cold" -> VoiceTone.COLD
            "harsh" -> VoiceTone.HARSH
            "soft" -> VoiceTone.SOFT
            "authoritative" -> VoiceTone.AUTHORITATIVE
            "friendly" -> VoiceTone.FRIENDLY
            "mysterious" -> VoiceTone.MYSTERIOUS
            else -> VoiceTone.NEUTRAL
        }
    }
    
    /**
     * Map Gemini emotion to our EmotionStyle enum
     */
    private fun mapEmotion(emotion: String): EmotionStyle {
        return when (emotion.lowercase()) {
            "calm" -> EmotionStyle.CALM
            "energetic" -> EmotionStyle.ENERGETIC
            "melancholic" -> EmotionStyle.MELANCHOLIC
            "cheerful" -> EmotionStyle.CHEERFUL
            "serious" -> EmotionStyle.SERIOUS
            "anxious" -> EmotionStyle.ANXIOUS
            "confident" -> EmotionStyle.CONFIDENT
            "variable" -> EmotionStyle.VARIABLE
            else -> EmotionStyle.CALM
        }
    }
    
    /**
     * Map Gemini voice type to our VoiceType enum
     */
    private fun mapVoiceType(voiceType: String): VoiceType {
        return when (voiceType.lowercase()) {
            "deep" -> VoiceType.DEEP
            "high" -> VoiceType.HIGH
            "bass" -> VoiceType.BASS
            "tenor" -> VoiceType.TENOR
            "alto" -> VoiceType.ALTO
            "soprano" -> VoiceType.SOPRANO
            else -> VoiceType.MEDIUM
        }
    }
    
    /**
     * Clear cached voices
     */
    fun clearCache() {
        characterVoices.clear()
    }
    
    /**
     * Get all cached voice profiles
     */
    fun getAllVoiceProfiles(): List<CharacterVoiceProfile> {
        return characterVoices.values.toList()
    }
}
