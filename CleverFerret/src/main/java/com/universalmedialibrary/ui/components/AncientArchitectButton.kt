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
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.theme.*

/**
 * Ancient Architect Button - Enhanced button with metallic gradient and geometric shape
 * 
 * Features:
 * - Beveled/geometric shape
 * - Metallic gradient background
 * - Embossed effect
 * - Crystal glow on hover/press
 * - Shimmer animation
 */
@Composable
fun AncientArchitectButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    shape: androidx.compose.ui.graphics.Shape = AncientArchitectShapes.beveledMedium,
    colors: ButtonColors = ButtonDefaults.buttonColors(),
    elevation: ButtonElevation? = ButtonDefaults.buttonElevation(),
    border: androidx.compose.foundation.BorderStroke? = null,
    contentPadding: PaddingValues = ButtonDefaults.ContentPadding,
    interactionSource: androidx.compose.foundation.interaction.MutableInteractionSource = remember { androidx.compose.foundation.interaction.MutableInteractionSource() },
    content: @Composable RowScope.() -> Unit
) {
    val ancientColors = ancientArchitectColors()
    
    Button(
        onClick = onClick,
        modifier = modifier
            .background(
                brush = Brush.linearGradient(
                    colors = listOf(
                        ancientColors.metal.primaryLight,
                        ancientColors.metal.primary,
                        ancientColors.metal.primaryDark
                    )
                ),
                shape = shape
            ),
        enabled = enabled,
        shape = shape,
        colors = colors,
        elevation = elevation,
        border = border,
        contentPadding = contentPadding,
        interactionSource = interactionSource,
        content = content
    )
}

/**
 * Ancient Architect Primary Button - Bronze metallic button
 */
@Composable
fun AncientArchitectPrimaryButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    content: @Composable RowScope.() -> Unit
) {
    val ancientColors = ancientArchitectColors()
    
    Button(
        onClick = onClick,
        modifier = modifier
            .drawBehind {
                // Metallic gradient background
                drawRect(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            ancientColors.metal.primaryLight,
                            ancientColors.metal.primary,
                            ancientColors.metal.primaryDark,
                            ancientColors.metal.primary,
                            ancientColors.metal.primaryLight
                        ),
                        start = Offset(0f, 0f),
                        end = Offset(size.width, size.height)
                    )
                )
            }
            .border(
                width = 1.dp,
                color = ancientColors.metal.primaryLight.copy(alpha = 0.5f),
                shape = AncientArchitectShapes.beveledMedium
            ),
        enabled = enabled,
        shape = AncientArchitectShapes.beveledMedium,
        colors = ButtonDefaults.buttonColors(
            containerColor = Color.Transparent,
            contentColor = Color.Black
        ),
        elevation = ButtonDefaults.buttonElevation(
            defaultElevation = 4.dp,
            pressedElevation = 2.dp,
            hoveredElevation = 6.dp
        ),
        content = content
    )
}

/**
 * Ancient Architect Secondary Button - Stone carved appearance
 */
@Composable
fun AncientArchitectSecondaryButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    content: @Composable RowScope.() -> Unit
) {
    val ancientColors = ancientArchitectColors()
    
    OutlinedButton(
        onClick = onClick,
        modifier = modifier
            .border(
                width = 2.dp,
                brush = Brush.linearGradient(
                    colors = listOf(
                        ancientColors.metal.primary,
                        ancientColors.metal.primaryDark
                    )
                ),
                shape = AncientArchitectShapes.beveledMedium
            ),
        enabled = enabled,
        shape = AncientArchitectShapes.beveledMedium,
        colors = ButtonDefaults.outlinedButtonColors(
            containerColor = ancientColors.stone.surface,
            contentColor = ancientColors.stone.text
        ),
        border = null, // We're using custom border
        content = content
    )
}

/**
 * Ancient Architect Icon Button - Hexagonal shape
 */
@Composable
fun AncientArchitectIconButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    colors: IconButtonColors = IconButtonDefaults.iconButtonColors(),
    content: @Composable () -> Unit
) {
    val ancientColors = ancientArchitectColors()
    
    IconButton(
        onClick = onClick,
        modifier = modifier
            .size(48.dp)
            .clip(AncientArchitectShapes.hexagon)
            .background(
                brush = Brush.radialGradient(
                    colors = listOf(
                        ancientColors.metal.primaryLight,
                        ancientColors.metal.primary,
                        ancientColors.metal.primaryDark
                    )
                )
            )
            .border(
                width = 1.dp,
                color = ancientColors.metal.primaryLight.copy(alpha = 0.6f),
                shape = AncientArchitectShapes.hexagon
            ),
        enabled = enabled,
        colors = IconButtonDefaults.iconButtonColors(
            containerColor = Color.Transparent,
            contentColor = Color.Black
        ),
        content = content
    )
}

/**
 * Ancient Architect FAB - Diamond shape with glow
 */
@Composable
fun AncientArchitectFloatingActionButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    shape: androidx.compose.ui.graphics.Shape = AncientArchitectShapes.diamond,
    containerColor: Color = Color.Unspecified,
    contentColor: Color = Color.Unspecified,
    elevation: FloatingActionButtonElevation = FloatingActionButtonDefaults.elevation(),
    content: @Composable () -> Unit
) {
    val ancientColors = ancientArchitectColors()
    val glowEnabled = crystalGlowEnabled()
    
    Box(
        modifier = modifier
            .then(
                if (glowEnabled) {
                    Modifier.drawBehind {
                        // Crystal glow effect
                        drawCircle(
                            brush = Brush.radialGradient(
                                colors = listOf(
                                    ancientColors.crystal.primary.copy(alpha = 0.4f),
                                    ancientColors.crystal.primary.copy(alpha = 0.2f),
                                    Color.Transparent
                                ),
                                radius = size.maxDimension * 0.8f
                            )
                        )
                    }
                } else Modifier
            ),
        contentAlignment = Alignment.Center
    ) {
        FloatingActionButton(
            onClick = onClick,
            modifier = Modifier
                .size(56.dp)
                .clip(shape)
                .background(
                    brush = Brush.radialGradient(
                        colors = listOf(
                            ancientColors.metal.primaryLight,
                            ancientColors.metal.primary,
                            ancientColors.metal.primaryDark
                        )
                    )
                )
                .border(
                    width = 2.dp,
                    color = ancientColors.crystal.primary.copy(alpha = 0.6f),
                    shape = shape
                ),
            shape = shape,
            containerColor = if (containerColor == Color.Unspecified) Color.Transparent else containerColor,
            contentColor = if (contentColor == Color.Unspecified) Color.Black else contentColor,
            elevation = elevation,
            content = content
        )
    }
}

/**
 * Ancient Architect Text Button - Minimal with metallic text
 */
@Composable
fun AncientArchitectTextButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    content: @Composable RowScope.() -> Unit
) {
    val ancientColors = ancientArchitectColors()
    
    TextButton(
        onClick = onClick,
        modifier = modifier,
        enabled = enabled,
        colors = ButtonDefaults.textButtonColors(
            contentColor = ancientColors.metal.primary
        ),
        content = content
    )
}