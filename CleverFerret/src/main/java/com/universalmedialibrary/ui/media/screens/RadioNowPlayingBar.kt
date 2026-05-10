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
internal fun RadioNowPlayingBar(
    station: RadioStation,
    onTap: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onTap),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.MD
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Station logo
            Surface(
                modifier = Modifier
                    .size(48.dp)
                    .clip(RoundedCornerShape(MediaCorners.SM)),
                color = station.genreColor.copy(alpha = 0.2f)
            ) {
                if (station.logoUrl != null) {
                    AsyncImage(
                    
                        model = station.logoUrl,
                        contentDescription = "Now playing: ${station.name}",
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Icon(
                        imageVector = Icons.Default.Radio,
                        contentDescription = "Now playing: ${station.name}",
                        tint = station.genreColor,
                        modifier = Modifier.padding(MediaSpacing.SM)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            // Station info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = station.name,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                
                station.currentTrack?.let { track ->
                    Text(
                        text = track,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.AccentPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                } ?: Text(
                    text = station.genre,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary
                )
            }
            
            // Playback controls
            IconButton(onClick = { /* Stop */ }) {
                Icon(
                    imageVector = Icons.Default.Stop,
                    contentDescription = "Stop",
                    tint = MediaColors.TextSecondary
                )
            }
        }
    }
}
