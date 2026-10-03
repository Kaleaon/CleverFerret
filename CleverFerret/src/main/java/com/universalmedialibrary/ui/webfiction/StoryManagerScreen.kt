package com.universalmedialibrary.ui.webfiction

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.services.contentcreation.StoryUpdateManager
import dagger.hilt.EntryPoint
import dagger.hilt.InstallIn
import dagger.hilt.android.EntryPointAccessors
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.launch

@EntryPoint
@InstallIn(SingletonComponent::class)
interface StoryManagerEntryPoint {
    fun storyUpdateManager(): StoryUpdateManager
}

@Composable
fun StoryManagerRoute(onBack: () -> Unit) {
    val context = LocalContext.current
    val storyManager = remember(context) {
        EntryPointAccessors.fromApplication(
            context.applicationContext,
            StoryManagerEntryPoint::class.java
        ).storyUpdateManager()
    }

    StoryManagerScreen(
        storyManager = storyManager,
        onBack = onBack
    )
}

/**
 * Story Manager Screen
 * Displays all downloaded stories with update management
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StoryManagerScreen(
    storyManager: StoryUpdateManager,
    onBack: () -> Unit
) {
    val scope = rememberCoroutineScope()
    var stories by remember { mutableStateOf<List<DownloadedStory>>(emptyList()) }
    var isLoading by remember { mutableStateOf(false) }
    var errorMessage by remember { mutableStateOf<String?>(null) }

    LaunchedEffect(Unit) {
        scope.launch {
            storyManager.getAllStoriesFlow().collect {
                stories = it
            }
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Story Manager") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = {
                        scope.launch {
                            isLoading = true
                            try {
                                val needUpdate = storyManager.getStoriesNeedingUpdateCheck()
                                errorMessage = "Checking ${needUpdate.size} stories for updates..."
                            } catch (e: Exception) {
                                errorMessage = "Error: ${e.message}"
                            } finally {
                                isLoading = false
                            }
                        }
                    }) {
                        Icon(Icons.Default.Refresh, "Check for Updates")
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
            if (errorMessage != null) {
                Surface(
                    modifier = Modifier.fillMaxWidth(),
                    color = MaterialTheme.colorScheme.errorContainer
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = errorMessage!!,
                            modifier = Modifier.weight(1f),
                            color = MaterialTheme.colorScheme.onErrorContainer
                        )
                        IconButton(onClick = { errorMessage = null }) {
                            Icon(Icons.Default.Close, "Dismiss")
                        }
                    }
                }
            }

            if (isLoading) {
                LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
            }

            if (stories.isEmpty()) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Icon(
                            Icons.AutoMirrored.Filled.MenuBook,
                            contentDescription = "Media image",
                            modifier = Modifier.size(64.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            "No downloaded stories",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Text(
                            "Use the Web Fiction Manager to download stories",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(
                        items = stories,
                        key = { story -> story.id }
                    ) { story ->
                        StoryCard(
                            story = story,
                            onCheckUpdates = {
                                scope.launch {
                                    isLoading = true
                                    try {
                                        val tracked = story.toTrackedStory()
                                        val result = storyManager.checkForUpdates(tracked)
                                        errorMessage = if (result.hasUpdates) {
                                            "${story.title}: ${result.newChapters} new chapters available!"
                                        } else {
                                            "${story.title}: Up to date"
                                        }
                                    } catch (e: Exception) {
                                        errorMessage = "Error: ${e.message}"
                                    } finally {
                                        isLoading = false
                                    }
                                }
                            },
                            onMarkComplete = {
                                scope.launch {
                                    storyManager.markStoryComplete(story.id)
                                    errorMessage = "${story.title} marked as complete"
                                }
                            }
                        )
                    }
                }
            }
        }
    }
}

@Composable
fun StoryCard(
    story: DownloadedStory,
    onCheckUpdates: () -> Unit,
    onMarkComplete: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.Top
            ) {
                Column(modifier = Modifier.weight(1f)) {
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
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = "${story.totalChapters} chapters • ${story.site}",
                        style = MaterialTheme.typography.bodySmall
                    )
                }

                if (story.hasUpdates) {
                    Badge {
                        Text("Update Available")
                    }
                }
            }

            if (story.isCompleted) {
                Spacer(modifier = Modifier.height(8.dp))
                AssistChip(
                    onClick = { },
                    label = { Text("Completed") },
                    leadingIcon = {
                        Icon(Icons.Default.CheckCircle, null, modifier = Modifier.size(16.dp))
                    }
                )
            }

            Spacer(modifier = Modifier.height(8.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(
                    onClick = onCheckUpdates,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Refresh, null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Check Updates")
                }

                if (!story.isCompleted) {
                    OutlinedButton(
                        onClick = onMarkComplete,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Check, null, modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Mark Complete")
                    }
                }
            }

            if (story.lastError != null) {
                Spacer(modifier = Modifier.height(8.dp))
                Surface(
                    color = MaterialTheme.colorScheme.errorContainer,
                    shape = MaterialTheme.shapes.small
                ) {
                    Text(
                        text = "Error: ${story.lastError}",
                        modifier = Modifier.padding(8.dp),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onErrorContainer
                    )
                }
            }
        }
    }
}

private fun DownloadedStory.toTrackedStory(): StoryUpdateManager.TrackedStory {
    return StoryUpdateManager.TrackedStory(
        id = id,
        url = url,
        title = title,
        author = author,
        totalChapters = totalChapters,
        lastKnownChapters = lastKnownChapters,
        epubFilePath = epubFilePath
    )
}
