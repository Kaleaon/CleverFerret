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
internal fun RadioStationListItem(
    station: RadioStation,
    isPlaying: Boolean,
    onClick: () -> Unit,
    onFavorite: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .background(
                if (isPlaying) MediaColors.AccentPrimary.copy(alpha = 0.1f) else Color.Transparent
            )
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Station logo
        Surface(
            modifier = Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(MediaCorners.SM)),
            color = station.genreColor.copy(alpha = 0.2f)
        ) {
            if (station.logoUrl != null) {
                AsyncImage(
                    
                    model = station.logoUrl,
                    contentDescription = "${station.name} logo",
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Icon(
                    imageVector = Icons.Default.Radio,
                    contentDescription = "${station.name} radio station",
                    tint = station.genreColor,
                    modifier = Modifier.padding(MediaSpacing.MD)
                )
            }
            
            // Playing indicator
            if (isPlaying) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(Color.Black.copy(alpha = 0.5f)),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.VolumeUp,
                        contentDescription = "Playing",
                        tint = MediaColors.AccentPrimary,
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        // Station info
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = station.name,
                style = MediaTypography.BodyMedium,
                color = if (isPlaying) MediaColors.AccentPrimary else MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = if (isPlaying) FontWeight.SemiBold else FontWeight.Normal
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = station.genre,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary
                )
                
                station.country?.let { country ->
                    Text("•", color = MediaColors.TextTertiary)
                    Text(
                        text = country,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                station.bitrate?.let { bitrate ->
                    Text("•", color = MediaColors.TextTertiary)
                    Text(
                        text = "$bitrate kbps",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
            
            // Current track info
            station.currentTrack?.let { track ->
                Spacer(modifier = Modifier.height(2.dp))
                Text(
                    text = "♪ $track",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.AccentPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
        
        // Favorite button
        IconButton(onClick = onFavorite) {
            Icon(
                imageVector = if (station.isFavorite) Icons.Filled.Favorite else Icons.Outlined.FavoriteBorder,
                contentDescription = if (station.isFavorite) "Remove from favorites" else "Add to favorites",
                tint = if (station.isFavorite) MediaColors.Error else MediaColors.TextTertiary
            )
        }
    }
}
