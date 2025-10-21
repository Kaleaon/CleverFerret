package com.universalmedialibrary.ui.recommendations

import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.recommendations.Recommendation
import com.universalmedialibrary.services.recommendations.RecommendationsState
import coil.compose.AsyncImage

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RecommendationsScreen(
    navController: NavController,
    viewModel: RecommendationsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val recommendationsState by viewModel.recommendationsState.collectAsState()
    val options by viewModel.options.collectAsState()

    var showOptions by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Recommendations") },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.refreshRecommendations() }) {
                        Icon(Icons.Default.Refresh, "Refresh")
                    }
                    IconButton(onClick = { showOptions = true }) {
                        Icon(Icons.Default.Tune, "Options")
                    }
                }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            when {
                uiState.isLoading -> {
                    LoadingState()
                }
                uiState.error != null -> {
                    ErrorState(
                        error = uiState.error!!,
                        onRetry = { viewModel.refreshRecommendations() },
                        onDismiss = viewModel::clearError
                    )
                }
                uiState.recommendations.isEmpty() -> {
                    EmptyState(
                        onExplore = { /* Navigate to library */ }
                    )
                }
                else -> {
                    RecommendationsContent(
                        groupedRecommendations = uiState.groupedRecommendations,
                        onRecommendationClick = { recommendation ->
                            navController.navigate("detail/${recommendation.mediaItemId}")
                        },
                        onDismiss = viewModel::dismissRecommendation
                    )
                }
            }

            // Options Bottom Sheet
            if (showOptions) {
                RecommendationOptionsBottomSheet(
                    options = options,
                    onDismiss = { showOptions = false },
                    onOptionsChange = viewModel::updateOptions
                )
            }

            // AI Badge
            if (recommendationsState == RecommendationsState.GENERATING_AI) {
                Card(
                    modifier = Modifier
                        .align(Alignment.BottomCenter)
                        .padding(16.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(20.dp),
                            strokeWidth = 2.dp
                        )
                        Text(
                            "Generating AI recommendations...",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun LoadingState() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            CircularProgressIndicator()
            Spacer(modifier = Modifier.height(16.dp))
            Text("Finding recommendations...", style = MaterialTheme.typography.bodyMedium)
        }
    }
}

@Composable
private fun ErrorState(
    error: String,
    onRetry: () -> Unit,
    onDismiss: () -> Unit
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.Error,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                "Failed to Load",
                style = MaterialTheme.typography.titleLarge
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                error,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(24.dp))
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                OutlinedButton(onClick = onDismiss) {
                    Text("Dismiss")
                }
                Button(onClick = onRetry) {
                    Icon(Icons.Default.Refresh, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Retry")
                }
            }
        }
    }
}

@Composable
private fun EmptyState(onExplore: () -> Unit) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.AutoAwesome,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                "No Recommendations Yet",
                style = MaterialTheme.typography.titleLarge
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                "Start exploring your library to get personalized recommendations",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(24.dp))
            Button(onClick = onExplore) {
                Text("Explore Library")
            }
        }
    }
}

@Composable
private fun RecommendationsContent(
    groupedRecommendations: Map<String, List<Recommendation>>,
    onRecommendationClick: (Recommendation) -> Unit,
    onDismiss: (Recommendation) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(vertical = 16.dp)
    ) {
        groupedRecommendations.forEach { (source, recommendations) ->
            item {
                RecommendationSection(
                    title = formatSourceTitle(source),
                    subtitle = formatSourceSubtitle(source, recommendations.size),
                    recommendations = recommendations,
                    onRecommendationClick = onRecommendationClick,
                    onDismiss = onDismiss
                )
                Spacer(modifier = Modifier.height(24.dp))
            }
        }
    }
}

