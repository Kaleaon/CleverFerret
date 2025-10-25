package com.universalmedialibrary.services.music

import android.content.Context
import com.google.ai.client.generativeai.GenerativeModel
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for fetching artist biographical information using Gemini AI
 * 
 * Features:
 * - Artist biography
 * - Formation/career start date
 * - Interesting facts
 * - Genre information
 * - Active years
 * - Notable achievements
 */
@Singleton
class ArtistInfoService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository,
    private val artistInfoCache: ArtistInfoCacheRepository
) {

    private var generativeModel: GenerativeModel? = null

    /**
     * Initialize the service with API key
     */
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
     * Fetch comprehensive artist information
     * First checks cache, then queries Gemini if not found
     */
    suspend fun getArtistInfo(artistName: String, forceRefresh: Boolean = false): ArtistInfoResult = withContext(Dispatchers.IO) {
        if (artistName.isBlank() || artistName == "Unknown Artist" || artistName == "<unknown>") {
            return@withContext ArtistInfoResult(
                success = false,
                error = "Invalid artist name"
            )
        }

        // Check cache first (unless forcing refresh)
        if (!forceRefresh) {
            val cached = artistInfoCache.getArtistInfo(artistName)
            if (cached != null) {
                return@withContext ArtistInfoResult(
                    success = true,
                    artistInfo = cached,
                    fromCache = true
                )
            }
        }

        // Query Gemini if not in cache
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext ArtistInfoResult(
                success = false,
                error = "Gemini integration is disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext ArtistInfoResult(
                success = false,
                error = "Gemini service not initialized"
            )
        }

        try {
            val prompt = """
                Provide comprehensive information about the music artist/band: "$artistName"
                
                Return ONLY valid JSON in this exact format:
                {
                    "name": "official artist/band name",
                    "biography": "concise 2-3 sentence biography covering their career and impact",
                    "startYear": "year started (e.g., 1965, 1990) or 'Unknown'",
                    "endYear": "year ended if disbanded/deceased, or 'Present' if still active",
                    "origin": "country or city of origin",
                    "genres": ["primary genre", "secondary genre"],
                    "members": ["member1", "member2"] or [] if solo,
                    "facts": [
                        "interesting fact 1 (be specific and verifiable)",
                        "interesting fact 2 (include achievements, records, or unique trivia)",
                        "interesting fact 3 (focus on cultural impact or notable works)"
                    ],
                    "notableWorks": ["album/song 1", "album/song 2", "album/song 3"],
                    "awards": ["award 1", "award 2"] or [],
                    "influences": ["influence 1", "influence 2"],
                    "website": "official website URL or empty string",
                    "confidence": 0.95
                }
                
                Guidelines:
                - Use accurate, verifiable information from your training data
                - Keep biography concise but informative (2-3 sentences max)
                - Include 3-5 interesting facts that are specific and notable
                - Set confidence lower (0.3-0.7) if artist is obscure or information is uncertain
                - For very obscure artists, return confidence: 0.2 and minimal information
                - Facts should be interesting trivia, not basic info like "they are a band"
                - Notable works should be their most famous songs/albums
                - Return ONLY the JSON, no markdown formatting, no extra text
            """.trimIndent()

            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""

            parseArtistInfoResponse(artistName, responseText)

        } catch (e: Exception) {
            ArtistInfoResult(
                success = false,
                error = "Error fetching artist info: ${e.message}"
            )
        }
    }

    /**
     * Parse JSON response from Gemini and cache if successful
     */
    private suspend fun parseArtistInfoResponse(
        artistName: String,
        responseText: String
    ): ArtistInfoResult {
        return try {
            // Extract JSON from response (may be wrapped in markdown code blocks)
            val jsonText = responseText
                .replace("```json", "")
                .replace("```", "")
                .trim()

            val jsonStart = jsonText.indexOf("{")
            val jsonEnd = jsonText.lastIndexOf("}") + 1

            if (jsonStart < 0 || jsonEnd <= jsonStart) {
                return ArtistInfoResult(
                    success = false,
                    error = "Could not parse response"
                )
            }

            val json = jsonText.substring(jsonStart, jsonEnd)

            val artistInfo = ArtistInfo(
                name = extractJsonValue(json, "name") ?: artistName,
                biography = extractJsonValue(json, "biography") ?: "",
                startYear = extractJsonValue(json, "startYear") ?: "Unknown",
                endYear = extractJsonValue(json, "endYear") ?: "Present",
                origin = extractJsonValue(json, "origin") ?: "",
                genres = extractJsonArray(json, "genres"),
                members = extractJsonArray(json, "members"),
                facts = extractJsonArray(json, "facts"),
                notableWorks = extractJsonArray(json, "notableWorks"),
                awards = extractJsonArray(json, "awards"),
                influences = extractJsonArray(json, "influences"),
                website = extractJsonValue(json, "website") ?: "",
                confidence = extractJsonValue(json, "confidence")?.toFloatOrNull() ?: 0.5f,
                lastUpdated = System.currentTimeMillis()
            )

            // Cache the result if confidence is reasonable
            if (artistInfo.confidence >= 0.3f) {
                artistInfoCache.cacheArtistInfo(artistName, artistInfo)
            }

            ArtistInfoResult(
                success = true,
                artistInfo = artistInfo,
                fromCache = false
            )

        } catch (e: Exception) {
            ArtistInfoResult(
                success = false,
                error = "Error parsing artist info: ${e.message}"
            )
        }
    }

    /**
     * Extract JSON string value
     */
    private fun extractJsonValue(json: String, key: String): String? {
        val pattern = "\"$key\"\\s*:\\s*\"([^\"]*)\""
        val regex = Regex(pattern)
        return regex.find(json)?.groupValues?.get(1)
    }

    /**
     * Extract JSON array values
     */
    private fun extractJsonArray(json: String, key: String): List<String> {
        val pattern = "\"$key\"\\s*:\\s*\\[([^\\]]+)\\]".toRegex()
        val match = pattern.find(json) ?: return emptyList()
        val arrayContent = match.groupValues[1]
        return arrayContent.split(",").map {
            it.trim().removeSurrounding("\"").trim()
        }.filter { it.isNotBlank() }
    }

    /**
     * Clear cached info for an artist (useful for refresh)
     */
    suspend fun clearCache(artistName: String) {
        artistInfoCache.clearArtistInfo(artistName)
    }

    /**
     * Check if service is initialized
     */
    fun isInitialized(): Boolean = generativeModel != null && FeatureFlags.ENABLE_GEMINI
}

/**
 * Artist biographical information
 */
data class ArtistInfo(
    val name: String,
    val biography: String,
    val startYear: String,
    val endYear: String,
    val origin: String,
    val genres: List<String>,
    val members: List<String>,
    val facts: List<String>,
    val notableWorks: List<String>,
    val awards: List<String>,
    val influences: List<String>,
    val website: String,
    val confidence: Float,
    val lastUpdated: Long
) {
    val yearsActive: String
        get() = if (startYear == "Unknown") {
            "Years active unknown"
        } else if (endYear == "Present") {
            "$startYear – Present"
        } else {
            "$startYear – $endYear"
        }

    val hasDetailedInfo: Boolean
        get() = confidence >= 0.5f && biography.isNotBlank()
}

/**
 * Result of artist info fetch
 */
data class ArtistInfoResult(
    val success: Boolean,
    val artistInfo: ArtistInfo? = null,
    val fromCache: Boolean = false,
    val error: String? = null
)
