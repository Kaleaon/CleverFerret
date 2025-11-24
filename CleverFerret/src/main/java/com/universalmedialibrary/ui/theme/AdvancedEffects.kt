package com.universalmedialibrary.ui.theme

import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.composed
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.draw.drawWithContent
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

/**
 * Advanced Visual Effects System
 * 
 * Provides sophisticated visual effects that can be applied to ANY theme:
 * - Metallic shimmer and shine
 * - Blur and glassmorphism
 * - Depth and elevation shadows
 * - Gradient overlays
 * - Crystal glow effects
 * - Particle animations
 * - Advanced lighting
 */

/**
 * Apply metallic shimmer effect to any element
 * Works with all metallic and non-metallic themes
 */
fun Modifier.metallicShimmer(
    enabled: Boolean = true,
    baseColor: Color,
    highlightColor: Color = baseColor.copy(alpha = 0.3f),
    speed: Int = 2000,
    angle: Float = 45f
): Modifier = if (enabled) {
    composed {
        val infiniteTransition = rememberInfiniteTransition(label = "shimmer")
        val shimmerOffset by infiniteTransition.animateFloat(
            initialValue = -1f,
            targetValue = 3f,
            animationSpec = infiniteRepeatable(
                animation = tween(speed, easing = LinearEasing),
                repeatMode = RepeatMode.Restart
            ),
            label = "shimmerOffset"
        )
        
        drawWithContent {
            drawContent()
            
            // Calculate shimmer gradient position
            val angleRad = angle * PI / 180f
            val shimmerWidth = size.width * 0.3f
            val shimmerX = shimmerOffset * size.width
            val shimmerY = shimmerOffset * size.height
            
            drawRect(
                brush = Brush.linearGradient(
                    colors = listOf(
                        Color.Transparent,
                        highlightColor,
                        Color.Transparent
                    ),
                    start = Offset(shimmerX - shimmerWidth, shimmerY - shimmerWidth),
                    end = Offset(shimmerX + shimmerWidth, shimmerY + shimmerWidth)
                ),
                blendMode = BlendMode.Screen
            )
        }
    }
} else {
    this
}

/**
 * Apply crystal glow effect (pulsing luminescence)
 */
fun Modifier.crystalGlow(
    enabled: Boolean = true,
    glowColor: Color,
    intensity: Float = 0.2f, // Reduced default intensity
    pulseSpeed: Int = 3000 // Slower pulse
): Modifier = if (enabled) {
    composed {
        val infiniteTransition = rememberInfiniteTransition(label = "glow")
        val glowAlpha by infiniteTransition.animateFloat(
            initialValue = intensity * 0.3f,
            targetValue = intensity,
            animationSpec = infiniteRepeatable(
                animation = tween(pulseSpeed, easing = FastOutSlowInEasing),
                repeatMode = RepeatMode.Reverse
            ),
            label = "glowAlpha"
        )
        
        drawBehind {
            // Draw a soft radial glow behind the content
            // Use standard alpha blending instead of BlendMode.Plus to avoid "blown out" colors
            drawRect(
                brush = Brush.radialGradient(
                    colors = listOf(
                        glowColor.copy(alpha = glowAlpha),
                        glowColor.copy(alpha = glowAlpha * 0.5f),
                        Color.Transparent
                    ),
                    radius = size.maxDimension / 1.5f
                )
            )
        }
    }
} else {
    this
}

/**
 * Apply depth shadow effect for elevation
 */
fun Modifier.depthShadow(
    elevation: Dp = 4.dp,
    color: Color = Color.Black,
    alpha: Float = 0.25f,
    shape: Shape = RectangleShape
): Modifier = drawBehind {
    val shadowColor = color.copy(alpha = alpha)
    val elevationPx = elevation.toPx()
    
    // Draw multiple shadow layers for depth
    for (i in 0..3) {
        val offset = elevationPx * (i + 1) / 4f
        val layerAlpha = alpha * (1f - i / 4f)
        
        drawRect(
            color = shadowColor.copy(alpha = layerAlpha),
            topLeft = Offset(offset / 2f, offset),
            size = size
        )
    }
}

