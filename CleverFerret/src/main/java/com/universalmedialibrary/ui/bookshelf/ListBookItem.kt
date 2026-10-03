package com.universalmedialibrary.ui.bookshelf

import androidx.compose.animation.*
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import coil.compose.AsyncImage

/**
 * Enhanced Bookshelf Screen
 * Features:
 * - Grid and List view modes
 * - Advanced sorting (title, author, date added, recently read, rating)
 * - Filtering (read status, genre, tags, format)
 * - Search with suggestions
 * - Cover art display with fallback
 * - Collections/shelves management
 * - Batch operations (mark as read, add to collection, delete)
 * - Reading progress indicators
 * - Pull-to-refresh
 * - Infinite scroll/pagination
 */

// ViewMode and SortOption are now defined in BookshelfModels.kt

@Composable
internal fun ListBookItem(
    book: BookItem,
    isSelected: Boolean,
    isSelectionMode: Boolean,
    isComfortable: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(
            defaultElevation = if (isSelected) 4.dp else 1.dp
        ),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) {
                MaterialTheme.colorScheme.primaryContainer
            } else {
                MaterialTheme.colorScheme.surface
            }
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Selection checkbox
            if (isSelectionMode) {
                Checkbox(
                    checked = isSelected,
                    onCheckedChange = null
                )
            }

            // Cover thumbnail
            Box(
                modifier = Modifier
                    .width(if (isComfortable) 80.dp else 60.dp)
                    .aspectRatio(0.67f)
                    .clip(RoundedCornerShape(4.dp))
            ) {
                if (book.coverUrl != null) {
                    AsyncImage(
                    
                        model = book.coverUrl,
                        contentDescription = book.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(MaterialTheme.colorScheme.primaryContainer),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            Icons.AutoMirrored.Filled.MenuBook,
                            contentDescription = "Media image",
                            tint = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }

            // Book info
            Column(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight(),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                    Text(
                        text = book.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        maxLines = if (isComfortable) 3 else 2,
                        overflow = TextOverflow.Ellipsis
                    )
                    Text(
                        text = book.author,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    if (isComfortable) {
                        // Genre tags
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(4.dp),
                            modifier = Modifier.padding(top = 4.dp)
                        ) {
                            book.genres.take(2).forEach { genre ->
                                SuggestionChip(
                                    onClick = { },
                                    label = { Text(genre, style = MaterialTheme.typography.labelSmall) }
                                )
                            }
                        }
                    }
                }

                // Progress and status
                Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                    if (book.progress > 0) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "${(book.progress * 100).toInt()}%",
                                style = MaterialTheme.typography.labelSmall
                            )
                            LinearProgressIndicator(
                                progress = book.progress,
                                modifier = Modifier
                                    .weight(1f)
                                    .padding(start = 8.dp)
                            )
                        }
                    }

                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Surface(
                            color = getReadStatusColor(book.readStatus),
                            shape = RoundedCornerShape(4.dp)
                        ) {
                            Text(
                                text = formatReadStatus(book.readStatus),
                                modifier = Modifier.padding(horizontal = 8.dp, vertical = 2.dp),
                                style = MaterialTheme.typography.labelSmall,
                                color = Color.White
                            )
                        }

                        // Rating
                        if (book.rating > 0) {
                            Row(horizontalArrangement = Arrangement.spacedBy(2.dp)) {
                                repeat(book.rating) {
                                    Icon(
                                        Icons.Default.Star,
                                        contentDescription = "Media image",
                                        modifier = Modifier.size(14.dp),
                                        tint = Color(0xFFFFD700)
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
