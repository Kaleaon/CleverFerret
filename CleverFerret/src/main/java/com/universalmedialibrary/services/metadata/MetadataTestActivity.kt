package com.universalmedialibrary.services.metadata

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.lifecycle.lifecycleScope
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Test activity for metadata fetching
 */
@AndroidEntryPoint
class MetadataTestActivity : ComponentActivity() {
    
    @Inject
    lateinit var apiKeyRepository: APIKeyRepository
    
    private lateinit var realMetadataService: RealMetadataService
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        realMetadataService = RealMetadataService(apiKeyRepository)
        
        setContent {
            MetadataTestScreen(
                onTestBooks = { query ->
                    testBookMetadata(query)
                },
                onTestMovies = { query ->
                    testMovieMetadata(query)
                },
                onTestMusic = { query ->
                    testMusicMetadata(query)
                }
            )
        }
    }
    
    private fun testBookMetadata(query: String) {
        lifecycleScope.launch {
            try {
                val result = realMetadataService.searchBookMetadata(query = query)
                println("Book Metadata Results:")
                println("Sources: ${result.sources.joinToString()}")
                result.metadata?.let { book ->
                    println("Title: ${book.title}")
                    println("Authors: ${book.authors.joinToString()}")
                    println("Publisher: ${book.publisher}")
                    println("ISBN-13: ${book.isbn13}")
                    println("Description: ${book.description?.take(200)}")
                    println("Cover URL: ${book.coverUrl}")
                    println("Categories: ${book.categories.joinToString()}")
                    println("Rating: ${book.averageRating}")
                }
            } catch (e: Exception) {
                println("Error fetching book metadata: ${e.message}")
                e.printStackTrace()
            }
        }
    }
    
    private fun testMovieMetadata(query: String) {
        lifecycleScope.launch {
            try {
                val result = realMetadataService.searchMovieMetadata(title = query)
                println("Movie Metadata Results:")
                println("Sources: ${result.sources.joinToString()}")
                result.metadata?.let { movie ->
                    println("Title: ${movie.title}")
                    println("Year: ${movie.year}")
                    println("Overview: ${movie.overview?.take(200)}")
                    println("Poster URL: ${movie.posterUrl}")
                    println("Rating: ${movie.voteAverage}")
                    println("Director: ${movie.director}")
                    println("Actors: ${movie.actors}")
                }
            } catch (e: Exception) {
                println("Error fetching movie metadata: ${e.message}")
                e.printStackTrace()
            }
        }
    }
    
    private fun testMusicMetadata(query: String) {
        lifecycleScope.launch {
            try {
                val result = realMetadataService.searchMusicMetadata(query = query)
                println("Music Metadata Results:")
                println("Sources: ${result.sources.joinToString()}")
                result.metadata?.let { music ->
                    println("Title: ${music.title}")
                    println("Artist: ${music.artist}")
                    println("Album: ${music.album}")
                    println("Release Date: ${music.releaseDate}")
                    println("MusicBrainz ID: ${music.mbid}")
                }
            } catch (e: Exception) {
                println("Error fetching music metadata: ${e.message}")
                e.printStackTrace()
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MetadataTestScreen(
    onTestBooks: (String) -> Unit,
    onTestMovies: (String) -> Unit,
    onTestMusic: (String) -> Unit
) {
    var query by remember { mutableStateOf("") }
    var results by remember { mutableStateOf(listOf<String>()) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Metadata Test") }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            OutlinedTextField(
                value = query,
                onValueChange = { query = it },
                label = { Text("Search Query") },
                modifier = Modifier.fillMaxWidth()
            )
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = { onTestBooks(query) },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Test Books")
                }
                
                Button(
                    onClick = { onTestMovies(query) },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Test Movies")
                }
                
                Button(
                    onClick = { onTestMusic(query) },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Test Music")
                }
            }
            
            Text(
                text = "Test Examples:",
                style = MaterialTheme.typography.titleMedium
            )
            
            Card(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text("Books: 'Harry Potter', 'The Hobbit', 'Dune'")
                    Text("Movies: 'Inception', 'Avatar', 'The Matrix'")
                    Text("Music: 'The Beatles', 'Pink Floyd', 'Radiohead'")
                }
            }
            
            if (results.isNotEmpty()) {
                LazyColumn {
                    items(results) { result ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 4.dp)
                        ) {
                            Text(
                                text = result,
                                modifier = Modifier.padding(16.dp),
                                maxLines = 3,
                                overflow = TextOverflow.Ellipsis
                            )
                        }
                    }
                }
            }
        }
    }
}