/**
 * Apply gradient overlay effect
 */
fun Modifier.gradientOverlay(
    gradient: List<Color>,
    angle: Float = 45f,
    blendMode: BlendMode = BlendMode.Overlay,
    alpha: Float = 0.2f
): Modifier = drawWithContent {
    drawContent()
    
    val angleRad = angle * PI / 180f
    val endX = size.width * cos(angleRad).toFloat()
    val endY = size.height * sin(angleRad).toFloat()
    
    drawRect(
        brush = Brush.linearGradient(
            colors = gradient.map { it.copy(alpha = alpha) },
            start = Offset.Zero,
            end = Offset(endX, endY)
        ),
        blendMode = blendMode
    )
}

/**
 * Apply glassmorphism blur effect
 * Note: Actual blur requires RenderEffect API 31+, this creates a frosted glass appearance
 */
fun Modifier.glassEffect(
    backgroundColor: Color,
    alpha: Float = 0.7f,
    borderColor: Color = Color.White.copy(alpha = 0.2f)
): Modifier = background(
    brush = Brush.linearGradient(
        colors = listOf(
            backgroundColor.copy(alpha = alpha),
            backgroundColor.copy(alpha = alpha * 0.8f)
        )
    )
)

/**
 * Apply metallic gradient background
 */
fun Modifier.metallicGradient(
    metallicColors: MetallicGradient,
    angle: Float = 135f
): Modifier = drawBehind {
    val angleRad = angle * PI / 180f
    val endX = size.width * cos(angleRad).toFloat()
    val endY = size.height * sin(angleRad).toFloat()
    
    drawRect(
        brush = Brush.linearGradient(
            colors = listOf(
                metallicColors.highlight,
                metallicColors.base,
                metallicColors.shadow,
                metallicColors.base,
                metallicColors.highlight
            ),
            start = Offset.Zero,
            end = Offset(endX, endY)
        )
    )
}

/**
 * Apply embossed/engraved effect
 */
fun Modifier.embossedEffect(
    lightColor: Color = Color.White.copy(alpha = 0.4f),
    shadowColor: Color = Color.Black.copy(alpha = 0.4f),
    depth: Dp = 2.dp
): Modifier = drawBehind {
    val depthPx = depth.toPx()
    
    // Light highlight on top-left
    drawRect(
        color = lightColor,
        topLeft = Offset(-depthPx, -depthPx),
        size = size
    )
    
    // Dark shadow on bottom-right
    drawRect(
        color = shadowColor,
        topLeft = Offset(depthPx, depthPx),
        size = size
    )
}

/**
 * Apply advanced lighting effect with multiple light sources
 */
fun Modifier.advancedLighting(
    ambientColor: Color = Color.White.copy(alpha = 0.05f),
    spotlightColor: Color = Color.White.copy(alpha = 0.15f),
    spotlightPosition: Offset = Offset(0.3f, 0.2f)
): Modifier = drawBehind {
    // Ambient light
    drawRect(color = ambientColor)
    
    // Radial spotlight
    val spotlightX = size.width * spotlightPosition.x
    val spotlightY = size.height * spotlightPosition.y
    val maxRadius = maxOf(size.width, size.height)
    
        drawCircle(
            brush = Brush.radialGradient(
                colors = listOf(
                    spotlightColor,
                    Color.Transparent
                ),
                center = Offset(spotlightX, spotlightY),
                radius = maxRadius * 0.8f
            ),
            center = Offset(spotlightX, spotlightY),
            radius = maxRadius * 0.8f,
            blendMode = BlendMode.Screen
        )
}

/**
 * Apply geometric pattern overlay (works with all themes)
 */
fun Modifier.geometricPattern(
    patternColor: Color,
    patternType: PatternType = PatternType.SUBTLE_GRID,
    alpha: Float = 0.05f
): Modifier = drawBehind {
    when (patternType) {
        PatternType.SUBTLE_GRID -> drawSubtleGrid(patternColor.copy(alpha = alpha))
        PatternType.DIAGONAL_LINES -> drawDiagonalLines(patternColor.copy(alpha = alpha))
        PatternType.DOTS -> drawDotPattern(patternColor.copy(alpha = alpha))
        PatternType.HEXAGONS -> drawHexagonPattern(patternColor.copy(alpha = alpha))
    }
}

