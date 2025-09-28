package com.universalmedialibrary.widget

import android.content.Context
import androidx.compose.material3.ColorScheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.DpSize
import androidx.compose.ui.unit.dp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.SizeMode
import androidx.glance.appwidget.appWidgetBackground
import androidx.glance.appwidget.provideContent
import androidx.glance.layout.size
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * Jetpack Glance AppWidget for media playback controls
 * 
 * Provides a modern, Material You widget with responsive layouts
 * based on available space and dynamic color theming.
 */
class MediaWidgetGlanceAppWidget : GlanceAppWidget() {
    
    companion object {
        // Widget size breakpoints following Material Design guidelines
        val SMALL_SIZE = DpSize(100.dp, 100.dp)
        val MEDIUM_SIZE = DpSize(250.dp, 100.dp) 
        val LARGE_SIZE = DpSize(250.dp, 150.dp)
    }
    
    override val sizeMode = SizeMode.Responsive(
        setOf(SMALL_SIZE, MEDIUM_SIZE, LARGE_SIZE)
    )
    
    override suspend fun provideGlance(context: Context, id: GlanceId) {
        // Get state manager instance
        val stateManager = getStateManager(context)
        
        provideContent {
            GlanceTheme {
                MediaWidgetContent(stateManager = stateManager)
            }
        }
    }
}

/**
 * Main content composable for the widget
 */
@Composable
private fun MediaWidgetContent(
    stateManager: MediaWidgetSimpleStateManager
) {
    val state by stateManager.widgetState.collectAsState()
    
    // Determine widget size based on available space
    val widgetSize = determineWidgetSize()
    
    MediaWidgetLayout(
        state = state,
        size = widgetSize,
        onAction = { action -> stateManager.handleAction(action) },
        modifier = GlanceModifier.appWidgetBackground()
    )
}

/**
 * Determine appropriate widget size based on available space
 */
@Composable
private fun determineWidgetSize(): WidgetSize {
    // For now, default to medium - this will be enhanced with proper
    // size detection in future iterations
    return WidgetSize.MEDIUM
}

/**
 * AppWidget receiver that handles widget lifecycle events
 */
@AndroidEntryPoint
class MediaWidgetReceiver : GlanceAppWidgetReceiver() {
    
    override val glanceAppWidget: GlanceAppWidget = MediaWidgetGlanceAppWidget()
    
    override fun onEnabled(context: Context) {
        super.onEnabled(context)
        // Start observing media state when first widget is added
    }
    
    override fun onDisabled(context: Context) {
        super.onDisabled(context)
        // Stop observing when last widget is removed
    }
}

/**
 * Extension to get singleton instance of state manager
 * This is a simplified approach until proper DI integration
 */
private fun getStateManager(context: Context): MediaWidgetSimpleStateManager {
    // For now, create a simplified state manager without full DI
    // This will be enhanced in future iterations
    return MediaWidgetSimpleStateManager(context)
}