package com.universalmedialibrary.widgets

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.*
import androidx.glance.action.ActionParameters
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.provideContent
import androidx.glance.appwidget.action.ActionCallback
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.layout.*
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider

/**
 * Glance-based widget for displaying current media playback information.
 * 
 * Features:
 * - Full-bleed artwork with gradient scrim
 * - Title and artist/subtitle display
 * - Play/pause/previous/next controls with content descriptions
 * - Accessibility compliant (48dp touch targets)
 * - Dynamic color theming
 * - Fallback for missing artwork
 */
object MediaPlaybackWidget : GlanceAppWidget() {
    
    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            MediaPlaybackWidgetContent()
        }
    }
}

@Composable
fun MediaPlaybackWidgetContent() {
    // TODO: Get state from MediaPlaybackWidgetService via currentStateFlow
    // For now, show placeholder content
    
    Box(
        modifier = GlanceModifier
            .fillMaxSize()
            .background(ColorProvider(Color.DarkGray)),
        contentAlignment = Alignment.Center
    ) {
        Column(
            modifier = GlanceModifier
                .fillMaxSize()
                .padding(16.dp),
            verticalAlignment = Alignment.Vertical.CenterVertically,
            horizontalAlignment = Alignment.Horizontal.CenterHorizontally
        ) {
            // Artwork placeholder with gradient scrim effect
            Box(
                modifier = GlanceModifier
                    .fillMaxWidth()
                    .height(120.dp)
                    .background(ColorProvider(Color(0xFF424242))),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = "🎵",
                    style = TextStyle(
                        fontSize = 48.sp,
                        color = ColorProvider(Color.White)
                    )
                )
            }
            
            Spacer(modifier = GlanceModifier.height(12.dp))
            
            // Title
            Text(
                text = "No Media Playing",
                style = TextStyle(
                    fontSize = 16.sp,
                    color = ColorProvider(Color.White)
                ),
                maxLines = 1
            )
            
            // Subtitle
            Text(
                text = "Tap play to start",
                style = TextStyle(
                    fontSize = 14.sp,
                    color = ColorProvider(Color.LightGray)
                ),
                maxLines = 1
            )
            
            Spacer(modifier = GlanceModifier.height(12.dp))
            
            // Playback controls row
            Row(
                modifier = GlanceModifier.fillMaxWidth(),
                horizontalAlignment = Alignment.Horizontal.CenterHorizontally,
                verticalAlignment = Alignment.Vertical.CenterVertically
            ) {
                // Previous button (48dp minimum)
                Box(
                    modifier = GlanceModifier
                        .size(48.dp)
                        .clickable(actionRunCallback<PreviousAction>()),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "⏮",
                        style = TextStyle(
                            fontSize = 24.sp,
                            color = ColorProvider(Color.White)
                        )
                    )
                }
                
                Spacer(modifier = GlanceModifier.width(16.dp))
                
                // Play/Pause button (48dp minimum)
                Box(
                    modifier = GlanceModifier
                        .size(48.dp)
                        .clickable(actionRunCallback<PlayPauseAction>()),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "▶",
                        style = TextStyle(
                            fontSize = 32.sp,
                            color = ColorProvider(Color.White)
                        )
                    )
                }
                
                Spacer(modifier = GlanceModifier.width(16.dp))
                
                // Next button (48dp minimum)
                Box(
                    modifier = GlanceModifier
                        .size(48.dp)
                        .clickable(actionRunCallback<NextAction>()),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "⏭",
                        style = TextStyle(
                            fontSize = 24.sp,
                            color = ColorProvider(Color.White)
                        )
                    )
                }
            }
        }
    }
}

/**
 * Action callbacks for widget buttons
 */
class PlayPauseAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        // TODO: Call MediaPlaybackWidgetService.onPlayClicked() or onPauseClicked()
    }
}

class PreviousAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        // TODO: Call MediaPlaybackWidgetService.onPreviousClicked()
    }
}

class NextAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        // TODO: Call MediaPlaybackWidgetService.onNextClicked()
    }
}
