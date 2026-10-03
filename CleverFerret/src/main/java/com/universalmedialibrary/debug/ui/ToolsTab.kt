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
internal fun ToolsTab(
    onExportLogs: () -> Unit,
    onSimulateCrash: () -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item {
            Text(
                "Developer Tools",
                fontWeight = FontWeight.Bold,
                color = MediaColors.TextPrimary,
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }
        
        item {
            Card(
                colors = CardDefaults.cardColors(containerColor = MediaColors.BackgroundSurface),
                shape = RoundedCornerShape(12.dp)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    ToolButton(
                        icon = Icons.Default.Download,
                        title = "Export All Logs",
                        description = "Export crash reports, errors, and metrics to JSON",
                        onClick = onExportLogs
                    )
                    
                    HorizontalDivider(
                        modifier = Modifier.padding(vertical = 12.dp),
                        color = MediaColors.BackgroundElevated
                    )
                    
                    ToolButton(
                        icon = Icons.Default.Warning,
                        title = "Simulate Crash",
                        description = "Trigger a test crash to verify crash reporting",
                        onClick = onSimulateCrash,
                        destructive = true
                    )
                }
            }
        }
    }
}
