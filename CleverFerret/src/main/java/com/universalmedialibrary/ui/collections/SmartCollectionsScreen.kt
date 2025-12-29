package com.universalmedialibrary.ui.collections

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.PlaylistPlay
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.data.local.entity.SmartCollectionRule
import com.universalmedialibrary.data.local.entity.SmartCollectionType
import com.universalmedialibrary.data.local.entity.SuggestedCollection
import com.universalmedialibrary.services.suggestions.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SmartCollectionsScreen(
    navController: NavController,
    viewModel: SmartCollectionsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var selectedTab by remember { mutableStateOf(0) }
    val tabs = listOf("Suggestions", "Active", "All")

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text("Smart Collections", fontWeight = FontWeight.SemiBold)
                        Text(
                            "${uiState.suggestions.size} suggestions available",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.refreshSuggestions() }) {
                        Icon(Icons.Default.Refresh, "Refresh")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Tab row
            TabRow(selectedTabIndex = selectedTab) {
                tabs.forEachIndexed { index, title ->
                    Tab(
                        selected = selectedTab == index,
                        onClick = { selectedTab = index },
                        text = { Text(title) }
                    )
                }
            }

            when (selectedTab) {
                0 -> SuggestionsTab(
                    uiState = uiState,
                    onCreateCollection = viewModel::createCollectionFromSuggestion,
                    onDismissSuggestion = viewModel::dismissSuggestion,
                    navController = navController
                )
                1 -> ActiveCollectionsTab(
                    collections = uiState.activeCollections,
                    onOpenCollection = { rule ->
                        navController.navigate("smart_collection/${rule.ruleId}")
                    },
                    onRefreshCollection = viewModel::refreshCollection,
                    onDeleteCollection = viewModel::deleteCollection
                )
                2 -> AllSuggestionsTab(
                    allSuggestions = uiState.allSuggestions,
                    navController = navController,
                    onCreatePlaylist = viewModel::createPlaylistFromSuggestion,
                    onCreateSeries = viewModel::createSeriesCollection,
                    onCreateAuthorCollection = viewModel::createAuthorCollection,
                    onCreateReadingList = viewModel::createReadingList,
                    onCreateMovieCollection = viewModel::createMovieCollection
                )
            }
        }
    }
}

@Composable
private fun SuggestionsTab(
    uiState: SmartCollectionsUiState,
    onCreateCollection: (SuggestedCollection) -> Unit,
    onDismissSuggestion: (String) -> Unit,
    navController: NavController
) {
    if (uiState.isLoading) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            CircularProgressIndicator()
        }
        return
    }

    if (uiState.suggestions.isEmpty()) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(
                    Icons.Default.AutoAwesome,
                    contentDescription = null,
                    modifier = Modifier.size(64.dp),
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    "No suggestions available",
                    style = MaterialTheme.typography.titleMedium
                )
                Text(
                    "Add more media to get personalized suggestions",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
        return
    }

    LazyColumn(
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(uiState.suggestions) { suggestion ->
            SuggestionCard(
                suggestion = suggestion,
                onAccept = { onCreateCollection(suggestion) },
                onDismiss = { onDismissSuggestion(suggestion.suggestionId) }
            )
        }
    }
}

