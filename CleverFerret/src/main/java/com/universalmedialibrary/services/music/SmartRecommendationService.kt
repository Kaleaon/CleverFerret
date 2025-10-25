package com.universalmedialibrary.services.music

import android.content.Context
import com.google.ai.client.generativeai.GenerativeModel
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.ui.music.Track
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Smart music recommendations using AI
 */
@Singleton
class SmartRecommendationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository
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
            true
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Get smart recommendations based on listening history
     */
    suspend fun getRecommendations(
        recentTracks: List<Track>,
        library: List<Track>
    ): RecommendationResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext RecommendationResult(
                success = false,
                error = "AI recommendations are disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext RecommendationResult(
                success = false,
                error = "Recommendation service not initialized"
            )
        }

        try {
            val recentInfo = recentTracks.take(20).joinToString("\n") { track ->
                "${track.title} by ${track.artist} (${track.genre}, ${track.year})"
            }

            val libraryInfo = library.shuffled().take(50).joinToString("\n") { track ->
                "${track.title} by ${track.artist} (${track.genre}, ${track.year})"
            }

            val prompt = """
                Based on these recently played tracks:
                $recentInfo
                
                And this music library:
                $libraryInfo
                
                Recommend 10 tracks from the library that the user might enjoy next.
                Consider:
                - Musical similarity (genre, era, mood)
                - Artist connections
                - Listening patterns
                - Variety (don't recommend same artist/album repeatedly)
                
                Return ONLY valid JSON:
                {
                    "recommendations": [
                        {
                            "title": "track title",
                            "artist": "artist name",
                            "reason": "brief reason for recommendation",
                            "confidence": 0.9
                        }
                    ]
                }
                
                Guidelines:
                - Recommend exactly 10 tracks
                - High confidence (>0.6) only
                - Brief, specific reasons
                - Mix of similar and discovery
                - Return ONLY JSON, no markdown
            """.trimIndent()

            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""

            parseRecommendations(responseText, library)

        } catch (e: Exception) {
            RecommendationResult(
                success = false,
                error = "Error getting recommendations: ${e.message}"
            )
        }
    }

    /**
     * Get mood-based recommendations
     */
    suspend fun getMoodRecommendations(
        mood: String,
        library: List<Track>
    ): RecommendationResult = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext RecommendationResult(
                success = false,
                error = "AI recommendations are disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext RecommendationResult(
                success = false,
                error = "Recommendation service not initialized"
            )
        }

        try {
            val libraryInfo = library.shuffled().take(100).joinToString("\n") { track ->
                "${track.title} by ${track.artist} (${track.genre}, ${track.year})"
            }

            val prompt = """
                Based on the mood: "$mood"
                
                Recommend 15-20 tracks from this library that match:
                $libraryInfo
                
                Return ONLY valid JSON:
                {
                    "recommendations": [
                        {
                            "title": "track title",
                            "artist": "artist name",
                            "reason": "why it matches the mood",
                            "confidence": 0.9
                        }
                    ]
                }
                
                Guidelines:
                - Match the mood/vibe closely
                - 15-20 tracks
                - High confidence (>0.6)
                - Return ONLY JSON
            """.trimIndent()

            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""

            parseRecommendations(responseText, library)

        } catch (e: Exception) {
            RecommendationResult(
                success = false,
                error = "Error getting mood recommendations: ${e.message}"
            )
        }
    }

    private fun parseRecommendations(responseText: String, library: List<Track>): RecommendationResult {
        return try {
            val jsonText = responseText
                .replace("```json", "")
                .replace("```", "")
                .trim()

            val jsonStart = jsonText.indexOf("{")
            val jsonEnd = jsonText.lastIndexOf("}") + 1

            if (jsonStart < 0 || jsonEnd <= jsonStart) {
                return RecommendationResult(
                    success = false,
                    error = "Could not parse response"
                )
            }

            val json = jsonText.substring(jsonStart, jsonEnd)
            
            val recommendations = mutableListOf<Recommendation>()
            val recsArrayPattern = "\"recommendations\"\\s*:\\s*\\[(.*?)\\]".toRegex(RegexOption.DOT_MATCHES_ALL)
            val recsArrayMatch = recsArrayPattern.find(json)
            
            if (recsArrayMatch != null) {
                val recsContent = recsArrayMatch.groupValues[1]
                
                val recPattern = "\\{([^}]+)\\}".toRegex()
                recPattern.findAll(recsContent).forEach { match ->
                    val recJson = match.value
                    
                    val title = extractJsonValue(recJson, "title")
                    val artist = extractJsonValue(recJson, "artist")
                    val reason = extractJsonValue(recJson, "reason")
                    val confidence = extractJsonValue(recJson, "confidence")?.toFloatOrNull() ?: 0.5f
                    
                    if (title != null && artist != null) {
                        // Find matching track in library
                        val track = library.firstOrNull {
                            it.title?.contains(title, ignoreCase = true) == true &&
                            it.artist?.contains(artist, ignoreCase = true) == true
                        }
                        
                        if (track != null && confidence >= 0.6f) {
                            recommendations.add(
                                Recommendation(
                                    track = track,
                                    reason = reason ?: "Recommended for you",
                                    confidence = confidence
                                )
                            )
                        }
                    }
                }
            }

            RecommendationResult(
                success = true,
                recommendations = recommendations.distinctBy { it.track.id }
            )

        } catch (e: Exception) {
            RecommendationResult(
                success = false,
                error = "Error parsing recommendations: ${e.message}"
            )
        }
    }

    private fun extractJsonValue(json: String, key: String): String? {
        val pattern = "\"$key\"\\s*:\\s*\"([^\"]*)\"|\"$key\"\\s*:\\s*([0-9.]+)"
        val regex = Regex(pattern)
        val match = regex.find(json) ?: return null
        return match.groupValues[1].ifBlank { match.groupValues[2] }
    }

    fun isInitialized(): Boolean = generativeModel != null && FeatureFlags.ENABLE_GEMINI
}

data class Recommendation(
    val track: Track,
    val reason: String,
    val confidence: Float
)

data class RecommendationResult(
    val success: Boolean,
    val recommendations: List<Recommendation> = emptyList(),
    val error: String? = null
)
