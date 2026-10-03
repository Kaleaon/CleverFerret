package com.universalmedialibrary.core.logging

import android.util.Log
import com.universalmedialibrary.BuildConfig

/**
 * Centralized logging utility with structured context and optional remote sink support.
 */
object AppLogger {
    private const val DEFAULT_TAG = "CleverFerret"

    enum class Severity { DEBUG, INFO, WARN, ERROR }

    interface RemoteSink {
        fun record(entry: LogEntry)
    }

    data class LogEntry(
        val severity: Severity,
        val tag: String,
        val message: String,
        val context: Map<String, String>,
        val throwable: Throwable? = null,
        val timestampMs: Long = System.currentTimeMillis()
    )

    @Volatile
    private var remoteSink: RemoteSink? = null

    private val tokenRegex = Regex(
        "(?i)(bearer\\s+)?[a-z0-9_-]{20,}\\.[a-z0-9_-]{20,}\\.[a-z0-9_-]{20,}|" +
            "(token|apikey|api_key|access_token|refresh_token|password|secret|authorization)\\s*[=:]\\s*[^\\s,;]+"
    )
    private val emailRegex = Regex("(?i)([a-z0-9._%+-]+)@([a-z0-9.-]+\\.[a-z]{2,})")
    private val phoneRegex = Regex("(?<!\\d)(?:\\+?\\d{1,3}[\\s.-]?)?(?:\\(?\\d{3}\\)?[\\s.-]?)\\d{3}[\\s.-]?\\d{4}(?!\\d)")
    private val pathRegex = Regex("(/[^\\s]+)+")

    fun setRemoteSink(sink: RemoteSink?) {
        remoteSink = sink
    }

    fun debug(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null, context: Map<String, Any?> = emptyMap()) {
        if (!BuildConfig.DEBUG) return
        write(Severity.DEBUG, tag, message, throwable, context)
    }

    fun info(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null, context: Map<String, Any?> = emptyMap()) {
        write(Severity.INFO, tag, message, throwable, context)
    }

    fun warn(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null, context: Map<String, Any?> = emptyMap()) {
        write(Severity.WARN, tag, message, throwable, context)
    }

    fun error(tag: String = DEFAULT_TAG, message: String, throwable: Throwable? = null, context: Map<String, Any?> = emptyMap()) {
        write(Severity.ERROR, tag, message, throwable, context)
    }

    private fun write(
        severity: Severity,
        tag: String,
        message: String,
        throwable: Throwable?,
        context: Map<String, Any?>
    ) {
        val sanitizedMessage = redact(message)
        val sanitizedContext = sanitizeContext(context)
        val shouldLogVerbose = BuildConfig.DEBUG || severity == Severity.WARN || severity == Severity.ERROR

        if (shouldLogVerbose) {
            val contextSuffix = if (sanitizedContext.isEmpty()) "" else " | context=$sanitizedContext"
            val throwableSuffix = if (BuildConfig.DEBUG) throwable else null
            val finalMessage = sanitizedMessage + contextSuffix
            when (severity) {
                Severity.DEBUG -> if (throwableSuffix != null) Log.d(tag, finalMessage, throwableSuffix) else Log.d(tag, finalMessage)
                Severity.INFO -> if (throwableSuffix != null) Log.i(tag, finalMessage, throwableSuffix) else Log.i(tag, finalMessage)
                Severity.WARN -> if (throwableSuffix != null) Log.w(tag, finalMessage, throwableSuffix) else Log.w(tag, finalMessage)
                Severity.ERROR -> if (throwableSuffix != null) Log.e(tag, finalMessage, throwableSuffix) else Log.e(tag, finalMessage)
            }
        } else {
            // Keep release INFO logs concise and redacted.
            Log.i(tag, sanitizedMessage)
        }

        remoteSink?.record(
            LogEntry(
                severity = severity,
                tag = tag,
                message = sanitizedMessage,
                context = sanitizedContext,
                throwable = throwable?.let {
                    // Prevent leaking stack traces to remote sink in release builds.
                    if (BuildConfig.DEBUG) it else RuntimeException(redact(it.message ?: it::class.java.simpleName))
                }
            )
        )
    }

    private fun sanitizeContext(context: Map<String, Any?>): Map<String, String> {
        return context
            .filterValues { it != null }
            .mapValues { (_, value) -> redact(value.toString()) }
    }

    private fun redact(message: String): String {
        return message
            .let { tokenRegex.replace(it, "[REDACTED_TOKEN]") }
            .let { emailRegex.replace(it, "[REDACTED_EMAIL]") }
            .let { phoneRegex.replace(it, "[REDACTED_PHONE]") }
            .let { pathRegex.replace(it) { match -> if (match.value.contains(" ")) match.value else "[REDACTED_PATH]" } }
    }
}
