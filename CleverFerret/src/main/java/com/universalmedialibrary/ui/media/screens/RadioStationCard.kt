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
internal fun RadioStationCard(
    station: RadioStation,
    onClick: () -> Unit,
    onFavorite: () -> Unit
) {
    Surface(
        modifier = Modifier
            .width(140.dp)
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(MediaSpacing.MD)
        ) {
            Box(
                modifier = Modifier
                    .size(100.dp)
                    .clip(CircleShape),
                contentAlignment = Alignment.Center
            ) {
                if (station.logoUrl != null) {
                    AsyncImage(
                    
                        model = station.logoUrl,
                        contentDescription = "${station.name} logo",
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Surface(
                        color = station.genreColor.copy(alpha = 0.2f),
                        modifier = Modifier.fillMaxSize()
                    ) {
                        Icon(
                            imageVector = Icons.Default.Radio,
                            contentDescription = "${station.name} radio station",
                            tint = station.genreColor,
                            modifier = Modifier.padding(MediaSpacing.LG)
                        )
                    }
                }
                
                // Favorite indicator
                if (station.isFavorite) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(4.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Filled.Favorite,
                            contentDescription = "Favorite station",
                            tint = MediaColors.Error,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            Text(
                text = station.name,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                textAlign = TextAlign.Center,
                fontWeight = FontWeight.Medium
            )
            
            Text(
                text = station.genre,
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                textAlign = TextAlign.Center
            )
        }
    }
}
