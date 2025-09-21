package com.universalmedialibrary.ui.podcast

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.services.podcast.Podcast
import com.universalmedialibrary.services.podcast.PodcastEpisode
import com.universalmedialibrary.services.podcast.PodcastSearchResult
import com.universalmedialibrary.ui.theme.PlexTheme
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat
import java.util.*

/**
 * A screen for managing podcast subscriptions, episodes, and downloads.
 *
 * @param navController The NavController for navigating to other screens.
 * @param viewModel The view model for this screen.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PodcastManagerScreen(
    navController: NavController,
    viewModel: PodcastViewModel = hiltViewModel()
) {
    PlexTheme {
        val uiState by viewModel.uiState.collectAsState()
        var showSearchDialog by remember { mutableStateOf(false) }
        var showAddFeedDialog by remember { mutableStateOf(false) }
        var selectedTab by remember { mutableIntStateOf(0) }

        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Text(
                            "Podcast Manager",
                            fontWeight = FontWeight.Medium
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = { navController.navigateUp() }) {
                            Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                        }
                    },
                    actions = {
                        IconButton(onClick = { showSearchDialog = true }) {
                            Icon(Icons.Default.Search, contentDescription = "Search Podcasts")
                        }
                        IconButton(onClick = { viewModel.refreshAllPodcasts() }) {
                            Icon(Icons.Default.Refresh, contentDescription = "Refresh All")
                        }
                        IconButton(onClick = { /* Import OPML */ }) {
                            Icon(Icons.Default.FileUpload, contentDescription = "Import OPML")
                        }
                    }
                )
            },
            floatingActionButton = {
                FloatingActionButton(
                    onClick = { showAddFeedDialog = true },
                    containerColor = MaterialTheme.colorScheme.primary
                ) {
                    Icon(Icons.Default.Add, contentDescription = "Add Podcast")
                }
            }
        ) { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
            ) {
                // Tab row
                TabRow(selectedTabIndex = selectedTab) {
                    Tab(
                        selected = selectedTab == 0,
                        onClick = { selectedTab = 0 },
                        text = { Text("Subscriptions") }
                    )
                    Tab(
                        selected = selectedTab == 1,
                        onClick = { selectedTab = 1 },
                        text = { Text("Episodes") }
                    )
                    Tab(
                        selected = selectedTab == 2,
                        onClick = { selectedTab = 2 },
                        text = { Text("Downloads") }
                    )
                }

                // Status bar
                if (uiState.isLoading) {
                    LinearProgressIndicator(
                        modifier = Modifier.fillMaxWidth(),
                        color = MaterialTheme.colorScheme.primary
                    )
                }

                // Error message
                uiState.error?.let { error ->
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.errorContainer
                        )
                    ) {
                        Row(
                            modifier = Modifier.padding(16.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Default.Error,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.error
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Text(
                                text = error,
                                color = MaterialTheme.colorScheme.onErrorContainer,
                                modifier = Modifier.weight(1f)
                            )
                            IconButton(onClick = { viewModel.clearError() }) {
                                Icon(Icons.Default.Close, contentDescription = "Dismiss")
                            }
                        }
                    }
                }

                // Content
                when (selectedTab) {
                    0 -> PodcastSubscriptionsTab(
                        podcasts = uiState.podcasts,
                        onPodcastClick = { podcast ->
                            navController.navigate("podcast_detail/${podcast.id}")
                        },
                        onUnsubscribe = { podcast ->
                            viewModel.unsubscribeFromPodcast(podcast)
                        }
                    )
                    1 -> PodcastEpisodesTab(
                        episodes = uiState.allEpisodes,
                        onEpisodeClick = { episode ->
                            navController.navigate("podcast_player/${episode.id}")
                        },
                        onDownloadClick = { episode ->
                            viewModel.downloadEpisode(episode)
                        },
                        onPlayClick = { episode ->
                            navController.navigate("podcast_player/${episode.id}")
                        }
                    )
                    2 -> PodcastDownloadsTab(
                        downloads = uiState.downloadedEpisodes,
                        onEpisodeClick = { episode ->
                            navController.navigate("podcast_player/${episode.id}")
                        },
                        onDeleteClick = { episode ->
                            viewModel.deleteDownloadedEpisode(episode)
                        }
                    )
                }
            }
        }

        // Search dialog
        if (showSearchDialog) {
            PodcastSearchDialog(
                searchResults = uiState.searchResults,
                isSearching = uiState.isSearching,
                onDismiss = { showSearchDialog = false },
                onSearch = { query ->
                    viewModel.searchPodcasts(query)
                },
                onSubscribe = { podcast ->
                    viewModel.subscribeFromSearchResult(podcast)
                    showSearchDialog = false
                }
            )
        }

        // Add feed dialog
        if (showAddFeedDialog) {
            AddPodcastFeedDialog(
                onDismiss = { showAddFeedDialog = false },
                onAdd = { feedUrl ->
                    viewModel.addPodcastByFeedUrl(feedUrl)
                    showAddFeedDialog = false
                }
            )
        }
    }
}

