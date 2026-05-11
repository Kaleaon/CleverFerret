package com.universalmedialibrary.ui.music

import android.text.format.DateUtils
import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.theme.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun PlaylistCard(
    summary: PlaylistSummary,
    expandedMenuId: Long?,
    onExpandMenu: (Long?) -> Unit,
    onDismissMenu: () -> Unit,
    onPlay: () -> Unit,
    onShuffle: () -> Unit,
    onQueue: (Boolean) -> Unit,
    onRename: () -> Unit,
    onDelete: () -> Unit
) {
    val updatedText = remember(summary.updatedAt) {
        DateUtils.getRelativeTimeSpanString(
            summary.updatedAt,
            System.currentTimeMillis(),
            DateUtils.MINUTE_IN_MILLIS
        ).toString()
    }

    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(16.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = summary.name,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    val description = summary.description?.takeIf { it.isNotBlank() }
                    if (description != null) {
                        Text(
                            text = description,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 2,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                }

                Row(verticalAlignment = Alignment.CenterVertically) {
                    IconButton(onClick = onPlay) {
                        Icon(Icons.Default.PlayArrow, contentDescription = "Play playlist")
                    }
                    IconButton(onClick = onShuffle) {
                        Icon(Icons.Default.Shuffle, contentDescription = "Shuffle playlist")
                    }
                    Box {
                        IconButton(onClick = { onExpandMenu(summary.id) }) {
                            Icon(Icons.Default.MoreVert, contentDescription = "Playlist actions")
                        }
                        DropdownMenu(
                            expanded = expandedMenuId == summary.id,
                            onDismissRequest = onDismissMenu
                        ) {
                            DropdownMenuItem(
                                text = { Text("Add to Queue") },
                                onClick = {
                                    onQueue(false)
                                    onDismissMenu()
                                },
                                leadingIcon = { Icon(Icons.Default.QueueMusic, contentDescription = "Music queue") }
                            )
                            DropdownMenuItem(
                                text = { Text("Play Next") },
                                onClick = {
                                    onQueue(true)
                                    onDismissMenu()
                                },
                                leadingIcon = { Icon(Icons.Default.SkipNext, contentDescription = "Play next") }
                            )
                            DropdownMenuItem(
                                text = { Text("Rename") },
                                onClick = onRename,
                                leadingIcon = { Icon(Icons.Default.Edit, contentDescription = "Rename") }
                            )
                            DropdownMenuItem(
                                text = { Text("Delete") },
                                onClick = onDelete,
                                leadingIcon = { Icon(Icons.Default.Delete, contentDescription = "Delete") }
                            )
                        }
                    }
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            Row(
                horizontalArrangement = Arrangement.spacedBy(16.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                AssistChip(
                    onClick = {},
                    leadingIcon = {
                        Icon(
                            Icons.Default.MusicNote,
                            contentDescription = "Track count",
                            modifier = Modifier.size(16.dp)
                        )
                    },
                    label = { Text("${summary.trackCount} tracks") }
                )
                AssistChip(
                    onClick = {},
                    leadingIcon = {
                        Icon(
                            Icons.Default.AccessTime,
                            contentDescription = "Last updated",
                            modifier = Modifier.size(16.dp)
                        )
                    },
                    label = { Text("Updated $updatedText") }
                )
            }
        }
    }
}
