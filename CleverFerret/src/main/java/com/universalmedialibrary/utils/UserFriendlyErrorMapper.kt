package com.universalmedialibrary.utils

import android.database.sqlite.SQLiteException
import android.util.Log
import androidx.media3.common.PlaybackException
import java.io.FileNotFoundException
import java.io.IOException
import java.net.ConnectException
import java.net.SocketTimeoutException
import java.net.UnknownHostException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Central user-friendly error mapper facade that converts low-level technical exceptions
 * into clear, plain-language error messages.
 */
@Singleton
class UserFriendlyErrorMapper @Inject constructor() {

    /**
     * Converts a caught [Throwable] into a plain-language error string suitable for UI display.
     * Technical exception details are logged to system logs for developer debugging.
     */
    fun mapToMessage(throwable: Throwable?, defaultContext: String? = null): String {
        if (throwable == null) {
            return defaultContext ?: FALLBACK_ERROR_MESSAGE
        }

        // Log low-level technical exception details for developer debugging
        try {
            Log.e(TAG, "Exception caught and mapped: ${throwable.javaClass.name}: ${throwable.message}", throwable)
        } catch (_: Throwable) {
            // Unmocked Log call in pure JVM tests fallback
        }

        return mapThrowable(throwable)
    }

    /**
     * Convenience method mapping a throwable to plain language.
     */
    fun map(throwable: Throwable?): String = mapToMessage(throwable)

    private fun mapThrowable(throwable: Throwable): String {
        return when (throwable) {
            is UnknownHostException -> "Unable to connect to the network. Please check your internet connection."
            is SocketTimeoutException, is ConnectException -> "Network connection timed out. Please try again."
            is FileNotFoundException -> "The system cannot find the selected media file."
            is SecurityException -> "Access denied. The application lacks permission to perform this action."
            is SQLiteException -> "Database operation failed. Please try again."
            is PlaybackException -> "Unable to play media file. The format may be unsupported or corrupted."
            is IOException -> "An error occurred while accessing media storage or network."
            is IllegalArgumentException -> "Invalid request parameters provided."
            is IllegalStateException -> "Operation cannot be completed in current state."
            else -> {
                val cause = throwable.cause
                if (cause != null && cause !== throwable) {
                    mapThrowable(cause)
                } else {
                    FALLBACK_ERROR_MESSAGE
                }
            }
        }
    }

    companion object {
        private const val TAG = "UserFriendlyErrorMapper"
        const val FALLBACK_ERROR_MESSAGE = "An unexpected error occurred. Please try again."
    }
}
