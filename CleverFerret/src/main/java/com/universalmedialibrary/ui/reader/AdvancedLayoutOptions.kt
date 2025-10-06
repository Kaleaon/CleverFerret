package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import kotlin.math.roundToInt

/**
 * Advanced Layout Options
 * - Column layout (single, double, triple column)
 * - Scroll modes (vertical scroll, horizontal paging, continuous)
 * - Page margins (top, bottom, left, right)
 * - Text justification (left, right, center, justified)
 * - Hyphenation controls
 */

enum class ColumnMode {
    SINGLE,
    DOUBLE,
    TRIPLE,
    AUTO  // Adapts based on screen size
}

enum class ScrollMode {
    VERTICAL_SCROLL,
    HORIZONTAL_PAGING,
    VERTICAL_PAGING,
    CONTINUOUS_SCROLL
}

enum class TextJustification {
    LEFT,
    RIGHT,
    CENTER,
    JUSTIFIED
}

data class LayoutSettings(
    val columnMode: ColumnMode = ColumnMode.SINGLE,
    val scrollMode: ScrollMode = ScrollMode.VERTICAL_SCROLL,
    val textJustification: TextJustification = TextJustification.LEFT,
    val marginTop: Int = 16,          // in dp
    val marginBottom: Int = 16,
    val marginLeft: Int = 16,
    val marginRight: Int = 16,
    val columnGap: Int = 24,          // gap between columns in dp
    val hyphenationEnabled: Boolean = true,
    val hyphenationFrequency: Int = 2, // 0 = none, 1 = minimal, 2 = normal, 3 = full
    val widowOrphanControl: Boolean = true,
    val firstLineIndent: Int = 0,     // in dp
    val textIndent: Int = 0,          // hanging indent in dp
    val maxWidth: Int = 800           // max content width in dp (0 = unlimited)
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AdvancedLayoutPanel(
    layoutSettings: LayoutSettings,
    onSettingsChanged: (LayoutSettings) -> Unit,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    var settings by remember(layoutSettings) { mutableStateOf(layoutSettings) }

    Surface(
        modifier = modifier.fillMaxSize(),
        color = MaterialTheme.colorScheme.surface
    ) {
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Top bar
            TopAppBar(
                title = { Text("Advanced Layout") },
                navigationIcon = {
                    IconButton(onClick = {
                        onSettingsChanged(settings)
                        onDismiss()
                    }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    TextButton(onClick = {
                        settings = LayoutSettings()
                        onSettingsChanged(settings)
                    }) {
                        Text("Reset")
                    }
                }
            )

            // Scrollable content
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .verticalScroll(rememberScrollState())
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(24.dp)
            ) {
                // Column mode
                ColumnModeControl(
                    columnMode = settings.columnMode,
                    onModeChange = { settings = settings.copy(columnMode = it) }
                )

                // Scroll mode
                ScrollModeControl(
                    scrollMode = settings.scrollMode,
                    onModeChange = { settings = settings.copy(scrollMode = it) }
                )

                // Text justification
                TextJustificationControl(
                    justification = settings.textJustification,
                    onJustificationChange = { settings = settings.copy(textJustification = it) }
                )

                // Margins
                MarginsControl(
                    settings = settings,
                    onSettingsChange = { settings = it }
                )

                // Column gap
                if (settings.columnMode != ColumnMode.SINGLE) {
                    ColumnGapControl(
                        columnGap = settings.columnGap,
                        onGapChange = { settings = settings.copy(columnGap = it) }
                    )
                }

                // Hyphenation
                HyphenationControl(
                    enabled = settings.hyphenationEnabled,
                    frequency = settings.hyphenationFrequency,
                    onEnabledChange = { settings = settings.copy(hyphenationEnabled = it) },
                    onFrequencyChange = { settings = settings.copy(hyphenationFrequency = it) }
                )

                // Advanced typography
                AdvancedTypographyControl(
                    settings = settings,
                    onSettingsChange = { settings = it }
                )

                // Max width
                MaxWidthControl(
                    maxWidth = settings.maxWidth,
                    onWidthChange = { settings = settings.copy(maxWidth = it) }
                )

                Spacer(modifier = Modifier.height(32.dp))
            }
        }
    }
}

