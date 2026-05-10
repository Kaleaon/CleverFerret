package com.universalmedialibrary.ui.media.player

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
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
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun EpisodesSheet(
    episodes: List<EpisodeInfo>,
    currentEpisode: String?,
    onSelect: (EpisodeInfo) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Episodes",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
        )
        
        LazyColumn(
            modifier = Modifier.heightIn(max = 400.dp)
        ) {
            items(episodes) { episode ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onSelect(episode) }
                        .background(
                            if (episode.id == currentEpisode)
                                MediaColors.AccentPrimary.copy(alpha = 0.1f)
                            else
                                Color.Transparent
                        )
                        .padding(MediaSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Thumbnail
                    Surface(
                        modifier = Modifier
                            .size(width = 120.dp, height = 68.dp)
                            .clip(RoundedCornerShape(MediaCorners.XS)),
                        color = MediaColors.BackgroundSurface
                    ) {
                        if (episode.thumbnailUrl != null) {
                            AsyncImage(
                    
                                model = episode.thumbnailUrl,
                                contentDescription = "Media image",
                                contentScale = ContentScale.Crop,
                                modifier = Modifier.fillMaxSize()
                            )
                        }
                        
                        // Play indicator for current
                        if (episode.id == currentEpisode) {
                            Box(
                                modifier = Modifier
                                    .fillMaxSize()
                                    .background(Color.Black.copy(alpha = 0.5f)),
                                contentAlignment = Alignment.Center
                            ) {
                                Icon(
                                    imageVector = Icons.Default.VolumeUp,
                                    contentDescription = "Playing",
                                    tint = Color.White
                                )
                            }
                        }
                    }
                    
                    Spacer(modifier = Modifier.width(MediaSpacing.MD))
                    
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = "E${episode.number}: ${episode.title}",
                            style = MediaTypography.BodyMedium,
                            color = if (episode.id == currentEpisode)
                                MediaColors.AccentPrimary
                            else
                                MediaColors.TextPrimary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis,
                            fontWeight = if (episode.id == currentEpisode)
                                FontWeight.SemiBold
                            else
                                FontWeight.Normal
                        )
                        
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                        ) {
                            Text(
                                text = episode.duration,
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextSecondary
                            )
                            
                            if (episode.progress > 0) {
                                Text("•", color = MediaColors.TextTertiary)
                                Text(
                                    text = "${(episode.progress * 100).toInt()}% watched",
                                    style = MediaTypography.LabelSmall,
                                    color = MediaColors.AccentPrimary
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}
