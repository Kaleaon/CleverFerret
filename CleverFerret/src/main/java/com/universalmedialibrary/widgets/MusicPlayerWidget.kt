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
 * Music Player Widget
 * Shows currently playing music with playback controls
 */
class MusicPlayerWidget : AppWidgetProvider() {

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
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.MUSIC_PLAY_PAUSE"
        private const val ACTION_NEXT = "com.universalmedialibrary.MUSIC_NEXT"
        private const val ACTION_PREV = "com.universalmedialibrary.MUSIC_PREV"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_music_player)

            // Sample data - in production, retrieve from media service
            views.setTextViewText(R.id.widget_track_title, "Track Title")
            views.setTextViewText(R.id.widget_artist_name, "Artist Name")
            views.setTextViewText(R.id.widget_album_name, "Album Name")

            // Set up button intents
            views.setOnClickPendingIntent(
                R.id.widget_play_pause_btn,
                getPendingIntent(context, ACTION_PLAY_PAUSE)
            )
            views.setOnClickPendingIntent(
                R.id.widget_next_btn,
                getPendingIntent(context, ACTION_NEXT)
            )
            views.setOnClickPendingIntent(
                R.id.widget_prev_btn,
                getPendingIntent(context, ACTION_PREV)
            )

            // Click to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_MUSIC_PLAYER"
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
            val intent = Intent(context, MusicPlayerWidget::class.java).apply {
                this.action = action
            }
            return PendingIntent.getBroadcast(
                context, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        when (intent.action) {
            ACTION_PLAY_PAUSE -> {
                // Handle play/pause
                // Send broadcast to music service
            }
            ACTION_NEXT -> {
                // Handle next track
            }
            ACTION_PREV -> {
                // Handle previous track
            }
        }
    }
}
