package com.universalmedialibrary.ui.webfiction

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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.webfiction.*
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette

/**
 * Unified Fanfiction Hub - All-in-one interface for fanfiction discovery and download
 * 
 * Streamlined experience combining:
 * - Site selection
 * - Tag-based browsing  
 * - Direct story download
 * - Update checker
 * 
 * No more jumping between screens! Reading is handled by the separate eReader.
 */
@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
@Composable
fun UnifiedFanfictionHubScreen(
    navController: NavController,
    viewModel: UniversalTagBrowserViewModel = hiltViewModel(),
    downloadViewModel: FanfictionDownloaderViewModel = hiltViewModel()
) {
    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        val uiState by viewModel.uiState.collectAsState()
        val downloadState by downloadViewModel.uiState.collectAsState()
        val adultSitesEnabled by viewModel.adultSitesEnabled.collectAsState()
        
        var showQuickDownloadDialog by remember { mutableStateOf(false) }

        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Text(
                            "Fanfiction Hub",
                            fontWeight = FontWeight.Bold
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = { navController.navigateUp() }) {
                            Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                        }
                    },
                    actions = {
                        // Quick download button
                        IconButton(onClick = { showQuickDownloadDialog = true }) {
                            Icon(Icons.Default.Download, contentDescription = "Quick Download")
                        }
                        
                        // Refresh tags
                        if (uiState.selectedSite != null) {
                            IconButton(onClick = { viewModel.refreshTags() }) {
                                Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                            }
                        }
                        
                        // Library link
                        IconButton(onClick = { navController.navigate("fanfiction_library") }) {
                            Icon(Icons.Default.Book, contentDescription = "My Library")
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                )
            }
        ) { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
            ) {
                // Download progress indicator
                if (downloadState.isLoading) {
                    LinearProgressIndicator(
                        modifier = Modifier.fillMaxWidth(),
                        color = MaterialTheme.colorScheme.tertiary
                    )
                    downloadState.progressMessage?.let { message ->
                        Text(
                            text = message,
                            style = MaterialTheme.typography.bodySmall,
                            modifier = Modifier.padding(horizontal = 16.dp, vertical = 4.dp),
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
                
                // Tag loading indicator
                if (uiState.isLoadingTags) {
                    LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
                }
                
                // Main content
                UnifiedContent(
                    uiState = uiState,
                    downloadState = downloadState,
                    viewModel = viewModel,
                    downloadViewModel = downloadViewModel,
                    adultSitesEnabled = adultSitesEnabled
                )
            }
        }

        // Quick download dialog
        if (showQuickDownloadDialog) {
            QuickDownloadDialog(
                downloadViewModel = downloadViewModel,
                onDismiss = { showQuickDownloadDialog = false }
            )
        }

        // Download result snackbar
        downloadState.result?.let { result ->
            LaunchedEffect(result) {
                // Could show a snackbar here
            }
        }

        // Error snackbar
        downloadState.error?.let { error ->
            LaunchedEffect(error) {
                // Could show error snackbar here
            }
        }

        // PIN challenge dialog
        uiState.pendingPinChallenge?.let { challenge ->
            PinAccessDialog(
                challenge = challenge,
                onDismiss = { viewModel.dismissPinChallenge() },
                onAccessGranted = { viewModel.onPinUnlockGranted() },
                verifyPin = viewModel::verifyPin
            )
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun UnifiedContent(
    uiState: UniversalTagBrowserUiState,
    downloadState: FanfictionDownloaderUiState,
    viewModel: UniversalTagBrowserViewModel,
    downloadViewModel: FanfictionDownloaderViewModel,
    adultSitesEnabled: Boolean
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        // Site Selector Card
        item {
            SiteSelectorCard(
                selectedSite = uiState.selectedSite,
                adultSitesEnabled = adultSitesEnabled,
                onSiteSelected = { viewModel.selectSite(it) }
            )
        }
        
        // Only show content if a site is selected
        if (uiState.selectedSite != null) {
            // Selected tags display
            if (uiState.selectedTags.isNotEmpty()) {
                item {
                    SelectedTagsCard(
                        selectedTags = uiState.selectedTags,
                        onTagRemove = { viewModel.toggleTag(it) },
                        onClearAll = { viewModel.clearTags() }
                    )
                }
            }
            
            // Available tags
            item {
                AvailableTagsCard(
                    tags = uiState.tags,
                    selectedTags = uiState.selectedTags,
                    onTagToggle = { viewModel.toggleTag(it.name) }
                )
            }
            
            // Search button
            if (uiState.selectedTags.isNotEmpty()) {
                item {
                    Button(
                        onClick = { viewModel.browseStories() },
                        modifier = Modifier.fillMaxWidth(),
                        enabled = !uiState.isLoadingStories
                    ) {
                        Icon(Icons.Default.Search, null)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Search Stories")
                    }
                }
            }
            
            // Search results
            if (uiState.isLoadingStories) {
                item {
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(32.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                }
            }
            
            uiState.searchResult?.let { result ->
                if (result.stories.isNotEmpty()) {
                    item {
                        Text(
                            "${result.stories.size} Stories Found",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                    }
                    
                    items(result.stories) { story ->
                        StoryCard(
                            story = story,
                            onDownload = { 
                                story.url?.let { downloadViewModel.downloadFromUrl(it) }
                            },
                            isDownloading = downloadState.isLoading
                        )
                    }
                } else if (!uiState.isLoadingStories) {
                    item {
                        EmptyResultsCard()
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun SiteSelectorCard(
    selectedSite: WebFictionSiteType?,
    adultSitesEnabled: Boolean,
    onSiteSelected: (WebFictionSiteType) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.secondaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Select a Site",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                if (selectedSite != null) {
                    FilterChip(
                        selected = false,
                        onClick = { onSiteSelected(selectedSite) },
                        label = { Text(selectedSite.displayName) },
                        leadingIcon = {
                            Icon(Icons.Default.Check, null, modifier = Modifier.size(18.dp))
                        }
                    )
                }
            }
            
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(WebFictionSiteType.entries.toTypedArray()) { siteType ->
                    val isAdult = siteType.isAdultSite()
                    val isEnabled = !isAdult || adultSitesEnabled
                    
                    FilterChip(
                        selected = selectedSite == siteType,
                        onClick = { if (isEnabled) onSiteSelected(siteType) },
                        label = { Text(siteType.displayName) },
                        enabled = isEnabled,
                        leadingIcon = if (selectedSite == siteType) {
                            { Icon(Icons.Default.Check, null, modifier = Modifier.size(18.dp)) }
                        } else null
                    )
                }
            }
            
            if (!adultSitesEnabled) {
                Text(
                    "Some sites require enabling Adult Content in Parental Controls",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun SelectedTagsCard(
    selectedTags: List<String>,
    onTagRemove: (String) -> Unit,
    onClearAll: () -> Unit
) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.tertiaryContainer
        )
    ) {
        Column(modifier = Modifier.padding(12.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    "Selected Tags (${selectedTags.size})",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
                TextButton(onClick = onClearAll) {
                    Text("Clear All")
                }
            }
            FlowRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                selectedTags.forEach { tag ->
                    FilterChip(
                        selected = true,
                        onClick = { onTagRemove(tag) },
                        label = { Text(tag) },
                        trailingIcon = {
                            Icon(
                                Icons.Default.Close,
                                null,
                                modifier = Modifier.size(16.dp)
                            )
                        }
                    )
                }
            }
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun AvailableTagsCard(
    tags: List<WebFictionTag>,
    selectedTags: List<String>,
    onTagToggle: (WebFictionTag) -> Unit
) {
    Card {
        Column(modifier = Modifier.padding(12.dp)) {
            Text(
                "Browse Tags",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(8.dp))
            
            if (tags.isEmpty()) {
                Text(
                    "Select a site to see available tags",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            } else {
                FlowRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    tags.take(50).forEach { tag ->
                        FilterChip(
                            selected = tag.name in selectedTags,
                            onClick = { onTagToggle(tag) },
                            label = { Text(tag.name) }
                        )
                    }
                }
                
                if (tags.size > 50) {
                    Text(
                        "... and ${tags.size - 50} more tags",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(top = 8.dp)
                    )
                }
            }
        }
    }
}

@Composable
private fun StoryCard(
    story: WebFictionStory,
    onDownload: () -> Unit,
    isDownloading: Boolean
) {
    var showDetails by remember { mutableStateOf(false) }
    
    ElevatedCard(
        modifier = Modifier
            .fillMaxWidth()
            .clickable { showDetails = !showDetails }
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            // Title and author
            Text(
                text = story.title,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            Text(
                text = "by ${story.author}",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            // Stats row
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 8.dp),
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                story.wordCount?.let {
                    Text(
                        "📝 ${formatNumber(it.toInt())} words",
                        style = MaterialTheme.typography.bodySmall
                    )
                }
                story.chapterCount?.let {
                    Text(
                        "📚 $it chapters",
                        style = MaterialTheme.typography.bodySmall
                    )
                }
                Text(
                    if (story.status == StoryStatus.COMPLETED) "✅ Complete" else "📝 In Progress",
                    style = MaterialTheme.typography.bodySmall
                )
            }
            
            // Expandable description
            AnimatedVisibility(visible = showDetails) {
                Column {
                    HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp))
                    story.description?.let {
                        Text(
                            text = it,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    
                    // Tags
                    if (story.tags.isNotEmpty()) {
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "Tags: ${story.tags.joinToString(", ")}",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
            
            // Action buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = onDownload,
                    modifier = Modifier.weight(1f),
                    enabled = !isDownloading
                ) {
                    Icon(Icons.Default.Download, null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(if (isDownloading) "Downloading..." else "Download")
                }
                OutlinedButton(
                    onClick = { showDetails = !showDetails },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(
                        if (showDetails) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                        null,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(if (showDetails) "Less" else "More")
                }
            }
        }
    }
}

@Composable
private fun EmptyResultsCard() {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .padding(32.dp)
                .fillMaxWidth(),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                Icons.Default.Search,
                contentDescription = null,
                modifier = Modifier.size(48.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                "No stories found",
                style = MaterialTheme.typography.titleMedium
            )
            Text(
                "Try different tags or adjust your filters",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun QuickDownloadDialog(
    downloadViewModel: FanfictionDownloaderViewModel,
    onDismiss: () -> Unit
) {
    var url by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Quick Download") },
        text = {
            Column {
                Text("Paste a story URL to download:")
                Spacer(modifier = Modifier.height(8.dp))
                OutlinedTextField(
                    value = url,
                    onValueChange = { url = it },
                    label = { Text("Story URL") },
                    placeholder = { Text("https://...") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    if (url.isNotBlank()) {
                        downloadViewModel.downloadFromUrl(url)
                        onDismiss()
                    }
                },
                enabled = url.isNotBlank()
            ) {
                Text("Download")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

private fun formatNumber(number: Int): String {
    return when {
        number >= 1_000_000 -> String.format("%.1fM", number / 1_000_000.0)
        number >= 1_000 -> String.format("%.1fK", number / 1_000.0)
        else -> number.toString()
    }
}
