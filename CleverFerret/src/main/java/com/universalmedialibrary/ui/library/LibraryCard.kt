package com.universalmedialibrary.ui.library

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
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

/**
 * Data class representing a library with Plex-inspired design
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
    BOOK, MOVIE, MUSIC, PODCAST, MAGAZINE, DOCUMENT
}

/**
 * A visually rich card component for displaying a single media library,
 * converted from React LibraryCard component with Plex-inspired design.
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
            .height(280.dp)
            .scale(scale)
            .clickable { onClick() },
        shape = RoundedCornerShape(12.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = elevation.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF1F2326)
        ),
        border = BorderStroke(
            1.dp, 
            if (isHovered) Color(0xFFE5A00D) else Color(0xFF2D3136)
        )
    ) {
        Column {
            // Header with gradient background
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(160.dp)
                    .background(
                        brush = getLibraryGradient(library.type)
                    ),
                contentAlignment = Alignment.Center
            ) {
                // Library type icon
                Icon(
                    imageVector = getLibraryIcon(library.type),
                    contentDescription = "${library.type} library",
                    modifier = Modifier.size(40.dp),
                    tint = Color.White
                )
                
                // Item count chip
                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(12.dp)
                        .background(
                            Color.Black.copy(alpha = 0.7f),
                            RoundedCornerShape(16.dp)
                        )
                        .padding(horizontal = 8.dp, vertical = 4.dp)
                ) {
                    Text(
                        text = "${library.itemCount} items",
                        style = MaterialTheme.typography.labelSmall,
                        color = Color.White
                    )
                }
                
                // Active indicator
                if (library.isActive) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.TopStart)
                            .padding(12.dp)
                            .size(12.dp)
                            .background(Color.Green, CircleShape)
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
                    fontWeight = FontWeight.SemiBold,
                    color = Color.White
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    text = "${library.type.name.lowercase()} library",
                    style = MaterialTheme.typography.bodySmall,
                    color = Color(0xFFB3B3B3)
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Text(
                    text = library.lastSyncTime,
                    style = MaterialTheme.typography.labelSmall,
                    color = Color(0xFF90A4AE)
                )
            }
        }
    }
}

/**
 * Get the appropriate gradient for each library type
 */
private fun getLibraryGradient(type: LibraryType): Brush {
    return when (type) {
        LibraryType.BOOK -> Brush.linearGradient(
            colors = listOf(Color(0xFF2C5F2D), Color(0xFF97BC62)),
            start = Offset(0f, 0f),
            end = Offset(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)
        )
        LibraryType.MOVIE -> Brush.linearGradient(
            colors = listOf(Color(0xFF1565C0), Color(0xFF42A5F5)),
            start = Offset(0f, 0f),
            end = Offset(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)
        )
        LibraryType.MUSIC -> Brush.linearGradient(
            colors = listOf(Color(0xFF7B1FA2), Color(0xFFBA68C8)),
            start = Offset(0f, 0f),
            end = Offset(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)
        )
        LibraryType.PODCAST -> Brush.linearGradient(
            colors = listOf(Color(0xFFEF6C00), Color(0xFFFFB74D)),
            start = Offset(0f, 0f),
            end = Offset(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)
        )
        LibraryType.MAGAZINE -> Brush.linearGradient(
            colors = listOf(Color(0xFFD32F2F), Color(0xFFF48FB1)),
            start = Offset(0f, 0f),
            end = Offset(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)
        )
        LibraryType.DOCUMENT -> Brush.linearGradient(
            colors = listOf(Color(0xFF455A64), Color(0xFF90A4AE)),
            start = Offset(0f, 0f),
            end = Offset(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)
        )
    }
}

/**
 * Get the appropriate icon for each library type
 */
private fun getLibraryIcon(type: LibraryType): ImageVector {
    return when (type) {
        LibraryType.BOOK -> Icons.Default.Home  // Using available icon as placeholder
        LibraryType.MOVIE -> Icons.Default.PlayArrow
        LibraryType.MUSIC -> Icons.Default.PlayArrow
        LibraryType.PODCAST -> Icons.Default.PlayArrow
        LibraryType.MAGAZINE -> Icons.Default.Edit
        LibraryType.DOCUMENT -> Icons.Default.Edit
    }
}