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
 * Podcast Player Widget
 * Shows currently playing podcast episode with controls
 */
class PodcastPlayerWidget : AppWidgetProvider() {

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
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.PODCAST_PLAY_PAUSE"
        private const val ACTION_REWIND = "com.universalmedialibrary.PODCAST_REWIND"
        private const val ACTION_FORWARD = "com.universalmedialibrary.PODCAST_FORWARD"
        private const val ACTION_SPEED = "com.universalmedialibrary.PODCAST_SPEED"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_podcast_player)

            // Sample data
            views.setTextViewText(R.id.widget_podcast_title, "Podcast Name")
            views.setTextViewText(R.id.widget_episode_title, "Episode Title")
            views.setTextViewText(R.id.widget_episode_duration, "45:30 / 1:15:00")
            views.setTextViewText(R.id.widget_playback_speed, "1.0x")
            views.setProgressBar(R.id.widget_progress, 100, 60, false)

            // Set up button intents
            views.setOnClickPendingIntent(
                R.id.widget_play_pause_btn,
                getPendingIntent(context, ACTION_PLAY_PAUSE)
            )
            views.setOnClickPendingIntent(
                R.id.widget_rewind_btn,
                getPendingIntent(context, ACTION_REWIND)
            )
            views.setOnClickPendingIntent(
                R.id.widget_forward_btn,
                getPendingIntent(context, ACTION_FORWARD)
            )
            views.setOnClickPendingIntent(
                R.id.widget_speed_btn,
                getPendingIntent(context, ACTION_SPEED)
            )

            // Click to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_PODCAST_PLAYER"
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
            val intent = Intent(context, PodcastPlayerWidget::class.java).apply {
                this.action = action
            }
            // Use unique request code per action to avoid PendingIntent reuse
            val requestCode = when (action) {
                ACTION_PLAY_PAUSE -> 3001
                ACTION_REWIND -> 3002
                ACTION_FORWARD -> 3003
                ACTION_SPEED -> 3004
                else -> 3000
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
            ACTION_REWIND -> {
                // Rewind 10 seconds
            }
            ACTION_FORWARD -> {
                // Forward 30 seconds
            }
            ACTION_SPEED -> {
                // Cycle playback speed
            }
        }
    }
}
