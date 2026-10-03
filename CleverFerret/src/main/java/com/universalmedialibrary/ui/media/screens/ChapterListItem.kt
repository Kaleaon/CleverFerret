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
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun ChapterListItem(
    chapter: ChapterItem,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Chapter number or thumbnail
        Surface(
            modifier = Modifier.size(48.dp),
            shape = RoundedCornerShape(MediaCorners.SM),
            color = MediaColors.BackgroundElevated
        ) {
            Box(contentAlignment = Alignment.Center) {
                Text(
                    text = chapter.number.toString(),
                    style = MediaTypography.TitleSmall,
                    color = MediaColors.TextSecondary
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = chapter.title,
                style = MediaTypography.BodyLarge,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
            ) {
                chapter.duration?.let {
                    Text(
                        text = it,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                chapter.date?.let {
                    Text(
                        text = it,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
        }
        
        // Progress or play indicator
        if (chapter.progress > 0 && chapter.progress < 1) {
            CircularProgressIndicator(
                progress = { chapter.progress },
                modifier = Modifier.size(32.dp),
                color = MediaColors.AccentPrimary,
                trackColor = MediaColors.ProgressBackground,
                strokeWidth = 3.dp
            )
        } else if (chapter.progress >= 1) {
            Icon(
                imageVector = Icons.Default.CheckCircle,
                contentDescription = "Completed",
                tint = MediaColors.Success,
                modifier = Modifier.size(32.dp)
            )
        } else {
            Icon(
                imageVector = Icons.Default.PlayCircleOutline,
                contentDescription = "Play",
                tint = MediaColors.TextTertiary,
                modifier = Modifier.size(32.dp)
            )
        }
    }
}
