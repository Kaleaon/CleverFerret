package com.universalmedialibrary.ui.debug

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.net.Uri
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.scaleIn
import androidx.compose.animation.scaleOut
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.BugReport
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Error
import androidx.compose.material.icons.filled.Image
import androidx.compose.material.icons.filled.Info
import androidx.compose.material.icons.filled.Send
import androidx.compose.material.icons.filled.WarningAmber
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Checkbox
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ElevatedCard
import androidx.compose.material3.FilledTonalButton
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.FloatingActionButtonDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Surface
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.services.debug.BugReport
import com.universalmedialibrary.services.debug.DebugBugReportService
import kotlinx.coroutines.launch

/**
 * Floating debug bug report button
 * 
 * Only visible in debug builds. Shows a floating action button that,
 * when tapped, captures a screenshot and opens the bug report dialog.
 */
@Composable
fun DebugBugReportButton(
    activity: Activity,
    bugReportService: DebugBugReportService,
    modifier: Modifier = Modifier
) {
    // Only show in debug builds
    if (!BuildConfig.DEBUG) return

    var showDialog by rememberSaveable { mutableStateOf(false) }
    var screenshot by remember { mutableStateOf<Bitmap?>(null) }
    var isCapturing by remember { mutableStateOf(false) }
    val scope = rememberCoroutineScope()

    // Pulsating animation for attention
    var pulseAlpha by remember { mutableStateOf(1f) }
    val animatedAlpha by animateFloatAsState(
        targetValue = pulseAlpha,
        animationSpec = tween(1000),
        label = "bugButtonPulse"
    )

    Box(modifier = modifier) {
        FloatingActionButton(
            onClick = {
                scope.launch {
                    isCapturing = true
                    // Capture screenshot before showing dialog
                    val result = bugReportService.captureScreenshot(activity)
                    screenshot = result.getOrNull()
                    isCapturing = false
                    showDialog = true
                }
            },
            containerColor = MaterialTheme.colorScheme.errorContainer,
            contentColor = MaterialTheme.colorScheme.onErrorContainer,
            modifier = Modifier
                .alpha(if (isCapturing) 0.7f else animatedAlpha)
                .size(48.dp),
            elevation = FloatingActionButtonDefaults.elevation(defaultElevation = 6.dp)
        ) {
            if (isCapturing) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    strokeWidth = 2.dp,
                    color = MaterialTheme.colorScheme.onErrorContainer
                )
            } else {
                Icon(
                    imageVector = Icons.Default.BugReport,
                    contentDescription = "Report Bug",
                    modifier = Modifier.size(24.dp)
                )
            }
        }
    }

    if (showDialog) {
        BugReportDialog(
            activity = activity,
            bugReportService = bugReportService,
            initialScreenshot = screenshot,
            onDismiss = { 
                showDialog = false
                screenshot = null
            }
        )
    }
}

/**
 * Compact debug bug report button for the bottom navigation bar
 * 
 * Only visible in debug builds. Shows a small icon button that,
 * when tapped, captures a screenshot and opens the bug report dialog.
 */
@Composable
fun DebugBugReportBottomBarButton(
    activity: Activity,
    bugReportService: DebugBugReportService,
    modifier: Modifier = Modifier
) {
    // Only show in debug builds
    if (!BuildConfig.DEBUG) return

    var showDialog by rememberSaveable { mutableStateOf(false) }
    var screenshot by remember { mutableStateOf<Bitmap?>(null) }
    var isCapturing by remember { mutableStateOf(false) }
    val scope = rememberCoroutineScope()

    Surface(
        modifier = modifier.size(48.dp),
        shape = RoundedCornerShape(12.dp),
        color = MaterialTheme.colorScheme.errorContainer.copy(alpha = 0.9f),
        tonalElevation = 2.dp
    ) {
        Box(
            contentAlignment = Alignment.Center,
            modifier = Modifier
                .fillMaxSize()
                .clickable(enabled = !isCapturing) {
                    scope.launch {
                        isCapturing = true
                        // Capture screenshot before showing dialog
                        val result = bugReportService.captureScreenshot(activity)
                        screenshot = result.getOrNull()
                        isCapturing = false
                        showDialog = true
                    }
                }
        ) {
            if (isCapturing) {
                CircularProgressIndicator(
                    modifier = Modifier.size(20.dp),
                    strokeWidth = 2.dp,
                    color = MaterialTheme.colorScheme.onErrorContainer
                )
            } else {
                Icon(
                    imageVector = Icons.Default.BugReport,
                    contentDescription = "Report Bug",
                    modifier = Modifier.size(24.dp),
                    tint = MaterialTheme.colorScheme.onErrorContainer
                )
            }
        }
    }

    if (showDialog) {
        BugReportDialog(
            activity = activity,
            bugReportService = bugReportService,
            initialScreenshot = screenshot,
            onDismiss = { 
                showDialog = false
                screenshot = null
            }
        )
    }
}

/**
 * Bug report dialog for collecting user input and submitting reports
 */
