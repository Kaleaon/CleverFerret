package com.universalmedialibrary.ui.podcast

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
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
import com.universalmedialibrary.services.podcast.DownloadStatus
import com.universalmedialibrary.ui.components.ConfirmationDialog
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.MetallicFAB
import com.universalmedialibrary.ui.theme.MetallicTopAppBar
import kotlinx.coroutines.flow.collectLatest
import java.text.SimpleDateFormat
import java.util.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PodcastManagerScreen(
    navController: NavController,
    viewModel: PodcastViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val downloadStatuses by viewModel.downloadProgress.collectAsState()
    val pendingPinChallenge by viewModel.pendingPinChallenge.collectAsState()
    var showSearchDialog by remember { mutableStateOf(false) }
    var showAddFeedDialog by remember { mutableStateOf(false) }
    var pendingDeleteEpisode by remember { mutableStateOf<PodcastEpisode?>(null) }
    var pendingUnsubscribePodcast by remember { mutableStateOf<Podcast?>(null) }
    var selectedTab by remember { mutableIntStateOf(0) }
    val snackbarHostState = remember { SnackbarHostState() }

    LaunchedEffect(viewModel) {
        viewModel.userMessages.collectLatest { message ->
            snackbarHostState.showSnackbar(message)
        }
    }

    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = {
                    Text(
                        "Podcast Manager",
                        fontWeight = FontWeight.Medium
                    )
                },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
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
            MetallicFAB(
                onClick = { showAddFeedDialog = true },
                icon = {
                    Icon(Icons.Default.Add, contentDescription = "Add Podcast")
                }
            )
        },
        snackbarHost = {
            SnackbarHost(hostState = snackbarHostState)
        },
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Tab row
            PrimaryTabRow(selectedTabIndex = selectedTab) {
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
                                contentDescription = "Media image",
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
                            pendingUnsubscribePodcast = podcast
                        }
                    )
                    1 -> PodcastEpisodesTab(
                        episodes = uiState.allEpisodes,
                        downloadStatuses = downloadStatuses,
                        onEpisodeClick = { episode ->
                            navController.navigate("podcast_player/${episode.id}")
                        },
                        onDownloadClick = { episode ->
                            viewModel.downloadEpisode(episode)
                        },
                        onRetryClick = { episode ->
                            if (episode.recoveryActionLabel != null) {
                                viewModel.recoverMissingDownload(episode)
                            } else {
                                viewModel.retryDownload(episode)
                            }
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
                            pendingDeleteEpisode = episode
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
                viewModel.subscribeFromSearchResult(podcast) { subscribed ->
                    if (subscribed) {
                        showSearchDialog = false
                    }
                }
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

    pendingPinChallenge?.let { challenge ->
        PinAccessDialog(
            challenge = challenge,
            onDismiss = { viewModel.dismissPinChallenge() },
            onAccessGranted = { viewModel.onPinUnlockGranted() },
            verifyPin = viewModel::verifyPin
        )
    }

    pendingDeleteEpisode?.let { episode ->
        ConfirmationDialog(
            title = "Remove downloaded episode?",
            message = "This will remove the local file and reset download metadata for \"${episode.title}\".",
            confirmLabel = "Delete",
            dismissLabel = "Cancel",
            warningTint = MaterialTheme.colorScheme.tertiary,
            onConfirm = {
                viewModel.deleteDownloadedEpisode(episode)
                pendingDeleteEpisode = null
            },
            onDismiss = { pendingDeleteEpisode = null }
        )
    }

    pendingUnsubscribePodcast?.let { podcast ->
        ConfirmationDialog(
            title = "Unsubscribe from podcast?",
            message = "This removes \"${podcast.title}\" from subscriptions.",
            confirmLabel = "Unsubscribe",
            dismissLabel = "Cancel",
            warningTint = MaterialTheme.colorScheme.tertiary,
            onConfirm = {
                viewModel.unsubscribeFromPodcast(podcast)
                pendingUnsubscribePodcast = null
            },
            onDismiss = { pendingUnsubscribePodcast = null }
        )
    }
}


@Composable
fun PodcastEpisodesTab(
    episodes: List<PodcastEpisode>,
    downloadStatuses: Map<Long, DownloadStatus>,
    onEpisodeClick: (PodcastEpisode) -> Unit,
    onDownloadClick: (PodcastEpisode) -> Unit,
    onRetryClick: (PodcastEpisode) -> Unit,
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
                downloadStatus = downloadStatuses[episode.id],
                onClick = { onEpisodeClick(episode) },
                onDownloadClick = { onDownloadClick(episode) },
                onRetryClick = { onRetryClick(episode) },
                onPlayClick = { onPlayClick(episode) }
            )
        }
    }
}

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

private fun formatDuration(seconds: Long): String {
    val hours = seconds / 3600
    val minutes = (seconds % 3600) / 60
    val secs = seconds % 60

    return if (hours > 0) {
        String.format(java.util.Locale.US, "%d:%02d:%02d", hours, minutes, secs)
    } else {
        String.format(java.util.Locale.US, "%d:%02d", minutes, secs)
    }
}

private fun formatTime(milliseconds: Long): String {
    val seconds = (milliseconds / 1000).toInt()
    val minutes = seconds / 60
    val remainingSeconds = seconds % 60

    return if (minutes >= 60) {
        val hours = minutes / 60
        val remainingMinutes = minutes % 60
        "%d:%02d:%02d".format(hours, remainingMinutes, remainingSeconds)
    } else {
        "%d:%02d".format(minutes, remainingSeconds)
    }
}
