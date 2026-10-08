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
import com.cleverferret.core.designsystem.slider.AccessibleMediaSlider
import com.cleverferret.core.designsystem.slider.AccessibleMediaSliderColors
import com.cleverferret.core.designsystem.slider.MediaChapterMarker
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
        // Unified accessible media slider with chapters and buffered progress
        AccessibleMediaSlider(
            currentPositionMs = currentPosition,
            durationMs = duration,
            bufferedPositionMs = bufferedPosition,
            chapters = chapters.map { MediaChapterMarker(it.startPosition, it.title) },
            onSeekMs = onSeek,
            colors = AccessibleMediaSliderColors(
                activeTrackColor = MediaColors.AccentPrimary,
                inactiveTrackColor = Color.White.copy(alpha = 0.1f),
                bufferedTrackColor = Color.White.copy(alpha = 0.3f),
                thumbColor = MediaColors.AccentPrimary,
                chapterMarkerColor = Color.White
            ),
            contentDescription = "Video playback seek bar",
            modifier = Modifier.fillMaxWidth()
        )
        
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
