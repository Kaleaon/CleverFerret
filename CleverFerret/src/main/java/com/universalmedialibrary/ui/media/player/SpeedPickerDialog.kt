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
internal fun SpeedPickerDialog(
    currentSpeed: Float,
    onSpeedChange: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    val speeds = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 1.75f, 2.0f, 2.5f, 3.0f)
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Playback Speed", color = MediaColors.TextPrimary)
        },
        text = {
            LazyColumn {
                items(speeds) { speed ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSpeedChange(speed) }
                            .padding(MediaSpacing.MD),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "${speed}x",
                            style = MediaTypography.BodyMedium,
                            color = if (speed == currentSpeed) 
                                MediaColors.AccentPrimary 
                            else 
                                MediaColors.TextPrimary,
                            fontWeight = if (speed == currentSpeed) FontWeight.SemiBold else FontWeight.Normal
                        )
                        if (speed == currentSpeed) {
                            Icon(
                                imageVector = Icons.Default.Check,
                                contentDescription = "Media image",
                                tint = MediaColors.AccentPrimary
                            )
                        }
                    }
                }
            }
        },
        confirmButton = {},
        containerColor = MediaColors.BackgroundElevated
    )
}
