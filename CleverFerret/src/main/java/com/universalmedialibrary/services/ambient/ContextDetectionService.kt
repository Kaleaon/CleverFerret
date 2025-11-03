package com.universalmedialibrary.services.ambient

import com.universalmedialibrary.data.local.dao.AmbientSoundDao
import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientSoundType
import kotlinx.coroutines.flow.first
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for detecting context from book content and suggesting ambient sounds
 * Uses keyword matching and basic NLP to analyze text
 */
@Singleton
class ContextDetectionService @Inject constructor(
    private val ambientSoundDao: AmbientSoundDao
) {
    
    /**
     * Analyze text content and detect appropriate ambient sounds
     * Returns a list of sounds ranked by relevance
     */
    suspend fun detectAmbientContext(text: String, maxResults: Int = 3): List<Pair<AmbientSound, Float>> {
        if (text.isBlank()) return emptyList()
        
        val lowercaseText = text.lowercase()
        val words = lowercaseText.split(Regex("\\s+"))
        val allSounds = ambientSoundDao.getAllEnabledSounds().first()
        
        // Calculate relevance score for each sound
        val scoredSounds = allSounds.mapNotNull { sound ->
            val score = calculateRelevanceScore(sound, lowercaseText, words)
            if (score > 0f) {
                sound to score
            } else {
                null
            }
        }
        
        // Return top results sorted by score
        return scoredSounds
            .sortedByDescending { it.second }
            .take(maxResults)
    }
    
    /**
     * Calculate relevance score for a sound based on keyword matches
     */
    private fun calculateRelevanceScore(sound: AmbientSound, text: String, words: List<String>): Float {
        var score = 0f
        val keywords = sound.keywords
        
        if (keywords.isEmpty()) return 0f
        
        // Count exact phrase matches (higher weight)
        keywords.forEach { keyword ->
            if (text.contains(keyword)) {
                score += 2f
            }
        }
        
        // Count individual word matches (lower weight)
        keywords.forEach { keyword ->
            val keywordWords = keyword.split(Regex("\\s+"))
            keywordWords.forEach { keywordWord ->
                if (words.contains(keywordWord)) {
                    score += 0.5f
                }
            }
        }
        
        return score
    }
    
    /**
     * Detect time of day context from text
     */
    fun detectTimeContext(text: String): TimeContext? {
        val lowercaseText = text.lowercase()
        
        return when {
            containsAny(lowercaseText, listOf("morning", "dawn", "sunrise", "breakfast")) -> TimeContext.MORNING
            containsAny(lowercaseText, listOf("afternoon", "lunch", "midday", "noon")) -> TimeContext.AFTERNOON
            containsAny(lowercaseText, listOf("evening", "dusk", "sunset", "dinner")) -> TimeContext.EVENING
            containsAny(lowercaseText, listOf("night", "midnight", "dark", "nocturnal")) -> TimeContext.NIGHT
            else -> null
        }
    }
    
    /**
     * Detect weather context from text
     */
    fun detectWeatherContext(text: String): List<AmbientSoundType> {
        val lowercaseText = text.lowercase()
        val detectedWeather = mutableListOf<AmbientSoundType>()
        
        if (containsAny(lowercaseText, AmbientSoundType.RAIN.keywords)) {
            detectedWeather.add(AmbientSoundType.RAIN)
        }
        if (containsAny(lowercaseText, AmbientSoundType.THUNDER.keywords)) {
            detectedWeather.add(AmbientSoundType.THUNDER)
        }
        if (containsAny(lowercaseText, AmbientSoundType.SNOW.keywords)) {
            detectedWeather.add(AmbientSoundType.SNOW)
        }
        if (containsAny(lowercaseText, AmbientSoundType.WIND.keywords)) {
            detectedWeather.add(AmbientSoundType.WIND)
        }
        
        return detectedWeather
    }
    
    /**
     * Detect location context from text
     */
    fun detectLocationContext(text: String): List<AmbientSoundType> {
        val lowercaseText = text.lowercase()
        val detectedLocations = mutableListOf<AmbientSoundType>()
        
        if (containsAny(lowercaseText, AmbientSoundType.CAFE.keywords)) {
            detectedLocations.add(AmbientSoundType.CAFE)
        }
        if (containsAny(lowercaseText, AmbientSoundType.LIBRARY.keywords)) {
            detectedLocations.add(AmbientSoundType.LIBRARY)
        }
        if (containsAny(lowercaseText, AmbientSoundType.FOREST.keywords)) {
            detectedLocations.add(AmbientSoundType.FOREST)
        }
        if (containsAny(lowercaseText, AmbientSoundType.OCEAN.keywords)) {
            detectedLocations.add(AmbientSoundType.OCEAN)
        }
        if (containsAny(lowercaseText, AmbientSoundType.CITY.keywords)) {
            detectedLocations.add(AmbientSoundType.CITY)
        }
        if (containsAny(lowercaseText, AmbientSoundType.TRAIN.keywords)) {
            detectedLocations.add(AmbientSoundType.TRAIN)
        }
        
        return detectedLocations
    }
    
    /**
     * Get ambient suggestions based on chapter content
     * Analyzes a larger section of text for better context
     */
    suspend fun getSuggestionsForChapter(chapterText: String): AmbientSuggestions {
        // Analyze first 1000 words for context
        val sampleText = chapterText.take(3000)
        
        val topSounds = detectAmbientContext(sampleText, 5)
        val timeContext = detectTimeContext(sampleText)
        val weatherContext = detectWeatherContext(sampleText)
        val locationContext = detectLocationContext(sampleText)
        
        return AmbientSuggestions(
            recommendedSounds = topSounds.map { it.first },
            timeOfDay = timeContext,
            detectedWeather = weatherContext,
            detectedLocations = locationContext,
            confidence = if (topSounds.isNotEmpty()) topSounds.first().second else 0f
        )
    }
    
    private fun containsAny(text: String, keywords: List<String>): Boolean {
        return keywords.any { text.contains(it) }
    }
}

/**
 * Time context for ambient sounds
 */
enum class TimeContext {
    MORNING,
    AFTERNOON,
    EVENING,
    NIGHT
}

/**
 * Ambient suggestions result
 */
data class AmbientSuggestions(
    val recommendedSounds: List<AmbientSound>,
    val timeOfDay: TimeContext?,
    val detectedWeather: List<AmbientSoundType>,
    val detectedLocations: List<AmbientSoundType>,
    val confidence: Float
)
