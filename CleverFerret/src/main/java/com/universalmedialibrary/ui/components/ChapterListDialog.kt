package com.universalmedialibrary.ui.components

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog

/**
 * Dialog for displaying and navigating book/audiobook chapters
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ChapterListDialog(
    chapters: List<Chapter>,
    currentChapter: Int,
    onChapterSelect: (Int) -> Unit,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = modifier
                .fillMaxWidth()
                .heightIn(max = 600.dp),
            shape = MaterialTheme.shapes.large
        ) {
            Column(
                modifier = Modifier.fillMaxWidth()
            ) {
                // Header
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Chapters",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold
                    )
                    
                    IconButton(onClick = onDismiss) {
                        Icon(
                            imageVector = Icons.Default.Close,
                            contentDescription = "Close"
                        )
                    }
                }
                
                Divider()
                
                // Chapter list
                LazyColumn(
                    modifier = Modifier.fillMaxWidth(),
                    contentPadding = PaddingValues(vertical = 8.dp)
                ) {
                    itemsIndexed(chapters) { index, chapter ->
                        ChapterListItem(
                            chapter = chapter,
                            isCurrentChapter = index == currentChapter,
                            onChapterClick = {
                                onChapterSelect(index)
                                onDismiss()
                            }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun ChapterListItem(
    chapter: Chapter,
    isCurrentChapter: Boolean,
    onChapterClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val backgroundColor = if (isCurrentChapter) {
        MaterialTheme.colorScheme.primaryContainer
    } else {
        MaterialTheme.colorScheme.surface
    }
    
    val textColor = if (isCurrentChapter) {
        MaterialTheme.colorScheme.onPrimaryContainer
    } else {
        MaterialTheme.colorScheme.onSurface
    }
    
    Surface(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onChapterClick),
        color = backgroundColor
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Current chapter indicator
            if (isCurrentChapter) {
                Icon(
                    imageVector = Icons.Default.PlayArrow,
                    contentDescription = "Current chapter",
                    tint = textColor,
                    modifier = Modifier.size(20.dp)
                )
                Spacer(modifier = Modifier.width(12.dp))
            } else {
                Spacer(modifier = Modifier.width(32.dp))
            }
            
            // Chapter info
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = chapter.title,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = if (isCurrentChapter) FontWeight.Bold else FontWeight.Normal,
                    color = textColor
                )
                
                if (chapter.subtitle != null) {
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = chapter.subtitle,
                        style = MaterialTheme.typography.bodySmall,
                        color = textColor.copy(alpha = 0.7f)
                    )
                }
                
                // Show page/time info
                if (chapter.startPage != null) {
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = "Page ${chapter.startPage}",
                        style = MaterialTheme.typography.bodySmall,
                        color = textColor.copy(alpha = 0.6f)
                    )
                } else if (chapter.duration != null) {
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = formatDuration(chapter.duration),
                        style = MaterialTheme.typography.bodySmall,
                        color = textColor.copy(alpha = 0.6f)
                    )
                }
            }
            
            // Progress indicator
            if (chapter.progress != null && chapter.progress > 0) {
                Spacer(modifier = Modifier.width(8.dp))
                CircularProgressIndicator(
                    progress = chapter.progress / 100f,
                    modifier = Modifier.size(24.dp),
                    strokeWidth = 2.dp,
                    color = textColor
                )
            }
        }
    }
}

/**
 * Data class representing a chapter
 */
data class Chapter(
    val index: Int,
    val title: String,
    val subtitle: String? = null,
    val startPage: Int? = null,
    val duration: Long? = null,
    val progress: Float? = null
)

/**
 * Format duration in milliseconds to readable string
 */
private fun formatDuration(millis: Long): String {
    val seconds = millis / 1000
    val minutes = seconds / 60
    val hours = minutes / 60
    
    return when {
        hours > 0 -> String.format("%d:%02d:%02d", hours, minutes % 60, seconds % 60)
        minutes > 0 -> String.format("%d:%02d", minutes, seconds % 60)
        else -> String.format("0:%02d", seconds)
    }
}