@Composable
private fun ColumnModeControl(
    columnMode: ColumnMode,
    onModeChange: (ColumnMode) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
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
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    imageVector = Icons.Default.ViewColumn,
                    contentDescription = null,
                    modifier = Modifier.size(20.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Column Layout",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                ColumnMode.values().forEach { mode ->
                    FilterChip(
                        selected = columnMode == mode,
                        onClick = { onModeChange(mode) },
                        label = {
                            Text(
                                when (mode) {
                                    ColumnMode.SINGLE -> "Single"
                                    ColumnMode.DOUBLE -> "Double"
                                    ColumnMode.TRIPLE -> "Triple"
                                    ColumnMode.AUTO -> "Auto"
                                },
                                style = MaterialTheme.typography.bodySmall
                            )
                        },
                        modifier = Modifier.weight(1f)
                    )
                }
            }
        }
    }
}

@Composable
private fun ScrollModeControl(
    scrollMode: ScrollMode,
    onModeChange: (ScrollMode) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
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
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    imageVector = Icons.Default.SwipeVertical,
                    contentDescription = null,
                    modifier = Modifier.size(20.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Scroll Mode",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
            }

            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                ScrollMode.values().forEach { mode ->
                    FilterChip(
                        selected = scrollMode == mode,
                        onClick = { onModeChange(mode) },
                        label = {
                            Text(
                                when (mode) {
                                    ScrollMode.VERTICAL_SCROLL -> "Vertical Scroll"
                                    ScrollMode.HORIZONTAL_PAGING -> "Horizontal Paging"
                                    ScrollMode.VERTICAL_PAGING -> "Vertical Paging"
                                    ScrollMode.CONTINUOUS_SCROLL -> "Continuous Scroll"
                                }
                            )
                        },
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }
        }
    }
}

@Composable
private fun TextJustificationControl(
    justification: TextJustification,
    onJustificationChange: (TextJustification) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
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
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    imageVector = Icons.Default.FormatAlignLeft,
                    contentDescription = null,
                    modifier = Modifier.size(20.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Text Alignment",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                TextJustification.values().forEach { align ->
                    FilterChip(
                        selected = justification == align,
                        onClick = { onJustificationChange(align) },
                        label = {
                            Icon(
                                imageVector = when (align) {
                                    TextJustification.LEFT -> Icons.Default.FormatAlignLeft
                                    TextJustification.RIGHT -> Icons.Default.FormatAlignRight
                                    TextJustification.CENTER -> Icons.Default.FormatAlignCenter
                                    TextJustification.JUSTIFIED -> Icons.Default.FormatAlignJustify
                                },
                                contentDescription = align.name,
                                modifier = Modifier.size(20.dp)
                            )
                        },
                        modifier = Modifier.weight(1f)
                    )
                }
            }
        }
    }
}

@Composable
private fun MarginsControl(
    settings: LayoutSettings,
    onSettingsChange: (LayoutSettings) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
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
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    imageVector = Icons.Default.BorderOuter,
                    contentDescription = null,
                    modifier = Modifier.size(20.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Page Margins",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
            }

            // Top margin
            Column {
                Text(
                    text = "Top: ${settings.marginTop}dp",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = settings.marginTop.toFloat(),
                    onValueChange = { onSettingsChange(settings.copy(marginTop = it.roundToInt())) },
                    valueRange = 0f..64f,
                    steps = 63
                )
            }

            // Bottom margin
            Column {
                Text(
                    text = "Bottom: ${settings.marginBottom}dp",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = settings.marginBottom.toFloat(),
                    onValueChange = { onSettingsChange(settings.copy(marginBottom = it.roundToInt())) },
                    valueRange = 0f..64f,
                    steps = 63
                )
            }

            // Left margin
            Column {
                Text(
                    text = "Left: ${settings.marginLeft}dp",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = settings.marginLeft.toFloat(),
                    onValueChange = { onSettingsChange(settings.copy(marginLeft = it.roundToInt())) },
                    valueRange = 0f..64f,
                    steps = 63
                )
            }

            // Right margin
            Column {
                Text(
                    text = "Right: ${settings.marginRight}dp",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = settings.marginRight.toFloat(),
                    onValueChange = { onSettingsChange(settings.copy(marginRight = it.roundToInt())) },
                    valueRange = 0f..64f,
                    steps = 63
                )
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = {
                        onSettingsChange(
                            settings.copy(
                                marginTop = 16,
                                marginBottom = 16,
                                marginLeft = 16,
                                marginRight = 16
                            )
                        )
                    },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Balanced")
                }
                Button(
                    onClick = {
                        onSettingsChange(
                            settings.copy(
                                marginTop = 8,
                                marginBottom = 8,
                                marginLeft = 8,
                                marginRight = 8
                            )
                        )
                    },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Compact")
                }
                Button(
                    onClick = {
                        onSettingsChange(
                            settings.copy(
                                marginTop = 32,
                                marginBottom = 32,
                                marginLeft = 32,
                                marginRight = 32
                            )
                        )
                    },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Spacious")
                }
            }
        }
    }
}

