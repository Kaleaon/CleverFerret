package com.universalmedialibrary.services.analysis.classification

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import com.universalmedialibrary.services.analysis.AnalysisModels.ContentClassification
import com.universalmedialibrary.services.analysis.AnalysisModels.ExtractedMetadata
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * AI-powered content classification service
 * Classifies content by genre, reading level, language, and other attributes
 */
@Singleton
class ContentClassifier @Inject constructor() {

    // Genre classification keywords (in production, this would use ML models)
    private val genreClassifiers = mapOf(
        "fiction" to listOf("story", "novel", "character", "protagonist", "plot", "fiction"),
        "mystery" to listOf("detective", "murder", "clue", "investigation", "crime", "mystery", "suspect"),
        "romance" to listOf("love", "heart", "passion", "romance", "relationship", "wedding", "kiss"),
        "fantasy" to listOf("magic", "wizard", "dragon", "kingdom", "quest", "sword", "fantasy", "spell"),
        "science_fiction" to listOf("space", "alien", "robot", "future", "technology", "planet", "galaxy"),
        "horror" to listOf("ghost", "haunted", "scary", "fear", "death", "blood", "nightmare"),
        "thriller" to listOf("suspense", "danger", "chase", "escape", "tension", "action"),
        "biography" to listOf("life", "born", "childhood", "career", "achievement", "biography", "memoir"),
        "history" to listOf("war", "battle", "ancient", "century", "historical", "civilization"),
        "science" to listOf("research", "study", "theory", "experiment", "discovery", "analysis"),
        "philosophy" to listOf("philosophy", "ethics", "moral", "existence", "truth", "wisdom"),
        "religion" to listOf("god", "faith", "spiritual", "prayer", "divine", "sacred", "religious"),
        "self_help" to listOf("improve", "success", "motivation", "guide", "tips", "achieve"),
        "business" to listOf("business", "management", "leadership", "strategy", "profit", "company"),
        "cooking" to listOf("recipe", "ingredient", "cooking", "food", "kitchen", "chef"),
        "travel" to listOf("travel", "journey", "destination", "culture", "guide", "adventure")
    )

    private val contentRatingKeywords = mapOf(
        "G" to listOf("children", "family", "kid", "innocent", "wholesome"),
        "PG" to listOf("mild", "gentle", "appropriate", "educational"),
        "PG-13" to listOf("teen", "teenager", "young adult", "mature themes"),
        "R" to listOf("adult", "explicit", "violence", "mature", "graphic"),
        "NC-17" to listOf("adult only", "explicit content", "pornographic")
    )

    suspend fun classifyDocument(text: String): ContentClassification = withContext(Dispatchers.IO) {
        val normalizedText = text.lowercase()
        val words = normalizedText.split("\\s+".toRegex()).filter { it.length > 2 }
        
        // Genre classification
        val genreScores = mutableMapOf<String, Int>()
        for ((genre, keywords) in genreClassifiers) {
            val score = keywords.sumOf { keyword ->
                words.count { it.contains(keyword) }
            }
            if (score > 0) {
                genreScores[genre] = score
            }
        }
        
        val topGenres = genreScores.entries
            .sortedByDescending { it.value }
            .take(3)
            .map { it.key.replace("_", " ") }
        
        val primaryGenre = topGenres.firstOrNull() ?: "general"
        
        // Content rating classification
        val contentRating = classifyContentRating(normalizedText)
        
        // Language complexity analysis
        val complexity = analyzeComplexity(text)
        val readingLevel = determineReadingLevel(complexity)
        
        // Topic extraction (simple keyword-based)
        val topics = extractTopics(words)
        
        // Sentiment analysis (basic)
        val sentiment = analyzeSentiment(normalizedText)
        
        ContentClassification(
            primaryGenre = primaryGenre,
            genres = topGenres,
            contentRating = contentRating,
            readingLevel = readingLevel,
            topics = topics,
            sentiment = sentiment,
            complexity = complexity,
            confidence = calculateClassificationConfidence(genreScores, topGenres.size)
        )
    }

