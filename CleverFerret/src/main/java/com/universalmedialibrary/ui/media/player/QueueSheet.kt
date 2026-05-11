package com.universalmedialibrary.ui.media.player

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
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun QueueSheet(
    queue: List<QueueItem>,
    currentIndex: Int,
    onItemClick: (Int) -> Unit,
    onRemove: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Up Next",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
        )
        
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(max = 400.dp)
        ) {
            itemsIndexed(queue) { index, item ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onItemClick(index) }
                        .background(
                            if (index == currentIndex)
                                MediaColors.AccentPrimary.copy(alpha = 0.1f)
                            else
                                Color.Transparent
                        )
                        .padding(MediaSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Drag handle
                    Icon(
                        imageVector = Icons.Default.DragHandle,
                        contentDescription = "Reorder",
                        tint = MediaColors.TextTertiary,
                        modifier = Modifier.size(20.dp)
                    )
                    
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    
                    // Artwork
                    Surface(
                        modifier = Modifier
                            .size(48.dp)
                            .clip(RoundedCornerShape(MediaCorners.XS)),
                        color = MediaColors.BackgroundSurface
                    ) {
                        if (item.artworkUrl != null) {
                            AsyncImage(
                    
                                model = item.artworkUrl,
                                contentDescription = "Media image",
                                contentScale = ContentScale.Crop,
                                modifier = Modifier.fillMaxSize()
                            )
                        }
                    }
                    
                    Spacer(modifier = Modifier.width(MediaSpacing.MD))
                    
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = item.title,
                            style = MediaTypography.BodyMedium,
                            color = if (index == currentIndex) 
                                MediaColors.AccentPrimary 
                            else 
                                MediaColors.TextPrimary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis,
                            fontWeight = if (index == currentIndex) FontWeight.SemiBold else FontWeight.Normal
                        )
                        Text(
                            text = item.artist ?: "",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextSecondary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    
                    // Now playing indicator
                    if (index == currentIndex) {
                        Icon(
                            imageVector = Icons.Default.VolumeUp,
                            contentDescription = "Playing",
                            tint = MediaColors.AccentPrimary,
                            modifier = Modifier.size(20.dp)
                        )
                    } else {
                        IconButton(onClick = { onRemove(index) }) {
                            Icon(
                                imageVector = Icons.Default.Close,
                                contentDescription = "Remove",
                                tint = MediaColors.TextTertiary,
                                modifier = Modifier.size(20.dp)
                            )
                        }
                    }
                }
            }
        }
    }
}
