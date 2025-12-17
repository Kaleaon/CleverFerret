package com.universalmedialibrary.services.audiobook.maker

import com.universalmedialibrary.services.ai.GeminiTTSService
import com.universalmedialibrary.services.ai.VoiceProfile
import com.universalmedialibrary.services.tts.TtsProviderManager
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertTrue
import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test

/**
 * Tests for CharacterVoiceService
 */
class CharacterVoiceServiceTest {
    
    private lateinit var mockGeminiTtsService: GeminiTTSService
    private lateinit var mockTtsProviderManager: TtsProviderManager
    private lateinit var characterVoiceService: CharacterVoiceService
    
    @Before
    fun setup() {
        mockGeminiTtsService = mockk(relaxed = true)
        mockTtsProviderManager = mockk(relaxed = true)
        characterVoiceService = CharacterVoiceService(mockGeminiTtsService, mockTtsProviderManager)
    }
    
    @Test
    fun testGenerateVoiceProfile() = runTest {
        val character = BookCharacter(
            id = "hero",
            name = "Hero",
            description = "A brave young warrior",
            voiceProfile = CharacterVoiceProfile("hero", "Hero"),
            sampleDialogue = listOf("I will protect you!")
        )
        
        // Mock Gemini TTS response
        coEvery { mockGeminiTtsService.generateVoiceProfile(any(), any(), any()) } returns 
            VoiceProfile(
                characterName = "Hero",
                pitch = 1.0f,
                speed = 1.0f,
                tone = "neutral",
                emotion = "calm",
                voiceType = "medium"
            )
        
        val profile = characterVoiceService.generateVoiceProfile(character, BookGenre.FANTASY)
        
        assertNotNull("Profile should be generated", profile)
        assertEquals("hero", profile.characterId)
        assertEquals("Hero", profile.characterName)
    }
    
    @Test
    fun testCacheVoiceProfile() = runTest {
        val character = BookCharacter(
            id = "villain",
            name = "Villain",
            description = "A dark sorcerer",
            voiceProfile = CharacterVoiceProfile("villain", "Villain")
        )
        
        coEvery { mockGeminiTtsService.generateVoiceProfile(any(), any(), any()) } returns 
            VoiceProfile(
                characterName = "Villain",
                pitch = 0.8f,
                speed = 0.9f,
                tone = "cold",
                emotion = "serious",
                voiceType = "deep"
            )
        
        // Generate profile (should cache it)
        val profile1 = characterVoiceService.generateVoiceProfile(character, BookGenre.FANTASY)
        
        // Retrieve from cache
        val profile2 = characterVoiceService.getVoiceProfile("villain")
        
        assertNotNull("Cached profile should exist", profile2)
        assertEquals(profile1, profile2)
    }
    
    @Test
    fun testCreateNarratorVoice() {
        val narratorVoice = characterVoiceService.createNarratorVoice(BookGenre.FANTASY)
        
        assertEquals("narrator", narratorVoice.characterId)
        assertEquals("Narrator", narratorVoice.characterName)
        assertEquals(1.0f, narratorVoice.pitch, 0.01f)
        assertEquals(1.0f, narratorVoice.speed, 0.01f)
    }
    
    @Test
    fun testGenreAdjustments_Fantasy() = runTest {
        val character = BookCharacter(
            id = "elf",
            name = "Elf",
            description = "An elven archer",
            voiceProfile = CharacterVoiceProfile("elf", "Elf")
        )
        
        coEvery { mockGeminiTtsService.generateVoiceProfile(any(), any(), any()) } returns 
            VoiceProfile(
                characterName = "Elf",
                pitch = 1.1f,
                speed = 1.0f,
                tone = "neutral",
                emotion = "calm",
                voiceType = "high"
            )
        
        val profile = characterVoiceService.generateVoiceProfile(character, BookGenre.FANTASY)
        
        // Fantasy genre should influence tone
        assertTrue("Fantasy should have warm or appropriate tone", 
            profile.tone == VoiceTone.WARM || profile.tone == VoiceTone.NEUTRAL)
    }
    
    @Test
    fun testGenreAdjustments_Horror() = runTest {
        val character = BookCharacter(
            id = "ghost",
            name = "Ghost",
            description = "A haunting spirit",
            voiceProfile = CharacterVoiceProfile("ghost", "Ghost")
        )
        
        coEvery { mockGeminiTtsService.generateVoiceProfile(any(), any(), any()) } returns 
            VoiceProfile(
                characterName = "Ghost",
                pitch = 0.9f,
                speed = 1.0f,
                tone = "cold",
                emotion = "calm",
                voiceType = "medium"
            )
        
        val profile = characterVoiceService.generateVoiceProfile(character, BookGenre.HORROR)
        
        // Horror should have anxious emotion
        assertEquals(EmotionStyle.ANXIOUS, profile.emotion)
        assertTrue("Horror should slow down speech slightly", profile.speed <= 1.0f)
    }
    
    @Test
    fun testUpdateVoiceProfile() {
        val profile = CharacterVoiceProfile(
            characterId = "test",
            characterName = "Test",
            pitch = 1.0f,
            speed = 1.0f
        )
        
        characterVoiceService.updateVoiceProfile(profile)
        
        val retrieved = characterVoiceService.getVoiceProfile("test")
        assertEquals(profile, retrieved)
    }
    
    @Test
    fun testClearCache() = runTest {
        val character = BookCharacter(
            id = "temp",
            name = "Temp",
            description = "Temporary character",
            voiceProfile = CharacterVoiceProfile("temp", "Temp")
        )
        
        coEvery { mockGeminiTtsService.generateVoiceProfile(any(), any(), any()) } returns 
            VoiceProfile(characterName = "Temp")
        
        characterVoiceService.generateVoiceProfile(character, BookGenre.FANTASY)
        assertNotNull("Profile should exist", characterVoiceService.getVoiceProfile("temp"))
        
        characterVoiceService.clearCache()
        assertNull("Profile should be cleared", characterVoiceService.getVoiceProfile("temp"))
    }
    
    @Test
    fun testGetAllVoiceProfiles() = runTest {
        val character1 = BookCharacter(
            id = "char1",
            name = "Character1",
            voiceProfile = CharacterVoiceProfile("char1", "Character1")
        )
        val character2 = BookCharacter(
            id = "char2",
            name = "Character2",
            voiceProfile = CharacterVoiceProfile("char2", "Character2")
        )
        
        coEvery { mockGeminiTtsService.generateVoiceProfile(any(), any(), any()) } returns 
            VoiceProfile(characterName = "Test")
        
        characterVoiceService.generateVoiceProfile(character1, BookGenre.FANTASY)
        characterVoiceService.generateVoiceProfile(character2, BookGenre.FANTASY)
        
        val allProfiles = characterVoiceService.getAllVoiceProfiles()
        assertEquals(2, allProfiles.size)
    }
}
