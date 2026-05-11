package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.pager.*
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
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

@Composable
internal fun PlaylistCard(
    playlist: MusicPlaylist,
    onClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .width(160.dp)
            .clickable(onClick = onClick)
    ) {
        // Playlist artwork grid
        Surface(
            modifier = Modifier
                .size(160.dp)
                .clip(RoundedCornerShape(MediaCorners.MD)),
            color = MediaColors.BackgroundSurface
        ) {
            when {
                playlist.artworkUrls.size >= 4 -> {
                    // 2x2 grid of album arts
                    Column {
                        Row(modifier = Modifier.weight(1f)) {
                            playlist.artworkUrls.take(2).forEach { url ->
                                AsyncImage(
                    
                                    model = url,
                                    contentDescription = "Media image",
                                    contentScale = ContentScale.Crop,
                                    modifier = Modifier
                                        .weight(1f)
                                        .fillMaxHeight()
                                )
                            }
                        }
                        Row(modifier = Modifier.weight(1f)) {
                            playlist.artworkUrls.drop(2).take(2).forEach { url ->
                                AsyncImage(
                    
                                    model = url,
                                    contentDescription = "Media image",
                                    contentScale = ContentScale.Crop,
                                    modifier = Modifier
                                        .weight(1f)
                                        .fillMaxHeight()
                                )
                            }
                        }
                    }
                }
                playlist.artworkUrls.isNotEmpty() -> {
                    AsyncImage(
                    
                        model = playlist.artworkUrls.first(),
                        contentDescription = "Media image",
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                }
                else -> {
                    Box(contentAlignment = Alignment.Center) {
                        Icon(
                            imageVector = Icons.Default.QueueMusic,
                            contentDescription = "Media image",
                            tint = MediaColors.MediaTypes.Music.copy(alpha = 0.5f),
                            modifier = Modifier.size(48.dp)
                        )
                    }
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = playlist.name,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextPrimary,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            fontWeight = FontWeight.Medium
        )
        
        Text(
            text = "${playlist.trackCount} tracks",
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextSecondary
        )
    }
}
