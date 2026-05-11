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
internal fun VideoPlayerBottomBar(
    currentPosition: Long,
    duration: Long,
    bufferedPosition: Long,
    chapters: List<VideoChapter>,
    onSeek: (Long) -> Unit,
    onSubtitles: () -> Unit,
    onQuality: () -> Unit,
    onEpisodes: (() -> Unit)?,
    hasSubtitles: Boolean,
    currentSubtitle: SubtitleTrack?,
    currentQuality: VideoQuality,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxWidth()
            .navigationBarsPadding()
            .padding(MediaSpacing.MD)
    ) {
        // Progress bar with chapters
        Box(modifier = Modifier.fillMaxWidth()) {
            // Buffered progress
            LinearProgressIndicator(
                progress = { if (duration > 0) bufferedPosition.toFloat() / duration else 0f },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(4.dp)
                    .clip(RoundedCornerShape(MediaCorners.Full)),
                color = Color.White.copy(alpha = 0.3f),
                trackColor = Color.White.copy(alpha = 0.1f)
            )
            
            // Playback progress
            Slider(
                value = currentPosition.toFloat(),
                onValueChange = { onSeek(it.toLong()) },
                valueRange = 0f..duration.toFloat(),
                modifier = Modifier.fillMaxWidth(),
                colors = SliderDefaults.colors(
                    thumbColor = MediaColors.AccentPrimary,
                    activeTrackColor = MediaColors.AccentPrimary,
                    inactiveTrackColor = Color.Transparent
                )
            )
            
            // Chapter markers
            chapters.forEach { chapter ->
                val position = chapter.startPosition.toFloat() / duration
                Box(
                    modifier = Modifier
                        .fillMaxWidth(position)
                        .height(4.dp)
                        .align(Alignment.CenterStart)
                ) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.CenterEnd)
                            .size(4.dp)
                            .background(Color.White, CircleShape)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        
        // Time and controls
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Time
            Text(
                text = "${formatTime(currentPosition)} / ${formatTime(duration)}",
                style = MediaTypography.LabelMedium,
                color = Color.White
            )
            
            // Controls
            Row(horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)) {
                // Episodes (for TV shows)
                onEpisodes?.let {
                    TextButton(onClick = it) {
                        Icon(
                            imageVector = Icons.Default.VideoLibrary,
                            contentDescription = "Media image",
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.XS))
                        Text("Episodes")
                    }
                }
                
                // Subtitles
                if (hasSubtitles) {
                    TextButton(onClick = onSubtitles) {
                        Icon(
                            imageVector = if (currentSubtitle != null) 
                                Icons.Filled.Subtitles 
                            else 
                                Icons.Outlined.Subtitles,
                            contentDescription = "Media image",
                            modifier = Modifier.size(20.dp),
                            tint = if (currentSubtitle != null) 
                                MediaColors.AccentPrimary 
                            else 
                                Color.White
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.XS))
                        Text(
                            text = currentSubtitle?.language ?: "Subtitles",
                            color = if (currentSubtitle != null) 
                                MediaColors.AccentPrimary 
                            else 
                                Color.White
                        )
                    }
                }
                
                // Quality
                TextButton(onClick = onQuality) {
                    Icon(
                        imageVector = Icons.Default.HighQuality,
                        contentDescription = "Media image",
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                    Text(currentQuality.label)
                }
            }
        }
    }
}