    suspend fun classifyVideo(metadata: ExtractedMetadata): ContentClassification = withContext(Dispatchers.IO) {
        val title = metadata.title.lowercase()
        val description = metadata.description.lowercase()
        val combinedText = "$title $description"
        
        // Video-specific genre classification
        val videoGenres = mapOf(
            "action" to listOf("action", "fight", "explosion", "chase", "battle"),
            "comedy" to listOf("comedy", "funny", "humor", "laugh", "joke"),
            "drama" to listOf("drama", "emotional", "family", "relationship"),
            "documentary" to listOf("documentary", "real", "true", "fact", "history"),
            "animation" to listOf("animated", "cartoon", "animation", "anime"),
            "horror" to listOf("horror", "scary", "ghost", "zombie", "fear"),
            "romance" to listOf("romance", "love", "romantic", "wedding"),
            "thriller" to listOf("thriller", "suspense", "mystery", "crime")
        )
        
        val genreScores = mutableMapOf<String, Int>()
        for ((genre, keywords) in videoGenres) {
            val score = keywords.sumOf { keyword ->
                combinedText.split(" ").count { it.contains(keyword) }
            }
            if (score > 0) {
                genreScores[genre] = score
            }
        }
        
        val topGenres = genreScores.entries
            .sortedByDescending { it.value }
            .take(2)
            .map { it.key }
        
        ContentClassification(
            primaryGenre = topGenres.firstOrNull() ?: "general",
            genres = topGenres,
            contentRating = "Not Rated", // Would need more sophisticated analysis
            confidence = if (topGenres.isNotEmpty()) 0.7f else 0.3f
        )
    }

    suspend fun classifyAudio(metadata: ExtractedMetadata): ContentClassification = withContext(Dispatchers.IO) {
        val genres = metadata.genres.ifEmpty { 
            // Try to classify based on audio characteristics or metadata
            listOf("music")
        }
        
        ContentClassification(
            primaryGenre = genres.firstOrNull() ?: "music",
            genres = genres,
            confidence = if (genres.isNotEmpty()) 0.8f else 0.4f
        )
    }

    suspend fun analyzeComicCover(context: Context, uri: Uri): ContentClassification = withContext(Dispatchers.IO) {
        try {
            val inputStream = context.contentResolver.openInputStream(uri)
            val bitmap = BitmapFactory.decodeStream(inputStream)
            
            if (bitmap != null) {
                // Simple color analysis for genre hints
                val dominantColors = analyzeDominantColors(bitmap)
                val genre = inferGenreFromColors(dominantColors)
                
                bitmap.recycle()
                
                ContentClassification(
                    primaryGenre = genre,
                    genres = listOf(genre),
                    confidence = 0.5f // Lower confidence for color-based classification
                )
            } else {
                ContentClassification(
                    primaryGenre = "comic",
                    genres = listOf("comic"),
                    confidence = 0.3f
                )
            }
        } catch (e: Exception) {
            ContentClassification(
                primaryGenre = "comic",
                genres = listOf("comic"),
                confidence = 0.3f
            )
        }
    }

    private fun classifyContentRating(text: String): String {
        for ((rating, keywords) in contentRatingKeywords) {
            val matches = keywords.count { keyword ->
                text.contains(keyword)
            }
            if (matches > 0) {
                return rating
            }
        }
        return "Not Rated"
    }

    private fun analyzeComplexity(text: String): Float {
        val sentences = text.split(Regex("[.!?]+")).filter { it.trim().isNotEmpty() }
        val words = text.split("\\s+".toRegex()).filter { it.isNotEmpty() }
        
        if (sentences.isEmpty() || words.isEmpty()) return 0.5f
        
        val avgWordsPerSentence = words.size.toFloat() / sentences.size
        val avgWordLength = words.map { it.length }.average().toFloat()
        val uniqueWordRatio = words.distinct().size.toFloat() / words.size
        
        // Normalize complexity score between 0 and 1
        val complexity = ((avgWordsPerSentence / 30f) + (avgWordLength / 10f) + uniqueWordRatio) / 3f
        return complexity.coerceIn(0f, 1f)
    }

