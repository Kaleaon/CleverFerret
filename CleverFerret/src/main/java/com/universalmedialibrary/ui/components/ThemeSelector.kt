package com.universalmedialibrary.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.theme.*

/**
 * Theme Selector Component
 * 
 * Displays all 15 available themes grouped by category with preview colors
 */
@Composable
fun ThemeSelector(
    currentTheme: CleverFerretTheme,
    onThemeSelected: (CleverFerretTheme) -> Unit,
    modifier: Modifier = Modifier,
    showCategories: Boolean = true
) {
    val themesByCategory = if (showCategories) {
        CleverFerretTheme.entries.groupBy { it.getConfig().category }
    } else {
        mapOf(ThemeCategory.CLASSIC to CleverFerretTheme.entries)
    }
    
    LazyColumn(
        modifier = modifier
            .fillMaxWidth()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        themesByCategory.forEach { (category, themes) ->
            if (showCategories) {
                item {
                    Text(
                        text = category.name.replace('_', ' '),
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.padding(vertical = 8.dp)
                    )
                }
            }
            
            items(themes) { theme ->
                ThemeCard(
                    theme = theme,
                    isSelected = theme == currentTheme,
                    onClick = { onThemeSelected(theme) }
                )
            }
        }
    }
}

/**
 * Individual theme card
 */
@Composable
private fun ThemeCard(
    theme: CleverFerretTheme,
    isSelected: Boolean,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val config = theme.getConfig()
    val previewColors = getThemePreviewColors(theme)
    
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .then(
                if (isSelected) {
                    Modifier.border(
                        width = 2.dp,
                        color = MaterialTheme.colorScheme.primary,
                        shape = MaterialTheme.shapes.medium
                    )
                } else Modifier
            ),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.spacedBy(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Color preview
            Box(
                modifier = Modifier
                    .size(60.dp)
                    .clip(MaterialTheme.shapes.small)
                    .background(
                        brush = Brush.linearGradient(
                            colors = previewColors
                        )
                    )
                    .border(
                        width = 1.dp,
                        color = MaterialTheme.colorScheme.outline,
                        shape = MaterialTheme.shapes.small
                    )
            )
            
            // Theme info
            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = config.displayName,
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onSurface
                    )
                    
                    // Feature badges
                    if (config.hasGeometricPatterns) {
                        Icon(
                            imageVector = Icons.Default.Star,
                            contentDescription = "Geometric Patterns",
                            modifier = Modifier.size(16.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }
                
                Text(
                    text = config.description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                // Feature indicators
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.padding(top = 4.dp)
                ) {
                    if (config.hasMetallicShimmer) {
                        FeatureChip("Metallic", Icons.Default.Star)
                    }
                    if (config.hasCrystalGlow) {
                        FeatureChip("Glow", Icons.Default.Star)
                    }
                }
            }
            
            // Selected indicator
            if (isSelected) {
                Icon(
                    imageVector = Icons.Default.CheckCircle,
                    contentDescription = "Selected",
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(32.dp)
                )
            }
        }
    }
}

/**
 * Small feature chip
 */
@Composable
private fun FeatureChip(
    label: String,
    icon: ImageVector,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier,
        shape = MaterialTheme.shapes.extraSmall,
        color = MaterialTheme.colorScheme.primaryContainer
    ) {
        Row(
            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
            horizontalArrangement = Arrangement.spacedBy(4.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.size(12.dp),
                tint = MaterialTheme.colorScheme.onPrimaryContainer
            )
            Text(
                text = label,
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onPrimaryContainer
            )
        }
    }
}

/**
 * Get preview colors for a theme
 */
