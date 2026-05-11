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
                                Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
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
                    
                    PrimaryTabRow(
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
                                            HubTabs.LIBRARY -> Icons.AutoMirrored.Filled.LibraryBooks
                                            else -> Icons.Default.Download
                                        },
                                        contentDescription = "Media image"
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
                        adultSitesEnabled = adultSitesEnabled,
                        navController = navController
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
                contentDescription = "Media image",
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
