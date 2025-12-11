package com.universalmedialibrary.debug.ui

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.debug.DebugReportingService
import com.universalmedialibrary.debug.PerformanceMetrics
import com.universalmedialibrary.ui.plex.theme.PlexColors
import kotlinx.coroutines.flow.StateFlow

/**
 * Debug Overlay Composable
 * 
 * A floating overlay that displays real-time debug information.
 * Only visible in debug builds when the feature flag is enabled.
 * 
 * Features:
 * - Real-time memory usage
 * - Crash/error count badges
 * - Quick access to debug menu
 * - Expandable/collapsible
 */
@Composable
fun DebugOverlay(
    performanceMetrics: StateFlow<PerformanceMetrics>,
    crashCount: Int,
    errorCount: Int,
    onNavigateToDebugMenu: () -> Unit,
    modifier: Modifier = Modifier
) {
    // Only show in debug builds
    if (!BuildConfig.SHOW_DEBUG_MENU) return
    
    val metrics by performanceMetrics.collectAsState()
    var isExpanded by remember { mutableStateOf(false) }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .padding(16.dp),
        contentAlignment = Alignment.TopEnd
    ) {
        AnimatedContent(
            targetState = isExpanded,
            transitionSpec = {
                (fadeIn() + scaleIn()) togetherWith (fadeOut() + scaleOut())
            },
            label = "debug_overlay_transition"
        ) { expanded ->
            if (expanded) {
                // Expanded view
                ExpandedDebugOverlay(
                    metrics = metrics,
                    crashCount = crashCount,
                    errorCount = errorCount,
                    onCollapse = { isExpanded = false },
                    onNavigateToDebugMenu = onNavigateToDebugMenu
                )
            } else {
                // Collapsed FAB
                CollapsedDebugFab(
                    crashCount = crashCount,
                    errorCount = errorCount,
                    onExpand = { isExpanded = true }
                )
            }
        }
    }
}

@Composable
private fun CollapsedDebugFab(
    crashCount: Int,
    errorCount: Int,
    onExpand: () -> Unit
) {
    val hasIssues = crashCount > 0 || errorCount > 0
    
    BadgedBox(
        badge = {
            if (hasIssues) {
                Badge(
                    containerColor = PlexColors.Error
                ) {
                    Text("${crashCount + errorCount}")
                }
            }
        }
    ) {
        FloatingActionButton(
            onClick = onExpand,
            containerColor = if (hasIssues) 
                PlexColors.Error.copy(alpha = 0.9f) 
            else 
                Color(0xFF4CAF50).copy(alpha = 0.9f),
            contentColor = Color.White,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                imageVector = Icons.Default.BugReport,
                contentDescription = "Debug Menu",
                modifier = Modifier.size(24.dp)
            )
        }
    }
}

