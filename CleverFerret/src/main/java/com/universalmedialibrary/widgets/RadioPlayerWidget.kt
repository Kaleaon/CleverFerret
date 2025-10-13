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

            // Set up click intent to open the app
            val intent = Intent(context, MainActivity::class.java).apply {
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
                action.hashCode(),
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(buttonId, pendingIntent)
        }
    }
}
