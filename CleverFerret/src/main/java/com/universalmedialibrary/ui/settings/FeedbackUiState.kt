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

data class FeedbackUiState(
    val isBusy: Boolean = false,
    val message: String? = null,
    val error: String? = null,
    val savedReportUri: Uri? = null
)

@HiltViewModel
class FeedbackViewModel @Inject constructor(
    private val bugReportService: DebugBugReportService
) : androidx.lifecycle.ViewModel() {
    private val _uiState = kotlinx.coroutines.flow.MutableStateFlow(FeedbackUiState())
    val uiState: StateFlow<FeedbackUiState> = _uiState

    fun createAndSaveReport(
        activity: Activity,
        description: String,
        includeScreenshot: Boolean,
        includeLogs: Boolean
    ) {
        viewModelScope.launch {
            _uiState.value = FeedbackUiState(isBusy = true)
            try {
                val report = bugReportService.createBugReport(
                    activity = activity,
                    userDescription = description,
                    includeScreenshot = includeScreenshot,
                    includeLogs = includeLogs
                )
                val file = bugReportService.saveLocally(report).getOrThrow()
                val uri = FileProvider.getUriForFile(
                    activity,
                    "${activity.packageName}.fileprovider",
                    file
                )
                _uiState.value = FeedbackUiState(
                    isBusy = false,
                    message = "Saved report: ${file.name}",
                    savedReportUri = uri
                )
            } catch (e: Exception) {
                _uiState.value = FeedbackUiState(isBusy = false, error = e.message ?: "Failed to create report")
            }
        }
    }

    fun createAndSubmitToGitHub(
        activity: Activity,
        description: String,
        includeScreenshot: Boolean,
        includeLogs: Boolean,
        githubToken: String
    ) {
        viewModelScope.launch {
            _uiState.value = FeedbackUiState(isBusy = true)
            try {
                val report = bugReportService.createBugReport(
                    activity = activity,
                    userDescription = description,
                    includeScreenshot = includeScreenshot,
                    includeLogs = includeLogs
                )
                val issueUrl = bugReportService.submitToGitHub(report, githubToken).getOrThrow()
                _uiState.value = FeedbackUiState(
                    isBusy = false,
                    message = "Created issue: $issueUrl"
                )
            } catch (e: Exception) {
                _uiState.value = FeedbackUiState(isBusy = false, error = e.message ?: "Failed to create issue")
            }
        }
    }
}
