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
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun StorageInfoBar(
    totalSpace: Long,
    usedSpace: Long,
    freeSpace: Long
) {
    val usedPercent = if (totalSpace > 0) usedSpace.toFloat() / totalSpace else 0f
    
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                "${formatSize(usedSpace)} used",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary
            )
            Text(
                "${formatSize(freeSpace)} free",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextTertiary
            )
        }
        
        Spacer(Modifier.height(MediaSpacing.XS))
        
        LinearProgressIndicator(
            progress = { usedPercent },
            modifier = Modifier
                .fillMaxWidth()
                .height(4.dp)
                .clip(RoundedCornerShape(MediaCorners.Full)),
            color = when {
                usedPercent > 0.9f -> MediaColors.Error
                usedPercent > 0.75f -> MediaColors.Warning
                else -> MediaColors.AccentPrimary
            },
            trackColor = MediaColors.BackgroundSurface
        )
    }
}
