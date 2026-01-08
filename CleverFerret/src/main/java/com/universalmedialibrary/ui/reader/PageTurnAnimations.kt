package com.universalmedialibrary.ui.reader

import androidx.compose.animation.core.*
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.gestures.detectHorizontalDragGestures
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.drawIntoCanvas
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.graphics.graphicsLayer
import java.util.Locale
import kotlin.math.*

/**
 * Page Turn Animations
 * - Curl (realistic page curl effect)
 * - Slide (smooth horizontal slide)
 * - Fade (cross-fade between pages)
 * - Flip (3D flip animation)
 * - 3D Cube (cube rotation effect)
 */

enum class PageTurnAnimation {
    NONE,
    CURL,
    SLIDE,
    FADE,
    FLIP_HORIZONTAL,
    FLIP_VERTICAL,
    CUBE,
    ACCORDION,
    ZOOM
}

data class AnimationSettings(
    val animation: PageTurnAnimation = PageTurnAnimation.SLIDE,
    val duration: Int = 300,              // milliseconds
    val swipeThreshold: Float = 0.3f,     // 0.0 to 1.0
    val enableHapticFeedback: Boolean = true,
    val showShadows: Boolean = true,
    val curlIntensity: Float = 1.0f       // 0.5 to 2.0 (for curl animation)
)

@Composable
fun PageTurnAnimationSettings(
    settings: AnimationSettings,
    onSettingsChange: (AnimationSettings) -> Unit,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier
) {
    var currentSettings by remember { mutableStateOf(settings) }

    Surface(
        modifier = modifier.fillMaxSize(),
        color = MaterialTheme.colorScheme.surface
    ) {
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Top bar
            @OptIn(ExperimentalMaterial3Api::class)
            TopAppBar(
                title = { Text("Page Animations") },
                navigationIcon = {
                    IconButton(onClick = {
                        onSettingsChange(currentSettings)
                        onDismiss()
                    }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    TextButton(onClick = {
                        currentSettings = AnimationSettings()
                        onSettingsChange(currentSettings)
                    }) {
                        Text("Reset")
                    }
                }
            )

            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Animation type selector
                AnimationTypeSelector(
                    selectedAnimation = currentSettings.animation,
                    onAnimationChange = { currentSettings = currentSettings.copy(animation = it) }
                )

                // Duration control
                AnimationDurationControl(
                    duration = currentSettings.duration,
                    onDurationChange = { currentSettings = currentSettings.copy(duration = it) }
                )

                // Swipe threshold
                SwipeThresholdControl(
                    threshold = currentSettings.swipeThreshold,
                    onThresholdChange = { currentSettings = currentSettings.copy(swipeThreshold = it) }
                )

                // Additional options
                AdditionalAnimationOptions(
                    settings = currentSettings,
                    onSettingsChange = { currentSettings = it }
                )

                // Preview
                AnimationPreview(currentSettings)
            }
        }
    }
}

@Composable
private fun AnimationTypeSelector(
    selectedAnimation: PageTurnAnimation,
    onAnimationChange: (PageTurnAnimation) -> Unit
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
                text = "Animation Type",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            val animations = listOf(
                PageTurnAnimation.NONE to "None",
                PageTurnAnimation.SLIDE to "Slide",
                PageTurnAnimation.FADE to "Fade",
                PageTurnAnimation.CURL to "Curl",
                PageTurnAnimation.FLIP_HORIZONTAL to "Flip Horizontal",
                PageTurnAnimation.FLIP_VERTICAL to "Flip Vertical",
                PageTurnAnimation.CUBE to "3D Cube",
                PageTurnAnimation.ACCORDION to "Accordion",
                PageTurnAnimation.ZOOM to "Zoom"
            )

            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                animations.chunked(3).forEach { row ->
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        row.forEach { (anim, name) ->
                            FilterChip(
                                selected = selectedAnimation == anim,
                                onClick = { onAnimationChange(anim) },
                                label = { Text(name, style = MaterialTheme.typography.bodySmall) },
                                modifier = Modifier.weight(1f)
                            )
                        }
                        // Fill remaining space if row is not complete
                        repeat(3 - row.size) {
                            Spacer(modifier = Modifier.weight(1f))
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun AnimationDurationControl(
    duration: Int,
    onDurationChange: (Int) -> Unit
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
                Text(
                    text = "Animation Duration",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = "${duration}ms",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }

            Slider(
                value = duration.toFloat(),
                onValueChange = { onDurationChange(it.toInt()) },
                valueRange = 100f..1000f,
                steps = 8
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text("Fast (100ms)", style = MaterialTheme.typography.bodySmall)
                Text("Slow (1000ms)", style = MaterialTheme.typography.bodySmall)
            }
        }
    }
}

@Composable
private fun SwipeThresholdControl(
    threshold: Float,
    onThresholdChange: (Float) -> Unit
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
                Text(
                    text = "Swipe Sensitivity",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = "${(threshold * 100).toInt()}%",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }

            Slider(
                value = threshold,
                onValueChange = onThresholdChange,
                valueRange = 0.1f..0.9f,
                steps = 7
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text("Sensitive", style = MaterialTheme.typography.bodySmall)
                Text("Conservative", style = MaterialTheme.typography.bodySmall)
            }
        }
    }
}

