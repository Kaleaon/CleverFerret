package com.universalmedialibrary.ui.webfiction

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.services.webfiction.*

/**
 * Universal tag browser that works for ANY fanfiction site
 * 
 * Features:
 * - Site selection
 * - Tag browsing for selected site
 * - Multi-tag selection
 * - Advanced filters
 * - Story results
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun UniversalTagBrowserScreen(
    initialSiteType: WebFictionSiteType? = null,
    navController: NavController,
    viewModel: UniversalTagBrowserViewModel = hiltViewModel()
) {
    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        val uiState by viewModel.uiState.collectAsState()
        val adultSitesEnabled by viewModel.adultSitesEnabled.collectAsState()

        // Set initial site if provided
        LaunchedEffect(initialSiteType) {
            initialSiteType?.let { viewModel.selectSite(it) }
        }

        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Text(
                            "Browse by Tags",
                            fontWeight = FontWeight.Medium
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = { navController.navigateUp() }) {
                            Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                        }
                    },
                    actions = {
                        if (uiState.selectedSite != null) {
                            IconButton(onClick = { viewModel.toggleFilters() }) {
                                Icon(
                                    if (uiState.showFilters) Icons.Default.FilterListOff else Icons.Default.FilterList,
                                    contentDescription = "Filters"
                                )
                            }
                            IconButton(onClick = { viewModel.refreshTags() }) {
                                Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                            }
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = MaterialTheme.colorScheme.surface
                    )
                )
            }
        ) { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
            ) {
                if (uiState.isLoadingTags) {
                    LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
                }

                if (uiState.selectedSite == null) {
                    // Site selection screen
                    SiteSelectionScreen(
                        adultSitesEnabled = adultSitesEnabled,
                        onSiteSelected = { viewModel.selectSite(it) }
                    )
                } else {
                    // Tag browsing screen
                    TagBrowsingContent(
                        uiState = uiState,
                        viewModel = viewModel,
                        navController = navController
                    )
                }
            }
        }
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
private fun SiteSelectionScreen(
    adultSitesEnabled: Boolean,
    onSiteSelected: (WebFictionSiteType) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item {
            Text(
                "Select a Site to Browse",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 8.dp)
            )
            Text(
                "Choose a fanfiction site to browse stories by tags",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            if (!adultSitesEnabled) {
                Spacer(modifier = Modifier.height(12.dp))
                ElevatedCard(
                    colors = CardDefaults.elevatedCardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            text = "Adult sources are currently disabled.",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.SemiBold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "Enable adult story sources in Parental Controls to access mature fanfiction catalogs.",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }

        items(WebFictionSiteType.values().filter { it != WebFictionSiteType.GENERIC }) { siteType ->
            val enabled = adultSitesEnabled || !siteType.isAdultSite()
            SiteCard(
                siteType = siteType,
                enabled = enabled,
                showAdultDisabledMessage = !adultSitesEnabled && siteType.isAdultSite(),
                onClick = { onSiteSelected(siteType) }
            )
        }
    }
}

@Composable
private fun SiteCard(
    siteType: WebFictionSiteType,
    enabled: Boolean,
    showAdultDisabledMessage: Boolean,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .alpha(if (enabled) 1f else 0.6f)
            .clickable(enabled = enabled) { onClick() }
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = siteType.displayName,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = siteType.baseUrl,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                if (siteType.isAdultSite()) {
                    Spacer(modifier = Modifier.height(6.dp))
                    AssistChip(
                        onClick = {},
                        enabled = false,
                        label = { Text("Adult Source") },
                        leadingIcon = {
                            Icon(
                                Icons.Default.Warning,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.tertiary
                            )
                        },
                        colors = AssistChipDefaults.assistChipColors(
                            containerColor = MaterialTheme.colorScheme.secondaryContainer,
                            labelColor = MaterialTheme.colorScheme.onSecondaryContainer
                        )
                    )
                }
                if (showAdultDisabledMessage) {
                    Spacer(modifier = Modifier.height(6.dp))
                    Text(
                        text = "Enable in Parental Controls to browse this catalog.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.error
                    )
                }
            }
            Icon(
                Icons.Default.ChevronRight,
                contentDescription = "Select",
                tint = MaterialTheme.colorScheme.primary
            )
        }
    }
}

@Composable
private fun TagBrowsingContent(
    uiState: UniversalTagBrowserUiState,
    viewModel: UniversalTagBrowserViewModel,
    navController: NavController
) {
    Column(modifier = Modifier.fillMaxSize()) {
        // Site header
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 8.dp)
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { viewModel.clearSiteSelection() }
                    .padding(12.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        "Browsing: ${uiState.selectedSite?.displayName}",
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        "${uiState.tags.size} tags available",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                TextButton(onClick = { viewModel.clearSiteSelection() }) {
                    Text("Change Site")
                }
            }
        }

        // Selected tags
        if (uiState.selectedTags.isNotEmpty()) {
            SelectedTagsRow(
                selectedTags = uiState.selectedTags,
                allTags = uiState.tags,
                onRemoveTag = { viewModel.removeTag(it) },
                onClearAll = { viewModel.clearTags() }
            )
        }

        // Advanced filters
        AnimatedVisibility(visible = uiState.showFilters) {
            AdvancedFiltersCard(
                criteria = uiState.searchCriteria,
                onCriteriaChange = { viewModel.updateSearchCriteria(it) }
            )
        }

        // Browse button
        if (uiState.selectedTags.isNotEmpty()) {
            Button(
                onClick = { viewModel.browseStories() },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                enabled = !uiState.isLoadingStories
            ) {
                if (uiState.isLoadingStories) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(20.dp),
                        color = MaterialTheme.colorScheme.onPrimary,
                        strokeWidth = 2.dp
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                }
                Icon(Icons.Default.Search, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Browse Stories (${uiState.selectedTags.size} tags)")
            }
        }

        // Tag categories or story results
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            if (uiState.searchResult == null) {
                // Show tag categories
                val tagsByCategory = uiState.tags.groupBy { it.category }
                tagsByCategory.forEach { (category, categoryTags) ->
                    item {
                        TagCategoryCard(
                            category = category,
                            tags = categoryTags,
                            selectedTags = uiState.selectedTags,
                            isExpanded = uiState.expandedCategory == category,
                            onToggleExpand = { viewModel.toggleCategory(category) },
                            onTagToggle = { viewModel.toggleTag(it) }
                        )
                    }
                }
            } else {
                // Show story results
                item {
                    Text(
                        text = "Found ${uiState.searchResult.totalCount} stories",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                }

                items(uiState.searchResult.stories) { story ->
                    StoryResultCard(
                        story = story,
                        onStoryClick = { viewModel.downloadStory(story) },
                        onOpenUrl = { /* TODO: Open in browser */ }
                    )
                }

                if (uiState.searchResult.hasMore) {
                    item {
                        Button(
                            onClick = { viewModel.loadMore() },
                            modifier = Modifier.fillMaxWidth(),
                            enabled = !uiState.isLoadingStories
                        ) {
                            Text("Load More")
                        }
                    }
                }
            }

            if (uiState.error != null) {
                item {
                    ErrorCard(
                        error = uiState.error,
                        onDismiss = { viewModel.clearError() }
                    )
                }
            }
        }
    }
}

