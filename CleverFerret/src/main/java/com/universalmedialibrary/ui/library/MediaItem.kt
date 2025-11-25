package com.universalmedialibrary.ui.library

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
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
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Data class representing a media item
 */
data class MediaItemData(
    val id: Int,
    val title: String,
    val author: String,
    val year: Int,
    val rating: Float,
    val genre: String,
    val type: MediaType,
    val poster: String? = null
)

enum class MediaType {
    BOOK, MOVIE, MUSIC, PODCAST, MAGAZINE, DOCUMENT
}

/**
 * A component that displays a single media item with its poster, title, and other details.
 * Converted from React MediaItem component with Plex-inspired design.
 */
@Composable
fun MediaItem(
    item: MediaItemData,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    selectionEnabled: Boolean = false,
    isSelected: Boolean = false,
    onSelectionToggle: (() -> Unit)? = null
) {
    var isHovered by remember { mutableStateOf(false) }

    val clickHandler = if (selectionEnabled && onSelectionToggle != null) {
        { onSelectionToggle() }
    } else {
        onClick
    }

    Card(
        modifier = modifier
            .fillMaxWidth()
            .height(350.dp)
            .clickable(onClick = clickHandler),
        shape = RoundedCornerShape(8.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF1E1E1E)
        ),
        border = BorderStroke(1.dp, Color(0xFF333333))
    ) {
        Column {
            // Poster/Image area
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(220.dp)
                    .background(Color(0xFF2D2D2D)),
                contentAlignment = Alignment.Center
            ) {
                // Placeholder icon (no actual image loading in this demo)
                Icon(
                    imageVector = when (item.type) {
                        MediaType.BOOK -> PhosphorIcons.Book
                        MediaType.MOVIE -> PhosphorIcons.FilmStrip
                        MediaType.MUSIC -> PhosphorIcons.MusicNote
                        MediaType.PODCAST -> PhosphorIcons.Microphone
                        MediaType.MAGAZINE -> PhosphorIcons.Newspaper
                        MediaType.DOCUMENT -> PhosphorIcons.FileText
                    },
                    contentDescription = item.type.name,
                    modifier = Modifier.size(50.dp),
                    tint = Color(0xFF666666)
                )

                // Rating badge
                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(8.dp)
                        .background(
                            Color.Black.copy(alpha = 0.8f),
                            RoundedCornerShape(4.dp)
                        )
                        .padding(horizontal = 8.dp, vertical = 4.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        Icon(
                            imageVector = PhosphorIcons.Star,
                            contentDescription = "Rating",
                            modifier = Modifier.size(12.dp),
                            tint = Color(0xFFE5A00D)
                        )
                        Text(
                            text = item.rating.toString(),
                            style = MaterialTheme.typography.labelSmall,
                            color = Color(0xFFE5A00D),
                            fontWeight = FontWeight.SemiBold
                        )
                    }
                }

                // Selection Overlay
                if (selectionEnabled) {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(Color.Black.copy(alpha = 0.4f)),
                        contentAlignment = Alignment.TopStart
                    ) {
                        Checkbox(
                            checked = isSelected,
                            onCheckedChange = { onSelectionToggle?.invoke() },
                            colors = CheckboxDefaults.colors(
                                checkedColor = Color(0xFFE5A00D),
                                uncheckedColor = Color.White.copy(alpha = 0.8f)
                            ),
                            modifier = Modifier.padding(4.dp)
                        )
                    }
                }
            }

            // Content area
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(12.dp)
            ) {
                Text(
                    text = item.title,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold,
                    color = Color.White,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                Spacer(modifier = Modifier.height(4.dp))

                Text(
                    text = "${item.author} • ${item.year}",
                    style = MaterialTheme.typography.bodySmall,
                    color = Color(0xFFAAAAAA),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                Spacer(modifier = Modifier.height(8.dp))

                // Genre chip
                Surface(
                    modifier = Modifier.clip(RoundedCornerShape(4.dp)),
                    color = Color(0xFF333333)
                ) {
                    Text(
                        text = item.genre,
                        style = MaterialTheme.typography.labelSmall,
                        color = Color(0xFFCCCCCC),
                        modifier = Modifier.padding(horizontal = 6.dp, vertical = 3.dp),
                        fontSize = 10.sp
                    )
                }
            }
        }
    }
}
