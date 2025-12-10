package com.universalmedialibrary.ui.webfiction

import android.text.format.DateFormat
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.OpenInBrowser
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.AssistChip
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.webfiction.DownloadStatus
import com.universalmedialibrary.services.webfiction.StoryStatus
import com.universalmedialibrary.services.webfiction.WebFictionChapter
import com.universalmedialibrary.services.webfiction.WebFictionStory
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import java.text.NumberFormat
import java.util.Date
import java.util.Locale

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun WebFictionStoryDetailScreen(
    story: WebFictionStory,
    onBack: () -> Unit,
    onDownload: () -> Unit,
    onRefresh: () -> Unit,
    onRemove: () -> Unit,
    onOpenInBrowser: (String) -> Unit
) {
    var showDeleteDialog by remember { mutableStateOf(false) }

    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        Scaffold(
            topBar = {
                TopAppBar(
                    title = { Text(story.title) },
                    navigationIcon = {
                        IconButton(onClick = onBack) {
                            Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                        }
                    },
                    actions = {
                        IconButton(onClick = { onOpenInBrowser(story.url) }) {
                            Icon(Icons.Default.OpenInBrowser, contentDescription = "Open in Browser")
                        }
                        IconButton(onClick = onDownload) {
                            Icon(Icons.Default.Download, contentDescription = "Download")
                        }
                        IconButton(onClick = onRefresh) {
                            Icon(Icons.Default.Refresh, contentDescription = "Check for Updates")
                        }
                        IconButton(onClick = { showDeleteDialog = true }) {
                            Icon(Icons.Default.Delete, contentDescription = "Remove Story")
                        }
                    }
                )
            }
        ) { padding ->
            StoryDetailContent(
                story = story,
                contentPadding = padding,
                onDownload = onDownload,
                onRefresh = onRefresh,
                onOpenInBrowser = onOpenInBrowser,
                onRemove = { showDeleteDialog = true }
            )
        }

        if (showDeleteDialog) {
            AlertDialog(
                onDismissRequest = { showDeleteDialog = false },
                title = { Text("Remove Story") },
                text = { Text("Are you sure you want to remove \"${story.title}\" from the manager?") },
                confirmButton = {
                    TextButton(onClick = {
                        showDeleteDialog = false
                        onRemove()
                    }) {
                        Text("Remove")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showDeleteDialog = false }) {
                        Text("Cancel")
                    }
                }
            )
        }
    }
}

@Composable
private fun StoryDetailContent(
    story: WebFictionStory,
    contentPadding: PaddingValues,
    onDownload: () -> Unit,
    onRefresh: () -> Unit,
    onOpenInBrowser: (String) -> Unit,
    onRemove: () -> Unit
) {
    val context = LocalContext.current
    val numberFormatter = remember { NumberFormat.getIntegerInstance(Locale.getDefault()) }
    val formattedWordCount = remember(story.wordCount) {
        story.wordCount?.let { numberFormatter.format(it) }
    }
    val formattedChapters = remember(story.chapterCount, story.totalChapters) {
        story.totalChapters ?: story.chapterCount
    }
    val lastUpdated = remember(context, story.lastUpdated, story.updatedAt) {
        val timestamp = story.lastUpdated ?: story.updatedAt
        timestamp?.let { DateFormat.getMediumDateFormat(context).format(Date(it)) }
    }

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(contentPadding)
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            StorySummaryCard(story = story)
        }

        item {
            StoryStatsRow(
                story = story,
                formattedWordCount = formattedWordCount,
                formattedChapters = formattedChapters,
                lastUpdated = lastUpdated
            )
        }

        if (story.tags.isNotEmpty()) {
            item {
                StoryTagsSection(story.tags)
            }
        }

        item {
            StoryActionsSection(
                onDownload = onDownload,
                onRefresh = onRefresh,
                onOpenInBrowser = { onOpenInBrowser(story.url) },
                onRemove = onRemove,
                downloadStatus = story.downloadStatus
            )
        }

        item {
            StoryDescriptionSection(
                description = story.description,
                warnings = story.warnings
            )
        }

        if (story.chapters.isNotEmpty()) {
            item {
                StoryChaptersSection(
                    chapters = story.chapters
                )
            }
        }
    }
}

@Composable
private fun StorySummaryCard(story: WebFictionStory) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = story.title,
                style = MaterialTheme.typography.headlineSmall,
                color = MaterialTheme.colorScheme.onPrimaryContainer
            )

            story.author?.let {
                Text(
                    text = "by $it",
                    style = MaterialTheme.typography.titleMedium,
                    color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.85f)
                )
            }

            Row(
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                story.site?.let { site ->
                    Surface(
                        color = MaterialTheme.colorScheme.secondaryContainer,
                        shape = MaterialTheme.shapes.small
                    ) {
                        Text(
                            text = site,
                            style = MaterialTheme.typography.labelMedium,
                            color = MaterialTheme.colorScheme.onSecondaryContainer,
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                        )
                    }
                }

                story.rating?.let { rating ->
                    Surface(
                        color = MaterialTheme.colorScheme.tertiaryContainer,
                        shape = MaterialTheme.shapes.small
                    ) {
                        Text(
                            text = rating,
                            style = MaterialTheme.typography.labelMedium,
                            color = MaterialTheme.colorScheme.onTertiaryContainer,
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                        )
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun StoryStatsRow(
    story: WebFictionStory,
    formattedWordCount: String?,
    formattedChapters: Int?,
    lastUpdated: String?
) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = "Story Details",
            style = MaterialTheme.typography.titleMedium
        )

        FlowRow(
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            StoryStatChip(
                label = "Status",
                value = story.status.name.lowercase().replaceFirstChar { it.titlecase(Locale.getDefault()) },
                color = statusColor(story.status)
            )

            formattedWordCount?.let {
                StoryStatChip(label = "Words", value = it)
            }

            formattedChapters?.let {
                StoryStatChip(label = "Chapters", value = it.toString())
            }

            story.language?.takeIf { it.isNotBlank() }?.let {
                StoryStatChip(label = "Language", value = it)
            }

            story.genre?.takeIf { it.isNotBlank() }?.let {
                StoryStatChip(label = "Genre", value = it)
            }

            story.downloadStatus.let {
                StoryStatChip(
                    label = "Download",
                    value = it.name.lowercase().replaceFirstChar { c -> c.titlecase(Locale.getDefault()) },
                    color = downloadStatusColor(it)
                )
            }

            lastUpdated?.let {
                StoryStatChip(label = "Updated", value = it)
            }
        }
    }
}

