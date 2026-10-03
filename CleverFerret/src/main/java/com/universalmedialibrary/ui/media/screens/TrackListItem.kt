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
internal fun TrackListItem(
    track: MusicTrack,
    trackNumber: Int,
    isPlaying: Boolean,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .background(
                if (isPlaying) MediaColors.AccentPrimary.copy(alpha = 0.1f)
                else Color.Transparent
            )
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Track number or now playing indicator
        Box(
            modifier = Modifier.width(32.dp),
            contentAlignment = Alignment.Center
        ) {
            if (isPlaying) {
                Icon(
                    imageVector = Icons.Default.VolumeUp,
                    contentDescription = "Playing",
                    tint = MediaColors.AccentPrimary,
                    modifier = Modifier.size(20.dp)
                )
            } else {
                Text(
                    text = trackNumber.toString(),
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextTertiary
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        
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
            } else {
                Icon(
                    imageVector = Icons.Default.MusicNote,
                    contentDescription = "Media image",
                    tint = MediaColors.MediaTypes.Music.copy(alpha = 0.5f),
                    modifier = Modifier.padding(MediaSpacing.SM)
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        // Track info
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = track.title,
                style = MediaTypography.BodyMedium,
                color = if (isPlaying) MediaColors.AccentPrimary else MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = if (isPlaying) FontWeight.Medium else FontWeight.Normal
            )
            Text(
                text = "${track.artist} • ${track.album}",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
        
        // Duration
        Text(
            text = track.duration,
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextTertiary
        )
        
        // More options
        IconButton(onClick = { /* Show menu */ }) {
            Icon(
                imageVector = Icons.Default.MoreVert,
                contentDescription = "More options",
                tint = MediaColors.TextTertiary,
                modifier = Modifier.size(20.dp)
            )
        }
    }
}
