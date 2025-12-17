package com.universalmedialibrary.ui.news

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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.news.NewsRecipe

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NewsScreen(
    onNavigateBack: () -> Unit,
    onOpenEpub: (String) -> Unit,
    viewModel: NewsViewModel = hiltViewModel()
) {
    val recipes by viewModel.recipes.collectAsState()
    val downloadStatus by viewModel.downloadStatus.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Newsstand") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            item {
                Text(
                    "Fetch news from around the web and convert them to EPUBs for offline reading.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            items(recipes) { recipe ->
                NewsRecipeCard(
                    recipe = recipe,
                    status = downloadStatus[recipe.id],
                    onDownload = { viewModel.downloadRecipe(recipe) },
                    onOpen = onOpenEpub
                )
            }
        }
    }
}

@Composable
fun NewsRecipeCard(
    recipe: NewsRecipe,
    status: DownloadStatus?,
    onDownload: () -> Unit,
    onOpen: (String) -> Unit
) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.Top
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = recipe.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = androidx.compose.ui.text.font.FontWeight.Bold
                    )
                    Text(
                        text = recipe.description,
                        style = MaterialTheme.typography.bodySmall,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                Icon(
                    Icons.Default.Newspaper,
                    contentDescription = null,
                    modifier = Modifier.padding(start = 8.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
            }

            Spacer(modifier = Modifier.height(12.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                // Feed count
                Text(
                    "${recipe.feeds.size} feeds",
                    style = MaterialTheme.typography.labelSmall
                )

                // Action Button
                when (status) {
                    is DownloadStatus.Downloading -> {
                        CircularProgressIndicator(modifier = Modifier.size(24.dp))
                    }
                    is DownloadStatus.Success -> {
                        Button(onClick = { onOpen(status.file.absolutePath) }) {
                            Icon(Icons.AutoMirrored.Filled.MenuBook, null, modifier = Modifier.size(16.dp))
                            Spacer(Modifier.width(8.dp))
                            Text("Read")
                        }
                    }
                    is DownloadStatus.Error -> {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Text("Failed", color = MaterialTheme.colorScheme.error, style = MaterialTheme.typography.labelSmall)
                            Spacer(Modifier.width(8.dp))
                            IconButton(onClick = onDownload) {
                                Icon(Icons.Default.Refresh, "Retry")
                            }
                        }
                    }
                    null -> {
                        Button(onClick = onDownload) {
                            Icon(Icons.Default.Download, null, modifier = Modifier.size(16.dp))
                            Spacer(Modifier.width(8.dp))
                            Text("Download")
                        }
                    }
                }
            }
        }
    }
}
