package com.universalmedialibrary.services.debug

import android.content.Context
import android.os.Build
import com.universalmedialibrary.services.gemini.GeminiService
import com.universalmedialibrary.core.FeatureFlags
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.PrintWriter
import java.io.StringWriter
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Automated Debug Service for CleverFerret
 * 
 * This service provides:
 * - Automatic error detection and analysis
 * - AI-powered debugging suggestions
 * - Automated issue filing
 * - System health monitoring
 * - Performance analysis
 */
@Singleton
class AutomatedDebugService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val geminiService: GeminiService
) {
    
    companion object {
        private const val TAG = "AutomatedDebugService"
        private const val MAX_ERROR_HISTORY = 50
    }
    
    private val errorHistory = mutableListOf<ErrorRecord>()
    private var isMonitoring = false
    
    /**
     * Initialize the automated debug service
     */
    suspend fun initialize(): Boolean = withContext(Dispatchers.IO) {
        if (!FeatureFlags.ENABLE_GEMINI) {
            return@withContext false
        }
        
        try {
            val geminiInitialized = geminiService.initialize()
            if (geminiInitialized) {
                isMonitoring = true
                startSystemHealthMonitoring()
            }
            geminiInitialized
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Report an error for automated analysis
     */
    suspend fun reportError(
        exception: Throwable,
        context: String = "",
        userId: String? = null
    ): ErrorAnalysisReport = withContext(Dispatchers.IO) {
        val errorRecord = ErrorRecord(
            timestamp = System.currentTimeMillis(),
            exception = exception,
            context = context,
            userId = userId,
            deviceInfo = getDeviceInfo()
        )
        
        // Add to history
        addToErrorHistory(errorRecord)
        
        // Analyze with Gemini AI
        val analysisResult = geminiService.analyzeError(
            errorMessage = exception.message ?: "Unknown error",
            stackTrace = getStackTraceString(exception),
            contextInfo = buildContextInfo(context, errorRecord.deviceInfo)
        )
        
        ErrorAnalysisReport(
            errorRecord = errorRecord,
            analysisResult = analysisResult,
            shouldFileIssue = shouldAutoFileIssue(analysisResult),
            debuggingSuggestions = if (analysisResult.success) {
                analysisResult.suggestedFixes
            } else {
                getBasicDebuggingSuggestions(exception)
            }
        )
    }
    
    /**
     * Perform automated system diagnostics
     */
    suspend fun performSystemDiagnostics(): SystemDiagnosticsReport = withContext(Dispatchers.IO) {
        val systemInfo = gatherSystemInfo()
        val recentErrors = getRecentErrors()
        val performanceMetrics = gatherPerformanceMetrics()
        
        val diagnosticsResult = geminiService.performSystemDiagnostics(
            systemInfo = systemInfo,
            recentErrors = recentErrors.map { "${it.exception.javaClass.simpleName}: ${it.exception.message}" },
            performanceMetrics = performanceMetrics
        )
        
        SystemDiagnosticsReport(
            timestamp = System.currentTimeMillis(),
            systemInfo = systemInfo,
            diagnosticsResult = diagnosticsResult,
            recentErrorCount = recentErrors.size,
            recommendations = if (diagnosticsResult.success) {
                diagnosticsResult.recommendations
            } else {
                getBasicSystemRecommendations()
            }
        )
    }
    
    /**
     * Generate automated issue report for GitHub
     */
    suspend fun generateIssueReport(
        title: String,
        description: String,
        errorRecord: ErrorRecord? = null
    ): AutomatedIssueReport = withContext(Dispatchers.IO) {
        val deviceInfo = errorRecord?.deviceInfo ?: getDeviceInfo()
        val errorLogs = errorRecord?.let { getStackTraceString(it.exception) } ?: ""
        
        val issueResult = geminiService.generateIssueReport(
            title = title,
            description = description,
            errorLogs = errorLogs,
            deviceInfo = deviceInfo,
            stepsToReproduce = errorRecord?.context ?: ""
        )
        
        AutomatedIssueReport(
            title = title,
            description = description,
            issueResult = issueResult,
            errorRecord = errorRecord,
            shouldAutoSubmit = shouldAutoSubmitIssue(issueResult),
            estimatedSeverity = estimateIssueSeverity(errorRecord, issueResult)
        )
    }
    
    /**
     * Analyze code quality for a given file
     */
    suspend fun analyzeCodeQuality(
        filePath: String,
        codeContent: String
    ): CodeQualityReport = withContext(Dispatchers.IO) {
        val analysisResult = geminiService.analyzeCodeQuality(
            codeSnippet = codeContent,
            fileName = filePath,
            language = getLanguageFromFilePath(filePath)
        )
        
        CodeQualityReport(
            filePath = filePath,
            analysisResult = analysisResult,
            timestamp = System.currentTimeMillis(),
            recommendations = if (analysisResult.success) {
                analysisResult.suggestions
            } else {
                getBasicCodeRecommendations()
            }
        )
    }
    
    /**
     * Start continuous system health monitoring
     */
    private suspend fun startSystemHealthMonitoring() {
        // This would typically run in a background coroutine
        // For now, we'll just set up the monitoring flag
        isMonitoring = true
    }
    
    /**
     * Add error to history with size limit
     */
    private fun addToErrorHistory(errorRecord: ErrorRecord) {
        synchronized(errorHistory) {
            errorHistory.add(errorRecord)
            if (errorHistory.size > MAX_ERROR_HISTORY) {
                errorHistory.removeAt(0)
            }
        }
    }
    
    /**
     * Get recent errors for analysis
     */
    private fun getRecentErrors(): List<ErrorRecord> {
        val cutoffTime = System.currentTimeMillis() - (24 * 60 * 60 * 1000) // Last 24 hours
        return errorHistory.filter { it.timestamp >= cutoffTime }
    }
    
    /**
     * Get device information for debugging
     */
    private fun getDeviceInfo(): String {
        return buildString {
            append("Device: ${Build.MANUFACTURER} ${Build.MODEL}\n")
            append("Android Version: ${Build.VERSION.RELEASE} (API ${Build.VERSION.SDK_INT})\n")
            append("App Version: 1.0\n") // Could be dynamic
            append("Architecture: ${Build.SUPPORTED_ABIS.joinToString()}\n")
            append("Available Memory: ${getAvailableMemory()}\n")
            append("Free Storage: ${getFreeStorage()}\n")
        }
    }
    
    /**
     * Get stack trace as string
     */
    private fun getStackTraceString(exception: Throwable): String {
        val stringWriter = StringWriter()
        val printWriter = PrintWriter(stringWriter)
        exception.printStackTrace(printWriter)
        return stringWriter.toString()
    }
    
    /**
     * Build context information for analysis
     */
    private fun buildContextInfo(context: String, deviceInfo: String): String {
        return buildString {
            append("Context: $context\n")
            append("Device Info:\n$deviceInfo\n")
            append("Recent Errors: ${getRecentErrors().size}\n")
        }
    }
    
    /**
     * Determine if issue should be automatically filed
     */
    private fun shouldAutoFileIssue(analysisResult: com.universalmedialibrary.services.gemini.ErrorAnalysisResult): Boolean {
        if (!analysisResult.success) return false
        
        return when (analysisResult.severity) {
            "CRITICAL" -> true
            "HIGH" -> analysisResult.confidence > 0.8f
            else -> false
        }
    }
    
    /**
     * Determine if issue should be automatically submitted
     */
    private fun shouldAutoSubmitIssue(issueResult: com.universalmedialibrary.services.gemini.IssueReportResult): Boolean {
        if (!issueResult.success) return false
        
        return when (issueResult.priority) {
            "CRITICAL" -> true
            "HIGH" -> true
            else -> false
        }
    }
    
    /**
     * Estimate issue severity
     */
    private fun estimateIssueSeverity(
        errorRecord: ErrorRecord?,
        issueResult: com.universalmedialibrary.services.gemini.IssueReportResult
    ): String {
        if (issueResult.success) {
            return issueResult.priority
        }
        
        return when (errorRecord?.exception) {
            is NullPointerException -> "HIGH"
            is OutOfMemoryError -> "CRITICAL"
            is SecurityException -> "HIGH"
            else -> "MEDIUM"
        }
    }
    
    /**
     * Get basic debugging suggestions when AI is not available
     */
    private fun getBasicDebuggingSuggestions(exception: Throwable): List<String> {
        return when (exception) {
            is NullPointerException -> listOf(
                "Check for null values before accessing objects",
                "Use safe calls (?.) in Kotlin",
                "Initialize variables properly"
            )
            is OutOfMemoryError -> listOf(
                "Check for memory leaks",
                "Optimize image loading",
                "Use pagination for large datasets"
            )
            is IllegalStateException -> listOf(
                "Check object state before operations",
                "Ensure proper initialization",
                "Review lifecycle management"
            )
            else -> listOf(
                "Check error logs for more details",
                "Review recent code changes",
                "Test with different configurations"
            )
        }
    }
    
    /**
     * Get basic system recommendations
     */
    private fun getBasicSystemRecommendations(): List<String> {
        return listOf(
            "Monitor memory usage regularly",
            "Keep app dependencies updated",
            "Implement proper error handling",
            "Use performance profiling tools",
            "Test on various device configurations"
        )
    }
    
    /**
     * Get basic code recommendations
     */
    private fun getBasicCodeRecommendations(): List<String> {
        return listOf(
            "Follow Kotlin coding conventions",
            "Use dependency injection properly",
            "Implement proper error handling",
            "Write unit tests for critical functions",
            "Use meaningful variable and function names"
        )
    }
    
    /**
     * Gather system information
     */
    private fun gatherSystemInfo(): String {
        return buildString {
            append("System Info:\n")
            append(getDeviceInfo())
            append("\nApp State:\n")
            append("Monitoring Active: $isMonitoring\n")
            append("Error History Size: ${errorHistory.size}\n")
            append("Recent Errors: ${getRecentErrors().size}\n")
        }
    }
    
    /**
     * Gather performance metrics
     */
    private fun gatherPerformanceMetrics(): String {
        return buildString {
            append("Performance Metrics:\n")
            append("Available Memory: ${getAvailableMemory()}\n")
            append("Free Storage: ${getFreeStorage()}\n")
            append("CPU Usage: ${getCpuUsage()}\n")
        }
    }
    
    /**
     * Get language from file path
     */
    private fun getLanguageFromFilePath(filePath: String): String {
        return when {
            filePath.endsWith(".kt") -> "kotlin"
            filePath.endsWith(".java") -> "java"
            filePath.endsWith(".xml") -> "xml"
            filePath.endsWith(".json") -> "json"
            else -> "text"
        }
    }
    
    // Helper methods for system metrics (would need proper implementation)
    private fun getAvailableMemory(): String = "Unknown"
    private fun getFreeStorage(): String = "Unknown"
    private fun getCpuUsage(): String = "Unknown"
}

/**
 * Record of an error for debugging purposes
 */
data class ErrorRecord(
    val timestamp: Long,
    val exception: Throwable,
    val context: String,
    val userId: String?,
    val deviceInfo: String
)

/**
 * Report of error analysis
 */
data class ErrorAnalysisReport(
    val errorRecord: ErrorRecord,
    val analysisResult: com.universalmedialibrary.services.gemini.ErrorAnalysisResult,
    val shouldFileIssue: Boolean,
    val debuggingSuggestions: List<String>
)

/**
 * Report of system diagnostics
 */
data class SystemDiagnosticsReport(
    val timestamp: Long,
    val systemInfo: String,
    val diagnosticsResult: com.universalmedialibrary.services.gemini.DiagnosticsResult,
    val recentErrorCount: Int,
    val recommendations: List<String>
)

/**
 * Report of automated issue generation
 */
data class AutomatedIssueReport(
    val title: String,
    val description: String,
    val issueResult: com.universalmedialibrary.services.gemini.IssueReportResult,
    val errorRecord: ErrorRecord?,
    val shouldAutoSubmit: Boolean,
    val estimatedSeverity: String
)

/**
 * Report of code quality analysis
 */
data class CodeQualityReport(
    val filePath: String,
    val analysisResult: com.universalmedialibrary.services.gemini.CodeAnalysisResult,
    val timestamp: Long,
    val recommendations: List<String>
)