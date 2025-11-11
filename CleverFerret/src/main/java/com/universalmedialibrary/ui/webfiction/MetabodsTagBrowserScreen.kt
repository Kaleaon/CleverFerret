package com.universalmedialibrary.ui.webfiction

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
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
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.services.webfiction.*

/**
 * Screen for browsing Metabods stories by tags
 * Features:
 * - Tag selection (multiple tags)
 * - Tag categories
 * - Story browsing by tags
 * - Advanced filtering
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MetabodsTagBrowserScreen(
    navController: NavController,
    viewModel: MetabodsTagBrowserViewModel = hiltViewModel()
) {
    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        val uiState by viewModel.uiState.collectAsState()

        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Text(
                            "Browse Metabods by Tags",
                            fontWeight = FontWeight.Medium
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = { navController.navigateUp() }) {
                            Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                        }
                    },
                    actions = {
                        // Filter button
                        IconButton(onClick = { viewModel.toggleFilters() }) {
                            Icon(
                                if (uiState.showFilters) Icons.Default.FilterListOff else Icons.Default.FilterList,
                                contentDescription = "Filters"
                            )
                        }
                        // Refresh tags
                        IconButton(onClick = { viewModel.refreshTags() }) {
                            Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = MaterialTheme.colorScheme.surface,
                        titleContentColor = MaterialTheme.colorScheme.onSurface
                    )
                )
            }
        ) { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
            ) {
                // Loading indicator
                if (uiState.isLoadingTags) {
                    LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
                }

                // Selected tags display
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

                // Tag categories
                AnimatedVisibility(visible = !uiState.showFilters) {
                    TagCategoriesSection(
                        tags = uiState.tags,
                        selectedTags = uiState.selectedTags,
                        expandedCategory = uiState.expandedCategory,
                        onTagToggle = { viewModel.toggleTag(it) },
                        onCategoryToggle = { viewModel.toggleCategory(it) }
                    )
                }

                Divider()

                // Browse/Search button
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

                // Story results
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    // Result count
                    val searchResult = uiState.searchResult
                    if (searchResult != null) {
                        item {
                            Text(
                                text = "Found ${searchResult.totalCount} stories",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Medium
                            )
                        }
                    }

                    // Stories
                    items(searchResult?.stories ?: emptyList()) { story ->
                        StoryResultCard(
                            story = story,
                            onStoryClick = { viewModel.downloadStory(story) },
                            onOpenUrl = { /* Navigate to story detail */ }
                        )
                    }

                    // Load more button
                    if (searchResult?.hasMore == true) {
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

                    // Error display
                    val error = uiState.error
                    if (error != null) {
                        item {
                            ErrorCard(
                                error = error,
                                onDismiss = { viewModel.clearError() }
                            )
                        }
                    }
                }
            }
        }

        uiState.pendingPinChallenge?.let { challenge ->
            PinAccessDialog(
                challenge = challenge,
                onDismiss = { viewModel.dismissPinChallenge() },
                onAccessGranted = { viewModel.onPinUnlockGranted() },
                verifyPin = { pin -> viewModel.verifyPin(pin) }
            )
        }
    }
}

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
private fun TagCategoriesSection(
    tags: List<WebFictionTag>,
    selectedTags: List<String>,
    expandedCategory: TagCategory?,
    onTagToggle: (String) -> Unit,
    onCategoryToggle: (TagCategory) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxWidth(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        // Group tags by category
        val tagsByCategory = tags.groupBy { it.category }

        tagsByCategory.forEach { (category, categoryTags) ->
            item {
                TagCategoryCard(
                    category = category,
                    tags = categoryTags,
                    selectedTags = selectedTags,
                    isExpanded = expandedCategory == category,
                    onToggleExpand = { onCategoryToggle(category) },
                    onTagToggle = onTagToggle
                )
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
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
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
                Column(modifier = Modifier.padding(top = 12.dp)) {
                    // Tag chips
                    FlowRow(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        tags.forEach { tag ->
                            FilterChip(
                                selected = tag.id in selectedTags,
                                onClick = { onTagToggle(tag.id) },
                                label = {
                                    Row(verticalAlignment = Alignment.CenterVertically) {
                                        Text(tag.displayName)
                                        if (tag.count > 0) {
                                            Spacer(modifier = Modifier.width(4.dp))
                                            Text(
                                                "(${tag.count})",
                                                style = MaterialTheme.typography.bodySmall
                                            )
                                        }
                                    }
                                },
                                leadingIcon = if (tag.id in selectedTags) {
                                    { Icon(Icons.Default.Check, contentDescription = null, modifier = Modifier.size(18.dp)) }
                                } else null
                            )
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
            .padding(16.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Text(
                text = "Advanced Filters",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            // Tag match mode
            Column {
                Text("Tag Matching:", style = MaterialTheme.typography.labelMedium)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
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

            // Sort by
            Column {
                Text("Sort By:", style = MaterialTheme.typography.labelMedium)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    FilterChip(
                        selected = criteria.sortBy == StorySortField.UPDATED,
                        onClick = { onCriteriaChange(criteria.copy(sortBy = StorySortField.UPDATED)) },
                        label = { Text("Updated") }
                    )
                    FilterChip(
                        selected = criteria.sortBy == StorySortField.WORD_COUNT,
                        onClick = { onCriteriaChange(criteria.copy(sortBy = StorySortField.WORD_COUNT)) },
                        label = { Text("Length") }
                    )
                    FilterChip(
                        selected = criteria.sortBy == StorySortField.TITLE,
                        onClick = { onCriteriaChange(criteria.copy(sortBy = StorySortField.TITLE)) },
                        label = { Text("Title") }
                    )
                }
            }

            // Sort order
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                FilterChip(
                    selected = criteria.sortOrder == SortOrder.DESCENDING,
                    onClick = { onCriteriaChange(criteria.copy(sortOrder = SortOrder.DESCENDING)) },
                    label = { Text("Newest First") }
                )
                FilterChip(
                    selected = criteria.sortOrder == SortOrder.ASCENDING,
                    onClick = { onCriteriaChange(criteria.copy(sortOrder = SortOrder.ASCENDING)) },
                    label = { Text("Oldest First") }
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
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier
                .clickable { onStoryClick() }
                .padding(16.dp)
        ) {
            // Title and author
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

            Spacer(modifier = Modifier.height(8.dp))

            // Description
            if (story.description?.isNotEmpty() == true) {
                Text(
                    text = story.description,
                    style = MaterialTheme.typography.bodySmall,
                    maxLines = 3,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Spacer(modifier = Modifier.height(8.dp))
            }

            // Metadata row
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                if (story.wordCount != null) {
                    MetadataChip(
                        icon = Icons.Default.Article,
                        text = "${story.wordCount / 1000}k words"
                    )
                }
                if (story.chapterCount != null) {
                    MetadataChip(
                        icon = Icons.Default.MenuBook,
                        text = "${story.chapterCount} chapters"
                    )
                }
                if (story.rating != null) {
                    MetadataChip(
                        icon = Icons.Default.Warning,
                        text = story.rating
                    )
                }
            }

            // Tags
            if (story.tags.isNotEmpty()) {
                Spacer(modifier = Modifier.height(8.dp))
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    items(story.tags.take(5)) { tag ->
                        AssistChip(
                            onClick = { },
                            label = { Text(tag, style = MaterialTheme.typography.labelSmall) }
                        )
                    }
                }
            }

            // Actions
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = 8.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = onStoryClick,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Download, contentDescription = null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Download")
                }
                OutlinedButton(
                    onClick = onOpenUrl,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.OpenInBrowser, contentDescription = null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("View")
                }
            }
        }
    }
}

@Composable
private fun MetadataChip(icon: androidx.compose.ui.graphics.vector.ImageVector, text: String) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        Icon(
            icon,
            contentDescription = null,
            modifier = Modifier.size(16.dp),
            tint = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(
            text = text,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
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
            Icon(
                Icons.Default.Error,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.width(12.dp))
            Text(
                text = error,
                modifier = Modifier.weight(1f),
                color = MaterialTheme.colorScheme.onErrorContainer
            )
            IconButton(onClick = onDismiss) {
                Icon(
                    Icons.Default.Close,
                    contentDescription = "Dismiss",
                    tint = MaterialTheme.colorScheme.onErrorContainer
                )
            }
        }
    }
}

@Composable
private fun FlowRow(
    modifier: Modifier = Modifier,
    horizontalArrangement: Arrangement.Horizontal = Arrangement.Start,
    verticalArrangement: Arrangement.Vertical = Arrangement.Top,
    content: @Composable () -> Unit
) {
    // Simple flow row implementation
    // In production, use ExperimentalLayoutApi FlowRow
    Column(modifier = modifier, verticalArrangement = verticalArrangement) {
        content()
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
