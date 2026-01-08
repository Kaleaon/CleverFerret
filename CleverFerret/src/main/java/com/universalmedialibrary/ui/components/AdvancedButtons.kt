package com.universalmedialibrary.ui.components

import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsHoveredAsState
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.theme.*

/**
 * Advanced button with metallic shimmer and depth effects
 * Works with ALL themes, not just Ancient Architect
 */
@Composable
fun AdvancedMetallicButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    icon: ImageVector? = null,
    colors: ButtonColors = ButtonDefaults.buttonColors(),
    content: @Composable RowScope.() -> Unit
) {
    val metallicColors = metallicColors()
    val shimmerEnabled = metallicShimmerEnabled()
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.95f else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessHigh
        ),
        label = "buttonScale"
    )
    
    Button(
        onClick = onClick,
        modifier = modifier
            .scale(scale)
            .metallicShimmer(
                enabled = shimmerEnabled,
                baseColor = metallicColors.base,
                highlightColor = metallicColors.highlight
            )
            .depthShadow(elevation = if (isPressed) 2.dp else 4.dp),
        enabled = enabled,
        colors = colors,
        interactionSource = interactionSource,
        elevation = ButtonDefaults.buttonElevation(
            defaultElevation = 4.dp,
            pressedElevation = 2.dp,
            hoveredElevation = 6.dp
        )
    ) {
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            modifier = Modifier.padding(horizontal = 8.dp)
        ) {
            if (icon != null) {
                Icon(
                    imageVector = icon,
                    contentDescription = "Media image",
                    modifier = Modifier.size(20.dp)
                )
            }
            content()
        }
    }
}

/**
 * Elevated action button with glow effect on hover
 */
@Composable
fun ElevatedActionButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    glowOnHover: Boolean = true,
    content: @Composable RowScope.() -> Unit
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    val glowEnabled = crystalGlowEnabled()
    
    val elevation by animateDpAsState(
        targetValue = if (isHovered) 8.dp else 4.dp,
        animationSpec = spring(dampingRatio = Spring.DampingRatioMediumBouncy),
        label = "elevation"
    )
    
    ElevatedButton(
        onClick = onClick,
        modifier = modifier
            .then(
                if (glowOnHover && glowEnabled && isHovered) {
                    Modifier.crystalGlow(
                        enabled = true,
                        glowColor = MaterialTheme.colorScheme.primary,
                        intensity = 0.2f
                    )
                } else {
                    Modifier
                }
            ),
        enabled = enabled,
        interactionSource = interactionSource,
        elevation = ButtonDefaults.elevatedButtonElevation(
            defaultElevation = elevation
        ),
        content = content
    )
}

/**
 * Gradient filled button with shimmer effect
 */
@Composable
fun GradientButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    icon: ImageVector? = null,
    content: @Composable RowScope.() -> Unit
) {
    val metallicColors = metallicColors()
    val shimmerEnabled = metallicShimmerEnabled()
    
    Button(
        onClick = onClick,
        modifier = modifier
            .metallicGradient(metallicColors)
            .then(
                if (shimmerEnabled) {
                    Modifier.metallicShimmer(
                        enabled = true,
                        baseColor = metallicColors.base,
                        highlightColor = metallicColors.shimmer ?: metallicColors.highlight,
                        speed = 3000
                    )
                } else {
                    Modifier
                }
            ),
        enabled = enabled,
        colors = ButtonDefaults.buttonColors(
            containerColor = Color.Transparent,
            contentColor = MaterialTheme.colorScheme.onPrimary
        )
    ) {
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            modifier = Modifier.padding(horizontal = 8.dp)
        ) {
            if (icon != null) {
                Icon(
                    imageVector = icon,
                    contentDescription = "Media image",
                    modifier = Modifier.size(20.dp)
                )
            }
            content()
        }
    }
}

/**
 * Outlined button with embossed effect
 */
@Composable
fun EmbossedOutlinedButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    content: @Composable RowScope.() -> Unit
) {
    val metallicColors = metallicColors()
    
    OutlinedButton(
        onClick = onClick,
        modifier = modifier
            .embossedEffect(
                lightColor = metallicColors.highlight.copy(alpha = 0.3f),
                shadowColor = metallicColors.shadow.copy(alpha = 0.3f),
                depth = 1.dp
            ),
        enabled = enabled,
        border = BorderStroke(
            width = 2.dp,
            color = metallicColors.base
        ),
        content = content
    )
}

/**
 * Floating action button with pulsing glow
 */
@Composable
fun GlowingFab(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    icon: ImageVector,
    pulseGlow: Boolean = true
) {
    val glowEnabled = crystalGlowEnabled()
    
    FloatingActionButton(
        onClick = onClick,
        modifier = modifier
            .then(
                if (pulseGlow && glowEnabled) {
                    Modifier.crystalGlow(
                        enabled = true,
                        glowColor = MaterialTheme.colorScheme.primary,
                        intensity = 0.25f,
                        pulseSpeed = 2500
                    )
                } else {
                    Modifier
                }
            )
            .depthShadow(elevation = 6.dp)
    ) {
        Icon(
            imageVector = icon,
            contentDescription = null
        )
    }
}

/**
 * Glass-effect button with blur background
 */
@Composable
fun GlassButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    content: @Composable RowScope.() -> Unit
) {
    Button(
        onClick = onClick,
        modifier = modifier
            .glassEffect(
                backgroundColor = MaterialTheme.colorScheme.surfaceVariant,
                alpha = 0.6f,
                borderColor = MaterialTheme.colorScheme.outline.copy(alpha = 0.3f)
            ),
        enabled = enabled,
        colors = ButtonDefaults.buttonColors(
            containerColor = Color.Transparent,
            contentColor = MaterialTheme.colorScheme.onSurface
        ),
        border = BorderStroke(
            width = 1.dp,
            color = MaterialTheme.colorScheme.outline.copy(alpha = 0.3f)
        ),
        content = content
    )
}