enum class PatternType {
    SUBTLE_GRID,
    DIAGONAL_LINES,
    DOTS,
    HEXAGONS
}

private fun DrawScope.drawSubtleGrid(color: Color) {
    val gridSize = 40f
    val strokeWidth = 0.5f
    
    // Vertical lines
    var x = 0f
    while (x < size.width) {
        drawLine(
            color = color,
            start = Offset(x, 0f),
            end = Offset(x, size.height),
            strokeWidth = strokeWidth
        )
        x += gridSize
    }
    
    // Horizontal lines
    var y = 0f
    while (y < size.height) {
        drawLine(
            color = color,
            start = Offset(0f, y),
            end = Offset(size.width, y),
            strokeWidth = strokeWidth
        )
        y += gridSize
    }
}

private fun DrawScope.drawDiagonalLines(color: Color) {
    val spacing = 30f
    val strokeWidth = 0.5f
    val numLines = ((size.width + size.height) / spacing).toInt()
    
    for (i in 0..numLines) {
        val offset = i * spacing
        drawLine(
            color = color,
            start = Offset(0f, offset),
            end = Offset(offset, 0f),
            strokeWidth = strokeWidth
        )
    }
}

private fun DrawScope.drawDotPattern(color: Color) {
    val spacing = 20f
    val dotRadius = 1f
    
    var y = 0f
    while (y < size.height) {
        var x = 0f
        while (x < size.width) {
            drawCircle(
                color = color,
                radius = dotRadius,
                center = Offset(x, y)
            )
            x += spacing
        }
        y += spacing
    }
}

private fun DrawScope.drawHexagonPattern(color: Color) {
    val hexSize = 25f
    val strokeWidth = 0.5f
    val hexWidth = hexSize * 2f
    val hexHeight = hexSize * 1.732f
    
    var row = 0
    var y = 0f
    while (y < size.height + hexHeight) {
        var x = if (row % 2 == 0) 0f else hexWidth * 0.75f / 2f
        while (x < size.width + hexWidth) {
            drawHexagon(Offset(x, y), hexSize, color, strokeWidth)
            x += hexWidth * 0.75f
        }
        y += hexHeight
        row++
    }
}

private fun DrawScope.drawHexagon(center: Offset, size: Float, color: Color, strokeWidth: Float) {
    val path = Path()
    for (i in 0..5) {
        val angle = (PI / 3.0 * i).toFloat()
        val x = center.x + size * cos(angle)
        val y = center.y + size * sin(angle)
        if (i == 0) {
            path.moveTo(x, y)
        } else {
            path.lineTo(x, y)
        }
    }
    path.close()
    
    drawPath(
        path = path,
        color = color,
        style = Stroke(width = strokeWidth)
    )
}

/**
 * Animate entrance with scale and fade
 */
fun Modifier.animatedEntrance(
    durationMillis: Int = 400,
    delayMillis: Int = 0
): Modifier = composed {
    var visible by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        kotlinx.coroutines.delay(delayMillis.toLong())
        visible = true
    }
    
    val scale by animateFloatAsState(
        targetValue = if (visible) 1f else 0.8f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessMedium
        ),
        label = "entranceScale"
    )
    
    val alpha by animateFloatAsState(
        targetValue = if (visible) 1f else 0f,
        animationSpec = tween(durationMillis),
        label = "entranceAlpha"
    )
    
    graphicsLayer {
        scaleX = scale
        scaleY = scale
        this.alpha = alpha
    }
}

/**
 * Apply spring bounce on press
 */
fun Modifier.springBounce(
    pressedScale: Float = 0.95f
): Modifier = composed {
    var isPressed by remember { mutableStateOf(false) }
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) pressedScale else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessHigh
        ),
        label = "bounceScale"
    )
    
    graphicsLayer {
        scaleX = scale
        scaleY = scale
    }
}