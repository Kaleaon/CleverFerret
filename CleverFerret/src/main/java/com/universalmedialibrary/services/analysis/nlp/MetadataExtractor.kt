package com.universalmedialibrary.services.analysis.nlp

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import com.google.mlkit.nl.languageid.LanguageIdentification
import com.universalmedialibrary.services.analysis.ExtractedMetadata
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext
import org.apache.commons.lang3.StringUtils
import java.io.File
import java.util.regex.Pattern
import javax.inject.Inject
import javax.inject.Singleton

/**
 * NLP-powered metadata extraction service
 * Uses various NLP techniques to extract structured metadata from text content
 */
@Singleton
class MetadataExtractor @Inject constructor() {

    private val languageIdentifier = LanguageIdentification.getClient()

    // Common patterns for metadata extraction
    private val titlePatterns = listOf(
        Pattern.compile("^([A-Z][^\\n]{10,100})$", Pattern.MULTILINE),
        Pattern.compile("TITLE[:\\s]+([^\\n]+)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("^\\s*([A-Z][A-Za-z\\s,'\".-]{10,80})\\s*$", Pattern.MULTILINE)
    )

    private val authorPatterns = listOf(
        Pattern.compile("(?:by|author|written by)[:\\s]+([A-Z][a-z]+(?: [A-Z][a-z]+)*)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("^([A-Z][a-z]+ [A-Z][a-z]+(?:, [A-Z][a-z]+ [A-Z][a-z]+)?)$", Pattern.MULTILINE),
        Pattern.compile("AUTHOR[:\\s]+([^\\n]+)", Pattern.CASE_INSENSITIVE)
    )

    private val isbnPatterns = listOf(
        Pattern.compile("ISBN[:\\s-]*([0-9X-]{10,17})", Pattern.CASE_INSENSITIVE),
        Pattern.compile("\\b(97[89][0-9X-]{10,14})\\b"),
        Pattern.compile("\\b([0-9X-]{10})\\b")
    )

    private val publisherPatterns = listOf(
        Pattern.compile("(?:publisher|published by)[:\\s]+([^\\n]+)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("© \\d{4} ([A-Z][a-zA-Z\\s&]+)", Pattern.CASE_INSENSITIVE)
    )

    private val datePatterns = listOf(
        Pattern.compile("(?:published|copyright|©)[:\\s]*([12][0-9]{3})", Pattern.CASE_INSENSITIVE),
        Pattern.compile("\\b(19|20)\\d{2}\\b"),
        Pattern.compile("([A-Z][a-z]+ \\d{1,2}, [12][0-9]{3})")
    )

    /**
     * Extract comprehensive metadata from text content
     */
    suspend fun extractMetadata(text: String): ExtractedMetadata = withContext(Dispatchers.IO) {
        val cleanText = cleanText(text)
        val lines = cleanText.lines().map { it.trim() }.filter { it.isNotEmpty() }
        
        // Extract basic metadata
        val title = extractTitle(lines, cleanText)
        val author = extractAuthor(lines, cleanText)
        val isbn = extractISBN(cleanText)
        val publisher = extractPublisher(lines, cleanText)
        val publishedDate = extractPublishedDate(cleanText)
        val language = detectLanguage(cleanText)
        
        // Extract advanced metadata
        val description = extractDescription(lines)
        val genres = extractGenres(cleanText)
        val series = extractSeries(cleanText)
        val pageCount = estimatePageCount(cleanText)
        val readingLevel = assessReadingLevel(cleanText)
        
        ExtractedMetadata(
            title = title,
            author = author,
            isbn = isbn,
            publisher = publisher,
            publishedDate = publishedDate,
            language = language,
            pageCount = pageCount,
            description = description,
            genres = genres,
            series = series.first,
            seriesNumber = series.second,
            readingLevel = readingLevel
        )
    }

    /**
     * Extract metadata from video files
     */
    suspend fun extractVideoMetadata(context: Context, uri: Uri): ExtractedMetadata = withContext(Dispatchers.IO) {
        try {
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(context, uri)
            
            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE) ?: ""
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST) ?: ""
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM) ?: ""
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
            val year = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR)?.toIntOrNull()
            val genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE) ?: ""
            
            retriever.release()
            
            // If no embedded metadata, extract from filename
            val filename = uri.lastPathSegment ?: ""
            val (extractedTitle, extractedYear) = extractTitleFromFilename(filename)
            
            ExtractedMetadata(
                title = title.ifEmpty { extractedTitle },
                director = artist, // In video context, artist might be director
                album = album, // Could be series name
                runtime = duration,
                releaseYear = year ?: extractedYear,
                genres = if (genre.isNotEmpty()) listOf(genre) else emptyList()
            )
            
        } catch (e: Exception) {
            // Fallback to filename extraction
            val filename = uri.lastPathSegment ?: ""
            val (title, year) = extractTitleFromFilename(filename)
            
            ExtractedMetadata(
                title = title,
                releaseYear = year
            )
        }
    }

