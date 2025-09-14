package com.universalmedialibrary.services.analysis.nlp

import android.content.Context
import android.graphics.Bitmap
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import com.universalmedialibrary.services.analysis.ExtractedMetadata
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.withContext
import kotlinx.coroutines.Dispatchers
import java.io.File
import java.util.regex.Pattern
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Extracts metadata from text content using NLP techniques
 */
@Singleton
class MetadataExtractor @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val textRecognizer = TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
    
    /**
     * Extract metadata from text content
     */
    suspend fun extractFromText(text: String): ExtractedMetadata = withContext(Dispatchers.IO) {
        val metadata = ExtractedMetadata(
            title = extractTitle(text),
            author = extractAuthor(text),
            description = extractDescription(text),
            publishDate = extractPublishDate(text),
            genre = extractGenre(text),
            language = detectLanguage(text),
            isbn = extractISBN(text),
            publisher = extractPublisher(text),
            pageCount = extractPageCount(text),
            confidence = 0.7f,
            extractionMethod = "NLP Text Analysis"
        )
        
        metadata
    }
    
    /**
     * Extract metadata from file content
     */
    suspend fun extractFromFile(file: File): ExtractedMetadata = withContext(Dispatchers.IO) {
        val text = when (file.extension.lowercase()) {
            "txt" -&gt; file.readText()
            "pdf" -&gt; extractTextFromPDF(file)
            "epub" -&gt; extractTextFromEPUB(file)
            else -&gt; file.name
        }
        
        extractFromText(text)
    }
    
    private fun extractTitle(text: String): String? {
        // Look for title patterns in the first few lines
        val lines = text.lines().take(10)
        
        // Pattern 1: Look for "Title:" or similar
        for (line in lines) {
            val titleMatch = Pattern.compile("(?i)title:?\\s*(.+)").matcher(line.trim())
            if (titleMatch.find()) {
                return titleMatch.group(1)?.trim()
            }
        }
        
        // Pattern 2: First non-empty line that's not too long
        for (line in lines) {
            val trimmed = line.trim()
            if (trimmed.isNotEmpty() &amp;&amp; trimmed.length in 5..100) {
                return trimmed
            }
        }
        
        return null
    }
    
    private fun extractAuthor(text: String): String? {
        val lines = text.lines().take(20)
        
        // Pattern 1: Look for "by Author" or "Author:"
        for (line in lines) {
            val byMatch = Pattern.compile("(?i)by\\s+([a-zA-Z\\s.]+)").matcher(line)
            if (byMatch.find()) {
                return byMatch.group(1)?.trim()
            }
            
            val authorMatch = Pattern.compile("(?i)author:?\\s*(.+)").matcher(line.trim())
            if (authorMatch.find()) {
                return authorMatch.group(1)?.trim()
            }
        }
        
        return null
    }
    
    private fun extractDescription(text: String): String? {
        // Look for description in the first paragraph after title/author
        val lines = text.lines()
        var foundTitleAuthor = false
        val descriptionLines = mutableListOf&lt;String&gt;()
        
        for (line in lines) {
            val trimmed = line.trim()
            if (trimmed.isEmpty()) continue
            
            if (!foundTitleAuthor &amp;&amp; (trimmed.contains("title", true) || trimmed.contains("author", true))) {
                foundTitleAuthor = true
                continue
            }
            
            if (foundTitleAuthor &amp;&amp; trimmed.length &gt; 50) {
                descriptionLines.add(trimmed)
                if (descriptionLines.size &gt;= 3) break
            }
        }
        
        return if (descriptionLines.isNotEmpty()) {
            descriptionLines.joinToString(" ").take(500)
        } else null
    }
    
    private fun extractPublishDate(text: String): String? {
        // Look for year patterns (1900-2099)
        val yearMatch = Pattern.compile("\\b(19|20)\\d{2}\\b").matcher(text)
        if (yearMatch.find()) {
            return yearMatch.group()
        }
        return null
    }
    
    private fun extractGenre(text: String): String? {
        val genres = listOf(
            "fiction", "non-fiction", "mystery", "romance", "science fiction",
            "fantasy", "thriller", "biography", "history", "self-help"
        )
        
        val lowerText = text.lowercase()
        return genres.firstOrNull { lowerText.contains(it) }
    }
    
    private fun detectLanguage(text: String): String? {
        // Simple language detection based on common words
        val englishWords = setOf("the", "and", "or", "but", "in", "on", "at", "to", "for", "of", "with", "by")
        val words = text.lowercase().split("\\s+".toRegex()).take(100)
        
        val englishCount = words.count { it in englishWords }
        
        return if (englishCount &gt; words.size * 0.1) "en" else null
    }
    
    private fun extractISBN(text: String): String? {
        // ISBN-10 or ISBN-13 pattern
        val isbnMatch = Pattern.compile("ISBN[-\\s]*(\\d{1,5}[-\\s]*\\d{1,7}[-\\s]*\\d{1,7}[-\\s]*[\\dX])").matcher(text)
        if (isbnMatch.find()) {
            return isbnMatch.group(1)?.replace("[-\\s]".toRegex(), "")
        }
        return null
    }
    
    private fun extractPublisher(text: String): String? {
        val lines = text.lines().take(30)
        
        for (line in lines) {
            val publisherMatch = Pattern.compile("(?i)publisher:?\\s*(.+)").matcher(line.trim())
            if (publisherMatch.find()) {
                return publisherMatch.group(1)?.trim()
            }
        }
        
        return null
    }
    
    private fun extractPageCount(text: String): Int? {
        val pageMatch = Pattern.compile("(?i)pages?:?\\s*(\\d+)").matcher(text)
        return if (pageMatch.find()) {
            pageMatch.group(1)?.toIntOrNull()
        } else null
    }
    
    private fun extractTextFromPDF(file: File): String {
        // Placeholder for PDF text extraction
        return file.name
    }
    
    private fun extractTextFromEPUB(file: File): String {
        // Placeholder for EPUB text extraction
        return file.name
    }
}