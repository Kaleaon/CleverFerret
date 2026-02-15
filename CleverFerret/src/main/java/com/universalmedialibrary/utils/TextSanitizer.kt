package com.universalmedialibrary.utils

import com.universalmedialibrary.data.local.entity.DictionaryEntry
import com.universalmedialibrary.data.repository.DictionaryRepository
import com.universalmedialibrary.services.dictionary.DictionaryService
import java.util.regex.Pattern
import javax.inject.Inject
import javax.inject.Singleton
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

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

    private val fictionalTypos = mapOf(
        "camidor" to "Cannidor",
        "axium" to "Axiom",
        "centis" to "Centris",
        "nagasha" to "Nagasha",
        "sonir" to "Sonir",
        "tret" to "Tret",
        "metak" to "Metak"
    )

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

    private val allTypos = commonTypos + fictionalTypos

    /**
     * Sanitize HTML content using global rules and specific book dictionary.
     */
    suspend fun sanitize(htmlContent: String, bookId: Long? = null): String {
        val replacements = loadDictionaryReplacements(bookId)
        return withContext(Dispatchers.Default) {
            val base = sanitizeHtmlCore(htmlContent)
            applyCustomReplacements(base, replacements)
        }
    }

    /**
     * Sanitize raw text (before HTML conversion) or extracted text nodes.
     */
    suspend fun sanitizeText(text: String, bookId: Long? = null): String {
        val replacements = loadDictionaryReplacements(bookId)
        return withContext(Dispatchers.Default) {
            val base = sanitizeTextCore(text)
            applyCustomReplacements(base, replacements)
        }
    }

    private suspend fun loadDictionaryReplacements(bookId: Long?): List<DictionaryEntry> {
        if (bookId == null) return emptyList()
        return withContext(Dispatchers.IO) {
            dictionaryRepository.getApplicableDictionary(bookId)
                .filter { it.replacement != null }
        }
    }

    private fun sanitizeHtmlCore(htmlContent: String): String {
        var text = htmlContent

        text = text.replace("...", "…")
        text = text.replace("..", "…")
        text = text.replace(" ,", ",")
        text = text.replace(" .", ".")
        text = text.replace(" !", "!")
        text = text.replace(" ?", "?")

        text = text.replace(Regex("\\s+"), " ")
        text = text.replace(Regex("\\s<"), "<")

        return applyTypos(text)
    }

    private fun sanitizeTextCore(text: String): String {
        var clean = text

        clean = clean.replace(Regex("[ \\t]+"), " ")
        clean = clean.replace("...", "…")
        clean = clean.replace("..", "…")

        clean = clean.replace("\"", "”")
            .replace(Regex("(\\s)\""), "$1“")
            .replace(Regex("^\""), "“")

        clean = clean.replace("'", "’")
            .replace(Regex("(\\s)'"), "$1‘")
            .replace(Regex("^'"), "‘")

        return applyTypos(clean)
    }

    private fun applyTypos(input: String): String {
        var output = input
        allTypos.forEach { (typo, correction) ->
            output = replaceWord(output, typo, correction)
        }
        return output
    }

    private fun applyCustomReplacements(input: String, replacements: List<DictionaryEntry>): String {
        var output = input
        replacements.forEach { entry ->
            output = replaceWord(output, entry.word, entry.replacement.orEmpty())
        }
        return output
    }

    private fun replaceWord(input: String, word: String, replacement: String): String {
        val pattern = Pattern.compile("\\b${Pattern.quote(word)}\\b", Pattern.CASE_INSENSITIVE)
        val matcher = pattern.matcher(input)
        val sb = StringBuffer()
        while (matcher.find()) {
            val found = matcher.group()
            val finalReplacement = if (found.firstOrNull()?.isUpperCase() == true) {
                replacement.replaceFirstChar { it.uppercase() }
            } else {
                replacement
            }
            matcher.appendReplacement(sb, finalReplacement)
        }
        matcher.appendTail(sb)
        return sb.toString()
    }

    suspend fun verifyWord(word: String, bookId: Long? = null): Boolean {
        if (baseFictionalTerms.contains(word)) return true
        if (fictionalTypos.containsValue(word)) return true

        if (bookId != null) {
            val dict = withContext(Dispatchers.IO) { dictionaryRepository.getApplicableDictionary(bookId) }
            if (dict.any { it.word.equals(word, ignoreCase = true) && it.replacement == null }) {
                return true
            }
        }

        return dictionaryService.isValidWord(word)
    }

    fun getBaseFictionalTerms(): Set<String> = baseFictionalTerms
}
