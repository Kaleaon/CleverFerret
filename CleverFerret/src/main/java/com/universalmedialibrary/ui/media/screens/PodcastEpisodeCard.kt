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
internal fun PodcastEpisodeCard(
    episode: PodcastEpisode,
    isPlaying: Boolean,
    onClick: () -> Unit,
    onPlay: () -> Unit,
    onDownload: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.XS)
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = if (isPlaying) MediaColors.AccentPrimary.copy(alpha = 0.1f) else MediaColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier.padding(MediaSpacing.MD)
        ) {
            Row(verticalAlignment = Alignment.Top) {
                // Show artwork
                Surface(
                    modifier = Modifier
                        .size(72.dp)
                        .clip(RoundedCornerShape(MediaCorners.SM)),
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
                    // Show name
                    Text(
                        text = episode.showTitle,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.MediaTypes.Podcast,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    Spacer(modifier = Modifier.height(2.dp))
                    
                    // Episode title
                    Text(
                        text = episode.title,
                        style = MediaTypography.BodyMedium,
                        color = if (isPlaying) MediaColors.AccentPrimary else MediaColors.TextPrimary,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                        fontWeight = if (episode.isNew) FontWeight.SemiBold else FontWeight.Normal
                    )
                    
                    Spacer(modifier = Modifier.height(MediaSpacing.XS))
                    
                    // Meta info
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = episode.publishedDate,
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                        Text("•", color = MediaColors.TextTertiary)
                        Text(
                            text = episode.duration,
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                        if (episode.isDownloaded) {
                            Icon(
                                imageVector = Icons.Default.DownloadDone,
                                contentDescription = "Downloaded",
                                tint = MediaColors.Success,
                                modifier = Modifier.size(14.dp)
                            )
                        }
                        if (episode.isNew) {
                            Surface(
                                shape = RoundedCornerShape(MediaCorners.XS),
                                color = MediaColors.AccentPrimary.copy(alpha = 0.2f)
                            ) {
                                Text(
                                    text = "NEW",
                                    style = MediaTypography.LabelSmall,
                                    color = MediaColors.AccentPrimary,
                                    fontWeight = FontWeight.Bold,
                                    modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 1.dp)
                                )
                            }
                        }
                    }
                }
            }
            
            // Description
            if (episode.description != null) {
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Text(
                    text = episode.description,
                    style = MediaTypography.BodySmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            // Progress bar
            if (episode.progress > 0) {
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Row(verticalAlignment = Alignment.CenterVertically) {
                    LinearProgressIndicator(
                        progress = { episode.progress },
                        modifier = Modifier
                            .weight(1f)
                            .height(3.dp)
                            .clip(RoundedCornerShape(MediaCorners.Full)),
                        color = MediaColors.AccentPrimary,
                        trackColor = MediaColors.ProgressBackground
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    Text(
                        text = episode.remainingTime ?: "",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            // Action buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                Button(
                    onClick = onPlay,
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MediaColors.AccentPrimary
                    ),
                    contentPadding = PaddingValues(vertical = MediaSpacing.SM)
                ) {
                    Icon(
                        imageVector = if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = "Media image",
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                    Text(
                        text = if (episode.progress > 0) "Continue" else "Play",
                        style = MediaTypography.LabelMedium,
                        color = Color.Black
                    )
                }
                
                if (!episode.isDownloaded) {
                    OutlinedButton(
                        onClick = onDownload,
                        colors = ButtonDefaults.outlinedButtonColors(
                            contentColor = MediaColors.TextSecondary
                        ),
                        border = BorderStroke(1.dp, MediaColors.Border)
                    ) {
                        Icon(
                            imageVector = Icons.Default.Download,
                            contentDescription = "Download",
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
                
                IconButton(onClick = { /* More options */ }) {
                    Icon(
                        imageVector = Icons.Default.MoreVert,
                        contentDescription = "More",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}
