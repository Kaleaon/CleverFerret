package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.unit.dp

/**
 * Dual-Page Mode for reading experience
 * Inspired by Moonreader's dual-page layout for foldable devices and landscape reading
 * 
 * Features:
 * - Automatic detection of foldable devices
 * - Landscape-only option
 * - Book-style background option
 * - Page gap configuration
 */

data class DualPageSettings(
    val enabled: Boolean = false,
    val onlyInLandscape: Boolean = false,
    val showBookStyleBackground: Boolean = true,
    val pageGap: Int = 8, // dp between pages
    val autoDetectFoldable: Boolean = true
)

enum class DualPageMode {
    DISABLED,
    ALWAYS,
    LANDSCAPE_ONLY,
    FOLDABLE_ONLY
}

@Composable
fun DualPageReader(
    leftPage: @Composable () -> Unit,
    rightPage: @Composable () -> Unit,
    settings: DualPageSettings,
    modifier: Modifier = Modifier
) {
    val configuration = LocalConfiguration.current
    val isLandscape = configuration.screenWidthDp > configuration.screenHeightDp
    
    // Determine if dual page should be shown
    val shouldShowDualPage = when {
        !settings.enabled -> false
        settings.onlyInLandscape && !isLandscape -> false
        settings.autoDetectFoldable && !isFoldableDevice(configuration) -> false
        else -> true
    }

    if (shouldShowDualPage) {
        Row(
            modifier = modifier
                .fillMaxSize()
                .background(
                    if (settings.showBookStyleBackground) {
                        Color(0xFFE8E6E1) // Book-style beige background
                    } else {
                        MaterialTheme.colorScheme.surface
                    }
                )
                .padding(horizontal = settings.pageGap.dp / 2),
            horizontalArrangement = Arrangement.spacedBy(settings.pageGap.dp)
        ) {
            // Left page
            Box(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight()
            ) {
                leftPage()
            }

            // Center divider (book spine effect)
            if (settings.showBookStyleBackground) {
                Box(
                    modifier = Modifier
                        .width(2.dp)
                        .fillMaxHeight()
                        .background(Color(0xFF8B7355)) // Book spine color
                )
            }

            // Right page
            Box(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight()
            ) {
                rightPage()
            }
        }
    } else {
        // Single page mode
        Box(modifier = modifier.fillMaxSize()) {
            leftPage()
        }
    }
}

/**
 * Detect if device is a foldable (simplified detection)
 * In production, use WindowManager to detect actual foldable state
 */
private fun isFoldableDevice(configuration: android.content.res.Configuration): Boolean {
    // Simplified check - in real implementation, use WindowManager
    // to check for actual foldable state
    return configuration.screenWidthDp >= 840 // Typical foldable width
}

@Composable
fun DualPageSettingsPanel(
    settings: DualPageSettings,
    onSettingsChange: (DualPageSettings) -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = "Dual-Page Mode",
                style = MaterialTheme.typography.titleMedium
            )

            // Enable dual page
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
            ) {
                Text("Enable Dual-Page", style = MaterialTheme.typography.bodyMedium)
                Switch(
                    checked = settings.enabled,
                    onCheckedChange = { 
                        onSettingsChange(settings.copy(enabled = it))
                    }
                )
            }

            if (settings.enabled) {
                // Landscape only option
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text("Landscape Only", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = settings.onlyInLandscape,
                        onCheckedChange = { 
                            onSettingsChange(settings.copy(onlyInLandscape = it))
                        }
                    )
                }

                // Book style background
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text("Book-Style Background", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = settings.showBookStyleBackground,
                        onCheckedChange = { 
                            onSettingsChange(settings.copy(showBookStyleBackground = it))
                        }
                    )
                }

                // Auto-detect foldable
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text("Auto-Detect Foldable", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = settings.autoDetectFoldable,
                        onCheckedChange = { 
                            onSettingsChange(settings.copy(autoDetectFoldable = it))
                        }
                    )
                }

                // Page gap slider
                Text(
                    text = "Page Gap: ${settings.pageGap}dp",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = settings.pageGap.toFloat(),
                    onValueChange = { 
                        onSettingsChange(settings.copy(pageGap = it.toInt()))
                    },
                    valueRange = 0f..24f,
                    steps = 11
                )
            }
        }
    }
}