    private fun determineReadingLevel(complexity: Float): String {
        return when {
            complexity < 0.3f -> "Elementary"
            complexity < 0.5f -> "Middle School"
            complexity < 0.7f -> "High School"
            complexity < 0.85f -> "College"
            else -> "Advanced"
        }
    }

    private fun extractTopics(words: List<String>): List<String> {
        val topicKeywords = mapOf(
            "technology" to listOf("computer", "internet", "software", "digital", "tech"),
            "politics" to listOf("government", "election", "policy", "political", "democracy"),
            "health" to listOf("health", "medical", "doctor", "medicine", "wellness"),
            "education" to listOf("school", "learning", "education", "student", "teacher"),
            "environment" to listOf("environment", "climate", "nature", "pollution", "green"),
            "economy" to listOf("economy", "financial", "money", "market", "economic"),
            "sports" to listOf("sports", "game", "team", "player", "competition"),
            "entertainment" to listOf("movie", "music", "celebrity", "entertainment", "show")
        )
        
        val topicScores = mutableMapOf<String, Int>()
        for ((topic, keywords) in topicKeywords) {
            val score = keywords.sumOf { keyword ->
                words.count { it.contains(keyword) }
            }
            if (score > 0) {
                topicScores[topic] = score
            }
        }
        
        return topicScores.entries
            .sortedByDescending { it.value }
            .take(3)
            .map { it.key }
    }

    private fun analyzeSentiment(text: String): String {
        val positiveWords = listOf("good", "great", "excellent", "amazing", "wonderful", "love", "happy", "joy")
        val negativeWords = listOf("bad", "terrible", "awful", "hate", "sad", "angry", "disappointed", "horrible")
        
        val words = text.split("\\s+".toRegex())
        val positiveCount = words.count { word -> positiveWords.any { pos -> word.contains(pos) } }
        val negativeCount = words.count { word -> negativeWords.any { neg -> word.contains(neg) } }
        
        return when {
            positiveCount > negativeCount * 1.5 -> "positive"
            negativeCount > positiveCount * 1.5 -> "negative"
            else -> "neutral"
        }
    }

    private fun calculateClassificationConfidence(genreScores: Map<String, Int>, genreCount: Int): Float {
        val totalScore = genreScores.values.sum()
        val maxScore = genreScores.values.maxOrNull() ?: 0
        
        return when {
            genreCount == 0 -> 0.1f
            genreCount == 1 && maxScore > 5 -> 0.9f
            genreCount > 1 && totalScore > 10 -> 0.8f
            maxScore > 3 -> 0.7f
            else -> 0.5f
        }
    }

    private fun analyzeDominantColors(bitmap: Bitmap): List<Int> {
        val resized = Bitmap.createScaledBitmap(bitmap, 50, 50, false)
        val pixels = IntArray(2500)
        resized.getPixels(pixels, 0, 50, 0, 0, 50, 50)
        
        // Simple color analysis - get most frequent colors
        val colorCounts = mutableMapOf<Int, Int>()
        pixels.forEach { pixel ->
            colorCounts[pixel] = colorCounts.getOrDefault(pixel, 0) + 1
        }
        
        resized.recycle()
        
        return colorCounts.entries
            .sortedByDescending { it.value }
            .take(5)
            .map { it.key }
    }

    private fun inferGenreFromColors(colors: List<Int>): String {
        // Very basic color-to-genre mapping
        for (color in colors) {
            val red = (color shr 16) and 0xFF
            val green = (color shr 8) and 0xFF
            val blue = color and 0xFF
            
            when {
                red > 200 && green < 100 && blue < 100 -> return "action" // Dominant red
                red < 100 && green > 200 && blue < 100 -> return "adventure" // Dominant green
                red < 100 && green < 100 && blue > 200 -> return "mystery" // Dominant blue
                red > 150 && green > 150 && blue < 100 -> return "comedy" // Yellow-ish
                red < 50 && green < 50 && blue < 50 -> return "horror" // Dark colors
            }
        }
        
        return "comic" // Default fallback
    }
}