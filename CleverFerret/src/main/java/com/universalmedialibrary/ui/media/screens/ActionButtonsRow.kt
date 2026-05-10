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
internal fun ActionButtonsRow(
    item: MediaDetailItem,
    onPlayClick: () -> Unit,
    onDownloadClick: () -> Unit,
    onShareClick: () -> Unit,
    onAddToCollectionClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        // Play/Read button
        Button(
            onClick = onPlayClick,
            modifier = Modifier.weight(1f),
            colors = ButtonDefaults.buttonColors(
                containerColor = MediaColors.AccentPrimary
            ),
            shape = RoundedCornerShape(MediaCorners.Button)
        ) {
            Icon(
                imageVector = if (item.progress > 0) Icons.Default.PlayArrow else Icons.Default.PlayArrow,
                contentDescription = if (item.progress > 0) "Continue ${item.title}" else "Play ${item.title}",
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
            Text(
                text = when {
                    item.progress > 0 -> "Continue"
                    item.mediaType in listOf(MediaType.BOOK, MediaType.COMIC, MediaType.FANFICTION) -> "Read"
                    item.mediaType in listOf(MediaType.MUSIC, MediaType.PODCAST, MediaType.RADIO) -> "Play"
                    else -> "Play"
                },
                style = MediaTypography.LabelLarge
            )
        }
        
        // Download button
        FilledTonalIconButton(
            onClick = onDownloadClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = MediaColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.Download,
                contentDescription = "Download",
                tint = MediaColors.TextPrimary
            )
        }
        
        // Add to collection
        FilledTonalIconButton(
            onClick = onAddToCollectionClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = MediaColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.BookmarkAdd,
                contentDescription = "Add to collection",
                tint = MediaColors.TextPrimary
            )
        }
        
        // Share
        FilledTonalIconButton(
            onClick = onShareClick,
            colors = IconButtonDefaults.filledTonalIconButtonColors(
                containerColor = MediaColors.BackgroundElevated
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.Share,
                contentDescription = "Share",
                tint = MediaColors.TextPrimary
            )
        }
    }
}
