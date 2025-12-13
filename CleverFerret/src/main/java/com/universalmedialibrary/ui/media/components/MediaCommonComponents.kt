package com.universalmedialibrary.ui.media.components

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.theme.*

/**
 * Common Media UI Components
 * 
 * Reusable components used across multiple screens:
 * - Mini Player
 * - Loading states
 * - Error states
 * - Dialogs
 * - Buttons
 * - Progress indicators
 */

// =============================================================================
// MINI PLAYER
// =============================================================================

@Composable
fun MediaMiniPlayer(
    state: com.universalmedialibrary.ui.media.MiniPlayerState,
    onTap: () -> Unit,
    onPlayPause: () -> Unit,
    onNext: () -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onTap),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.MD
    ) {
        Column {
            // Progress bar
            LinearProgressIndicator(
                progress = { state.progress },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(2.dp),
                color = MediaColors.AccentPrimary,
                trackColor = MediaColors.ProgressBackground
            )
            
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Artwork
                Surface(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(RoundedCornerShape(MediaCorners.XS)),
                    color = MediaColors.BackgroundSurface
                ) {
                    if (state.artworkUrl != null) {
                        AsyncImage(
                            model = state.artworkUrl,
                            contentDescription = null,
                            contentScale = ContentScale.Crop,
                            modifier = Modifier.fillMaxSize()
                        )
                    } else {
                        Icon(
                            imageVector = when (state.playerType) {
                                "music" -> Icons.Default.MusicNote
                                "audiobook" -> Icons.Default.Headphones
                                "podcast" -> Icons.Default.Podcasts
                                else -> Icons.Default.PlayArrow
                            },
                            contentDescription = null,
                            tint = MediaColors.TextTertiary,
                            modifier = Modifier.padding(MediaSpacing.SM)
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
                
                // Title & subtitle
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = state.title,
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = state.subtitle,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Controls
                IconButton(onClick = onPlayPause) {
                    Surface(
                        shape = CircleShape,
                        color = MediaColors.AccentPrimary,
                        modifier = Modifier.size(36.dp)
                    ) {
                        Icon(
                            imageVector = if (state.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            contentDescription = if (state.isPlaying) "Pause" else "Play",
                            tint = Color.Black,
                            modifier = Modifier.padding(6.dp)
                        )
                    }
                }
                
                IconButton(onClick = onNext) {
                    Icon(
                        imageVector = Icons.Default.SkipNext,
                        contentDescription = "Next",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}

// =============================================================================
// LOADING STATES
// =============================================================================

@Composable
fun MediaLoadingScreen(
    message: String = "Loading...",
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(MediaColors.Background),
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            CircularProgressIndicator(
                color = MediaColors.AccentPrimary,
                modifier = Modifier.size(48.dp)
            )
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            
            Text(
                text = message,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextSecondary
            )
        }
    }
}

@Composable
fun MediaLoadingOverlay(
    isLoading: Boolean,
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit
) {
    Box(modifier = modifier) {
        content()
        
        AnimatedVisibility(
            visible = isLoading,
            enter = fadeIn(),
            exit = fadeOut()
        ) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(MediaColors.Background.copy(alpha = 0.8f)),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator(color = MediaColors.AccentPrimary)
            }
        }
    }
}

// =============================================================================
// ERROR STATES
// =============================================================================

@Composable
fun MediaErrorScreen(
    title: String = "Something went wrong",
    message: String,
    onRetry: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Error,
            contentDescription = null,
            tint = MediaColors.Error,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = title,
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = message,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        
        if (onRetry != null) {
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
            
            Button(
                onClick = onRetry,
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Icon(Icons.Default.Refresh, null)
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text("Try Again")
            }
        }
    }
}

// =============================================================================
// EMPTY STATES
// =============================================================================

@Composable
fun MediaEmptyState(
    icon: ImageVector,
    title: String,
    message: String,
    actionLabel: String? = null,
    onAction: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Surface(
            shape = CircleShape,
            color = MediaColors.AccentPrimary.copy(alpha = 0.1f),
            modifier = Modifier.size(96.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = MediaColors.AccentPrimary.copy(alpha = 0.5f),
                modifier = Modifier.padding(MediaSpacing.LG)
            )
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = title,
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = message,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        
        if (actionLabel != null && onAction != null) {
            Spacer(modifier = Modifier.height(MediaSpacing.LG))
            
            Button(
                onClick = onAction,
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Text(actionLabel)
            }
        }
    }
}

// =============================================================================
// DIALOGS
// =============================================================================

@Composable
fun MediaConfirmDialog(
    title: String,
    message: String,
    confirmLabel: String = "Confirm",
    dismissLabel: String = "Cancel",
    isDestructive: Boolean = false,
    onConfirm: () -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(title, color = MediaColors.TextPrimary)
        },
        text = {
            Text(message, color = MediaColors.TextSecondary)
        },
        confirmButton = {
            Button(
                onClick = onConfirm,
                colors = ButtonDefaults.buttonColors(
                    containerColor = if (isDestructive) MediaColors.Error else MediaColors.AccentPrimary
                )
            ) {
                Text(confirmLabel)
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text(dismissLabel, color = MediaColors.TextSecondary)
            }
        },
        containerColor = MediaColors.BackgroundElevated
    )
}

