package com.universalmedialibrary.utils

import android.util.Log
import kotlinx.coroutines.CoroutineExceptionHandler
import kotlin.coroutines.CoroutineContext

/**
 * Centralized error logging utility for CleverFerret
 *
 * Provides consistent error logging across the application with support for:
 * - Standard logging with tags
 * - Coroutine exception handling
 * - Crash reporting integration point
 * - Debug vs Production logging
 */
object ErrorLogger {

    private const val DEFAULT_TAG = "CleverFerret"
    private var crashReporter: CrashReporter? = null

    /**
     * Initialize error logger with optional crash reporter
     */
    fun initialize(reporter: CrashReporter? = null) {
        crashReporter = reporter
    }

    /**
     * Log an error with exception
     */
    fun logError(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null) {
        Log.e(tag, message, throwable)

        // Report to crash analytics if available
        throwable?.let {
            crashReporter?.recordException(it, message)
        }
    }

    /**
     * Log a warning
     */
    fun logWarning(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null) {
        Log.w(tag, message, throwable)
    }

    /**
     * Log debug information (only in debug builds)
     */
    fun logDebug(tag: String = DEFAULT_TAG, message: String) {
        if (com.universalmedialibrary.BuildConfig.DEBUG) {
            Log.d(tag, message)
        }
    }

    /**
     * Log info message
     */
    fun logInfo(tag: String = DEFAULT_TAG, message: String) {
        Log.i(tag, message)
    }

    /**
     * Create a CoroutineExceptionHandler that logs uncaught exceptions
     */
    fun createCoroutineExceptionHandler(
        tag: String = DEFAULT_TAG,
        onError: ((Throwable) -> Unit)? = null
    ): CoroutineExceptionHandler {
        return CoroutineExceptionHandler { context, throwable ->
            logError(
                tag = tag,
                message = "Uncaught coroutine exception in context: $context",
                throwable = throwable
            )
            onError?.invoke(throwable)
        }
    }

    /**
     * Log ExoPlayer errors
     */
    fun logExoPlayerError(message: String, throwable: Throwable? = null) {
        logError(tag = "ExoPlayer", message = message, throwable = throwable)
    }

    /**
     * Log media scanning errors
     */
    fun logMediaScanError(message: String, throwable: Throwable? = null) {
        logError(tag = "MediaScanner", message = message, throwable = throwable)
    }

    /**
     * Log network errors
     */
    fun logNetworkError(message: String, throwable: Throwable? = null) {
        logError(tag = "Network", message = message, throwable = throwable)
    }

    /**
     * Log database errors
     */
    fun logDatabaseError(message: String, throwable: Throwable? = null) {
        logError(tag = "Database", message = message, throwable = throwable)
    }

    /**
     * Log service errors
     */
    fun logServiceError(serviceName: String, message: String, throwable: Throwable? = null) {
        logError(tag = "Service:$serviceName", message = message, throwable = throwable)
    }
}

/**
 * Interface for crash reporting integration
 * Implement this to integrate with Firebase Crashlytics, Sentry, etc.
 */
interface CrashReporter {
    fun recordException(throwable: Throwable, message: String? = null)
    fun setUserId(userId: String)
    fun setCustomKey(key: String, value: String)
}

/**
 * Extension function for easier error logging in ViewModels
 */
fun Throwable.logError(tag: String = "CleverFerret", message: String = "Error occurred") {
    ErrorLogger.logError(tag, message, this)
}

/**
 * Extension function for creating exception handlers with custom error handling
 */
fun CoroutineContext.withErrorLogging(
    tag: String = "Coroutine",
    onError: ((Throwable) -> Unit)? = null
): CoroutineContext {
    return this + ErrorLogger.createCoroutineExceptionHandler(tag, onError)
}
