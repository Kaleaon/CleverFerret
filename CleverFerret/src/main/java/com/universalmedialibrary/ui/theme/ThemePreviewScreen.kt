package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Theme Preview Screen
 * Showcases all available themes and metallic effects
 * Useful for testing and theme selection
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ThemePreviewScreen() {
    var selectedPalette by remember { mutableStateOf(ThemePalette.NAVY_GOLD) }
    var showPaletteSelector by remember { mutableStateOf(false) }

    CleverFerretTheme(palette = selectedPalette) {
        Scaffold(
            topBar = {
                MetallicTopAppBar(
                    title = {
                        Text(
                            "Theme Preview",
                            fontWeight = FontWeight.Bold
                        )
                    },
                    actions = {
                        IconButton(onClick = { showPaletteSelector = true }) {
                            Icon(Icons.Default.Palette, "Change Theme")
                        }
                    }
                )
            },
            floatingActionButton = {
                MetallicFAB(
                    onClick = { /* Action */ },
                    icon = { Icon(Icons.Default.Add, "Add") }
                )
            }
        ) { padding ->
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Current theme info
                item {
                    MetallicAccentBox {
                        Column {
                            MetallicText(
                                text = "Current Theme",
                                style = MaterialTheme.typography.titleLarge
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            Text(
                                text = selectedPalette.name.replace("_", " "),
                                style = MaterialTheme.typography.bodyLarge,
                                color = MaterialTheme.colorScheme.onSurface
                            )
                        }
                    }
                }

                // Buttons showcase
                item {
                    Text(
                        "Buttons",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                }

                item {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        MetallicButton(
                            text = "Primary",
                            onClick = { },
                            modifier = Modifier.weight(1f)
                        )
                        MetallicButton(
                            text = "Secondary",
                            onClick = { },
                            modifier = Modifier.weight(1f)
                        )
                    }
                }

                // Cards showcase
                item {
                    MetallicDivider()
                }

                item {
                    Text(
                        "Cards",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                }

                item {
                    MetallicCard {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    "Metallic Card",
                                    style = MaterialTheme.typography.titleMedium,
                                    fontWeight = FontWeight.Medium
                                )
                                Spacer(modifier = Modifier.height(4.dp))
                                Text(
                                    "Beautiful gradient effects with shadows",
                                    style = MaterialTheme.typography.bodyMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            MetallicBadge("NEW")
                        }
                    }
                }

                // Stats showcase
                item {
                    MetallicDivider()
                }

                item {
                    Text(
                        "Statistics",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                }

                item {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly
                    ) {
                        MetallicStatsCard(value = "1.2K", label = "Books")
                        MetallicStatsCard(value = "48", label = "Podcasts")
                        MetallicStatsCard(value = "256", label = "Episodes")
                    }
                }

                // Progress showcase
                item {
                    MetallicDivider()
                }

                item {
                    Text(
                        "Progress Indicators",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                }

                item {
                    Column(
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        MetallicProgressBar(progress = 0.3f)
                        MetallicProgressBar(progress = 0.6f)
                        MetallicProgressBar(progress = 0.9f)
                    }
                }

                // Icon buttons showcase
                item {
                    MetallicDivider()
                }

                item {
                    Text(
                        "Icon Buttons",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                }

                item {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly
                    ) {
                        MetallicIconButton(
                            onClick = { },
                            icon = { Icon(Icons.Default.Favorite, "Favorite") }
                        )
                        MetallicIconButton(
                            onClick = { },
                            icon = { Icon(Icons.Default.Download, "Download") }
                        )
                        MetallicIconButton(
                            onClick = { },
                            icon = { Icon(Icons.Default.Share, "Share") }
                        )
                        MetallicIconButton(
                            onClick = { },
                            icon = { Icon(Icons.Default.PlayArrow, "Play") }
                        )
                    }
                }

                // Color palette info
                item {
                    MetallicDivider()
                }

                item {
                    Text(
                        "Theme Information",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                }

                item {
                    Card(
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.surfaceVariant
                        )
                    ) {
                        Column(
                            modifier = Modifier.padding(16.dp),
                            verticalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            ColorInfoRow("Primary", MaterialTheme.colorScheme.primary)
                            ColorInfoRow("Secondary", MaterialTheme.colorScheme.secondary)
                            ColorInfoRow("Tertiary", MaterialTheme.colorScheme.tertiary)
                            ColorInfoRow("Background", MaterialTheme.colorScheme.background)
                            ColorInfoRow("Surface", MaterialTheme.colorScheme.surface)
                        }
                    }
                }
            }
        }

        // Palette selector dialog
        if (showPaletteSelector) {
            PaletteSelectorDialog(
                currentPalette = selectedPalette,
                onDismiss = { showPaletteSelector = false },
                onSelect = { palette ->
                    selectedPalette = palette
                    showPaletteSelector = false
                }
            )
        }
    }
}

@Composable
private fun ColorInfoRow(name: String, color: androidx.compose.ui.graphics.Color) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = name,
            style = MaterialTheme.typography.bodyMedium,
            fontWeight = FontWeight.Medium
        )
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Surface(
                modifier = Modifier.size(32.dp),
                color = color,
                shape = MaterialTheme.shapes.small
            ) {}
            Text(
                text = "#${color.value.toString(16).uppercase().takeLast(6)}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun PaletteSelectorDialog(
    currentPalette: ThemePalette,
    onDismiss: () -> Unit,
    onSelect: (ThemePalette) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Select Theme") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                ThemePalette.values().forEach { palette ->
                    Card(
                        onClick = { onSelect(palette) },
                        colors = CardDefaults.cardColors(
                            containerColor = if (palette == currentPalette)
                                MaterialTheme.colorScheme.primaryContainer
                            else
                                MaterialTheme.colorScheme.surface
                        )
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Column {
                                Text(
                                    text = palette.name.replace("_", " "),
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = getThemeDescription(palette),
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            if (palette == currentPalette) {
                                Icon(
                                    Icons.Default.Check,
                                    "Selected",
                                    tint = MaterialTheme.colorScheme.primary
                                )
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}

private fun getThemeDescription(palette: ThemePalette): String = when (palette) {
    ThemePalette.NAVY_GOLD -> "Navy + Metallic Gold • Elegant"
    ThemePalette.ROYAL_SILVER -> "Royal Purple + Silver • Regal"
    ThemePalette.FOREST_COPPER -> "Forest Green + Copper • Natural"
    ThemePalette.BURGUNDY_ROSE_GOLD -> "Burgundy + Rose Gold • Luxurious"
    ThemePalette.CHARCOAL_CHAMPAGNE -> "Charcoal + Champagne • Sophisticated"
    ThemePalette.SLATE_GUNMETAL -> "Slate + Gunmetal • Modern"
    ThemePalette.COPPER_BRONZE -> "Copper + Bronze • Warm & Rich"
    ThemePalette.AMBER_GOLD -> "Amber + Gold • Luminous"
    ThemePalette.ROSE_BRASS -> "Rose + Brass • Romantic"
    ThemePalette.STEEL_TITANIUM -> "Steel + Titanium • Industrial"
    ThemePalette.PLATINUM_SILVER -> "Platinum + Silver • Premium"
    ThemePalette.COBALT_CHROME -> "Cobalt + Chrome • Bold"
    ThemePalette.ANCIENT_BRONZE -> "Ancient Bronze • Architectural"
    ThemePalette.SILVER_ARCHITECT -> "Silver Architect • Modern Classic"
    ThemePalette.OBSIDIAN_TECH -> "Obsidian Tech • High-Tech"
}
