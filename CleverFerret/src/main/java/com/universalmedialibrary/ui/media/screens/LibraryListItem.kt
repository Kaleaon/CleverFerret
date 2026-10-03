package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
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
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun LibraryListItem(
    item: MediaItem,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Thumbnail
        Surface(
            modifier = Modifier
                .size(72.dp, 108.dp)
                .clip(RoundedCornerShape(MediaCorners.SM)),
            color = MediaColors.BackgroundSurface
        ) {
            if (item.imageUrl != null) {
                AsyncImage(
                    
                    model = item.imageUrl,
                    contentDescription = "Media image",
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
            } else {
                Box(
                    contentAlignment = Alignment.Center,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Icon(
                        imageVector = item.mediaType.icon,
                        contentDescription = "Media image",
                        tint = item.mediaType.color.copy(alpha = 0.5f),
                        modifier = Modifier.size(32.dp)
                    )
                }
            }
            
            // Progress overlay
            if (item.progress > 0) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(MediaSpacing.XS),
                    contentAlignment = Alignment.BottomCenter
                ) {
                    LinearProgressIndicator(
                        progress = { item.progress },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(3.dp)
                            .clip(RoundedCornerShape(MediaCorners.Full)),
                        color = MediaColors.AccentPrimary,
                        trackColor = MediaColors.ProgressBackground
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        // Info
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = item.title,
                style = MediaTypography.BodyLarge,
                color = MediaColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            item.subtitle?.let { subtitle ->
                Text(
                    text = subtitle,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.XS))
            
            // Metadata row
            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                verticalAlignment = Alignment.CenterVertically
            ) {
                item.rating?.let { rating ->
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.Star,
                            contentDescription = "Media image",
                            modifier = Modifier.size(14.dp),
                            tint = MediaColors.Warning
                        )
                        Spacer(modifier = Modifier.width(2.dp))
                        Text(
                            text = "%.1f".format(rating),
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }
                }
                
                item.year?.let { year ->
                    Text(
                        text = year.toString(),
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                item.duration?.let { duration ->
                    Text(
                        text = duration,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
        }
        
        // Action button
        IconButton(onClick = onClick) {
            Icon(
                imageVector = if (item.progress > 0) Icons.Default.PlayArrow else Icons.Default.ChevronRight,
                contentDescription = "Media image",
                tint = if (item.progress > 0) MediaColors.AccentPrimary else MediaColors.TextTertiary
            )
        }
    }
}
