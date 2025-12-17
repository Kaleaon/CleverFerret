package com.universalmedialibrary.debug

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.util.Log
import androidx.core.content.FileProvider
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.io.PrintWriter
import java.io.StringWriter
import java.text.SimpleDateFormat
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Debug Reporting Service
 * 
 * Comprehensive debug and crash reporting for debug builds:
 * - Automatic crash capture with stack traces
 * - Error logging and aggregation
 * - Performance metrics
 * - Manual bug report submission
 * - Log export functionality
 * - ANR detection
 */
@Singleton
class DebugReportingService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "DebugReporting"
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val json = Json { prettyPrint = true; ignoreUnknownKeys = true }
    
    private val _crashReports = MutableStateFlow<List<CrashReport>>(emptyList())
    val crashReports: StateFlow<List<CrashReport>> = _crashReports.asStateFlow()
    
    private val _errorLogs = MutableStateFlow<List<ErrorLog>>(emptyList())
    val errorLogs: StateFlow<List<ErrorLog>> = _errorLogs.asStateFlow()
    
    private val _performanceMetrics = MutableStateFlow<PerformanceMetrics>(PerformanceMetrics())
    val performanceMetrics: StateFlow<PerformanceMetrics> = _performanceMetrics.asStateFlow()
    
    private val _notifications = MutableSharedFlow<DebugNotification>()
    val notifications: SharedFlow<DebugNotification> = _notifications.asSharedFlow()
    
    private var isInitialized = false
    private var defaultExceptionHandler: Thread.UncaughtExceptionHandler? = null
    
    private val reportDir: File
        get() = File(context.filesDir, "debug_reports").also { it.mkdirs() }
    
    private val crashDir: File
        get() = File(reportDir, "crashes").also { it.mkdirs() }
    
    private val logDir: File
        get() = File(reportDir, "logs").also { it.mkdirs() }
    
    /**
     * Initialize crash reporting - call in Application.onCreate()
     */
    fun initialize() {
        if (isInitialized) return
        isInitialized = true
        
        // Install custom exception handler
        defaultExceptionHandler = Thread.getDefaultUncaughtExceptionHandler()
        Thread.setDefaultUncaughtExceptionHandler { thread, throwable ->
            handleUncaughtException(thread, throwable)
        }
        
        // Load existing reports
        loadExistingReports()
        
        // Start performance monitoring
        startPerformanceMonitoring()
        
        Log.i(TAG, "Debug reporting service initialized")
    }
    
    private fun handleUncaughtException(thread: Thread, throwable: Throwable) {
        try {
            val report = createCrashReport(thread, throwable)
            saveCrashReport(report)
            
            Log.e(TAG, "Crash captured: ${throwable.message}", throwable)
            
            // Notify about crash
            scope.launch {
                _crashReports.update { it + report }
                _notifications.emit(DebugNotification.CrashCaptured(report))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error saving crash report", e)
        } finally {
            // Pass to default handler
            defaultExceptionHandler?.uncaughtException(thread, throwable)
        }
    }
    
    private fun createCrashReport(thread: Thread, throwable: Throwable): CrashReport {
        val sw = StringWriter()
        throwable.printStackTrace(PrintWriter(sw))
        
        return CrashReport(
            id = UUID.randomUUID().toString(),
            timestamp = System.currentTimeMillis(),
            threadName = thread.name,
            exceptionClass = throwable.javaClass.name,
            message = throwable.message ?: "No message",
            stackTrace = sw.toString(),
            deviceInfo = getDeviceInfo(),
            appInfo = getAppInfo()
        )
    }
    
    private fun saveCrashReport(report: CrashReport) {
        try {
            val file = File(crashDir, "crash_${report.timestamp}.json")
            file.writeText(json.encodeToString(report))
        } catch (e: Exception) {
            Log.e(TAG, "Error writing crash report", e)
        }
    }
    
    private fun loadExistingReports() {
        scope.launch {
            try {
                val crashes = crashDir.listFiles()?.mapNotNull { file ->
                    try {
                        json.decodeFromString<CrashReport>(file.readText())
                    } catch (e: Exception) {
                        null
                    }
                }?.sortedByDescending { it.timestamp } ?: emptyList()
                
                _crashReports.value = crashes
            } catch (e: Exception) {
                Log.e(TAG, "Error loading existing reports", e)
            }
        }
    }
    
    private fun startPerformanceMonitoring() {
        scope.launch {
            while (true) {
                val runtime = Runtime.getRuntime()
                val usedMemory = runtime.totalMemory() - runtime.freeMemory()
                val maxMemory = runtime.maxMemory()
                
                _performanceMetrics.update { current ->
                    current.copy(
                        memoryUsedMB = usedMemory / (1024 * 1024),
                        memoryMaxMB = maxMemory / (1024 * 1024),
                        memoryPercentUsed = (usedMemory.toFloat() / maxMemory * 100).toInt(),
                        lastUpdated = System.currentTimeMillis()
                    )
                }
                
                kotlinx.coroutines.delay(5000)
            }
        }
    }
    
    // ==========================================================================
    // LOGGING
    // ==========================================================================
    
    fun logError(tag: String, message: String, throwable: Throwable? = null) {
        val errorLog = ErrorLog(
            id = UUID.randomUUID().toString(),
            timestamp = System.currentTimeMillis(),
            tag = tag,
            level = LogLevel.ERROR,
            message = message,
            stackTrace = throwable?.let {
                val sw = StringWriter()
                it.printStackTrace(PrintWriter(sw))
                sw.toString()
            }
        )
        
        scope.launch {
            _errorLogs.update { logs -> (logs + errorLog).takeLast(1000) }
        }
        
        Log.e(tag, message, throwable)
    }
    
    fun logWarning(tag: String, message: String) {
        val log = ErrorLog(
            id = UUID.randomUUID().toString(),
            timestamp = System.currentTimeMillis(),
            tag = tag,
            level = LogLevel.WARNING,
            message = message,
            stackTrace = null
        )
        
        scope.launch {
            _errorLogs.update { logs -> (logs + log).takeLast(1000) }
        }
        
        Log.w(tag, message)
    }
    
    fun logInfo(tag: String, message: String) {
        val log = ErrorLog(
            id = UUID.randomUUID().toString(),
            timestamp = System.currentTimeMillis(),
            tag = tag,
            level = LogLevel.INFO,
            message = message,
            stackTrace = null
        )
        
        scope.launch {
            _errorLogs.update { logs -> (logs + log).takeLast(1000) }
        }
        
        Log.i(tag, message)
    }
    
    // ==========================================================================
    // MANUAL REPORTING
    // ==========================================================================
    
    /**
     * Create a manual bug report
     */
    fun createBugReport(
        title: String,
        description: String,
        steps: String,
        includeLogs: Boolean = true,
        includeScreenshot: Boolean = false,
        screenshotUri: Uri? = null
    ): BugReport {
        return BugReport(
            id = UUID.randomUUID().toString(),
            timestamp = System.currentTimeMillis(),
            title = title,
            description = description,
            stepsToReproduce = steps,
            deviceInfo = getDeviceInfo(),
            appInfo = getAppInfo(),
            recentErrors = if (includeLogs) _errorLogs.value.takeLast(50) else emptyList(),
            recentCrashes = if (includeLogs) _crashReports.value.takeLast(5) else emptyList(),
            performanceSnapshot = _performanceMetrics.value,
            screenshotPath = screenshotUri?.toString()
        )
    }
    
    /**
     * Export bug report for sharing
     */
    fun exportBugReport(report: BugReport): File {
        val file = File(reportDir, "bug_report_${report.timestamp}.json")
        file.writeText(json.encodeToString(report))
        return file
    }
    
    /**
     * Share bug report via email/other apps
     */
    fun shareBugReport(report: BugReport): Intent {
        val file = exportBugReport(report)
        val uri = FileProvider.getUriForFile(
            context,
            "${context.packageName}.fileprovider",
            file
        )
        
        return Intent(Intent.ACTION_SEND).apply {
            type = "application/json"
            putExtra(Intent.EXTRA_SUBJECT, "CleverFerret Bug Report: ${report.title}")
            putExtra(Intent.EXTRA_TEXT, buildReportEmailBody(report))
            putExtra(Intent.EXTRA_STREAM, uri)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
    }
    
    private fun buildReportEmailBody(report: BugReport): String {
        return """
            |Bug Report: ${report.title}
            |
            |Description:
            |${report.description}
            |
            |Steps to Reproduce:
            |${report.stepsToReproduce}
            |
            |Device Info:
            |${report.deviceInfo.model} (${report.deviceInfo.manufacturer})
            |Android ${report.deviceInfo.androidVersion} (API ${report.deviceInfo.sdkVersion})
            |
            |App Info:
            |Version: ${report.appInfo.versionName} (${report.appInfo.versionCode})
            |Build: ${report.appInfo.buildType}
            |
            |Recent Errors: ${report.recentErrors.size}
            |Recent Crashes: ${report.recentCrashes.size}
            |
            |Timestamp: ${formatTimestamp(report.timestamp)}
            |Report ID: ${report.id}
        """.trimMargin()
    }
    
    // ==========================================================================
    // EXPORT & CLEANUP
    // ==========================================================================
    
    /**
     * Export all logs to a file
     * 
     * @throws IOException if writing to file fails
     */
    fun exportAllLogs(): File {
        val timestamp = System.currentTimeMillis()
        val file = File(logDir, "full_log_export_$timestamp.json")
        
        try {
            val export = LogExport(
                timestamp = timestamp,
                deviceInfo = getDeviceInfo(),
                appInfo = getAppInfo(),
                crashes = _crashReports.value,
                errors = _errorLogs.value,
                performance = _performanceMetrics.value
            )
            
            file.writeText(json.encodeToString(export))
        } catch (e: Exception) {
            Log.e(TAG, "Error exporting logs to file", e)
            throw e
        }
        return file
    }
    
    /**
     * Clear all crash reports
     */
    fun clearCrashReports() {
        crashDir.listFiles()?.forEach { it.delete() }
        scope.launch {
            _crashReports.value = emptyList()
        }
    }
    
    /**
     * Clear all error logs
     */
    fun clearErrorLogs() {
        scope.launch {
            _errorLogs.value = emptyList()
        }
    }
    
    // ==========================================================================
    // DEVICE & APP INFO
    // ==========================================================================
    
    private fun getDeviceInfo(): DeviceInfo {
        return DeviceInfo(
            manufacturer = Build.MANUFACTURER,
            model = Build.MODEL,
            device = Build.DEVICE,
            product = Build.PRODUCT,
            androidVersion = Build.VERSION.RELEASE,
            sdkVersion = Build.VERSION.SDK_INT,
            screenDensity = context.resources.displayMetrics.density,
            screenWidth = context.resources.displayMetrics.widthPixels,
            screenHeight = context.resources.displayMetrics.heightPixels,
            locale = Locale.getDefault().toString(),
            timezone = TimeZone.getDefault().id
        )
    }
    
    private fun getAppInfo(): AppInfo {
        return try {
            val packageInfo = context.packageManager.getPackageInfo(context.packageName, 0)
            AppInfo(
                packageName = context.packageName,
                versionName = packageInfo.versionName ?: "unknown",
                versionCode = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                    packageInfo.longVersionCode.toInt()
                } else {
                    @Suppress("DEPRECATION")
                    packageInfo.versionCode
                },
                buildType = if (isDebugBuild()) "debug" else "release",
                installTime = packageInfo.firstInstallTime,
                updateTime = packageInfo.lastUpdateTime
            )
        } catch (e: PackageManager.NameNotFoundException) {
            AppInfo(
                packageName = context.packageName,
                versionName = "unknown",
                versionCode = 0,
                buildType = "unknown",
                installTime = 0,
                updateTime = 0
            )
        }
    }
    
    private fun isDebugBuild(): Boolean {
        return try {
            val buildConfig = Class.forName("${context.packageName}.BuildConfig")
            val debugField = buildConfig.getField("DEBUG")
            debugField.getBoolean(null)
        } catch (e: Exception) {
            false
        }
    }
    
    private fun formatTimestamp(timestamp: Long): String {
        return SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(Date(timestamp))
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

@Serializable
data class CrashReport(
    val id: String,
    val timestamp: Long,
    val threadName: String,
    val exceptionClass: String,
    val message: String,
    val stackTrace: String,
    val deviceInfo: DeviceInfo,
    val appInfo: AppInfo
)

@Serializable
data class ErrorLog(
    val id: String,
    val timestamp: Long,
    val tag: String,
    val level: LogLevel,
    val message: String,
    val stackTrace: String?
)

@Serializable
enum class LogLevel {
    INFO, WARNING, ERROR
}

@Serializable
data class DeviceInfo(
    val manufacturer: String,
    val model: String,
    val device: String,
    val product: String,
    val androidVersion: String,
    val sdkVersion: Int,
    val screenDensity: Float,
    val screenWidth: Int,
    val screenHeight: Int,
    val locale: String,
    val timezone: String
)

@Serializable
data class AppInfo(
    val packageName: String,
    val versionName: String,
    val versionCode: Int,
    val buildType: String,
    val installTime: Long,
    val updateTime: Long
)

@Serializable
data class PerformanceMetrics(
    val memoryUsedMB: Long = 0,
    val memoryMaxMB: Long = 0,
    val memoryPercentUsed: Int = 0,
    val lastUpdated: Long = 0
)

@Serializable
data class BugReport(
    val id: String,
    val timestamp: Long,
    val title: String,
    val description: String,
    val stepsToReproduce: String,
    val deviceInfo: DeviceInfo,
    val appInfo: AppInfo,
    val recentErrors: List<ErrorLog>,
    val recentCrashes: List<CrashReport>,
    val performanceSnapshot: PerformanceMetrics,
    val screenshotPath: String? = null
)

@Serializable
data class LogExport(
    val timestamp: Long,
    val deviceInfo: DeviceInfo,
    val appInfo: AppInfo,
    val crashes: List<CrashReport>,
    val errors: List<ErrorLog>,
    val performance: PerformanceMetrics
)

sealed class DebugNotification {
    data class CrashCaptured(val report: CrashReport) : DebugNotification()
    data class ErrorLogged(val log: ErrorLog) : DebugNotification()
    data class PerformanceWarning(val message: String) : DebugNotification()
}