private fun getThemePreviewColors(theme: CleverFerretTheme): List<Color> {
    return when (theme) {
        CleverFerretTheme.NAVY_GOLD -> listOf(
            Color(0xFF0A1630),
            Color(0xFFD4AF37),
            Color(0xFFFFD700)
        )
        CleverFerretTheme.EMERALD_SILVER -> listOf(
            Color(0xFF0A1F14),
            Color(0xFFC0C0C0),
            Color(0xFFE0E0E0)
        )
        CleverFerretTheme.ROYAL_BRONZE -> listOf(
            Color(0xFF1A0A30),
            Color(0xFFCD7F32),
            Color(0xFFD99952)
        )
        CleverFerretTheme.MIDNIGHT_AMBER -> listOf(
            Color(0xFF0C1824),
            Color(0xFFFFBF00),
            Color(0xFFFFD700)
        )
        CleverFerretTheme.OBSIDIAN_CRIMSON -> listOf(
            Color(0xFF0A0A0A),
            Color(0xFFDC143C),
            Color(0xFFE5395F)
        )
        CleverFerretTheme.SLATE_CYAN -> listOf(
            Color(0xFF1A1F24),
            Color(0xFF00D9FF),
            Color(0xFF4DE2FF)
        )
        CleverFerretTheme.ROYAL_SILVER -> listOf(
            Color(0xFF1A1535),
            Color(0xFFC0C0C0),
            Color(0xFFE0E0E0)
        )
        CleverFerretTheme.FOREST_COPPER -> listOf(
            Color(0xFF0D1F0D),
            Color(0xFFB87333),
            Color(0xFFD4965A)
        )
        CleverFerretTheme.BURGUNDY_ROSE_GOLD -> listOf(
            Color(0xFF2D0F1A),
            Color(0xFFB76E79),
            Color(0xFFD4969E)
        )
        CleverFerretTheme.CHARCOAL_CHAMPAGNE -> listOf(
            Color(0xFF1F1F1F),
            Color(0xFFF7E7CE),
            Color(0xFFFFF5E6)
        )
        CleverFerretTheme.SLATE_GUNMETAL -> listOf(
            Color(0xFF1A2029),
            Color(0xFF8F9CA8),
            Color(0xFFB0BDC9)
        )
        CleverFerretTheme.DEEP_PURPLE_PLATINUM -> listOf(
            Color(0xFF1A0F2E),
            Color(0xFFE5E4E2),
            Color(0xFFF5F4F2)
        )
        CleverFerretTheme.PAPER_INK -> listOf(
            Color(0xFF2C2C2C),
            Color(0xFFF0F0EB),
            Color(0xFFFAF9F6)
        )
        CleverFerretTheme.COPPER_BRONZE -> listOf(
            Color(0xFF1A1510),
            Color(0xFFB87333),
            Color(0xFFCD7F32)
        )
        CleverFerretTheme.AMBER_GOLD -> listOf(
            Color(0xFF1F1A0A),
            Color(0xFFFFBF00),
            Color(0xFFD4AF37)
        )
        CleverFerretTheme.ROSE_BRASS -> listOf(
            Color(0xFF2D1820),
            Color(0xFFB76E79),
            Color(0xFFB5A642)
        )
        CleverFerretTheme.STEEL_TITANIUM -> listOf(
            Color(0xFF1A1C1F),
            Color(0xFF8F9CA8),
            Color(0xFFC0C0C0)
        )
        CleverFerretTheme.PLATINUM_SILVER -> listOf(
            Color(0xFF1A1C1E),
            Color(0xFFE5E4E2),
            Color(0xFFC0C0C0)
        )
        CleverFerretTheme.COBALT_CHROME -> listOf(
            Color(0xFF0A1824),
            Color(0xFF0047AB),
            Color(0xFFB0BDC9)
        )
        CleverFerretTheme.ANCIENT_BRONZE -> listOf(
            Color(0xFF1A1D23),
            Color(0xFFCD7F32),
            Color(0xFF00CED1)
        )
        CleverFerretTheme.SILVER_ARCHITECT -> listOf(
            Color(0xFF1A1C20),
            Color(0xFFC0C0C0),
            Color(0xFF4DA6FF)
        )
        CleverFerretTheme.OBSIDIAN_TECH -> listOf(
            Color(0xFF0D0F14),
            Color(0xFF4A4A4A),
            Color(0xFF9D4EDD)
        )
    }
}

/**
 * Compact theme selector for settings
 */
@Composable
fun CompactThemeSelector(
    currentTheme: CleverFerretTheme,
    onThemeSelected: (CleverFerretTheme) -> Unit,
    modifier: Modifier = Modifier
) {
    var expanded by remember { mutableStateOf(false) }
    
    ExposedDropdownMenuBox(
        expanded = expanded,
        onExpandedChange = { expanded = it },
        modifier = modifier
    ) {
        OutlinedTextField(
            value = currentTheme.getConfig().displayName,
            onValueChange = {},
            readOnly = true,
            label = { Text("Theme") },
            trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded) },
            modifier = Modifier
                .menuAnchor()
                .fillMaxWidth()
        )
        
        ExposedDropdownMenu(
            expanded = expanded,
            onDismissRequest = { expanded = false }
        ) {
            CleverFerretTheme.entries.forEach { theme ->
                DropdownMenuItem(
                    text = {
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(12.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            // Color preview
                            Box(
                                modifier = Modifier
                                    .size(24.dp)
                                    .clip(MaterialTheme.shapes.extraSmall)
                                    .background(
                                        brush = Brush.linearGradient(
                                            colors = getThemePreviewColors(theme)
                                        )
                                    )
                            )
                            
                            Text(theme.getConfig().displayName)
                        }
                    },
                    onClick = {
                        onThemeSelected(theme)
                        expanded = false
                    },
                    leadingIcon = if (theme == currentTheme) {
                        { Icon(Icons.Default.Check, contentDescription = "Confirm") }
                    } else null
                )
            }
        }
    }
}
