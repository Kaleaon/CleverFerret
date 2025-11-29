package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.Alignment

/**
 * E-Ink Mode Support
 * Optimized reading experience for e-ink displays
 * Inspired by Moonreader's e-ink mode
 * 
 * Features:
 * - Disable all animations
 * - Pure white background with true black text
 * - No gradients or transparency
 * - Optimized for e-ink refresh rates
 */

data class EInkModeSettings(
    val enabled: Boolean = false,
    val disableAnimations: Boolean = true,
    val pureWhiteBackground: Boolean = true,
    val trueBlackText: Boolean = true,
    val disablePageTurnAnimations: Boolean = true,
    val disableMenuAnimations: Boolean = true,
    val highContrast: Boolean = true
)

/**
 * E-Ink optimized color scheme
 */
object EInkColorScheme {
    val Background = Color(0xFFFFFFFF) // Pure white
    val Text = Color(0xFF000000) // True black
    val Link = Color(0xFF000000) // Black links (no blue)
    val Border = Color(0xFF000000) // Black borders
}

/**
 * Apply e-ink mode settings to reader
 */
@Composable
fun EInkModeProvider(
    settings: EInkModeSettings,
    content: @Composable () -> Unit
) {
    if (settings.enabled) {
        // Override theme colors for e-ink
        CompositionLocalProvider(
            LocalContentColor provides EInkColorScheme.Text
        ) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(EInkColorScheme.Background)
            ) {
                content()
            }
        }
    } else {
        content()
    }
}

/**
 * E-Ink Mode Settings Panel
 */
@Composable
fun EInkModeSettingsPanel(
    settings: EInkModeSettings,
    onSettingsChange: (EInkModeSettings) -> Unit,
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
                text = "E-Ink Mode",
                style = MaterialTheme.typography.titleMedium
            )
            
            Text(
                text = "Optimize reading experience for e-ink displays by disabling animations and using high contrast colors.",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            // Enable e-ink mode
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
            ) {
                Text("Enable E-Ink Mode", style = MaterialTheme.typography.bodyMedium)
                Switch(
                    checked = settings.enabled,
                    onCheckedChange = { 
                        onSettingsChange(settings.copy(enabled = it))
                    }
                )
            }

            if (settings.enabled) {
                // Disable animations
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text("Disable All Animations", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = settings.disableAnimations,
                        onCheckedChange = { 
                            onSettingsChange(settings.copy(disableAnimations = it))
                        }
                    )
                }

                // Pure white background
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text("Pure White Background", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = settings.pureWhiteBackground,
                        onCheckedChange = { 
                            onSettingsChange(settings.copy(pureWhiteBackground = it))
                        }
                    )
                }

                // True black text
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text("True Black Text", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = settings.trueBlackText,
                        onCheckedChange = { 
                            onSettingsChange(settings.copy(trueBlackText = it))
                        }
                    )
                }

                // High contrast
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                ) {
                    Text("High Contrast Mode", style = MaterialTheme.typography.bodyMedium)
                    Switch(
                        checked = settings.highContrast,
                        onCheckedChange = { 
                            onSettingsChange(settings.copy(highContrast = it))
                        }
                    )
                }
            }
        }
    }
}

/**
 * Check if device is e-ink display (simplified detection)
 * In production, use system properties or device detection
 */
fun isEInkDevice(): Boolean {
    // Simplified check - in production, check system properties
    // e.g., check for e-ink specific device models or system properties
    return false // Default to false, can be enhanced with actual detection
}
