package com.universalmedialibrary.services.debug

import android.app.Activity
import android.content.Context
import android.graphics.Bitmap
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Base64
import android.util.Log
import android.view.PixelCopy
import android.view.View
import android.view.Window
import androidx.compose.ui.graphics.ImageBitmap
import androidx.compose.ui.graphics.asAndroidBitmap
import com.universalmedialibrary.BuildConfig
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.encodeToString
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.coroutines.resume

/**
 * Debug Bug Report Service
 * 
 * Provides functionality for capturing bug reports in debug builds:
 * - Screenshot capture from the current screen
 * - Log collection from logcat
 * - Device and app information gathering
 * - GitHub issue creation with auto-assignment to Copilot
 * 
 * Only active in debug builds via BuildConfig.DEBUG check
 */
@Singleton
class DebugBugReportService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val okHttpClient: OkHttpClient
) {

    companion object {
        private const val TAG = "DebugBugReport"
        private const val GITHUB_API_URL = "https://api.github.com"
        private const val REPO_OWNER = "Kaleaon"
        private const val REPO_NAME = "CleverFerret"
        private const val MAX_LOG_LINES = 500
        private const val MAX_SCREENSHOT_WIDTH = 1080
    }

    private val json = Json { 
        prettyPrint = true 
        ignoreUnknownKeys = true
    }
    
    // Cached error logs from recent errors
    private val recentErrors = mutableListOf<ErrorLogEntry>()
    private val maxRecentErrors = 20

    /**
     * Check if bug reporting is available (debug builds only)
     */
    fun isAvailable(): Boolean = BuildConfig.DEBUG

    /**
     * Log an error that can be included in bug reports
     */
    fun logError(tag: String, message: String, throwable: Throwable? = null) {
        if (!isAvailable()) return
        
        synchronized(recentErrors) {
            recentErrors.add(
                ErrorLogEntry(
                    timestamp = System.currentTimeMillis(),
                    tag = tag,
                    message = message,
                    stackTrace = throwable?.stackTraceToString()
                )
            )
            
            // Keep only recent errors
            while (recentErrors.size > maxRecentErrors) {
                recentErrors.removeAt(0)
            }
        }
    }

    /**
     * Capture a screenshot from the given Activity's window
     */
    suspend fun captureScreenshot(activity: Activity): Result<Bitmap> = withContext(Dispatchers.Main) {
        if (!isAvailable()) {
            return@withContext Result.failure(IllegalStateException("Bug reporting not available in release builds"))
        }

        try {
            val window = activity.window
            val view = window.decorView.rootView
            
            // Use PixelCopy for API 26+ (minimum SDK is 26)
            val bitmap = Bitmap.createBitmap(view.width, view.height, Bitmap.Config.ARGB_8888)
            
            suspendCancellableCoroutine { continuation ->
                PixelCopy.request(
                    window,
                    bitmap,
                    { copyResult ->
                        if (copyResult == PixelCopy.SUCCESS) {
                            // Scale down if needed to save bandwidth
                            val scaledBitmap = if (bitmap.width > MAX_SCREENSHOT_WIDTH) {
                                val scale = MAX_SCREENSHOT_WIDTH.toFloat() / bitmap.width
                                Bitmap.createScaledBitmap(
                                    bitmap,
                                    MAX_SCREENSHOT_WIDTH,
                                    (bitmap.height * scale).toInt(),
                                    true
                                )
                            } else {
                                bitmap
                            }
                            continuation.resume(Result.success(scaledBitmap))
                        } else {
                            continuation.resume(Result.failure(Exception("PixelCopy failed with code: $copyResult")))
                        }
                    },
                    Handler(Looper.getMainLooper())
                )
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to capture screenshot", e)
            Result.failure(e)
        }
    }

    /**
     * Collect device and app information
     */
    fun collectDeviceInfo(): DeviceInfo {
        return DeviceInfo(
            appVersion = BuildConfig.VERSION_NAME,
            appVersionCode = BuildConfig.VERSION_CODE,
            buildType = if (BuildConfig.DEBUG) "debug" else "release",
            androidVersion = Build.VERSION.RELEASE,
            apiLevel = Build.VERSION.SDK_INT,
            manufacturer = Build.MANUFACTURER,
            model = Build.MODEL,
            device = Build.DEVICE,
            product = Build.PRODUCT,
            supportedAbis = Build.SUPPORTED_ABIS.toList(),
            availableMemoryMb = getAvailableMemoryMb(),
            totalMemoryMb = getTotalMemoryMb(),
            freeStorageMb = getFreeStorageMb()
        )
    }

    /**
     * Collect recent logcat logs
     */
    suspend fun collectLogs(): String = withContext(Dispatchers.IO) {
        try {
            val process = Runtime.getRuntime().exec(
                arrayOf("logcat", "-d", "-t", MAX_LOG_LINES.toString(), "-v", "threadtime")
            )
            val logs = process.inputStream.bufferedReader().readText()
            process.destroy()
            
            // Filter to only include app logs
            logs.lines()
                .filter { it.contains(context.packageName) || it.contains("CleverFerret") }
                .takeLast(MAX_LOG_LINES)
                .joinToString("\n")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to collect logs", e)
            "Failed to collect logs: ${e.message}"
        }
    }

    /**
     * Get recent errors logged through logError()
     */
    fun getRecentErrors(): List<ErrorLogEntry> {
        return synchronized(recentErrors) {
            recentErrors.toList()
        }
    }

    /**
     * Create a complete bug report
     */
    suspend fun createBugReport(
        activity: Activity,
        userDescription: String,
        includeScreenshot: Boolean = true,
        includeLogs: Boolean = true
    ): BugReport {
        val timestamp = System.currentTimeMillis()
        val dateFormat = SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
        
        // Capture screenshot
        val screenshot = if (includeScreenshot) {
            captureScreenshot(activity).getOrNull()
        } else null

        // Collect logs
        val logs = if (includeLogs) {
            collectLogs()
        } else ""

        // Collect device info
        val deviceInfo = collectDeviceInfo()

        // Get recent errors
        val errors = getRecentErrors()

        return BugReport(
            id = "bug_${timestamp}",
            timestamp = timestamp,
            formattedDate = dateFormat.format(Date(timestamp)),
            userDescription = userDescription,
            deviceInfo = deviceInfo,
            logs = logs,
            recentErrors = errors,
            screenshot = screenshot
        )
    }

    /**
     * Submit bug report to GitHub as an issue
     * 
     * @param report The bug report to submit
     * @param githubToken Optional GitHub personal access token for authentication
     * @return Result with the issue URL on success
     */
    suspend fun submitToGitHub(
        report: BugReport,
        githubToken: String?
    ): Result<String> = withContext(Dispatchers.IO) {
        if (githubToken.isNullOrBlank()) {
            return@withContext Result.failure(
                IllegalArgumentException("GitHub token is required to create issues")
            )
        }

        try {
            val issueBody = buildGitHubIssueBody(report)
            val issueTitle = "[Auto Bug Report] ${report.userDescription.take(60)}${if (report.userDescription.length > 60) "..." else ""}"

            val requestBody = json.encodeToString(
                GitHubIssueRequest(
                    title = issueTitle,
                    body = issueBody,
                    labels = listOf("bug", "auto-reported", "copilot-fix-me"),
                    assignees = emptyList() // Leave unassigned - label triggers automated processing
                )
            )

            val request = Request.Builder()
                .url("$GITHUB_API_URL/repos/$REPO_OWNER/$REPO_NAME/issues")
                .addHeader("Authorization", "Bearer $githubToken")
                .addHeader("Accept", "application/vnd.github+json")
                .addHeader("X-GitHub-Api-Version", "2022-11-28")
                .post(requestBody.toRequestBody("application/json".toMediaType()))
                .build()

            val response = okHttpClient.newCall(request).execute()

            if (response.isSuccessful) {
                val responseBody = response.body?.string()
                val issueResponse = responseBody?.let {
                    try {
                        json.decodeFromString<GitHubIssueResponse>(it)
                    } catch (e: Exception) {
                        null
                    }
                }
                
                val issueUrl = issueResponse?.htmlUrl 
                    ?: "https://github.com/$REPO_OWNER/$REPO_NAME/issues"
                
                Log.i(TAG, "Bug report submitted successfully: $issueUrl")
                Result.success(issueUrl)
            } else {
                val errorBody = response.body?.string() ?: "Unknown error"
                Log.e(TAG, "Failed to submit bug report: ${response.code} - $errorBody")
                Result.failure(Exception("GitHub API error ${response.code}: $errorBody"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to submit bug report to GitHub", e)
            Result.failure(e)
        }
    }

    /**
     * Save bug report locally
     */
    suspend fun saveLocally(report: BugReport): Result<File> = withContext(Dispatchers.IO) {
        try {
            val reportsDir = File(context.filesDir, "debug_reports")
            if (!reportsDir.exists()) {
                reportsDir.mkdirs()
            }

            // Save report data
            val reportFile = File(reportsDir, "report_${report.id}.json")
            val reportJson = json.encodeToString(report.toSerializable())
            reportFile.writeText(reportJson)

            // Save screenshot if available
            report.screenshot?.let { bitmap ->
                val screenshotFile = File(reportsDir, "screenshot_${report.id}.png")
                FileOutputStream(screenshotFile).use { out ->
                    bitmap.compress(Bitmap.CompressFormat.PNG, 90, out)
                }
            }

            Log.i(TAG, "Bug report saved locally: ${reportFile.absolutePath}")
            Result.success(reportFile)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to save bug report locally", e)
            Result.failure(e)
        }
    }

    /**
     * Build the GitHub issue body from a bug report
     */
    private fun buildGitHubIssueBody(report: BugReport): String {
        return buildString {
            appendLine("## Bug Report (Auto-Generated)")
            appendLine()
            appendLine("**Reported:** ${report.formattedDate}")
            appendLine("**Report ID:** ${report.id}")
            appendLine()
            
            appendLine("### User Description")
            appendLine(report.userDescription)
            appendLine()
            
            appendLine("### Device Information")
            appendLine("| Property | Value |")
            appendLine("|----------|-------|")
            with(report.deviceInfo) {
                appendLine("| App Version | $appVersion (code: $appVersionCode) |")
                appendLine("| Build Type | $buildType |")
                appendLine("| Android Version | $androidVersion (API $apiLevel) |")
                appendLine("| Manufacturer | $manufacturer |")
                appendLine("| Model | $model |")
                appendLine("| Device | $device |")
                appendLine("| Supported ABIs | ${supportedAbis.joinToString()} |")
                appendLine("| Available Memory | ${availableMemoryMb}MB |")
                appendLine("| Total Memory | ${totalMemoryMb}MB |")
                appendLine("| Free Storage | ${freeStorageMb}MB |")
            }
            appendLine()
            
            if (report.recentErrors.isNotEmpty()) {
                appendLine("### Recent Errors")
                appendLine("```")
                report.recentErrors.forEach { error ->
                    val date = SimpleDateFormat("HH:mm:ss", Locale.US).format(Date(error.timestamp))
                    appendLine("[$date] ${error.tag}: ${error.message}")
                    error.stackTrace?.let { 
                        appendLine(it.lines().take(10).joinToString("\n"))
                    }
                    appendLine()
                }
                appendLine("```")
                appendLine()
            }
            
            if (report.logs.isNotBlank()) {
                appendLine("### Recent Logs")
                appendLine("<details>")
                appendLine("<summary>Click to expand logs</summary>")
                appendLine()
                appendLine("```")
                appendLine(report.logs.lines().takeLast(100).joinToString("\n"))
                appendLine("```")
                appendLine("</details>")
                appendLine()
            }

            // Screenshot note - can't embed directly, but mention it
            if (report.screenshot != null) {
                appendLine("### Screenshot")
                appendLine("*Screenshot was captured at time of report but cannot be auto-uploaded.*")
                appendLine("*Please ask the user for the screenshot if needed.*")
                appendLine()
            }
            
            appendLine("---")
            appendLine("*This issue was automatically generated by CleverFerret's debug bug reporter.*")
            appendLine("*Labeled with `copilot-fix-me` for automated fix consideration.*")
        }
    }

    private fun getAvailableMemoryMb(): Long {
        val runtime = Runtime.getRuntime()
        return (runtime.freeMemory() + runtime.maxMemory() - runtime.totalMemory()) / (1024 * 1024)
    }

    private fun getTotalMemoryMb(): Long {
        val runtime = Runtime.getRuntime()
        return runtime.maxMemory() / (1024 * 1024)
    }

    private fun getFreeStorageMb(): Long {
        return try {
            context.filesDir.freeSpace / (1024 * 1024)
        } catch (e: Exception) {
            -1
        }
    }
}

/**
 * Entry for logged errors
 */
@Serializable
data class ErrorLogEntry(
    val timestamp: Long,
    val tag: String,
    val message: String,
    val stackTrace: String? = null
)

/**
 * Device and app information
 */
@Serializable
data class DeviceInfo(
    val appVersion: String,
    val appVersionCode: Int,
    val buildType: String,
    val androidVersion: String,
    val apiLevel: Int,
    val manufacturer: String,
    val model: String,
    val device: String,
    val product: String,
    val supportedAbis: List<String>,
    val availableMemoryMb: Long,
    val totalMemoryMb: Long,
    val freeStorageMb: Long
)

/**
 * Complete bug report data
 */
data class BugReport(
    val id: String,
    val timestamp: Long,
    val formattedDate: String,
    val userDescription: String,
    val deviceInfo: DeviceInfo,
    val logs: String,
    val recentErrors: List<ErrorLogEntry>,
    val screenshot: Bitmap?
) {
    /**
     * Convert to serializable version (without bitmap)
     */
    fun toSerializable() = SerializableBugReport(
        id = id,
        timestamp = timestamp,
        formattedDate = formattedDate,
        userDescription = userDescription,
        deviceInfo = deviceInfo,
        logs = logs,
        recentErrors = recentErrors,
        hasScreenshot = screenshot != null
    )
}

@Serializable
data class SerializableBugReport(
    val id: String,
    val timestamp: Long,
    val formattedDate: String,
    val userDescription: String,
    val deviceInfo: DeviceInfo,
    val logs: String,
    val recentErrors: List<ErrorLogEntry>,
    val hasScreenshot: Boolean
)

/**
 * GitHub API request for creating an issue
 */
@Serializable
data class GitHubIssueRequest(
    val title: String,
    val body: String,
    val labels: List<String> = emptyList(),
    val assignees: List<String> = emptyList()
)

/**
 * GitHub API response for created issue
 */
@Serializable
data class GitHubIssueResponse(
    val id: Long = 0,
    val number: Int = 0,
    val title: String = "",
    @kotlinx.serialization.SerialName("html_url")
    val htmlUrl: String = ""
)
