package com.universalmedialibrary.ui.components

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Chapter
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Chapter List Dialog
 * 
 * Displays a list of chapters for books/audiobooks, allowing users to jump to specific chapters.
 *
 * @param chapters List of chapter titles
 * @param currentChapter Currently playing/reading chapter index
 * @param onChapterSelect Callback when a chapter is selected
 * @param onDismiss Callback when dialog is dismissed
 */
@Composable
fun ChapterListDialog(
    chapters: List<String>,
    currentChapter: Int,
    onChapterSelect: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        icon = {
            Icon(
                Icons.Default.Chapter,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary
            )
        },
        title = {
            Text(
                "Chapters",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold
            )
        },
        text = {
            LazyColumn(
                modifier = Modifier.fillMaxWidth(),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                itemsIndexed(chapters) { index, chapter ->
                    ListItem(
                        headlineContent = {
                            Text(
                                chapter,
                                fontWeight = if (index == currentChapter) FontWeight.Bold else FontWeight.Normal
                            )
                        },
                        supportingContent = {
                            Text("Chapter ${index + 1}")
                        },
                        leadingContent = {
                            if (index == currentChapter) {
                                Icon(
                                    Icons.Default.PlayArrow,
                                    contentDescription = "Currently playing",
                                    tint = MaterialTheme.colorScheme.primary
                                )
                            } else {
                                Icon(
                                    Icons.Default.Chapter,
                                    contentDescription = null,
                                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        },
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable {
                                onChapterSelect(index)
                                onDismiss()
                            }
                    )
                    if (index < chapters.size - 1) {
                        HorizontalDivider(
                            modifier = Modifier.padding(horizontal = 16.dp),
                            color = MaterialTheme.colorScheme.outlineVariant
                        )
                    }
                }
            }
        },
        confirmButton = {},
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}

/**
 * Simplified Chapter List Dialog that accepts chapter count only
 */
@Composable
fun ChapterListDialog(
    chapterCount: Int,
    currentChapter: Int,
    onChapterSelect: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    val chapters = (1..chapterCount).map { "Chapter $it" }
    ChapterListDialog(
        chapters = chapters,
        currentChapter = currentChapter,
        onChapterSelect = onChapterSelect,
        onDismiss = onDismiss
    )
}
