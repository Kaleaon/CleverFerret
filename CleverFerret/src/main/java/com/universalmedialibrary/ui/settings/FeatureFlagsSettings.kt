package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.core.FeatureFlags

/**
 * Feature Flags Settings Screen
 *
 * Allows users to toggle experimental and optional features at runtime.
 * All changes are persisted to SharedPreferences.
 *
 * Usage in navigation:
 * ```
 * composable("settings/features") {
 *     FeatureFlagsSettingsScreen(
 *         onNavigateBack = { navController.popBackStack() }
 *     )
 * }
 * ```
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FeatureFlagsSettingsScreen(
    onNavigateBack: () -> Unit = {},
    modifier: Modifier = Modifier
) {
    var flags by remember { mutableStateOf(FeatureFlags.getAllFlags()) }
    var showResetDialog by remember { mutableStateOf(false) }
    var showExperimentalWarning by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Feature Flags") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showResetDialog = true }) {
                        Icon(Icons.Default.RestartAlt, "Reset to defaults")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Warning card
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.warningContainer
                )
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Default.Warning,
                        contentDescription = "Media image",
                        tint = MaterialTheme.colorScheme.onWarningContainer,
                        modifier = Modifier.size(24.dp)
                    )
                    Spacer(modifier = Modifier.width(12.dp))
                    Text(
                        text = "Changes take effect immediately. Some features may be unstable.",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onWarningContainer
                    )
                }
            }

            // Feature flags list
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(horizontal = 16.dp, vertical = 8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(flags) { (flag, enabled) ->
                    FeatureFlagItem(
                        flag = flag,
                        enabled = enabled,
                        onToggle = { newValue ->
                            // Show warning for experimental features
                            if (flag == FeatureFlags.FeatureFlag.ENABLE_EXPERIMENTAL && newValue) {
                                showExperimentalWarning = true
                            } else {
                                FeatureFlags.setFlag(flag, newValue)
                                flags = FeatureFlags.getAllFlags()
                            }
                        }
                    )
                }
            }
        }
    }

    // Reset confirmation dialog
    if (showResetDialog) {
        AlertDialog(
            onDismissRequest = { showResetDialog = false },
            icon = { Icon(Icons.Default.RestartAlt, null) },
            title = { Text("Reset to Defaults?") },
            text = { Text("This will reset all feature flags to their default values.") },
            confirmButton = {
                TextButton(
                    onClick = {
                        FeatureFlags.resetToDefaults()
                        flags = FeatureFlags.getAllFlags()
                        showResetDialog = false
                    }
                ) {
                    Text("Reset")
                }
            },
            dismissButton = {
                TextButton(onClick = { showResetDialog = false }) {
                    Text("Cancel")
                }
            }
        )
    }

    // Experimental feature warning
    if (showExperimentalWarning) {
        AlertDialog(
            onDismissRequest = { showExperimentalWarning = false },
            icon = { Icon(Icons.Default.Warning, null, tint = MaterialTheme.colorScheme.error) },
            title = { Text("Enable Experimental Features?") },
            text = {
                Text("Experimental features are unstable and may cause crashes or data loss. Only enable for testing purposes.")
            },
            confirmButton = {
                TextButton(
                    onClick = {
                        FeatureFlags.setFlag(FeatureFlags.FeatureFlag.ENABLE_EXPERIMENTAL, true)
                        flags = FeatureFlags.getAllFlags()
                        showExperimentalWarning = false
                    }
                ) {
                    Text("Enable Anyway")
                }
            },
            dismissButton = {
                TextButton(onClick = { showExperimentalWarning = false }) {
                    Text("Cancel")
                }
            }
        )
    }
}

@Composable
private fun FeatureFlagItem(
    flag: FeatureFlags.FeatureFlag,
    enabled: Boolean,
    onToggle: (Boolean) -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = getIconForFlag(flag),
                        contentDescription = "Media image",
                        modifier = Modifier.size(20.dp),
                        tint = if (enabled) {
                            MaterialTheme.colorScheme.primary
                        } else {
                            MaterialTheme.colorScheme.onSurfaceVariant
                        }
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = flag.displayName,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                }
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = flag.description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            Spacer(modifier = Modifier.width(16.dp))
            Switch(
                checked = enabled,
                onCheckedChange = onToggle
            )
        }
    }
}

@Composable
private fun getIconForFlag(flag: FeatureFlags.FeatureFlag) = when (flag) {
    FeatureFlags.FeatureFlag.USE_EPUB4J -> Icons.Default.Book
    FeatureFlags.FeatureFlag.ENABLE_GEMINI -> Icons.Default.AutoAwesome
    FeatureFlags.FeatureFlag.ENABLE_CLOUD_TTS -> Icons.Default.RecordVoiceOver
    FeatureFlags.FeatureFlag.ENABLE_EXOPLAYER -> Icons.Default.PlayCircle
    FeatureFlags.FeatureFlag.ENABLE_PODCASTS -> Icons.Default.MusicNote
    FeatureFlags.FeatureFlag.ENABLE_ADVANCED_READER -> Icons.AutoMirrored.Filled.MenuBook
    FeatureFlags.FeatureFlag.ENABLE_AI_METADATA -> Icons.Default.Psychology
    FeatureFlags.FeatureFlag.ENABLE_AUDIOBOOK_PLAYER -> Icons.Default.Headphones
    FeatureFlags.FeatureFlag.ENABLE_SYNCHRONIZED_READING -> Icons.Default.Sync
    FeatureFlags.FeatureFlag.ENABLE_EXPERIMENTAL -> Icons.Default.Science
}

// Extension color property for warning container (if not defined in theme)
private val ColorScheme.warningContainer: androidx.compose.ui.graphics.Color
    get() = if (this == lightColorScheme()) {
        androidx.compose.ui.graphics.Color(0xFFFFEECC)
    } else {
        androidx.compose.ui.graphics.Color(0xFF554400)
    }

private val ColorScheme.onWarningContainer: androidx.compose.ui.graphics.Color
    get() = if (this == lightColorScheme()) {
        androidx.compose.ui.graphics.Color(0xFF554400)
    } else {
        androidx.compose.ui.graphics.Color(0xFFFFEECC)
    }