@Composable
private fun AdditionalAnimationOptions(
    settings: AnimationSettings,
    onSettingsChange: (AnimationSettings) -> Unit
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
                text = "Additional Options",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text("Haptic Feedback", style = MaterialTheme.typography.bodyMedium)
                Switch(
                    checked = settings.enableHapticFeedback,
                    onCheckedChange = { onSettingsChange(settings.copy(enableHapticFeedback = it)) }
                )
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text("Show Shadows", style = MaterialTheme.typography.bodyMedium)
                Switch(
                    checked = settings.showShadows,
                    onCheckedChange = { onSettingsChange(settings.copy(showShadows = it)) }
                )
            }

            if (settings.animation == PageTurnAnimation.CURL) {
                Text(
                    text = "Curl Intensity: ${String.format(Locale.US, "%.1f", settings.curlIntensity)}",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = settings.curlIntensity,
                    onValueChange = { onSettingsChange(settings.copy(curlIntensity = it)) },
                    valueRange = 0.5f..2.0f,
                    steps = 14
                )
            }
        }
    }
}

@Composable
private fun AnimationPreview(settings: AnimationSettings) {
    var isAnimating by remember { mutableStateOf(false) }
    val animationProgress by animateFloatAsState(
        targetValue = if (isAnimating) 1f else 0f,
        animationSpec = tween(durationMillis = settings.duration),
        finishedListener = { isAnimating = false }
    )

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
            verticalArrangement = Arrangement.spacedBy(12.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = "Preview",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp),
                contentAlignment = Alignment.Center
            ) {
                // Background page
                Card(
                    modifier = Modifier
                        .size(150.dp, 200.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.secondaryContainer
                    )
                ) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Text("Page 2", style = MaterialTheme.typography.headlineMedium)
                    }
                }

                // Foreground page with animation
                Card(
                    modifier = Modifier
                        .size(150.dp, 200.dp)
                        .then(
                            when (settings.animation) {
                                PageTurnAnimation.SLIDE -> Modifier.offset(
                                    x = (-150 * animationProgress).dp
                                )
                                PageTurnAnimation.FADE -> Modifier.alpha(1f - animationProgress)
                                PageTurnAnimation.FLIP_HORIZONTAL -> Modifier
                                    .graphicsLayer {
                                        rotationY = animationProgress * 180f
                                        cameraDistance = 12f * density
                                    }
                                PageTurnAnimation.FLIP_VERTICAL -> Modifier
                                    .graphicsLayer {
                                        rotationX = animationProgress * 180f
                                        cameraDistance = 12f * density
                                    }
                                PageTurnAnimation.ZOOM -> Modifier
                                    .scale(1f - animationProgress * 0.5f)
                                    .alpha(1f - animationProgress)
                                else -> Modifier
                            }
                        ),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Text("Page 1", style = MaterialTheme.typography.headlineMedium)
                    }
                }
            }

            Button(
                onClick = { isAnimating = true },
                enabled = !isAnimating
            ) {
                Icon(Icons.Default.PlayArrow, contentDescription = "Play")
                Spacer(modifier = Modifier.width(8.dp))
                Text("Preview Animation")
            }
        }
    }
}

/**
 * Composable that applies the selected page turn animation
 */
@Composable
fun AnimatedPageTurn(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    progress: Float,
    settings: AnimationSettings,
    modifier: Modifier = Modifier
) {
    Box(modifier = modifier) {
        when (settings.animation) {
            PageTurnAnimation.NONE -> {
                if (progress < 0.5f) currentPage() else nextPage()
            }
            PageTurnAnimation.SLIDE -> {
                SlideAnimation(currentPage, nextPage, progress, settings)
            }
            PageTurnAnimation.FADE -> {
                FadeAnimation(currentPage, nextPage, progress)
            }
            PageTurnAnimation.CURL -> {
                CurlAnimation(currentPage, nextPage, progress, settings)
            }
            PageTurnAnimation.FLIP_HORIZONTAL -> {
                FlipAnimation(currentPage, nextPage, progress, isVertical = false)
            }
            PageTurnAnimation.FLIP_VERTICAL -> {
                FlipAnimation(currentPage, nextPage, progress, isVertical = true)
            }
            PageTurnAnimation.CUBE -> {
                CubeAnimation(currentPage, nextPage, progress)
            }
            PageTurnAnimation.ACCORDION -> {
                AccordionAnimation(currentPage, nextPage, progress)
            }
            PageTurnAnimation.ZOOM -> {
                ZoomAnimation(currentPage, nextPage, progress)
            }
        }
    }
}

@Composable
private fun SlideAnimation(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    progress: Float,
    settings: AnimationSettings
) {
    Box(modifier = Modifier.fillMaxSize()) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .graphicsLayer { translationX = -progress * size.width }
        ) {
            currentPage()
        }
        Box(
            modifier = Modifier
                .fillMaxSize()
                .graphicsLayer { translationX = (1f - progress) * size.width }
        ) {
            nextPage()
        }
    }
}