@Composable
fun MediaInputDialog(
    title: String,
    placeholder: String = "",
    initialValue: String = "",
    confirmLabel: String = "Save",
    onConfirm: (String) -> Unit,
    onDismiss: () -> Unit
) {
    var value by remember { mutableStateOf(initialValue) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(title, color = MediaColors.TextPrimary)
        },
        text = {
            OutlinedTextField(
                value = value,
                onValueChange = { value = it },
                placeholder = { Text(placeholder) },
                singleLine = true,
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = MediaColors.AccentPrimary,
                    focusedLabelColor = MediaColors.AccentPrimary,
                    cursorColor = MediaColors.AccentPrimary
                )
            )
        },
        confirmButton = {
            Button(
                onClick = { onConfirm(value) },
                enabled = value.isNotBlank(),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Text(confirmLabel)
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel", color = MediaColors.TextSecondary)
            }
        },
        containerColor = MediaColors.BackgroundElevated
    )
}

// =============================================================================
// BUTTONS
// =============================================================================

@Composable
fun MediaPrimaryButton(
    text: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    icon: ImageVector? = null,
    enabled: Boolean = true
) {
    Button(
        onClick = onClick,
        modifier = modifier,
        enabled = enabled,
        colors = ButtonDefaults.buttonColors(
            containerColor = MediaColors.AccentPrimary,
            contentColor = Color.Black
        ),
        shape = RoundedCornerShape(MediaCorners.SM)
    ) {
        if (icon != null) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
        }
        Text(text, fontWeight = FontWeight.SemiBold)
    }
}

@Composable
fun MediaSecondaryButton(
    text: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    icon: ImageVector? = null,
    enabled: Boolean = true
) {
    OutlinedButton(
        onClick = onClick,
        modifier = modifier,
        enabled = enabled,
        colors = ButtonDefaults.outlinedButtonColors(
            contentColor = MediaColors.TextPrimary
        ),
        border = BorderStroke(1.dp, MediaColors.Border),
        shape = RoundedCornerShape(MediaCorners.SM)
    ) {
        if (icon != null) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
        }
        Text(text)
    }
}

@Composable
fun MediaIconButton(
    icon: ImageVector,
    contentDescription: String?,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    tint: Color = MediaColors.TextSecondary,
    enabled: Boolean = true
) {
    IconButton(
        onClick = onClick,
        modifier = modifier,
        enabled = enabled
    ) {
        Icon(
            imageVector = icon,
            contentDescription = contentDescription,
            tint = if (enabled) tint else tint.copy(alpha = 0.5f)
        )
    }
}

// =============================================================================
// PROGRESS INDICATORS
// =============================================================================

@Composable
fun MediaCircularProgress(
    progress: Float,
    modifier: Modifier = Modifier,
    size: Int = 48,
    strokeWidth: Int = 4
) {
    Box(
        modifier = modifier.size(size.dp),
        contentAlignment = Alignment.Center
    ) {
        CircularProgressIndicator(
            progress = { progress },
            modifier = Modifier.fillMaxSize(),
            color = MediaColors.AccentPrimary,
            trackColor = MediaColors.ProgressBackground,
            strokeWidth = strokeWidth.dp
        )
        
        Text(
            text = "${(progress * 100).toInt()}%",
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextSecondary
        )
    }
}

@Composable
fun MediaLinearProgress(
    progress: Float,
    modifier: Modifier = Modifier,
    height: Int = 4
) {
    LinearProgressIndicator(
        progress = { progress },
        modifier = modifier
            .fillMaxWidth()
            .height(height.dp)
            .clip(RoundedCornerShape(MediaCorners.Full)),
        color = MediaColors.AccentPrimary,
        trackColor = MediaColors.ProgressBackground
    )
}

// =============================================================================
// BADGES & CHIPS
// =============================================================================

@Composable
fun MediaBadge(
    text: String,
    modifier: Modifier = Modifier,
    color: Color = MediaColors.AccentPrimary
) {
    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(MediaCorners.XS),
        color = color.copy(alpha = 0.2f)
    ) {
        Text(
            text = text,
            style = MediaTypography.LabelSmall,
            color = color,
            fontWeight = FontWeight.Medium,
            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp)
        )
    }
}

@Composable
fun MediaChip(
    text: String,
    selected: Boolean,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    icon: ImageVector? = null
) {
    FilterChip(
        selected = selected,
        onClick = onClick,
        modifier = modifier,
        label = { Text(text) },
        leadingIcon = if (icon != null) {
            {
                Icon(
                    imageVector = icon,
                    contentDescription = null,
                    modifier = Modifier.size(18.dp)
                )
            }
        } else null,
        colors = FilterChipDefaults.filterChipColors(
            selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
            selectedLabelColor = MediaColors.AccentPrimary,
            selectedLeadingIconColor = MediaColors.AccentPrimary,
            containerColor = MediaColors.BackgroundElevated,
            labelColor = MediaColors.TextSecondary
        )
    )
}

// =============================================================================
// DIVIDERS
// =============================================================================

@Composable
fun MediaDivider(
    modifier: Modifier = Modifier
) {
    HorizontalDivider(
        modifier = modifier,
        color = MediaColors.Border
    )
}

@Composable
fun MediaSectionDivider(
    title: String,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier
            .fillMaxWidth()
            .padding(vertical = MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        HorizontalDivider(
            modifier = Modifier.weight(1f),
            color = MediaColors.Border
        )
        
        Text(
            text = title,
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextTertiary,
            modifier = Modifier.padding(horizontal = MediaSpacing.MD)
        )
        
        HorizontalDivider(
            modifier = Modifier.weight(1f),
            color = MediaColors.Border
        )
    }
}
