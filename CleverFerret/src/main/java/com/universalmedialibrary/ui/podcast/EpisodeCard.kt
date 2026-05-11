package com.universalmedialibrary.ui.podcast

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.services.podcast.Podcast
import com.universalmedialibrary.services.podcast.PodcastEpisode
import com.universalmedialibrary.services.podcast.PodcastSearchResult
import com.universalmedialibrary.services.podcast.DownloadStatus
import com.universalmedialibrary.ui.components.ConfirmationDialog
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.MetallicFAB
import com.universalmedialibrary.ui.theme.MetallicTopAppBar
import kotlinx.coroutines.flow.collectLatest
import java.text.SimpleDateFormat
import java.util.*

@Composable
fun EpisodeCard(
    episode: PodcastEpisode,
    downloadStatus: DownloadStatus?,
    onClick: () -> Unit,
    onDownloadClick: () -> Unit,
    onRetryClick: () -> Unit,
    onPlayClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Play button
            Surface(
                modifier = Modifier.size(48.dp),
                shape = CircleShape,
                color = MaterialTheme.colorScheme.primary
            ) {
                IconButton(onClick = onPlayClick) {
                    Icon(
                        Icons.Default.PlayArrow,
                        contentDescription = "Play",
                        tint = Color.Black
                    )
                }
            }

            Spacer(modifier = Modifier.width(12.dp))

            // Episode info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = episode.title,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                Spacer(modifier = Modifier.height(4.dp))

                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = formatDuration(episode.duration),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    Spacer(modifier = Modifier.width(8.dp))

                    Text(
                        text = SimpleDateFormat("MMM dd", Locale.getDefault()).format(episode.publishDate),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    if (episode.isDownloaded) {
                        Spacer(modifier = Modifier.width(8.dp))
                        Icon(
                            Icons.Default.DownloadDone,
                            contentDescription = "Downloaded",
                            modifier = Modifier.size(16.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }

                Spacer(modifier = Modifier.height(4.dp))

                val readinessText = if (episode.playbackReady) "Playback ready" else "Not ready"
                val readinessColor = if (episode.playbackReady) {
                    MaterialTheme.colorScheme.primary
                } else {
                    MaterialTheme.colorScheme.error
                }
                Text(
                    text = readinessText,
                    style = MaterialTheme.typography.labelSmall,
                    color = readinessColor
                )
                episode.playbackFailureReason?.let { reason ->
                    val warningColor = if (episode.recoveryActionLabel != null) {
                        MaterialTheme.colorScheme.tertiary
                    } else {
                        MaterialTheme.colorScheme.error
                    }
                    Text(
                        text = reason,
                        style = MaterialTheme.typography.bodySmall,
                        color = warningColor,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }

            when (downloadStatus) {
                is DownloadStatus.Downloading -> {
                    CircularProgressIndicator(
                        progress = { downloadStatus.progress },
                        modifier = Modifier.size(24.dp),
                        strokeWidth = 2.dp
                    )
                }
                is DownloadStatus.Queued -> {
                    Text(
                        text = "Q${downloadStatus.position}",
                        style = MaterialTheme.typography.labelSmall
                    )
                }
                is DownloadStatus.Retrying -> {
                    Text(
                        text = "Retry ${downloadStatus.attempt}/${downloadStatus.maxRetries}",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.error
                    )
                }
                is DownloadStatus.Failed -> {
                    IconButton(onClick = onRetryClick) {
                        Icon(
                            Icons.Default.Refresh,
                            contentDescription = "Retry download",
                            tint = MaterialTheme.colorScheme.error
                        )
                    }
                }
                else -> if (episode.recoveryActionLabel != null) {
                    Button(onClick = onRetryClick) {
                        Icon(
                            Icons.Default.Refresh,
                            contentDescription = episode.recoveryActionLabel
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(episode.recoveryActionLabel)
                    }
                } else if (!episode.isDownloaded) {
                    IconButton(onClick = onDownloadClick) {
                        Icon(
                            Icons.Default.Download,
                            contentDescription = "Download"
                        )
                    }
                }
            }
        }
    }
}
