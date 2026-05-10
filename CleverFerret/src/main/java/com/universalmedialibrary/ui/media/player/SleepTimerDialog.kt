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
internal fun SleepTimerDialog(
    currentTimer: Long?,
    isActive: Boolean,
    onSetTimer: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    val options = listOf(
        5 to "5 minutes",
        15 to "15 minutes",
        30 to "30 minutes",
        45 to "45 minutes",
        60 to "1 hour",
        -1 to "End of chapter/episode"
    )
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Sleep Timer", color = MediaColors.TextPrimary)
        },
        text = {
            Column {
                if (isActive && currentTimer != null) {
                    Surface(
                        color = MediaColors.AccentPrimary.copy(alpha = 0.1f),
                        shape = RoundedCornerShape(MediaCorners.SM),
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = MediaSpacing.MD)
                    ) {
                        Row(
                            modifier = Modifier.padding(MediaSpacing.MD),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Timer,
                                contentDescription = "Media image",
                                tint = MediaColors.AccentPrimary
                            )
                            Spacer(modifier = Modifier.width(MediaSpacing.SM))
                            Text(
                                text = "Timer: ${formatTime(currentTimer)}",
                                color = MediaColors.AccentPrimary,
                                style = MediaTypography.BodyMedium
                            )
                            Spacer(modifier = Modifier.weight(1f))
                            TextButton(onClick = { onSetTimer(0) }) {
                                Text("Cancel", color = MediaColors.Error)
                            }
                        }
                    }
                }
                
                options.forEach { (minutes, label) ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSetTimer(minutes) }
                            .padding(MediaSpacing.MD),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = label,
                            style = MediaTypography.BodyMedium,
                            color = MediaColors.TextPrimary
                        )
                    }
                }
            }
        },
        confirmButton = {},
        containerColor = MediaColors.BackgroundElevated
    )
}