    /**
     * Extract metadata from audio files
     */
    suspend fun extractAudioMetadata(context: Context, uri: Uri): ExtractedMetadata = withContext(Dispatchers.IO) {
        try {
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(context, uri)
            
            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE) ?: ""
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST) ?: ""
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM) ?: ""
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
            val trackNumber = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)?.toIntOrNull()
            val year = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR)?.toIntOrNull()
            val genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE) ?: ""
            
            retriever.release()
            
            // Extract from filename if no embedded metadata
            val filename = uri.lastPathSegment ?: ""
            val (extractedTitle, _) = extractTitleFromFilename(filename)
            
            ExtractedMetadata(
                title = title.ifEmpty { extractedTitle },
                artist = artist,
                album = album,
                trackNumber = trackNumber,
                duration = duration,
                releaseYear = year,
                genres = if (genre.isNotEmpty()) listOf(genre) else emptyList()
            )
            
        } catch (e: Exception) {
            val filename = uri.lastPathSegment ?: ""
            val (title, _) = extractTitleFromFilename(filename)
            
            ExtractedMetadata(title = title)
        }
    }

    /**
     * Extract metadata from comic files
     */
    suspend fun extractComicMetadata(context: Context, uri: Uri): ExtractedMetadata = withContext(Dispatchers.IO) {
        val filename = uri.lastPathSegment ?: ""
        val (title, series, issue, volume) = parseComicFilename(filename)
        
        ExtractedMetadata(
            title = title,
            series = series,
            issue = issue,
            volume = volume
        )
    }

    private fun cleanText(text: String): String {
        return text
            .replace(Regex("\\s+"), " ")
            .replace(Regex("[^\\p{L}\\p{N}\\p{P}\\p{S}\\s]"), "")
            .trim()
    }

    private fun extractTitle(lines: List<String>, fullText: String): String {
        // Try patterns in order of reliability
        for (pattern in titlePatterns) {
            val matcher = pattern.matcher(fullText)
            if (matcher.find()) {
                val candidate = matcher.group(1).trim()
                if (isValidTitle(candidate)) {
                    return candidate
                }
            }
        }
        
        // Fallback: first substantial line
        for (line in lines.take(10)) {
            if (line.length in 10..100 && !line.contains("©") && 
                !line.contains("ISBN", ignoreCase = true) &&
                !line.matches(Regex("^[0-9]+$"))) {
                return line
            }
        }
        
        return ""
    }

    private fun extractAuthor(lines: List<String>, fullText: String): String {
        for (pattern in authorPatterns) {
            val matcher = pattern.matcher(fullText)
            if (matcher.find()) {
                val candidate = matcher.group(1).trim()
                if (isValidAuthor(candidate)) {
                    return candidate
                }
            }
        }
        
        // Look for author-like patterns in lines
        for (line in lines.take(20)) {
            if (line.matches(Regex("^[A-Z][a-z]+ [A-Z][a-z]+$")) && 
                !line.contains("Publisher", ignoreCase = true)) {
                return line
            }
        }
        
        return ""
    }

    private fun extractISBN(text: String): String? {
        for (pattern in isbnPatterns) {
            val matcher = pattern.matcher(text)
            if (matcher.find()) {
                val isbn = matcher.group(1).replace("-", "").replace(" ", "")
                if (isValidISBN(isbn)) {
                    return isbn
                }
            }
        }
        return null
    }

    private fun extractPublisher(lines: List<String>, fullText: String): String {
        for (pattern in publisherPatterns) {
            val matcher = pattern.matcher(fullText)
            if (matcher.find()) {
                return matcher.group(1).trim()
            }
        }
        
        // Look for publisher patterns in lines
        for ((index, line) in lines.withIndex()) {
            if (index > 5 && line.matches(Regex("^[A-Z][a-zA-Z\\s&]+$")) && 
                line.length in 5..50) {
                return line
            }
        }
        
        return ""
    }

    private fun extractPublishedDate(text: String): String? {
        for (pattern in datePatterns) {
            val matcher = pattern.matcher(text)
            if (matcher.find()) {
                return matcher.group(1)
            }
        }
        return null
    }

    private suspend fun detectLanguage(text: String): String {
        return try {
            val result = languageIdentifier.identifyLanguage(text.take(1000)).await()
            if (result != "und") result else "en" // Default to English if undetermined
        } catch (e: Exception) {
            "en" // Default to English on error
        }
    }

    private fun extractDescription(lines: List<String>): String {
        // Look for substantial paragraphs that could be descriptions
        val candidates = lines.filter { 
            it.length > 100 && 
            !it.contains("ISBN", ignoreCase = true) &&
            !it.contains("©") &&
            it.split(" ").size > 15
        }
        
        return candidates.firstOrNull()?.take(500) ?: ""
    }

    private fun extractGenres(text: String): List<String> {
        val genreKeywords = mapOf(
            "fiction" to listOf("fiction", "novel", "story"),
            "mystery" to listOf("mystery", "detective", "crime", "thriller"),
            "romance" to listOf("romance", "love", "romantic"),
            "fantasy" to listOf("fantasy", "magic", "wizard", "dragon"),
            "science fiction" to listOf("science fiction", "sci-fi", "space", "future"),
            "biography" to listOf("biography", "memoir", "life story"),
            "history" to listOf("history", "historical", "ancient", "war"),
            "philosophy" to listOf("philosophy", "philosophical", "ethics"),
            "religion" to listOf("religion", "religious", "spiritual", "faith"),
            "science" to listOf("science", "scientific", "research", "study")
        )
        
        val detectedGenres = mutableListOf<String>()
        val lowerText = text.lowercase()
        
        for ((genre, keywords) in genreKeywords) {
            if (keywords.any { lowerText.contains(it) }) {
                detectedGenres.add(genre)
            }
        }
        
        return detectedGenres.take(3) // Limit to top 3 genres
    }

    private fun extractSeries(text: String): Pair<String, Int?> {
        val seriesPatterns = listOf(
            Pattern.compile("([A-Z][a-zA-Z\\s]+) (?:Book|Volume|Vol\\.?) (\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("([A-Z][a-zA-Z\\s]+) #(\\d+)", Pattern.CASE_INSENSITIVE),
            Pattern.compile("([A-Z][a-zA-Z\\s]+) Series", Pattern.CASE_INSENSITIVE)
        )
        
        for (pattern in seriesPatterns) {
            val matcher = pattern.matcher(text)
            if (matcher.find()) {
                val seriesName = matcher.group(1).trim()
                val seriesNumber = if (matcher.groupCount() > 1) {
                    matcher.group(2)?.toIntOrNull()
                } else null
                
                return Pair(seriesName, seriesNumber)
            }
        }
        
        return Pair("", null)
    }

    private fun estimatePageCount(text: String): Int? {
        // Look for explicit page count mentions
        val pagePattern = Pattern.compile("(\\d+) pages?", Pattern.CASE_INSENSITIVE)
        val matcher = pagePattern.matcher(text)
        
        if (matcher.find()) {
            return matcher.group(1).toIntOrNull()
        }
        
        // Estimate based on text length (rough approximation)
        val wordCount = text.split("\\s+".toRegex()).size
        return if (wordCount > 1000) {
            (wordCount / 300) // Roughly 300 words per page
        } else null
    }

    private fun assessReadingLevel(text: String): String {
        val sentences = text.split(Regex("[.!?]+")).filter { it.trim().isNotEmpty() }
        val words = text.split("\\s+".toRegex()).filter { it.isNotEmpty() }
        
        if (sentences.isEmpty() || words.isEmpty()) return "Unknown"
        
        val avgWordsPerSentence = words.size.toDouble() / sentences.size
        val avgSyllablesPerWord = words.map { countSyllables(it) }.average()
        
        // Simplified Flesch-Kincaid grade level
        val gradeLevel = 0.39 * avgWordsPerSentence + 11.8 * avgSyllablesPerWord - 15.59
        
        return when {
            gradeLevel < 6 -> "Elementary"
            gradeLevel < 9 -> "Middle School"
            gradeLevel < 13 -> "High School"
            gradeLevel < 16 -> "College"
            else -> "Advanced"
        }
    }

    private fun countSyllables(word: String): Int {
        val vowels = "aeiouyAEIOUY"
        var count = 0
        var prevWasVowel = false
        
        for (char in word) {
            val isVowel = char in vowels
            if (isVowel && !prevWasVowel) {
                count++
            }
            prevWasVowel = isVowel
        }
        
        // Handle silent 'e'
        if (word.endsWith("e", ignoreCase = true) && count > 1) {
            count--
        }
        
        return maxOf(1, count)
    }

    private fun extractTitleFromFilename(filename: String): Pair<String, Int?> {
        val nameWithoutExt = filename.substringBeforeLast('.')
        
        // Remove common video/audio indicators
        val cleaned = nameWithoutExt
            .replace(Regex("\\[(\\d{4})\\]"), " $1 ")
            .replace(Regex("\\b(720p|1080p|4K|HD|BluRay|DVD|WEB-DL|x264|x265)\\b", RegexOption.IGNORE_CASE), "")
            .replace(Regex("\\s+"), " ")
            .trim()
        
        // Extract year
        val yearPattern = Pattern.compile("\\b(19|20)\\d{2}\\b")
        val yearMatcher = yearPattern.matcher(cleaned)
        val year = if (yearMatcher.find()) yearMatcher.group().toIntOrNull() else null
        
        // Clean title
        val title = cleaned
            .replace(Regex("\\b(19|20)\\d{2}\\b"), "")
            .replace(Regex("[._-]"), " ")
            .replace(Regex("\\s+"), " ")
            .trim()
        
        return Pair(title, year)
    }

    private fun parseComicFilename(filename: String): Tuple4<String, String, String, String> {
        val nameWithoutExt = filename.substringBeforeLast('.')
        
        // Pattern for: SeriesName #001 (2023) or SeriesName v01 #001
        val comicPattern = Pattern.compile("^(.+?)\\s*(?:#(\\d+)|v(\\d+)|\\((\\d{4})\\))", Pattern.CASE_INSENSITIVE)
        val matcher = comicPattern.matcher(nameWithoutExt)
        
        return if (matcher.find()) {
            val series = matcher.group(1).trim()
            val issue = matcher.group(2) ?: ""
            val volume = matcher.group(3) ?: ""
            val year = matcher.group(4) ?: ""
            
            Tuple4(nameWithoutExt, series, issue, volume)
        } else {
            Tuple4(nameWithoutExt, "", "", "")
        }
    }

    private fun isValidTitle(title: String): Boolean {
        return title.length in 5..200 && 
               !title.matches(Regex("^[0-9]+$")) &&
               title.split(" ").size >= 2
    }

    private fun isValidAuthor(author: String): Boolean {
        return author.length in 5..100 && 
               author.matches(Regex("^[A-Z][a-zA-Z\\s.,-]+$")) &&
               author.split(" ").size >= 2
    }

    private fun isValidISBN(isbn: String): Boolean {
        return isbn.length in 10..13 && 
               isbn.matches(Regex("^[0-9X]+$"))
    }
}

data class Tuple4<A, B, C, D>(val first: A, val second: B, val third: C, val fourth: D)