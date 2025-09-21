package com.universalmedialibrary.services.metadata

import kotlinx.coroutines.delay
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MetadataApiService @Inject constructor() {
    
    suspend fun searchBooks(query: String): List<BookMetadata> {
        // Simulate API call
        delay(1000)
        return listOf(
            BookMetadata(
                title = "Sample Book Result",
                author = "Sample Author",
                isbn = "1234567890",
                description = "A sample book from search results"
            )
        )
    }
    
    suspend fun searchMovies(query: String): List<MovieMetadata> {
        // Simulate API call
        delay(1000)
        return listOf(
            MovieMetadata(
                title = "Sample Movie Result",
                year = 2024,
                director = "Sample Director",
                description = "A sample movie from search results"
            )
        )
    }
    
    suspend fun searchMusic(query: String): List<MusicMetadata> {
        // Simulate API call
        delay(1000)
        return listOf(
            MusicMetadata(
                title = "Sample Album Result",
                artist = "Sample Artist",
                year = 2024,
                genre = "Sample Genre"
            )
        )
    }
}

data class BookMetadata(
    val title: String,
    val author: String,
    val isbn: String,
    val description: String
)

data class MovieMetadata(
    val title: String,
    val year: Int,
    val director: String,
    val description: String
)

data class MusicMetadata(
    val title: String,
    val artist: String,
    val year: Int,
    val genre: String
)