package com.universalmedialibrary.ui.components

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp

/**
 * Enhanced button with loading state
 */
@Composable
fun LoadingButton(
    onClick: () -> Unit,
    text: String,
    isLoading: Boolean = false,
    icon: ImageVector? = null,
    enabled: Boolean = true,
    modifier: Modifier = Modifier
) {
    Button(
        onClick = onClick,
        enabled = enabled && !isLoading,
        modifier = modifier.height(48.dp)
    ) {
        AnimatedVisibility(
            visible = isLoading,
            enter = fadeIn() + scaleIn(),
            exit = fadeOut() + scaleOut()
        ) {
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                CircularProgressIndicator(
                    modifier = Modifier.size(20.dp),
                    strokeWidth = 2.dp,
                    color = MaterialTheme.colorScheme.onPrimary
                )
            }
        }
        
        AnimatedVisibility(
            visible = !isLoading,
            enter = fadeIn() + scaleIn(),
            exit = fadeOut() + scaleOut()
        ) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                if (icon != null) {
                    Icon(
                        icon,
                        contentDescription = null,
                        modifier = Modifier.size(20.dp)
                    )
                }
                Text(text)
            }
        }
    }
}

/**
 * Floating action button with label
 */
@OptIn(ExperimentalAnimationApi::class)
@Composable
fun LabeledFab(
    onClick: () -> Unit,
    icon: ImageVector,
    text: String,
    expanded: Boolean = true,
    modifier: Modifier = Modifier
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.92f else 1f,
        animationSpec = spring(dampingRatio = Spring.DampingRatioMediumBouncy),
        label = "fabScale"
    )
    
    FloatingActionButton(
        onClick = onClick,
        modifier = modifier.scale(scale),
        interactionSource = interactionSource
    ) {
        AnimatedContent(
            targetState = expanded,
            transitionSpec = {
                slideInHorizontally { it } + fadeIn() with
                        slideOutHorizontally { -it } + fadeOut()
            },
            label = "fabContent"
        ) { isExpanded ->
            if (isExpanded) {
                Row(
                    modifier = Modifier.padding(horizontal = 16.dp),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(icon, contentDescription = text)
                    Text(text)
                }
            } else {
                Icon(icon, contentDescription = text)
            }
        }
    }
}

/**
 * Chip with selection animation
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AnimatedFilterChip(
    selected: Boolean,
    onClick: () -> Unit,
    label: String,
    icon: ImageVector? = null,
    modifier: Modifier = Modifier
) {
    val scale by animateFloatAsState(
        targetValue = if (selected) 1.05f else 1f,
        animationSpec = spring(dampingRatio = Spring.DampingRatioMediumBouncy),
        label = "chipScale"
    )
    
    FilterChip(
        selected = selected,
        onClick = onClick,
        label = { Text(label) },
        leadingIcon = if (icon != null && selected) {
            {
                Icon(
                    icon,
                    contentDescription = null,
                    modifier = Modifier.size(18.dp)
                )
            }
        } else null,
        modifier = modifier.scale(scale),
        border = if (selected) {
            BorderStroke(2.dp, MaterialTheme.colorScheme.primary)
        } else {
            FilterChipDefaults.filterChipBorder(
                enabled = true,
                selected = false
            )
        }
    )
}

/**
 * Icon button with ripple effect
 */
@Composable
fun EnhancedIconButton(
    onClick: () -> Unit,
    icon: ImageVector,
    contentDescription: String?,
    tint: androidx.compose.ui.graphics.Color = LocalContentColor.current,
    modifier: Modifier = Modifier
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.85f else 1f,
        animationSpec = spring(dampingRatio = Spring.DampingRatioMediumBouncy),
        label = "iconScale"
    )
    
    IconButton(
        onClick = onClick,
        modifier = modifier.scale(scale),
        interactionSource = interactionSource
    ) {
        Icon(
            icon,
            contentDescription = contentDescription,
            tint = tint
        )
    }
}

/**
 * Segmented button group
 */
@Composable
fun <T> SegmentedButtonGroup(
    options: List<Pair<T, String>>,
    selectedOption: T,
    onOptionSelected: (T) -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier,
        shape = MaterialTheme.shapes.medium,
        border = BorderStroke(1.dp, MaterialTheme.colorScheme.outline)
    ) {
        Row {
            options.forEachIndexed { index, (value, label) ->
                val isSelected = value == selectedOption
                val backgroundColor by animateColorAsState(
                    targetValue = if (isSelected) {
                        MaterialTheme.colorScheme.primaryContainer
                    } else {
                        MaterialTheme.colorScheme.surface
                    },
                    animationSpec = tween(200),
                    label = "backgroundColor"
                )
                
                Surface(
                    onClick = { onOptionSelected(value) },
                    modifier = Modifier.weight(1f),
                    color = backgroundColor
                ) {
                    Box(
                        modifier = Modifier.padding(vertical = 12.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        Text(
                            text = label,
                            style = MaterialTheme.typography.labelLarge,
                            color = if (isSelected) {
                                MaterialTheme.colorScheme.onPrimaryContainer
                            } else {
                                MaterialTheme.colorScheme.onSurface
                            }
                        )
                    }
                }
                
                if (index < options.lastIndex) {
                    Divider(
                        modifier = Modifier
                            .width(1.dp)
                            .fillMaxHeight(),
                        color = MaterialTheme.colorScheme.outline
                    )
                }
            }
        }
    }
}

/**
 * Action button with badge
 */
@Composable
fun BadgedButton(
    onClick: () -> Unit,
    text: String,
    badgeCount: Int = 0,
    icon: ImageVector? = null,
    modifier: Modifier = Modifier
) {
    BadgedBox(
        badge = {
            if (badgeCount > 0) {
                Badge {
                    Text(
                        text = if (badgeCount > 99) "99+" else badgeCount.toString(),
                        style = MaterialTheme.typography.labelSmall
                    )
                }
            }
        }
    ) {
        Button(
            onClick = onClick,
            modifier = modifier
        ) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                if (icon != null) {
                    Icon(icon, contentDescription = null)
                }
                Text(text)
            }
        }
    }
}
