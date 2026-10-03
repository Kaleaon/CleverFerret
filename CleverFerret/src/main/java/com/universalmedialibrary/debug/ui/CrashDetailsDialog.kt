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
internal fun CrashDetailsDialog(
    crash: CrashReport,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(
                crash.exceptionClass.substringAfterLast('.'),
                fontWeight = FontWeight.Bold
            )
        },
        text = {
            Column(
                modifier = Modifier.verticalScroll(rememberScrollState()),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    "Message:",
                    fontWeight = FontWeight.Bold,
                    color = MediaColors.TextSecondary,
                    fontSize = 12.sp
                )
                Text(crash.message, color = MediaColors.TextPrimary)
                
                Text(
                    "Thread:",
                    fontWeight = FontWeight.Bold,
                    color = MediaColors.TextSecondary,
                    fontSize = 12.sp
                )
                Text(crash.threadName, color = MediaColors.TextPrimary)
                
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
                        text = crash.stackTrace,
                        fontFamily = FontFamily.Monospace,
                        fontSize = 10.sp,
                        color = MediaColors.TextPrimary,
                        modifier = Modifier.padding(8.dp)
                    )
                }
                
                Text(
                    "Device: ${crash.deviceInfo.manufacturer} ${crash.deviceInfo.model}",
                    fontSize = 10.sp,
                    color = MediaColors.TextSecondary
                )
                Text(
                    "Android: ${crash.deviceInfo.androidVersion} (API ${crash.deviceInfo.sdkVersion})",
                    fontSize = 10.sp,
                    color = MediaColors.TextSecondary
                )
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
