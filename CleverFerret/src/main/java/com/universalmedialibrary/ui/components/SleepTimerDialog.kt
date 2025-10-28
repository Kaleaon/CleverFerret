package com.universalmedialibrary.ui.components

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Bedtime
import androidx.compose.material.icons.filled.Timer
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Sleep Timer Dialog
 * 
 * Allows users to set a sleep timer that will pause/stop playback after a specified duration.
 * Commonly used for audiobook listening before bed.
 *
 * @param onDismiss Callback when dialog is dismissed
 * @param onSetTimer Callback with selected duration in minutes
 */
@Composable
fun SleepTimerDialog(
    onDismiss: () -> Unit,
    onSetTimer: (minutes: Int) -> Unit
) {
    val timerOptions = listOf(
        TimerOption(5, "5 minutes"),
        TimerOption(10, "10 minutes"),
        TimerOption(15, "15 minutes"),
        TimerOption(20, "20 minutes"),
        TimerOption(30, "30 minutes"),
        TimerOption(45, "45 minutes"),
        TimerOption(60, "1 hour"),
        TimerOption(90, "1.5 hours"),
        TimerOption(120, "2 hours")
    )
    
    AlertDialog(
        onDismissRequest = onDismiss,
        icon = {
            Icon(
                Icons.Default.Bedtime,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary
            )
        },
        title = {
            Text(
                "Sleep Timer",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold
            )
        },
        text = {
            LazyColumn(
                modifier = Modifier.fillMaxWidth(),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                items(timerOptions) { option ->
                    ListItem(
                        headlineContent = { Text(option.label) },
                        leadingContent = {
                            Icon(
                                Icons.Default.Timer,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.primary
                            )
                        },
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable {
                                onSetTimer(option.minutes)
                                onDismiss()
                            }
                    )
                }
            }
        },
        confirmButton = {},
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

/**
 * Backward-compatible overload for existing call sites
 * Retains original signature for compatibility while delegating to simplified dialog
 */
@Composable
fun SleepTimerDialog(
    currentTimerMinutes: Int?,
    remainingSeconds: Int?,
    onSetTimer: (Int) -> Unit,
    onCancelTimer: () -> Unit,
    onSetEndOfChapter: () -> Unit,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    // Delegate to simplified dialog for now; full feature restoration can be added later
    SleepTimerDialog(
        onDismiss = onDismiss,
        onSetTimer = onSetTimer
    )
}

/**
 * Timer option data class
 */
private data class TimerOption(
    val minutes: Int,
    val label: String
)
