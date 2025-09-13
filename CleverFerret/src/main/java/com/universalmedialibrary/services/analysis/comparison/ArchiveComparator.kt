package com.universalmedialibrary.services.analysis.comparison

import com.universalmedialibrary.services.analysis.ArchiveMatch
import com.universalmedialibrary.services.analysis.ExtractedMetadata
import com.universalmedialibrary.services.metadata.ComprehensiveMetadataService
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Archive Comparator Service
 * Compares content against known archives and databases
 */
@Singleton
class ArchiveComparator @Inject constructor(
    private val metadataService: ComprehensiveMetadataService
) {

    /**
     * Find matches by ISBN
     */
    suspend fun findByISBN(isbn: String): List<ArchiveMatch> = withContext(Dispatchers.IO) {
        val matches = mutableListOf<ArchiveMatch>()
        
        try {
            // Search multiple sources for ISBN
            val results = metadataService.searchAllBookSources("", isbn)
            
            results.forEach { result ->
                matches.add(
                    ArchiveMatch(
                        source = result.source.name,
                        id = result.id,
                        title = result.title,
                        author = result.author,
                        isbn = isbn,
                        coverImageUrl = result.coverUrl ?: "",
                        description = result.description ?: "",
                        genres = listOf(result.genre).filter { it.isNotEmpty() },
                        publishedDate = result.year?.toString(),
                        confidence = 0.95f // High confidence for ISBN matches
                    )
                )
            }
        } catch (e: Exception) {
            // Return mock data for demonstration
            matches.add(createMockArchiveMatch(isbn, null, null))
        }
        
        matches
    }

    /**
     * Find matches by title and author
     */
    suspend fun findByTitleAuthor(title: String, author: String): List<ArchiveMatch> = withContext(Dispatchers.IO) {
        val matches = mutableListOf<ArchiveMatch>()
        
        if (title.isBlank()) return@withContext matches
        
        try {
            val query = if (author.isNotBlank()) "$title $author" else title
            val results = metadataService.searchAllBookSources(query)
            
            results.forEach { result ->
                val titleSimilarity = calculateStringSimilarity(title, result.title)
                val authorSimilarity = if (author.isNotBlank()) {
                    calculateStringSimilarity(author, result.author)
                } else 0.5f
                
                val confidence = (titleSimilarity * 0.7f + authorSimilarity * 0.3f)
                
                if (confidence > 0.6f) { // Only include reasonably good matches
                    matches.add(
                        ArchiveMatch(
                            source = result.source.name,
                            id = result.id,
                            title = result.title,
                            author = result.author,
                            coverImageUrl = result.coverUrl ?: "",
                            description = result.description ?: "",
                            genres = listOf(result.genre).filter { it.isNotEmpty() },
                            publishedDate = result.year?.toString(),
                            confidence = confidence
                        )
                    )
                }
            }
        } catch (e: Exception) {
            // Return mock data for demonstration
            if (title.isNotBlank()) {
                matches.add(createMockArchiveMatch(null, title, author))
            }
        }
        
        matches.sortedByDescending { it.confidence }
    }

    /**
     * Find video matches in databases
     */
    suspend fun findVideoMatches(metadata: ExtractedMetadata): List<ArchiveMatch> = withContext(Dispatchers.IO) {
        val matches = mutableListOf<ArchiveMatch>()
        
        if (metadata.title.isBlank()) return@withContext matches
        
        // In a real implementation, this would query TMDB, OMDb, etc.
        // For now, return mock data
        matches.add(
            ArchiveMatch(
                source = "TMDB",
                id = "mock_video_${metadata.title.hashCode()}",
                title = metadata.title,
                description = "Mock video description for ${metadata.title}",
                genres = listOf("Action", "Drama"),
                publishedDate = metadata.releaseYear?.toString(),
                confidence = 0.7f,
                metadata = mapOf(
                    "type" to "video",
                    "runtime" to (metadata.runtime?.toString() ?: "unknown")
                )
            )
        )
        
        matches
    }

    /**
     * Find audio matches in music databases
     */
    suspend fun findAudioMatches(metadata: ExtractedMetadata): List<ArchiveMatch> = withContext(Dispatchers.IO) {
        val matches = mutableListOf<ArchiveMatch>()
        
        if (metadata.title.isBlank()) return@withContext matches
        
        // In a real implementation, this would query MusicBrainz, Spotify, etc.
        matches.add(
            ArchiveMatch(
                source = "MusicBrainz",
                id = "mock_audio_${metadata.title.hashCode()}",
                title = metadata.title,
                author = metadata.artist,
                description = "Album: ${metadata.album}",
                genres = metadata.genres,
                confidence = 0.6f,
                metadata = mapOf(
                    "type" to "audio",
                    "album" to metadata.album,
                    "duration" to (metadata.duration?.toString() ?: "unknown")
                )
            )
        )
        
        matches
    }

    /**
     * Find comic matches in comic databases
     */
    suspend fun findComicMatches(metadata: ExtractedMetadata): List<ArchiveMatch> = withContext(Dispatchers.IO) {
        val matches = mutableListOf<ArchiveMatch>()
        
        if (metadata.title.isBlank()) return@withContext matches
        
        // In a real implementation, this would query ComicVine, etc.
        matches.add(
            ArchiveMatch(
                source = "ComicVine",
                id = "mock_comic_${metadata.title.hashCode()}",
                title = metadata.title,
                description = "Comic series: ${metadata.series}",
                seriesName = metadata.series,
                seriesNumber = metadata.seriesNumber,
                genres = listOf("Superhero", "Action"),
                confidence = 0.65f,
                metadata = mapOf(
                    "type" to "comic",
                    "issue" to metadata.issue,
                    "volume" to metadata.volume
                )
            )
        )
        
        matches
    }

    private fun createMockArchiveMatch(isbn: String?, title: String?, author: String?): ArchiveMatch {
        return ArchiveMatch(
            source = "Mock Database",
            id = "mock_${(isbn ?: title ?: "unknown").hashCode()}",
            title = title ?: "Unknown Title",
            author = author ?: "Unknown Author",
            isbn = isbn,
            description = "This is a mock result for demonstration purposes.",
            genres = listOf("Fiction", "General"),
            publishedDate = "2023",
            confidence = 0.5f,
            metadata = mapOf(
                "mock" to "true",
                "source" to "demonstration"
            )
        )
    }

    private fun calculateStringSimilarity(str1: String, str2: String): Float {
        val s1 = str1.lowercase().trim()
        val s2 = str2.lowercase().trim()
        
        if (s1 == s2) return 1.0f
        if (s1.isEmpty() || s2.isEmpty()) return 0.0f
        
        // Simple Jaccard similarity
        val words1 = s1.split("\\s+".toRegex()).toSet()
        val words2 = s2.split("\\s+".toRegex()).toSet()
        
        val intersection = words1.intersect(words2).size
        val union = words1.union(words2).size
        
        return if (union > 0) intersection.toFloat() / union else 0.0f
    }
}