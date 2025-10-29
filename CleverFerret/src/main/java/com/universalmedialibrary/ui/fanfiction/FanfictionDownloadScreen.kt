package com.universalmedialibrary.ui.fanfiction

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.CloudDownload
import androidx.compose.material.icons.filled.Info
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.fanfiction.models.StoryMetadata
import com.universalmedialibrary.ui.icons.PhosphorIcons

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FanfictionDownloadScreen(
    viewModel: FanfictionViewModel = hiltViewModel(),
    onNavigateBack: () -> Unit,
    onDownloadComplete: () -> Unit = {}
) {
    var url by remember { mutableStateOf("") }
    val downloadState by viewModel.downloadState.collectAsState()
    
    LaunchedEffect(downloadState) {
        if (downloadState is DownloadState.Success) {
            // Auto-clear after showing success briefly
            kotlinx.coroutines.delay(2000)
            viewModel.clearDownloadState()
            onDownloadComplete()
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Download Fanfiction") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(PhosphorIcons.ArrowLeft, "Back")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surface,
                    titleContentColor = MaterialTheme.colorScheme.onSurface
                )
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
                .verticalScroll(rememberScrollState()),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Info card
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Row(
                    modifier = Modifier.padding(16.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Icon(
                        Icons.Default.Info,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Column {
                        Text(
                            "Supported Sites",
                            style = MaterialTheme.typography.titleMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Spacer(Modifier.height(4.dp))
                        Text(
                            "• Archive of Our Own (AO3)\n" +
                            "• FanFiction.Net (FFN)\n" +
                            "• Royal Road",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }
            
            // URL input
            OutlinedTextField(
                value = url,
                onValueChange = { url = it },
                label = { Text("Story URL") },
                placeholder = { 
                    Text("https://archiveofourown.org/works/...") 
                },
                modifier = Modifier.fillMaxWidth(),
                singleLine = false,
                maxLines = 3,
                enabled = downloadState !is DownloadState.Downloading,
                leadingIcon = {
                    Icon(Icons.Default.Link, "URL") // Replace PhosphorIcons.Link
                }
            )
            
            // Download button
            Button(
                onClick = { viewModel.downloadStory(url) },
                modifier = Modifier.fillMaxWidth(),
                enabled = url.isNotBlank() && downloadState !is DownloadState.Downloading
            ) {
                Icon(Icons.Default.CloudDownload, "Download")
                Spacer(Modifier.width(8.dp))
                Text("Download Story")
            }
            
            // Example URLs
            if (downloadState is DownloadState.Idle) {
                Divider()
                
                Text(
                    "Example URLs",
                    style = MaterialTheme.typography.titleSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                ExampleUrlCard(
                    site = "AO3",
                    example = "https://archiveofourown.org/works/12345",
                    onClick = { url = it }
                )
                
                ExampleUrlCard(
                    site = "FFN",
                    example = "https://www.fanfiction.net/s/12345/1/",
                    onClick = { url = it }
                )
                
                ExampleUrlCard(
                    site = "Royal Road",
                    example = "https://www.royalroad.com/fiction/12345",
                    onClick = { url = it }
                )
            }
            
            Spacer(Modifier.height(8.dp))
            
            // Status display
            when (val state = downloadState) {
                is DownloadState.Downloading -> {
                    DownloadProgressCard(
                        current = state.current,
                        total = state.total,
                        message = state.message
                    )
                }
                is DownloadState.Success -> {
                    SuccessCard(metadata = state.metadata)
                }
                is DownloadState.Error -> {
                    ErrorCard(message = state.message)
                }
                else -> {}
            }
        }
    }
}

@Composable
private fun ExampleUrlCard(
    site: String,
    example: String,
    onClick: (String) -> Unit
) {
    OutlinedCard(
        onClick = { onClick(example) },
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(12.dp)
        ) {
            Text(
                site,
                style = MaterialTheme.typography.labelLarge,
                color = MaterialTheme.colorScheme.primary
            )
            Text(
                example,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun DownloadProgressCard(
    current: Int,
    total: Int,
    message: String
) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.secondaryContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "Downloading...",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onSecondaryContainer
            )
            
            Spacer(Modifier.height(8.dp))
            
            if (total > 0) {
                LinearProgressIndicator(
                    progress = current.toFloat() / total,
                    modifier = Modifier.fillMaxWidth()
                )
                
                Spacer(Modifier.height(4.dp))
                
                Text(
                    "Chapter $current of $total",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSecondaryContainer
                )
            } else {
                LinearProgressIndicator(
                    modifier = Modifier.fillMaxWidth()
                )
            }
            
            Spacer(Modifier.height(8.dp))
            
            Text(
                message,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSecondaryContainer
            )
        }
    }
}

@Composable
private fun SuccessCard(metadata: StoryMetadata) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.tertiaryContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "✅ Download Complete!",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onTertiaryContainer
            )
            
            Spacer(Modifier.height(8.dp))
            
            Text(
                metadata.title,
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onTertiaryContainer
            )
            
            Text(
                "by ${metadata.author}",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onTertiaryContainer
            )
            
            Spacer(Modifier.height(4.dp))
            
            Text(
                "${metadata.chapterCount} chapters • ${metadata.wordCount} words",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onTertiaryContainer
            )
        }
    }
}

@Composable
private fun ErrorCard(message: String) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "❌ Download Failed",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
            
            Spacer(Modifier.height(8.dp))
            
            Text(
                message,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
        }
    }
}