@Composable
private fun SuggestionCard(
    suggestion: SuggestedCollection,
    onAccept: () -> Unit,
    onDismiss: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(
                    imageVector = getCollectionTypeIcon(suggestion.collectionType),
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(40.dp)
                )
                Spacer(modifier = Modifier.width(12.dp))
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        suggestion.suggestedName,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                    Text(
                        suggestion.reason,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                // Confidence indicator
                Surface(
                    shape = RoundedCornerShape(4.dp),
                    color = getConfidenceColor(suggestion.confidence)
                ) {
                    Text(
                        "${(suggestion.confidence * 100).toInt()}%",
                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                        style = MaterialTheme.typography.labelSmall
                    )
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            // Media type chips
            LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                items(suggestion.mediaTypes) { mediaType ->
                    SuggestionChip(
                        onClick = {},
                        label = { Text(mediaType.replace("_", " ")) }
                    )
                }
                item {
                    SuggestionChip(
                        onClick = {},
                        label = { Text("${suggestion.estimatedItemCount} items") },
                        icon = { Icon(Icons.Default.Folder, null, modifier = Modifier.size(16.dp)) }
                    )
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            // Actions
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.End
            ) {
                TextButton(onClick = onDismiss) {
                    Icon(Icons.Default.Close, null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Dismiss")
                }
                Spacer(modifier = Modifier.width(8.dp))
                Button(onClick = onAccept) {
                    Icon(Icons.Default.Add, null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Create")
                }
            }
        }
    }
}

@Composable
private fun ActiveCollectionsTab(
    collections: List<SmartCollectionRule>,
    onOpenCollection: (SmartCollectionRule) -> Unit,
    onRefreshCollection: (Long) -> Unit,
    onDeleteCollection: (SmartCollectionRule) -> Unit
) {
    if (collections.isEmpty()) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(
                    Icons.Default.PlaylistAdd,
                    contentDescription = null,
                    modifier = Modifier.size(64.dp),
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    "No active smart collections",
                    style = MaterialTheme.typography.titleMedium
                )
                Text(
                    "Create collections from suggestions to see them here",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
        return
    }

    LazyColumn(
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(collections) { collection ->
            ActiveCollectionCard(
                collection = collection,
                onClick = { onOpenCollection(collection) },
                onRefresh = { onRefreshCollection(collection.ruleId) },
                onDelete = { onDeleteCollection(collection) }
            )
        }
    }
}

@Composable
private fun ActiveCollectionCard(
    collection: SmartCollectionRule,
    onClick: () -> Unit,
    onRefresh: () -> Unit,
    onDelete: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = getCollectionTypeIcon(collection.collectionType),
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(48.dp)
            )
            Spacer(modifier = Modifier.width(16.dp))
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    collection.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                collection.description?.let { desc ->
                    Text(
                        desc,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                Text(
                    "${collection.currentItemCount} items",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            IconButton(onClick = onRefresh) {
                Icon(Icons.Default.Refresh, "Refresh")
            }
            IconButton(onClick = onDelete) {
                Icon(Icons.Default.Delete, "Delete", tint = MaterialTheme.colorScheme.error)
            }
        }
    }
}

@Composable
private fun AllSuggestionsTab(
    allSuggestions: AllSuggestions?,
    navController: NavController,
    onCreatePlaylist: (PlaylistSuggestion) -> Unit,
    onCreateSeries: (SeriesSuggestion) -> Unit,
    onCreateAuthorCollection: (AuthorCollectionSuggestion) -> Unit,
    onCreateReadingList: (ReadingListSuggestion) -> Unit,
    onCreateMovieCollection: (MovieCollectionSuggestion) -> Unit
) {
    if (allSuggestions == null) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            CircularProgressIndicator()
        }
        return
    }

    LazyColumn(
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        // Playlists section
        if (allSuggestions.playlistSuggestions.isNotEmpty()) {
            item {
                SectionHeader(
                    icon = Icons.AutoMirrored.Filled.PlaylistPlay,
                    title = "Music Playlists",
                    count = allSuggestions.playlistSuggestions.size
                )
            }
            items(allSuggestions.playlistSuggestions) { playlist ->
                PlaylistSuggestionCard(
                    playlist = playlist,
                    onCreate = { onCreatePlaylist(playlist) }
                )
            }
        }

        // Book Series section
        if (allSuggestions.seriesSuggestions.isNotEmpty()) {
            item {
                SectionHeader(
                    icon = Icons.Default.LibraryBooks,
                    title = "Book Series",
                    count = allSuggestions.seriesSuggestions.size
                )
            }
            items(allSuggestions.seriesSuggestions) { series ->
                SeriesSuggestionCard(
                    series = series,
                    onCreate = { onCreateSeries(series) }
                )
            }
        }

        // Author Collections section
        if (allSuggestions.authorCollections.isNotEmpty()) {
            item {
                SectionHeader(
                    icon = Icons.Default.Person,
                    title = "Author Collections",
                    count = allSuggestions.authorCollections.size
                )
            }
            items(allSuggestions.authorCollections) { author ->
                AuthorSuggestionCard(
                    author = author,
                    onCreate = { onCreateAuthorCollection(author) }
                )
            }
        }

        // Reading Lists section
        if (allSuggestions.readingLists.isNotEmpty()) {
            item {
                SectionHeader(
                    icon = Icons.Default.MenuBook,
                    title = "Reading Lists",
                    count = allSuggestions.readingLists.size
                )
            }
            items(allSuggestions.readingLists) { readingList ->
                ReadingListSuggestionCard(
                    readingList = readingList,
                    onCreate = { onCreateReadingList(readingList) }
                )
            }
        }

        // Movie Collections section
        if (allSuggestions.movieCollections.isNotEmpty()) {
            item {
                SectionHeader(
                    icon = Icons.Default.Movie,
                    title = "Movie Collections",
                    count = allSuggestions.movieCollections.size
                )
            }
            items(allSuggestions.movieCollections) { movie ->
                MovieSuggestionCard(
                    movie = movie,
                    onCreate = { onCreateMovieCollection(movie) }
                )
            }
        }
    }
}

