package com.universalmedialibrary.ui.plex.components

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
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Common Plex UI Components
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
fun PlexMiniPlayer(
    state: com.universalmedialibrary.ui.plex.MiniPlayerState,
    onTap: () -> Unit,
    onPlayPause: () -> Unit,
    onNext: () -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onTap),
        color = PlexColors.BackgroundElevated,
        tonalElevation = PlexElevation.MD
    ) {
        Column {
            // Progress bar
            LinearProgressIndicator(
                progress = { state.progress },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(2.dp),
                color = PlexColors.AccentPrimary,
                trackColor = PlexColors.ProgressBackground
            )
            
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(PlexSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Artwork
                Surface(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(RoundedCornerShape(PlexCorners.XS)),
                    color = PlexColors.BackgroundSurface
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
                            tint = PlexColors.TextTertiary,
                            modifier = Modifier.padding(PlexSpacing.SM)
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(PlexSpacing.MD))
                
                // Title & subtitle
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = state.title,
                        style = PlexTypography.BodyMedium,
                        color = PlexColors.TextPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = state.subtitle,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Controls
                IconButton(onClick = onPlayPause) {
                    Surface(
                        shape = CircleShape,
                        color = PlexColors.AccentPrimary,
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
                        tint = PlexColors.TextSecondary
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
fun PlexLoadingScreen(
    message: String = "Loading...",
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(PlexColors.Background),
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            CircularProgressIndicator(
                color = PlexColors.AccentPrimary,
                modifier = Modifier.size(48.dp)
            )
            
            Spacer(modifier = Modifier.height(PlexSpacing.MD))
            
            Text(
                text = message,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextSecondary
            )
        }
    }
}

@Composable
fun PlexLoadingOverlay(
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
                    .background(PlexColors.Background.copy(alpha = 0.8f)),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator(color = PlexColors.AccentPrimary)
            }
        }
    }
}

// =============================================================================
// ERROR STATES
// =============================================================================

@Composable
fun PlexErrorScreen(
    title: String = "Something went wrong",
    message: String,
    onRetry: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(PlexSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Error,
            contentDescription = null,
            tint = PlexColors.Error,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Text(
            text = title,
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = message,
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        
        if (onRetry != null) {
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
            
            Button(
                onClick = onRetry,
                colors = ButtonDefaults.buttonColors(
                    containerColor = PlexColors.AccentPrimary
                )
            ) {
                Icon(Icons.Default.Refresh, null)
                Spacer(modifier = Modifier.width(PlexSpacing.SM))
                Text("Try Again")
            }
        }
    }
}

// =============================================================================
// EMPTY STATES
// =============================================================================

@Composable
fun PlexEmptyState(
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
            .padding(PlexSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Surface(
            shape = CircleShape,
            color = PlexColors.AccentPrimary.copy(alpha = 0.1f),
            modifier = Modifier.size(96.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = PlexColors.AccentPrimary.copy(alpha = 0.5f),
                modifier = Modifier.padding(PlexSpacing.LG)
            )
        }
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Text(
            text = title,
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = message,
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        
        if (actionLabel != null && onAction != null) {
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
            
            Button(
                onClick = onAction,
                colors = ButtonDefaults.buttonColors(
                    containerColor = PlexColors.AccentPrimary
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
fun PlexConfirmDialog(
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
            Text(title, color = PlexColors.TextPrimary)
        },
        text = {
            Text(message, color = PlexColors.TextSecondary)
        },
        confirmButton = {
            Button(
                onClick = onConfirm,
                colors = ButtonDefaults.buttonColors(
                    containerColor = if (isDestructive) PlexColors.Error else PlexColors.AccentPrimary
                )
            ) {
                Text(confirmLabel)
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text(dismissLabel, color = PlexColors.TextSecondary)
            }
        },
        containerColor = PlexColors.BackgroundElevated
    )
}

@Composable
fun PlexInputDialog(
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
            Text(title, color = PlexColors.TextPrimary)
        },
        text = {
            OutlinedTextField(
                value = value,
                onValueChange = { value = it },
                placeholder = { Text(placeholder) },
                singleLine = true,
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = PlexColors.AccentPrimary,
                    focusedLabelColor = PlexColors.AccentPrimary,
                    cursorColor = PlexColors.AccentPrimary
                )
            )
        },
        confirmButton = {
            Button(
                onClick = { onConfirm(value) },
                enabled = value.isNotBlank(),
                colors = ButtonDefaults.buttonColors(
                    containerColor = PlexColors.AccentPrimary
                )
            ) {
                Text(confirmLabel)
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel", color = PlexColors.TextSecondary)
            }
        },
        containerColor = PlexColors.BackgroundElevated
    )
}

// =============================================================================
// BUTTONS
// =============================================================================

@Composable
fun PlexPrimaryButton(
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
            containerColor = PlexColors.AccentPrimary,
            contentColor = Color.Black
        ),
        shape = RoundedCornerShape(PlexCorners.SM)
    ) {
        if (icon != null) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(PlexSpacing.SM))
        }
        Text(text, fontWeight = FontWeight.SemiBold)
    }
}