@Composable
private fun FadeAnimation(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    progress: Float
) {
    Box(modifier = Modifier.fillMaxSize()) {
        Box(modifier = Modifier.alpha(1f - progress)) {
            currentPage()
        }
        Box(modifier = Modifier.alpha(progress)) {
            nextPage()
        }
    }
}

@Composable
private fun FlipAnimation(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    progress: Float,
    isVertical: Boolean
) {
    val density = LocalDensity.current.density
    Box(modifier = Modifier.fillMaxSize()) {
        if (progress < 0.5f) {
            Box(
                modifier = Modifier.graphicsLayer {
                    if (isVertical) {
                        rotationX = progress * 180f
                    } else {
                        rotationY = progress * 180f
                    }
                    cameraDistance = 12f * density
                }
            ) {
                currentPage()
            }
        } else {
            Box(
                modifier = Modifier.graphicsLayer {
                    if (isVertical) {
                        rotationX = (1 - progress) * 180f
                    } else {
                        rotationY = (1 - progress) * 180f
                    }
                    cameraDistance = 12f * density
                }
            ) {
                nextPage()
            }
        }
    }
}

@Composable
private fun CubeAnimation(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    progress: Float
) {
    val density = LocalDensity.current.density
    Box(modifier = Modifier.fillMaxSize()) {
        Box(
            modifier = Modifier.graphicsLayer {
                rotationY = -progress * 90f
                cameraDistance = 12f * density
                alpha = if (progress < 0.5f) 1f else 0f
            }
        ) {
            currentPage()
        }
        Box(
            modifier = Modifier.graphicsLayer {
                rotationY = 90f - progress * 90f
                cameraDistance = 12f * density
                alpha = if (progress >= 0.5f) 1f else 0f
            }
        ) {
            nextPage()
        }
    }
}

@Composable
private fun AccordionAnimation(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    progress: Float
) {
    Box(modifier = Modifier.fillMaxSize()) {
        Box(
            modifier = Modifier
                .scale(scaleX = 1f - progress, scaleY = 1f)
                .alpha(1f - progress)
        ) {
            currentPage()
        }
        Box(
            modifier = Modifier
                .scale(scaleX = progress, scaleY = 1f)
                .alpha(progress)
        ) {
            nextPage()
        }
    }
}

@Composable
private fun ZoomAnimation(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    progress: Float
) {
    Box(modifier = Modifier.fillMaxSize()) {
        Box(
            modifier = Modifier
                .scale(1f + progress)
                .alpha(1f - progress)
        ) {
            currentPage()
        }
        Box(
            modifier = Modifier
                .scale(progress)
                .alpha(progress)
        ) {
            nextPage()
        }
    }
}

@Composable
private fun CurlAnimation(
    currentPage: @Composable () -> Unit,
    nextPage: @Composable () -> Unit,
    progress: Float,
    settings: AnimationSettings
) {
    // Enhanced curl effect inspired by Moonreader's realistic page curl
    val density = LocalDensity.current
    Box(modifier = Modifier.fillMaxSize()) {
        // Show next page as background
        nextPage()

        // Current page with curl effect
        Box(
            modifier = Modifier
                .fillMaxSize()
                .graphicsLayer {
                    // Create realistic curl by rotating and translating
                    val curlProgress = progress.coerceIn(0f, 1f)
                    val curlWidth = size.width * curlProgress * settings.curlIntensity
                    
                    // Perspective transformation for 3D curl effect
                    val pivotX = size.width
                    val pivotY = size.height / 2f
                    
                    // Rotate the page as it curls
                    rotationY = -curlProgress * 90f
                    transformOrigin = androidx.compose.ui.graphics.TransformOrigin(
                        pivotFractionX = 1f,
                        pivotFractionY = 0.5f
                    )
                    
                    // Add shadow for depth
                    shadowElevation = curlProgress * 8f
                }
                .alpha(1f - progress * 0.3f) // Slight fade as it curls
        ) {
            currentPage()
        }

        // Draw curl shadow gradient for realism
        Canvas(
            modifier = Modifier.fillMaxSize()
        ) {
            val width = size.width
            val height = size.height
            val curlProgress = progress.coerceIn(0f, 1f)
            val curlWidth = width * curlProgress * settings.curlIntensity

            if (curlProgress > 0f && curlWidth < width) {
                // Draw gradient shadow on the curling edge
                val shadowWidth = 20.dp.toPx()
                val gradient = Brush.horizontalGradient(
                    colors = listOf(
                        Color.Black.copy(alpha = 0.3f * curlProgress),
                        Color.Black.copy(alpha = 0.1f * curlProgress),
                        Color.Transparent
                    ),
                    startX = width - curlWidth - shadowWidth,
                    endX = width - curlWidth
                )

                drawRect(
                    brush = gradient,
                    topLeft = Offset(width - curlWidth - shadowWidth, 0f),
                    size = Size(shadowWidth, height)
                )
            }
        }
    }
}
