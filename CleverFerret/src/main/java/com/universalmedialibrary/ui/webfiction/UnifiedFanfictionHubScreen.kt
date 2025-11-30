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
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.webfiction.*
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import java.util.Locale
import com.universalmedialibrary.ui.fanfiction.FanfictionViewModel
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.ui.fanfiction.FilterType
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Unified Fanfiction Hub - All-in-one interface for fanfiction discovery, download, and management.
 * 
 * Streamlined experience combining:
 * - Site selection & Tag-based browsing
 * - Direct story download
 * - Library management (My Library)
 * - Update checker
 * 
 * No more jumping between screens! Reading is handled by the separate eReader.
 */

// Tab indices for the unified fanfiction hub
private object HubTabs {
    const val DISCOVER = 0
    const val LIBRARY = 1
    const val DOWNLOAD = 2
}

@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
@Composable
fun UnifiedFanfictionHubScreen(
    navController: NavController,
    viewModel: UniversalTagBrowserViewModel = hiltViewModel(),
    downloadViewModel: FanfictionDownloaderViewModel = hiltViewModel(),
    libraryViewModel: FanfictionViewModel = hiltViewModel()
) {
    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        val uiState by viewModel.uiState.collectAsState()
        val downloadState by downloadViewModel.uiState.collectAsState()
        val adultSitesEnabled by viewModel.adultSitesEnabled.collectAsState()
        
        var selectedTab by remember { mutableIntStateOf(HubTabs.DISCOVER) }
        val tabs = listOf("Discover", "Library", "Download")
        
        var showQuickDownloadDialog by remember { mutableStateOf(false) }

        Scaffold(
            topBar = {
                Column {
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
                            
                            if (selectedTab == HubTabs.DISCOVER && uiState.selectedSite != null) {
                                // Refresh tags (Discover tab)
                                IconButton(onClick = { viewModel.refreshTags() }) {
                                    Icon(Icons.Default.Refresh, contentDescription = "Refresh Tags")
                                }
                            } else if (selectedTab == HubTabs.LIBRARY) {
                                // Check updates (Library tab)
                                IconButton(onClick = { libraryViewModel.checkForUpdates() }) {
                                    Icon(Icons.Default.Refresh, contentDescription = "Check Updates")
                                }
                            } else if (selectedTab == HubTabs.DOWNLOAD) {
                                // Clear completed downloads (Download tab)
                                IconButton(onClick = { downloadViewModel.clearResult() }) {
                                    Icon(Icons.Default.Clear, contentDescription = "Clear Completed")
                                }
                            }
                        },
                        colors = TopAppBarDefaults.topAppBarColors(
                            containerColor = MaterialTheme.colorScheme.primaryContainer
                        )
                    )
                    
                    TabRow(
                        selectedTabIndex = selectedTab,
                        containerColor = MaterialTheme.colorScheme.primaryContainer,
                        contentColor = MaterialTheme.colorScheme.onPrimaryContainer
                    ) {
                        tabs.forEachIndexed { index, title ->
                            Tab(
                                selected = selectedTab == index,
                                onClick = { selectedTab = index },
                                text = { Text(title) },
                                icon = {
                                    Icon(
                                        when (index) {
                                            HubTabs.DISCOVER -> Icons.Default.Explore
                                            HubTabs.LIBRARY -> Icons.Default.LibraryBooks
                                            else -> Icons.Default.Download
                                        },
                                        contentDescription = null
                                    )
                                }
                            )
                        }
                    }
                }
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
                
                // Tag loading indicator (only for Discover tab)
                if (selectedTab == HubTabs.DISCOVER && uiState.isLoadingTags) {
                    LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
                }
                
                // Content
                when (selectedTab) {
                    HubTabs.DISCOVER -> UnifiedContent(
                        uiState = uiState,
                        downloadState = downloadState,
                        viewModel = viewModel,
                        downloadViewModel = downloadViewModel,
                        adultSitesEnabled = adultSitesEnabled
                    )
                    HubTabs.LIBRARY -> FanfictionLibraryTab(
                        viewModel = libraryViewModel,
                        onStoryClick = { story -> 
                            // Navigate to reader or details
                            // Assuming a reader route exists or details route
                            // For now, maybe just show a toast or log
                        }
                    )
                    HubTabs.DOWNLOAD -> DownloadTab(
                        downloadState = downloadState,
                        downloadViewModel = downloadViewModel,
                        adultSitesEnabled = adultSitesEnabled
                    )
                }
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

@Composable
fun FanfictionLibraryTab(
    viewModel: FanfictionViewModel,
    onStoryClick: (FanfictionStoryEntity) -> Unit
) {
    val stories by viewModel.allStories.collectAsState()
    val selectedFilter by viewModel.selectedFilter.collectAsState()
    val updateStatus by viewModel.updateStatus.collectAsState()
    
    var showFilterMenu by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }
    
    val filteredStories = remember(stories, selectedFilter, searchQuery) {
        stories.filter { story ->
            val matchesSearch = searchQuery.isBlank() ||
                story.title.contains(searchQuery, ignoreCase = true) ||
                story.author.contains(searchQuery, ignoreCase = true) ||
                story.summary.contains(searchQuery, ignoreCase = true)
            
            val matchesFilter = when (selectedFilter) {
                FilterType.ALL -> true
                FilterType.IN_PROGRESS -> story.status == "IN_PROGRESS"
                FilterType.COMPLETE -> story.status == "COMPLETE"
                FilterType.AO3 -> story.sourceSite == "Archive of Our Own"
                FilterType.FFN -> story.sourceSite == "FanFiction.Net"
                FilterType.ROYAL_ROAD -> story.sourceSite == "Royal Road"
            }
            
            matchesSearch && matchesFilter
        }
    }

    Column(modifier = Modifier.fillMaxSize()) {
        // Filter and Search Row
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(8.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { searchQuery = it },
                placeholder = { Text("Search library...") },
                leadingIcon = { Icon(Icons.Default.Search, "Search") },
                modifier = Modifier
                    .weight(1f)
                    .padding(end = 8.dp),
                singleLine = true
            )
            
            IconButton(onClick = { showFilterMenu = true }) {
                Icon(Icons.Default.FilterList, "Filter")
            }
            
            DropdownMenu(
                expanded = showFilterMenu,
                onDismissRequest = { showFilterMenu = false }
            ) {
                FilterType.values().forEach { filter ->
                    DropdownMenuItem(
                        text = { Text(filter.name.replace("_", " ")) },
                        onClick = {
                            viewModel.setFilter(filter)
                            showFilterMenu = false
                        },
                        leadingIcon = {
                            if (filter == selectedFilter) {
                                Icon(Icons.Default.Check, null)
                            }
                        }
                    )
                }
            }
        }
        
        // Update status banner
        updateStatus?.let { status ->
            Surface(
                color = MaterialTheme.colorScheme.primaryContainer,
                modifier = Modifier.fillMaxWidth()
            ) {
                Row(
                    modifier = Modifier.padding(12.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        status,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onPrimaryContainer,
                        modifier = Modifier.weight(1f)
                    )
                    IconButton(onClick = { viewModel.clearUpdateStatus() }) {
                        Icon(Icons.Default.Close, "Dismiss")
                    }
                }
            }
        }

        if (filteredStories.isEmpty()) {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    if (stories.isNotEmpty()) "No stories match your filter" else "Your library is empty. Go to 'Discover' to find stories!",
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    textAlign = TextAlign.Center,
                    modifier = Modifier.padding(32.dp)
                )
            }
        } else {
            LazyColumn(
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(
                    items = filteredStories,
                    key = { it.id }
                ) { story ->
                    LibraryStoryCard(
                        story = story,
                        onClick = { onStoryClick(story) },
                        onUpdateClick = { viewModel.updateStory(story.id) },
                        onDeleteClick = { viewModel.deleteStory(story) }
                    )
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun LibraryStoryCard(
    story: FanfictionStoryEntity,
    onClick: () -> Unit,
    onUpdateClick: () -> Unit,
    onDeleteClick: () -> Unit
) {
    var showMenu by remember { mutableStateOf(false) }
    
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            // Title and menu
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    story.title,
                    style = MaterialTheme.typography.titleMedium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.weight(1f)
                )
                
                Box {
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, "Menu")
                    }
                    
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false }
                    ) {
                        if (story.status == "IN_PROGRESS") {
                            DropdownMenuItem(
                                text = { Text("Check for Updates") },
                                onClick = {
                                    onUpdateClick()
                                    showMenu = false
                                },
                                leadingIcon = {
                                    Icon(Icons.Default.Refresh, null)
                                }
                            )
                        }
                        DropdownMenuItem(
                            text = { Text("Delete") },
                            onClick = {
                                onDeleteClick()
                                showMenu = false
                            },
                            leadingIcon = {
                                Icon(Icons.Default.Delete, null)
                            }
                        )
                    }
                }
            }
            
            // Author
            Text(
                "by ${story.author}",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(Modifier.height(8.dp))
            
            // Summary
            Text(
                story.summary,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(Modifier.height(12.dp))
            
            // Stats
            Row(
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    "${story.chapterCount} ch",
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    formatNumber(story.wordCount),
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    story.sourceSite,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
            }
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

/**
 * Download Tab - Direct URL download interface with supported sites info
 */
@Composable
private fun DownloadTab(
    downloadState: FanfictionDownloaderUiState,
    downloadViewModel: FanfictionDownloaderViewModel,
    adultSitesEnabled: Boolean
) {
    var url by remember { mutableStateOf("") }
    
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        // URL Input Card
        item {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Download,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(32.dp)
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Column {
                            Text(
                                text = "Download Story",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "Paste a story URL to download as EPUB",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                    
                    OutlinedTextField(
                        value = url,
                        onValueChange = { url = it },
                        modifier = Modifier.fillMaxWidth(),
                        label = { Text("Story URL") },
                        placeholder = { Text("https://archiveofourown.org/works/...") },
                        leadingIcon = {
                            Icon(Icons.Default.Link, contentDescription = null)
                        },
                        singleLine = true,
                        enabled = !downloadState.isLoading
                    )
                    
                    Button(
                        onClick = {
                            if (url.isNotBlank()) {
                                downloadViewModel.downloadFromUrl(url)
                            }
                        },
                        modifier = Modifier.fillMaxWidth(),
                        enabled = url.isNotBlank() && !downloadState.isLoading
                    ) {
                        if (downloadState.isLoading) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(20.dp),
                                color = MaterialTheme.colorScheme.onPrimary,
                                strokeWidth = 2.dp
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Downloading...")
                        } else {
                            Icon(Icons.Default.Download, contentDescription = null)
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Download as EPUB")
                        }
                    }
                }
            }
        }
        
        // Progress Info
        if (downloadState.isLoading) {
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
                        Text(
                            text = downloadState.progressMessage ?: "Fetching story...",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }
        
        // Success Result
        downloadState.result?.let { result ->
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.tertiaryContainer
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Default.CheckCircle,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.tertiary,
                                modifier = Modifier.size(32.dp)
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Text(
                                text = "Download Complete!",
                                style = MaterialTheme.typography.titleLarge,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onTertiaryContainer
                            )
                        }
                        
                        HorizontalDivider()
                        
                        Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                            DownloadInfoRow("Title", result.title)
                            DownloadInfoRow("Author", result.author)
                            DownloadInfoRow("Chapters", result.chapters.toString())
                        }
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            OutlinedButton(
                                onClick = { downloadViewModel.openEpub() },
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.Book, contentDescription = null)
                                Spacer(modifier = Modifier.width(4.dp))
                                Text("Read")
                            }
                            Button(
                                onClick = { downloadViewModel.shareEpub() },
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.Share, contentDescription = null)
                                Spacer(modifier = Modifier.width(4.dp))
                                Text("Share")
                            }
                        }
                    }
                }
            }
        }
        
        // Error Display
        downloadState.error?.let { error ->
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
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
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                text = "Download Failed",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Medium,
                                color = MaterialTheme.colorScheme.onErrorContainer
                            )
                            Text(
                                text = error,
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onErrorContainer
                            )
                        }
                    }
                }
            }
        }
        
        // Supported Sites Card
        item {
            Card(modifier = Modifier.fillMaxWidth()) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Language,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "Supported Sites",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Medium
                        )
                    }
                    
                    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                        SupportedSiteRow("Archive of Our Own", "archiveofourown.org", "✓ Full support")
                        SupportedSiteRow("FanFiction.Net", "fanfiction.net", "✓ Multi-chapter")
                        SupportedSiteRow("Royal Road", "royalroad.com", "✓ Web fiction")
                        SupportedSiteRow("Wattpad", "wattpad.com", "✓ Basic support")
                        if (adultSitesEnabled) {
                            SupportedSiteRow("Metabods", "metabods.com", "✓ Adult content")
                            SupportedSiteRow("Literotica", "literotica.com", "✓ Adult content")
                        }
                        SupportedSiteRow("Other Sites", "Generic", "Limited support")
                    }
                }
            }
        }
        
        // Tips Card
        item {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Lightbulb,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.tertiary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "Tips",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.Medium
                        )
                    }
                    Text(
                        text = "• Use the Discover tab to browse stories by tags\n" +
                               "• Downloaded stories appear in Library tab\n" +
                               "• EPUBs are saved to your device for offline reading\n" +
                               "• Large stories with many chapters may take longer",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun DownloadInfoRow(label: String, value: String) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = "$label:",
            style = MaterialTheme.typography.bodyMedium,
            fontWeight = FontWeight.Medium,
            color = MaterialTheme.colorScheme.onTertiaryContainer.copy(alpha = 0.7f)
        )
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onTertiaryContainer
        )
    }
}

@Composable
private fun SupportedSiteRow(name: String, domain: String, status: String) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column {
            Text(
                text = name,
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Medium
            )
            Text(
                text = domain,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        Text(
            text = status,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.primary
        )
    }
}

private fun formatNumber(number: Int): String {
    val locale = Locale.getDefault()
    return when {
        number >= 1_000_000 -> String.format(locale, "%.1fM", number / 1_000_000.0)
        number >= 1_000 -> String.format(locale, "%.1fK", number / 1_000.0)
        else -> number.toString()
    }
}
