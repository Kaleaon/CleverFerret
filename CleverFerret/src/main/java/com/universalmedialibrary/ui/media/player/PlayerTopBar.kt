package com.universalmedialibrary.ui.media.player

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
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun PlayerTopBar(
    title: String,
    subtitle: String?,
    isCasting: Boolean,
    onClose: () -> Unit,
    onCast: () -> Unit,
    onQueue: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        IconButton(onClick = onClose) {
            Icon(
                imageVector = Icons.Default.ExpandMore,
                contentDescription = "Minimize",
                tint = MediaColors.TextPrimary
            )
        }
        
        Column(
            modifier = Modifier.weight(1f),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = title,
                style = MediaTypography.LabelMedium,
                color = MediaColors.TextSecondary
            )
            subtitle?.let {
                Text(
                    text = it,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
            }
        }
        
        IconButton(onClick = onCast) {
            Icon(
                imageVector = if (isCasting) Icons.Filled.Cast else Icons.Outlined.Cast,
                contentDescription = "Cast",
                tint = if (isCasting) MediaColors.AccentPrimary else MediaColors.TextSecondary
            )
        }
        
        IconButton(onClick = onQueue) {
            Icon(
                imageVector = Icons.Default.MoreVert,
                contentDescription = "More",
                tint = MediaColors.TextSecondary
            )
        }
    }
}
