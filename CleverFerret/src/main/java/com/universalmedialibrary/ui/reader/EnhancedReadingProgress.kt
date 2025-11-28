package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import java.text.NumberFormat
import kotlin.math.roundToInt

/**
 * Enhanced Reading Progress Indicators
 * Multiple progress display options inspired by Moonreader
 */

data class ReadingProgress(
    val currentPosition: Int, // characters or position
    val totalLength: Int, // total characters or length
    val currentPage: Int = 0,
    val totalPages: Int = 0,
    val currentChapter: Int = 0,
    val totalChapters: Int = 0,
    val percentage: Float = 0f
)

/**
 * Compact progress indicator (percentage only)
 */
@Composable
fun CompactProgressIndicator(
    progress: ReadingProgress,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier,
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        LinearProgressIndicator(
            progress = { progress.percentage },
            modifier = Modifier
                .weight(1f)
                .height(4.dp),
            color = MaterialTheme.colorScheme.primary,
            trackColor = MaterialTheme.colorScheme.surfaceVariant
        )
        Text(
            text = "${(progress.percentage * 100).roundToInt()}%",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

/**
 * Detailed progress indicator with page numbers
 */
@Composable
fun DetailedProgressIndicator(
    progress: ReadingProgress,
    showPageNumbers: Boolean = true,
    showChapterNumbers: Boolean = true,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        // Progress bar
        LinearProgressIndicator(
            progress = { progress.percentage },
            modifier = Modifier
                .fillMaxWidth()
                .height(6.dp),
            color = MaterialTheme.colorScheme.primary,
            trackColor = MaterialTheme.colorScheme.surfaceVariant
        )
        
        // Progress text
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            if (showChapterNumbers && progress.totalChapters > 0) {
                Text(
                    text = "Chapter ${progress.currentChapter + 1} / ${progress.totalChapters}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            if (showPageNumbers && progress.totalPages > 0) {
                Text(
                    text = "Page ${progress.currentPage + 1} / ${progress.totalPages}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Text(
                text = "${(progress.percentage * 100).roundToInt()}%",
                style = MaterialTheme.typography.bodySmall,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary
            )
        }
    }
}

/**
 * Print edition page numbers indicator
 * Shows print edition page numbers if available
 */
@Composable
fun PrintEditionPageIndicator(
    currentPrintPage: Int?,
    totalPrintPages: Int?,
    modifier: Modifier = Modifier
) {
    if (currentPrintPage != null && totalPrintPages != null) {
        Surface(
            modifier = modifier,
            color = MaterialTheme.colorScheme.surfaceVariant,
            shape = MaterialTheme.shapes.small
        ) {
            Row(
                modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = "Print Edition:",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    text = "$currentPrintPage / $totalPrintPages",
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.Medium
                )
            }
        }
    }
}

/**
 * Reading time remaining indicator
 */
@Composable
fun ReadingTimeRemainingIndicator(
    timeRemaining: Long, // milliseconds
    modifier: Modifier = Modifier
) {
    val calculator = remember { ReadingTimeCalculator() }
    val formattedTime = calculator.formatTimeEstimate(timeRemaining)
    
    Surface(
        modifier = modifier,
        color = MaterialTheme.colorScheme.primaryContainer,
        shape = MaterialTheme.shapes.small
    ) {
        Text(
            text = "$formattedTime remaining",
            style = MaterialTheme.typography.bodyMedium,
            fontWeight = FontWeight.Medium,
            color = MaterialTheme.colorScheme.onPrimaryContainer,
            modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp)
        )
    }
}

/**
 * Words per minute indicator
 */
@Composable
fun WordsPerMinuteIndicator(
    wordsPerMinute: Int,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier,
        color = MaterialTheme.colorScheme.secondaryContainer,
        shape = MaterialTheme.shapes.small
    ) {
        Row(
            modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = "WPM:",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSecondaryContainer
            )
            Text(
                text = wordsPerMinute.toString(),
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onSecondaryContainer
            )
        }
    }
}

/**
 * Characters in book indicator
 */
@Composable
fun CharactersInBookIndicator(
    characters: Int,
    modifier: Modifier = Modifier
) {
    val formatter = NumberFormat.getNumberInstance()
    val formattedChars = formatter.format(characters)
    
    Text(
        text = "$formattedChars characters",
        style = MaterialTheme.typography.bodySmall,
        color = MaterialTheme.colorScheme.onSurfaceVariant,
        modifier = modifier
    )
}

/**
 * Combined progress indicator with all information
 */
@Composable
fun ComprehensiveProgressIndicator(
    progress: ReadingProgress,
    timeRemaining: Long? = null,
    wordsPerMinute: Int? = null,
    totalCharacters: Int? = null,
    currentPrintPage: Int? = null,
    totalPrintPages: Int? = null,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        // Main progress
        DetailedProgressIndicator(
            progress = progress,
            showPageNumbers = true,
            showChapterNumbers = true
        )
        
        // Additional info row
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            timeRemaining?.let {
                ReadingTimeRemainingIndicator(
                    timeRemaining = it,
                    modifier = Modifier.weight(1f)
                )
            }
            
            wordsPerMinute?.let {
                WordsPerMinuteIndicator(
                    wordsPerMinute = it,
                    modifier = Modifier.weight(1f)
                )
            }
        }
        
        // Print edition pages
        if (currentPrintPage != null && totalPrintPages != null) {
            PrintEditionPageIndicator(
                currentPrintPage = currentPrintPage,
                totalPrintPages = totalPrintPages
            )
        }
        
        // Characters count
        totalCharacters?.let {
            CharactersInBookIndicator(characters = it)
        }
    }
}
