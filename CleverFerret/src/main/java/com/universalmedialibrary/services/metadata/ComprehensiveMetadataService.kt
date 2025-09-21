package com.universalmedialibrary.services.metadata

import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class ComprehensiveMetadataService @Inject constructor(
    private val metadataApiService: MetadataApiService
) {
    
    suspend fun enhanceBookMetadata(title: String, author: String? = null): EnhancedBookMetadata? {
        val query = if (author != null) "$title $author" else title
        val results = metadataApiService.searchBooks(query)
        
        return results.firstOrNull()?.let { book ->
            EnhancedBookMetadata(
                title = book.title,
                author = book.author,
                isbn = book.isbn,
                description = book.description,
                confidence = 0.85f,
                sources = listOf("google_books")
            )
        }
    }
    
    suspend fun enhanceMovieMetadata(title: String, year: Int? = null): EnhancedMovieMetadata? {
        val query = if (year != null) "$title $year" else title
        val results = metadataApiService.searchMovies(query)
        
        return results.firstOrNull()?.let { movie ->
            EnhancedMovieMetadata(
                title = movie.title,
                year = movie.year,
                director = movie.director,
                description = movie.description,
                confidence = 0.90f,
                sources = listOf("tmdb")
            )
        }
    }
    
    suspend fun enhanceMusicMetadata(title: String, artist: String? = null): EnhancedMusicMetadata? {
        val query = if (artist != null) "$title $artist" else title
        val results = metadataApiService.searchMusic(query)
        
        return results.firstOrNull()?.let { music ->
            EnhancedMusicMetadata(
                title = music.title,
                artist = music.artist,
                year = music.year,
                genre = music.genre,
                confidence = 0.75f,
                sources = listOf("lastfm")
            )
        }
    }
}

data class EnhancedBookMetadata(
    val title: String,
    val author: String,
    val isbn: String,
    val description: String,
    val confidence: Float,
    val sources: List<String>
)

data class EnhancedMovieMetadata(
    val title: String,
    val year: Int,
    val director: String,
    val description: String,
    val confidence: Float,
    val sources: List<String>
)

data class EnhancedMusicMetadata(
    val title: String,
    val artist: String,
    val year: Int,
    val genre: String,
    val confidence: Float,
    val sources: List<String>
)