@Composable
private fun SectionHeader(icon: ImageVector, title: String, count: Int) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier.padding(vertical = 8.dp)
    ) {
        Icon(icon, null, tint = MaterialTheme.colorScheme.primary)
        Spacer(modifier = Modifier.width(8.dp))
        Text(
            title,
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.SemiBold
        )
        Spacer(modifier = Modifier.width(8.dp))
        Surface(
            shape = RoundedCornerShape(12.dp),
            color = MaterialTheme.colorScheme.primaryContainer
        ) {
            Text(
                count.toString(),
                modifier = Modifier.padding(horizontal = 8.dp, vertical = 2.dp),
                style = MaterialTheme.typography.labelSmall
            )
        }
    }
}

@Composable
private fun PlaylistSuggestionCard(playlist: PlaylistSuggestion, onCreate: () -> Unit) {
    SimpleSuggestionCard(
        title = playlist.name,
        subtitle = playlist.description,
        itemCount = playlist.itemIds.size,
        confidence = playlist.confidence,
        onCreate = onCreate
    )
}

@Composable
private fun SeriesSuggestionCard(series: SeriesSuggestion, onCreate: () -> Unit) {
    SimpleSuggestionCard(
        title = series.seriesName,
        subtitle = "Pattern: ${series.detectedPattern}",
        itemCount = series.books.size,
        confidence = series.confidence,
        onCreate = onCreate
    )
}

@Composable
private fun AuthorSuggestionCard(author: AuthorCollectionSuggestion, onCreate: () -> Unit) {
    SimpleSuggestionCard(
        title = "Works by ${author.authorName}",
        subtitle = author.reason,
        itemCount = author.bookCount,
        confidence = author.confidence,
        onCreate = onCreate
    )
}

@Composable
private fun ReadingListSuggestionCard(readingList: ReadingListSuggestion, onCreate: () -> Unit) {
    SimpleSuggestionCard(
        title = readingList.name,
        subtitle = readingList.reason,
        itemCount = readingList.itemIds.size,
        confidence = readingList.confidence,
        onCreate = onCreate
    )
}

@Composable
private fun MovieSuggestionCard(movie: MovieCollectionSuggestion, onCreate: () -> Unit) {
    SimpleSuggestionCard(
        title = movie.name,
        subtitle = movie.description,
        itemCount = movie.movieIds.size,
        confidence = movie.confidence,
        onCreate = onCreate
    )
}

@Composable
private fun SimpleSuggestionCard(
    title: String,
    subtitle: String,
    itemCount: Int,
    confidence: Float,
    onCreate: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    title,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    subtitle,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    "$itemCount items • ${(confidence * 100).toInt()}% confidence",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            FilledTonalButton(onClick = onCreate) {
                Text("Create")
            }
        }
    }
}

private fun getCollectionTypeIcon(type: SmartCollectionType): ImageVector {
    return when (type) {
        SmartCollectionType.AUTO_PLAYLIST -> Icons.AutoMirrored.Filled.PlaylistPlay
        SmartCollectionType.BOOK_SERIES -> Icons.Default.LibraryBooks
        SmartCollectionType.AUTHOR_COLLECTION -> Icons.Default.Person
        SmartCollectionType.MOVIE_COLLECTION -> Icons.Default.Movie
        SmartCollectionType.TV_SERIES -> Icons.Default.Tv
        SmartCollectionType.GENRE_COLLECTION -> Icons.Default.Category
        SmartCollectionType.RECENTLY_ADDED -> Icons.Default.NewReleases
        SmartCollectionType.RECENTLY_ACCESSED -> Icons.Default.History
        SmartCollectionType.MOST_PLAYED -> Icons.Default.TrendingUp
        SmartCollectionType.FAVORITES -> Icons.Default.Favorite
        SmartCollectionType.TAG_BASED -> Icons.Default.Label
        SmartCollectionType.TIME_BASED -> Icons.Default.Schedule
        SmartCollectionType.MOOD_PLAYLIST -> Icons.Default.Mood
        SmartCollectionType.IN_PROGRESS -> Icons.Default.PlayArrow
        SmartCollectionType.BACKLOG -> Icons.Default.Inbox
        SmartCollectionType.AI_RECOMMENDED -> Icons.Default.AutoAwesome
        SmartCollectionType.CUSTOM -> Icons.Default.Folder
    }
}

@Composable
private fun getConfidenceColor(confidence: Float): androidx.compose.ui.graphics.Color {
    return when {
        confidence >= 0.9f -> MaterialTheme.colorScheme.primaryContainer
        confidence >= 0.7f -> MaterialTheme.colorScheme.secondaryContainer
        confidence >= 0.5f -> MaterialTheme.colorScheme.tertiaryContainer
        else -> MaterialTheme.colorScheme.surfaceVariant
    }
}
