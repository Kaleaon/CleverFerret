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
internal fun PerformanceSummaryCard(
    metrics: PerformanceMetrics,
    crashCount: Int,
    errorCount: Int
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        colors = CardDefaults.cardColors(containerColor = MediaColors.BackgroundSurface),
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            MetricItem(
                icon = Icons.Default.Memory,
                label = "Memory",
                value = "${metrics.memoryUsedMB}/${metrics.memoryMaxMB} MB",
                color = when {
                    metrics.memoryPercentUsed > 80 -> MediaColors.Error
                    metrics.memoryPercentUsed > 60 -> MediaColors.Warning
                    else -> MediaColors.Success
                }
            )
            MetricItem(
                icon = Icons.Default.Warning,
                label = "Crashes",
                value = "$crashCount",
                color = if (crashCount > 0) MediaColors.Error else MediaColors.Success
            )
            MetricItem(
                icon = Icons.Default.Error,
                label = "Errors",
                value = "$errorCount",
                color = if (errorCount > 0) MediaColors.Warning else MediaColors.Success
            )
        }
    }
}
