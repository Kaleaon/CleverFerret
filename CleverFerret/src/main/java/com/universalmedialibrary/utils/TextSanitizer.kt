package com.universalmedialibrary.utils

import com.universalmedialibrary.data.repository.DictionaryRepository
import com.universalmedialibrary.services.dictionary.DictionaryService
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
 * - Fictional typo correction (OOCS specific)
 * - Custom Dictionary support (Whitelists and Replacements)
 * - Whitespace cleanup
 * - Verification against online dictionary
 */
@Singleton
class TextSanitizer @Inject constructor(
    private val dictionaryRepository: DictionaryRepository,
    private val dictionaryService: DictionaryService
) {

    // Base fictional terms (hardcoded whitelist fallback)
    private val baseFictionalTerms = setOf(
        "Axiom", "Cannidor", "Centris", "Nagasha", "Sonir", "Tret", "Lydris", 
        "Metak", "Undaunted", "Dauntless", "Apuk", "Gravia", "Phosa", "Slob", 
        "Yauya", "Zullt", "Porg", "Kohb", "Gorg", "Horchka"
    )

    // Common Fictional Typos Correction Map
    // These are specific to "Out of Cruel Space" and similar HFY stories where users might
    // consistently misspell certain made-up terms.
    private val fictionalTypos = mapOf(
        "camidor" to "Cannidor",
        "axium" to "Axiom",
        "centis" to "Centris",
        "nagasha" to "Nagasha", // Capitalization
        "sonir" to "Sonir",     // Capitalization
        "tret" to "Tret",       // Capitalization
        "metak" to "Metak"      // Capitalization
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

        // 3. Apply Typos (Common + Fictional)
        // Merged list of standard typos and fictional specific typos
        val allTypos = commonTypos + fictionalTypos
        
        allTypos.forEach { (typo, correction) ->
            val pattern = Pattern.compile("\\b$typo\\b", Pattern.CASE_INSENSITIVE)
            val matcher = pattern.matcher(text)
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
            text = sb.toString()
        }

        // 4. Apply Custom Dictionary Replacements (Global + Book Specific)
        if (bookId != null) {
            val dictionary = runBlocking { dictionaryRepository.getApplicableDictionary(bookId) }
            val replacements = dictionary.filter { it.replacement != null }
            
            replacements.forEach { entry ->
                val pattern = Pattern.compile("\\b${Pattern.quote(entry.word)}\\b", Pattern.CASE_INSENSITIVE)
                val matcher = pattern.matcher(text)
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

        // Apply Typos (Common + Fictional)
        val allTypos = commonTypos + fictionalTypos
        allTypos.forEach { (typo, correction) ->
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
     * Verify a word against online dictionary and local whitelist.
     * Returns TRUE if word is valid (Real word OR Whitelisted).
     */
    suspend fun verifyWord(word: String, bookId: Long? = null): Boolean {
        // 1. Check basic fictional terms
        if (baseFictionalTerms.contains(word)) return true
        if (fictionalTypos.containsValue(word)) return true // It's a valid correction term
        
        // 2. Check custom dictionary
        if (bookId != null) {
            val dict = dictionaryRepository.getApplicableDictionary(bookId)
            if (dict.any { it.word.equals(word, ignoreCase = true) && it.replacement == null }) {
                return true
            }
        }
        
        // 3. Check online dictionary
        return dictionaryService.isValidWord(word)
    }
    
    fun getBaseFictionalTerms(): Set<String> = baseFictionalTerms
}
