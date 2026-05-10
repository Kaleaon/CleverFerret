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
internal fun SubtitlesSheet(
    tracks: List<SubtitleTrack>,
    currentTrack: SubtitleTrack?,
    onSelect: (SubtitleTrack?) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Subtitles",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
        )
        
        // Off option
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .clickable { onSelect(null) }
                .padding(MediaSpacing.MD),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Off",
                style = MediaTypography.BodyMedium,
                color = if (currentTrack == null) MediaColors.AccentPrimary else MediaColors.TextPrimary
            )
            if (currentTrack == null) {
                Icon(
                    imageVector = Icons.Default.Check,
                    contentDescription = "Media image",
                    tint = MediaColors.AccentPrimary
                )
            }
        }
        
        HorizontalDivider(color = MediaColors.Border)
        
        tracks.forEach { track ->
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onSelect(track) }
                    .padding(MediaSpacing.MD),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = track.language,
                        style = MediaTypography.BodyMedium,
                        color = if (currentTrack?.id == track.id) 
                            MediaColors.AccentPrimary 
                        else 
                            MediaColors.TextPrimary
                    )
                    track.label?.let {
                        Text(
                            text = it,
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextSecondary
                        )
                    }
                }
                if (currentTrack?.id == track.id) {
                    Icon(
                        imageVector = Icons.Default.Check,
                        contentDescription = "Media image",
                        tint = MediaColors.AccentPrimary
                    )
                }
            }
        }
    }
}
