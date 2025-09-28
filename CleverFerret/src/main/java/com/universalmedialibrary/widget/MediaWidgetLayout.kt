package com.universalmedialibrary.widget

import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.ColorFilter
import androidx.glance.GlanceModifier
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.action.actionStartActivity 
import androidx.glance.action.clickable
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.background
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.layout.width
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextAlign
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.R

/**
 * Main layout composable for media widget
 * 
 * Renders different layouts based on widget size with responsive design
 * and proper accessibility support.
 */
@Composable
fun MediaWidgetLayout(
    state: MediaWidgetState,
    size: WidgetSize,
    onAction: (WidgetAction) -> Unit,
    modifier: GlanceModifier = GlanceModifier
) {
    Box(
        modifier = modifier
            .fillMaxSize()
            .clickable(actionStartActivity<MainActivity>()),
        contentAlignment = Alignment.Center
    ) {
        // Background artwork with scrim
        MediaWidgetBackground(
            state = state,
            modifier = GlanceModifier.fillMaxSize()
        )
        
        // Content overlay based on size
        when (size) {
            WidgetSize.SMALL -> SmallWidgetContent(state, onAction)
            WidgetSize.MEDIUM -> MediumWidgetContent(state, onAction)
            WidgetSize.LARGE -> LargeWidgetContent(state, onAction)
        }
    }
}

/**
 * Background with artwork and gradient scrim
 */
@Composable
private fun MediaWidgetBackground(
    state: MediaWidgetState,
    modifier: GlanceModifier = GlanceModifier
) {
    Box(modifier = modifier) {
        // Artwork background
        if (state.hasArtwork && state.artworkBitmap != null) {
            Image(
                provider = ImageProvider(state.artworkBitmap),
                contentDescription = "Album artwork",
                modifier = GlanceModifier.fillMaxSize()
            )
        } else {
            // Fallback colored background
            Box(
                modifier = GlanceModifier
                    .fillMaxSize()
                    .background(ColorProvider(getMediaTypeColor(state.mediaType)))
            ) {
                // Empty content for colored background
            }
        }
        
        // Gradient scrim for text legibility  
        Box(
            modifier = GlanceModifier
                .fillMaxSize()
                .background(ColorProvider(Color.Black.copy(alpha = 0.6f)))
        ) {
            // Empty content for scrim overlay
        }
    }
}

/**
 * Small widget layout - just artwork and play/pause
 */
@Composable
private fun SmallWidgetContent(
    state: MediaWidgetState,
    onAction: (WidgetAction) -> Unit
) {
    PlayPauseButton(
        isPlaying = state.isPlaying,
        isLoading = state.isLoading,
        enabled = state.hasMedia && !state.hasError,
        onAction = onAction,
        modifier = GlanceModifier.size(48.dp)
    )
}

/**
 * Medium widget layout - artwork, title, and basic controls
 */
@Composable
private fun MediumWidgetContent(
    state: MediaWidgetState,
    onAction: (WidgetAction) -> Unit
) {
    Row(
        modifier = GlanceModifier
            .fillMaxSize()
            .padding(12.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Media info
        Column(
            modifier = GlanceModifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            if (state.hasMedia) {
                Text(
                    text = state.title,
                    style = TextStyle(
                        fontSize = 14.sp,
                        fontWeight = FontWeight.Bold,
                        color = ColorProvider(Color.White)
                    ),
                    maxLines = 1
                )
                
                Text(
                    text = state.artist,
                    style = TextStyle(
                        fontSize = 12.sp,
                        color = ColorProvider(Color.White.copy(alpha = 0.8f))
                    ),
                    maxLines = 1
                )
            } else {
                Text(
                    text = "No media playing",
                    style = TextStyle(
                        fontSize = 12.sp,
                        color = ColorProvider(Color.White.copy(alpha = 0.6f))
                    )
                )
            }
        }
        
        Spacer(modifier = GlanceModifier.width(8.dp))
        
        // Controls
        Row(
            verticalAlignment = Alignment.CenterVertically
        ) {
            PlayPauseButton(
                isPlaying = state.isPlaying,
                isLoading = state.isLoading,
                enabled = state.hasMedia && !state.hasError,
                onAction = onAction,
                modifier = GlanceModifier.size(40.dp)
            )
        }
    }
}

/**
 * Large widget layout - full controls with progress
 */
@Composable
private fun LargeWidgetContent(
    state: MediaWidgetState,
    onAction: (WidgetAction) -> Unit
) {
    Column(
        modifier = GlanceModifier
            .fillMaxSize()
            .padding(16.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Media info
        if (state.hasMedia) {
            Text(
                text = state.title,
                style = TextStyle(
                    fontSize = 16.sp,
                    fontWeight = FontWeight.Bold,
                    color = ColorProvider(Color.White)
                ),
                maxLines = 1
            )
            
            Text(
                text = state.artist,
                style = TextStyle(
                    fontSize = 14.sp,
                    color = ColorProvider(Color.White.copy(alpha = 0.8f))
                ),
                maxLines = 1
            )
        } else {
            Text(
                text = "No media playing",
                style = TextStyle(
                    fontSize = 14.sp,
                    color = ColorProvider(Color.White.copy(alpha = 0.6f))
                )
            )
        }
        
        Spacer(modifier = GlanceModifier.height(12.dp))
        
        // Control buttons
        Row(
            modifier = GlanceModifier.fillMaxWidth(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalAlignment = Alignment.CenterVertically
        ) {
            PlayPauseButton(
                isPlaying = state.isPlaying,
                isLoading = state.isLoading,
                enabled = state.hasMedia && !state.hasError,
                onAction = onAction,
                modifier = GlanceModifier.size(48.dp)
            )
        }
    }
}

/**
 * Play/Pause button component
 */
@Composable
private fun PlayPauseButton(
    isPlaying: Boolean,
    isLoading: Boolean,
    enabled: Boolean,
    onAction: (WidgetAction) -> Unit,
    modifier: GlanceModifier = GlanceModifier
) {
    val iconRes = when {
        isLoading -> R.drawable.ic_refresh_24
        isPlaying -> R.drawable.ic_pause_24
        else -> R.drawable.ic_play_24
    }
    
    Box(
        modifier = modifier
            .clickable(
                if (enabled) actionRunCallback<PlayPauseAction>() 
                else actionStartActivity<MainActivity>()
            )
            .background(ColorProvider(Color.White.copy(alpha = if (enabled) 0.9f else 0.5f))),
        contentAlignment = Alignment.Center
    ) {
        Image(
            provider = ImageProvider(iconRes),
            contentDescription = if (isPlaying) "Pause" else "Play",
            modifier = GlanceModifier.size(24.dp),
            colorFilter = ColorFilter.tint(ColorProvider(Color.Black))
        )
    }
}

/**
 * Get color associated with media type
 */
private fun getMediaTypeColor(mediaType: MediaType): Color {
    return when (mediaType) {
        MediaType.BOOK -> Color(0xFF4CAF50)        // Green
        MediaType.AUDIOBOOK -> Color(0xFF2196F3)   // Blue  
        MediaType.MUSIC -> Color(0xFFFF9800)       // Orange
        MediaType.MOVIE -> Color(0xFF9C27B0)       // Purple
        MediaType.PODCAST -> Color(0xFF607D8B)     // Blue Grey
        MediaType.UNKNOWN -> Color(0xFF757575)     // Grey
    }
}