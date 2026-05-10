package com.universalmedialibrary.ui.webfiction

import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.automirrored.filled.LibraryBooks
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
@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun UnifiedContent(
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
                    
                    items(
                        items = result.stories,
                        key = { story -> story.id }
                    ) { story ->
                        StoryCard(
                            story = story,
                            onDownload = { 
                                story.url?.let { downloadViewModel.downloadFromUrl(it) }
                            },
                            isDownloading = downloadState.isLoading && downloadState.url == story.url
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
