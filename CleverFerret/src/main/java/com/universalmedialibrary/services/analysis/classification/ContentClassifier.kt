package com.universalmedialibrary.services.analysis.classification

import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.services.analysis.ContentClassification
import com.universalmedialibrary.services.analysis.ExtractedMetadata
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
        "science fiction" to listOf("space", "alien", "robot", "future", "technology", "planet", "galaxy"),
        "horror" to listOf("ghost", "haunted", "scary", "fear", "death", "blood", "nightmare"),
        "thriller" to listOf("suspense", "danger", "chase", "escape", "tension", "action"),
        "biography" to listOf("life", "born", "childhood", "career", "achievement", "biography", "memoir"),
        "history" to listOf("war", "battle", "ancient", "century", "historical", "civilization"),
        "science" to listOf("research", "study", "theory", "experiment", "discovery", "analysis"),
        "philosophy" to listOf("philosophy", "ethics", "moral", "existence", "truth", "wisdom"),
        "religion" to listOf("god", "faith", "spiritual", "prayer", "divine", "sacred", "religious"),
        "self-help" to listOf("improve", "success", "motivation", "guide", "tips", "achieve"),
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

    /**
     * Classifies a document based on its text content.
     *
     * @param text The text of the document to classify.
     * @return A [ContentClassification] object with the classification results.
     */
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
            .map { it.key }

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
            mediaType = MediaType.DOCUMENT,
            genre = primaryGenre,
            subGenre = topGenres.getOrNull(1),
            ageRating = contentRating,
            contentWarnings = emptyList(),
            confidence = calculateClassificationConfidence(genreScores, topGenres.size),
            classificationReason = "readingLevel=$readingLevel; topics=${'$'}{topics.joinToString()} ; sentiment=${'$'}sentiment",
            tags = topics
        )
    }

    /**
     * Classifies a video based on its extracted metadata.
     *
     * @param metadata The extracted metadata of the video.
     * @return A [ContentClassification] object with the classification results.
     */
    suspend fun classifyVideo(metadata: ExtractedMetadata): ContentClassification = withContext(Dispatchers.IO) {
        val title = metadata.title?.lowercase().orEmpty()
        val description = metadata.description?.lowercase().orEmpty()
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
            mediaType = MediaType.MOVIE,
            genre = topGenres.firstOrNull() ?: "general",
            subGenre = topGenres.getOrNull(1),
            ageRating = "Not Rated",
            contentWarnings = emptyList(),
            confidence = if (topGenres.isNotEmpty()) 0.7f else 0.3f,
            classificationReason = "videoKeywordsBased",
            tags = topGenres
        )
    }

    /**
     * Classifies an audio file based on its extracted metadata.
     *
     * @param metadata The extracted metadata of the audio file.
     * @return A [ContentClassification] object with the classification results.
     */
    suspend fun classifyAudio(metadata: ExtractedMetadata): ContentClassification = withContext(Dispatchers.IO) {
        val genre = metadata.genre ?: "music"

        ContentClassification(
            mediaType = MediaType.MUSIC,
            genre = genre,
            subGenre = null,
            ageRating = null,
            contentWarnings = emptyList(),
            confidence = 0.8f,
            classificationReason = "metadataGenre",
            tags = listOfNotNull(metadata.genre)
        )
    }

    /**
     * Analyzes a comic book cover.
     * This is a placeholder for a more complex implementation that would likely involve image analysis.
     *
     * @return A [ContentClassification] object with the classification results.
     */
    suspend fun analyzeComicCover(): ContentClassification = withContext(Dispatchers.IO) {
        // Simplified comic classifier
        ContentClassification(
            mediaType = MediaType.COMIC,
            genre = "comic",
            subGenre = null,
            ageRating = null,
            contentWarnings = emptyList(),
            confidence = 0.3f,
            classificationReason = "colorHeuristics",
            tags = emptyList()
        )
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
}