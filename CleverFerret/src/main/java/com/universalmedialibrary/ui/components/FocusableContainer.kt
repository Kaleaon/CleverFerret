package com.universalmedialibrary.ui.components

import androidx.compose.animation.core.Spring
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.spring
import androidx.compose.foundation.border
import androidx.compose.foundation.focusable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsFocusedAsState
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Shape
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

/**
 * FocusableContainer encapsulates focus state handling, dynamic scale/elevation animation,
 * and explicit focus outline highlight for TV and non-touch hardware navigation.
 *
 * @param modifier Base modifier applied to the container box
 * @param interactionSource Interaction source used to track focus state
 * @param enabled Whether focus interaction is enabled
 * @param focusedScale Scale factor applied when focused (defaults to 1.05f)
 * @param focusedElevation Shadow elevation applied when focused (defaults to 8.dp)
 * @param unfocusedElevation Shadow elevation applied when not focused (defaults to 0.dp)
 * @param shape Shape of the card / container for clipping, shadow, and border
 * @param focusColor Color of the explicit focus outline ring when focused
 * @param focusedBorderWidth Stroke width of the focus outline ring when focused
 * @param onFocusChange Optional callback invoked when focus state changes
 * @param content Composable slot receiving current [isFocused] state
 */
@Composable
@Suppress("LongParameterList", "FunctionNaming")
fun FocusableContainer(
    modifier: Modifier = Modifier,
    interactionSource: MutableInteractionSource = remember { MutableInteractionSource() },
    enabled: Boolean = true,
    focusedScale: Float = 1.05f,
    focusedElevation: Dp = 8.dp,
    unfocusedElevation: Dp = 0.dp,
    shape: Shape = RoundedCornerShape(8.dp),
    focusColor: Color = MaterialTheme.colorScheme.primary,
    focusedBorderWidth: Dp = 2.5.dp,
    onFocusChange: ((Boolean) -> Unit)? = null,
    content: @Composable (isFocused: Boolean) -> Unit
) {
    val isFocused by interactionSource.collectIsFocusedAsState()

    LaunchedEffect(isFocused) {
        onFocusChange?.invoke(isFocused)
    }

    val scale by animateFloatAsState(
        targetValue = if (isFocused) focusedScale else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessMediumLow
        ),
        label = "focusable_container_scale"
    )

    val elevation by animateDpAsState(
        targetValue = if (isFocused) focusedElevation else unfocusedElevation,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioNoBouncy,
            stiffness = Spring.StiffnessMediumLow
        ),
        label = "focusable_container_elevation"
    )

    val borderModifier = if (isFocused && focusedBorderWidth > 0.dp) {
        Modifier.border(focusedBorderWidth, focusColor, shape)
    } else {
        Modifier
    }

    Box(
        modifier = modifier
            .scale(scale)
            .shadow(elevation, shape)
            .then(borderModifier)
            .clip(shape)
            .focusable(enabled = enabled, interactionSource = interactionSource)
    ) {
        content(isFocused)
    }
}
