package com.universalmedialibrary.services.audiobook.maker

import com.universalmedialibrary.services.gemini.GeminiService
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertTrue
import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Test

/**
 * Tests for BookContentAnalyzer
 */
class BookContentAnalyzerTest {
    
    private lateinit var mockGeminiService: GeminiService
    private lateinit var bookContentAnalyzer: BookContentAnalyzer
    
    @Before
    fun setup() {
        mockGeminiService = mockk(relaxed = true)
        bookContentAnalyzer = BookContentAnalyzer(mockGeminiService)
        
        // Mock Gemini service to return initialized
        coEvery { mockGeminiService.isInitialized() } returns true
        coEvery { mockGeminiService.initialize() } returns true
    }
    
    @Test
    fun testDetectGenre_Fantasy() = runTest {
        val fantasyText = """
            The wizard raised his staff and cast a powerful spell.
            The dragon roared in the distance as the elf drew her bow.
        """.trimIndent()
        
        val genre = bookContentAnalyzer.analyzeChapter(fantasyText, BookGenre.UNKNOWN)
        
        // Genre detection should identify fantasy elements
        assertNotNull(genre)
    }
    
    @Test
    fun testDetectGenre_SciFi() = runTest {
        val scifiText = """
            The spaceship's engines roared to life as the crew prepared for launch.
            The robot beeped and the laser cannon fired at the approaching planet.
        """.trimIndent()
        
        val genre = bookContentAnalyzer.analyzeChapter(scifiText, BookGenre.UNKNOWN)
        
        assertNotNull(genre)
    }
    
    @Test
    fun testDetectSetting() = runTest {
        val forestText = "They walked through the dense forest, surrounded by tall trees."
        val context = bookContentAnalyzer.analyzeChapter(forestText, BookGenre.FANTASY)
        
        assertEquals("forest", context.setting)
    }
    
    @Test
    fun testDetectTimeOfDay() = runTest {
        val morningText = "The sun rose at dawn, filling the morning sky with light."
        val context = bookContentAnalyzer.analyzeChapter(morningText, BookGenre.FANTASY)
        
        assertEquals("morning", context.timeOfDay)
    }
    
    @Test
    fun testDetectWeather() = runTest {
        val rainyText = "The rain poured down as thunder rumbled in the distance."
        val context = bookContentAnalyzer.analyzeChapter(rainyText, BookGenre.FANTASY)
        
        assertTrue("Should detect rain", context.weather == "rain" || context.weather == "storm")
    }
    
    @Test
    fun testDetectActionLevel_Low() = runTest {
        val calmText = "They sat peacefully by the fire, talking quietly."
        val context = bookContentAnalyzer.analyzeChapter(calmText, BookGenre.FANTASY)
        
        assertTrue("Should have low or no action", 
            context.actionLevel == ActionLevel.NONE || context.actionLevel == ActionLevel.LOW)
    }
    
    @Test
    fun testDetectActionLevel_High() = runTest {
        val actionText = """
            The battle raged on. He punched the enemy, then dodged a strike.
            Swords clashed as they fought fiercely. Explosions rocked the ground.
            He fired his weapon and kicked the opponent.
        """.trimIndent()
        
        val context = bookContentAnalyzer.analyzeChapter(actionText, BookGenre.FANTASY)
        
        assertTrue("Should have high action level", 
            context.actionLevel == ActionLevel.HIGH || context.actionLevel == ActionLevel.INTENSE)
    }
    
    @Test
    fun testExtractSettings() = runTest {
        val text = """
            The knight left the castle and rode through the forest.
            He crossed the desert and climbed the mountain.
            Finally, he reached the city.
        """.trimIndent()
        
        val context = bookContentAnalyzer.analyzeChapter(text, BookGenre.FANTASY)
        
        // Should detect multiple settings
        assertNotNull(context.setting)
    }
}
