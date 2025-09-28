package com.universalmedialibrary.widget

import android.content.Context
import androidx.glance.GlanceId
import androidx.glance.action.ActionParameters
import androidx.glance.appwidget.action.ActionCallback
import androidx.glance.appwidget.updateAll
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * Action callbacks for widget interactions
 * 
 * These callbacks handle user interactions with widget buttons
 * and communicate with the media services to control playback.
 */

/**
 * Play/Pause action callback
 */
class PlayPauseAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        try {
            // Get state manager and trigger play/pause
            val stateManager = getStateManager(context)
            stateManager.handleAction(WidgetAction.PlayPause)
            
            // Update all widgets
            MediaWidgetGlanceAppWidget().updateAll(context)
        } catch (e: Exception) {
            // Log error and continue - widget should be resilient
            e.printStackTrace()
        }
    }
}

/**
 * Skip Previous action callback
 */
class SkipPreviousAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        try {
            val stateManager = getStateManager(context)
            stateManager.handleAction(WidgetAction.SkipPrevious)
            
            MediaWidgetGlanceAppWidget().updateAll(context)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}

/**
 * Skip Next action callback
 */
class SkipNextAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        try {
            val stateManager = getStateManager(context)
            stateManager.handleAction(WidgetAction.SkipNext)
            
            MediaWidgetGlanceAppWidget().updateAll(context)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}

/**
 * Helper function to get state manager instance
 * This creates a new instance for each call - in production this would be optimized
 */
private fun getStateManager(context: Context): MediaWidgetSimpleStateManager {
    return MediaWidgetSimpleStateManager(context)
}