/**
 * A tab for displaying podcast subscriptions.
 *
 * @param podcasts The list of subscribed podcasts.
 * @param onPodcastClick A callback for when a podcast is clicked.
 * @param onUnsubscribe A callback for when the user unsubscribes from a podcast.
 */
@Composable
fun PodcastSubscriptionsTab(
    podcasts: List<Podcast>,
    onPodcastClick: (Podcast) -> Unit,
    onUnsubscribe: (Podcast) -> Unit
) {
    if (podcasts.isEmpty()) {
        // Empty state
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(32.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                Icons.Default.Podcasts,
                contentDescription = null,
                modifier = Modifier.size(80.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "No Podcast Subscriptions",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Medium
            )
            Text(
                text = "Search for podcasts or add RSS feeds to get started",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.padding(top = 8.dp)
            )
        }
    } else {
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(podcasts) { podcast ->
                PodcastCard(
                    podcast = podcast,
                    onClick = { onPodcastClick(podcast) },
                    onUnsubscribe = { onUnsubscribe(podcast) }
                )
            }
        }
    }
}

/**
 * A tab for displaying all podcast episodes.
 *
 * @param episodes The list of all episodes.
 * @param onEpisodeClick A callback for when an episode is clicked.
 * @param onDownloadClick A callback for when the download button is clicked.
 * @param onPlayClick A callback for when the play button is clicked.
 */
@Composable
fun PodcastEpisodesTab(
    episodes: List<PodcastEpisode>,
    onEpisodeClick: (PodcastEpisode) -> Unit,
    onDownloadClick: (PodcastEpisode) -> Unit,
    onPlayClick: (PodcastEpisode) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(episodes) { episode ->
            EpisodeCard(
                episode = episode,
                onClick = { onEpisodeClick(episode) },
                onDownloadClick = { onDownloadClick(episode) },
                onPlayClick = { onPlayClick(episode) }
            )
        }
    }
}

/**
 * A tab for displaying downloaded podcast episodes.
 *
 * @param downloads The list of downloaded episodes.
 * @param onEpisodeClick A callback for when an episode is clicked.
 * @param onDeleteClick A callback for when the delete button is clicked.
 */
@Composable
fun PodcastDownloadsTab(
    downloads: List<PodcastEpisode>,
    onEpisodeClick: (PodcastEpisode) -> Unit,
    onDeleteClick: (PodcastEpisode) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(downloads) { episode ->
            DownloadedEpisodeCard(
                episode = episode,
                onClick = { onEpisodeClick(episode) },
                onDeleteClick = { onDeleteClick(episode) }
            )
        }
    }
}

/**
 * A card for displaying a podcast subscription.
 *
 * @param podcast The podcast to display.
 * @param onClick A callback for when the card is clicked.
 * @param onUnsubscribe A callback for when the user unsubscribes from the podcast.
 */
@Composable
fun PodcastCard(
    podcast: Podcast,
    onClick: () -> Unit,
    onUnsubscribe: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Podcast artwork
            AsyncImage(
                model = podcast.imageUrl ?: "https://via.placeholder.com/80x80/7B1FA2/ffffff?text=🎙️",
                contentDescription = "Podcast Artwork",
                modifier = Modifier
                    .size(80.dp)
                    .clip(MaterialTheme.shapes.medium)
                    .background(MaterialTheme.colorScheme.surfaceVariant),
                contentScale = ContentScale.Crop
            )

            Spacer(modifier = Modifier.width(16.dp))

            // Podcast info
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = podcast.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                Spacer(modifier = Modifier.height(4.dp))

                Text(
                    text = podcast.author,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Spacer(modifier = Modifier.height(4.dp))

                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "${podcast.totalEpisodes} episodes",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    if (podcast.explicit) {
                        Spacer(modifier = Modifier.width(8.dp))
                        Surface(
                            color = MaterialTheme.colorScheme.error,
                            shape = MaterialTheme.shapes.small
                        ) {
                            Text(
                                text = "E",
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.onError,
                                modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp)
                            )
                        }
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                Text(
                    text = podcast.description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
            }

            // Actions
            Column {
                IconButton(onClick = onUnsubscribe) {
                    Icon(
                        Icons.Default.Unsubscribe,
                        contentDescription = "Unsubscribe",
                        tint = MaterialTheme.colorScheme.error
                    )
                }
            }
        }
    }
}

/**
 * A card for displaying a podcast episode.
 *
 * @param episode The episode to display.
 * @param onClick A callback for when the card is clicked.
 * @param onDownloadClick A callback for when the download button is clicked.
 * @param onPlayClick A callback for when the play button is clicked.
 */