// Reuse components from MetabodsTagBrowserScreen
@Composable
private fun SelectedTagsRow(
    selectedTags: List<String>,
    allTags: List<WebFictionTag>,
    onRemoveTag: (String) -> Unit,
    onClearAll: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp)
    ) {
        Column(modifier = Modifier.padding(12.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Selected Tags (${selectedTags.size})",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
                TextButton(onClick = onClearAll) {
                    Text("Clear All")
                }
            }

            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(selectedTags) { tagId ->
                    val tag = allTags.find { it.id == tagId }
                    if (tag != null) {
                        FilterChip(
                            selected = true,
                            onClick = { onRemoveTag(tagId) },
                            label = { Text(tag.displayName) },
                            trailingIcon = {
                                Icon(
                                    Icons.Default.Close,
                                    contentDescription = "Remove",
                                    modifier = Modifier.size(18.dp)
                                )
                            }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun TagCategoryCard(
    category: TagCategory,
    tags: List<WebFictionTag>,
    selectedTags: List<String>,
    isExpanded: Boolean,
    onToggleExpand: () -> Unit,
    onTagToggle: (String) -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onToggleExpand() },
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = getCategoryDisplayName(category),
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "${tags.size} tags",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Icon(
                    if (isExpanded) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                    contentDescription = if (isExpanded) "Collapse" else "Expand"
                )
            }

            AnimatedVisibility(visible = isExpanded) {
                Column(modifier = Modifier.padding(top = 12.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    tags.chunked(2).forEach { rowTags ->
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            rowTags.forEach { tag ->
                                FilterChip(
                                    selected = tag.id in selectedTags,
                                    onClick = { onTagToggle(tag.id) },
                                    label = { Text(tag.displayName) },
                                    modifier = Modifier.weight(1f)
                                )
                            }
                            if (rowTags.size == 1) {
                                Spacer(modifier = Modifier.weight(1f))
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun AdvancedFiltersCard(
    criteria: StorySearchCriteria,
    onCriteriaChange: (StorySearchCriteria) -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                "Advanced Filters",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Bold
            )

            Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                FilterChip(
                    selected = criteria.tagMatchMode == TagMatchMode.ANY,
                    onClick = { onCriteriaChange(criteria.copy(tagMatchMode = TagMatchMode.ANY)) },
                    label = { Text("Any (OR)") }
                )
                FilterChip(
                    selected = criteria.tagMatchMode == TagMatchMode.ALL,
                    onClick = { onCriteriaChange(criteria.copy(tagMatchMode = TagMatchMode.ALL)) },
                    label = { Text("All (AND)") }
                )
            }
        }
    }
}

@Composable
private fun StoryResultCard(
    story: WebFictionStory,
    onStoryClick: () -> Unit,
    onOpenUrl: () -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier
                .clickable { onStoryClick() }
                .padding(16.dp)
        ) {
            Text(
                text = story.title,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            if (story.author != null) {
                Text(
                    text = "by ${story.author}",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            if (story.description?.isNotEmpty() == true) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = story.description,
                    style = MaterialTheme.typography.bodySmall,
                    maxLines = 3
                )
            }
        }
    }
}

@Composable
private fun ErrorCard(error: String, onDismiss: () -> Unit) {
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
            Icon(Icons.Default.Error, contentDescription = null, tint = MaterialTheme.colorScheme.error)
            Spacer(modifier = Modifier.width(12.dp))
            Text(error, modifier = Modifier.weight(1f))
            IconButton(onClick = onDismiss) {
                Icon(Icons.Default.Close, contentDescription = "Dismiss")
            }
        }
    }
}

private fun getCategoryDisplayName(category: TagCategory): String {
    return when (category) {
        TagCategory.GENRE -> "Genres"
        TagCategory.THEME -> "Themes"
        TagCategory.CHARACTER -> "Characters"
        TagCategory.RATING -> "Content Rating"
        TagCategory.STATUS -> "Story Status"
        TagCategory.TRANSFORMATION -> "Transformation Types"
        TagCategory.GENERAL -> "General Tags"
    }
}
