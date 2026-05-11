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

data class FilterOptions(
    val readStatus: Set<ReadStatus> = emptySet(),
    val genres: Set<String> = emptySet(),
    val tags: Set<String> = emptySet(),
    val formats: Set<String> = emptySet(),  // EPUB, PDF, MOBI, etc.
    val minRating: Int = 0,
    val hasProgress: Boolean? = null
)

enum class ReadStatus {
    UNREAD,
    READING,
    FINISHED,
    DNF  // Did Not Finish
}


@Composable
private fun GridBookItem(
    book: BookItem,
    isSelected: Boolean,
    isSelectionMode: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(
            defaultElevation = if (isSelected) 8.dp else 2.dp
        ),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) {
                MaterialTheme.colorScheme.primaryContainer
            } else {
                MaterialTheme.colorScheme.surface
            }
        )
    ) {
        Column {
            // Cover image
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(0.67f)
            ) {
                if (book.coverUrl != null) {
                    AsyncImage(
                    
                        model = book.coverUrl,
                        contentDescription = book.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    // Fallback gradient cover
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(
                                Brush.linearGradient(
                                    colors = listOf(
                                        MaterialTheme.colorScheme.primary,
                                        MaterialTheme.colorScheme.secondary
                                    )
                                )
                            ),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            Icons.AutoMirrored.Filled.MenuBook,
                            contentDescription = "Media image",
                            modifier = Modifier.size(48.dp),
                            tint = Color.White
                        )
                    }
                }

                // Progress indicator
                if (book.progress > 0) {
                    LinearProgressIndicator(
                        progress = book.progress,
                        modifier = Modifier
                            .fillMaxWidth()
                            .align(Alignment.BottomCenter)
                    )
                }

                // Selection checkbox
                if (isSelectionMode) {
                    Checkbox(
                        checked = isSelected,
                        onCheckedChange = null,
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(8.dp)
                    )
                }

                // Read status badge
                Surface(
                    modifier = Modifier
                        .align(Alignment.TopStart)
                        .padding(8.dp),
                    color = getReadStatusColor(book.readStatus),
                    shape = RoundedCornerShape(4.dp)
                ) {
                    Text(
                        text = formatReadStatus(book.readStatus),
                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                        style = MaterialTheme.typography.labelSmall,
                        color = Color.White
                    )
                }
            }

            // Book info
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(8.dp),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Text(
                    text = book.title,
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = book.author,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                // Rating
                if (book.rating > 0) {
                    Row(horizontalArrangement = Arrangement.spacedBy(2.dp)) {
                        repeat(5) { index ->
                            Icon(
                                imageVector = if (index < book.rating) Icons.Default.Star else Icons.Default.StarBorder,
                                contentDescription = "Media image",
                                modifier = Modifier.size(12.dp),
                                tint = if (index < book.rating) Color(0xFFFFD700) else MaterialTheme.colorScheme.outline
                            )
                        }
                    }
                }
            }
        }
    }
}


@Composable
private fun FilterSheet(
    filterOptions: FilterOptions,
    onFilterChange: (FilterOptions) -> Unit,
    onDismiss: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "Filter Books",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )

        // Reset button
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.End
        ) {
            TextButton(onClick = {
                onFilterChange(FilterOptions())
            }) {
                Text("Reset All")
            }
        }

        // Read Status
        Text("Read Status", style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold)
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            ReadStatus.values().forEach { status ->
                FilterChip(
                    selected = status in filterOptions.readStatus,
                    onClick = {
                        onFilterChange(
                            filterOptions.copy(
                                readStatus = if (status in filterOptions.readStatus) {
                                    filterOptions.readStatus - status
                                } else {
                                    filterOptions.readStatus + status
                                }
                            )
                        )
                    },
                    label = { Text(formatReadStatus(status)) }
                )
            }
        }

        // Formats
        Text("Format", style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold)
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            listOf("EPUB", "PDF", "MOBI", "AZW3").forEach { format ->
                FilterChip(
                    selected = format in filterOptions.formats,
                    onClick = {
                        onFilterChange(
                            filterOptions.copy(
                                formats = if (format in filterOptions.formats) {
                                    filterOptions.formats - format
                                } else {
                                    filterOptions.formats + format
                                }
                            )
                        )
                    },
                    label = { Text(format) }
                )
            }
        }

        // Minimum Rating
        Text("Minimum Rating", style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold)
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            (0..5).forEach { rating ->
                FilterChip(
                    selected = filterOptions.minRating == rating,
                    onClick = { onFilterChange(filterOptions.copy(minRating = rating)) },
                    label = {
                        Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                            if (rating > 0) {
                                Icon(Icons.Default.Star, null, modifier = Modifier.size(16.dp))
                                Text("$rating+")
                            } else {
                                Text("Any")
                            }
                        }
                    }
                )
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = onDismiss,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Apply Filters")
        }
    }
}

