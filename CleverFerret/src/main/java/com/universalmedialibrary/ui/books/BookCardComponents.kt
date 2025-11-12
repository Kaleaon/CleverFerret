package com.universalmedialibrary.ui.books

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import java.util.Locale

/**
 * Book Card Components with Visual Distinction
 * 
 * Provides composable components for displaying books with different visual styles:
 * - Available books (has digital file) - solid border
 * - Scanned books (no file yet) - dashed border + badge
 */

/**
 * Availability status of a book
 */
enum class BookAvailability {
    AVAILABLE,      // Book file is in library
    SCANNED,        // Scanned via barcode, no file yet
    WISH_LIST       // Added manually, no file yet
}

/**
 * Book data for display
 */
data class BookCardData(
    val itemId: Long,
    val title: String,
    val author: String?,
    val coverUrl: String?,
    val availability: BookAvailability,
    val isbn: String?,
    val rating: Float?,
    val shelf: String?,
    val isBookmarked: Boolean = false,
    val readingProgress: Float = 0f,
    val pageCount: Int? = null
)

/**
 * Enhanced Book Card with availability distinction
 */
@Composable
fun EnhancedBookCard(
    book: BookCardData,
    onClick: () -> Unit,
    onPurchaseLinksClick: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    Card(
        onClick = onClick,
        modifier = modifier
            .fillMaxWidth()
            .height(160.dp),
        shape = RoundedCornerShape(12.dp),
        border = when (book.availability) {
            BookAvailability.AVAILABLE -> BorderStroke(2.dp, MaterialTheme.colorScheme.primary)
            BookAvailability.SCANNED -> BorderStroke(
                width = 2.dp,
                color = MaterialTheme.colorScheme.tertiary
            )
            BookAvailability.WISH_LIST -> BorderStroke(
                width = 1.dp,
                color = MaterialTheme.colorScheme.outline
            )
        },
        colors = CardDefaults.cardColors(
            containerColor = when (book.availability) {
                BookAvailability.AVAILABLE -> MaterialTheme.colorScheme.surface
                BookAvailability.SCANNED -> MaterialTheme.colorScheme.tertiaryContainer.copy(alpha = 0.3f)
                BookAvailability.WISH_LIST -> MaterialTheme.colorScheme.surfaceVariant
            }
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxSize()
                .padding(12.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Book Cover
            Box(
                modifier = Modifier
                    .width(90.dp)
                    .fillMaxHeight()
            ) {
                AsyncImage(
                    model = book.coverUrl,
                    contentDescription = "Cover for ${book.title}",
                    modifier = Modifier
                        .fillMaxSize()
                        .clip(RoundedCornerShape(8.dp)),
                    contentScale = ContentScale.Crop
                )
                
                // Availability badge
                if (book.availability == BookAvailability.SCANNED) {
                    Surface(
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .offset(x = 4.dp, y = (-4).dp),
                        shape = RoundedCornerShape(4.dp),
                        color = MaterialTheme.colorScheme.tertiary,
                        tonalElevation = 4.dp
                    ) {
                        Icon(
                            imageVector = Icons.Default.QrCodeScanner,
                            contentDescription = "Scanned",
                            modifier = Modifier
                                .size(20.dp)
                                .padding(2.dp),
                            tint = MaterialTheme.colorScheme.onTertiary
                        )
                    }
                }
                
                // Bookmark indicator
                if (book.isBookmarked) {
                    Icon(
                        imageVector = Icons.Default.Bookmark,
                        contentDescription = "Bookmarked",
                        modifier = Modifier
                            .align(Alignment.BottomStart)
                            .size(24.dp)
                            .padding(4.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                }
            }
            
            // Book Info
            Column(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight(),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                Column {
                    // Title
                    Text(
                        text = book.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    // Author
                    if (book.author != null) {
                        Text(
                            text = book.author,
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    
                    // Shelf/Status
                    if (book.shelf != null) {
                        Spacer(modifier = Modifier.height(4.dp))
                        ShelfChip(shelf = book.shelf)
                    }
                }
                
                // Bottom row - Rating, Progress, Actions
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        // Rating
                        if (book.rating != null && book.rating > 0) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(2.dp)
                            ) {
                                Icon(
                                    imageVector = Icons.Default.Star,
                                    contentDescription = null,
                                    modifier = Modifier.size(16.dp),
                                    tint = MaterialTheme.colorScheme.primary
                                )
                                Text(
                                    text = String.format(Locale.getDefault(), "%.1f", book.rating),
                                    style = MaterialTheme.typography.bodySmall
                                )
                            }
                        }
                        
                        // Reading Progress
                        if (book.readingProgress > 0f) {
                            Text(
                                text = "${(book.readingProgress * 100).toInt()}%",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.primary
                            )
                        }
                    }
                    
                    // Purchase links button for scanned books
                    if (book.availability == BookAvailability.SCANNED && onPurchaseLinksClick != null) {
                        FilledTonalIconButton(
                            onClick = onPurchaseLinksClick,
                            modifier = Modifier.size(32.dp)
                        ) {
                            Icon(
                                imageVector = Icons.Default.ShoppingCart,
                                contentDescription = "Purchase links",
                                modifier = Modifier.size(18.dp)
                            )
                        }
                    }
                }
            }
        }
    }
}

/**
 * Shelf status chip
 */
@Composable
fun ShelfChip(shelf: String, modifier: Modifier = Modifier) {
    val (label, color) = when (shelf) {
        "currently-reading" -> "Reading" to MaterialTheme.colorScheme.primary
        "read" -> "Read" to MaterialTheme.colorScheme.tertiary
        "to-read" -> "To Read" to MaterialTheme.colorScheme.secondary
        else -> shelf to MaterialTheme.colorScheme.outline
    }
    
    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(4.dp),
        color = color.copy(alpha = 0.2f)
    ) {
        Text(
            text = label,
            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
            style = MaterialTheme.typography.labelSmall,
            color = color
        )
    }
}

/**
 * Compact Book Card for grid view
 */
@Composable
fun CompactBookCard(
    book: BookCardData,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        onClick = onClick,
        modifier = modifier.width(120.dp),
        shape = RoundedCornerShape(8.dp),
        border = when (book.availability) {
            BookAvailability.AVAILABLE -> BorderStroke(1.5.dp, MaterialTheme.colorScheme.primary)
            BookAvailability.SCANNED -> BorderStroke(
                width = 1.5.dp,
                color = MaterialTheme.colorScheme.tertiary
            )
            BookAvailability.WISH_LIST -> null
        }
    ) {
        Column {
            // Cover
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(160.dp)
            ) {
                AsyncImage(
                    model = book.coverUrl,
                    contentDescription = "Cover for ${book.title}",
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
                
                // Scanned badge
                if (book.availability == BookAvailability.SCANNED) {
                    Surface(
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(4.dp),
                        shape = RoundedCornerShape(4.dp),
                        color = MaterialTheme.colorScheme.tertiary
                    ) {
                        Icon(
                            imageVector = Icons.Default.QrCodeScanner,
                            contentDescription = "Scanned",
                            modifier = Modifier
                                .size(16.dp)
                                .padding(2.dp),
                            tint = MaterialTheme.colorScheme.onTertiary
                        )
                    }
                }
            }
            
            // Title
            Column(
                modifier = Modifier.padding(8.dp)
            ) {
                Text(
                    text = book.title,
                    style = MaterialTheme.typography.bodySmall,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                if (book.author != null) {
                    Text(
                        text = book.author,
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
        }
    }
}
