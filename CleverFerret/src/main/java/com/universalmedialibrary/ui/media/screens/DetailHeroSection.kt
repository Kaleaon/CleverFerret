package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
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
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun DetailHeroSection(
    item: MediaDetailItem,
    onPlayClick: () -> Unit
) {
    val configuration = LocalConfiguration.current
    val heroHeight = (configuration.screenHeightDp * 0.5f).dp
    
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(heroHeight)
    ) {
        // Backdrop image
        if (item.backdropUrl != null) {
            AsyncImage(
                model = item.backdropUrl,
                contentDescription = "${item.title} backdrop",
                modifier = Modifier
                    .fillMaxSize()
                    .blur(2.dp),
                contentScale = ContentScale.Crop
            )
        }
        
        // Gradient overlays
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent,
                            MediaColors.Background.copy(alpha = 0.7f),
                            MediaColors.Background
                        ),
                        startY = 0f
                    )
                )
        )
        
        // Content
        Row(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(MediaSpacing.ScreenHorizontal)
                .padding(bottom = MediaSpacing.LG),
            verticalAlignment = Alignment.Bottom
        ) {
            // Poster
            Surface(
                modifier = Modifier
                    .width(120.dp)
                    .aspectRatio(MediaSizes.PosterAspectRatio),
                shape = RoundedCornerShape(MediaCorners.Card),
                shadowElevation = MediaElevation.LG
            ) {
                if (item.imageUrl != null) {
                    AsyncImage(
                        model = item.imageUrl,
                        contentDescription = item.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(MediaColors.BackgroundSurface),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = "${item.mediaType.name} placeholder",
                            modifier = Modifier.size(48.dp),
                            tint = item.mediaType.color.copy(alpha = 0.5f)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            // Info
            Column(modifier = Modifier.weight(1f)) {
                // Media type badge
                Surface(
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = item.mediaType.color.copy(alpha = 0.2f)
                ) {
                    Text(
                        text = item.mediaType.name.replace("_", " "),
                        style = MediaTypography.LabelSmall,
                        color = item.mediaType.color,
                        modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp)
                    )
                }
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                // Title
                Text(
                    text = item.title,
                    style = MediaTypography.TitleLarge,
                    color = MediaColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                // Creator (author/artist/director)
                if (item.creator != null) {
                    Text(
                        text = "by ${item.creator}",
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextSecondary
                    )
                }
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                // Metadata row
                Row(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Rating
                    item.rating?.let { rating ->
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(
                                imageVector = Icons.Default.Star,
                                contentDescription = "Rating",
                                modifier = Modifier.size(16.dp),
                                tint = MediaColors.Warning
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = "%.1f".format(rating),
                                style = MediaTypography.LabelMedium,
                                color = MediaColors.TextPrimary
                            )
                        }
                    }
                    
                    // Year
                    item.year?.let { year ->
                        Text(
                            text = year.toString(),
                            style = MediaTypography.LabelMedium,
                            color = MediaColors.TextSecondary
                        )
                    }
                    
                    // Duration/Pages
                    item.duration?.let { duration ->
                        Text(
                            text = duration,
                            style = MediaTypography.LabelMedium,
                            color = MediaColors.TextSecondary
                        )
                    }
                }
            }
        }
    }
}
