package com.universalmedialibrary.utils

import java.util.regex.Pattern
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Utility for cleaning up text content in downloaded stories.
 * Handles:
 * - Markdown artifacts
 * - Punctuation standardization (Smart quotes, ellipses)
 * - Common typo correction (safe list)
 * - Whitespace cleanup
 */
@Singleton
class TextSanitizer @Inject constructor() {

    private val fictionalTerms = setOf(
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

    fun sanitize(htmlContent: String): String {
        var text = htmlContent

        // 1. Standardize Punctuation
        text = text.replace("...", "…") // Standard ellipsis
        text = text.replace("..", "…")  // Lazy ellipsis
        text = text.replace(" ,", ",")  // Space before comma
        text = text.replace(" .", ".")  // Space before period
        text = text.replace(" !", "!")
        text = text.replace(" ?", "?")

        // Smart Quotes (Simple heuristic)
        // Convert generic straight quotes to curly quotes where possible
        // This is complex in HTML tags, so we must be careful not to break tags.
        // For now, we skip regex replacement of quotes to avoid breaking <a href="...">
        // A safer approach is to replace only text outside tags, but that requires parsing.
        // We will skip smart quote conversion for now to ensure HTML safety.

        // 2. Whitespace Cleanup
        text = text.replace(Regex("\\s+"), " ") // Collapse multiple spaces (in HTML this doesn't matter much but good for source)
        text = text.replace(Regex("\\s<"), "<") // Remove space before tag start if accidental
        
        // 3. Typo Correction (Case-insensitive, whole word only)
        // We process text content, avoiding HTML tags.
        // For a simple robust solution without full HTML parsing overhead for every word:
        // We will rely on the fact that typos usually don't appear in HTML tags (class names, etc).
        // But they might.
        // Ideally, we iterate over text nodes.
        
        // Since we are dealing with HTML, regex replacement on the raw string is risky.
        // We should only sanitize TEXT content.
        
        return text
    }

    /**
     * Sanitize raw text (before HTML conversion) or extracted text nodes.
     */
    fun sanitizeText(text: String): String {
        var clean = text

        // Whitespace
        clean = clean.replace(Regex("[ \\t]+"), " ") // Collapse spaces/tabs
        
        // Punctuation
        clean = clean.replace("...", "…")
        clean = clean.replace("..", "…")
        
        // Smart Quotes (Safe here)
        clean = clean.replace("\"", "”") // Default to closing/right
               .replace(Regex("(\\s)\""), "$1“") // Open if preceded by space
               .replace(Regex("^\""), "“") // Open if start of line
               
        clean = clean.replace("'", "’")
               .replace(Regex("(\\s)'"), "$1‘")
               .replace(Regex("^'"), "‘")

        // Typo Correction
        commonTypos.forEach { (typo, correction) ->
            // \b matches word boundary
            val pattern = Pattern.compile("\\b$typo\\b", Pattern.CASE_INSENSITIVE)
            val matcher = pattern.matcher(clean)
            val sb = StringBuffer()
            while (matcher.find()) {
                // Preserve casing
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

        return clean
    }
}
