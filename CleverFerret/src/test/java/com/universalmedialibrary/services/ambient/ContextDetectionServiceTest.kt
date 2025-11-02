package com.universalmedialibrary.services.ambient

import com.universalmedialibrary.data.local.dao.AmbientSoundDao
import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientCategory
import com.universalmedialibrary.data.local.entity.AmbientSoundType
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test
import org.mockito.kotlin.mock
import org.mockito.kotlin.whenever
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Unit tests for ContextDetectionService
 */
class ContextDetectionServiceTest {

    private lateinit var mockDao: AmbientSoundDao
    private lateinit var contextDetectionService: ContextDetectionService

    @Before
    fun setup() {
        mockDao = mock()
        contextDetectionService = ContextDetectionService(mockDao)
    }

    @Test
    fun `detectTimeContext should detect morning`() {
        val text = "She woke up at dawn, as the sun was rising over the horizon."
        val result = contextDetectionService.detectTimeContext(text)
        
        assertEquals(TimeContext.MORNING, result)
    }

    @Test
    fun `detectTimeContext should detect night`() {
        val text = "The night was dark and the stars shone brightly in the midnight sky."
        val result = contextDetectionService.detectTimeContext(text)
        
        assertEquals(TimeContext.NIGHT, result)
    }

    @Test
    fun `detectWeatherContext should detect rain`() {
        val text = "It was raining heavily, the storm clouds gathering overhead."
        val result = contextDetectionService.detectWeatherContext(text)
        
        assertTrue(result.contains(AmbientSoundType.RAIN))
    }

    @Test
    fun `detectWeatherContext should detect thunder`() {
        val text = "Thunder rumbled in the distance as lightning lit up the sky."
        val result = contextDetectionService.detectWeatherContext(text)
        
        assertTrue(result.contains(AmbientSoundType.THUNDER))
    }

    @Test
    fun `detectLocationContext should detect cafe`() {
        val text = "They met at the coffee shop, the aroma of freshly brewed coffee filling the air."
        val result = contextDetectionService.detectLocationContext(text)
        
        assertTrue(result.contains(AmbientSoundType.CAFE))
    }

    @Test
    fun `detectLocationContext should detect library`() {
        val text = "In the quiet reading room of the library, she opened her book."
        val result = contextDetectionService.detectLocationContext(text)
        
        assertTrue(result.contains(AmbientSoundType.LIBRARY))
    }

    @Test
    fun `detectLocationContext should detect forest`() {
        val text = "They walked through the dense forest, surrounded by tall trees."
        val result = contextDetectionService.detectLocationContext(text)
        
        assertTrue(result.contains(AmbientSoundType.FOREST))
    }

    @Test
    fun `detectAmbientContext should return matching sounds`() = runTest {
        // Create test ambient sounds
        val testSounds = listOf(
            AmbientSound(
                id = 1,
                name = "Rain",
                category = AmbientCategory.WEATHER,
                soundType = AmbientSoundType.RAIN,
                keywords = listOf("rain", "raining")
            ),
            AmbientSound(
                id = 2,
                name = "Cafe",
                category = AmbientCategory.INDOOR,
                soundType = AmbientSoundType.CAFE,
                keywords = listOf("cafe", "coffee shop")
            )
        )

        // Mock the DAO to return test sounds
        whenever(mockDao.getAllEnabledSounds()).thenReturn(flowOf(testSounds))

        val text = "It was raining outside the coffee shop"
        val result = contextDetectionService.detectAmbientContext(text, maxResults = 5)
        
        // Should detect both rain and cafe sounds
        assertTrue(result.size >= 2)
        assertTrue(result.any { it.first.soundType == AmbientSoundType.RAIN })
        assertTrue(result.any { it.first.soundType == AmbientSoundType.CAFE })
    }

    @Test
    fun `getSuggestionsForChapter should analyze text and return suggestions`() = runTest {
        val testSounds = listOf(
            AmbientSound(
                id = 1,
                name = "Ocean",
                category = AmbientCategory.WATER,
                soundType = AmbientSoundType.OCEAN,
                keywords = listOf("ocean", "sea", "beach", "waves")
            )
        )

        whenever(mockDao.getAllEnabledSounds()).thenReturn(flowOf(testSounds))

        val chapterText = "The waves crashed against the shore as she walked along the beach."
        val suggestions = contextDetectionService.getSuggestionsForChapter(chapterText)
        
        assertTrue(suggestions.recommendedSounds.isNotEmpty())
        assertTrue(suggestions.recommendedSounds.any { it.soundType == AmbientSoundType.OCEAN })
    }
}
