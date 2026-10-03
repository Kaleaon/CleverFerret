package com.universalmedialibrary.debug.ui

import android.content.Intent
import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.debug.*
import com.universalmedialibrary.ui.media.theme.MediaColors
import java.text.SimpleDateFormat
import java.util.*

@Composable
internal fun ErrorDetailsDialog(
    error: ErrorLog,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                val color = when (error.level) {
                    LogLevel.ERROR -> MediaColors.Error
                    LogLevel.WARNING -> MediaColors.Warning
                    LogLevel.INFO -> MediaColors.AccentPrimary
                }
                Box(
                    modifier = Modifier
                        .size(12.dp)
                        .clip(CircleShape)
                        .background(color)
                )
                Spacer(Modifier.width(8.dp))
                Text(error.tag, fontWeight = FontWeight.Bold)
            }
        },
        text = {
            Column(
                modifier = Modifier.verticalScroll(rememberScrollState()),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    "Time: ${formatTimestamp(error.timestamp)}",
                    fontSize = 12.sp,
                    color = MediaColors.TextSecondary
                )
                
                Text(
                    "Message:",
                    fontWeight = FontWeight.Bold,
                    color = MediaColors.TextSecondary,
                    fontSize = 12.sp
                )
                Text(error.message, color = MediaColors.TextPrimary)
                
                error.stackTrace?.let { trace ->
                    Text(
                        "Stack Trace:",
                        fontWeight = FontWeight.Bold,
                        color = MediaColors.TextSecondary,
                        fontSize = 12.sp
                    )
                    Surface(
                        color = MediaColors.Background,
                        shape = RoundedCornerShape(4.dp)
                    ) {
                        Text(
                            text = trace,
                            fontFamily = FontFamily.Monospace,
                            fontSize = 10.sp,
                            color = MediaColors.TextPrimary,
                            modifier = Modifier.padding(8.dp)
                        )
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        },
        containerColor = MediaColors.BackgroundSurface
    )
}
