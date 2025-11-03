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
 * Service for fetching and managing song lyrics
 * Supports:
 * - .lrc files (synced lyrics)
 * - Gemini AI for fetching lyrics
 * - Caching
 */
@Singleton
class LyricsService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository,
    private val lyricsCache: LyricsCacheRepository,
    private val lrcParser: LrcParser
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
     * Get synced lyrics from .lrc file if available
     */
    suspend fun getSyncedLyrics(audioFilePath: String, trackName: String? = null): LrcData? = withContext(Dispatchers.IO) {
        try {
            val lrcPath = lrcParser.findLrcFile(audioFilePath, trackName)
            if (lrcPath != null) {
                return@withContext lrcParser.parseFile(lrcPath)
            }
        } catch (e: Exception) {
            // .lrc file not found or parse error - not critical
        }
        null
    }
    
    /**
     * Get lyrics for a track
     * Priority: 1) .lrc file, 2) cache, 3) fetch from AI
     */
    suspend fun getLyrics(track: Track, forceRefresh: Boolean = false): LyricsResult = withContext(Dispatchers.IO) {
        // First try .lrc file (synced lyrics take priority)
        if (!forceRefresh && track.path != null) {
            val lrcData = getSyncedLyrics(track.path, track.title)
            if (lrcData != null && lrcData.lines.isNotEmpty()) {
                // Convert LRC data to Lyrics format
                val lyricLines = lrcData.lines.map { lrcLine ->
                    LyricLine(
                        time = lrcLine.timestamp,
                        text = lrcLine.text
                    )
                }
                val lyrics = Lyrics(
                    trackId = track.id,
                    lines = lyricLines,
                    hasTimestamps = true,
                    language = "unknown",
                    isInstrumental = false,
                    confidence = 1.0f,
                    fetchedAt = System.currentTimeMillis()
                )
                
                // Cache the lyrics
                lyricsCache.cacheLyrics(track.id, lyrics)
                
                return@withContext LyricsResult(
                    success = true,
                    lyrics = lyrics,
                    fromCache = true,
                    isSynced = true,
                    lrcData = lrcData
                )
            }
        }
        
        // Check cache second (unless forcing refresh)
        if (!forceRefresh) {
            val cached = lyricsCache.getLyrics(track.id)
            if (cached != null) {
                return@withContext LyricsResult(
                    success = true,
                    lyrics = cached,
                    fromCache = true
                )
            }
        }

        // Fetch from AI
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext LyricsResult(
                success = false,
                error = "Lyrics feature is disabled"
            )
        }

        val model = generativeModel
        if (model == null) {
            return@withContext LyricsResult(
                success = false,
                error = "Lyrics service not initialized"
            )
        }

        try {
            val prompt = """
                Provide the complete lyrics for this song:
                
                Title: ${track.title}
                Artist: ${track.artist}
                Album: ${track.album}
                Year: ${track.year}
                
                Return ONLY valid JSON in this exact format:
                {
                    "lyrics": [
                        {"time": 0, "line": "First line of lyrics"},
                        {"time": 5000, "line": "Second line at 5 seconds"},
                        {"time": 10000, "line": "Third line at 10 seconds"}
                    ],
                    "has_timestamps": true,
                    "language": "en",
                    "is_instrumental": false,
                    "confidence": 0.95
                }
                
                Guidelines:
                - Provide COMPLETE lyrics (all verses, chorus, bridge)
                - Include approximate timestamps in milliseconds if possible
                - Set has_timestamps: false if you can't provide accurate times
                - For instrumental tracks: is_instrumental: true, lyrics: []
                - Language code (en, es, fr, etc.)
                - Confidence score (0.0-1.0)
                - Return ONLY JSON, no markdown, no extra text
                
                If you cannot find accurate lyrics, return:
                {
                    "lyrics": [],
                    "has_timestamps": false,
                    "is_instrumental": false,
                    "confidence": 0.0,
                    "error": "Lyrics not found"
                }
            """.trimIndent()

            val response = model.generateContent(prompt)
            val responseText = response.text ?: ""

            parseLyricsResponse(track.id, responseText)

        } catch (e: Exception) {
            LyricsResult(
                success = false,
                error = "Error fetching lyrics: ${e.message}"
            )
        }
    }

    /**
     * Parse JSON response and cache lyrics
     */
    private suspend fun parseLyricsResponse(trackId: Long, responseText: String): LyricsResult {
        return try {
            val jsonText = responseText
                .replace("```json", "")
                .replace("```", "")
                .trim()

            val jsonStart = jsonText.indexOf("{")
            val jsonEnd = jsonText.lastIndexOf("}") + 1

            if (jsonStart < 0 || jsonEnd <= jsonStart) {
                return LyricsResult(
                    success = false,
                    error = "Could not parse response"
                )
            }

            val json = jsonText.substring(jsonStart, jsonEnd)

            // Extract fields
            val hasTimestamps = extractJsonValue(json, "has_timestamps")?.toBoolean() ?: false
            val language = extractJsonValue(json, "language") ?: "en"
            val isInstrumental = extractJsonValue(json, "is_instrumental")?.toBoolean() ?: false
            val confidence = extractJsonValue(json, "confidence")?.toFloatOrNull() ?: 0.5f

            // Extract lyrics array
            val lyricsLines = mutableListOf<LyricLine>()
            val lyricsArrayPattern = "\"lyrics\"\\s*:\\s*\\[(.*?)\\]".toRegex(RegexOption.DOT_MATCHES_ALL)
            val lyricsArrayMatch = lyricsArrayPattern.find(json)

            if (lyricsArrayMatch != null) {
                val lyricsContent = lyricsArrayMatch.groupValues[1]
                
                // Extract individual line objects
                val linePattern = "\\{([^}]+)\\}".toRegex()
                linePattern.findAll(lyricsContent).forEach { match ->
                    val lineJson = match.value
                    
                    val time = extractJsonValue(lineJson, "time")?.toLongOrNull() ?: 0L
                    val line = extractJsonValue(lineJson, "line") ?: ""
                    
                    if (line.isNotBlank()) {
                        lyricsLines.add(LyricLine(time = time, text = line))
                    }
                }
            }

            val lyrics = Lyrics(
                trackId = trackId,
                lines = lyricsLines,
                hasTimestamps = hasTimestamps,
                language = language,
                isInstrumental = isInstrumental,
                confidence = confidence,
                fetchedAt = System.currentTimeMillis()
            )

            // Cache if confidence is reasonable
            if (confidence >= 0.3f && lyricsLines.isNotEmpty()) {
                lyricsCache.cacheLyrics(trackId, lyrics)
            }

            LyricsResult(
                success = true,
                lyrics = lyrics,
                fromCache = false
            )

        } catch (e: Exception) {
            LyricsResult(
                success = false,
                error = "Error parsing lyrics: ${e.message}"
            )
        }
    }

    private fun extractJsonValue(json: String, key: String): String? {
        val pattern = "\"$key\"\\s*:\\s*\"([^\"]*)\"|\"$key\"\\s*:\\s*([0-9.]+|true|false)"
        val regex = Regex(pattern)
        val match = regex.find(json) ?: return null
        return match.groupValues[1].ifBlank { match.groupValues[2] }
    }

    suspend fun clearCache(trackId: Long) {
        lyricsCache.clearLyrics(trackId)
    }

    fun isInitialized(): Boolean = generativeModel != null && FeatureFlags.ENABLE_GEMINI
}

/**
 * Lyrics data model
 */
data class Lyrics(
    val trackId: Long,
    val lines: List<LyricLine>,
    val hasTimestamps: Boolean,
    val language: String,
    val isInstrumental: Boolean,
    val confidence: Float,
    val fetchedAt: Long
) {
    fun getCurrentLine(positionMs: Long): LyricLine? {
        if (!hasTimestamps || lines.isEmpty()) return null
        
        // Find the line that should be displayed at this position
        return lines.lastOrNull { it.time <= positionMs }
    }
    
    fun getNextLine(positionMs: Long): LyricLine? {
        if (!hasTimestamps || lines.isEmpty()) return null
        
        return lines.firstOrNull { it.time > positionMs }
    }
}

/**
 * Single line of lyrics with timestamp
 */
data class LyricLine(
    val time: Long, // Milliseconds
    val text: String
)

/**
 * Result of lyrics fetch
 */
data class LyricsResult(
    val success: Boolean,
    val lyrics: Lyrics? = null,
    val fromCache: Boolean = false,
    val error: String? = null,
    val isSynced: Boolean = false, // Whether lyrics are time-synced (.lrc)
    val lrcData: LrcData? = null // Synced lyrics data if available
)
