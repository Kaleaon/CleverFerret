package com.universalmedialibrary.utils.media

import java.util.Locale

/**
 * Shared utility object for formatting media playback times and durations consistently across the application.
 */
object MediaTimeFormatter {

    /**
     * Formats millisecond duration into media time format: `m:ss` for durations under 1 hour,
     * or `h:mm:ss` for durations of 1 hour or longer, using [Locale.getDefault].
     * Non-positive or null millisecond values return graceful fallback "0:00".
     */
    @JvmStatic
    fun formatMediaTime(milliseconds: Long?): String {
        if (milliseconds == null || milliseconds <= 0L) {
            return "0:00"
        }
        val totalSeconds = milliseconds / 1000L
        val hours = totalSeconds / 3600L
        val minutes = (totalSeconds % 3600L) / 60L
        val seconds = totalSeconds % 60L

        return if (hours > 0L) {
            String.format(Locale.getDefault(), "%d:%02d:%02d", hours, minutes, seconds)
        } else {
            String.format(Locale.getDefault(), "%d:%02d", minutes, seconds)
        }
    }

    /**
     * Formats millisecond duration into human-readable verbose duration format (e.g., "1h 23m", "5m 30s", "15s").
     * Non-positive or null millisecond values return graceful fallback "0s".
     */
    @JvmStatic
    fun formatVerboseDuration(milliseconds: Long?): String {
        if (milliseconds == null || milliseconds <= 0L) {
            return "0s"
        }
        val totalSeconds = milliseconds / 1000L
        val hours = totalSeconds / 3600L
        val minutes = (totalSeconds % 3600L) / 60L
        val seconds = totalSeconds % 60L

        return when {
            hours > 0L && minutes > 0L -> "${hours}h ${minutes}m"
            hours > 0L -> "${hours}h"
            minutes > 0L && seconds > 0L -> "${minutes}m ${seconds}s"
            minutes > 0L -> "${minutes}m"
            else -> "${seconds}s"
        }
    }
}

/**
 * Extension function on [Long] (or nullable [Long]) to format milliseconds as media time (`m:ss` or `h:mm:ss`).
 */
fun Long?.formatAsMediaTime(): String = MediaTimeFormatter.formatMediaTime(this)

/**
 * Extension function on [Long] (or nullable [Long]) to format milliseconds as verbose duration (`1h 23m`, `5m 30s`, etc.).
 */
fun Long?.formatAsVerboseDuration(): String = MediaTimeFormatter.formatVerboseDuration(this)
