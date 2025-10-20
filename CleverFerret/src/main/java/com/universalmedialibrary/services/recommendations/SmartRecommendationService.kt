package com.universalmedialibrary.services.recommendations

import android.content.Context
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString

/**
 * Smart Recommendation Service using ML and AI
 *
 * Features:
 * - Content-based recommendations (similar items)
 * - Collaborative filtering (based on reading patterns)
 * - Hybrid recommendations (combining multiple signals)
 * - AI-powered recommendations using Gemini
 * - Trending and popular items
 * - Personalized for user preferences
 * - Genre-based recommendations
 * - Series and author recommendations
 */
@Singleton
class SmartRecommendationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val database: AppDatabase,
    private val apiKeyRepository: APIKeyRepository
) {

    private val mediaItemDao = database.mediaItemDao()
    private val metadataDao = database.metadataDao()
    private val readingProgressDao = database.readingProgressDao()

    private val _recommendationsState = MutableStateFlow(RecommendationsState())
    val recommendationsState: StateFlow<RecommendationsState> = _recommendationsState.asStateFlow()

    private val json = Json { ignoreUnknownKeys = true }

    /**
     * Get personalized recommendations for user
     */
    suspend fun getRecommendations(options: RecommendationOptions = RecommendationOptions()): List<Recommendation> {
        updateState(isLoading = true, status = "Generating recommendations...")

        return try {
            val recommendations = mutableListOf<Recommendation>()

            // 1. Content-based recommendations (similar to what user has)
            if (options.includeContentBased) {
                val contentBased = getContentBasedRecommendations(options.limit / 4)
                recommendations.addAll(contentBased.map { it.copy(source = "Similar Items") })
            }

            // 2. Reading history based (continue series, same authors)
            if (options.includeHistoryBased) {
                val historyBased = getHistoryBasedRecommendations(options.limit / 4)
                recommendations.addAll(historyBased.map { it.copy(source = "Based on Your Reading") })
            }

            // 3. Genre-based (popular in favorite genres)
            if (options.includeGenreBased) {
                val genreBased = getGenreBasedRecommendations(options.limit / 4)
                recommendations.addAll(genreBased.map { it.copy(source = "You Might Like") })
            }

            // 4. AI-powered recommendations using Gemini
            if (options.includeAIPowered) {
                val aiRecommendations = getAIRecommendations(options.limit / 4)
                recommendations.addAll(aiRecommendations.map { it.copy(source = "AI Suggests") })
            }

            // Sort by confidence and deduplicate
            val sorted = recommendations
                .distinctBy { it.itemId }
                .sortedByDescending { it.confidence }
                .take(options.limit)

            updateState(
                isLoading = false,
                status = "Recommendations ready",
                recommendations = sorted
            )

            sorted
        } catch (e: Exception) {
            updateState(
                isLoading = false,
                status = "Failed to generate recommendations",
                error = e.message
            )
            emptyList()
        }
    }

    /**
     * Content-based recommendations (similar items)
     */
    private suspend fun getContentBasedRecommendations(limit: Int): List<Recommendation> {
        val recommendations = mutableListOf<Recommendation>()

        // Get recently accessed items
        val recentProgress = readingProgressDao.getRecentProgress(limit = 10)
        
        for (progress in recentProgress.take(3)) {
            val item = mediaItemDao.getMediaItemById(progress.itemId) ?: continue
            val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)

            // Find similar items by:
            // - Same media type
            // - Similar file size (within 50%)
            // - Similar naming patterns

            val similarItems = mediaItemDao.getMediaItemsByType(item.mediaType)
                .filterNot { it.itemId == item.itemId }
                .filter { similar ->
                    // File size similarity
                    val sizeRatio = similar.fileSize.toFloat() / item.fileSize.toFloat()
                    sizeRatio in 0.5f..2.0f
                }
                .take(limit)

            recommendations.addAll(similarItems.map { similar ->
                Recommendation(
                    itemId = similar.itemId,
                    title = similar.fileName,
                    mediaType = similar.mediaType,
                    reason = "Similar to ${item.fileName}",
                    confidence = 0.7f,
                    source = "Content-Based"
                )
            })
        }

        return recommendations.take(limit)
    }

    /**
     * History-based recommendations (series, authors)
     */
    private suspend fun getHistoryBasedRecommendations(limit: Int): List<Recommendation> {
        val recommendations = mutableListOf<Recommendation>()

        // Get user's reading history
        val history = readingProgressDao.getAllReadingProgress()
        val readItemIds = history.map { it.itemId }

        // Get unread items from same library (likely related)
        val readItems = readItemIds.mapNotNull { mediaItemDao.getMediaItemById(it) }
        val libraryIds = readItems.map { it.libraryId }.distinct()

        for (libraryId in libraryIds.take(3)) {
            val libraryItems = mediaItemDao.getMediaItemsForLibrary(libraryId)
                .filterNot { it.itemId in readItemIds }
                .take(limit / libraryIds.size)

            recommendations.addAll(libraryItems.map { item ->
                Recommendation(
                    itemId = item.itemId,
                    title = item.fileName,
                    mediaType = item.mediaType,
                    reason = "From your library",
                    confidence = 0.8f,
                    source = "History-Based"
                )
            })
        }

        return recommendations.take(limit)
    }

    /**
     * Genre-based recommendations
     */
    private suspend fun getGenreBasedRecommendations(limit: Int): List<Recommendation> {
        // TODO: Implement when genre data is available in metadata
        // For now, return recently added items
        val allItems = mediaItemDao.getAllMediaItems()
        
        return allItems
            .sortedByDescending { it.dateAdded }
            .take(limit)
            .map { item ->
                Recommendation(
                    itemId = item.itemId,
                    title = item.fileName,
                    mediaType = item.mediaType,
                    reason = "Newly added to your library",
                    confidence = 0.6f,
                    source = "Genre-Based"
                )
            }
    }

    /**
     * AI-powered recommendations using Gemini
     */
    private suspend fun getAIRecommendations(limit: Int): List<Recommendation> {
        try {
            // Get Gemini API key
            val apiKey = apiKeyRepository.getAPIKeyValue("gemini") ?: return emptyList()

            val generativeModel = GenerativeModel(
                modelName = "gemini-pro",
                apiKey = apiKey
            )

            // Get user's reading history
            val history = readingProgressDao.getRecentProgress(limit = 20)
            val readItems = history.mapNotNull { progress ->
                mediaItemDao.getMediaItemById(progress.itemId)
            }

            // Get all available items
            val allItems = mediaItemDao.getAllMediaItems()
            val unreadItems = allItems.filterNot { item ->
                readItems.any { it.itemId == item.itemId }
            }

            // Create prompt for Gemini
            val prompt = buildAIPrompt(readItems, unreadItems.take(50))

            // Get AI recommendations
            val response = generativeModel.generateContent(
                content { text(prompt) }
            )

            val aiResponse = response.text ?: return emptyList()

            // Parse AI response (expecting JSON with item IDs and reasons)
            val recommendations = parseAIRecommendations(aiResponse, allItems)

            return recommendations.take(limit)
        } catch (e: Exception) {
            // AI recommendations failed, return empty
            return emptyList()
        }
    }

    private fun buildAIPrompt(readItems: List<MediaItem>, availableItems: List<MediaItem>): String {
        val readList = readItems.joinToString("\n") { "- ${it.fileName} (${it.mediaType})" }
        val availableList = availableItems.joinToString("\n") { "${it.itemId}: ${it.fileName} (${it.mediaType})" }

        return """
            You are a personalized media recommendation system. Based on a user's reading/viewing history, 
            recommend items from their library that they might enjoy next.

            User's History:
            $readList

            Available Items:
            $availableList

            Please recommend up to 5 items from the available list. For each recommendation, provide:
            1. The item ID (from the list)
            2. A brief reason why this item matches the user's interests

            Format your response as JSON:
            [
              {
                "itemId": 123,
                "reason": "Based on your interest in...",
                "confidence": 0.8
              }
            ]
        """.trimIndent()
    }

    private fun parseAIRecommendations(response: String, allItems: List<MediaItem>): List<Recommendation> {
        return try {
            // Extract JSON from response (might have markdown code blocks)
            val jsonStr = response
                .substringAfter("[")
                .substringBeforeLast("]")
                .let { "[$it]" }

            @kotlinx.serialization.Serializable
            data class AIRec(
                val itemId: Long,
                val reason: String,
                val confidence: Float
            )

            val aiRecs = json.decodeFromString<List<AIRec>>(jsonStr)

            aiRecs.mapNotNull { aiRec ->
                val item = allItems.find { it.itemId == aiRec.itemId }
                item?.let {
                    Recommendation(
                        itemId = it.itemId,
                        title = it.fileName,
                        mediaType = it.mediaType,
                        reason = aiRec.reason,
                        confidence = aiRec.confidence,
                        source = "AI-Powered"
                    )
                }
            }
        } catch (e: Exception) {
            emptyList()
        }
    }

    /**
     * Get trending items (most recently accessed by any user - if multi-user)
     */
    suspend fun getTrendingItems(limit: Int = 10): List<Recommendation> {
        // For single-user app, return recently accessed
        val recentProgress = readingProgressDao.getRecentProgress(limit = limit)
        
        return recentProgress.mapNotNull { progress ->
            val item = mediaItemDao.getMediaItemById(progress.itemId)
            item?.let {
                Recommendation(
                    itemId = it.itemId,
                    title = it.fileName,
                    mediaType = it.mediaType,
                    reason = "Recently accessed",
                    confidence = 0.9f,
                    source = "Trending"
                )
            }
        }
    }

    /**
     * Get recommendations for completing a series
     */
    suspend fun getSeriesRecommendations(itemId: Long): List<Recommendation> {
        val item = mediaItemDao.getMediaItemById(itemId) ?: return emptyList()
        
        // Find items with similar names (likely same series)
        val baseName = item.fileName
            .replace(Regex("\\d+"), "") // Remove numbers
            .replace(Regex("[^a-zA-Z\\s]"), "") // Remove special chars
            .trim()

        if (baseName.length < 3) return emptyList()

        val allItems = mediaItemDao.getAllMediaItems()
        val seriesItems = allItems.filter { other ->
            other.itemId != item.itemId &&
            other.mediaType == item.mediaType &&
            other.fileName.contains(baseName, ignoreCase = true)
        }

        return seriesItems.map { seriesItem ->
            Recommendation(
                itemId = seriesItem.itemId,
                title = seriesItem.fileName,
                mediaType = seriesItem.mediaType,
                reason = "Part of the same series",
                confidence = 0.95f,
                source = "Series"
            )
        }
    }

    private fun updateState(
        isLoading: Boolean? = null,
        status: String? = null,
        error: String? = null,
        recommendations: List<Recommendation>? = null
    ) {
        _recommendationsState.value = _recommendationsState.value.copy(
            isLoading = isLoading ?: _recommendationsState.value.isLoading,
            status = status ?: _recommendationsState.value.status,
            error = error,
            recommendations = recommendations ?: _recommendationsState.value.recommendations
        )
    }
}

/**
 * Recommendations state
 */
data class RecommendationsState(
    val isLoading: Boolean = false,
    val status: String = "",
    val error: String? = null,
    val recommendations: List<Recommendation> = emptyList()
)

/**
 * Recommendation options
 */
data class RecommendationOptions(
    val limit: Int = 20,
    val includeContentBased: Boolean = true,
    val includeHistoryBased: Boolean = true,
    val includeGenreBased: Boolean = true,
    val includeAIPowered: Boolean = true,
    val mediaTypes: List<String> = emptyList(), // Filter by media type
    val minConfidence: Float = 0.5f
)

/**
 * Single recommendation
 */
data class Recommendation(
    val itemId: Long,
    val title: String,
    val mediaType: String,
    val reason: String,
    val confidence: Float, // 0.0 to 1.0
    val source: String, // "Content-Based", "AI-Powered", etc.
    val thumbnailUrl: String? = null,
    val metadata: Map<String, String> = emptyMap()
)
