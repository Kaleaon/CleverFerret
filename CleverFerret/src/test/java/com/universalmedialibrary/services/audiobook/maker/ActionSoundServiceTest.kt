package com.universalmedialibrary.services.audiobook.maker

import kotlinx.coroutines.test.runTest
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test

/**
 * Tests for ActionSoundService
 */
class ActionSoundServiceTest {
    
    private lateinit var actionSoundService: ActionSoundService
    
    @Before
    fun setup() {
        actionSoundService = ActionSoundService()
    }
    
    @Test
    fun testInitialSoundsLoaded() {
        val allSounds = actionSoundService.getAllSounds()
        assertTrue("Sound library should not be empty", allSounds.isNotEmpty())
        assertTrue("Should have at least 20 sounds", allSounds.size >= 20)
    }
    
    @Test
    fun testGetSoundById() {
        val sound = actionSoundService.getSound("sword_clash_1")
        assertNotNull("Sword clash sound should exist", sound)
        assertEquals("sword_clash_1", sound?.id)
        assertEquals(ActionSoundCategory.SWORD_CLASH, sound?.category)
    }
    
    @Test
    fun testDetectActionSoundsInFantasyText() = runTest {
        val text = "The knight drew his sword and clashed with the dragon's claws."
        val sounds = actionSoundService.detectActionSounds(text, BookGenre.FANTASY, 10)
        
        assertTrue("Should detect sword clash", sounds.any { it.category == ActionSoundCategory.SWORD_CLASH })
        assertTrue("Should detect dragon", sounds.any { it.category == ActionSoundCategory.DRAGON_ROAR })
    }
    
    @Test
    fun testDetectActionSoundsInSciFiText() = runTest {
        val text = "The spaceship fired its laser blaster at the enemy vessel."
        val sounds = actionSoundService.detectActionSounds(text, BookGenre.SCIENCE_FICTION, 10)
        
        assertTrue("Should detect laser", sounds.any { it.category == ActionSoundCategory.LASER_BLAST })
        assertTrue("Should detect spaceship", sounds.any { it.category == ActionSoundCategory.SPACESHIP })
    }
    
    @Test
    fun testGenreFiltering_NoModernSoundsInFantasy() = runTest {
        val text = "The wizard cast a spell while a car drove by."
        val sounds = actionSoundService.detectActionSounds(text, BookGenre.FANTASY, 10)
        
        // Should detect spell but not car
        assertTrue("Should detect spell", sounds.any { it.category == ActionSoundCategory.SPELL_CAST })
        assertFalse("Should not detect car in fantasy", sounds.any { it.category == ActionSoundCategory.CAR_ENGINE })
    }
    
    @Test
    fun testGenreFiltering_NoFantasySoundsInSciFi() = runTest {
        val text = "The hero wielded a lightsaber and cast a magic spell."
        val sounds = actionSoundService.detectActionSounds(text, BookGenre.SCIENCE_FICTION, 10)
        
        // Should detect lightsaber but not magic spell
        assertTrue("Should detect lightsaber", sounds.any { it.category == ActionSoundCategory.LIGHTSABER })
        assertFalse("Should not detect magic spell in sci-fi", sounds.any { it.category == ActionSoundCategory.SPELL_CAST })
    }
    
    @Test
    fun testGetSoundsByCategory() {
        val combatSounds = actionSoundService.getSoundsByCategory(ActionSoundCategory.SWORD_CLASH)
        assertTrue("Should have sword clash sounds", combatSounds.isNotEmpty())
        assertTrue("All sounds should be sword clash", combatSounds.all { it.category == ActionSoundCategory.SWORD_CLASH })
    }
    
    @Test
    fun testGetSoundsForGenre() {
        val fantasySounds = actionSoundService.getSoundsForGenre(BookGenre.FANTASY)
        val scifiSounds = actionSoundService.getSoundsForGenre(BookGenre.SCIENCE_FICTION)
        
        // Fantasy should have swords but not lasers
        assertTrue("Fantasy should have sword sounds", 
            fantasySounds.any { it.category == ActionSoundCategory.SWORD_CLASH })
        assertFalse("Fantasy should not have laser sounds", 
            fantasySounds.any { it.category == ActionSoundCategory.LASER_BLAST })
        
        // Sci-fi should have lasers but not swords
        assertTrue("Sci-fi should have laser sounds", 
            scifiSounds.any { it.category == ActionSoundCategory.LASER_BLAST })
        assertFalse("Sci-fi should not have sword sounds", 
            scifiSounds.any { it.category == ActionSoundCategory.SWORD_CLASH })
    }
    
    @Test
    fun testAddCustomSound() {
        val customSound = ActionSound(
            id = "custom_test",
            name = "Test Sound",
            category = ActionSoundCategory.CUSTOM,
            keywords = listOf("test", "custom")
        )
        
        actionSoundService.addSound(customSound)
        
        val retrieved = actionSoundService.getSound("custom_test")
        assertNotNull("Custom sound should be retrievable", retrieved)
        assertEquals("custom_test", retrieved?.id)
    }
}
