package com.universalmedialibrary.services.organization

import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for detecting duplicate media items using similarity-based matching.
 * 
 * This service uses metadata similarity (title, filename, size, duration) to find duplicates.
 * For content-based fingerprinting, see services.duplicates.DuplicateDetectionService.
 */
@Singleton
class SimilarityBasedDuplicateDetectionService @Inject constructor() {
    
    /**
     * Find potential duplicates in a list of media items
     */
    suspend fun findDuplicates(
        items: List<MediaItem>,
        threshold: Float = 0.85f
    ): List<DuplicateGroup> = withContext(Dispatchers.Default) {
        val duplicateGroups = mutableListOf<DuplicateGroup>()
        val processed = mutableSetOf<Long>()
        
        items.forEach { item1 ->
            if (item1.id in processed) return@forEach
            
            val duplicates = mutableListOf<DuplicateMatch>()
            duplicates.add(DuplicateMatch(item1, 1.0f, listOf("Original")))
            
            items.forEach { item2 ->
                if (item1.id != item2.id && item2.id !in processed) {
                    val similarity = calculateSimilarity(item1, item2)
                    if (similarity >= threshold) {
                        val reasons = getSimilarityReasons(item1, item2)
                        duplicates.add(DuplicateMatch(item2, similarity, reasons))
                        processed.add(item2.id)
                    }
                }
            }
            
            if (duplicates.size > 1) {
                processed.add(item1.id)
                duplicateGroups.add(DuplicateGroup(duplicates))
            }
        }
        
        duplicateGroups.sortedByDescending { it.matches.size }
    }
    
    /**
     * Calculate similarity between two media items (0.0 to 1.0)
     */
    private fun calculateSimilarity(item1: MediaItem, item2: MediaItem): Float {
        var score = 0f
        var maxScore = 0f
        
        // Same media type (required)
        if (item1.type != item2.type) return 0f
        
        // Title similarity
        maxScore += 50f
        score += titleSimilarity(item1.title, item2.title) * 50f
        
        // File path similarity (same filename)
        maxScore += 20f
        val file1 = item1.filePath.substringAfterLast("/")
        val file2 = item2.filePath.substringAfterLast("/")
        score += titleSimilarity(file1, file2) * 20f
        
        // File size similarity
        if (item1.fileSize > 0 && item2.fileSize > 0) {
            maxScore += 20f
            val sizeRatio = minOf(item1.fileSize, item2.fileSize).toFloat() / 
                           maxOf(item1.fileSize, item2.fileSize).toFloat()
            if (sizeRatio > 0.95f) score += 20f
            else if (sizeRatio > 0.85f) score += 10f
        }
        
        // Duration similarity (for audio/video)
        val duration1 = item1.duration ?: 0L
        val duration2 = item2.duration ?: 0L
        if (duration1 > 0 && duration2 > 0) {
            maxScore += 10f
            val durationRatio = minOf(duration1, duration2).toFloat() / 
                               maxOf(duration1, duration2).toFloat()
            if (durationRatio > 0.95f) score += 10f
        }
        
        return if (maxScore > 0) score / maxScore else 0f
    }
    
    /**
     * Get reasons for similarity
     */
    private fun getSimilarityReasons(item1: MediaItem, item2: MediaItem): List<String> {
        val reasons = mutableListOf<String>()
        
        if (titleSimilarity(item1.title, item2.title) > 0.9f) {
            reasons.add("Very similar title")
        }
        
        val file1 = item1.filePath.substringAfterLast("/")
        val file2 = item2.filePath.substringAfterLast("/")
        if (titleSimilarity(file1, file2) > 0.9f) {
            reasons.add("Same filename")
        }
        
        if (item1.fileSize > 0 && item2.fileSize > 0) {
            val sizeRatio = minOf(item1.fileSize, item2.fileSize).toFloat() / 
                           maxOf(item1.fileSize, item2.fileSize).toFloat()
            if (sizeRatio > 0.95f) {
                reasons.add("Identical file size")
            }
        }
        
        val duration1 = item1.duration ?: 0L
        val duration2 = item2.duration ?: 0L
        if (duration1 > 0 && duration2 > 0) {
            val durationRatio = minOf(duration1, duration2).toFloat() / 
                               maxOf(duration1, duration2).toFloat()
            if (durationRatio > 0.95f) {
                reasons.add("Same duration")
            }
        }
        
        return reasons
    }
    
    /**
     * Calculate title similarity using Levenshtein distance
     */
    private fun titleSimilarity(title1: String, title2: String): Float {
        val t1 = normalizeTitle(title1)
        val t2 = normalizeTitle(title2)
        
        if (t1 == t2) return 1.0f
        
        val distance = levenshteinDistance(t1, t2)
        val maxLength = maxOf(t1.length, t2.length)
        
        return if (maxLength > 0) {
            1f - (distance.toFloat() / maxLength)
        } else 0f
    }
    
    /**
     * Normalize title for comparison
     */
    private fun normalizeTitle(title: String): String {
        return title.lowercase()
            .replace(Regex("[^a-z0-9\\s]"), "")
            .replace(Regex("\\s+"), " ")
            .trim()
            .removePrefix("the ")
            .removePrefix("a ")
            .removePrefix("an ")
    }
    
    /**
     * Calculate Levenshtein distance between two strings
     */
    private fun levenshteinDistance(s1: String, s2: String): Int {
        val len1 = s1.length
        val len2 = s2.length
        
        val dp = Array(len1 + 1) { IntArray(len2 + 1) }
        
        for (i in 0..len1) dp[i][0] = i
        for (j in 0..len2) dp[0][j] = j
        
        for (i in 1..len1) {
            for (j in 1..len2) {
                val cost = if (s1[i - 1] == s2[j - 1]) 0 else 1
                dp[i][j] = minOf(
                    dp[i - 1][j] + 1,      // deletion
                    dp[i][j - 1] + 1,      // insertion
                    dp[i - 1][j - 1] + cost // substitution
                )
            }
        }
        
        return dp[len1][len2]
    }
}

/**
 * Group of duplicate books
 */
data class DuplicateGroup(
    val matches: List<DuplicateMatch>
) {
    val count: Int get() = matches.size
    val averageSimilarity: Float get() = matches.map { it.similarity }.average().toFloat()
}

/**
 * A media item that matches as a duplicate
 */
data class DuplicateMatch(
    val item: MediaItem,
    val similarity: Float, // 0.0 to 1.0
    val reasons: List<String>
)