@Composable
fun BugReportDialog(
    activity: Activity,
    bugReportService: DebugBugReportService,
    initialScreenshot: Bitmap?,
    onDismiss: () -> Unit
) {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    
    var userDescription by rememberSaveable { mutableStateOf("") }
    var includeScreenshot by rememberSaveable { mutableStateOf(true) }
    var includeLogs by rememberSaveable { mutableStateOf(true) }
    var screenshot by remember { mutableStateOf(initialScreenshot) }
    
    // Submission states
    var isSubmitting by remember { mutableStateOf(false) }
    var submissionResult by remember { mutableStateOf<SubmissionResult?>(null) }
    var bugReport by remember { mutableStateOf<BugReport?>(null) }

    // Get GitHub token from secure storage
    val githubToken = remember { getGitHubToken(context) }

    Dialog(
        onDismissRequest = { if (!isSubmitting) onDismiss() },
        properties = DialogProperties(
            dismissOnBackPress = !isSubmitting,
            dismissOnClickOutside = !isSubmitting,
            usePlatformDefaultWidth = false
        )
    ) {
        Surface(
            modifier = Modifier
                .fillMaxWidth(0.95f)
                .padding(vertical = 16.dp),
            shape = RoundedCornerShape(24.dp),
            color = MaterialTheme.colorScheme.surface,
            tonalElevation = 8.dp
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(24.dp)
            ) {
                // Header
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.BugReport,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.error,
                            modifier = Modifier.size(28.dp)
                        )
                        Column {
                            Text(
                                text = "Report a Bug",
                                style = MaterialTheme.typography.titleLarge,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "Debug Build Only",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                    
                    IconButton(
                        onClick = onDismiss,
                        enabled = !isSubmitting
                    ) {
                        Icon(Icons.Default.Close, contentDescription = "Close")
                    }
                }

                Spacer(modifier = Modifier.height(20.dp))

                when {
                    submissionResult != null -> {
                        // Show result
                        SubmissionResultContent(
                            result = submissionResult!!,
                            onDismiss = onDismiss,
                            onRetry = { submissionResult = null }
                        )
                    }
                    isSubmitting -> {
                        // Show loading
                        SubmittingContent()
                    }
                    else -> {
                        // Show form
                        BugReportForm(
                            userDescription = userDescription,
                            onDescriptionChange = { userDescription = it },
                            includeScreenshot = includeScreenshot,
                            onIncludeScreenshotChange = { includeScreenshot = it },
                            includeLogs = includeLogs,
                            onIncludeLogsChange = { includeLogs = it },
                            screenshot = screenshot,
                            onRetakeScreenshot = {
                                scope.launch {
                                    val result = bugReportService.captureScreenshot(activity)
                                    screenshot = result.getOrNull()
                                }
                            },
                            hasGitHubToken = !githubToken.isNullOrBlank(),
                            onSubmit = {
                                scope.launch {
                                    isSubmitting = true
                                    
                                    // Create the bug report
                                    val report = bugReportService.createBugReport(
                                        activity = activity,
                                        userDescription = userDescription,
                                        includeScreenshot = includeScreenshot && screenshot != null,
                                        includeLogs = includeLogs
                                    ).copy(screenshot = if (includeScreenshot) screenshot else null)
                                    
                                    bugReport = report
                                    
                                    // Save locally first
                                    bugReportService.saveLocally(report)
                                    
                                    // Try to submit to GitHub
                                    if (!githubToken.isNullOrBlank()) {
                                        val result = bugReportService.submitToGitHub(report, githubToken)
                                        submissionResult = result.fold(
                                            onSuccess = { url ->
                                                SubmissionResult.Success(url)
                                            },
                                            onFailure = { error ->
                                                SubmissionResult.Error(error.message ?: "Unknown error")
                                            }
                                        )
                                    } else {
                                        submissionResult = SubmissionResult.SavedLocally
                                    }
                                    
                                    isSubmitting = false
                                }
                            },
                            isValid = userDescription.isNotBlank()
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun BugReportForm(
    userDescription: String,
    onDescriptionChange: (String) -> Unit,
    includeScreenshot: Boolean,
    onIncludeScreenshotChange: (Boolean) -> Unit,
    includeLogs: Boolean,
    onIncludeLogsChange: (Boolean) -> Unit,
    screenshot: Bitmap?,
    onRetakeScreenshot: () -> Unit,
    hasGitHubToken: Boolean,
    onSubmit: () -> Unit,
    isValid: Boolean
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        // Description field
        OutlinedTextField(
            value = userDescription,
            onValueChange = onDescriptionChange,
            label = { Text("Describe the bug") },
            placeholder = { Text("What happened? What did you expect?") },
            modifier = Modifier
                .fillMaxWidth()
                .height(150.dp),
            shape = RoundedCornerShape(12.dp),
            minLines = 4,
            maxLines = 8
        )

        // Screenshot preview
        if (screenshot != null) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(12.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Icon(
                                Icons.Default.Image,
                                contentDescription = null,
                                modifier = Modifier.size(20.dp)
                            )
                            Text(
                                text = "Screenshot captured",
                                style = MaterialTheme.typography.bodyMedium
                            )
                        }
                        TextButton(onClick = onRetakeScreenshot) {
                            Text("Retake")
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    Image(
                        bitmap = screenshot.asImageBitmap(),
                        contentDescription = "Screenshot",
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(200.dp)
                            .clip(RoundedCornerShape(8.dp))
                            .border(
                                1.dp,
                                MaterialTheme.colorScheme.outline.copy(alpha = 0.3f),
                                RoundedCornerShape(8.dp)
                            ),
                        contentScale = ContentScale.Fit
                    )
                }
            }
        }

        // Options
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)
            )
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    text = "Include in report",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.SemiBold
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Screenshot")
                    Switch(
                        checked = includeScreenshot && screenshot != null,
                        onCheckedChange = onIncludeScreenshotChange,
                        enabled = screenshot != null
                    )
                }
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("System logs")
                    Switch(
                        checked = includeLogs,
                        onCheckedChange = onIncludeLogsChange
                    )
                }
            }
        }

        // Info banner
        if (!hasGitHubToken) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(12.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Row(
                    modifier = Modifier.padding(12.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.Info,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Text(
                        text = "Bug report will be saved locally. Configure GitHub token in Settings > API to enable automatic issue creation.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }
        }

        // Submit button
        Button(
            onClick = onSubmit,
            modifier = Modifier.fillMaxWidth(),
            enabled = isValid,
            shape = RoundedCornerShape(12.dp)
        ) {
            Icon(
                Icons.Default.Send,
                contentDescription = null,
                modifier = Modifier.size(18.dp)
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(if (hasGitHubToken) "Submit to GitHub" else "Save Report")
        }
    }
}

@Composable
private fun SubmittingContent() {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        CircularProgressIndicator()
        Text(
            text = "Submitting bug report...",
            style = MaterialTheme.typography.bodyLarge
        )
        Text(
            text = "Creating GitHub issue with bug details",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun SubmissionResultContent(
    result: SubmissionResult,
    onDismiss: () -> Unit,
    onRetry: () -> Unit
) {
    val context = LocalContext.current
    
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        when (result) {
            is SubmissionResult.Success -> {
                Icon(
                    Icons.Default.Check,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier
                        .size(64.dp)
                        .background(
                            MaterialTheme.colorScheme.primaryContainer,
                            CircleShape
                        )
                        .padding(16.dp)
                )
                
                Text(
                    text = "Bug Report Submitted!",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                
                Text(
                    text = "Issue created and labeled for automated fix consideration.",
                    style = MaterialTheme.typography.bodyMedium,
                    textAlign = TextAlign.Center,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                FilledTonalButton(
                    onClick = {
                        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(result.issueUrl))
                        context.startActivity(intent)
                    }
                ) {
                    Text("View Issue on GitHub")
                }
                
                OutlinedButton(onClick = onDismiss) {
                    Text("Done")
                }
            }
            
            is SubmissionResult.SavedLocally -> {
                Icon(
                    Icons.Default.Check,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier
                        .size(64.dp)
                        .background(
                            MaterialTheme.colorScheme.primaryContainer,
                            CircleShape
                        )
                        .padding(16.dp)
                )
                
                Text(
                    text = "Report Saved Locally",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                
                Text(
                    text = "Bug report saved to device. Configure GitHub token in Settings to enable automatic issue creation.",
                    style = MaterialTheme.typography.bodyMedium,
                    textAlign = TextAlign.Center,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                Button(onClick = onDismiss) {
                    Text("Done")
                }
            }
            
            is SubmissionResult.Error -> {
                Icon(
                    Icons.Default.Error,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.error,
                    modifier = Modifier
                        .size(64.dp)
                        .background(
                            MaterialTheme.colorScheme.errorContainer,
                            CircleShape
                        )
                        .padding(16.dp)
                )
                
                Text(
                    text = "Submission Failed",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                
                Text(
                    text = result.message,
                    style = MaterialTheme.typography.bodyMedium,
                    textAlign = TextAlign.Center,
                    color = MaterialTheme.colorScheme.error
                )
                
                Text(
                    text = "Bug report was saved locally as a backup.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    OutlinedButton(onClick = onDismiss) {
                        Text("Close")
                    }
                    Button(onClick = onRetry) {
                        Text("Try Again")
                    }
                }
            }
        }
    }
}

sealed class SubmissionResult {
    data class Success(val issueUrl: String) : SubmissionResult()
    data object SavedLocally : SubmissionResult()
    data class Error(val message: String) : SubmissionResult()
}

/**
 * Get the GitHub token from secure storage
 * Returns null if not configured
 */
private fun getGitHubToken(context: Context): String? {
    return try {
        val prefs = context.getSharedPreferences("api_settings", Context.MODE_PRIVATE)
        prefs.getString("github_token", null)
    } catch (e: Exception) {
        null
    }
}
