package com.universalmedialibrary.utils

import java.util.Locale
import kotlin.math.log10
import kotlin.math.pow

private const val BYTES_PER_KILOBYTE = 1024L
private const val BYTES_PER_KILOBYTE_DOUBLE = 1024.0

/**
 * Canonical utility for formatting byte counts into human-readable file size strings.
 */
object FileSizeFormatter {

    private val UNITS = arrayOf("B", "KB", "MB", "GB", "TB")

    /**
     * Formats a byte size into a human-readable string (e.g., "1.5 MB", "500 B").
     *
     * - Negative values and 0 are formatted as "0 B".
     * - Values < 1024 bytes are formatted as exact byte counts (e.g., "500 B").
     * - Values >= 1 KB use binary scaling (1024 bytes per unit) and format with 1 decimal place.
     * - Uses [Locale.getDefault] for locale-aware number formatting.
     */
    @JvmStatic
    fun formatFileSize(bytes: Long): String {
        if (bytes <= 0L) return "0 B"
        if (bytes < BYTES_PER_KILOBYTE) return "$bytes B"

        val digitGroups = (log10(bytes.toDouble()) / log10(BYTES_PER_KILOBYTE_DOUBLE)).toInt().coerceIn(0, UNITS.lastIndex)
        val value = bytes / BYTES_PER_KILOBYTE_DOUBLE.pow(digitGroups.toDouble())
        return String.format(Locale.getDefault(), "%.1f %s", value, UNITS[digitGroups])
    }
}

/**
 * Extension function to format a [Long] byte size into a human-readable string.
 */
@JvmName("formatFileSizeExtension")
fun Long.formatFileSize(): String = FileSizeFormatter.formatFileSize(this)

/**
 * Top-level function to format a byte size into a human-readable string.
 */
fun formatFileSize(bytes: Long): String = FileSizeFormatter.formatFileSize(bytes)
