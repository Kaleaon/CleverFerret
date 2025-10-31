package com.universalmedialibrary.ui.components

import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsHoveredAsState
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.theme.*

/**
 * Enhanced card with metallic gradient and shimmer
 */
@Composable
fun MetallicCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    shape: androidx.compose.ui.graphics.Shape = MaterialTheme.shapes.medium,
    elevation: Dp = 4.dp,
    content: @Composable ColumnScope.() -> Unit
) {
    val metallicColors = metallicColors()
    val shimmerEnabled = metallicShimmerEnabled()
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    
    val scale by animateFloatAsState(
        targetValue = if (isHovered && onClick != null) 1.02f else 1f,
        animationSpec = spring(dampingRatio = Spring.DampingRatioMediumBouncy),
        label = "cardScale"
    )
    
    Card(
        modifier = modifier
            .scale(scale)
            .metallicGradient(metallicColors, angle = 135f)
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
            )
            .depthShadow(elevation = elevation)
            .then(
                if (onClick != null) {
                    Modifier.clickable(
                        interactionSource = interactionSource,
                        indication = null,
                        onClick = onClick
                    )
                } else {
                    Modifier
                }
            ),
        shape = shape,
        colors = CardDefaults.cardColors(
            containerColor = Color.Transparent
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            content = content
        )
    }
}

/**
 * Glass-effect card with blur and transparency
 */
@Composable
fun GlassCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    shape: androidx.compose.ui.graphics.Shape = MaterialTheme.shapes.medium,
    content: @Composable ColumnScope.() -> Unit
) {
    val patternsEnabled = geometricPatternsEnabled()
    
    Card(
        modifier = modifier
            .glassEffect(
                backgroundColor = MaterialTheme.colorScheme.surface,
                alpha = 0.7f,
                borderColor = MaterialTheme.colorScheme.outline.copy(alpha = 0.3f)
            )
            .then(
                if (patternsEnabled) {
                    Modifier.geometricPattern(
                        patternColor = MaterialTheme.colorScheme.onSurface,
                        patternType = PatternType.SUBTLE_GRID,
                        alpha = 0.03f
                    )
                } else {
                    Modifier
                }
            )
            .then(
                if (onClick != null) {
                    Modifier.clickable(onClick = onClick)
                } else {
                    Modifier
                }
            ),
        shape = shape,
        colors = CardDefaults.cardColors(
            containerColor = Color.Transparent
        ),
        border = BorderStroke(
            width = 1.dp,
            color = MaterialTheme.colorScheme.outline.copy(alpha = 0.3f)
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            content = content
        )
    }
}

/**
 * Elevated card with dynamic lighting
 */
@Composable
fun ElevatedLightCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    elevation: Dp = 6.dp,
    content: @Composable ColumnScope.() -> Unit
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isHovered by interactionSource.collectIsHoveredAsState()
    
    val cardElevation by animateDpAsState(
        targetValue = if (isHovered && onClick != null) elevation + 4.dp else elevation,
        animationSpec = spring(dampingRatio = Spring.DampingRatioMediumBouncy),
        label = "cardElevation"
    )
    
    Card(
        modifier = modifier
            .advancedLighting(
                ambientColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.05f),
                spotlightColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.15f)
            )
            .then(
                if (onClick != null) {
                    Modifier.clickable(
                        interactionSource = interactionSource,
                        indication = null,
                        onClick = onClick
                    )
                } else {
                    Modifier
                }
            ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = cardElevation
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            content = content
        )
    }
}

/**
 * Card with embossed appearance
 */
@Composable
fun EmbossedCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    content: @Composable ColumnScope.() -> Unit
) {
    val metallicColors = metallicColors()
    
    Card(
        modifier = modifier
            .embossedEffect(
                lightColor = metallicColors.highlight.copy(alpha = 0.4f),
                shadowColor = metallicColors.shadow.copy(alpha = 0.4f),
                depth = 2.dp
            )
            .then(
                if (onClick != null) {
                    Modifier.clickable(onClick = onClick)
                } else {
                    Modifier
                }
            ),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            content = content
        )
    }
}

/**
 * Card with geometric pattern overlay
 */
@Composable
fun PatternedCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    patternType: PatternType = PatternType.SUBTLE_GRID,
    elevation: Dp = 4.dp,
    content: @Composable ColumnScope.() -> Unit
) {
    val patternsEnabled = geometricPatternsEnabled()
    
    Card(
        modifier = modifier
            .then(
                if (patternsEnabled) {
                    Modifier.geometricPattern(
                        patternColor = MaterialTheme.colorScheme.onSurface,
                        patternType = patternType,
                        alpha = 0.05f
                    )
                } else {
                    Modifier
                }
            )
            .depthShadow(elevation = elevation)
            .then(
                if (onClick != null) {
                    Modifier.clickable(onClick = onClick)
                } else {
                    Modifier
                }
            ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = elevation
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            content = content
        )
    }
}

/**
 * Glowing card for special content
 */
@Composable
fun GlowingCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    glowColor: Color = MaterialTheme.colorScheme.primary,
    elevation: Dp = 4.dp,
    content: @Composable ColumnScope.() -> Unit
) {
    val glowEnabled = crystalGlowEnabled()
    
    Card(
        modifier = modifier
            .then(
                if (glowEnabled) {
                    Modifier.crystalGlow(
                        enabled = true,
                        glowColor = glowColor,
                        intensity = 0.2f,
                        pulseSpeed = 3000
                    )
                } else {
                    Modifier
                }
            )
            .depthShadow(elevation = elevation)
            .then(
                if (onClick != null) {
                    Modifier.clickable(onClick = onClick)
                } else {
                    Modifier
                }
            ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = elevation
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            content = content
        )
    }
}

/**
 * Card with gradient overlay
 */
@Composable
fun GradientOverlayCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    gradientColors: List<Color> = listOf(
        MaterialTheme.colorScheme.primary,
        MaterialTheme.colorScheme.secondary
    ),
    elevation: Dp = 4.dp,
    content: @Composable ColumnScope.() -> Unit
) {
    Card(
        modifier = modifier
            .gradientOverlay(
                gradient = gradientColors,
                angle = 135f,
                alpha = 0.15f
            )
            .depthShadow(elevation = elevation)
            .then(
                if (onClick != null) {
                    Modifier.clickable(onClick = onClick)
                } else {
                    Modifier
                }
            ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = elevation
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            content = content
        )
    }
}
