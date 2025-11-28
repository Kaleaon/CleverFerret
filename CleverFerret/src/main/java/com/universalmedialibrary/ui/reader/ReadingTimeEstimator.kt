package com.universalmedialibrary.ui.reader

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.foundation.layout.Column
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.sp
import kotlin.math.roundToInt

/**
 * Reading Time Estimator
 * Calculates reading time based on reading speed and content
 * Inspired by Moonreader's reading time estimation features
 */

data class ReadingTimeEstimate(
    val timePerPage: Float, // seconds
    val wordsPerMinute: Int,
    val charactersPerMinute: Int,
    val estimatedTimeRemaining: Long, // milliseconds
    val estimatedTimeTotal: Long, // milliseconds
    val pagesRemaining: Int,
    val pagesTotal: Int
)

data class ReadingSpeed(
    val wordsPerMinute: Int = 250, // Average reading speed
    val charactersPerMinute: Int = 1250, // ~5 chars per word
    val pagesPerMinute: Float = 2.0f // Average pages per minute
)

class ReadingTimeCalculator {
    /**
     * Calculate reading time estimate based on content and reading speed
     */
    fun calculateEstimate(
        contentLength: Int, // characters
        currentPosition: Int, // characters read
        readingSpeed: ReadingSpeed = ReadingSpeed(),
        timeSpentReading: Long = 0L // milliseconds
    ): ReadingTimeEstimate {
        val charactersRemaining = contentLength - currentPosition
        val charactersRead = currentPosition
        
        // Calculate actual reading speed if time spent is available
        val actualWPM = if (timeSpentReading > 0 && charactersRead > 0) {
            val minutesSpent = timeSpentReading / 60000.0
            val wordsRead = charactersRead / 5.0 // Approximate words
            (wordsRead / minutesSpent).toInt().coerceIn(50, 1000)
        } else {
            readingSpeed.wordsPerMinute
        }
        
        val actualCPM = actualWPM * 5 // Characters per minute
        
        // Calculate time estimates
        val estimatedTimeRemaining = if (actualCPM > 0) {
            (charactersRemaining.toFloat() / actualCPM * 60000).toLong()
        } else {
            0L
        }
        
        val estimatedTimeTotal = if (actualCPM > 0) {
            (contentLength.toFloat() / actualCPM * 60000).toLong()
        } else {
            0L
        }
        
        // Calculate pages (assuming ~2500 characters per page)
        val charactersPerPage = 2500
        val pagesTotal = (contentLength / charactersPerPage).coerceAtLeast(1)
        val pagesRead = (currentPosition / charactersPerPage)
        val pagesRemaining = (pagesTotal - pagesRead).coerceAtLeast(0)
        
        // Time per page in seconds
        val timePerPage = if (actualCPM > 0) {
            (charactersPerPage.toFloat() / actualCPM * 60)
        } else {
            30f // Default 30 seconds per page
        }
        
        return ReadingTimeEstimate(
            timePerPage = timePerPage,
            wordsPerMinute = actualWPM,
            charactersPerMinute = actualCPM,
            estimatedTimeRemaining = estimatedTimeRemaining,
            estimatedTimeTotal = estimatedTimeTotal,
            pagesRemaining = pagesRemaining,
            pagesTotal = pagesTotal
        )
    }
    
    /**
     * Format time estimate as human-readable string
     */
    fun formatTimeEstimate(milliseconds: Long): String {
        val totalSeconds = (milliseconds / 1000).toInt()
        
        return when {
            totalSeconds < 60 -> "$totalSeconds sec"
            totalSeconds < 3600 -> {
                val minutes = totalSeconds / 60
                val seconds = totalSeconds % 60
                if (seconds > 0) "$minutes min $seconds sec" else "$minutes min"
            }
            else -> {
                val hours = totalSeconds / 3600
                val minutes = (totalSeconds % 3600) / 60
                if (minutes > 0) "$hours hr $minutes min" else "$hours hr"
            }
        }
    }
    
    /**
     * Calculate reading speed from session data
     */
    fun calculateReadingSpeed(
        charactersRead: Int,
        timeSpentMs: Long
    ): ReadingSpeed {
        if (timeSpentMs <= 0 || charactersRead <= 0) {
            return ReadingSpeed()
        }
        
        val minutesSpent = timeSpentMs / 60000.0
        val wordsRead = charactersRead / 5.0
        val wpm = (wordsRead / minutesSpent).roundToInt().coerceIn(50, 1000)
        val cpm = wpm * 5
        
        // Estimate pages per minute (assuming 2500 chars per page)
        val pagesRead = charactersRead / 2500.0
        val pagesPerMinute = (pagesRead / minutesSpent).toFloat().coerceIn(0.1f, 10f)
        
        return ReadingSpeed(
            wordsPerMinute = wpm,
            charactersPerMinute = cpm,
            pagesPerMinute = pagesPerMinute
        )
    }
}

/**
 * Composable for displaying reading time estimate
 */
@Composable
fun ReadingTimeEstimateDisplay(
    estimate: ReadingTimeEstimate,
    showDetailed: Boolean = false
) {
    val calculator = remember { ReadingTimeCalculator() }
    
    Column {
        if (showDetailed) {
            // Detailed view
            Text(
                text = "Reading Speed: ${estimate.wordsPerMinute} WPM",
                style = MaterialTheme.typography.bodyMedium
            )
            Text(
                text = "Time Remaining: ${calculator.formatTimeEstimate(estimate.estimatedTimeRemaining)}",
                style = MaterialTheme.typography.bodyMedium
            )
            Text(
                text = "Pages: ${estimate.pagesRemaining} / ${estimate.pagesTotal}",
                style = MaterialTheme.typography.bodyMedium
            )
            Text(
                text = "Time per Page: ${estimate.timePerPage.roundToInt()}s",
                style = MaterialTheme.typography.bodySmall
            )
        } else {
            // Compact view
            Text(
                text = "${calculator.formatTimeEstimate(estimate.estimatedTimeRemaining)} remaining",
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}
