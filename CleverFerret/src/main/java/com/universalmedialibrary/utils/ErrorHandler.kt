package com.universalmedialibrary.utils

import android.util.Log
import java.io.IOException
import java.net.SocketTimeoutException
import java.net.UnknownHostException

/**
 * Centralized error handling and logging utility
 */
object ErrorHandler {
    
    private const val TAG = "CleverFerret"
    
    /**
     * Converts exceptions to user-friendly error messages
     */
    fun getUserFriendlyMessage(error: Throwable): String {
        return when (error) {
            is IOException -> handleIoException(error)
            is SecurityException -> "Permission denied. Please check app permissions."
            is OutOfMemoryError -> "Not enough memory to complete this operation."
            is IllegalArgumentException -> "Invalid input: ${error.message}"
            is NullPointerException -> "Unexpected null value encountered."
            else -> error.message ?: "An unexpected error occurred"
        }
    }
    
    private fun handleIoException(error: IOException): String {
        return when (error) {
            is UnknownHostException -> "No internet connection. Please check your network."
            is SocketTimeoutException -> "Connection timed out. Please try again."
            is java.io.FileNotFoundException -> "File not found. It may have been moved or deleted."
            else -> "Failed to read/write data: ${error.message}"
        }
    }
    
    /**
     * Logs error with appropriate level and context
     */
    fun logError(
        tag: String = TAG,
        message: String,
        error: Throwable? = null,
        context: Map<String, Any>? = null
    ) {
        val contextStr = context?.entries?.joinToString(", ") { "${it.key}=${it.value}" } ?: ""
        val fullMessage = if (contextStr.isNotEmpty()) {
            "$message [Context: $contextStr]"
        } else {
            message
        }
        
        if (error != null) {
            Log.e(tag, fullMessage, error)
        } else {
            Log.e(tag, fullMessage)
        }
    }
    
    /**
     * Logs warning
     */
    fun logWarning(
        tag: String = TAG,
        message: String,
        context: Map<String, Any>? = null
    ) {
        val contextStr = context?.entries?.joinToString(", ") { "${it.key}=${it.value}" } ?: ""
        val fullMessage = if (contextStr.isNotEmpty()) {
            "$message [Context: $contextStr]"
        } else {
            message
        }
        Log.w(tag, fullMessage)
    }
    
    /**
     * Logs info
     */
    fun logInfo(
        tag: String = TAG,
        message: String,
        context: Map<String, Any>? = null
    ) {
        val contextStr = context?.entries?.joinToString(", ") { "${it.key}=${it.value}" } ?: ""
        val fullMessage = if (contextStr.isNotEmpty()) {
            "$message [Context: $contextStr]"
        } else {
            message
        }
        Log.i(tag, fullMessage)
    }
    
    /**
     * Creates a detailed error report
     */
    fun createErrorReport(
        error: Throwable,
        context: Map<String, Any> = emptyMap()
    ): String {
        return buildString {
            appendLine("Error Report")
            appendLine("=" * 50)
            appendLine("Type: ${error.javaClass.simpleName}")
            appendLine("Message: ${error.message}")
            appendLine()
            appendLine("Context:")
            context.forEach { (key, value) ->
                appendLine("  $key: $value")
            }
            appendLine()
            appendLine("Stack Trace:")
            appendLine(error.stackTraceToString())
        }
    }
    
    /**
     * Handles error with retry logic
     */
    suspend fun <T> withRetry(
        maxAttempts: Int = 3,
        delayMs: Long = 1000,
        block: suspend () -> T
    ): Result<T> {
        var lastException: Exception? = null
        
        repeat(maxAttempts) { attempt ->
            try {
                return Result.success(block())
            } catch (e: Exception) {
                lastException = e
                logWarning(
                    message = "Attempt ${attempt + 1} failed",
                    context = mapOf("maxAttempts" to maxAttempts, "error" to e.message.toString())
                )
                
                if (attempt < maxAttempts - 1) {
                    kotlinx.coroutines.delay(delayMs * (attempt + 1))
                }
            }
        }
        
        return Result.failure(lastException ?: Exception("Operation failed after $maxAttempts attempts"))
    }
}

private operator fun String.times(n: Int): String = repeat(n)
