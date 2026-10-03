package com.universalmedialibrary.debug

import com.universalmedialibrary.services.debug.DebugBugReportService
import com.universalmedialibrary.utils.CrashReporter
import kotlinx.coroutines.CancellationException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Bridges [CrashReporter] calls to debug diagnostics and bug report capture hooks.
 */
@Singleton
class DebugCrashReporter @Inject constructor(
    private val debugReportingService: DebugReportingService,
    private val debugBugReportService: DebugBugReportService
) : CrashReporter {

    override fun recordException(throwable: Throwable, message: String?) {
        if (throwable is CancellationException) return

        val safeMessage = message ?: throwable.message ?: "Unknown error"
        debugReportingService.logError("CrashReporter", safeMessage, throwable)
        debugBugReportService.logError("CrashReporter", safeMessage, throwable)
    }

    override fun setUserId(userId: String) = Unit

    override fun setCustomKey(key: String, value: String) = Unit
}
