package com.universalmedialibrary.ui.podcast

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.theme.MetallicTopAppBar

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PodcastDetailScreen(
    navController: NavController,
    viewModel: PodcastDetailViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    
    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = {
                    Text(
                        uiState.podcast?.title ?: "Podcast Details",
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.refreshPodcast() }) {
                        Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                    }
                }
            )
        }
    ) { paddingValues ->
        Box(modifier = Modifier.padding(paddingValues)) {
            if (uiState.isLoading) {
                LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
            }
            
            if (uiState.podcast == null && !uiState.isLoading) {
                 Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                    Text("Podcast not found")
                 }
            } else {
                LazyColumn(
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    // Podcast Header
                    item {
                        uiState.podcast?.let { podcast ->
                            Row(verticalAlignment = Alignment.Top) {
                                AsyncImage(
                                    model = podcast.imageUrl,
                                    contentDescription = null,
                                    modifier = Modifier
                                        .size(100.dp)
                                        .clip(MaterialTheme.shapes.medium)
                                        .background(MaterialTheme.colorScheme.surfaceVariant),
                                    contentScale = ContentScale.Crop
                                )
                                Spacer(modifier = Modifier.width(16.dp))
                                Column {
                                    Text(
                                        podcast.title,
                                        style = MaterialTheme.typography.titleLarge,
                                        fontWeight = FontWeight.Bold
                                    )
                                    Text(
                                        podcast.author ?: "Unknown Author",
                                        style = MaterialTheme.typography.bodyMedium,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                            Spacer(modifier = Modifier.height(16.dp))
                            Text(
                                podcast.description ?: "",
                                style = MaterialTheme.typography.bodyMedium
                            )
                        }
                    }
                    
                    // Episodes
                    items(uiState.episodes) { episode ->
                        EpisodeCard(
                            episode = episode,
                            onClick = { navController.navigate("podcast_player/${episode.id}") },
                            onDownloadClick = { /* TODO: Implement download in detail view */ },
                            onPlayClick = { navController.navigate("podcast_player/${episode.id}") }
                        )
                    }
                }
            }
        }
    }
}
