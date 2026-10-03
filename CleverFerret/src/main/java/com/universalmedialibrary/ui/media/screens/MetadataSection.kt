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
internal fun MetadataSection(item: MediaDetailItem) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
            .padding(top = MediaSpacing.LG)
    ) {
        // Genre tags
        if (item.genres.isNotEmpty()) {
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                items(item.genres) { genre ->
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.Full),
                        color = MediaColors.BackgroundElevated
                    ) {
                        Text(
                            text = genre,
                            style = MediaTypography.LabelMedium,
                            color = MediaColors.TextSecondary,
                            modifier = Modifier.padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
        }
        
        // Additional metadata grid
        val metadataItems = buildList {
            item.publisher?.let { add("Publisher" to it) }
            item.language?.let { add("Language" to it) }
            item.pageCount?.let { add("Pages" to it.toString()) }
            item.seriesName?.let { add("Series" to "$it #${item.seriesPosition ?: ""}") }
            item.isbn?.let { add("ISBN" to it) }
            item.releaseDate?.let { add("Released" to it) }
        }
        
        if (metadataItems.isNotEmpty()) {
            Surface(
                shape = RoundedCornerShape(MediaCorners.Card),
                color = MediaColors.BackgroundElevated
            ) {
                Column(modifier = Modifier.padding(MediaSpacing.MD)) {
                    metadataItems.forEachIndexed { index, (label, value) ->
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text(
                                text = label,
                                style = MediaTypography.BodyMedium,
                                color = MediaColors.TextSecondary
                            )
                            Text(
                                text = value,
                                style = MediaTypography.BodyMedium,
                                color = MediaColors.TextPrimary
                            )
                        }
                        
                        if (index < metadataItems.size - 1) {
                            HorizontalDivider(
                                color = MediaColors.Divider,
                                modifier = Modifier.padding(vertical = MediaSpacing.SM)
                            )
                        }
                    }
                }
            }
        }
    }
}
