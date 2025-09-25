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
    modifier: Modifier = Modifier
) {
    var isHovered by remember { mutableStateOf(false) }

    Card(
        modifier = modifier
            .fillMaxWidth()  
            .height(350.dp)
            .clickable { onClick() },
        shape = RoundedCornerShape(12.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF1F2326)
        )
    ) {
        Column {
            // Poster/Image area
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(220.dp)
                    .background(
                        color = when (item.type) {
                            MediaType.BOOK -> Color(0xFF2C5F2D)
                            MediaType.MOVIE -> Color(0xFF1565C0) 
                            MediaType.MUSIC -> Color(0xFF7B1FA2)
                            MediaType.PODCAST -> Color(0xFFEF6C00)
                            MediaType.MAGAZINE -> Color(0xFFD32F2F)
                            MediaType.DOCUMENT -> Color(0xFF455A64)
                        }
                    ),
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
                    tint = Color.White.copy(alpha = 0.7f)
                )
                
                // Rating badge
                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(8.dp)
                        .background(
                            Color.Black.copy(alpha = 0.8f),
                            RoundedCornerShape(8.dp)
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
                
                // Overlay with action button (simplified, no animation for now)
                if (isHovered) {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(Color.Black.copy(alpha = 0.7f)),
                        contentAlignment = Alignment.Center
                    ) {
                        Button(
                            onClick = onClick,
                            colors = ButtonDefaults.buttonColors(
                                containerColor = Color(0xFFE5A00D),
                                contentColor = Color.Black
                            ),
                            shape = RoundedCornerShape(8.dp)
                        ) {
                            Row(
                                horizontalArrangement = Arrangement.spacedBy(4.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Icon(
                                    imageVector = when (item.type) {
                                        MediaType.BOOK -> PhosphorIcons.Book
                                        MediaType.MOVIE -> PhosphorIcons.Play
                                        MediaType.MUSIC -> PhosphorIcons.Play
                                        MediaType.PODCAST -> PhosphorIcons.Play
                                        MediaType.MAGAZINE -> PhosphorIcons.Newspaper
                                        MediaType.DOCUMENT -> PhosphorIcons.FileText
                                    },
                                    contentDescription = null,
                                    modifier = Modifier.size(16.dp)
                                )
                                Text(
                                    text = when (item.type) {
                                        MediaType.BOOK -> "Read"
                                        MediaType.MOVIE -> "Watch"
                                        MediaType.MUSIC -> "Play"
                                        MediaType.PODCAST -> "Play"
                                        MediaType.MAGAZINE -> "Read" 
                                        MediaType.DOCUMENT -> "Open"
                                    },
                                    fontWeight = FontWeight.SemiBold,
                                    fontSize = 12.sp
                                )
                            }
                        }
                    }
                }
            }
            
            // Content area
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            ) {
                Text(
                    text = item.title,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.SemiBold,
                    color = Color.White,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    text = "${item.author} • ${item.year}",
                    style = MaterialTheme.typography.bodySmall,
                    color = Color(0xFFB3B3B3),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                // Genre chip
                Surface(
                    modifier = Modifier.clip(RoundedCornerShape(12.dp)),
                    color = Color(0xFFE5A00D).copy(alpha = 0.2f)
                ) {
                    Text(
                        text = item.genre,
                        style = MaterialTheme.typography.labelSmall,
                        color = Color(0xFFE5A00D),
                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                        fontSize = 10.sp
                    )
                }
            }
        }
    }
}