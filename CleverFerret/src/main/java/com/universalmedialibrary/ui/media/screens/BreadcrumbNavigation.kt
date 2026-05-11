package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun BreadcrumbNavigation(
    path: String,
    onNavigate: (String) -> Unit
) {
    val pathParts = path.split("/").filter { it.isNotEmpty() }
    
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS)
    ) {
        // Root
        item {
            BreadcrumbChip(
                text = "Storage",
                isLast = pathParts.isEmpty(),
                onClick = { onNavigate("/storage") }
            )
        }
        
        // Path parts
        pathParts.forEachIndexed { index, part ->
            item {
                Icon(
                    Icons.Default.ChevronRight,
                    null,
                    tint = MediaColors.TextTertiary,
                    modifier = Modifier.size(16.dp)
                )
            }
            item {
                val partPath = "/" + pathParts.take(index + 1).joinToString("/")
                BreadcrumbChip(
                    text = part,
                    isLast = index == pathParts.lastIndex,
                    onClick = { onNavigate(partPath) }
                )
            }
        }
    }
}
