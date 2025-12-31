package com.universalmedialibrary.services.ai

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.data.local.entity.MediaType
import com.universalmedialibrary.services.search.RelationshipSuggestion
import com.universalmedialibrary.services.tagging.TagSuggestion

/**
 * AI Content Analysis Service - Provides AI-powered content analysis, tagging, and relationship detection.
 * Integrates with multiple LLM providers for comprehensive content understanding.
 */
@Singleton
class AIContentAnalysisService @Inject constructor(
    private val openAIProvider: OpenAIProvider,
    private val geminiProvider: GeminiProvider,
    private val ollamaProvider: OllamaProvider,
    private val localEmbeddingProvider: LocalEmbeddingProvider
) {
    
    // ========== Content Analysis ==========
    
    /**
     * Analyzes content and generates comprehensive insights.
     */
    suspend fun analyzeContent(
        content: String?,
        metadata: Map<String, Any> = emptyMap(),
        mediaType: MediaType
    ): ContentAnalysis {
        val provider = selectBestProvider(AnalysisType.CONTENT_ANALYSIS)
        
        return try {
            val prompt = buildContentAnalysisPrompt(content, metadata, mediaType)
            val response = provider.generateText(prompt)
            
            ContentAnalysis(
                summary = extractSummary(response),
                themes = extractThemes(response),
                mood = extractMood(response),
                complexity = extractComplexity(response),
                quality = extractQuality(response),
                language = extractLanguage(response),
                keywords = extractKeywords(response),
                confidence = 0.8f,
                processingTime = System.currentTimeMillis()
            )
        } catch (e: Exception) {
            ContentAnalysis(
                summary = "Analysis failed: ${e.message}",
                themes = emptyList(),
                mood = "unknown",
                complexity = 0.0f,
                quality = 0.0f,
                language = "unknown",
                keywords = emptyList(),
                confidence = 0.0f,
                processingTime = System.currentTimeMillis(),
                error = e.message
            )
        }
    }
    
    /**
     * Generates tags for content using AI analysis.
     */
    suspend fun generateTags(
        content: String?,
        metadata: Map<String, Any> = emptyMap(),
        mediaType: MediaType,
        maxTags: Int = 10
    ): List<TagSuggestion> {
        val provider = selectBestProvider(AnalysisType.TAG_GENERATION)
        
        return try {
            val prompt = buildTagGenerationPrompt(content, metadata, mediaType, maxTags)
            val response = provider.generateText(prompt)
            
            parseTagSuggestions(response).take(maxTags)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Analyzes content relationships for recommendations.
     */
    suspend fun analyzeContentRelationships(
        content: String?,
        metadata: Map<String, Any> = emptyMap(),
        mediaType: MediaType,
        maxSuggestions: Int = 20
    ): RelationshipAnalysis {
        val provider = selectBestProvider(AnalysisType.RELATIONSHIP_ANALYSIS)
        
        return try {
            val prompt = buildRelationshipAnalysisPrompt(content, metadata, mediaType)
            val response = provider.generateText(prompt)
            
            RelationshipAnalysis(
                suggestions = parseRelationshipSuggestions(response).take(maxSuggestions),
                confidence = 0.7f,
                relatedGenres = extractRelatedGenres(response),
                similarTopics = extractSimilarTopics(response)
            )
        } catch (e: Exception) {
            RelationshipAnalysis(
                suggestions = emptyList(),
                confidence = 0.0f,
                error = e.message
            )
        }
    }
    
    // ========== Specialized Analysis ==========
    
    /**
     * Generates book-specific analysis including character analysis.
     */
    suspend fun analyzeBook(
        title: String,
        author: String,
        content: String?,
        metadata: Map<String, Any> = emptyMap()
    ): BookAnalysis {
        val provider = selectBestProvider(AnalysisType.BOOK_ANALYSIS)
        
        return try {
            val prompt = buildBookAnalysisPrompt(title, author, content, metadata)
            val response = provider.generateText(prompt)
            
            BookAnalysis(
                summary = extractSummary(response),
                characters = extractCharacters(response),
                themes = extractBookThemes(response),
                writingStyle = extractWritingStyle(response),
                difficulty = extractDifficulty(response),
                genre = extractGenre(response),
                targetAudience = extractTargetAudience(response),
                mood = extractMood(response),
                pacing = extractPacing(response),
                confidence = 0.8f
            )
        } catch (e: Exception) {
            BookAnalysis(
                summary = "Analysis failed",
                characters = emptyList(),
                themes = emptyList(),
                writingStyle = "unknown",
                difficulty = 0.0f,
                genre = "unknown",
                targetAudience = "unknown",
                mood = "unknown",
                pacing = "unknown",
                confidence = 0.0f,
                error = e.message
            )
        }
    }
    
    /**
     * Analyzes music/audio content.
     */
    suspend fun analyzeAudio(
        title: String,
        artist: String,
        lyrics: String?,
        metadata: Map<String, Any> = emptyMap()
    ): AudioAnalysis {
        val provider = selectBestProvider(AnalysisType.AUDIO_ANALYSIS)
        
        return try {
            val prompt = buildAudioAnalysisPrompt(title, artist, lyrics, metadata)
            val response = provider.generateText(prompt)
            
            AudioAnalysis(
                mood = extractAudioMood(response),
                genre = extractAudioGenre(response),
                energy = extractEnergy(response),
                tempo = extractTempo(response),
                themes = extractAudioThemes(response),
                language = extractLanguage(response),
                emotions = extractEmotions(response),
                confidence = 0.7f
            )
        } catch (e: Exception) {
            AudioAnalysis(
                mood = "unknown",
                genre = "unknown",
                energy = 0.0f,
                tempo = "unknown",
                themes = emptyList(),
                language = "unknown",
                emotions = emptyList(),
                confidence = 0.0f,
                error = e.message
            )
        }
    }
    
    /**
     * Analyzes video content.
     */
    suspend fun analyzeVideo(
        title: String,
        description: String?,
        transcript: String?,
        metadata: Map<String, Any> = emptyMap()
    ): VideoAnalysis {
        val provider = selectBestProvider(AnalysisType.VIDEO_ANALYSIS)
        
        return try {
            val prompt = buildVideoAnalysisPrompt(title, description, transcript, metadata)
            val response = provider.generateText(prompt)
            
            VideoAnalysis(
                summary = extractSummary(response),
                themes = extractVideoThemes(response),
                genre = extractVideoGenre(response),
                mood = extractVideoMood(response),
                targetAudience = extractTargetAudience(response),
                contentWarning = extractContentWarning(response),
                visualStyle = extractVisualStyle(response),
                confidence = 0.7f
            )
        } catch (e: Exception) {
            VideoAnalysis(
                summary = "Analysis failed",
                themes = emptyList(),
                genre = "unknown",
                mood = "unknown",
                targetAudience = "unknown",
                contentWarning = "none",
                visualStyle = "unknown",
                confidence = 0.0f,
                error = e.message
            )
        }
    }
    
    // ========== Embedding and Similarity ==========
    
    /**
     * Generates content embeddings for similarity search.
     */
    suspend fun generateEmbedding(
        content: String,
        mediaType: MediaType
    ): ContentEmbedding {
        return try {
            val embedding = localEmbeddingProvider.generateEmbedding(content)
            
            ContentEmbedding(
                vector = embedding,
                dimensions = embedding.size,
                mediaType = mediaType,
                model = "local-embedding-v1",
                timestamp = System.currentTimeMillis()
            )
        } catch (e: Exception) {
            ContentEmbedding(
                vector = floatArrayOf(),
                dimensions = 0,
                mediaType = mediaType,
                model = "error",
                timestamp = System.currentTimeMillis(),
                error = e.message
            )
        }
    }
    
    /**
     * Calculates similarity between two content embeddings.
     */
    fun calculateSimilarity(
        embedding1: ContentEmbedding,
        embedding2: ContentEmbedding
    ): Float {
        return if (embedding1.vector.isNotEmpty() && embedding2.vector.isNotEmpty()) {
            cosineSimilarity(embedding1.vector, embedding2.vector)
        } else {
            0.0f
        }
    }
    
    /**
     * Finds similar content based on embeddings.
     */
    suspend fun findSimilarContent(
        queryEmbedding: ContentEmbedding,
        candidateEmbeddings: List<ContentEmbedding>,
        threshold: Float = 0.7f,
        maxResults: Int = 10
    ): List<SimilarContentResult> {
        return candidateEmbeddings
            .map { embedding ->
                val similarity = calculateSimilarity(queryEmbedding, embedding)
                SimilarContentResult(
                    mediaId = embedding.mediaId,
                    mediaType = embedding.mediaType,
                    similarity = similarity
                )
            }
            .filter { it.similarity >= threshold }
            .sortedByDescending { it.similarity }
            .take(maxResults)
    }
    
    // ========== Advanced AI Features ==========
    
    /**
     * Generates a "mind map" of content relationships.
     */
    suspend fun generateMindMap(
        content: String,
        metadata: Map<String, Any> = emptyMap(),
        mediaType: MediaType
    ): MindMap {
        val provider = selectBestProvider(AnalysisType.MIND_MAP)
        
        return try {
            val prompt = buildMindMapPrompt(content, metadata, mediaType)
            val response = provider.generateText(response)
            
            MindMap(
                centralTopic = extractCentralTopic(response),
                branches = extractMindMapBranches(response),
                connections = extractMindMapConnections(response),
                confidence = 0.7f
            )
        } catch (e: Exception) {
            MindMap(
                centralTopic = content.take(50) + "...",
                branches = emptyList(),
                connections = emptyList(),
                confidence = 0.0f,
                error = e.message
            )
        }
    }
    
    /**
     * Generates content recommendations based on user preferences.
     */
    suspend fun generateRecommendations(
        userPreferences: UserPreferences,
        recentlyViewed: List<String>,
        maxRecommendations: Int = 20
    ): List<ContentRecommendation> {
        val provider = selectBestProvider(AnalysisType.RECOMMENDATION)
        
        return try {
            val prompt = buildRecommendationPrompt(userPreferences, recentlyViewed)
            val response = provider.generateText(prompt)
            
            parseRecommendations(response).take(maxRecommendations)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    // ========== Private Helper Methods ==========
    
    private fun selectBestProvider(analysisType: AnalysisType): LLMProvider {
        return when (analysisType) {
            AnalysisType.CONTENT_ANALYSIS, AnalysisType.BOOK_ANALYSIS -> geminiProvider
            AnalysisType.TAG_GENERATION, AnalysisType.RELATIONSHIP_ANALYSIS -> openAIProvider
            AnalysisType.AUDIO_ANALYSIS, AnalysisType.VIDEO_ANALYSIS -> geminiProvider
            AnalysisType.MIND_MAP, AnalysisType.RECOMMENDATION -> openAIProvider
            else -> geminiProvider // Default fallback
        }
    }
    
    private fun buildContentAnalysisPrompt(
        content: String?,
        metadata: Map<String, Any>,
        mediaType: MediaType
    ): String {
        return buildString {
            appendLine("Analyze the following ${mediaType.name.lowercase()} content and provide detailed insights:")
            appendLine()
            if (content != null) {
                appendLine("Content: ${content.take(2000)}...")
                appendLine()
            }
            if (metadata.isNotEmpty()) {
                appendLine("Metadata:")
                metadata.forEach { (key, value) ->
                    appendLine("- $key: $value")
                }
                appendLine()
            }
            appendLine("Please provide:")
            appendLine("1. A concise summary (2-3 sentences)")
            appendLine("2. Main themes and topics")
            appendLine("3. Overall mood/tone")
            appendLine("4. Complexity level (0.0-1.0)")
            appendLine("5. Content quality assessment (0.0-1.0)")
            appendLine("6. Primary language")
            appendLine("7. Key keywords/tags")
            appendLine("Format your response as JSON with these fields.")
        }
    }
    
    private fun buildTagGenerationPrompt(
        content: String?,
        metadata: Map<String, Any>,
        mediaType: MediaType,
        maxTags: Int
    ): String {
        return buildString {
            appendLine("Generate $maxTags relevant tags for this ${mediaType.name.lowercase()}:")
            appendLine()
            if (content != null) {
                appendLine("Content: ${content.take(1500)}...")
                appendLine()
            }
            if (metadata.isNotEmpty()) {
                appendLine("Metadata:")
                metadata.forEach { (key, value) ->
                    appendLine("- $key: $value")
                }
                appendLine()
            }
            appendLine("Generate tags that are:")
            appendLine("- Specific and descriptive")
            appendLine("- Relevant to the content")
            appendLine("- Useful for categorization and search")
            appendLine("- Mix of genre, mood, theme, and descriptive tags")
            appendLine("Format as a JSON array of objects with 'name' and 'confidence' fields.")
        }
    }
    
    private fun buildRelationshipAnalysisPrompt(
        content: String?,
        metadata: Map<String, Any>,
        mediaType: MediaType
    ): String {
        return buildString {
            appendLine("Analyze this ${mediaType.name.lowercase()} and suggest related content:")
            appendLine()
            if (content != null) {
                appendLine("Content: ${content.take(1500)}...")
                appendLine()
            }
            appendLine("Suggest related content with:")
            appendLine("- Target media ID (placeholder)")
            appendLine("- Target media type")
            appendLine("- Relationship type (SERIES, SAME_AUTHOR, SIMILAR, etc.)")
            appendLine("- Strength (0.0-1.0)")
            appendLine("- Confidence (0.0-1.0)")
            appendLine("- Related genres")
            appendLine("- Similar topics")
            appendLine("Format as JSON with 'suggestions', 'relatedGenres', and 'similarTopics' fields.")
        }
    }
    
    private fun buildBookAnalysisPrompt(
        title: String,
        author: String,
        content: String?,
        metadata: Map<String, Any>
    ): String {
        return buildString {
            appendLine("Analyze this book comprehensively:")
            appendLine("Title: $title")
            appendLine("Author: $author")
            if (content != null) {
                appendLine("Content: ${content.take(2000)}...")
            }
            appendLine()
            appendLine("Provide analysis of:")
            appendLine("- Summary")
            appendLine("- Main characters")
            appendLine("- Themes")
            appendLine("- Writing style")
            appendLine("- Reading difficulty (0.0-1.0)")
            appendLine("- Genre")
            appendLine("- Target audience")
            appendLine("- Mood")
            appendLine("- Pacing")
        }
    }
    
    private fun buildAudioAnalysisPrompt(
        title: String,
        artist: String,
        lyrics: String?,
        metadata: Map<String, Any>
    ): String {
        return buildString {
            appendLine("Analyze this audio track:")
            appendLine("Title: $title")
            appendLine("Artist: $artist")
            if (lyrics != null) {
                appendLine("Lyrics: ${lyrics.take(1000)}...")
            }
            appendLine()
            appendLine("Provide analysis of:")
            appendLine("- Mood")
            appendLine("- Genre")
            appendLine("- Energy level (0.0-1.0)")
            appendLine("- Tempo")
            appendLine("- Themes")
            appendLine("- Language")
            appendLine("- Emotions conveyed")
        }
    }
    
    private fun buildVideoAnalysisPrompt(
        title: String,
        description: String?,
        transcript: String?,
        metadata: Map<String, Any>
    ): String {
        return buildString {
            appendLine("Analyze this video:")
            appendLine("Title: $title")
            if (description != null) {
                appendLine("Description: $description")
            }
            if (transcript != null) {
                appendLine("Transcript: ${transcript.take(1500)}...")
            }
            appendLine()
            appendLine("Provide analysis of:")
            appendLine("- Summary")
            appendLine("- Themes")
            appendLine("- Genre")
            appendLine("- Mood")
            appendLine("- Target audience")
            appendLine("- Content warnings")
            appendLine("- Visual style")
        }
    }
    
    private fun buildMindMapPrompt(
        content: String,
        metadata: Map<String, Any>,
        mediaType: MediaType
    ): String {
        return buildString {
            appendLine("Create a mind map structure for this ${mediaType.name.lowercase()}:")
            appendLine("Content: ${content.take(1000)}...")
            appendLine()
            appendLine("Provide:")
            appendLine("- Central topic")
            appendLine("- Main branches with sub-topics")
            appendLine("- Connections between topics")
            appendLine("Format as JSON structure.")
        }
    }
    
    private fun buildRecommendationPrompt(
        userPreferences: UserPreferences,
        recentlyViewed: List<String>
    ): String {
        return buildString {
            appendLine("Generate content recommendations based on:")
            appendLine("User preferences: $userPreferences")
            appendLine("Recently viewed: ${recentlyViewed.take(10)}")
            appendLine()
            appendLine("Provide recommendations with:")
            appendLine("- Media ID")
            appendLine("- Media type")
            appendLine("- Reason for recommendation")
            appendLine("- Confidence score")
        }
    }
    
    // Parsing methods (simplified - in real implementation, use proper JSON parsing)
    private fun extractSummary(response: String): String = "Extracted summary"
    private fun extractThemes(response: String): List<String> = listOf("theme1", "theme2")
    private fun extractMood(response: String): String = "neutral"
    private fun extractComplexity(response: String): Float = 0.5f
    private fun extractQuality(response: String): Float = 0.7f
    private fun extractLanguage(response: String): String = "English"
    private fun extractKeywords(response: String): List<String> = listOf("keyword1", "keyword2")
    private fun parseTagSuggestions(response: String): List<TagSuggestion> = listOf(
        TagSuggestion("fiction", 0.9f),
        TagSuggestion("adventure", 0.8f)
    )
    private fun parseRelationshipSuggestions(response: String): List<RelationshipSuggestion> = emptyList()
    private fun extractRelatedGenres(response: String): List<String> = emptyList()
    private fun extractSimilarTopics(response: String): List<String> = emptyList()
    private fun extractCharacters(response: String): List<Character> = emptyList()
    private fun extractBookThemes(response: String): List<String> = emptyList()
    private fun extractWritingStyle(response: String): String = "descriptive"
    private fun extractDifficulty(response: String): Float = 0.5f
    private fun extractGenre(response: String): String = "fiction"
    private fun extractTargetAudience(response: String): String = "general"
    private fun extractPacing(response: String): String = "moderate"
    private fun extractAudioMood(response: String): String = "upbeat"
    private fun extractAudioGenre(response: String): String = "pop"
    private fun extractEnergy(response: String): Float = 0.7f
    private fun extractTempo(response: String): String = "medium"
    private fun extractAudioThemes(response: String): List<String> = emptyList()
    private fun extractEmotions(response: String): List<String> = emptyList()
    private fun extractVideoThemes(response: String): List<String> = emptyList()
    private fun extractVideoGenre(response: String): String = "documentary"
    private fun extractVideoMood(response: String): String = "informative"
    private fun extractContentWarning(response: String): String = "none"
    private fun extractVisualStyle(response: String): String = "modern"
    private fun extractCentralTopic(response: String): String = "main topic"
    private fun extractMindMapBranches(response: String): List<MindMapBranch> = emptyList()
    private fun extractMindMapConnections(response: String): List<MindMapConnection> = emptyList()
    private fun parseRecommendations(response: String): List<ContentRecommendation> = emptyList()
    
    private fun cosineSimilarity(vector1: FloatArray, vector2: FloatArray): Float {
        if (vector1.size != vector2.size) return 0.0f
        
        var dotProduct = 0.0f
        var magnitude1 = 0.0f
        var magnitude2 = 0.0f
        
        for (i in vector1.indices) {
            dotProduct += vector1[i] * vector2[i]
            magnitude1 += vector1[i] * vector1[i]
            magnitude2 += vector2[i] * vector2[i]
        }
        
        return if (magnitude1 > 0 && magnitude2 > 0) {
            dotProduct / (kotlin.math.sqrt(magnitude1) * kotlin.math.sqrt(magnitude2))
        } else {
            0.0f
        }
    }
}

// Supporting data classes and enums
enum class AnalysisType {
    CONTENT_ANALYSIS,
    TAG_GENERATION,
    RELATIONSHIP_ANALYSIS,
    BOOK_ANALYSIS,
    AUDIO_ANALYSIS,
    VIDEO_ANALYSIS,
    MIND_MAP,
    RECOMMENDATION
}

data class ContentAnalysis(
    val summary: String,
    val themes: List<String>,
    val mood: String,
    val complexity: Float,
    val quality: Float,
    val language: String,
    val keywords: List<String>,
    val confidence: Float,
    val processingTime: Long,
    val error: String? = null
)

data class BookAnalysis(
    val summary: String,
    val characters: List<Character>,
    val themes: List<String>,
    val writingStyle: String,
    val difficulty: Float,
    val genre: String,
    val targetAudience: String,
    val mood: String,
    val pacing: String,
    val confidence: Float,
    val error: String? = null
)

data class AudioAnalysis(
    val mood: String,
    val genre: String,
    val energy: Float,
    val tempo: String,
    val themes: List<String>,
    val language: String,
    val emotions: List<String>,
    val confidence: Float,
    val error: String? = null
)

data class VideoAnalysis(
    val summary: String,
    val themes: List<String>,
    val genre: String,
    val mood: String,
    val targetAudience: String,
    val contentWarning: String,
    val visualStyle: String,
    val confidence: Float,
    val error: String? = null
)

data class RelationshipAnalysis(
    val suggestions: List<RelationshipSuggestion>,
    val confidence: Float,
    val relatedGenres: List<String> = emptyList(),
    val similarTopics: List<String> = emptyList(),
    val error: String? = null
)

data class ContentEmbedding(
    val vector: FloatArray,
    val dimensions: Int,
    val mediaType: MediaType,
    val mediaId: String = "",
    val model: String,
    val timestamp: Long,
    val error: String? = null
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as ContentEmbedding
        if (!vector.contentEquals(other.vector)) return false
        return true
    }
    
    override fun hashCode(): Int {
        return vector.contentHashCode()
    }
}

data class SimilarContentResult(
    val mediaId: String,
    val mediaType: MediaType,
    val similarity: Float
)

data class MindMap(
    val centralTopic: String,
    val branches: List<MindMapBranch>,
    val connections: List<MindMapConnection>,
    val confidence: Float,
    val error: String? = null
)

data class ContentRecommendation(
    val mediaId: String,
    val mediaType: MediaType,
    val reason: String,
    val confidence: Float
)

data class UserPreferences(
    val favoriteGenres: List<String>,
    val preferredMediaTypes: List<MediaType>,
    val moodPreferences: List<String>,
    val languagePreferences: List<String>
)

data class Character(
    val name: String,
    val role: String,
    val description: String
)

data class MindMapBranch(
    val topic: String,
    val subtopics: List<String>
)

data class MindMapConnection(
    val from: String,
    val to: String,
    val type: String
)