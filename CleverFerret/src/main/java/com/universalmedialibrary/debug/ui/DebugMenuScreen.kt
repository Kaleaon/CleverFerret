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
import com.universalmedialibrary.ui.plex.theme.PlexColors
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
                            tint = PlexColors.AccentPrimary
                        )
                        Text(
                            "Debug Menu",
                            fontWeight = FontWeight.Bold
                        )
                        // Debug badge
                        Surface(
                            shape = RoundedCornerShape(4.dp),
                            color = PlexColors.AccentPrimary.copy(alpha = 0.2f)
                        ) {
                            Text(
                                "DEBUG",
                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                                fontSize = 10.sp,
                                fontWeight = FontWeight.Bold,
                                color = PlexColors.AccentPrimary
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
                            tint = PlexColors.AccentPrimary
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = PlexColors.BackgroundSurface,
                    titleContentColor = PlexColors.TextPrimary
                )
            )
        },
        containerColor = PlexColors.Background
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
                containerColor = PlexColors.BackgroundSurface,
                contentColor = PlexColors.TextPrimary,
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
                                        containerColor = PlexColors.Error
                                    ) {
                                        Text("${state.crashReports.size}")
                                    }
                                }
                                if (tab == DebugTab.ERRORS && state.errorLogs.count { it.level == LogLevel.ERROR } > 0) {
                                    Badge(
                                        containerColor = PlexColors.Warning
                                    ) {
                                        Text("${state.errorLogs.count { it.level == LogLevel.ERROR }}")
                                    }
                                }
                            }
                        },
                        selectedContentColor = PlexColors.AccentPrimary,
                        unselectedContentColor = PlexColors.TextSecondary
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
private fun PerformanceSummaryCard(
    metrics: PerformanceMetrics,
    crashCount: Int,
    errorCount: Int
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        colors = CardDefaults.cardColors(containerColor = PlexColors.BackgroundSurface),
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
                    metrics.memoryPercentUsed > 80 -> PlexColors.Error
                    metrics.memoryPercentUsed > 60 -> PlexColors.Warning
                    else -> PlexColors.Success
                }
            )
            MetricItem(
                icon = Icons.Default.Warning,
                label = "Crashes",
                value = "$crashCount",
                color = if (crashCount > 0) PlexColors.Error else PlexColors.Success
            )
            MetricItem(
                icon = Icons.Default.Error,
                label = "Errors",
                value = "$errorCount",
                color = if (errorCount > 0) PlexColors.Warning else PlexColors.Success
            )
        }
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
            color = PlexColors.TextSecondary
        )
    }
}

// =============================================================================
// TABS
// =============================================================================

@Composable
private fun CrashReportsTab(
    crashes: List<CrashReport>,
    onCrashClick: (CrashReport) -> Unit,
    onClearAll: () -> Unit
) {
    Column(modifier = Modifier.fillMaxSize()) {
        if (crashes.isNotEmpty()) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.End
            ) {
                TextButton(onClick = onClearAll) {
                    Icon(Icons.Default.Delete, contentDescription = null)
                    Spacer(Modifier.width(4.dp))
                    Text("Clear All")
                }
            }
        }
        
        if (crashes.isEmpty()) {
            EmptyState(
                icon = Icons.Default.CheckCircle,
                message = "No crashes recorded",
                color = PlexColors.Success
            )
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(crashes, key = { it.id }) { crash ->
                    CrashReportCard(
                        crash = crash,
                        onClick = { onCrashClick(crash) }
                    )
                }
            }
        }
    }
}

@Composable
private fun CrashReportCard(
    crash: CrashReport,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = PlexColors.Error.copy(alpha = 0.1f)
        ),
        shape = RoundedCornerShape(8.dp)
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                Icons.Default.Error,
                contentDescription = null,
                tint = PlexColors.Error,
                modifier = Modifier.size(32.dp)
            )
            Spacer(Modifier.width(12.dp))
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = crash.exceptionClass.substringAfterLast('.'),
                    fontWeight = FontWeight.Bold,
                    color = PlexColors.TextPrimary
                )
                Text(
                    text = crash.message,
                    fontSize = 12.sp,
                    color = PlexColors.TextSecondary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = formatTimestamp(crash.timestamp),
                    fontSize = 10.sp,
                    color = PlexColors.TextSecondary
                )
            }
            Icon(
                Icons.Default.ChevronRight,
                contentDescription = "View details",
                tint = PlexColors.TextSecondary
            )
        }
    }
}

