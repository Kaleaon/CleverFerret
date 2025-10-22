package com.universalmedialibrary.ui.components

import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.theme.*

/**
 * Ancient Architect Card - Enhanced card with geometric patterns and metallic accents
 * 
 * Features:
 * - Stepped/beveled borders (Art Deco)
 * - Metallic gradient borders
 * - Corner decorations (Dwarven)
 * - Optional background pattern
 * - Optional shimmer effect
 * - Crystal glow on interaction
 */
@Composable
fun AncientArchitectCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    enabled: Boolean = true,
    shape: androidx.compose.ui.graphics.Shape = AncientArchitectShapes.steppedMedium,
    colors: CardColors = CardDefaults.cardColors(),
    elevation: CardElevation = CardDefaults.cardElevation(),
    border: Dp = 2.dp,
    showPattern: Boolean = true,
    showCornerDecorations: Boolean = true,
    enableShimmer: Boolean = false,
    content: @Composable ColumnScope.() -> Unit
) {
    val ancientColors = ancientArchitectColors()
    val shimmerEnabled = metallicShimmerEnabled() && enableShimmer
    
    // Shimmer animation
    val infiniteTransition = rememberInfiniteTransition(label = "shimmer")
    val shimmerOffset by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 1000f,
        animationSpec = infiniteRepeatable(
            animation = tween(3000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "shimmerOffset"
    )
    
    Card(
        onClick = onClick ?: {},
        modifier = modifier
            .drawBehind {
                // Background pattern
                if (showPattern && geometricPatternsEnabled()) {
                    with(AncientArchitectPatterns) {
                        drawDiamondGrid(
                            color = ancientColors.stone.text,
                            alpha = 0.03f,
                            cellSize = 40f
                        )
                    }
                }
                
                // Corner decorations
                if (showCornerDecorations && geometricPatternsEnabled()) {
                    with(AncientArchitectPatterns) {
                        drawCornerDecorations(
                            color = ancientColors.metal.primary,
                            alpha = 0.6f,
                            size = 16f
                        )
                    }
                }
            }
            .border(
                width = border,
                brush = if (shimmerEnabled) {
                    Brush.linearGradient(
                        colors = listOf(
                            ancientColors.metal.primaryLight,
                            ancientColors.metal.primary,
                            ancientColors.metal.primaryDark,
                            ancientColors.metal.primary,
                            ancientColors.metal.primaryLight
                        ),
                        start = Offset(shimmerOffset, shimmerOffset),
                        end = Offset(shimmerOffset + 500f, shimmerOffset + 500f)
                    )
                } else {
                    Brush.linearGradient(
                        colors = listOf(
                            ancientColors.metal.primaryLight,
                            ancientColors.metal.primary,
                            ancientColors.metal.primaryDark
                        )
                    )
                },
                shape = shape
            ),
        enabled = enabled,
        shape = shape,
        colors = colors,
        elevation = elevation,
        content = content
    )
}

/**
 * Ancient Architect Elevated Card - Card with enhanced elevation and glow
 */
@Composable
fun AncientArchitectElevatedCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    enabled: Boolean = true,
    showGlow: Boolean = true,
    content: @Composable ColumnScope.() -> Unit
) {
    val ancientColors = ancientArchitectColors()
    val glowEnabled = crystalGlowEnabled() && showGlow
    
    Box(
        modifier = modifier
            .then(
                if (glowEnabled) {
                    Modifier.drawBehind {
                        // Crystal glow effect
                        drawCircle(
                            brush = Brush.radialGradient(
                                colors = listOf(
                                    ancientColors.crystal.primary.copy(alpha = 0.3f),
                                    ancientColors.crystal.primary.copy(alpha = 0.1f),
                                    Color.Transparent
                                ),
                                radius = size.maxDimension * 0.8f
                            )
                        )
                    }
                } else Modifier
            )
    ) {
        AncientArchitectCard(
            onClick = onClick,
            enabled = enabled,
            shape = AncientArchitectShapes.steppedLarge,
            elevation = CardDefaults.elevatedCardElevation(
                defaultElevation = 8.dp,
                pressedElevation = 4.dp,
                focusedElevation = 8.dp,
                hoveredElevation = 12.dp
            ),
            border = 3.dp,
            showPattern = true,
            showCornerDecorations = true,
            enableShimmer = true,
            content = content
        )
    }
}

/**
 * Ancient Architect Outlined Card - Card with prominent border
 */
@Composable
fun AncientArchitectOutlinedCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    enabled: Boolean = true,
    content: @Composable ColumnScope.() -> Unit
) {
    AncientArchitectCard(
        modifier = modifier,
        onClick = onClick,
        enabled = enabled,
        shape = AncientArchitectShapes.beveledMedium,
        colors = CardDefaults.outlinedCardColors(),
        elevation = CardDefaults.outlinedCardElevation(),
        border = 2.dp,
        showPattern = false,
        showCornerDecorations = true,
        enableShimmer = false,
        content = content
    )
}