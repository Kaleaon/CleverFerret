package com.universalmedialibrary.ui.webfiction

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.services.webfiction.WebFictionService
import com.universalmedialibrary.services.webfiction.WebFictionSite
import com.universalmedialibrary.services.webfiction.WebFictionSiteType
import com.universalmedialibrary.services.webfiction.isAdultSite
import com.universalmedialibrary.services.webfiction.WebFictionStory
import com.universalmedialibrary.services.webfiction.StoryStatus
import com.universalmedialibrary.ui.components.UserFeedbackMessage
import com.universalmedialibrary.ui.components.UserFeedbackSeverity
import com.universalmedialibrary.ui.components.UserFeedbackSnackbarHost
import com.universalmedialibrary.ui.components.showUserFeedback
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun WebFictionManagerScreen(
    navController: NavController,
    viewModel: WebFictionManagerScreenViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val adultSitesEnabled by viewModel.adultSitesEnabled.collectAsState()
    val snackbarHostState = remember { SnackbarHostState() }
    var showAddDialog by remember { mutableStateOf(false) }
    var showRedditDialog by remember { mutableStateOf(false) }
    var showSiteInfoDialog by remember { mutableStateOf(false) }
    var selectedSite by remember { mutableStateOf<WebFictionSite?>(null) }

    LaunchedEffect(uiState.error, uiState.canRetry) {
        val error = uiState.error ?: return@LaunchedEffect
        val result = snackbarHostState.showUserFeedback(
            UserFeedbackMessage(
                title = "Web fiction action failed",
                body = error,
                severity = UserFeedbackSeverity.ERROR,
                actionLabel = if (uiState.canRetry) "Retry" else null
            )
        )
        if (result == SnackbarResult.ActionPerformed && uiState.canRetry) {
            viewModel.retryLastAction()
        } else {
            viewModel.clearError()
        }
    }

    LaunchedEffect(uiState.successMessage) {
        val success = uiState.successMessage ?: return@LaunchedEffect
        snackbarHostState.showUserFeedback(
            UserFeedbackMessage(
                title = "Completed",
                body = success,
                severity = UserFeedbackSeverity.SUCCESS,
                withDismissAction = false,
                duration = SnackbarDuration.Short
            )
        )
        viewModel.clearSuccessMessage()
    }

    Scaffold(
        snackbarHost = {
            UserFeedbackSnackbarHost(hostState = snackbarHostState)
        },
        topBar = {
            TopAppBar(
                    title = {
                        Text(
                            "Web Fiction Manager",
                            fontWeight = FontWeight.Medium
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = { navController.navigateUp() }) {
                            Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                        }
                    },
                    actions = {
                        IconButton(onClick = { navController.navigate("story_manager") }) {
                            Icon(Icons.AutoMirrored.Filled.List, contentDescription = "Story Manager")
                        }
                        IconButton(onClick = { showSiteInfoDialog = true }) {
                            Icon(Icons.Default.Info, contentDescription = "Supported Sites")
                        }
                        IconButton(onClick = { viewModel.checkAllForUpdates() }) {
                            Icon(Icons.Default.Refresh, contentDescription = "Check for Updates")
                        }
                    }
                )
            },
            floatingActionButton = {
                Column(
                    horizontalAlignment = Alignment.End,
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    FloatingActionButton(
                        onClick = { showAddDialog = true },
                        containerColor = MaterialTheme.colorScheme.secondaryContainer
                    ) {
                        Icon(Icons.Default.Link, contentDescription = "Add from URL")
                    }
                    
                    FloatingActionButton(
                        onClick = { showRedditDialog = true },
                        containerColor = MaterialTheme.colorScheme.primary
                    ) {
                        Icon(Icons.Default.Forum, contentDescription = "Add Reddit Series")
                    }
                }
            }
        ) { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
            ) {
                // Status bar
                if (uiState.isLoading || uiState.isCheckingUpdates) {
                    LinearProgressIndicator(
                        modifier = Modifier.fillMaxWidth(),
                        color = MaterialTheme.colorScheme.primary
                    )
                }

                if (!adultSitesEnabled) {
                    OutlinedCard(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp, vertical = 8.dp),
                        colors = CardDefaults.outlinedCardColors(
                            containerColor = MaterialTheme.colorScheme.surfaceVariant
                        )
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Default.Warning,
                                contentDescription = "Media image",
                                tint = MaterialTheme.colorScheme.tertiary
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = "Adult story sources are disabled.",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.SemiBold
                                )
                                Text(
                                    text = "Enable adult story sources in Parental Controls to browse or download mature catalogs.",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }
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
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = error.lineSequence().firstOrNull() ?: error,
                                    color = MaterialTheme.colorScheme.onErrorContainer
                                )
                                if ("Try:" in error) {
                                    Spacer(modifier = Modifier.height(6.dp))
                                    Text(
                                        text = error.substringAfter("Try:", missingDelimiterValue = "")
                                            .trim()
                                            .prependIndent("Try:\n"),
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onErrorContainer
                                    )
                                }
                            }
                            IconButton(onClick = { viewModel.clearError() }) {
                                Icon(Icons.Default.Close, contentDescription = "Dismiss")
                            }
                        }
                    }
                }

                uiState.successMessage?.let { success ->
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.secondaryContainer
                        )
                    ) {
                        Row(
                            modifier = Modifier.padding(16.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Default.CheckCircle,
                                contentDescription = "Success",
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Text(
                                text = success,
                                color = MaterialTheme.colorScheme.onSecondaryContainer,
                                modifier = Modifier.weight(1f)
                            )
                        }
                    }
                }

                // Update notifications
                if (uiState.storiesWithUpdates.isNotEmpty()) {
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.primaryContainer
                        )
                    ) {
                        Row(
                            modifier = Modifier.padding(16.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Default.NewReleases,
                                contentDescription = "Media image",
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = "Updates Available",
                                    fontWeight = FontWeight.Medium,
                                    color = MaterialTheme.colorScheme.onPrimaryContainer
                                )
                                Text(
                                    text = "${uiState.storiesWithUpdates.size} stories have new chapters",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onPrimaryContainer
                                )
                            }
                            TextButton(
                                onClick = { viewModel.downloadAllUpdates() }
                            ) {
                                Text("Download All")
                            }
                        }
                    }
                }

                // Stories list
                if (uiState.stories.isEmpty() && !uiState.isLoading) {
                    // Empty state
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(32.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center
                    ) {
                        Icon(
                            Icons.AutoMirrored.Filled.MenuBook,
                            contentDescription = "Media image",
                            modifier = Modifier.size(80.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            text = "No Web Fiction Stories",
                            style = MaterialTheme.typography.headlineSmall,
                            fontWeight = FontWeight.Medium
                        )
                        Text(
                            text = "Add stories from fanfiction sites to get started",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            modifier = Modifier.padding(top = 8.dp)
                        )
                        Spacer(modifier = Modifier.height(24.dp))
                        Button(
                            onClick = { showAddDialog = true }
                        ) {
                            Icon(Icons.Default.Add, contentDescription = "Add")
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Add Your First Story")
                        }
                    }
                } else {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        contentPadding = PaddingValues(16.dp),
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        items(uiState.stories) { story ->
                            WebFictionStoryCard(
                                story = story,
                                hasUpdates = story.id in uiState.storiesWithUpdates.map { it.id },
                                onStoryClick = {
                                    navController.navigate("webfiction_story/${story.id}")
                                },
                                onUpdateClick = {
                                    viewModel.checkForUpdates(story)
                                },
                                onDownloadClick = {
                                    viewModel.downloadStory(story)
                                }
                            )
                        }
                    }
                }
            }
        }

        if (showRedditDialog) {
            AddRedditSeriesDialog(
                onDismiss = { showRedditDialog = false },
                onAdd = { subreddit, seriesName, author ->
                    viewModel.downloadRedditSeriesAsEpub(seriesName, author, subreddit)
                    showRedditDialog = false
                }
            )
        }

        // Add story dialog
        if (showAddDialog) {
            AddWebFictionDialog(
                onDismiss = { showAddDialog = false },
                validateUrl = viewModel::validateSourceUrl,
                onAdd = { url ->
                    viewModel.addStoryFromUrl(url)
                    showAddDialog = false
                }
            )
        }

        // Supported sites dialog
        if (showSiteInfoDialog) {
            SupportedSitesDialog(
                adultSitesEnabled = adultSitesEnabled,
                onDismiss = { showSiteInfoDialog = false },
                onSiteClick = { site ->
                    selectedSite = site
                }
            )
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

@Composable
fun WebFictionStoryCard(
    story: WebFictionStory,
    hasUpdates: Boolean,
    onStoryClick: () -> Unit,
    onUpdateClick: () -> Unit,
    onDownloadClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onStoryClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier.padding(16.dp)
        ) {
            // Cover image
            AsyncImage(
                    
                model = story.coverUrl ?: "https://via.placeholder.com/80x120/2d3136/e5a00d?text=📖",
                contentDescription = "Story Cover",
                modifier = Modifier
                    .size(60.dp, 90.dp)
                    .clip(MaterialTheme.shapes.small)
                    .background(MaterialTheme.colorScheme.surfaceVariant),
                contentScale = ContentScale.Crop
            )

            Spacer(modifier = Modifier.width(16.dp))

            // Story info
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = story.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                        modifier = Modifier.weight(1f)
                    )

                    if (hasUpdates) {
                        Icon(
                            Icons.Default.NewReleases,
                            contentDescription = "Has Updates",
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }

                Spacer(modifier = Modifier.height(4.dp))

                Text(
                    text = story.author ?: "Unknown Author",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Spacer(modifier = Modifier.height(4.dp))

                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Site badge
                    story.site?.let { siteName ->
                        Surface(
                            color = MaterialTheme.colorScheme.primaryContainer,
                            shape = MaterialTheme.shapes.small
                        ) {
                            Text(
                                text = siteName,
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer,
                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                            )
                        }
                        Spacer(modifier = Modifier.width(8.dp))
                    }

                    // Chapter count
                    Text(
                        text = "${story.chapters.size}/${story.totalChapters} chapters",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    Spacer(modifier = Modifier.width(8.dp))

                    // Status
                    Text(
                        text = story.status.name,
                        style = MaterialTheme.typography.bodySmall,
                        color = when (story.status) {
                            StoryStatus.COMPLETED -> MaterialTheme.colorScheme.primary
                            StoryStatus.ONGOING -> Color(0xFF4CAF50)
                            StoryStatus.HIATUS -> Color(0xFFFF9800)
                            else -> MaterialTheme.colorScheme.onSurfaceVariant
                        }
                    )
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Tags
                if (story.tags.isNotEmpty()) {
                    Row {
                        story.tags.take(3).forEach { tag ->
                            Surface(
                                color = MaterialTheme.colorScheme.surfaceVariant,
                                shape = MaterialTheme.shapes.small
                            ) {
                                Text(
                                    text = tag,
                                    style = MaterialTheme.typography.labelSmall,
                                    modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp)
                                )
                            }
                            Spacer(modifier = Modifier.width(4.dp))
                        }
                    }
                }

                Spacer(modifier = Modifier.height(8.dp))

                // Action buttons
                Row {
                    OutlinedButton(
                        onClick = onUpdateClick,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(
                            Icons.Default.Refresh,
                            contentDescription = "Media image",
                            modifier = Modifier.size(16.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Update")
                    }

                    Spacer(modifier = Modifier.width(8.dp))

                    Button(
                        onClick = onDownloadClick,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(
                            Icons.Default.Download,
                            contentDescription = "Media image",
                            modifier = Modifier.size(16.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Download")
                    }
                }
            }
        }
    }
}

@Composable
fun AddRedditSeriesDialog(
    onDismiss: () -> Unit,
    onAdd: (subreddit: String, seriesName: String, author: String) -> Unit
) {
    var subreddit by remember { mutableStateOf("HFY") }
    var seriesName by remember { mutableStateOf("") }
    var author by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Reddit Series") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                OutlinedTextField(
                    value = subreddit,
                    onValueChange = { subreddit = it.trim() },
                    label = { Text("Subreddit (e.g. HFY)") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                OutlinedTextField(
                    value = seriesName,
                    onValueChange = { seriesName = it },
                    label = { Text("Series Name (Search Query)") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                OutlinedTextField(
                    value = author,
                    onValueChange = { author = it.trim() },
                    label = { Text("Author (Optional)") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                Text(
                    "Use exact series title for best results.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onAdd(subreddit, seriesName, author) },
                enabled = subreddit.isNotBlank() && seriesName.isNotBlank()
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
fun AddWebFictionDialog(
    onDismiss: () -> Unit,
    validateUrl: (String) -> Result<String>,
    onAdd: (String) -> Unit
) {
    var url by remember { mutableStateOf("") }
    var validationError by remember { mutableStateOf<String?>(null) }
    val normalizedUrl = remember(url, validationError) {
        if (validationError == null && url.isNotBlank()) validateUrl(url).getOrNull() else null
    }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(
                "Add Web Fiction Story",
                fontWeight = FontWeight.Medium
            )
        },
        text = {
            Column {
                Text(
                    text = "Enter the URL of a story from a supported fanfiction site:",
                    style = MaterialTheme.typography.bodyMedium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )

                OutlinedTextField(
                    value = url,
                    onValueChange = {
                        url = it
                        validationError = if (it.isBlank()) {
                            null
                        } else {
                            validateUrl(it).exceptionOrNull()?.message
                        }
                    },
                    label = { Text("Story URL") },
                    placeholder = { Text("https://archiveofourown.org/works/12345") },
                    modifier = Modifier.fillMaxWidth(),
                    isError = validationError != null,
                    supportingText = if (validationError != null) {
                        { Text(validationError ?: "") }
                    } else null,
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Uri)
                )

                Spacer(modifier = Modifier.height(8.dp))

                normalizedUrl?.let {
                    Text(
                        text = "Canonical URL: $it",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                }

                Text(
                    text = "Supported sites: AO3, FFN, Royal Road, WebNovel, Wattpad, and more",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onAdd(normalizedUrl ?: url) },
                enabled = url.isNotBlank() && validationError == null
            ) {
                Text("Add Story")
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
fun SupportedSitesDialog(
    adultSitesEnabled: Boolean,
    onDismiss: () -> Unit,
    onSiteClick: (WebFictionSite) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(
                "Supported Web Fiction Sites",
                fontWeight = FontWeight.Medium
            )
        },
        text = {
            LazyColumn(
                modifier = Modifier.height(400.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(WebFictionSiteType.values().filter { it != WebFictionSiteType.GENERIC }) { siteType ->
                    val enabled = adultSitesEnabled || !siteType.isAdultSite()
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .alpha(if (enabled) 1f else 0.6f)
                            .clickable(enabled = enabled) { onSiteClick(createWebFictionSiteFromType(siteType)) },
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.surfaceVariant
                        )
                    ) {
                        Row(
                            modifier = Modifier.padding(12.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Default.Language,
                                contentDescription = "Media image",
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Column {
                                Text(
                                    text = getSiteDisplayName(siteType),
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = getSiteBaseUrl(siteType),
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
                                                contentDescription = "Media image",
                                                tint = MaterialTheme.colorScheme.tertiary
                                            )
                                        },
                                        colors = AssistChipDefaults.assistChipColors(
                                            containerColor = MaterialTheme.colorScheme.secondaryContainer,
                                            labelColor = MaterialTheme.colorScheme.onSecondaryContainer
                                        )
                                    )
                                }
                                if (!enabled && siteType.isAdultSite()) {
                                    Spacer(modifier = Modifier.height(6.dp))
                                    Text(
                                        text = "Enable in Parental Controls to view.",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.error
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

// Helper functions for WebFictionSiteType
private fun getSiteDisplayName(siteType: WebFictionSiteType): String {
    return when (siteType) {
        WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> "Archive of Our Own"
        WebFictionSiteType.FANFICTION_NET -> "FanFiction.Net"
        WebFictionSiteType.ROYAL_ROAD -> "Royal Road"
        WebFictionSiteType.WEBNOVEL -> "WebNovel"
        WebFictionSiteType.WATTPAD -> "Wattpad"
        WebFictionSiteType.SCRIBBLE_HUB -> "Scribble Hub"
        WebFictionSiteType.SPACEBATTLES -> "SpaceBattles"
        WebFictionSiteType.SUFFICIENT_VELOCITY -> "Sufficient Velocity"
        WebFictionSiteType.QUESTIONABLE_QUESTING -> "Questionable Questing"
        WebFictionSiteType.FIMFICTION -> "FimFiction"
        WebFictionSiteType.LITEROTICA -> "Literotica"
        WebFictionSiteType.METABODS -> "Metabods"
        WebFictionSiteType.NIFTY -> "Nifty Archive"
        WebFictionSiteType.ADULT_FANFICTION -> "Adult-FanFiction"
        WebFictionSiteType.BDSM_LIBRARY -> "BDSM Library"
        WebFictionSiteType.MCSTORIES -> "MCStories"
        WebFictionSiteType.GENERIC -> "Generic Site"
    }
}

private fun getSiteBaseUrl(siteType: WebFictionSiteType): String {
    return when (siteType) {
        WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> "archiveofourown.org"
        WebFictionSiteType.FANFICTION_NET -> "fanfiction.net"
        WebFictionSiteType.ROYAL_ROAD -> "royalroad.com"
        WebFictionSiteType.WEBNOVEL -> "webnovel.com"
        WebFictionSiteType.WATTPAD -> "wattpad.com"
        WebFictionSiteType.SCRIBBLE_HUB -> "scribblehub.com"
        WebFictionSiteType.SPACEBATTLES -> "forums.spacebattles.com"
        WebFictionSiteType.SUFFICIENT_VELOCITY -> "forums.sufficientvelocity.com"
        WebFictionSiteType.QUESTIONABLE_QUESTING -> "forum.questionablequesting.com"
        WebFictionSiteType.FIMFICTION -> "fimfiction.net"
        WebFictionSiteType.LITEROTICA -> "literotica.com"
        WebFictionSiteType.METABODS -> "metabods.com"
        WebFictionSiteType.NIFTY -> "nifty.org"
        WebFictionSiteType.ADULT_FANFICTION -> "adult-fanfiction.org"
        WebFictionSiteType.BDSM_LIBRARY -> "bdsmlibrary.com"
        WebFictionSiteType.MCSTORIES -> "mcstories.com"
        WebFictionSiteType.GENERIC -> ""
    }
}

private fun createWebFictionSiteFromType(siteType: WebFictionSiteType): WebFictionSite {
    return WebFictionSite(
        id = siteType.name.lowercase(),
        name = getSiteDisplayName(siteType),
        baseUrl = getSiteBaseUrl(siteType),
        supportedTypes = listOf("fanfiction", "original")
    )
}
