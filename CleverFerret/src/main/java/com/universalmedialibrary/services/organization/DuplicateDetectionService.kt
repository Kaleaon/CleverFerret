package com.universalmedialibrary.services.organization

import com.universalmedialibrary.data.local.entity.BookEntity
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for detecting duplicate books
 */
@Singleton
class DuplicateDetectionService @Inject constructor() {
    
    /**
     * Find potential duplicates in a list of books
     */
    suspend fun findDuplicates(
        books: List<BookEntity>,
        threshold: Float = 0.85f
    ): List<DuplicateGroup> = withContext(Dispatchers.Default) {
        val duplicateGroups = mutableListOf<DuplicateGroup>()
        val processed = mutableSetOf<String>()
        
        books.forEach { book1 ->
            if (book1.id in processed) return@forEach
            
            val duplicates = mutableListOf<DuplicateMatch>()
            duplicates.add(DuplicateMatch(book1, 1.0f, listOf("Original")))
            
            books.forEach { book2 ->
                if (book1.id != book2.id && book2.id !in processed) {
                    val similarity = calculateSimilarity(book1, book2)
                    if (similarity >= threshold) {
                        val reasons = getSimilarityReasons(book1, book2)
                        duplicates.add(DuplicateMatch(book2, similarity, reasons))
                        processed.add(book2.id)
                    }
                }
            }
            
            if (duplicates.size > 1) {
                processed.add(book1.id)
                duplicateGroups.add(DuplicateGroup(duplicates))
            }
        }
        
        duplicateGroups.sortedByDescending { it.matches.size }
    }
    
    /**
     * Calculate similarity between two books (0.0 to 1.0)
     */
    private fun calculateSimilarity(book1: BookEntity, book2: BookEntity): Float {
        var score = 0f
        var maxScore = 0f
        
        // ISBN match (strongest signal)
        if (!book1.isbn.isNullOrBlank() && !book2.isbn.isNullOrBlank()) {
            maxScore += 50f
            if (book1.isbn == book2.isbn) {
                score += 50f
            }
        }
        
        // Title similarity
        maxScore += 30f
        score += titleSimilarity(book1.title, book2.title) * 30f
        
        // Author similarity
        maxScore += 15f
        score += authorSimilarity(book1.author, book2.author) * 15f
        
        // File size similarity (if both have files)
        if (book1.fileSize > 0 && book2.fileSize > 0) {
            maxScore += 5f
            val sizeRatio = minOf(book1.fileSize, book2.fileSize).toFloat() / 
                           maxOf(book1.fileSize, book2.fileSize).toFloat()
            if (sizeRatio > 0.9f) score += 5f
        }
        
        return if (maxScore > 0) score / maxScore else 0f
    }
    
    /**
     * Get reasons for similarity
     */
    private fun getSimilarityReasons(book1: BookEntity, book2: BookEntity): List<String> {
        val reasons = mutableListOf<String>()
        
        if (!book1.isbn.isNullOrBlank() && book1.isbn == book2.isbn) {
            reasons.add("Same ISBN")
        }
        
        if (titleSimilarity(book1.title, book2.title) > 0.9f) {
            reasons.add("Very similar title")
        }
        
        if (authorSimilarity(book1.author, book2.author) > 0.9f) {
            reasons.add("Same author")
        }
        
        if (book1.fileSize > 0 && book2.fileSize > 0) {
            val sizeRatio = minOf(book1.fileSize, book2.fileSize).toFloat() / 
                           maxOf(book1.fileSize, book2.fileSize).toFloat()
            if (sizeRatio > 0.95f) {
                reasons.add("Similar file size")
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
     * Calculate author similarity
     */
    private fun authorSimilarity(author1: String?, author2: String?): Float {
        if (author1.isNullOrBlank() || author2.isNullOrBlank()) return 0f
        
        val a1 = normalizeAuthor(author1)
        val a2 = normalizeAuthor(author2)
        
        if (a1 == a2) return 1.0f
        
        // Check if one contains the other (handles "J.K. Rowling" vs "Rowling, J.K.")
        if (a1.contains(a2) || a2.contains(a1)) return 0.9f
        
        val distance = levenshteinDistance(a1, a2)
        val maxLength = maxOf(a1.length, a2.length)
        
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
     * Normalize author name for comparison
     */
    private fun normalizeAuthor(author: String): String {
        return author.lowercase()
            .replace(Regex("[^a-z\\s]"), "")
            .replace(Regex("\\s+"), " ")
            .trim()
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
 * A book that matches as a duplicate
 */
data class DuplicateMatch(
    val book: BookEntity,
    val similarity: Float, // 0.0 to 1.0
    val reasons: List<String>
)
