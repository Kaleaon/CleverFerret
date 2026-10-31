package com.universalmedialibrary.ui.components

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.LocalIndication
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsFocusedAsState
import androidx.compose.foundation.interaction.collectIsHoveredAsState
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.composed
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.RectangleShape
import androidx.compose.ui.graphics.Shape
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

/**
 * Compose modifier extension for accessible clickability with high-contrast visual focus ring support.
 * Tracks focus and hover state via [MutableInteractionSource] and draws a focus outline when focused,
 * satisfying WCAG 2.1 AA Focus Visible standards without suppressing visual keyboard feedback.
 */
@OptIn(ExperimentalFoundationApi::class)
fun Modifier.accessibleClickable(
    interactionSource: MutableInteractionSource? = null,
    shape: Shape = RectangleShape,
    focusColor: Color? = null,
    borderWidth: Dp = 2.dp,
    enabled: Boolean = true,
    onClickLabel: String? = null,
    role: Role? = null,
    onLongClick: (() -> Unit)? = null,
    onClick: (() -> Unit)? = null
): Modifier = composed {
    val actualInteractionSource = interactionSource ?: remember { MutableInteractionSource() }
    val isFocused by actualInteractionSource.collectIsFocusedAsState()
    val isHovered by actualInteractionSource.collectIsHoveredAsState()

    val resolvedFocusColor = focusColor ?: MaterialTheme.colorScheme.primary

    this
        .then(
            if (isFocused) {
                Modifier.border(
                    width = borderWidth,
                    color = resolvedFocusColor,
                    shape = shape
                )
            } else {
                Modifier
            }
        )
        .then(
            if (onClick != null || onLongClick != null) {
                if (onLongClick != null) {
                    Modifier.combinedClickable(
                        interactionSource = actualInteractionSource,
                        indication = LocalIndication.current,
                        enabled = enabled,
                        onClickLabel = onClickLabel,
                        role = role,
                        onLongClick = onLongClick,
                        onClick = onClick ?: {}
                    )
                } else {
                    Modifier.clickable(
                        interactionSource = actualInteractionSource,
                        indication = LocalIndication.current,
                        enabled = enabled,
                        onClickLabel = onClickLabel,
                        role = role,
                        onClick = onClick ?: {}
                    )
                }
            } else {
                Modifier
            }
        )
}