@Composable
private fun ErrorLogsTab(
    errors: List<ErrorLog>,
    onErrorClick: (ErrorLog) -> Unit,
    onClearAll: () -> Unit
) {
    Column(modifier = Modifier.fillMaxSize()) {
        if (errors.isNotEmpty()) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.End
            ) {
                TextButton(onClick = onClearAll) {
                    Icon(Icons.Default.Delete, contentDescription = null)
                    Spacer(Modifier.width(4.dp))
                    Text("Clear All")
                }
            }
        }
        
        if (errors.isEmpty()) {
            EmptyState(
                icon = Icons.Default.CheckCircle,
                message = "No errors logged",
                color = PlexColors.Success
            )
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                items(errors.reversed(), key = { it.id }) { error ->
                    ErrorLogItem(
                        error = error,
                        onClick = { onErrorClick(error) }
                    )
                }
            }
        }
    }
}

@Composable
private fun ErrorLogItem(
    error: ErrorLog,
    onClick: () -> Unit
) {
    val color = when (error.level) {
        LogLevel.ERROR -> PlexColors.Error
        LogLevel.WARNING -> PlexColors.Warning
        LogLevel.INFO -> PlexColors.AccentPrimary
    }
    
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        color = color.copy(alpha = 0.1f),
        shape = RoundedCornerShape(4.dp)
    ) {
        Row(
            modifier = Modifier.padding(8.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(8.dp)
                    .clip(CircleShape)
                    .background(color)
            )
            Spacer(Modifier.width(8.dp))
            Column(modifier = Modifier.weight(1f)) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text(
                        text = error.tag,
                        fontSize = 10.sp,
                        fontWeight = FontWeight.Bold,
                        fontFamily = FontFamily.Monospace,
                        color = color
                    )
                    Text(
                        text = formatTimestamp(error.timestamp),
                        fontSize = 10.sp,
                        color = PlexColors.TextSecondary
                    )
                }
                Text(
                    text = error.message,
                    fontSize = 12.sp,
                    color = PlexColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

@Composable
private fun PerformanceTab(metrics: PerformanceMetrics) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Card(
                colors = CardDefaults.cardColors(containerColor = PlexColors.BackgroundSurface),
                shape = RoundedCornerShape(12.dp)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        "Memory Usage",
                        fontWeight = FontWeight.Bold,
                        color = PlexColors.TextPrimary
                    )
                    Spacer(Modifier.height(12.dp))
                    
                    LinearProgressIndicator(
                        progress = { metrics.memoryPercentUsed / 100f },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(8.dp)
                            .clip(RoundedCornerShape(4.dp)),
                        color = when {
                            metrics.memoryPercentUsed > 80 -> PlexColors.Error
                            metrics.memoryPercentUsed > 60 -> PlexColors.Warning
                            else -> PlexColors.Success
                        },
                        trackColor = PlexColors.BackgroundElevated
                    )
                    
                    Spacer(Modifier.height(8.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text(
                            "${metrics.memoryUsedMB} MB used",
                            fontSize = 12.sp,
                            color = PlexColors.TextSecondary
                        )
                        Text(
                            "${metrics.memoryMaxMB} MB max",
                            fontSize = 12.sp,
                            color = PlexColors.TextSecondary
                        )
                    }
                }
            }
        }
        
        item {
            Text(
                "Last updated: ${formatTimestamp(metrics.lastUpdated)}",
                fontSize = 12.sp,
                color = PlexColors.TextSecondary
            )
        }
    }
}

@Composable
private fun FlagsTab(
    flags: Map<String, Boolean>,
    onToggleFlag: (String, Boolean) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            Text(
                "Feature Flags",
                fontWeight = FontWeight.Bold,
                color = PlexColors.TextPrimary,
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }
        
        items(flags.entries.toList()) { (key, value) ->
            Card(
                colors = CardDefaults.cardColors(containerColor = PlexColors.BackgroundSurface),
                shape = RoundedCornerShape(8.dp)
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = key.replace("_", " ").lowercase()
                                .replaceFirstChar { it.uppercase() },
                            fontWeight = FontWeight.Medium,
                            color = PlexColors.TextPrimary
                        )
                        Text(
                            text = key,
                            fontSize = 10.sp,
                            fontFamily = FontFamily.Monospace,
                            color = PlexColors.TextSecondary
                        )
                    }
                    Switch(
                        checked = value,
                        onCheckedChange = { onToggleFlag(key, it) },
                        colors = SwitchDefaults.colors(
                            checkedThumbColor = PlexColors.AccentPrimary,
                            checkedTrackColor = PlexColors.AccentPrimary.copy(alpha = 0.5f)
                        )
                    )
                }
            }
        }
    }
}

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
                color = PlexColors.TextPrimary,
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
                    contentColor = PlexColors.TextPrimary
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
private fun ToolsTab(
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
                color = PlexColors.TextPrimary,
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }
        
        item {
            Card(
                colors = CardDefaults.cardColors(containerColor = PlexColors.BackgroundSurface),
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
                        color = PlexColors.BackgroundElevated
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

@Composable
private fun ToolButton(
    icon: ImageVector,
    title: String,
    description: String,
    onClick: () -> Unit,
    destructive: Boolean = false
) {
    val color = if (destructive) PlexColors.Error else PlexColors.TextPrimary
    
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = icon,
            contentDescription = null,
            tint = color,
            modifier = Modifier.size(24.dp)
        )
        Spacer(Modifier.width(16.dp))
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                fontWeight = FontWeight.Medium,
                color = color
            )
            Text(
                text = description,
                fontSize = 12.sp,
                color = PlexColors.TextSecondary
            )
        }
        Icon(
            Icons.Default.ChevronRight,
            contentDescription = null,
            tint = PlexColors.TextSecondary
        )
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

