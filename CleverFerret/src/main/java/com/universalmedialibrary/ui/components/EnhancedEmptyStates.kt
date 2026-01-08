package com.universalmedialibrary.ui.components

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp

/**
 * Enhanced empty state with animation
 */
@Composable
fun EnhancedEmptyState(
    icon: ImageVector,
    title: String,
    description: String,
    actionText: String? = null,
    onAction: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    var visible by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        visible = true
    }
    
    AnimatedVisibility(
        visible = visible,
        enter = fadeIn(animationSpec = tween(600)) + 
                scaleIn(initialScale = 0.8f, animationSpec = tween(600)),
        modifier = modifier
    ) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(16.dp),
                modifier = Modifier.padding(48.dp)
            ) {
                // Animated icon
                val infiniteTransition = rememberInfiniteTransition(label = "icon")
                val iconScale by infiniteTransition.animateFloat(
                    initialValue = 1f,
                    targetValue = 1.1f,
                    animationSpec = infiniteRepeatable(
                        animation = tween(2000, easing = FastOutSlowInEasing),
                        repeatMode = RepeatMode.Reverse
                    ),
                    label = "iconScale"
                )
                
                Surface(
                    modifier = Modifier
                        .size(120.dp)
                        .scale(iconScale),
                    shape = MaterialTheme.shapes.extraLarge,
                    color = MaterialTheme.colorScheme.primaryContainer
                ) {
                    Box(contentAlignment = Alignment.Center) {
                        Icon(
                            icon,
                            contentDescription = null,
                            modifier = Modifier.size(64.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Text(
                    text = title,
                    style = MaterialTheme.typography.headlineSmall,
                    color = MaterialTheme.colorScheme.onSurface,
                    textAlign = TextAlign.Center
                )
                
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    textAlign = TextAlign.Center
                )
                
                if (actionText != null && onAction != null) {
                    Spacer(modifier = Modifier.height(8.dp))
                    Button(
                        onClick = onAction,
                        modifier = Modifier.fillMaxWidth(0.6f)
                    ) {
                        Text(actionText)
                    }
                }
            }
        }
    }
}

/**
 * Enhanced error state with retry animation
 */
@Composable
fun EnhancedErrorState(
    title: String = "Something Went Wrong",
    message: String,
    onRetry: (() -> Unit)? = null,
    onDismiss: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    var visible by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        visible = true
    }
    
    AnimatedVisibility(
        visible = visible,
        enter = fadeIn(animationSpec = tween(400)) + slideInVertically(
            initialOffsetY = { it / 2 },
            animationSpec = tween(400, easing = FastOutSlowInEasing)
        ),
        modifier = modifier
    ) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Card(
                modifier = Modifier
                    .fillMaxWidth(0.9f)
                    .padding(24.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.errorContainer
                )
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(16.dp),
                    modifier = Modifier.padding(24.dp)
                ) {
                    Icon(
                        Icons.Default.ErrorOutline,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = MaterialTheme.colorScheme.error
                    )
                    
                    Text(
                        text = title,
                        style = MaterialTheme.typography.titleLarge,
                        color = MaterialTheme.colorScheme.onErrorContainer,
                        textAlign = TextAlign.Center
                    )
                    
                    Text(
                        text = message,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onErrorContainer,
                        textAlign = TextAlign.Center
                    )
                    
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        if (onDismiss != null) {
                            OutlinedButton(
                                onClick = onDismiss,
                                modifier = Modifier.weight(1f),
                                colors = ButtonDefaults.outlinedButtonColors(
                                    contentColor = MaterialTheme.colorScheme.error
                                )
                            ) {
                                Text("Dismiss")
                            }
                        }
                        
                        if (onRetry != null) {
                            Button(
                                onClick = onRetry,
                                modifier = Modifier.weight(1f),
                                colors = ButtonDefaults.buttonColors(
                                    containerColor = MaterialTheme.colorScheme.error,
                                    contentColor = MaterialTheme.colorScheme.onError
                                )
                            ) {
                                Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                                Spacer(modifier = Modifier.width(8.dp))
                                Text("Retry")
                            }
                        }
                    }
                }
            }
        }
    }
}

/**
 * No results state for search
 */
@Composable
fun NoResultsState(
    query: String,
    onClearFilters: (() -> Unit)? = null,
    modifier: Modifier = Modifier
) {
    EnhancedEmptyState(
        icon = Icons.Default.SearchOff,
        title = "No Results Found",
        description = "We couldn't find anything matching \"$query\"",
        actionText = if (onClearFilters != null) "Clear Filters" else null,
        onAction = onClearFilters,
        modifier = modifier
    )
}

/**
 * No recommendations state
 */
@Composable
fun NoRecommendationsState(
    onExploreLibrary: () -> Unit,
    modifier: Modifier = Modifier
) {
    EnhancedEmptyState(
        icon = Icons.Default.AutoAwesome,
        title = "No Recommendations Yet",
        description = "Start exploring your library to get personalized recommendations based on your interests",
        actionText = "Explore Library",
        onAction = onExploreLibrary,
        modifier = modifier
    )
}

/**
 * Empty library state
 */
@Composable
fun EmptyLibraryState(
    onAddMedia: () -> Unit,
    modifier: Modifier = Modifier
) {
    EnhancedEmptyState(
        icon = Icons.Default.LibraryAdd,
        title = "Your Library is Empty",
        description = "Add your first media items to start building your collection",
        actionText = "Add Media",
        onAction = onAddMedia,
        modifier = modifier
    )
}

/**
 * No sync conflicts state
 */
@Composable
fun NoConflictsState(
    modifier: Modifier = Modifier
) {
    EnhancedEmptyState(
        icon = Icons.Default.CheckCircle,
        title = "All Synced Up!",
        description = "No sync conflicts detected. Your data is synchronized across all devices.",
        modifier = modifier
    )
}
