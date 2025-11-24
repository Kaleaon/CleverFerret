package com.universalmedialibrary.utils

import com.universalmedialibrary.data.repository.DictionaryRepository
import java.util.regex.Pattern
import javax.inject.Inject
import javax.inject.Singleton
import kotlinx.coroutines.runBlocking

/**
 * Utility for cleaning up text content in downloaded stories.
 * Handles:
 * - Markdown artifacts
 * - Punctuation standardization (Smart quotes, ellipses)
 * - Common typo correction (safe list)
 * - Custom Dictionary support (Whitelists and Replacements)
 * - Whitespace cleanup
 */
@Singleton
class TextSanitizer @Inject constructor(
    private val dictionaryRepository: DictionaryRepository
) {

    // Base fictional terms (hardcoded fallback)
    private val baseFictionalTerms = setOf(
        "Axiom", "Cannidor", "Centris", "Nagasha", "Sonir", "Tret", "Lydris", 
        "Metak", "Undaunted", "Dauntless", "Apuk", "Gravia", "Phosa", "Slob", 
        "Yauya", "Zullt", "Porg", "Kohb", "Gorg", "Horchka"
    )

    // Safe, common English typos that are almost always errors
    private val commonTypos = mapOf(
        "teh" to "the",
        "recieve" to "receive",
        "address" to "address",
        "occured" to "occurred",
        "seperate" to "separate",
        "definately" to "definitely",
        "wether" to "whether",
        "amoung" to "among",
        "futher" to "further",
        "towrads" to "towards"
    )

    /**
     * Sanitize HTML content using global rules and specific book dictionary.
     * 
     * @param htmlContent The raw HTML content.
     * @param bookId Optional ID of the book to apply specific dictionary rules.
     */
    fun sanitize(htmlContent: String, bookId: Long? = null): String {
        var text = htmlContent

        // 1. Standardize Punctuation (Safe Regex)
        text = text.replace("...", "…") // Standard ellipsis
        text = text.replace("..", "…")  // Lazy ellipsis
        text = text.replace(" ,", ",")  // Space before comma
        text = text.replace(" .", ".")  // Space before period
        text = text.replace(" !", "!")
        text = text.replace(" ?", "?")

        // 2. Whitespace Cleanup
        text = text.replace(Regex("\\s+"), " ") // Collapse multiple spaces
        text = text.replace(Regex("\\s<"), "<") // Remove space before tag start

        // 3. Apply Custom Dictionary Replacements (Global + Book Specific)
        // Note: runBlocking is used here because sanitization is typically run in background IO context
        // If running on UI thread, this is bad, but downloaders run in IO.
        if (bookId != null) {
            val dictionary = runBlocking { dictionaryRepository.getApplicableDictionary(bookId) }
            
            // Sort replacements by length descending to avoid partial matches (e.g. replacing "cat" inside "catapult")
            // Actually, we use word boundaries \b so length order is less critical but still good practice.
            val replacements = dictionary.filter { it.replacement != null }
            
            replacements.forEach { entry ->
                val pattern = Pattern.compile("\\b${Pattern.quote(entry.word)}\\b", Pattern.CASE_INSENSITIVE)
                val matcher = pattern.matcher(text)
                val sb = StringBuffer()
                while (matcher.find()) {
                    // Preserve capitalization of the replacement if source was capitalized
                    val found = matcher.group()
                    val replacement = entry.replacement!!
                    
                    val finalReplacement = if (found[0].isUpperCase()) {
                        replacement.replaceFirstChar { it.uppercase() }
                    } else {
                        replacement
                    }
                    matcher.appendReplacement(sb, finalReplacement)
                }
                matcher.appendTail(sb)
                text = sb.toString()
            }
        }

        return text
    }

    /**
     * Sanitize raw text (before HTML conversion) or extracted text nodes.
     */
    fun sanitizeText(text: String, bookId: Long? = null): String {
        var clean = text

        // Whitespace
        clean = clean.replace(Regex("[ \\t]+"), " ")
        
        // Punctuation
        clean = clean.replace("...", "…")
        clean = clean.replace("..", "…")
        
        // Smart Quotes
        clean = clean.replace("\"", "”")
               .replace(Regex("(\\s)\""), "$1“")
               .replace(Regex("^\""), "“")
               
        clean = clean.replace("'", "’")
               .replace(Regex("(\\s)'"), "$1‘")
               .replace(Regex("^'"), "‘")

        // Common Typo Correction
        commonTypos.forEach { (typo, correction) ->
            // Skip if this typo is whitelisted in the custom dictionary
            // (Optimization: Check whitelist once instead of per typo?)
            // For now, we assume commonTypos are always errors unless overridden.
            
            val pattern = Pattern.compile("\\b$typo\\b", Pattern.CASE_INSENSITIVE)
            val matcher = pattern.matcher(clean)
            val sb = StringBuffer()
            while (matcher.find()) {
                val found = matcher.group()
                val replacement = if (found[0].isUpperCase()) {
                    correction.replaceFirstChar { it.uppercase() }
                } else {
                    correction
                }
                matcher.appendReplacement(sb, replacement)
            }
            matcher.appendTail(sb)
            clean = sb.toString()
        }
        
        // Apply Custom Replacements
        if (bookId != null) {
            val dictionary = runBlocking { dictionaryRepository.getApplicableDictionary(bookId) }
            val replacements = dictionary.filter { it.replacement != null }
            
            replacements.forEach { entry ->
                val pattern = Pattern.compile("\\b${Pattern.quote(entry.word)}\\b", Pattern.CASE_INSENSITIVE)
                val matcher = pattern.matcher(clean)
                val sb = StringBuffer()
                while (matcher.find()) {
                    val found = matcher.group()
                    val replacement = entry.replacement!!
                    val finalReplacement = if (found[0].isUpperCase()) {
                        replacement.replaceFirstChar { it.uppercase() }
                    } else {
                        replacement
                    }
                    matcher.appendReplacement(sb, finalReplacement)
                }
                matcher.appendTail(sb)
                clean = sb.toString()
            }
        }

        return clean
    }
    
    /**
     * Helper to get default whitelist for initial setup
     */
    fun getBaseFictionalTerms(): Set<String> = baseFictionalTerms
}
