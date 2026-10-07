package com.universalmedialibrary.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.components.*
import com.universalmedialibrary.ui.theme.*

/**
 * Showcase screen demonstrating all advanced visual effects
 * This screen helps visualize and test all the new effect modifiers
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AdvancedEffectsShowcaseScreen() {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Advanced Effects Showcase") }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Section: Metallic Effects
            item {
                SectionHeader("Metallic Effects")
            }
            
            item {
                val metallic = metallicColors()
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .metallicGradient(metallic, angle = 135f)
                        .then(
                            if (metallicShimmerEnabled()) {
                                Modifier.metallicShimmer(
                                    enabled = true,
                                    baseColor = metallic.base,
                                    highlightColor = metallic.shimmer ?: metallic.highlight,
                                    speed = 3000
                                )
                            } else {
                                Modifier
                            }
                        )
                        .depthShadow(elevation = 4.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = androidx.compose.ui.graphics.Color.Transparent
                    )
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            "Metallic Card with Shimmer",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "This card uses metallic gradients with animated shimmer effect. " +
                            "The shimmer moves across the surface creating a polished metal appearance.",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }
            
            // Section: Glass Effects
            item {
                SectionHeader("Glass & Blur Effects")
            }
            
            item {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .glassEffect(
                            backgroundColor = MaterialTheme.colorScheme.surface,
                            alpha = 0.7f,
                            borderColor = MaterialTheme.colorScheme.outline.copy(alpha = 0.3f)
                        )
                        .then(
                            if (geometricPatternsEnabled()) {
                                Modifier.geometricPattern(
                                    patternColor = MaterialTheme.colorScheme.onSurface,
                                    patternType = PatternType.SUBTLE_GRID,
                                    alpha = 0.03f
                                )
                            } else {
                                Modifier
                            }
                        ),
                    colors = CardDefaults.cardColors(
                        containerColor = androidx.compose.ui.graphics.Color.Transparent
                    ),
                    border = androidx.compose.foundation.BorderStroke(
                        width = 1.dp,
                        color = MaterialTheme.colorScheme.outline.copy(alpha = 0.3f)
                    )
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            "Glass Card with Patterns",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "Frosted glass effect with subtle geometric patterns. " +
                            "Creates a modern, translucent appearance.",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }
            
            // Section: Glow Effects
            item {
                SectionHeader("Crystal Glow Effects")
            }
            
            item {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .then(
                            if (crystalGlowEnabled()) {
                                Modifier.crystalGlow(
                                    enabled = true,
                                    glowColor = MaterialTheme.colorScheme.primary,
                                    intensity = 0.2f,
                                    pulseSpeed = 3000
                                )
                            } else {
                                Modifier
                            }
                        )
                        .depthShadow(elevation = 4.dp),
                    elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            "Glowing Card",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "Pulsing luminescent glow effect inspired by crystal technology. " +
                            "The glow intensity animates smoothly.",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }
            
            // Section: Depth & Elevation
            item {
                SectionHeader("Depth & Elevation")
            }
            
            item {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .advancedLighting(
                            ambientColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.05f),
                            spotlightColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.15f)
                        ),
                    elevation = CardDefaults.cardElevation(defaultElevation = 6.dp)
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            "Elevated Card with Dynamic Lighting",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "Multi-layered shadows create depth. Dynamic lighting adds ambient " +
                            "and spotlight effects that respond to interactions.",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }
            
            // Section: Embossed Effects
            item {
                SectionHeader("Carved & Embossed")
            }
            
            item {
                val metallic = metallicColors()
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .embossedEffect(
                            lightColor = metallic.highlight.copy(alpha = 0.4f),
                            shadowColor = metallic.shadow.copy(alpha = 0.4f),
                            depth = 2.dp
                        ),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            "Embossed Card",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "Carved appearance with light and shadow highlights. " +
                            "Creates the illusion of depth engraved into the surface.",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }
            
            // Section: Patterns
            item {
                SectionHeader("Geometric Patterns")
            }
            
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Card(
                        modifier = Modifier
                            .weight(1f)
                            .then(
                                if (geometricPatternsEnabled()) {
                                    Modifier.geometricPattern(
                                        patternColor = MaterialTheme.colorScheme.onSurface,
                                        patternType = PatternType.SUBTLE_GRID,
                                        alpha = 0.05f
                                    )
                                } else Modifier
                            )
                            .depthShadow(elevation = 4.dp)
                    ) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Text(
                                "Grid",
                                style = MaterialTheme.typography.labelLarge,
                                fontWeight = FontWeight.Bold
                            )
                        }
                    }
                    
                    Card(
                        modifier = Modifier
                            .weight(1f)
                            .then(
                                if (geometricPatternsEnabled()) {
                                    Modifier.geometricPattern(
                                        patternColor = MaterialTheme.colorScheme.onSurface,
                                        patternType = PatternType.DIAGONAL_LINES,
                                        alpha = 0.05f
                                    )
                                } else Modifier
                            )
                            .depthShadow(elevation = 4.dp)
                    ) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Text(
                                "Diagonal",
                                style = MaterialTheme.typography.labelLarge,
                                fontWeight = FontWeight.Bold
                            )
                        }
                    }
                }
            }
            
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Card(
                        modifier = Modifier
                            .weight(1f)
                            .then(
                                if (geometricPatternsEnabled()) {
                                    Modifier.geometricPattern(
                                        patternColor = MaterialTheme.colorScheme.onSurface,
                                        patternType = PatternType.DOTS,
                                        alpha = 0.05f
                                    )
                                } else Modifier
                            )
                            .depthShadow(elevation = 4.dp)
                    ) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Text(
                                "Dots",
                                style = MaterialTheme.typography.labelLarge,
                                fontWeight = FontWeight.Bold
                            )
                        }
                    }
                    
                    Card(
                        modifier = Modifier
                            .weight(1f)
                            .then(
                                if (geometricPatternsEnabled()) {
                                    Modifier.geometricPattern(
                                        patternColor = MaterialTheme.colorScheme.onSurface,
                                        patternType = PatternType.HEXAGONS,
                                        alpha = 0.05f
                                    )
                                } else Modifier
                            )
                            .depthShadow(elevation = 4.dp)
                    ) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Text(
                                "Hexagons",
                                style = MaterialTheme.typography.labelLarge,
                                fontWeight = FontWeight.Bold
                            )
                        }
                    }
                }
            }
            
            // Section: Gradient Overlays
            item {
                SectionHeader("Gradient Overlays")
            }
            
            item {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .gradientOverlay(
                            gradient = listOf(
                                MaterialTheme.colorScheme.primary,
                                MaterialTheme.colorScheme.secondary,
                                MaterialTheme.colorScheme.tertiary
                            ),
                            angle = 135f,
                            alpha = 0.15f
                        )
                        .depthShadow(elevation = 4.dp),
                    elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            "Gradient Overlay Card",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "Multi-color gradient overlay with customizable blend modes. " +
                            "Creates rich, colorful visual effects.",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }
            
            // Section: Buttons
            item {
                SectionHeader("Enhanced Buttons")
            }
            
            item {
                Column(
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    AdvancedMetallicButton(
                        onClick = {},
                        icon = Icons.Default.Star,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("Metallic Button with Shimmer")
                    }
                    
                    ElevatedActionButton(
                        onClick = {},
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Icon(Icons.Default.PlayArrow, contentDescription = "Play")
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Elevated Action Button")
                    }
                    
                    GradientButton(
                        onClick = {},
                        icon = Icons.Default.Favorite,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("Gradient Button")
                    }
                    
                    EmbossedOutlinedButton(
                        onClick = {},
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Icon(Icons.Default.Settings, contentDescription = "Settings")
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Embossed Outlined Button")
                    }
                    
                    GlassButton(
                        onClick = {},
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Icon(Icons.Default.Info, contentDescription = "Info")
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Glass Button")
                    }
                }
            }
            
            // Section: FAB
            item {
                SectionHeader("Floating Action Buttons")
            }
            
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    GlowingFab(
                        onClick = {},
                        icon = Icons.Default.Add
                    )
                    
                    GlowingFab(
                        onClick = {},
                        icon = Icons.Default.Edit,
                        pulseGlow = false
                    )
                }
            }
            
            // Info section
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            "Theme-Aware Effects",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            "All effects automatically adapt to the selected theme. " +
                            "Metallic themes show shimmer, Ancient Architect themes include " +
                            "geometric patterns, and all themes can use glow, depth, and lighting effects.",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun SectionHeader(text: String) {
    Text(
        text = text,
        style = MaterialTheme.typography.headlineSmall,
        fontWeight = FontWeight.Bold,
        color = MaterialTheme.colorScheme.primary,
        modifier = Modifier.padding(vertical = 8.dp)
    )
}
