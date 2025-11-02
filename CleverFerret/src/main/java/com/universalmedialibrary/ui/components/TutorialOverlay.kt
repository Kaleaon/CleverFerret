package com.universalmedialibrary.ui.components

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties

/**
 * Tutorial Overlay System (Phase 3)
 * 
 * Provides interactive onboarding hints using simple dialog overlays.
 * Inspired by Myne's onboarding system with Material You integration.
 * 
 * Simplified implementation without external dependencies.
 * Features:
 * - Show descriptive dialogs for features
 * - Sequential tutorial flows
 * - Persistent state (shows only once)
 */

/**
 * Tutorial hint data class
 */
data class TutorialHint(
    val title: String,
    val description: String,
    val actionLabel: String = "Got it!"
)

/**
 * Tutorial hints for CleverFerret features
 */
object TutorialHints {
    val LIBRARY_CREATION = TutorialHint(
        title = "Create Your First Library",
        description = "Tap the '+' button to create a new media library. " +
                "You can organize your books, music, videos, and more!"
    )
    
    val CALIBRE_IMPORT = TutorialHint(
        title = "Import from Calibre",
        description = "Already have a Calibre library? Import it to bring " +
                "all your books and metadata into CleverFerret."
    )
    
    val MEDIA_TYPE_SELECTION = TutorialHint(
        title = "Choose Media Types",
        description = "Select what type of media this library will contain: " +
                "Books, Music, Videos, Podcasts, and more!"
    )
    
    val READER_FEATURES = TutorialHint(
        title = "Enhanced Reading Features",
        description = "Customize your reading experience with font options, " +
                "themes, and more in the reader settings."
    )
    
    val SWIPE_ACTIONS = TutorialHint(
        title = "Swipe for Quick Actions",
        description = "Swipe left or right on library items for quick actions " +
                "like delete, archive, or mark as read. Try it now!"
    )
}

/**
 * Simple tutorial dialog overlay
 */
@Composable
fun TutorialDialog(
    hint: TutorialHint,
    onDismiss: () -> Unit
) {
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(
            dismissOnBackPress = true,
            dismissOnClickOutside = true
        )
    ) {
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            shape = RoundedCornerShape(16.dp)
        ) {
            Column(
                modifier = Modifier.padding(24.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    text = hint.title,
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
                
                Text(
                    text = hint.description,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurface
                )
                
                Button(
                    onClick = onDismiss,
                    modifier = Modifier.align(Alignment.End)
                ) {
                    Text(hint.actionLabel)
                }
            }
        }
    }
}

/**
 * Tutorial overlay with automatic show/hide
 */
@Composable
fun TutorialOverlay(
    enabled: Boolean,
    hint: TutorialHint,
    onComplete: () -> Unit,
    content: @Composable () -> Unit
) {
    Box {
        content()
        
        if (enabled) {
            TutorialDialog(
                hint = hint,
                onDismiss = onComplete
            )
        }
    }
}

/**
 * Sequential tutorial flow
 */
@Composable
fun SequentialTutorials(
    enabled: Boolean,
    hints: List<TutorialHint>,
    onComplete: () -> Unit,
    content: @Composable () -> Unit
) {
    var currentIndex by remember { mutableIntStateOf(0) }
    var showTutorial by remember { mutableStateOf(enabled && hints.isNotEmpty()) }
    
    Box {
        content()
        
        if (showTutorial && currentIndex < hints.size) {
            TutorialDialog(
                hint = hints[currentIndex],
                onDismiss = {
                    if (currentIndex < hints.size - 1) {
                        currentIndex++
                    } else {
                        showTutorial = false
                        onComplete()
                    }
                }
            )
        }
    }
}
