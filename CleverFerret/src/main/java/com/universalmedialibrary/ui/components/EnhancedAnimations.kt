package com.universalmedialibrary.ui.components

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.composed
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.unit.IntOffset

/**
 * Animated visibility with slide and fade
 */
fun slideAndFadeIn(
    durationMillis: Int = 400,
    delayMillis: Int = 0
): EnterTransition {
    return fadeIn(
        animationSpec = tween(durationMillis, delayMillis = delayMillis)
    ) + slideInVertically(
        initialOffsetY = { it / 2 },
        animationSpec = tween(durationMillis, delayMillis = delayMillis, easing = FastOutSlowInEasing)
    )
}

fun slideAndFadeOut(
    durationMillis: Int = 400
): ExitTransition {
    return fadeOut(
        animationSpec = tween(durationMillis)
    ) + slideOutVertically(
        targetOffsetY = { -it / 2 },
        animationSpec = tween(durationMillis, easing = FastOutSlowInEasing)
    )
}

/**
 * Scale on press effect
 */
fun Modifier.scaleOnPress(
    pressedScale: Float = 0.95f
) = composed {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) pressedScale else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessMedium
        ),
        label = "scaleOnPress"
    )
    
    this.scale(scale)
}

/**
 * Bounce effect modifier
 */
fun Modifier.bounceClick(
    onClick: () -> Unit
) = composed {
    var isPressed by remember { mutableStateOf(false) }
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.9f else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessHigh
        ),
        label = "bounceScale"
    )
    
    this
        .scale(scale)
        .pointerInput(Unit) {
            detectTapGestures(
                onPress = {
                    isPressed = true
                    tryAwaitRelease()
                    isPressed = false
                },
                onTap = {
                    onClick()
                }
            )
        }
}

/**
 * Shimmer effect modifier
 */
fun Modifier.shimmerEffect() = composed {
    val infiniteTransition = rememberInfiniteTransition(label = "shimmer")
    val translateX by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 1000f,
        animationSpec = infiniteRepeatable(
            animation = tween(1200, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "shimmerTranslate"
    )
    
    this.graphicsLayer {
        translationX = translateX - 500f
    }
}

/**
 * Fade in when visible
 */
fun Modifier.fadeInOnVisible(
    durationMillis: Int = 600,
    delayMillis: Int = 0
) = composed {
    var visible by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        kotlinx.coroutines.delay(delayMillis.toLong())
        visible = true
    }
    
    val alpha by animateFloatAsState(
        targetValue = if (visible) 1f else 0f,
        animationSpec = tween(durationMillis),
        label = "fadeIn"
    )
    
    this.graphicsLayer { this.alpha = alpha }
}

/**
 * Staggered list animation
 */
@Composable
fun <T> rememberStaggeredListAnimation(
    itemCount: Int,
    staggerDelayMillis: Int = 50
): List<Boolean> {
val visibilityStates = remember(itemCount) {
    mutableStateListOf<Boolean>().apply {
```suggestion
@Composable
fun <T> rememberStaggeredListAnimation(
    itemCount: Int,
    staggerDelayMillis: Int = 50
): List<Boolean> {
    val visibilityStates = remember(itemCount) { mutableStateListOf<Boolean>().apply { repeat(itemCount) { add(false) } } }
    LaunchedEffect(itemCount) {
        repeat(itemCount) { index ->
            kotlinx.coroutines.delay((index * staggerDelayMillis).toLong())
            visibilityStates[index] = true
        }
    }
    return visibilityStates
}
    }
}
        repeat(itemCount) { add(false) }
    } }
    
    LaunchedEffect(itemCount) {
        repeat(itemCount) { index ->
            kotlinx.coroutines.delay((index * staggerDelayMillis).toLong())
            visibilityStates[index] = true
        }
    }
    
    return visibilityStates
}

/**
 * Pulsing effect for attention
 */
fun Modifier.pulseEffect(
    minScale: Float = 0.95f,
    maxScale: Float = 1.05f,
    durationMillis: Int = 1000
) = composed {
    val infiniteTransition = rememberInfiniteTransition(label = "pulse")
    val scale by infiniteTransition.animateFloat(
        initialValue = minScale,
        targetValue = maxScale,
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "pulseScale"
    )
    
    this.scale(scale)
}

/**
 * Shake effect for errors
 */
fun Modifier.shakeEffect(
    trigger: Boolean
) = composed {
    val offsetX by animateIntAsState(
        targetValue = if (trigger) 10 else 0,
        animationSpec = repeatable(
            iterations = 3,
            animation = tween(50),
            repeatMode = RepeatMode.Reverse
        ),
        label = "shake"
    )
    
    this.graphicsLayer {
        translationX = offsetX.toFloat()
    }
}

/**
 * Rotation animation
 */
@Composable
fun rememberInfiniteRotation(
    durationMillis: Int = 1000
): Float {
    val infiniteTransition = rememberInfiniteTransition(label = "rotation")
    val rotation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "rotation"
    )
    return rotation
}

/**
 * Slide in from sides animation specs
 */
object SlideAnimationSpecs {
    fun slideInFromLeft(durationMillis: Int = 400): EnterTransition {
        return slideInHorizontally(
            initialOffsetX = { -it },
            animationSpec = tween(durationMillis, easing = FastOutSlowInEasing)
        ) + fadeIn(animationSpec = tween(durationMillis))
    }
    
    fun slideInFromRight(durationMillis: Int = 400): EnterTransition {
        return slideInHorizontally(
            initialOffsetX = { it },
            animationSpec = tween(durationMillis, easing = FastOutSlowInEasing)
        ) + fadeIn(animationSpec = tween(durationMillis))
    }
    
    fun slideOutToLeft(durationMillis: Int = 400): ExitTransition {
        return slideOutHorizontally(
            targetOffsetX = { -it },
            animationSpec = tween(durationMillis, easing = FastOutSlowInEasing)
        ) + fadeOut(animationSpec = tween(durationMillis))
    }
    
    fun slideOutToRight(durationMillis: Int = 400): ExitTransition {
        return slideOutHorizontally(
            targetOffsetX = { it },
            animationSpec = tween(durationMillis, easing = FastOutSlowInEasing)
        ) + fadeOut(animationSpec = tween(durationMillis))
    }
}

/**
 * Expandable animation specs
 */
object ExpandableAnimationSpecs {
    fun expandVertically(durationMillis: Int = 300): EnterTransition {
        return expandVertically(
            animationSpec = tween(durationMillis, easing = FastOutSlowInEasing)
        ) + fadeIn(animationSpec = tween(durationMillis))
    }
    
    fun collapseVertically(durationMillis: Int = 300): ExitTransition {
        return shrinkVertically(
            animationSpec = tween(durationMillis, easing = FastOutSlowInEasing)
        ) + fadeOut(animationSpec = tween(durationMillis))
    }
}
