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

    companion object {
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.RADIO_PLAY_PAUSE"
        private const val ACTION_NEXT_STATION = "com.universalmedialibrary.RADIO_NEXT"
        private const val ACTION_PREV_STATION = "com.universalmedialibrary.RADIO_PREV"
        private const val ACTION_FAVORITE = "com.universalmedialibrary.RADIO_FAVORITE"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_radio_player)

            // Sample data
            views.setTextViewText(R.id.widget_station_name, "Radio Station")
            views.setTextViewText(R.id.widget_station_genre, "Genre")
            views.setTextViewText(R.id.widget_now_playing, "Now Playing: Song Title")

            // Set up button intents
            views.setOnClickPendingIntent(
                R.id.widget_play_pause_btn,
                getPendingIntent(context, ACTION_PLAY_PAUSE)
            )
            views.setOnClickPendingIntent(
                R.id.widget_next_btn,
                getPendingIntent(context, ACTION_NEXT_STATION)
            )
            views.setOnClickPendingIntent(
                R.id.widget_prev_btn,
                getPendingIntent(context, ACTION_PREV_STATION)
            )
            views.setOnClickPendingIntent(
                R.id.widget_favorite_btn,
                getPendingIntent(context, ACTION_FAVORITE)
            )

            // Click to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_RADIO_PLAYER"
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            val pendingIntent = PendingIntent.getActivity(
                context, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun getPendingIntent(context: Context, action: String): PendingIntent {
            val intent = Intent(context, RadioPlayerWidget::class.java).apply {
                this.action = action
            }
            // Use unique request code per action to avoid PendingIntent reuse
            val requestCode = when (action) {
                ACTION_PLAY_PAUSE -> 4001
                ACTION_NEXT_STATION -> 4002
                ACTION_PREV_STATION -> 4003
                else -> 4000
            }
            return PendingIntent.getBroadcast(
                context, requestCode, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        when (intent.action) {
            ACTION_PLAY_PAUSE -> {
                // Handle play/pause
            }
            ACTION_NEXT_STATION -> {
                // Next station
            }
            ACTION_PREV_STATION -> {
                // Previous station
            }
            ACTION_FAVORITE -> {
                // Toggle favorite
            }
        }
    }
}
