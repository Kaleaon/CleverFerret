package com.universalmedialibrary.ui.components

import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp

/**
 * Enhanced Common Components with Metallic Styling
 * 
 * Additional UI components that complement the existing CommonCards.kt
 * Note: EmptyStateCard, InfoBanner, SectionHeader, and StatsCard already exist in CommonCards.kt
 */

/**
 * Enhanced Info Banner - dismissible notification/message banner with types
 */
@Composable
fun DismissibleInfoBanner(
    message: String,
    type: BannerType = BannerType.INFO,
    dismissible: Boolean = true,
    onDismiss: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    var visible by remember { mutableStateOf(true) }
    
    AnimatedVisibility(
        visible = visible,
        enter = expandVertically() + fadeIn(),
        exit = shrinkVertically() + fadeOut()
    ) {
        Card(
            modifier = modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 8.dp),
            colors = CardDefaults.cardColors(
                containerColor = type.backgroundColor
            ),
            shape = RoundedCornerShape(8.dp)
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = type.icon,
                    contentDescription = null,
                    tint = type.iconColor,
                    modifier = Modifier.size(24.dp)
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
                Text(
                    text = message,
                    style = MaterialTheme.typography.bodyMedium,
                    color = type.textColor,
                    modifier = Modifier.weight(1f)
                )
                
                if (dismissible) {
                    IconButton(
                        onClick = {
                            visible = false
                            onDismiss?.invoke()
                        }
                    ) {
                        Icon(
                            imageVector = Icons.Default.Close,
                            contentDescription = "Dismiss",
                            tint = type.iconColor
                        )
                    }
                }
            }
        }
    }
}

/**
 * Banner types for DismissibleInfoBanner
 */
enum class BannerType(
    val icon: ImageVector,
    val backgroundColor: Color,
    val iconColor: Color,
    val textColor: Color
) {
    INFO(
        icon = Icons.Default.Info,
        backgroundColor = Color(0xFF1976D2),
        iconColor = Color.White,
        textColor = Color.White
    ),
    SUCCESS(
        icon = Icons.Default.CheckCircle,
        backgroundColor = Color(0xFF388E3C),
        iconColor = Color.White,
        textColor = Color.White
    ),
    WARNING(
        icon = Icons.Default.Warning,
        backgroundColor = Color(0xFFF57C00),
        iconColor = Color.White,
        textColor = Color.White
    ),
    ERROR(
        icon = Icons.Default.Error,
        backgroundColor = Color(0xFFD32F2F),
        iconColor = Color.White,
        textColor = Color.White
    )
}

/**
 * Tag Chip - small chip for labels and categories
 */
@Composable
fun TagChip(
    label: String,
    color: Color = MaterialTheme.colorScheme.primaryContainer,
    onTextColor: Color = MaterialTheme.colorScheme.onPrimaryContainer,
    onClick: (() -> Unit)? = null,
    onRemove: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    if (onRemove != null) {
        // Use AssistChip when removable
        AssistChip(
            onClick = { onClick?.invoke() },
            label = {
                Text(
                    text = label,
                    style = MaterialTheme.typography.labelMedium
                )
            },
            modifier = modifier,
            colors = AssistChipDefaults.assistChipColors(
                containerColor = color,
                labelColor = onTextColor
            ),
            trailingIcon = {
                IconButton(
                    onClick = onRemove,
                    modifier = Modifier.size(18.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.Close,
                        contentDescription = "Remove",
                        tint = onTextColor,
                        modifier = Modifier.size(14.dp)
                    )
                }
            }
        )
    } else {
        // Use SuggestionChip when not removable
        SuggestionChip(
            onClick = { onClick?.invoke() },
            label = {
                Text(
                    text = label,
                    style = MaterialTheme.typography.labelMedium
                )
            },
            modifier = modifier,
            colors = SuggestionChipDefaults.suggestionChipColors(
                containerColor = color,
                labelColor = onTextColor
            )
        )
    }
}
