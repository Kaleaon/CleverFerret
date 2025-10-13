package com.universalmedialibrary.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import com.universalmedialibrary.R
import com.universalmedialibrary.MainActivity

/**
 * Radio Player Widget
 * Shows currently playing radio station with controls
 */
class RadioPlayerWidget : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        
        when (intent.action) {
            ACTION_PLAY_PAUSE -> {
                // TODO: Route to radio playback service to toggle play/pause
                // Example: RadioPlaybackService.togglePlayPause(context)
            }
            ACTION_NEXT -> {
                // TODO: Route to radio playback service to skip to next station
                // Example: RadioPlaybackService.nextStation(context)
            }
            ACTION_PREV -> {
                // TODO: Route to radio playback service to go to previous station
                // Example: RadioPlaybackService.previousStation(context)
            }
            ACTION_FAVORITE -> {
                // TODO: Route to radio playback service to toggle favorite
                // Example: RadioPlaybackService.toggleFavorite(context)
            }
        }
        
        // Update all widget instances after handling action
        if (intent.action in setOf(ACTION_PLAY_PAUSE, ACTION_NEXT, ACTION_PREV, ACTION_FAVORITE)) {
            val appWidgetManager = AppWidgetManager.getInstance(context)
            val componentName = android.content.ComponentName(context, RadioPlayerWidget::class.java)
            val appWidgetIds = appWidgetManager.getAppWidgetIds(componentName)
            onUpdate(context, appWidgetManager, appWidgetIds)
        }
    }

    companion object {
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.RADIO_PLAY_PAUSE"
        private const val ACTION_NEXT = "com.universalmedialibrary.RADIO_NEXT"
        private const val ACTION_PREV = "com.universalmedialibrary.RADIO_PREV"
        private const val ACTION_FAVORITE = "com.universalmedialibrary.RADIO_FAVORITE"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_radio_player)

            // Set default values
            views.setTextViewText(R.id.widget_station_name, "No Station Playing")
            views.setTextViewText(R.id.widget_station_genre, "Select a station")
            views.setTextViewText(R.id.widget_now_playing, "Tap to open Radio")

            // Set up click intent to open the app and navigate to radio player
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_RADIO_PLAYER"
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            val pendingIntent = PendingIntent.getActivity(
                context, 0, intent, 
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            // Set up control button intents
            setupControlButton(context, views, R.id.widget_prev_btn, ACTION_PREV)
            setupControlButton(context, views, R.id.widget_play_pause_btn, ACTION_PLAY_PAUSE)
            setupControlButton(context, views, R.id.widget_next_btn, ACTION_NEXT)
            setupControlButton(context, views, R.id.widget_favorite_btn, ACTION_FAVORITE)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun setupControlButton(
            context: Context,
            views: RemoteViews,
            buttonId: Int,
            action: String
        ) {
            val intent = Intent(context, RadioPlayerWidget::class.java).setAction(action)
            val pendingIntent = PendingIntent.getBroadcast(
                context,
                buttonId,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(buttonId, pendingIntent)
        }
    }
}
