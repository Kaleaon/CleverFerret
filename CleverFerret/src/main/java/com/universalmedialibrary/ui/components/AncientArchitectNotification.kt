package com.universalmedialibrary.ui.components

import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.theme.*

/**
 * Notification types for Ancient Architect theme
 */
enum class NotificationType {
    INFO,
    SUCCESS,
    WARNING,
    ERROR
}

/**
 * Ancient Architect Notification Box
 * 
 * Features:
 * - Stepped border design (Art Deco)
 * - Color-coded metallic accent
 * - Geometric icon in hexagonal frame
 * - Carved pattern background
 * - Glowing edge for importance
 * - Energy pulse animation
 */
@Composable
fun AncientArchitectNotification(
    message: String,
    type: NotificationType = NotificationType.INFO,
    modifier: Modifier = Modifier,
    title: String? = null,
    icon: ImageVector? = null,
    showIcon: Boolean = true,
    dismissible: Boolean = true,
    onDismiss: (() -> Unit)? = null,
    action: (@Composable () -> Unit)? = null
) {
    val ancientColors = ancientArchitectColors()
    val enablePatterns = geometricPatternsEnabled()
    val enableGlow = crystalGlowEnabled()
    
    // Get colors based on notification type
    val (accentColor, glowColor, defaultIcon) = when (type) {
        NotificationType.INFO -> Triple(
            ancientColors.accent.info,
            ancientColors.crystal.secondary,
            Icons.Default.Info
        )
        NotificationType.SUCCESS -> Triple(
            ancientColors.accent.success,
            ancientColors.crystal.primary,
            Icons.Default.CheckCircle
        )
        NotificationType.WARNING -> Triple(
            ancientColors.accent.warning,
            ancientColors.crystal.warning,
            Icons.Default.Warning
        )
        NotificationType.ERROR -> Triple(
            ancientColors.accent.error,
            ancientColors.crystal.error,
            Icons.Default.Error
        )
    }
    
    // Pulse animation for glow
    val infiniteTransition = rememberInfiniteTransition(label = "notificationPulse")
    val pulseAlpha by infiniteTransition.animateFloat(
        initialValue = 0.3f,
        targetValue = 0.7f,
        animationSpec = infiniteRepeatable(
            animation = tween(1500, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "pulseAlpha"
    )
    
    Box(
        modifier = modifier
            .fillMaxWidth()
            .drawBehind {
                // Glowing edge effect
                if (enableGlow) {
                    drawRect(
                        brush = Brush.verticalGradient(
                            colors = listOf(
                                glowColor.copy(alpha = pulseAlpha * 0.3f),
                                Color.Transparent
                            )
                        )
                    )
                }
                
                // Background pattern
                if (enablePatterns) {
                    with(AncientArchitectPatterns) {
                        drawDiamondGrid(
                            color = ancientColors.stone.text,
                            alpha = 0.02f,
                            cellSize = 30f
                        )
                    }
                }
            }
            .clip(AncientArchitectShapes.steppedMedium)
            .background(ancientColors.stone.surface)
            .border(
                width = 2.dp,
                brush = Brush.linearGradient(
                    colors = listOf(
                        accentColor,
                        accentColor.copy(alpha = 0.6f),
                        accentColor
                    )
                ),
                shape = AncientArchitectShapes.steppedMedium
            )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Icon in hexagonal frame
            if (showIcon) {
                Box(
                    modifier = Modifier
                        .size(40.dp)
                        .clip(AncientArchitectShapes.hexagon)
                        .background(
                            brush = Brush.radialGradient(
                                colors = listOf(
                                    accentColor.copy(alpha = 0.3f),
                                    accentColor.copy(alpha = 0.1f)
                                )
                            )
                        )
                        .border(
                            width = 2.dp,
                            color = accentColor,
                            shape = AncientArchitectShapes.hexagon
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = icon ?: defaultIcon,
                        contentDescription = null,
                        tint = accentColor,
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
            
            // Content
            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                if (title != null) {
                    Text(
                        text = title,
                        style = MaterialTheme.typography.titleMedium,
                        color = ancientColors.stone.text
                    )
                }
                Text(
                    text = message,
                    style = MaterialTheme.typography.bodyMedium,
                    color = ancientColors.stone.text.copy(alpha = 0.9f)
                )
            }
            
            // Action button
            if (action != null) {
                action()
            }
            
            // Dismiss button
            if (dismissible && onDismiss != null) {
                IconButton(
                    onClick = onDismiss,
                    modifier = Modifier.size(32.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.Close,
                        contentDescription = "Dismiss",
                        tint = ancientColors.stone.text.copy(alpha = 0.6f),
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}

/**
 * Ancient Architect Snackbar
 */
@Composable
fun AncientArchitectSnackbar(
    snackbarData: SnackbarData,
    modifier: Modifier = Modifier,
    type: NotificationType = NotificationType.INFO
) {
    val ancientColors = ancientArchitectColors()
    
    val accentColor = when (type) {
        NotificationType.INFO -> ancientColors.accent.info
        NotificationType.SUCCESS -> ancientColors.accent.success
        NotificationType.WARNING -> ancientColors.accent.warning
        NotificationType.ERROR -> ancientColors.accent.error
    }
    
    Snackbar(
        modifier = modifier
            .padding(12.dp)
            .clip(AncientArchitectShapes.beveledMedium)
            .border(
                width = 2.dp,
                color = accentColor,
                shape = AncientArchitectShapes.beveledMedium
            ),
        action = {
            snackbarData.visuals.actionLabel?.let { actionLabel ->
                AncientArchitectTextButton(
                    onClick = { snackbarData.performAction() }
                ) {
                    Text(actionLabel)
                }
            }
        },
        dismissAction = {
            if (snackbarData.visuals.withDismissAction) {
                IconButton(
                    onClick = { snackbarData.dismiss() }
                ) {
                    Icon(
                        imageVector = Icons.Default.Close,
                        contentDescription = "Dismiss"
                    )
                }
            }
        },
        shape = AncientArchitectShapes.beveledMedium,
        containerColor = ancientColors.stone.surface,
        contentColor = ancientColors.stone.text,
        actionContentColor = accentColor
    ) {
        Text(snackbarData.visuals.message)
    }
}

/**
 * Ancient Architect Alert Dialog
 */
@Composable
fun AncientArchitectAlertDialog(
    onDismissRequest: () -> Unit,
    confirmButton: @Composable () -> Unit,
    modifier: Modifier = Modifier,
    dismissButton: (@Composable () -> Unit)? = null,
    icon: (@Composable () -> Unit)? = null,
    title: (@Composable () -> Unit)? = null,
    text: (@Composable () -> Unit)? = null,
    type: NotificationType = NotificationType.INFO
) {
    val ancientColors = ancientArchitectColors()
    val enablePatterns = geometricPatternsEnabled()
    
    val accentColor = when (type) {
        NotificationType.INFO -> ancientColors.accent.info
        NotificationType.SUCCESS -> ancientColors.accent.success
        NotificationType.WARNING -> ancientColors.accent.warning
        NotificationType.ERROR -> ancientColors.accent.error
    }
    
    AlertDialog(
        onDismissRequest = onDismissRequest,
        confirmButton = confirmButton,
        modifier = modifier
            .drawBehind {
                // Background pattern
                if (enablePatterns) {
                    with(AncientArchitectPatterns) {
                        drawDiamondGrid(
                            color = ancientColors.stone.text,
                            alpha = 0.03f,
                            cellSize = 40f
                        )
                        drawCornerDecorations(
                            color = accentColor,
                            alpha = 0.5f,
                            size = 20f
                        )
                    }
                }
            }
            .border(
                width = 3.dp,
                brush = Brush.linearGradient(
                    colors = listOf(
                        accentColor,
                        accentColor.copy(alpha = 0.6f),
                        accentColor
                    )
                ),
                shape = AncientArchitectShapes.steppedLarge
            ),
        dismissButton = dismissButton,
        icon = icon,
        title = title,
        text = text,
        shape = AncientArchitectShapes.steppedLarge,
        containerColor = ancientColors.stone.surface,
        iconContentColor = accentColor,
        titleContentColor = ancientColors.stone.text,
        textContentColor = ancientColors.stone.text.copy(alpha = 0.9f)
    )
}