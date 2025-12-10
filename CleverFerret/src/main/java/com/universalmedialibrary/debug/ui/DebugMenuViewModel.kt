package com.universalmedialibrary.debug.ui

import android.content.Context
import android.content.Intent
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.debug.*
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the Debug Menu Screen
 */
@HiltViewModel
class DebugMenuViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val debugReportingService: DebugReportingService,
    private val featureFlagManager: FeatureFlagManager
) : ViewModel() {
    
    private val _state = MutableStateFlow(DebugMenuState())
    val state: StateFlow<DebugMenuState> = _state.asStateFlow()
    
    init {
        observeCrashReports()
        observeErrorLogs()
        observePerformanceMetrics()
        observeFeatureFlags()
    }
    
    private fun observeCrashReports() {
        viewModelScope.launch {
            debugReportingService.crashReports.collect { crashes ->
                _state.update { it.copy(crashReports = crashes) }
            }
        }
    }
    
    private fun observeErrorLogs() {
        viewModelScope.launch {
            debugReportingService.errorLogs.collect { logs ->
                _state.update { it.copy(errorLogs = logs) }
            }
        }
    }
    
    private fun observePerformanceMetrics() {
        viewModelScope.launch {
            debugReportingService.performanceMetrics.collect { metrics ->
                _state.update { it.copy(performanceMetrics = metrics) }
            }
        }
    }
    
    private fun observeFeatureFlags() {
        viewModelScope.launch {
            featureFlagManager.flags.collect { flags ->
                _state.update { it.copy(featureFlags = flags) }
            }
        }
    }
    
    fun clearCrashReports() {
        debugReportingService.clearCrashReports()
    }
    
    fun clearErrorLogs() {
        debugReportingService.clearErrorLogs()
    }
    
    fun toggleFlag(key: String, value: Boolean) {
        featureFlagManager.setFlag(key, value)
    }
    
    fun triggerTestNotification(type: String) {
        // Log a test notification event
        debugReportingService.logInfo("DebugMenu", "Test notification triggered: $type")
        // The actual notification would be triggered via NotificationService
    }
    
    fun submitBugReport(title: String, description: String, steps: String): Intent {
        val report = debugReportingService.createBugReport(
            title = title,
            description = description,
            steps = steps,
            includeLogs = true
        )
        return debugReportingService.shareBugReport(report)
    }
    
    fun exportLogs(): Intent {
        val file = debugReportingService.exportAllLogs()
        return Intent(Intent.ACTION_SEND).apply {
            type = "application/json"
            putExtra(Intent.EXTRA_SUBJECT, "CleverFerret Debug Logs Export")
            putExtra(Intent.EXTRA_TEXT, "Debug logs exported from CleverFerret")
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
    }
    
    fun simulateCrash() {
        // This will be caught by the crash handler
        throw RuntimeException("Test crash triggered from Debug Menu")
    }
}

data class DebugMenuState(
    val crashReports: List<CrashReport> = emptyList(),
    val errorLogs: List<ErrorLog> = emptyList(),
    val performanceMetrics: PerformanceMetrics = PerformanceMetrics(),
    val featureFlags: Map<String, Boolean> = emptyMap()
)
