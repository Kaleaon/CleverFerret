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
internal fun PerformanceTab(metrics: PerformanceMetrics) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Card(
                colors = CardDefaults.cardColors(containerColor = MediaColors.BackgroundSurface),
                shape = RoundedCornerShape(12.dp)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        "Memory Usage",
                        fontWeight = FontWeight.Bold,
                        color = MediaColors.TextPrimary
                    )
                    Spacer(Modifier.height(12.dp))
                    
                    LinearProgressIndicator(
                        progress = { metrics.memoryPercentUsed / 100f },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(8.dp)
                            .clip(RoundedCornerShape(4.dp)),
                        color = when {
                            metrics.memoryPercentUsed > 80 -> MediaColors.Error
                            metrics.memoryPercentUsed > 60 -> MediaColors.Warning
                            else -> MediaColors.Success
                        },
                        trackColor = MediaColors.BackgroundElevated
                    )
                    
                    Spacer(Modifier.height(8.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(
                            "${metrics.memoryUsedMB} MB used",
                            fontSize = 12.sp,
                            color = MediaColors.TextSecondary
                        )
                        Text(
                            "${metrics.memoryMaxMB} MB max",
                            fontSize = 12.sp,
                            color = MediaColors.TextSecondary
                        )
                    }
                }
            }
        }
        
        item {
            Text(
                "Last updated: ${formatTimestamp(metrics.lastUpdated)}",
                fontSize = 12.sp,
                color = MediaColors.TextSecondary
            )
        }
    }
}