private fun formatReadStatus(status: ReadStatus): String = when (status) {
    ReadStatus.UNREAD -> "Unread"
    ReadStatus.READING -> "Reading"
    ReadStatus.FINISHED -> "Finished"
    ReadStatus.DNF -> "DNF"
}

private fun getReadStatusColor(status: ReadStatus): Color = when (status) {
    ReadStatus.UNREAD -> Color(0xFF9E9E9E)
    ReadStatus.READING -> Color(0xFF2196F3)
    ReadStatus.FINISHED -> Color(0xFF4CAF50)
    ReadStatus.DNF -> Color(0xFFFF5722)
}

private fun formatSortOption(option: SortOption): String = when (option) {
    SortOption.TITLE_ASC -> "Title (A-Z)"
    SortOption.TITLE_DESC -> "Title (Z-A)"
    SortOption.AUTHOR_ASC -> "Author (A-Z)"
    SortOption.AUTHOR_DESC -> "Author (Z-A)"
    SortOption.DATE_ADDED_NEW -> "Recently Added"
    SortOption.DATE_ADDED_OLD -> "Oldest First"
    SortOption.RECENTLY_READ -> "Recently Read"
    SortOption.PROGRESS -> "Reading Progress"
    SortOption.RATING -> "Highest Rated"
    SortOption.RATING_HIGH -> "Rating (High to Low)"
    SortOption.RATING_LOW -> "Rating (Low to High)"
    SortOption.FILE_SIZE -> "File Size"
}

private fun isFilterActive(options: FilterOptions): Boolean {
    return options.readStatus.isNotEmpty() ||
           options.genres.isNotEmpty() ||
           options.tags.isNotEmpty() ||
           options.formats.isNotEmpty() ||
           options.minRating > 0 ||
           options.hasProgress != null
}

/**
 * Get comparator for sorting books
 * Extracted to help with type inference
 */
private fun getBookComparator(sortOption: SortOption): Comparator<BookItem> {
    return when (sortOption) {
        SortOption.TITLE_ASC -> compareBy { it.title }
        SortOption.TITLE_DESC -> compareByDescending { it.title }
        SortOption.AUTHOR_ASC -> compareBy { it.author }
        SortOption.AUTHOR_DESC -> compareByDescending { it.author }
        SortOption.DATE_ADDED_NEW -> compareByDescending { it.dateAdded }
        SortOption.DATE_ADDED_OLD -> compareBy { it.dateAdded }
        SortOption.RECENTLY_READ -> compareByDescending { it.lastRead ?: 0L }
        SortOption.PROGRESS -> compareByDescending { it.progress }
        SortOption.RATING -> compareByDescending { it.rating }
        SortOption.FILE_SIZE -> compareByDescending { it.fileSize }
        // Handle remaining enum values with default sorting
        SortOption.RATING_HIGH -> compareByDescending { it.rating }
        SortOption.RATING_LOW -> compareBy { it.rating }
        else -> compareBy { it.title }
    }
}
