package com.universalmedialibrary.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.dp
import me.saket.swipe.SwipeAction
import me.saket.swipe.SwipeableActionsBox
import me.saket.swipe.rememberSwipeableActionsState

/**
 * Swipeable Library Item Component (Phase 2)
 * 
 * Provides swipe gestures for common library actions:
 * - Swipe left: Delete
 * - Swipe right: Archive/Mark as Read
 * 
 * Inspired by Myne's swipe actions with Material You design.
 */
@Composable
fun SwipeableLibraryItem(
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    onDelete: (() -> Unit)? = null,
    onArchive: (() -> Unit)? = null,
    onMarkAsRead: (() -> Unit)? = null,
    onBookmark: (() -> Unit)? = null,
    content: @Composable () -> Unit
) {
    if (!enabled) {
        // If swipe actions are disabled, just show the content
        content()
        return
    }
    
    val state = rememberSwipeableActionsState()
    
    // Define swipe actions
    val startActions = buildList {
        // Right swipe actions (left side)
        if (onMarkAsRead != null) {
            add(
                SwipeAction(
                    icon = {
                        SwipeActionIcon(
                            icon = Icons.Default.Check,
                            description = "Mark as read",
                            tint = Color.White
                        )
                    },
                    background = MaterialTheme.colorScheme.primary,
                    onSwipe = onMarkAsRead
                )
            )
        }
        if (onArchive != null) {
            add(
                SwipeAction(
                    icon = {
                        SwipeActionIcon(
                            icon = Icons.Default.Archive,
                            description = "Archive",
                            tint = Color.White
                        )
                    },
                    background = MaterialTheme.colorScheme.tertiary,
                    onSwipe = onArchive
                )
            )
        }
    }
    
    val endActions = buildList {
        // Left swipe actions (right side)
        if (onBookmark != null) {
            add(
                SwipeAction(
                    icon = {
                        SwipeActionIcon(
                            icon = Icons.Default.Bookmark,
                            description = "Bookmark",
                            tint = Color.White
                        )
                    },
                    background = MaterialTheme.colorScheme.secondary,
                    onSwipe = onBookmark
                )
            )
        }
        if (onDelete != null) {
            add(
                SwipeAction(
                    icon = {
                        SwipeActionIcon(
                            icon = Icons.Default.Delete,
                            description = "Delete",
                            tint = Color.White
                        )
                    },
                    background = MaterialTheme.colorScheme.error,
                    onSwipe = onDelete
                )
            )
        }
    }
    
    SwipeableActionsBox(
        modifier = modifier,
        state = state,
        startActions = startActions,
        endActions = endActions,
        swipeThreshold = 80.dp
    ) {
        content()
    }
}

@Composable
private fun SwipeActionIcon(
    icon: ImageVector,
    description: String,
    tint: Color
) {
    Box(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 24.dp),
        contentAlignment = Alignment.Center
    ) {
        Icon(
            imageVector = icon,
            contentDescription = description,
            tint = tint,
            modifier = Modifier.size(24.dp)
        )
    }
}

/**
 * Preset swipe action configurations
 */
object SwipeActionPresets {
    @Composable
    fun LibraryBook(
        onDelete: () -> Unit,
        onMarkAsRead: () -> Unit,
        content: @Composable () -> Unit
    ) {
        SwipeableLibraryItem(
            onDelete = onDelete,
            onMarkAsRead = onMarkAsRead,
            content = content
        )
    }
    
    @Composable
    fun LibraryMusic(
        onDelete: () -> Unit,
        onBookmark: () -> Unit,
        content: @Composable () -> Unit
    ) {
        SwipeableLibraryItem(
            onDelete = onDelete,
            onBookmark = onBookmark,
            content = content
        )
    }
    
    @Composable
    fun LibraryVideo(
        onDelete: () -> Unit,
        onArchive: () -> Unit,
        content: @Composable () -> Unit
    ) {
        SwipeableLibraryItem(
            onDelete = onDelete,
            onArchive = onArchive,
            content = content
        )
    }
}