@Composable
fun EpisodeCard(
    episode: PodcastEpisode,
    onClick: () -> Unit,
    onDownloadClick: () -> Unit,
    onPlayClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Play button
            Surface(
                modifier = Modifier.size(48.dp),
                shape = CircleShape,
                color = MaterialTheme.colorScheme.primary
            ) {
                IconButton(onClick = onPlayClick) {
                    Icon(
                        Icons.Default.PlayArrow,
                        contentDescription = "Play",
                        tint = Color.Black
                    )
                }
            }

            Spacer(modifier = Modifier.width(12.dp))

            // Episode info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = episode.title,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                Spacer(modifier = Modifier.height(4.dp))

                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = formatDuration(episode.duration),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    Spacer(modifier = Modifier.width(8.dp))

                    Text(
                        text = SimpleDateFormat("MMM dd", Locale.getDefault()).format(episode.publishDate),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    if (episode.isDownloaded) {
                        Spacer(modifier = Modifier.width(8.dp))
                        Icon(
                            Icons.Default.DownloadDone,
                            contentDescription = "Downloaded",
                            modifier = Modifier.size(16.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            }

            // Download button
            if (!episode.isDownloaded) {
                IconButton(onClick = onDownloadClick) {
                    Icon(
                        Icons.Default.Download,
                        contentDescription = "Download"
                    )
                }
            }
        }
    }
}

/**
 * A card for displaying a downloaded podcast episode.
 *
 * @param episode The episode to display.
 * @param onClick A callback for when the card is clicked.
 * @param onDeleteClick A callback for when the delete button is clicked.
 */
@Composable
fun DownloadedEpisodeCard(
    episode: PodcastEpisode,
    onClick: () -> Unit,
    onDeleteClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                Icons.Default.DownloadDone,
                contentDescription = "Downloaded",
                modifier = Modifier.size(24.dp),
                tint = MaterialTheme.colorScheme.primary
            )

            Spacer(modifier = Modifier.width(12.dp))

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = episode.title,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                Text(
                    text = formatDuration(episode.duration),
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            IconButton(onClick = onDeleteClick) {
                Icon(
                    Icons.Default.Delete,
                    contentDescription = "Delete",
                    tint = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

/**
 * A dialog for searching for podcasts.
 *
 * @param searchResults The list of search results.
 * @param isSearching Whether a search is currently in progress.
 * @param onDismiss A callback for when the dialog is dismissed.
 * @param onSearch A callback for when the user performs a search.
 * @param onSubscribe A callback for when the user subscribes to a podcast.
 */
@Composable
fun PodcastSearchDialog(
    searchResults: List<PodcastSearchResult>,
    isSearching: Boolean,
    onDismiss: () -> Unit,
    onSearch: (String) -> Unit,
    onSubscribe: (PodcastSearchResult) -> Unit
) {
    var query by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Search Podcasts") },
        text = {
            Column {
                OutlinedTextField(
                    value = query,
                    onValueChange = { query = it },
                    label = { Text("Search") },
                    placeholder = { Text("Enter podcast name or topic...") },
                    modifier = Modifier.fillMaxWidth(),
                    trailingIcon = {
                        IconButton(onClick = { onSearch(query) }) {
                            if (isSearching) {
                                CircularProgressIndicator(modifier = Modifier.size(20.dp))
                            } else {
                                Icon(Icons.Default.Search, contentDescription = "Search")
                            }
                        }
                    }
                )

                Spacer(modifier = Modifier.height(16.dp))

                LazyColumn(
                    modifier = Modifier.height(300.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(searchResults) { result ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clickable { onSubscribe(result) }
                        ) {
                            Row(
                                modifier = Modifier.padding(12.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                AsyncImage(
                                    model = result.imageUrl,
                                    contentDescription = null,
                                    modifier = Modifier
                                        .size(40.dp)
                                        .clip(MaterialTheme.shapes.small),
                                    contentScale = ContentScale.Crop
                                )

                                Spacer(modifier = Modifier.width(12.dp))

                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = result.title,
                                        style = MaterialTheme.typography.titleSmall,
                                        maxLines = 1,
                                        overflow = TextOverflow.Ellipsis
                                    )
                                    Text(
                                        text = result.author,
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}

/**
 * A dialog for adding a podcast by its RSS feed URL.
 *
 * @param onDismiss A callback for when the dialog is dismissed.
 * @param onAdd A callback for when the user adds a feed.
 */
@Composable
fun AddPodcastFeedDialog(
    onDismiss: () -> Unit,
    onAdd: (String) -> Unit
) {
    var feedUrl by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Podcast Feed") },
        text = {
            OutlinedTextField(
                value = feedUrl,
                onValueChange = { feedUrl = it },
                label = { Text("RSS Feed URL") },
                placeholder = { Text("https://example.com/podcast/feed.xml") },
                modifier = Modifier.fillMaxWidth()
            )
        },
        confirmButton = {
            Button(
                onClick = { onAdd(feedUrl) },
                enabled = feedUrl.isNotBlank()
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

/**
 * Formats a duration in seconds into a string in the format "HH:MM:SS" or "MM:SS".
 *
 * @param seconds The duration in seconds.
 * @return The formatted duration string.
 */
private fun formatDuration(seconds: Long): String {
    val hours = seconds / 3600
    val minutes = (seconds % 3600) / 60
    val secs = seconds % 60

    return if (hours > 0) {
        String.format("%d:%02d:%02d", hours, minutes, secs)
    } else {
        String.format("%d:%02d", minutes, secs)
    }
}