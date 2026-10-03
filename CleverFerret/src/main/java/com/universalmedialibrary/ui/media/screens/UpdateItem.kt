package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
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
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun UpdateItem(
    update: WebFictionUpdate,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.Top
    ) {
        // Story cover
        Surface(
            modifier = Modifier
                .size(48.dp)
                .clip(RoundedCornerShape(MediaCorners.XS)),
            color = MediaColors.BackgroundSurface
        ) {
            if (update.storyCoverUrl != null) {
                AsyncImage(
                    
                    model = update.storyCoverUrl,
                    contentDescription = "Media image",
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = Icons.Default.MenuBook,
                        contentDescription = "Media image",
                        tint = update.source.color.copy(alpha = 0.5f),
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                Text(
                    text = update.storyTitle,
                    style = MediaTypography.LabelSmall,
                    color = update.source.color,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.weight(1f, fill = false)
                )
                
                if (!update.isRead) {
                    Box(
                        modifier = Modifier
                            .size(8.dp)
                            .background(MediaColors.AccentPrimary, CircleShape)
                    )
                }
            }
            
            Text(
                text = update.chapter.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = if (!update.isRead) FontWeight.SemiBold else FontWeight.Normal
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = update.timestamp,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
                
                update.chapter.wordCount?.let { words ->
                    Text("•", color = MediaColors.TextTertiary)
                    Text(
                        text = formatWordCount(words),
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
        }
        
        Icon(
            imageVector = Icons.Default.ChevronRight,
            contentDescription = "Media image",
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(20.dp)
        )
    }
}