@Composable
private fun ColumnGapControl(
    columnGap: Int,
    onGapChange: (Int) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
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
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.ViewWeek,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "Column Gap",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                }
                Text(
                    text = "${columnGap}dp",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }

            Slider(
                value = columnGap.toFloat(),
                onValueChange = { onGapChange(it.roundToInt()) },
                valueRange = 8f..64f,
                steps = 55
            )
        }
    }
}

@Composable
private fun HyphenationControl(
    enabled: Boolean,
    frequency: Int,
    onEnabledChange: (Boolean) -> Unit,
    onFrequencyChange: (Int) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
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
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.TextFields,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "Hyphenation",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                }
                Switch(
                    checked = enabled,
                    onCheckedChange = onEnabledChange
                )
            }

            if (enabled) {
                Text(
                    text = "Frequency: ${
                        when (frequency) {
                            0 -> "None"
                            1 -> "Minimal"
                            2 -> "Normal"
                            3 -> "Full"
                            else -> "Normal"
                        }
                    }",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = frequency.toFloat(),
                    onValueChange = { onFrequencyChange(it.roundToInt()) },
                    valueRange = 0f..3f,
                    steps = 2
                )
            }
        }
    }
}

@Composable
private fun AdvancedTypographyControl(
    settings: LayoutSettings,
    onSettingsChange: (LayoutSettings) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
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
                text = "Advanced Typography",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            // Widow/Orphan control
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Widow/Orphan Control",
                    style = MaterialTheme.typography.bodyMedium
                )
                Switch(
                    checked = settings.widowOrphanControl,
                    onCheckedChange = { onSettingsChange(settings.copy(widowOrphanControl = it)) }
                )
            }

            // First line indent
            Column {
                Text(
                    text = "First Line Indent: ${settings.firstLineIndent}dp",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = settings.firstLineIndent.toFloat(),
                    onValueChange = { onSettingsChange(settings.copy(firstLineIndent = it.roundToInt())) },
                    valueRange = 0f..48f,
                    steps = 47
                )
            }

            // Text indent (hanging)
            Column {
                Text(
                    text = "Hanging Indent: ${settings.textIndent}dp",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = settings.textIndent.toFloat(),
                    onValueChange = { onSettingsChange(settings.copy(textIndent = it.roundToInt())) },
                    valueRange = 0f..48f,
                    steps = 47
                )
            }
        }
    }
}

@Composable
private fun MaxWidthControl(
    maxWidth: Int,
    onWidthChange: (Int) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
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
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.Width,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = "Max Content Width",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                }
                Text(
                    text = if (maxWidth == 0) "Unlimited" else "${maxWidth}dp",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }

            Slider(
                value = maxWidth.toFloat(),
                onValueChange = { onWidthChange(it.roundToInt()) },
                valueRange = 0f..1200f,
                steps = 119
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = { onWidthChange(0) },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Unlimited")
                }
                Button(
                    onClick = { onWidthChange(600) },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Phone")
                }
                Button(
                    onClick = { onWidthChange(800) },
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Tablet")
                }
            }
        }
    }
}