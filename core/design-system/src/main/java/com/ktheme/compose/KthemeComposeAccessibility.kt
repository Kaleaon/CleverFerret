package com.ktheme.compose

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.RowScope
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.selection.toggleable
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.ProgressBarRangeInfo
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.onClick
import androidx.compose.ui.semantics.progressBarRangeInfo
import androidx.compose.ui.semantics.role
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.toggleableState
import androidx.compose.ui.state.ToggleableState

/**
 * Centralized Design System modifier extension for buttons.
 * Enforces standard button role and click labels for WCAG SC 4.1.2 compliance.
 */
fun Modifier.accessibleButton(
    onClickLabel: String? = null,
    enabled: Boolean = true,
    onClick: (() -> Unit)? = null
): Modifier = if (onClick != null) {
    this.clickable(
        enabled = enabled,
        onClickLabel = onClickLabel,
        role = Role.Button,
        onClick = onClick
    )
} else {
    this.semantics(mergeDescendants = true) {
        role = Role.Button
        if (onClickLabel != null) {
            onClick(label = onClickLabel) { false }
        }
    }
}

/**
 * Centralized Design System modifier extension for chips, tags, and selectable controls.
 * Encapsulates selection state, role assignment, and interaction feedback.
 */
fun Modifier.accessibleSelectable(
    selected: Boolean,
    enabled: Boolean = true,
    role: Role? = Role.Tab,
    onClickLabel: String? = null,
    onClick: (() -> Unit)? = null
): Modifier = if (onClick != null) {
    this.selectable(
        selected = selected,
        enabled = enabled,
        role = role ?: Role.Tab,
        onClick = onClick
    )
} else {
    this.semantics(mergeDescendants = true) {
        this.selected = selected
        if (role != null) {
            this.role = role
        }
        if (onClickLabel != null) {
            onClick(label = onClickLabel) { false }
        }
    }
}

/**
 * Centralized accessible toggle row primitive that wraps row layouts and child switches
 * into a single merged accessibility node with Role.Switch semantics.
 */
@Composable
fun AccessibleToggleRow(
    checked: Boolean,
    onCheckedChange: ((Boolean) -> Unit)?,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    horizontalArrangement: Arrangement.Horizontal = Arrangement.Start,
    verticalAlignment: Alignment.Vertical = Alignment.CenterVertically,
    content: @Composable RowScope.() -> Unit
) {
    val toggleModifier = if (onCheckedChange != null) {
        Modifier.toggleable(
            value = checked,
            enabled = enabled,
            role = Role.Switch,
            onValueChange = onCheckedChange
        )
    } else {
        Modifier.semantics(mergeDescendants = true) {
            role = Role.Switch
            toggleableState = ToggleableState(checked)
        }
    }

    Row(
        modifier = modifier.then(toggleModifier),
        horizontalArrangement = horizontalArrangement,
        verticalAlignment = verticalAlignment,
        content = content
    )
}

/**
 * Centralized rating group composable foundation that handles rating state calculations,
 * range semantics, and merged screen reader description text.
 */
@Composable
fun AccessibleRatingGroup(
    rating: Float?,
    maxStars: Int = 5,
    modifier: Modifier = Modifier,
    onRatingChange: ((Int?) -> Unit)? = null,
    starContent: @Composable (starIndex: Int, isFilled: Boolean) -> Unit
) {
    val displayRating = rating ?: 0f
    val formattedRating = if (displayRating % 1f == 0f) displayRating.toInt().toString() else displayRating.toString()
    val groupDescription = "$formattedRating out of $maxStars stars"

    Row(
        modifier = modifier.semantics(mergeDescendants = (onRatingChange == null)) {
            contentDescription = groupDescription
            if (onRatingChange != null) {
                progressBarRangeInfo = ProgressBarRangeInfo(
                    current = displayRating,
                    range = 0f..maxStars.toFloat()
                )
            }
        },
        horizontalArrangement = Arrangement.Start,
        verticalAlignment = Alignment.CenterVertically
    ) {
        repeat(maxStars) { index ->
            val starNumber = index + 1
            val isFilled = rating != null && starNumber <= rating
            starContent(index, isFilled)
        }
    }
}
