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
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

@Composable
internal fun PodcastMiniPlayer(
    episode: PodcastEpisode,
    onTap: () -> Unit,
    onPlayPause: () -> Unit,
    onSeekForward: () -> Unit,
    onSeekBackward: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onTap),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.MD
    ) {
        Column {
            LinearProgressIndicator(
                progress = { episode.progress },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(2.dp),
                color = MediaColors.AccentPrimary,
                trackColor = MediaColors.ProgressBackground
            )
            
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Show artwork
                Surface(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(RoundedCornerShape(MediaCorners.XS)),
                    color = MediaColors.BackgroundSurface
                ) {
                    if (episode.showArtworkUrl != null) {
                        AsyncImage(
                    
                            model = episode.showArtworkUrl,
                            contentDescription = "Media image",
                            contentScale = ContentScale.Crop,
                            modifier = Modifier.fillMaxSize()
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = episode.title,
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = episode.showTitle,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Speed indicator
                Surface(
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = MediaColors.BackgroundSurface
                ) {
                    Text(
                        text = episode.playbackSpeed?.let { "${it}x" } ?: "1x",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XS)
                    )
                }
                
                IconButton(onClick = onSeekBackward) {
                    Icon(
                        imageVector = Icons.Default.Replay30,
                        contentDescription = "Rewind 30 seconds",
                        tint = MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onPlayPause) {
                    Surface(
                        shape = CircleShape,
                        color = MediaColors.AccentPrimary,
                        modifier = Modifier.size(36.dp)
                    ) {
                        Icon(
                            imageVector = if (episode.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            contentDescription = if (episode.isPlaying) "Pause" else "Play",
                            tint = Color.Black,
                            modifier = Modifier.padding(6.dp)
                        )
                    }
                }
                
                IconButton(onClick = onSeekForward) {
                    Icon(
                        imageVector = Icons.Default.Forward30,
                        contentDescription = "Forward 30 seconds",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}
