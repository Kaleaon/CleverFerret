package com.universalmedialibrary.core.logging

import android.util.Log
import com.universalmedialibrary.BuildConfig

/**
 * Centralized logging utility.
 *
 * In debug builds, full exception stack traces are logged.
 * In release builds, messages are redacted and only exception type/message is emitted.
 */
object AppLogger {
    private const val DEFAULT_TAG = "CleverFerret"

    private val tokenRegex = Regex("(?i)(bearer\\s+)?[a-z0-9_-]{20,}\\.[a-z0-9_-]{20,}\\.[a-z0-9_-]{20,}|(token|apikey|api_key|access_token|refresh_token|password)\\s*[=:]\\s*[^\\s,;]+")
    private val pathRegex = Regex("(/[^\\s]+)+")

    fun debug(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null) {
        if (!BuildConfig.DEBUG) return
        if (throwable != null) Log.d(tag, message, throwable) else Log.d(tag, message)
    }

    fun info(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null) {
        if (BuildConfig.DEBUG) {
            if (throwable != null) Log.i(tag, message, throwable) else Log.i(tag, message)
        } else {
            Log.i(tag, redact(message))
        }
    }

    fun warn(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null) {
        if (BuildConfig.DEBUG) {
            if (throwable != null) Log.w(tag, message, throwable) else Log.w(tag, message)
        } else {
            val releaseMessage = buildReleaseMessage(message, throwable)
            Log.w(tag, releaseMessage)
        }
    }

    fun error(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null) {
        if (BuildConfig.DEBUG) {
            if (throwable != null) Log.e(tag, message, throwable) else Log.e(tag, message)
        } else {
            val releaseMessage = buildReleaseMessage(message, throwable)
            Log.e(tag, releaseMessage)
        }
    }

    private fun buildReleaseMessage(message: String, throwable: Throwable?): String {
        val sanitizedMessage = redact(message)
        val errorSummary = throwable?.let { " [${it::class.java.simpleName}: ${redact(it.message ?: "no message")}]" } ?: ""
        return sanitizedMessage + errorSummary
    }

    private fun redact(message: String): String {
        return message
            .let { tokenRegex.replace(it, "[REDACTED_TOKEN]") }
            .let { pathRegex.replace(it) { match -> if (match.value.contains(" ")) match.value else "[REDACTED_PATH]" } }
    }
}