@Composable
fun PlexSecondaryButton(
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
            contentColor = PlexColors.TextPrimary
        ),
        border = BorderStroke(1.dp, PlexColors.Border),
        shape = RoundedCornerShape(PlexCorners.SM)
    ) {
        if (icon != null) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(PlexSpacing.SM))
        }
        Text(text)
    }
}

@Composable
fun PlexIconButton(
    icon: ImageVector,
    contentDescription: String?,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    tint: Color = PlexColors.TextSecondary,
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
fun PlexCircularProgress(
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
            color = PlexColors.AccentPrimary,
            trackColor = PlexColors.ProgressBackground,
            strokeWidth = strokeWidth.dp
        )
        
        Text(
            text = "${(progress * 100).toInt()}%",
            style = PlexTypography.LabelSmall,
            color = PlexColors.TextSecondary
        )
    }
}

@Composable
fun PlexLinearProgress(
    progress: Float,
    modifier: Modifier = Modifier,
    height: Int = 4
) {
    LinearProgressIndicator(
        progress = { progress },
        modifier = modifier
            .fillMaxWidth()
            .height(height.dp)
            .clip(RoundedCornerShape(PlexCorners.Full)),
        color = PlexColors.AccentPrimary,
        trackColor = PlexColors.ProgressBackground
    )
}

// =============================================================================
// BADGES & CHIPS
// =============================================================================

@Composable
fun PlexBadge(
    text: String,
    modifier: Modifier = Modifier,
    color: Color = PlexColors.AccentPrimary
) {
    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(PlexCorners.XS),
        color = color.copy(alpha = 0.2f)
    ) {
        Text(
            text = text,
            style = PlexTypography.LabelSmall,
            color = color,
            fontWeight = FontWeight.Medium,
            modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = 2.dp)
        )
    }
}

@Composable
fun PlexChip(
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
            selectedContainerColor = PlexColors.AccentPrimary.copy(alpha = 0.2f),
            selectedLabelColor = PlexColors.AccentPrimary,
            selectedLeadingIconColor = PlexColors.AccentPrimary,
            containerColor = PlexColors.BackgroundElevated,
            labelColor = PlexColors.TextSecondary
        )
    )
}

// =============================================================================
// DIVIDERS
// =============================================================================

@Composable
fun PlexDivider(
    modifier: Modifier = Modifier
) {
    HorizontalDivider(
        modifier = modifier,
        color = PlexColors.Border
    )
}

@Composable
fun PlexSectionDivider(
    title: String,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier
            .fillMaxWidth()
            .padding(vertical = PlexSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        HorizontalDivider(
            modifier = Modifier.weight(1f),
            color = PlexColors.Border
        )
        
        Text(
            text = title,
            style = PlexTypography.LabelSmall,
            color = PlexColors.TextTertiary,
            modifier = Modifier.padding(horizontal = PlexSpacing.MD)
        )
        
        HorizontalDivider(
            modifier = Modifier.weight(1f),
            color = PlexColors.Border
        )
    }
}
