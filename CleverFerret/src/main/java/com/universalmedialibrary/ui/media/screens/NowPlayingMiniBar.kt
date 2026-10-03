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
internal fun NowPlayingMiniBar(
    track: MusicTrack,
    onTap: () -> Unit,
    onPlayPauseClick: () -> Unit,
    onPreviousClick: () -> Unit,
    onNextClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onTap),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.MD
    ) {
        Column {
            // Progress bar
            LinearProgressIndicator(
                progress = { track.playbackProgress },
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
                // Album art
                Surface(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(RoundedCornerShape(MediaCorners.XS)),
                    color = MediaColors.BackgroundSurface
                ) {
                    if (track.albumArtUrl != null) {
                        AsyncImage(
                    
                            model = track.albumArtUrl,
                            contentDescription = "Media image",
                            contentScale = ContentScale.Crop,
                            modifier = Modifier.fillMaxSize()
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
                
                // Track info
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = track.title,
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = track.artist,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Playback controls
                IconButton(onClick = onPreviousClick) {
                    Icon(
                        imageVector = Icons.Default.SkipPrevious,
                        contentDescription = "Previous",
                        tint = MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onPlayPauseClick) {
                    Surface(
                        shape = CircleShape,
                        color = MediaColors.AccentPrimary,
                        modifier = Modifier.size(36.dp)
                    ) {
                        Icon(
                            imageVector = if (track.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            contentDescription = if (track.isPlaying) "Pause" else "Play",
                            tint = Color.Black,
                            modifier = Modifier.padding(6.dp)
                        )
                    }
                }
                
                IconButton(onClick = onNextClick) {
                    Icon(
                        imageVector = Icons.Default.SkipNext,
                        contentDescription = "Next",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}
