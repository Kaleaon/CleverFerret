package com.universalmedialibrary.debug

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.compositionLocalOf
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.debug.ui.DebugOverlay
import com.universalmedialibrary.debug.ui.DebugQuickBar

/**
 * Debug Wrapper Composable
 * 
 * Wraps the main app content and adds debug overlays/features
 * when running in debug build mode.
 * 
 * Usage:
 * ```
 * DebugWrapper(
 *     debugReportingService = debugReportingService,
 *     onNavigateToDebugMenu = { navController.navigate("debug") }
 * ) {
 *     // Your main app content
 *     AppContent()
 * }
 * ```
 */
@Composable
fun DebugWrapper(
    debugReportingService: DebugReportingService,
    featureFlagManager: FeatureFlagManager,
    onNavigateToDebugMenu: () -> Unit,
    onReportBug: () -> Unit = {},
    onTakeScreenshot: () -> Unit = {},
    showOverlay: Boolean = true,
    showQuickBar: Boolean = false,
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit
) {
    // Only add debug features in debug builds
    if (!BuildConfig.SHOW_DEBUG_MENU) {
        content()
        return
    }
    
    val crashCount by debugReportingService.crashReports.collectAsState()
    val errorCount by debugReportingService.errorLogs.collectAsState()
    
    // Collect flags StateFlow to react to runtime changes
    val flags by featureFlagManager.flags.collectAsState()
    val showPerformanceOverlay = flags[FeatureFlag.SHOW_PERFORMANCE_OVERLAY.key] 
        ?: FeatureFlag.SHOW_PERFORMANCE_OVERLAY.defaultValue
    
    Box(modifier = modifier.fillMaxSize()) {
        // Main content
        content()
        
        // Debug overlay (floating button with metrics)
        if (showOverlay && showPerformanceOverlay) {
            DebugOverlay(
                performanceMetrics = debugReportingService.performanceMetrics,
                crashCount = crashCount.size,
                errorCount = errorCount.size,
                onNavigateToDebugMenu = onNavigateToDebugMenu
            )
        }
        
        // Debug quick bar (optional bottom bar)
        if (showQuickBar) {
            DebugQuickBar(
                onReportBug = onReportBug,
                onOpenDebugMenu = onNavigateToDebugMenu,
                onTakeScreenshot = onTakeScreenshot
            )
        }
    }
}

/**
 * Debug-aware error boundary (Placeholder)
 * 
 * NOTE: This is currently a placeholder implementation. Jetpack Compose does not
 * have a built-in error boundary mechanism like React. Exceptions thrown during
 * composition will propagate normally and crash the app.
 * 
 * For production use, consider:
 * - Using try-catch in event handlers and coroutines
 * - Implementing custom error handling via CompositionLocal
 * - Using a crash reporting library (Firebase Crashlytics, Sentry, etc.)
 * 
 * This wrapper provides a consistent API for future error boundary implementation
 * and logs errors when they are manually reported.
 */
@Composable
fun DebugErrorBoundary(
    debugReportingService: DebugReportingService?,
    tag: String = "ErrorBoundary",
    onError: ((Throwable) -> Unit)? = null,
    content: @Composable () -> Unit
) {
    // Provide a way for child composables to report errors manually
    val reportError: (Throwable) -> Unit = { throwable ->
        debugReportingService?.logError(tag, "Error reported: ${throwable.message}", throwable)
        onError?.invoke(throwable)
    }
    
    // Render content - errors during composition will propagate normally
    // This is a limitation of Jetpack Compose's architecture
    CompositionLocalProvider(
        LocalErrorReporter provides reportError
    ) {
        content()
    }
}

/**
 * CompositionLocal for manual error reporting within DebugErrorBoundary
 */
val LocalErrorReporter = compositionLocalOf<(Throwable) -> Unit> { {} }

/**
 * Utility for logging debug events conditionally
 */
object DebugLog {
    private var service: DebugReportingService? = null
    
    fun init(debugReportingService: DebugReportingService) {
        if (BuildConfig.DEBUG_REPORTING_ENABLED) {
            service = debugReportingService
        }
    }
    
    fun info(tag: String, message: String) {
        service?.logInfo(tag, message)
    }
    
    fun warning(tag: String, message: String) {
        service?.logWarning(tag, message)
    }
    
    fun error(tag: String, message: String, throwable: Throwable? = null) {
        service?.logError(tag, message, throwable)
    }
    
    /**
     * Log a user action for debugging
     */
    fun action(tag: String, action: String, details: Map<String, Any?> = emptyMap()) {
        val detailsStr = details.entries.joinToString(", ") { "${it.key}=${it.value}" }
        service?.logInfo(tag, "Action: $action${if (detailsStr.isNotEmpty()) " ($detailsStr)" else ""}")
    }
    
    /**
     * Log a navigation event
     */
    fun navigation(from: String?, to: String) {
        service?.logInfo("Navigation", "Navigate: ${from ?: "unknown"} -> $to")
    }
    
    /**
     * Log a network request
     */
    fun networkRequest(method: String, url: String, statusCode: Int? = null, error: String? = null) {
        val message = buildString {
            append("$method $url")
            statusCode?.let { append(" -> $it") }
            error?.let { append(" [ERROR: $it]") }
        }
        if (error != null) {
            service?.logError("Network", message)
        } else {
            service?.logInfo("Network", message)
        }
    }
    
    /**
     * Log playback events
     */
    fun playback(event: String, mediaId: String? = null, position: Long? = null) {
        val details = buildString {
            append(event)
            mediaId?.let { append(" media=$it") }
            position?.let { append(" pos=${it}ms") }
        }
        service?.logInfo("Playback", details)
    }
}
