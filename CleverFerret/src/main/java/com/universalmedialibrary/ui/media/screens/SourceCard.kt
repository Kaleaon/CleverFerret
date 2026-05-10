package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
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
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun SourceCard(
    source: WebFictionSource,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Source icon
            Surface(
                shape = RoundedCornerShape(MediaCorners.SM),
                color = source.color.copy(alpha = 0.2f),
                modifier = Modifier.size(56.dp)
            ) {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = source.icon,
                        contentDescription = "Media image",
                        tint = source.color,
                        modifier = Modifier.size(28.dp)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = source.displayName,
                    style = MediaTypography.BodyLarge,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = source.description,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.XS))
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                ) {
                    source.categories.take(3).forEach { category ->
                        Surface(
                            shape = RoundedCornerShape(MediaCorners.XS),
                            color = MediaColors.BackgroundSurface
                        ) {
                            Text(
                                text = category,
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextTertiary,
                                modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 1.dp)
                            )
                        }
                    }
                }
            }
            
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = "Media image",
                tint = MediaColors.TextTertiary
            )
        }
    }
}
