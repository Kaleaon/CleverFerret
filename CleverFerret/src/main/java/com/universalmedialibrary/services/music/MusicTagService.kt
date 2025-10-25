package com.universalmedialibrary.services.music

import android.content.Context
import com.google.ai.client.generativeai.GenerativeModel
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.music.MusicTag
import com.universalmedialibrary.data.music.MusicTagRepository
import com.universalmedialibrary.data.music.TagCategory
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.ui.music.Track
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for AI-powered tag suggestions
 */
@Singleton
class MusicTagService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository,
    private val tagRepository: MusicTagRepository
) {

    private var generativeModel: GenerativeModel? = null

    suspend fun initialize(): Boolean = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext false
        }

        try {
            val apiKey = apiKeyRepository.getGeminiApiKey()
            if (apiKey.isNullOrBlank()) {
                return@withContext false
            }

            generativeModel = GenerativeModel(
                modelName = "gemini-2.0-flash-exp",
                apiKey = apiKey
            )
            
            // Create predefined tags on first run
            tagRepository.createPredefinedTags()
            
            true
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Suggest tags for a track using AI
     */
    suspend fun suggestTagsForTrack(track: Track): TagSuggestionResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext TagSuggestionResult(
                success = false,
                error = "Gemini integration is disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext TagSuggestionResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }

        try {
            val prompt = """
                Analyze this music track and suggest relevant tags for organization:
                
                Title: ${track.title}
                Artist: ${track.artist}
                Album: ${track.album}
                Genre: ${track.genre}
                Year: ${track.year}
                
                Suggest tags in these categories:
                - MOOD: Emotional feeling (Happy, Sad, Energetic, Relaxing, Romantic, Angry, Peaceful, etc.)
                - ACTIVITY: When to listen (Workout, Study, Party, Sleep, Driving, Cooking, etc.)
                - TEMPO: Speed (Fast, Medium, Slow)
                - ERA: Time period if recognizable (60s, 70s, 80s, 90s, 2000s, 2010s, Modern)
                - THEME: Lyrical themes (Love, Breakup, Party, Adventure, Nostalgia, etc.)
                - OCCASION: Special events (Christmas, Halloween, Wedding, Summer, etc.)
                - SERIES: If part of soundtrack/series (Movie, TV Show, Game, etc.)
                - GENRE: Specific subgenres beyond the main genre
                
                Return ONLY valid JSON:
                {
                    "suggested_tags": [
                        {
                            "name": "tag name",
                            "category": "MOOD|ACTIVITY|TEMPO|ERA|THEME|OCCASION|SERIES|GENRE",
                            "confidence": 0.9,
                            "reason": "brief explanation"
                        }
                    ]
                }
                
                Guidelines:
                - Suggest 3-8 most relevant tags
                - High confidence (>0.7) only
                - Be specific and accurate
                - Return ONLY JSON, no markdown
            """.trimIndent()

            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""

            parseTagSuggestions(responseText)

        } catch (e: Exception) {
            TagSuggestionResult(
                success = false,
                error = "Error suggesting tags: ${e.message}"
            )
        }
    }

    /**
     * Suggest tags for multiple tracks (batch)
     */
    suspend fun suggestTagsForTracks(tracks: List<Track>): Map<Long, List<SuggestedTag>> = withContext(Dispatchers.IO) {
        val results = mutableMapOf<Long, List<SuggestedTag>>()
        
        tracks.forEach { track ->
            val result = suggestTagsForTrack(track)
            if (result.success) {
                results[track.id] = result.suggestedTags
            }
        }
        
        results
    }

    /**
     * Parse AI response into tag suggestions
     */
    private fun parseTagSuggestions(responseText: String): TagSuggestionResult {
        return try {
            val jsonText = responseText
                .replace("```json", "")
                .replace("```", "")
                .trim()

            val jsonStart = jsonText.indexOf("{")
            val jsonEnd = jsonText.lastIndexOf("}") + 1

            if (jsonStart < 0 || jsonEnd <= jsonStart) {
                return TagSuggestionResult(
                    success = false,
                    error = "Could not parse response"
                )
            }

            val json = jsonText.substring(jsonStart, jsonEnd)
            
            // Extract suggested_tags array
            val suggestedTags = mutableListOf<SuggestedTag>()
            val tagsArrayPattern = "\"suggested_tags\"\\s*:\\s*\\[(.*?)\\]".toRegex(RegexOption.DOT_MATCHES_ALL)
            val tagsArrayMatch = tagsArrayPattern.find(json)
            
            if (tagsArrayMatch != null) {
                val tagsContent = tagsArrayMatch.groupValues[1]
                
                // Extract individual tag objects
                val tagPattern = "\\{([^}]+)\\}".toRegex()
                tagPattern.findAll(tagsContent).forEach { match ->
                    val tagJson = match.value
                    
                    val name = extractJsonValue(tagJson, "name")
                    val category = extractJsonValue(tagJson, "category")
                    val confidence = extractJsonValue(tagJson, "confidence")?.toFloatOrNull() ?: 0.5f
                    val reason = extractJsonValue(tagJson, "reason")
                    
                    if (name != null && category != null) {
                        suggestedTags.add(
                            SuggestedTag(
                                name = name,
                                category = parseCategory(category),
                                confidence = confidence,
                                reason = reason
                            )
                        )
                    }
                }
            }

            TagSuggestionResult(
                success = true,
                suggestedTags = suggestedTags.filter { it.confidence >= 0.7f }
            )

        } catch (e: Exception) {
            TagSuggestionResult(
                success = false,
                error = "Error parsing suggestions: ${e.message}"
            )
        }
    }

    private fun extractJsonValue(json: String, key: String): String? {
        val pattern = "\"$key\"\\s*:\\s*\"([^\"]*)\"|\"$key\"\\s*:\\s*([0-9.]+)"
        val regex = Regex(pattern)
        val match = regex.find(json) ?: return null
        return match.groupValues[1].ifBlank { match.groupValues[2] }
    }

    private fun parseCategory(categoryStr: String): TagCategory {
        return when (categoryStr.uppercase()) {
            "MOOD" -> TagCategory.MOOD
            "ACTIVITY" -> TagCategory.ACTIVITY
            "TEMPO" -> TagCategory.TEMPO
            "ERA" -> TagCategory.ERA
            "THEME" -> TagCategory.THEME
            "OCCASION" -> TagCategory.OCCASION
            "SERIES" -> TagCategory.SERIES
            "GENRE" -> TagCategory.GENRE
            "INSTRUMENT" -> TagCategory.INSTRUMENT
            "LANGUAGE" -> TagCategory.LANGUAGE
            else -> TagCategory.CUSTOM
        }
    }

    fun isInitialized(): Boolean = generativeModel != null && FeatureFlags.ENABLE_GEMINI
}

/**
 * AI-suggested tag
 */
data class SuggestedTag(
    val name: String,
    val category: TagCategory,
    val confidence: Float,
    val reason: String?
)

/**
 * Result of tag suggestion
 */
data class TagSuggestionResult(
    val success: Boolean,
    val suggestedTags: List<SuggestedTag> = emptyList(),
    val error: String? = null
)