@Composable
private fun StoryStatChip(
    label: String,
    value: String,
    color: androidx.compose.ui.graphics.Color = MaterialTheme.colorScheme.primary
) {
    Surface(
        color = color.copy(alpha = 0.1f),
        shape = MaterialTheme.shapes.small
    ) {
        Column(
            modifier = Modifier
                .padding(horizontal = 12.dp, vertical = 8.dp)
        ) {
            Text(
                text = label,
                style = MaterialTheme.typography.labelSmall,
                color = color
            )
            Text(
                text = value,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurface
            )
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun StoryTagsSection(tags: List<String>) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = "Tags",
            style = MaterialTheme.typography.titleMedium
        )

        FlowRow(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            tags.forEach { tag ->
                AssistChip(
                    onClick = {},
                    label = { Text(tag) }
                )
            }
        }
    }
}

@Composable
private fun StoryActionsSection(
    onDownload: () -> Unit,
    onRefresh: () -> Unit,
    onOpenInBrowser: () -> Unit,
    onRemove: () -> Unit,
    downloadStatus: DownloadStatus
) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = "Actions",
            style = MaterialTheme.typography.titleMedium
        )

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Button(
                onClick = onDownload,
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = if (downloadStatus == DownloadStatus.DOWNLOADED) "Redownload" else "Download"
                )
            }

            OutlinedButton(
                onClick = onRefresh,
                modifier = Modifier.weight(1f)
            ) {
                Text("Check Updates")
            }
        }

        OutlinedButton(
            onClick = onOpenInBrowser,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Open in Browser")
        }

        TextButton(
            onClick = onRemove,
            modifier = Modifier.align(Alignment.End)
        ) {
            Text("Remove from Manager")
        }
    }
}

@Composable
private fun StoryDescriptionSection(
    description: String?,
    warnings: List<String>
) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = "Synopsis",
            style = MaterialTheme.typography.titleMedium
        )

        if (!description.isNullOrBlank()) {
            Text(
                text = description,
                style = MaterialTheme.typography.bodyMedium
            )
        } else {
            Text(
                text = "No description available.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }

        if (warnings.isNotEmpty()) {
            Text(
                text = "Content Warnings",
                style = MaterialTheme.typography.titleSmall
            )
            warnings.forEach { warning ->
                Text(
                    text = "• $warning",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

@Composable
private fun StoryChaptersSection(
    chapters: List<WebFictionChapter>
) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = "Recent Chapters",
            style = MaterialTheme.typography.titleMedium
        )

        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .height(220.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp),
            contentPadding = PaddingValues(4.dp)
        ) {
            items(chapters.take(25)) { chapter ->
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Column(
                        modifier = Modifier.padding(12.dp),
                        verticalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        Text(
                            text = "Chapter ${chapter.number}" + (chapter.title?.let { ": $it" } ?: ""),
                            style = MaterialTheme.typography.titleSmall
                        )
                        chapter.wordCount?.let {
                            Text(
                                text = "${NumberFormat.getIntegerInstance().format(it)} words",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun statusColor(status: StoryStatus): androidx.compose.ui.graphics.Color {
    return when (status) {
        StoryStatus.COMPLETED -> androidx.compose.ui.graphics.Color(0xFF2E7D32)
        StoryStatus.ONGOING -> androidx.compose.ui.graphics.Color(0xFF1565C0)
        StoryStatus.HIATUS -> androidx.compose.ui.graphics.Color(0xFFF9A825)
        StoryStatus.CANCELLED -> androidx.compose.ui.graphics.Color(0xFFC62828)
        StoryStatus.UNKNOWN -> MaterialTheme.colorScheme.primary
    }
}

@Composable
private fun downloadStatusColor(status: DownloadStatus): androidx.compose.ui.graphics.Color {
    return when (status) {
        DownloadStatus.DOWNLOADED -> androidx.compose.ui.graphics.Color(0xFF2E7D32)
        DownloadStatus.DOWNLOADING -> androidx.compose.ui.graphics.Color(0xFF1565C0)
        DownloadStatus.OUTDATED -> androidx.compose.ui.graphics.Color(0xFFF9A825)
        DownloadStatus.FAILED -> androidx.compose.ui.graphics.Color(0xFFC62828)
        DownloadStatus.NOT_DOWNLOADED -> MaterialTheme.colorScheme.primary
    }
}

@Composable
fun WebFictionStoryNotFound(onBack: () -> Unit) {
    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        Surface(modifier = Modifier.fillMaxSize()) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(24.dp),
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = "Story not found",
                    style = MaterialTheme.typography.headlineSmall
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    text = "The selected story is no longer in the manager.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Spacer(modifier = Modifier.height(24.dp))
                Button(onClick = onBack) {
                    Text("Go Back")
                }
            }
        }
    }
}
