package com.universalmedialibrary.ui.components

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties

/**
 * Reader Settings Dialog
 *
 * Comprehensive settings for reading experience with:
 * - Typography controls (font size, line height, spacing)
 * - Layout adjustments (margins, alignment)
 * - Page turn settings (animation, speed, gestures)
 * - Display preferences (theme, brightness)
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ReaderSettingsDialog(
    fontSize: Int,
    lineHeight: Float,
    marginHorizontal: Int,
    marginVertical: Int,
    pageTurnAnimation: String,
    pageTurnSpeed: String,
    theme: String,
    onFontSizeChange: (Int) -> Unit,
    onLineHeightChange: (Float) -> Unit,
    onMarginHorizontalChange: (Int) -> Unit,
    onMarginVerticalChange: (Int) -> Unit,
    onPageTurnAnimationChange: (String) -> Unit,
    onPageTurnSpeedChange: (String) -> Unit,
    onThemeChange: (String) -> Unit,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    var selectedTab by remember { mutableStateOf(0) }

    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(usePlatformDefaultWidth = false)
    ) {
        Surface(
            modifier = modifier
                .fillMaxWidth(0.95f)
                .fillMaxHeight(0.9f),
            shape = MaterialTheme.shapes.large,
            tonalElevation = 6.dp
        ) {
            Column(
                modifier = Modifier.fillMaxSize()
            ) {
                // Header
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Reader Settings",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                    IconButton(onClick = onDismiss) {
                        Icon(
                            imageVector = Icons.Default.Close,
                            contentDescription = "Close"
                        )
                    }
                }

                // Tab Row
                TabRow(selectedTabIndex = selectedTab) {
                    Tab(
                        selected = selectedTab == 0,
                        onClick = { selectedTab = 0 },
                        text = { Text("Typography") },
                        icon = { Icon(Icons.Default.FormatSize, null) }
                    )
                    Tab(
                        selected = selectedTab == 1,
                        onClick = { selectedTab = 1 },
                        text = { Text("Layout") },
                        icon = { Icon(Icons.Default.SpaceBar, null) }
                    )
                    Tab(
                        selected = selectedTab == 2,
                        onClick = { selectedTab = 2 },
                        text = { Text("Page Turn") },
                        icon = { Icon(Icons.Default.SwapHoriz, null) }
                    )
                }

                Divider()

                // Content
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .weight(1f)
                ) {
                    when (selectedTab) {
                        0 -> TypographySettings(
                            fontSize = fontSize,
                            lineHeight = lineHeight,
                            onFontSizeChange = onFontSizeChange,
                            onLineHeightChange = onLineHeightChange
                        )
                        1 -> LayoutSettings(
                            marginHorizontal = marginHorizontal,
                            marginVertical = marginVertical,
                            theme = theme,
                            onMarginHorizontalChange = onMarginHorizontalChange,
                            onMarginVerticalChange = onMarginVerticalChange,
                            onThemeChange = onThemeChange
                        )
                        2 -> PageTurnSettings(
                            animation = pageTurnAnimation,
                            speed = pageTurnSpeed,
                            onAnimationChange = onPageTurnAnimationChange,
                            onSpeedChange = onPageTurnSpeedChange
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun TypographySettings(
    fontSize: Int,
    lineHeight: Float,
    onFontSizeChange: (Int) -> Unit,
    onLineHeightChange: (Float) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        // Font Size
        Column {
            Text(
                text = "Font Size",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            Spacer(modifier = Modifier.height(8.dp))
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                IconButton(onClick = { if (fontSize > 12) onFontSizeChange(fontSize - 1) }) {
                    Icon(Icons.Default.Remove, "Decrease font size")
                }
                Text(
                    text = "$fontSize sp",
                    style = MaterialTheme.typography.bodyLarge,
                    modifier = Modifier.width(60.dp)
                )
                IconButton(onClick = { if (fontSize < 36) onFontSizeChange(fontSize + 1) }) {
                    Icon(Icons.Default.Add, "Increase font size")
                }
                Spacer(modifier = Modifier.weight(1f))
            }
            Slider(
                value = fontSize.toFloat(),
                onValueChange = { onFontSizeChange(it.toInt()) },
                valueRange = 12f..36f,
                steps = 23
            )
        }

        // Line Height
        Column {
            Text(
                text = "Line Height",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            Spacer(modifier = Modifier.height(8.dp))
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                IconButton(onClick = { if (lineHeight > 1.0f) onLineHeightChange((lineHeight - 0.1f).coerceAtLeast(1.0f)) }) {
                    Icon(Icons.Default.Remove, "Decrease line height")
                }
                Text(
                    text = String.format("%.1fx", lineHeight),
                    style = MaterialTheme.typography.bodyLarge,
                    modifier = Modifier.width(60.dp)
                )
                IconButton(onClick = { if (lineHeight < 2.5f) onLineHeightChange((lineHeight + 0.1f).coerceAtMost(2.5f)) }) {
                    Icon(Icons.Default.Add, "Increase line height")
                }
                Spacer(modifier = Modifier.weight(1f))
            }
            Slider(
                value = lineHeight,
                onValueChange = onLineHeightChange,
                valueRange = 1.0f..2.5f,
                steps = 14
            )
        }

        // Preview
        Card(
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surfaceVariant
            )
        ) {
            Text(
                text = "Preview: The quick brown fox jumps over the lazy dog. This text demonstrates the current typography settings.",
                style = MaterialTheme.typography.bodyLarge.copy(
                    fontSize = androidx.compose.ui.unit.TextUnit(fontSize.toFloat(), androidx.compose.ui.unit.TextUnitType.Sp),
                    lineHeight = androidx.compose.ui.unit.TextUnit(fontSize * lineHeight, androidx.compose.ui.unit.TextUnitType.Sp)
                ),
                modifier = Modifier.padding(16.dp)
            )
        }
    }
}

@Composable
private fun LayoutSettings(
    marginHorizontal: Int,
    marginVertical: Int,
    theme: String,
    onMarginHorizontalChange: (Int) -> Unit,
    onMarginVerticalChange: (Int) -> Unit,
    onThemeChange: (String) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        // Horizontal Margins
        Column {
            Text(
                text = "Horizontal Margins",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(text = "$marginHorizontal dp", style = MaterialTheme.typography.bodyMedium)
            Slider(
                value = marginHorizontal.toFloat(),
                onValueChange = { onMarginHorizontalChange(it.toInt()) },
                valueRange = 0f..64f,
                steps = 63
            )
        }

        // Vertical Margins
        Column {
            Text(
                text = "Vertical Margins",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(text = "$marginVertical dp", style = MaterialTheme.typography.bodyMedium)
            Slider(
                value = marginVertical.toFloat(),
                onValueChange = { onMarginVerticalChange(it.toInt()) },
                valueRange = 0f..96f,
                steps = 95
            )
        }

        // Theme Selection
        Column {
            Text(
                text = "Reading Theme",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            Spacer(modifier = Modifier.height(8.dp))
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                listOf("Light", "Dark", "Sepia", "Auto").forEach { themeOption ->
                    FilterChip(
                        selected = theme == themeOption,
                        onClick = { onThemeChange(themeOption) },
                        label = { Text(themeOption) }
                    )
                }
            }
        }
    }
}

@Composable
private fun PageTurnSettings(
    animation: String,
    speed: String,
    onAnimationChange: (String) -> Unit,
    onSpeedChange: (String) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        // Animation Type
        Column {
            Text(
                text = "Page Turn Animation",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            Spacer(modifier = Modifier.height(8.dp))
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                listOf("Slide", "Fade", "Curl", "Flip", "None").forEach { animOption ->
                    FilterChip(
                        selected = animation == animOption,
                        onClick = { onAnimationChange(animOption) },
                        label = { Text(animOption) },
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }
        }

        // Turn Speed
        Column {
            Text(
                text = "Animation Speed",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            Spacer(modifier = Modifier.height(8.dp))
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                listOf("Slow", "Normal", "Fast").forEach { speedOption ->
                    FilterChip(
                        selected = speed == speedOption,
                        onClick = { onSpeedChange(speedOption) },
                        label = { Text(speedOption) }
                    )
                }
            }
        }
    }
}
