package com.universalmedialibrary.ui.settings

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.widget.Toast
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.core.content.FileProvider
import androidx.core.content.ContextCompat
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.viewModelScope
import androidx.navigation.NavController
import com.universalmedialibrary.data.repository.CacheLocation
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.services.debug.DebugBugReportService
import com.universalmedialibrary.utils.PermissionsHandler
import com.universalmedialibrary.utils.rememberPermissionsHandler
import com.universalmedialibrary.jobs.WorkScheduler
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import java.util.Locale
import java.util.concurrent.TimeUnit

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FeedbackSettingsScreen(
    onBack: () -> Unit,
    viewModel: FeedbackViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val activity = context as? Activity
    val uiState by viewModel.uiState.collectAsState()
    var description by remember { mutableStateOf("") }
    var includeScreenshot by remember { mutableStateOf(true) }
    var includeLogs by remember { mutableStateOf(true) }
    var githubToken by remember { mutableStateOf("") }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Feedback & Bug Reports") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = "Create a detailed bug report (debug builds only) or open the GitHub issue tracker.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            OutlinedTextField(
                value = description,
                onValueChange = { description = it },
                label = { Text("What went wrong?") },
                modifier = Modifier.fillMaxWidth(),
                minLines = 3
            )

            Row(verticalAlignment = Alignment.CenterVertically) {
                Checkbox(checked = includeScreenshot, onCheckedChange = { includeScreenshot = it })
                Spacer(modifier = Modifier.width(8.dp))
                Text("Include screenshot")
            }

            Row(verticalAlignment = Alignment.CenterVertically) {
                Checkbox(checked = includeLogs, onCheckedChange = { includeLogs = it })
                Spacer(modifier = Modifier.width(8.dp))
                Text("Include logs")
            }

            Button(
                enabled = activity != null && !uiState.isBusy && description.isNotBlank(),
                onClick = {
                    viewModel.createAndSaveReport(
                        activity = activity!!,
                        description = description,
                        includeScreenshot = includeScreenshot,
                        includeLogs = includeLogs
                    )
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.BugReport, contentDescription = "Bug report")
                Spacer(modifier = Modifier.width(8.dp))
                Text(if (uiState.isBusy) "Working…" else "Save bug report")
            }

            uiState.savedReportUri?.let { uri ->
                Button(
                    onClick = {
                        val share = Intent(Intent.ACTION_SEND).apply {
                            type = "application/json"
                            putExtra(Intent.EXTRA_STREAM, uri)
                            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                        }
                        context.startActivity(Intent.createChooser(share, "Share bug report"))
                    },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Share, contentDescription = "Share report")
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Share saved report")
                }
            }

            OutlinedTextField(
                value = githubToken,
                onValueChange = { githubToken = it },
                label = { Text("GitHub token (optional, to auto-create issue)") },
                visualTransformation = PasswordVisualTransformation(),
                modifier = Modifier.fillMaxWidth()
            )

            Button(
                enabled = activity != null && !uiState.isBusy && description.isNotBlank() && githubToken.isNotBlank(),
                onClick = {
                    val token = githubToken
                    githubToken = ""
                    viewModel.createAndSubmitToGitHub(
                        activity = activity!!,
                        description = description,
                        includeScreenshot = includeScreenshot,
                        includeLogs = includeLogs,
                        githubToken = token
                    )
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Public, contentDescription = "GitHub")
                Spacer(modifier = Modifier.width(8.dp))
                Text("Create GitHub issue")
            }

            Button(
                onClick = {
                    val uri = Uri.parse("https://github.com/Kaleaon/CleverFerret/issues")
                    context.startActivity(Intent(Intent.ACTION_VIEW, uri))
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.OpenInBrowser, contentDescription = "Open browser")
                Spacer(modifier = Modifier.width(8.dp))
                Text("Open issue tracker")
            }

            uiState.message?.let { msg ->
                Text(
                    text = msg,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
            }

            uiState.error?.let { err ->
                Text(
                    text = err,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}