@Composable
private fun ExpandedDebugOverlay(
    metrics: PerformanceMetrics,
    crashCount: Int,
    errorCount: Int,
    onCollapse: () -> Unit,
    onNavigateToDebugMenu: () -> Unit
) {
    Surface(
        shape = RoundedCornerShape(12.dp),
        color = Color(0xEE1E1E1E),
        shadowElevation = 8.dp
    ) {
        Column(
            modifier = Modifier
                .width(200.dp)
                .padding(12.dp)
        ) {
            // Header
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.BugReport,
                        contentDescription = null,
                        tint = Color(0xFF4CAF50),
                        modifier = Modifier.size(16.dp)
                    )
                    Text(
                        text = "DEBUG",
                        fontSize = 10.sp,
                        fontWeight = FontWeight.Bold,
                        fontFamily = FontFamily.Monospace,
                        color = Color(0xFF4CAF50)
                    )
                }
                IconButton(
                    onClick = onCollapse,
                    modifier = Modifier.size(24.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.Close,
                        contentDescription = "Close",
                        tint = Color.White.copy(alpha = 0.7f),
                        modifier = Modifier.size(16.dp)
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Memory usage
            DebugMetricRow(
                icon = Icons.Default.Memory,
                label = "Memory",
                value = "${metrics.memoryUsedMB}/${metrics.memoryMaxMB} MB",
                color = when {
                    metrics.memoryPercentUsed > 80 -> PlexColors.Error
                    metrics.memoryPercentUsed > 60 -> PlexColors.Warning
                    else -> Color(0xFF4CAF50)
                }
            )
            
            // Memory progress bar
            LinearProgressIndicator(
                progress = { metrics.memoryPercentUsed / 100f },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(4.dp)
                    .clip(RoundedCornerShape(2.dp)),
                color = when {
                    metrics.memoryPercentUsed > 80 -> PlexColors.Error
                    metrics.memoryPercentUsed > 60 -> PlexColors.Warning
                    else -> Color(0xFF4CAF50)
                },
                trackColor = Color.White.copy(alpha = 0.2f)
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Crash count
            DebugMetricRow(
                icon = Icons.Default.Warning,
                label = "Crashes",
                value = "$crashCount",
                color = if (crashCount > 0) PlexColors.Error else Color.White.copy(alpha = 0.7f)
            )
            
            // Error count
            DebugMetricRow(
                icon = Icons.Default.Error,
                label = "Errors",
                value = "$errorCount",
                color = if (errorCount > 0) PlexColors.Warning else Color.White.copy(alpha = 0.7f)
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Version info
            Text(
                text = "${BuildConfig.VERSION_NAME} (${BuildConfig.VERSION_CODE})",
                fontSize = 10.sp,
                fontFamily = FontFamily.Monospace,
                color = Color.White.copy(alpha = 0.5f)
            )
            
            Text(
                text = "Git: ${BuildConfig.GIT_COMMIT}",
                fontSize = 9.sp,
                fontFamily = FontFamily.Monospace,
                color = Color.White.copy(alpha = 0.4f)
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Open Debug Menu button
            Button(
                onClick = onNavigateToDebugMenu,
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF4CAF50)
                ),
                contentPadding = PaddingValues(8.dp)
            ) {
                Icon(
                    imageVector = Icons.Default.OpenInNew,
                    contentDescription = null,
                    modifier = Modifier.size(16.dp)
                )
                Spacer(Modifier.width(4.dp))
                Text(
                    text = "Debug Menu",
                    fontSize = 12.sp
                )
            }
        }
    }
}

@Composable
private fun DebugMetricRow(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    label: String,
    value: String,
    color: Color
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 2.dp),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(4.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = color,
                modifier = Modifier.size(14.dp)
            )
            Text(
                text = label,
                fontSize = 11.sp,
                color = Color.White.copy(alpha = 0.7f)
            )
        }
        Text(
            text = value,
            fontSize = 11.sp,
            fontFamily = FontFamily.Monospace,
            fontWeight = FontWeight.Bold,
            color = color
        )
    }
}

/**
 * Debug Quick Action Bar
 * 
 * A compact bar that can be shown at the top/bottom of the screen
 * for quick access to debug functions.
 */
@Composable
fun DebugQuickBar(
    onReportBug: () -> Unit,
    onOpenDebugMenu: () -> Unit,
    onTakeScreenshot: () -> Unit,
    modifier: Modifier = Modifier
) {
    if (!BuildConfig.SHOW_DEBUG_MENU) return
    
    Surface(
        modifier = modifier.fillMaxWidth(),
        color = Color(0xDD1E1E1E),
        shadowElevation = 4.dp
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 8.dp),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Debug badge
            Surface(
                shape = RoundedCornerShape(4.dp),
                color = Color(0xFF4CAF50).copy(alpha = 0.2f)
            ) {
                Text(
                    text = "DEBUG",
                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                    fontSize = 10.sp,
                    fontWeight = FontWeight.Bold,
                    fontFamily = FontFamily.Monospace,
                    color = Color(0xFF4CAF50)
                )
            }
            
            QuickAction(
                icon = Icons.Default.BugReport,
                label = "Report",
                onClick = onReportBug
            )
            
            QuickAction(
                icon = Icons.Default.Settings,
                label = "Debug",
                onClick = onOpenDebugMenu
            )
            
            QuickAction(
                icon = Icons.Default.Screenshot,
                label = "Screenshot",
                onClick = onTakeScreenshot
            )
        }
    }
}

@Composable
private fun QuickAction(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    label: String,
    onClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .clip(RoundedCornerShape(8.dp))
            .clickable(onClick = onClick)
            .padding(8.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Icon(
            imageVector = icon,
            contentDescription = label,
            tint = Color.White.copy(alpha = 0.8f),
            modifier = Modifier.size(20.dp)
        )
        Text(
            text = label,
            fontSize = 10.sp,
            color = Color.White.copy(alpha = 0.6f)
        )
    }
}
