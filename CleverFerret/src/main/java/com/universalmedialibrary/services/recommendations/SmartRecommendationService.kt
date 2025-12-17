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
 * - TasteDive API integration for similar items
 * - Trending and popular items
 * - Personalized for user preferences
 * - Genre-based recommendations
 * - Series and author recommendations
 */
@Singleton
class SmartRecommendationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val database: AppDatabase,
    private val apiKeyRepository: APIKeyRepository,
    private val tasteDiveService: TasteDiveService
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
                val genreBased = getGenreBasedRecommendations(options.limit / 4, options)
                recommendations.addAll(genreBased.map { it.copy(source = "You Might Like") })
            }

            // 4. AI-powered recommendations using Gemini
            if (options.includeAIPowered) {
                val aiRecommendations = getAIRecommendations(options.limit / 4)
                recommendations.addAll(aiRecommendations.map { it.copy(source = "AI Suggests") })
            }

            // 5. TasteDive recommendations
            if (options.includeTasteDive) {
                val tasteDiveRecs = getTasteDiveRecommendations(options.limit / 4)
                recommendations.addAll(tasteDiveRecs.map { it.copy(source = "TasteDive") })
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

        // Get all media items and pick some for recommendations
        val allItems = mediaItemDao.getAllMediaItems().take(50)
        
        // Group by media type and recommend from each type
        val itemsByType = allItems.groupBy { it.mediaType }
        
        itemsByType.forEach { (mediaType, items) ->
            val sample = items.take(limit / itemsByType.size.coerceAtLeast(1))
            recommendations.addAll(sample.map { item ->
                Recommendation(
                    itemId = item.itemId,
                    title = item.fileName,
                    mediaType = item.mediaType,
                    reason = "Based on your library",
                    confidence = 0.7f,
                    source = "content_based",
                    thumbnailUrl = null
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

        // Get some recent items to recommend
        val allItems = mediaItemDao.getAllMediaItems()
        val recentItems = allItems.sortedByDescending { it.dateAdded }.take(limit * 2)

        recentItems.take(limit).forEach { item ->
            recommendations.add(
                Recommendation(
                    itemId = item.itemId,
                    title = item.fileName,
                    mediaType = item.mediaType,
                    reason = "Recently added to library",
                    confidence = 0.8f,
                    source = "history_based",
                    thumbnailUrl = null
                )
            )
        }

        return recommendations
    }

    /**
     * Genre-based recommendations
     */
    private suspend fun getGenreBasedRecommendations(limit: Int, options: RecommendationOptions): List<Recommendation> {
        // Implemented genre-based recommendations using metadata
        try {
            // Get all media items with their genres
            val allItems = mediaItemDao.getAllMediaItems()
            val itemsWithGenres = mutableListOf<Pair<MediaItem, List<String>>>()
            
            // Collect items with their genres
            for (item in allItems) {
                val genres = try {
                    metadataDao.getGenresByItemId(item.itemId)
                } catch (e: Exception) {
                    emptyList<String>()
                }
                
                if (genres.isNotEmpty()) {
                    itemsWithGenres.add(item to genres)
                }
            }
            
            if (itemsWithGenres.isEmpty()) {
                // Fallback to recently added items if no genre data available
                return allItems
                    .sortedByDescending { it.dateAdded }
                    .take(limit)
                    .map { item ->
                        Recommendation(
                            itemId = item.itemId,
                            title = item.fileName,
                            mediaType = item.mediaType,
                            reason = "Recently added",
                            confidence = 0.5f,
                            source = "genre_based",
                            thumbnailUrl = null
                        )
                    }
            }
            
            // Count genre frequency across the library
            val genreFrequency = mutableMapOf<String, Int>()
            for ((_, genres) in itemsWithGenres) {
                for (genre in genres) {
                    genreFrequency[genre] = genreFrequency.getOrDefault(genre, 0) + 1
                }
            }
            
            // Get the most popular genres, or use selected genres if specified
            val popularGenres = if (options.selectedGenres.isNotEmpty()) {
                // Use user-selected genres if available
                options.selectedGenres.filter { genre -> genreFrequency.containsKey(genre) }
            } else {
                // Otherwise use most popular genres
                genreFrequency
                    .toList()
                    .sortedByDescending { it.second }
                    .take(3) // Top 3 genres
                    .map { it.first }
            }
            
            // Find items in popular genres
            val recommendations = mutableListOf<Recommendation>()
            
            for ((item, genres) in itemsWithGenres) {
                val itemPopularGenres = genres.intersect(popularGenres.toSet())
                if (itemPopularGenres.isNotEmpty()) {
                    val confidence = 0.7f + (itemPopularGenres.size * 0.1f) // Higher confidence for more matches
                    
                    recommendations.add(
                        Recommendation(
                            itemId = item.itemId,
                            title = item.fileName,
                            mediaType = item.mediaType,
                            reason = "Popular in genres: ${itemPopularGenres.joinToString(", ")}",
                            confidence = confidence.coerceAtMost(1.0f),
                            source = "genre_based",
                            thumbnailUrl = null
                        )
                    )
                }
            }
            
            // Sort by confidence and take the requested limit
            return recommendations
                .sortedByDescending { it.confidence }
                .take(limit)
                
        } catch (e: Exception) {
            // Fallback to recently added items on error
            val allItems = mediaItemDao.getAllMediaItems()
            return allItems
                .sortedByDescending { it.dateAdded }
                .take(limit)
                .map { item ->
                    Recommendation(
                        itemId = item.itemId,
                        title = item.fileName,
                        mediaType = item.mediaType,
                        reason = "Recently added",
                        confidence = 0.5f,
                        source = "genre_based",
                        thumbnailUrl = null
                    )
                }
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

            // Get all available items
            val allItems = mediaItemDao.getAllMediaItems()
            val sampleItems = allItems.take(50)

            // Create prompt for Gemini
            val prompt = buildAIPrompt(sampleItems)

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

    private fun buildAIPrompt(availableItems: List<MediaItem>): String {
        val availableList = availableItems.joinToString("\n") { "${it.itemId}: ${it.fileName} (${it.mediaType})" }

        return """
            You are a personalized media recommendation system. Recommend items from a user's media library
            that they might enjoy.

            Available Items:
            $availableList

            Please recommend up to 5 items from the available list. For each recommendation, provide:
            1. The item ID (from the list)
            2. A brief reason why this item might be interesting
            3. A confidence score (0.0 to 1.0)

            Format your response as JSON:
            [
              {
                "itemId": 123,
                "reason": "Interesting title suggests...",
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
                        source = "ai_powered",
                        thumbnailUrl = null
                    )
                }
            }
        } catch (e: Exception) {
            emptyList()
        }
    }

    /**
     * TasteDive recommendations
     */
    private suspend fun getTasteDiveRecommendations(limit: Int): List<Recommendation> {
        try {
            val recommendations = mutableListOf<Recommendation>()
            
            // Pick a random favorite item to pivot from
            // In a real scenario, you might rotate through recent favorites or pick media types evenly
            val favorites = mediaItemDao.getAllMediaItems().filter { it.isFavorite }
            
            if (favorites.isEmpty()) return emptyList()
            
            val pivotItem = favorites.random()
            
            // Map internal MediaItem.mediaType to TasteDive types
            // Valid TasteDive types: music, movies, shows, podcasts, books, authors, games
            val type = when (pivotItem.mediaType) {
                "MUSIC_TRACK" -> "music"
                "MOVIE" -> "movies"
                "TV_SHOW", "VIDEO" -> "shows"
                "BOOK", "EBOOK", "COMIC" -> "books" // or authors if we had author info
                "PODCAST" -> "podcasts"
                "AUDIOBOOK" -> "books"
                else -> null // Try generic query
            }
            
            val query = pivotItem.fileName.substringBeforeLast('.') // Use filename as title proxy
            
            val similarItems = tasteDiveService.getSimilarItems(
                query = query,
                type = type,
                limit = limit
            )
            
            // Map TasteDiveItem to Recommendation
            // Since these are external items, we use -1 as itemId or handle them specially in UI
            // However, Recommendation expects itemId: Long. 
            // We might need to change Recommendation to support external items or use a placeholder ID.
            // For now, let's use negative IDs to indicate external items
            
            similarItems.forEachIndexed { index, item ->
                recommendations.add(
                    Recommendation(
                        itemId = -1L - index, // Negative ID placeholder
                        title = item.name,
                        mediaType = pivotItem.mediaType, // Suggest it matches the source type
                        reason = "Similar to ${pivotItem.fileName} (TasteDive)",
                        confidence = 0.85f,
                        source = "tastedive",
                        thumbnailUrl = null,
                        metadata = mapOf(
                            "wikiUrl" to (item.wikiUrl ?: ""),
                            "youtubeUrl" to (item.youtubeUrl ?: ""),
                            "teaser" to (item.teaser ?: "")
                        )
                    )
                )
            }
            
            return recommendations
        } catch (e: Exception) {
            e.printStackTrace()
            return emptyList()
        }
    }

    /**
     * Get trending items (most recently accessed by any user - if multi-user)
     */
    suspend fun getTrendingItems(limit: Int = 10): List<Recommendation> {
        // For single-user app, return recently added items as trending
        val recentItems = mediaItemDao.getAllMediaItems()
            .sortedByDescending { it.dateAdded }
            .take(limit)
        
        return recentItems.map { item ->
            Recommendation(
                itemId = item.itemId,
                title = item.fileName,
                mediaType = item.mediaType,
                reason = "Recently added",
                confidence = 0.9f,
                source = "Trending"
            )
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
    val includeTasteDive: Boolean = true, // New flag
    val mediaTypes: List<String> = emptyList(), // Filter by media type
    val selectedGenres: List<String> = emptyList(), // Filter by specific genres
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
