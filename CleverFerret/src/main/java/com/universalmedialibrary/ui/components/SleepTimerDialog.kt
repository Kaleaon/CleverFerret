package com.universalmedialibrary.ui.components

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.selection.selectable
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AccessTime
import androidx.compose.material.icons.filled.Close
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog

/**
 * Sleep Timer Dialog
 *
 * Allows users to set a sleep timer for audiobook/podcast playback with:
 * - Preset time options (5, 10, 15, 30, 60 minutes)
 * - Custom time input
 * - End of chapter option
 * - Timer status display
 * - Cancel timer option
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SleepTimerDialog(
    currentTimerMinutes: Int?,  // null if no timer active
    remainingSeconds: Int?,  // null if no timer active
    onSetTimer: (Int) -> Unit,
    onCancelTimer: () -> Unit,
    onSetEndOfChapter: () -> Unit,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    var selectedOption by remember { mutableStateOf<SleepTimerOption?>(null) }
    var customMinutes by remember { mutableStateOf("") }

    val presetOptions = listOf(
        SleepTimerOption.Preset(5, "5 minutes"),
        SleepTimerOption.Preset(10, "10 minutes"),
        SleepTimerOption.Preset(15, "15 minutes"),
        SleepTimerOption.Preset(30, "30 minutes"),
        SleepTimerOption.Preset(60, "1 hour"),
        SleepTimerOption.EndOfChapter
    )

    Dialog(onDismissRequest = onDismiss) {
        Surface(
            modifier = modifier.fillMaxWidth(0.9f),
            shape = MaterialTheme.shapes.large,
            tonalElevation = 6.dp
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(24.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Header
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            imageVector = Icons.Default.AccessTime,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            text = "Sleep Timer",
                            style = MaterialTheme.typography.headlineSmall,
                            fontWeight = FontWeight.Bold
                        )
                    }
                    IconButton(onClick = onDismiss) {
                        Icon(
                            imageVector = Icons.Default.Close,
                            contentDescription = "Close"
                        )
                    }
                }

                // Current timer status
                if (currentTimerMinutes != null && remainingSeconds != null) {
                    Card(
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.primaryContainer
                        )
                    ) {
                        Column(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            verticalArrangement = Arrangement.spacedBy(4.dp)
                        ) {
                            Text(
                                text = "Timer Active",
                                style = MaterialTheme.typography.labelMedium,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                            Text(
                                text = formatRemainingTime(remainingSeconds),
                                style = MaterialTheme.typography.headlineMedium,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                }

                Divider()

                // Preset options
                presetOptions.forEach { option ->
                    val isSelected = selectedOption == option
                    
                    Surface(
                        modifier = Modifier
                            .fillMaxWidth()
                            .selectable(
                                selected = isSelected,
                                onClick = { selectedOption = option },
                                role = Role.RadioButton
                            ),
                        shape = MaterialTheme.shapes.medium,
                        color = if (isSelected) {
                            MaterialTheme.colorScheme.secondaryContainer
                        } else {
                            MaterialTheme.colorScheme.surface
                        }
                    ) {
                        Row(
                            modifier = Modifier.padding(16.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = when (option) {
                                    is SleepTimerOption.Preset -> option.label
                                    SleepTimerOption.EndOfChapter -> "End of chapter"
                                    SleepTimerOption.Custom -> "Custom"
                                },
                                style = MaterialTheme.typography.bodyLarge
                            )
                            RadioButton(
                                selected = isSelected,
                                onClick = null
                            )
                        }
                    }
                }

                // Custom time input
                OutlinedTextField(
                    value = customMinutes,
                    onValueChange = { value ->
                        if (value.isEmpty() || value.all { it.isDigit() }) {
                            customMinutes = value
                            if (value.isNotEmpty()) {
                                selectedOption = SleepTimerOption.Custom
                            }
                        }
                    },
                    label = { Text("Custom (minutes)") },
                    placeholder = { Text("Enter minutes") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )

                // Action buttons
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    if (currentTimerMinutes != null) {
                        OutlinedButton(
                            onClick = {
                                onCancelTimer()
                                onDismiss()
                            },
                            modifier = Modifier.weight(1f)
                        ) {
                            Text("Cancel Timer")
                        }
                    }
                    
                    Button(
                        onClick = {
                            when (val option = selectedOption) {
                                is SleepTimerOption.Preset -> {
                                    onSetTimer(option.minutes)
                                    onDismiss()
                                }
                                SleepTimerOption.EndOfChapter -> {
                                    onSetEndOfChapter()
                                    onDismiss()
                                }
                                SleepTimerOption.Custom -> {
                                    val minutes = customMinutes.toIntOrNull()
                                    if (minutes != null && minutes > 0) {
                                        onSetTimer(minutes)
                                        onDismiss()
                                    }
                                }
                                null -> Unit
                            }
                        },
                        enabled = selectedOption != null && 
                            (selectedOption !is SleepTimerOption.Custom || customMinutes.toIntOrNull() != null),
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Set Timer")
                    }
                }
            }
        }
    }
}

/**
 * Format remaining time in seconds to human-readable string
 */
private fun formatRemainingTime(seconds: Int): String {
    val hours = seconds / 3600
    val minutes = (seconds % 3600) / 60
    val secs = seconds % 60
    
    return when {
        hours > 0 -> String.format("%d:%02d:%02d remaining", hours, minutes, secs)
        minutes > 0 -> String.format("%d:%02d remaining", minutes, secs)
        else -> String.format("%d seconds remaining", secs)
    }
}

/**
 * Sleep timer options
 */
sealed class SleepTimerOption {
    data class Preset(val minutes: Int, val label: String) : SleepTimerOption()
    object EndOfChapter : SleepTimerOption()
    object Custom : SleepTimerOption()
}