@Composable
private fun RecommendationSection(
    title: String,
    subtitle: String,
    recommendations: List<Recommendation>,
    onRecommendationClick: (Recommendation) -> Unit,
    onDismiss: (Recommendation) -> Unit
) {
    Column {
        // Section Header
        Column(modifier = Modifier.padding(horizontal = 16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    title,
                    style = MaterialTheme.typography.titleLarge
                )
                Icon(
                    getSourceIcon(title),
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
            }
            Text(
                subtitle,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }

        Spacer(modifier = Modifier.height(12.dp))

        // Recommendations Row
        LazyRow(
            contentPadding = PaddingValues(horizontal = 16.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(recommendations) { recommendation ->
                RecommendationCard(
                    recommendation = recommendation,
                    onClick = { onRecommendationClick(recommendation) },
                    onDismiss = { onDismiss(recommendation) }
                )
            }
        }
    }
}

@Composable
private fun RecommendationCard(
    recommendation: Recommendation,
    onClick: () -> Unit,
    onDismiss: () -> Unit
) {
    var showDismissDialog by remember { mutableStateOf(false) }

    Card(
        modifier = Modifier
            .width(160.dp)
            .clickable(onClick = onClick)
    ) {
        Box {
            Column(modifier = Modifier.padding(12.dp)) {
                // Thumbnail
                AsyncImage(
                    model = recommendation.thumbnailUrl,
                    contentDescription = null,
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(220.dp)
                        .clip(MaterialTheme.shapes.small)
                )

                Spacer(modifier = Modifier.height(8.dp))

                // Title
                Text(
                    recommendation.title,
                    style = MaterialTheme.typography.titleSmall,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                // Reason
                if (recommendation.reason.isNotBlank()) {
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        recommendation.reason,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                }

                // Confidence Badge
                if (recommendation.confidence > 0.7f) {
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            Icons.Default.Star,
                            contentDescription = null,
                            modifier = Modifier.size(16.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            "Top pick",
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            }

            // Dismiss Button
            IconButton(
                onClick = { showDismissDialog = true },
                modifier = Modifier
                    .align(Alignment.TopEnd)
                    .padding(4.dp)
            ) {
                Surface(
                    shape = MaterialTheme.shapes.small,
                    color = MaterialTheme.colorScheme.surface.copy(alpha = 0.8f)
                ) {
                    Icon(
                        Icons.Default.Close,
                        contentDescription = "Dismiss",
                        modifier = Modifier
                            .padding(4.dp)
                            .size(16.dp)
                    )
                }
            }
        }
    }

    if (showDismissDialog) {
        AlertDialog(
            onDismissRequest = { showDismissDialog = false },
            title = { Text("Hide recommendation?") },
            text = { Text("This will remove this recommendation from your feed.") },
            confirmButton = {
                TextButton(onClick = {
                    onDismiss()
                    showDismissDialog = false
                }) {
                    Text("Hide")
                }
            },
            dismissButton = {
                TextButton(onClick = { showDismissDialog = false }) {
                    Text("Cancel")
                }
            }
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun RecommendationOptionsBottomSheet(
    options: com.universalmedialibrary.services.recommendations.RecommendationOptions,
    onDismiss: () -> Unit,
    onOptionsChange: (com.universalmedialibrary.services.recommendations.RecommendationOptions) -> Unit
) {
    var tempOptions by remember { mutableStateOf(options) }

    ModalBottomSheet(onDismissRequest = onDismiss) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            item {
                Text(
                    "Recommendation Options",
                    style = MaterialTheme.typography.titleLarge
                )
                Spacer(modifier = Modifier.height(16.dp))
            }

            // Media Types
            item {
                Text("Media Types", style = MaterialTheme.typography.titleSmall)
                Spacer(modifier = Modifier.height(8.dp))
                LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    val types = listOf("BOOK", "AUDIO", "VIDEO", "PDF", "COMIC")
                    items(types) { type ->
                        FilterChip(
                            selected = tempOptions.mediaTypes?.contains(type) == true,
                            onClick = {
                                val updated = tempOptions.mediaTypes?.toMutableSet() ?: mutableSetOf()
                                if (updated.contains(type)) updated.remove(type)
                                else updated.add(type)
                                tempOptions = tempOptions.copy(
                                    mediaTypes = if (updated.isEmpty()) null else updated
                                )
                            },
                            label = { Text(type) }
                        )
                    }
                }
                Spacer(modifier = Modifier.height(16.dp))
            }

            // AI Recommendations
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text("AI Recommendations")
                        Text(
                            "Use AI for smarter suggestions",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    Switch(
                        checked = tempOptions.includeAI,
                        onCheckedChange = { tempOptions = tempOptions.copy(includeAI = it) }
                    )
                }
                Spacer(modifier = Modifier.height(16.dp))
            }

            // Max Results
            item {
                Text("Max Results: ${tempOptions.maxResults}", style = MaterialTheme.typography.titleSmall)
                Slider(
                    value = tempOptions.maxResults.toFloat(),
                    onValueChange = { tempOptions = tempOptions.copy(maxResults = it.toInt()) },
                    valueRange = 10f..100f,
                    steps = 8
                )
                Spacer(modifier = Modifier.height(24.dp))
            }

            item {
                Button(
                    onClick = {
                        onOptionsChange(tempOptions)
                        onDismiss()
                    },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Apply Options")
                }
                Spacer(modifier = Modifier.height(32.dp))
            }
        }
    }
}

private fun formatSourceTitle(source: String): String {
    return when (source) {
        "content_based" -> "Similar to Your Favorites"
        "history_based" -> "Continue Your Journey"
        "genre_based" -> "Popular in Your Genres"
        "ai_powered" -> "AI Recommendations"
        else -> source.replace("_", " ").split(" ").joinToString(" ") { it.capitalize() }
    }
}

private fun formatSourceSubtitle(source: String, count: Int): String {
    return when (source) {
        "content_based" -> "Based on items you've enjoyed"
        "history_based" -> "From series and authors you're reading"
        "genre_based" -> "Trending in genres you like"
        "ai_powered" -> "Powered by AI • $count suggestions"
        else -> "$count recommendations"
    }
}

private fun getSourceIcon(source: String) = when {
    source.contains("Similar") -> Icons.Default.Favorite
    source.contains("Journey") -> Icons.Default.AutoStories
    source.contains("Popular") -> Icons.Default.TrendingUp
    source.contains("AI") -> Icons.Default.AutoAwesome
    else -> Icons.Default.Recommend
}