@Composable
private fun BugReportDialog(
    onDismiss: () -> Unit,
    onSubmit: (title: String, description: String, steps: String) -> Unit
) {
    var title by remember { mutableStateOf("") }
    var description by remember { mutableStateOf("") }
    var steps by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    Icons.Default.BugReport,
                    contentDescription = null,
                    tint = PlexColors.AccentPrimary
                )
                Spacer(Modifier.width(8.dp))
                Text("Submit Bug Report")
            }
        },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                OutlinedTextField(
                    value = title,
                    onValueChange = { title = it },
                    label = { Text("Title") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                OutlinedTextField(
                    value = description,
                    onValueChange = { description = it },
                    label = { Text("Description") },
                    modifier = Modifier.fillMaxWidth(),
                    minLines = 3
                )
                OutlinedTextField(
                    value = steps,
                    onValueChange = { steps = it },
                    label = { Text("Steps to Reproduce") },
                    modifier = Modifier.fillMaxWidth(),
                    minLines = 2
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onSubmit(title, description, steps) },
                enabled = title.isNotBlank() && description.isNotBlank(),
                colors = ButtonDefaults.buttonColors(
                    containerColor = PlexColors.AccentPrimary
                )
            ) {
                Text("Submit")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = PlexColors.BackgroundSurface
    )
}

@Composable
private fun CrashDetailsDialog(
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
                    color = PlexColors.TextSecondary,
                    fontSize = 12.sp
                )
                Text(crash.message, color = PlexColors.TextPrimary)
                
                Text(
                    "Thread:",
                    fontWeight = FontWeight.Bold,
                    color = PlexColors.TextSecondary,
                    fontSize = 12.sp
                )
                Text(crash.threadName, color = PlexColors.TextPrimary)
                
                Text(
                    "Stack Trace:",
                    fontWeight = FontWeight.Bold,
                    color = PlexColors.TextSecondary,
                    fontSize = 12.sp
                )
                Surface(
                    color = PlexColors.Background,
                    shape = RoundedCornerShape(4.dp)
                ) {
                    Text(
                        text = crash.stackTrace,
                        fontFamily = FontFamily.Monospace,
                        fontSize = 10.sp,
                        color = PlexColors.TextPrimary,
                        modifier = Modifier.padding(8.dp)
                    )
                }
                
                Text(
                    "Device: ${crash.deviceInfo.manufacturer} ${crash.deviceInfo.model}",
                    fontSize = 10.sp,
                    color = PlexColors.TextSecondary
                )
                Text(
                    "Android: ${crash.deviceInfo.androidVersion} (API ${crash.deviceInfo.sdkVersion})",
                    fontSize = 10.sp,
                    color = PlexColors.TextSecondary
                )
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        },
        containerColor = PlexColors.BackgroundSurface
    )
}

@Composable
private fun ErrorDetailsDialog(
    error: ErrorLog,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                val color = when (error.level) {
                    LogLevel.ERROR -> PlexColors.Error
                    LogLevel.WARNING -> PlexColors.Warning
                    LogLevel.INFO -> PlexColors.AccentPrimary
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
                    color = PlexColors.TextSecondary
                )
                
                Text(
                    "Message:",
                    fontWeight = FontWeight.Bold,
                    color = PlexColors.TextSecondary,
                    fontSize = 12.sp
                )
                Text(error.message, color = PlexColors.TextPrimary)
                
                error.stackTrace?.let { trace ->
                    Text(
                        "Stack Trace:",
                        fontWeight = FontWeight.Bold,
                        color = PlexColors.TextSecondary,
                        fontSize = 12.sp
                    )
                    Surface(
                        color = PlexColors.Background,
                        shape = RoundedCornerShape(4.dp)
                    ) {
                        Text(
                            text = trace,
                            fontFamily = FontFamily.Monospace,
                            fontSize = 10.sp,
                            color = PlexColors.TextPrimary,
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
        containerColor = PlexColors.BackgroundSurface
    )
}

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
