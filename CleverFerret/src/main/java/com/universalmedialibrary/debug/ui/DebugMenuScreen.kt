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

/**
 * Debug Menu Screen
 * 
 * Comprehensive debug panel accessible from the navbar in debug builds.
 * Provides access to:
 * - Crash reports
 * - Error logs
 * - Performance metrics
 * - Manual bug reporting
 * - Feature flags
 * - Notification testing
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DebugMenuScreen(
    viewModel: DebugMenuViewModel = hiltViewModel(),
    onBack: () -> Unit
) {
    val state by viewModel.state.collectAsState()
    val context = LocalContext.current
    
    var selectedTab by remember { mutableIntStateOf(0) }
    var showBugReportDialog by remember { mutableStateOf(false) }
    var showCrashDetails by remember { mutableStateOf<CrashReport?>(null) }
    var showErrorDetails by remember { mutableStateOf<ErrorLog?>(null) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.BugReport,
                            contentDescription = null,
                            tint = MediaColors.AccentPrimary
                        )
                        Text(
                            "Debug Menu",
                            fontWeight = FontWeight.Bold
                        )
                        // Debug badge
                        Surface(
                            shape = RoundedCornerShape(4.dp),
                            color = MediaColors.AccentPrimary.copy(alpha = 0.2f)
                        ) {
                            Text(
                                "DEBUG",
                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                                fontSize = 10.sp,
                                fontWeight = FontWeight.Bold,
                                color = MediaColors.AccentPrimary
                            )
                        }
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(
                            Icons.AutoMirrored.Filled.ArrowBack,
                            contentDescription = "Back"
                        )
                    }
                },
                actions = {
                    IconButton(onClick = { showBugReportDialog = true }) {
                        Icon(
                            Icons.Default.Send,
                            contentDescription = "Submit Bug Report",
                            tint = MediaColors.AccentPrimary
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MediaColors.BackgroundSurface,
                    titleContentColor = MediaColors.TextPrimary
                )
            )
        },
        containerColor = MediaColors.Background
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Performance summary card
            PerformanceSummaryCard(
                metrics = state.performanceMetrics,
                crashCount = state.crashReports.size,
                errorCount = state.errorLogs.size
            )
            
            // Tab row
            ScrollableTabRow(
                selectedTabIndex = selectedTab,
                containerColor = MediaColors.BackgroundSurface,
                contentColor = MediaColors.TextPrimary,
                edgePadding = 16.dp
            ) {
                DebugTab.entries.forEachIndexed { index, tab ->
                    Tab(
                        selected = selectedTab == index,
                        onClick = { selectedTab = index },
                        text = {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(4.dp)
                            ) {
                                Icon(
                                    imageVector = tab.icon,
                                    contentDescription = null,
                                    modifier = Modifier.size(18.dp)
                                )
                                Text(tab.title)
                                if (tab == DebugTab.CRASHES && state.crashReports.isNotEmpty()) {
                                    Badge(
                                        containerColor = MediaColors.Error
                                    ) {
                                        Text("${state.crashReports.size}")
                                    }
                                }
                                if (tab == DebugTab.ERRORS && state.errorLogs.count { it.level == LogLevel.ERROR } > 0) {
                                    Badge(
                                        containerColor = MediaColors.Warning
                                    ) {
                                        Text("${state.errorLogs.count { it.level == LogLevel.ERROR }}")
                                    }
                                }
                            }
                        },
                        selectedContentColor = MediaColors.AccentPrimary,
                        unselectedContentColor = MediaColors.TextSecondary
                    )
                }
            }
            
            // Tab content
            when (selectedTab) {
                0 -> CrashReportsTab(
                    crashes = state.crashReports,
                    onCrashClick = { showCrashDetails = it },
                    onClearAll = viewModel::clearCrashReports
                )
                1 -> ErrorLogsTab(
                    errors = state.errorLogs,
                    onErrorClick = { showErrorDetails = it },
                    onClearAll = viewModel::clearErrorLogs
                )
                2 -> PerformanceTab(metrics = state.performanceMetrics)
                3 -> FlagsTab(
                    flags = state.featureFlags,
                    onToggleFlag = viewModel::toggleFlag
                )
                4 -> NotificationsTab(
                    onTriggerNotification = viewModel::triggerTestNotification
                )
                5 -> ToolsTab(
                    onExportLogs = {
                        val intent = viewModel.exportLogs()
                        context.startActivity(Intent.createChooser(intent, "Export Logs"))
                    },
                    onSimulateCrash = viewModel::simulateCrash
                )
            }
        }
    }
    
    // Bug Report Dialog
    if (showBugReportDialog) {
        BugReportDialog(
            onDismiss = { showBugReportDialog = false },
            onSubmit = { title, description, steps ->
                val intent = viewModel.submitBugReport(title, description, steps)
                context.startActivity(Intent.createChooser(intent, "Share Bug Report"))
                showBugReportDialog = false
            }
        )
    }
    
    // Crash Details Dialog
    showCrashDetails?.let { crash ->
        CrashDetailsDialog(
            crash = crash,
            onDismiss = { showCrashDetails = null }
        )
    }
    
    // Error Details Dialog
    showErrorDetails?.let { error ->
        ErrorDetailsDialog(
            error = error,
            onDismiss = { showErrorDetails = null }
        )
    }
}


@Composable
private fun MetricItem(
    icon: ImageVector,
    label: String,
    value: String,
    color: Color
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Icon(
            imageVector = icon,
            contentDescription = null,
            tint = color,
            modifier = Modifier.size(24.dp)
        )
        Spacer(modifier = Modifier.height(4.dp))
        Text(
            text = value,
            fontWeight = FontWeight.Bold,
            color = color
        )
        Text(
            text = label,
            fontSize = 12.sp,
            color = MediaColors.TextSecondary
        )
    }
}

// =============================================================================
// TABS
// =============================================================================







@Composable
private fun NotificationsTab(
    onTriggerNotification: (String) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            Text(
                "Test Notifications",
                fontWeight = FontWeight.Bold,
                color = MediaColors.TextPrimary,
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }
        
        val notificationTypes = listOf(
            "download_complete" to "Download Complete",
            "sync_finished" to "Sync Finished",
            "new_content" to "New Content Available",
            "playback_error" to "Playback Error",
            "storage_warning" to "Storage Warning",
            "update_available" to "Update Available"
        )
        
        items(notificationTypes) { (type, label) ->
            OutlinedButton(
                onClick = { onTriggerNotification(type) },
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.outlinedButtonColors(
                    contentColor = MediaColors.TextPrimary
                )
            ) {
                Icon(Icons.Default.Notifications, contentDescription = null)
                Spacer(Modifier.width(8.dp))
                Text(label)
            }
        }
    }
}



@Composable
private fun EmptyState(
    icon: ImageVector,
    message: String,
    color: Color
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = color,
                modifier = Modifier.size(64.dp)
            )
            Spacer(Modifier.height(16.dp))
            Text(
                text = message,
                color = color,
                fontWeight = FontWeight.Medium
            )
        }
    }
}

// =============================================================================
// DIALOGS
// =============================================================================




// =============================================================================
// HELPERS
// =============================================================================

private enum class DebugTab(val title: String, val icon: ImageVector) {
    CRASHES("Crashes", Icons.Default.Warning),
    ERRORS("Errors", Icons.Default.Error),
    PERFORMANCE("Performance", Icons.Default.Speed),
    FLAGS("Flags", Icons.Default.Flag),
    NOTIFICATIONS("Notifications", Icons.Default.Notifications),
    TOOLS("Tools", Icons.Default.Build)
}

private fun formatTimestamp(timestamp: Long): String {
    return SimpleDateFormat("MMM dd, HH:mm:ss", Locale.getDefault()).format(Date(timestamp))
}
