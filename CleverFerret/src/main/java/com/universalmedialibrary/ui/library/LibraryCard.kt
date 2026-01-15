package com.universalmedialibrary.ui.library

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Data class representing a library with media-centric design
 */
data class LibraryItem(
    val id: Int,
    val name: String,
    val type: LibraryType,
    val itemCount: Int,
    val isActive: Boolean = true,
    val lastSyncTime: String = "Updated today"
)

enum class LibraryType {
    BOOK, MOVIE, MUSIC, PODCAST, MAGAZINE, DOCUMENT, ALL
}

/**
 * A visually rich card component for displaying a single media library,
 * converted from React LibraryCard component with media-centric design.
 */
@Composable
fun LibraryCard(
    library: LibraryItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var isHovered by remember { mutableStateOf(false) }

    // Animation for hover effect (simplified for touch devices)
    val scale by animateFloatAsState(
        targetValue = if (isHovered) 1.02f else 1f,
        animationSpec = tween(300),
        label = "card_scale"
    )

    val elevation by animateFloatAsState(
        targetValue = if (isHovered) 12f else 2f,
        animationSpec = tween(300),
        label = "card_elevation"
    )

    Card(
        modifier = modifier
            .fillMaxWidth()
            .height(220.dp)
            .clickable { onClick() },
        shape = RoundedCornerShape(8.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        border = BorderStroke(
            1.dp,
            MaterialTheme.colorScheme.outlineVariant
        )
    ) {
        Column {
            // Header with solid background
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(120.dp)
                    .background(MaterialTheme.colorScheme.surfaceVariant),
                contentAlignment = Alignment.Center
            ) {
                // Library type icon
                Icon(
                    imageVector = getLibraryIcon(library.type),
                    contentDescription = "${library.type} library",
                    modifier = Modifier.size(40.dp),
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )

                // Item count chip
                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(12.dp)
                        .background(
                            MaterialTheme.colorScheme.scrim.copy(alpha = 0.5f),
                            RoundedCornerShape(4.dp)
                        )
                        .padding(horizontal = 8.dp, vertical = 4.dp)
                ) {
                    Text(
                        text = "${library.itemCount} items",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurface
                    )
                }

                // Active indicator
                if (library.isActive) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.TopStart)
                            .padding(12.dp)
                            .size(8.dp)
                            .background(MaterialTheme.colorScheme.primary, CircleShape)
                    )
                }
            }

            // Content area
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            ) {
                Text(
                    text = library.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onSurface
                )

                Spacer(modifier = Modifier.height(4.dp))

                Text(
                    text = "${library.type.name.lowercase().capitalize()} library",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

private fun String.capitalize(): String {
    return this.replaceFirstChar { if (it.isLowerCase()) it.titlecase() else it.toString() }
}

/**
 * Get the appropriate icon for each library type using Phosphor Icons
 */
private fun getLibraryIcon(type: LibraryType): ImageVector {
    return when (type) {
        LibraryType.BOOK -> PhosphorIcons.Book
        LibraryType.MOVIE -> PhosphorIcons.FilmStrip
        LibraryType.MUSIC -> PhosphorIcons.MusicNote
        LibraryType.PODCAST -> PhosphorIcons.Microphone
        LibraryType.MAGAZINE -> PhosphorIcons.Newspaper
        LibraryType.DOCUMENT -> PhosphorIcons.FileText
        LibraryType.ALL -> PhosphorIcons.FolderOpen
    }
}
