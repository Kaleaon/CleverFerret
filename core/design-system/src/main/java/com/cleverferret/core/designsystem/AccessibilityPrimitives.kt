package com.cleverferret.core.designsystem

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.RowScope
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.Role
import com.ktheme.compose.AccessibleRatingGroup as KthemeAccessibleRatingGroup
import com.ktheme.compose.AccessibleToggleRow as KthemeAccessibleToggleRow
import com.ktheme.compose.accessibleButton as kthemeAccessibleButton
import com.ktheme.compose.accessibleSelectable as kthemeAccessibleSelectable

fun Modifier.accessibleButton(
    onClickLabel: String? = null,
    enabled: Boolean = true,
    onClick: (() -> Unit)? = null
): Modifier = kthemeAccessibleButton(
    onClickLabel = onClickLabel,
    enabled = enabled,
    onClick = onClick
)

fun Modifier.accessibleSelectable(
    selected: Boolean,
    enabled: Boolean = true,
    role: Role? = Role.Tab,
    onClickLabel: String? = null,
    onClick: (() -> Unit)? = null
): Modifier = kthemeAccessibleSelectable(
    selected = selected,
    enabled = enabled,
    role = role,
    onClickLabel = onClickLabel,
    onClick = onClick
)

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
    KthemeAccessibleToggleRow(
        checked = checked,
        onCheckedChange = onCheckedChange,
        modifier = modifier,
        enabled = enabled,
        horizontalArrangement = horizontalArrangement,
        verticalAlignment = verticalAlignment,
        content = content
    )
}

@Composable
fun AccessibleRatingGroup(
    rating: Float?,
    maxStars: Int = 5,
    modifier: Modifier = Modifier,
    onRatingChange: ((Int?) -> Unit)? = null,
    starContent: @Composable (starIndex: Int, isFilled: Boolean) -> Unit
) {
    KthemeAccessibleRatingGroup(
        rating = rating,
        maxStars = maxStars,
        modifier = modifier,
        onRatingChange = onRatingChange,
        starContent = starContent
    )
}
