package com.universalmedialibrary.ui.components

import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.theme.*

/**
 * Ancient Architect Navigation Rail
 * 
 * Features:
 * - Vertical stone pillar aesthetic
 * - Carved geometric patterns as dividers
 * - Metallic inlay for selected items
 * - Glowing cyan indicator for active item
 * - Icons in hexagonal frames
 * - Subtle shimmer animation on hover
 */
@Composable
fun AncientArchitectNavigationRail(
    modifier: Modifier = Modifier,
    containerColor: Color = Color.Unspecified,
    contentColor: Color = Color.Unspecified,
    header: (@Composable ColumnScope.() -> Unit)? = null,
    content: @Composable ColumnScope.() -> Unit
) {
    val ancientColors = ancientArchitectColors()
    val enablePatterns = geometricPatternsEnabled()
    
    NavigationRail(
        modifier = modifier
            .fillMaxHeight()
            .width(80.dp)
            .drawBehind {
                // Stone texture background
                drawRect(
                    brush = Brush.horizontalGradient(
                        colors = listOf(
                            ancientColors.stone.surface,
                            ancientColors.stone.elevated,
                            ancientColors.stone.surface
                        )
                    )
                )
                
                // Carved patterns
                if (enablePatterns) {
                    with(AncientArchitectPatterns) {
                        // Vertical frieze pattern
                        drawFriezePattern(
                            color = ancientColors.stone.text,
                            alpha = 0.15f,
                            strokeWidth = 1.5f,
                            height = 30f,
                            yPosition = size.height * 0.2f
                        )
                        
                        drawFriezePattern(
                            color = ancientColors.stone.text,
                            alpha = 0.15f,
                            strokeWidth = 1.5f,
                            height = 30f,
                            yPosition = size.height * 0.5f
                        )
                        
                        drawFriezePattern(
                            color = ancientColors.stone.text,
                            alpha = 0.15f,
                            strokeWidth = 1.5f,
                            height = 30f,
                            yPosition = size.height * 0.8f
                        )
                    }
                }
            }
            .border(
                width = 2.dp,
                brush = Brush.verticalGradient(
                    colors = listOf(
                        ancientColors.metal.primaryDark,
                        ancientColors.metal.primary,
                        ancientColors.metal.primaryDark
                    )
                )
            ),
        containerColor = if (containerColor == Color.Unspecified) Color.Transparent else containerColor,
        contentColor = if (contentColor == Color.Unspecified) ancientColors.stone.text else contentColor,
        header = header,
        content = content
    )
}

/**
 * Ancient Architect Navigation Rail Item
 */
@Composable
fun AncientArchitectNavigationRailItem(
    selected: Boolean,
    onClick: () -> Unit,
    icon: @Composable () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    label: (@Composable () -> Unit)? = null,
    alwaysShowLabel: Boolean = true
) {
    val ancientColors = ancientArchitectColors()
    val enableGlow = crystalGlowEnabled()
    
    // Glow animation for selected item
    val infiniteTransition = rememberInfiniteTransition(label = "itemGlow")
    val glowAlpha by infiniteTransition.animateFloat(
        initialValue = 0.4f,
        targetValue = 0.8f,
        animationSpec = infiniteRepeatable(
            animation = tween(2000, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "glowAlpha"
    )
    
    Box(
        modifier = modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp, horizontal = 8.dp)
            .then(
                if (selected && enableGlow) {
                    Modifier.drawBehind {
                        // Crystal glow for selected item
                        drawRect(
                            brush = Brush.radialGradient(
                                colors = listOf(
                                    ancientColors.crystal.primary.copy(alpha = glowAlpha * 0.3f),
                                    Color.Transparent
                                ),
                                center = Offset(size.width / 2f, size.height / 2f),
                                radius = size.maxDimension * 0.8f
                            )
                        )
                    }
                } else Modifier
            )
    ) {
        NavigationRailItem(
            selected = selected,
            onClick = onClick,
            icon = {
                // Icon in hexagonal frame
                Box(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(AncientArchitectShapes.hexagon)
                        .background(
                            if (selected) {
                                Brush.radialGradient(
                                    colors = listOf(
                                        ancientColors.metal.primaryLight,
                                        ancientColors.metal.primary,
                                        ancientColors.metal.primaryDark
                                    )
                                )
                            } else {
                                Brush.radialGradient(
                                    colors = listOf(
                                        ancientColors.stone.elevated,
                                        ancientColors.stone.surface
                                    )
                                )
                            }
                        )
                        .border(
                            width = if (selected) 2.dp else 1.dp,
                            color = if (selected) {
                                ancientColors.crystal.primary
                            } else {
                                ancientColors.stone.border.copy(alpha = 0.5f)
                            },
                            shape = AncientArchitectShapes.hexagon
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    icon()
                }
            },
            enabled = enabled,
            label = label,
            alwaysShowLabel = alwaysShowLabel,
            colors = NavigationRailItemDefaults.colors(
                selectedIconColor = if (selected) Color.Black else ancientColors.stone.text,
                selectedTextColor = ancientColors.crystal.primary,
                unselectedIconColor = ancientColors.stone.text.copy(alpha = 0.7f),
                unselectedTextColor = ancientColors.stone.text.copy(alpha = 0.7f),
                indicatorColor = Color.Transparent
            )
        )
    }
}

/**
 * Convenience composable for creating a complete navigation rail
 */
@Composable
fun AncientArchitectNavigationRailWithItems(
    selectedIndex: Int,
    items: List<NavigationItem>,
    onItemSelected: (Int) -> Unit,
    modifier: Modifier = Modifier,
    header: (@Composable ColumnScope.() -> Unit)? = null
) {
    AncientArchitectNavigationRail(
        modifier = modifier,
        header = header
    ) {
        items.forEachIndexed { index, item ->
            AncientArchitectNavigationRailItem(
                selected = selectedIndex == index,
                onClick = { onItemSelected(index) },
                icon = {
                    Icon(
                        imageVector = item.icon,
                        contentDescription = item.label
                    )
                },
                label = {
                    Text(
                        text = item.label,
                        style = MaterialTheme.typography.labelSmall
                    )
                }
            )
        }
    }
}

/**
 * Data class for navigation items
 */
data class NavigationItem(
    val icon: ImageVector,
    val label: String,
    val badge: String? = null
)