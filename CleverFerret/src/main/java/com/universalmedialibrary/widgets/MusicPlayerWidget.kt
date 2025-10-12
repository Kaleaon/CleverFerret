package com.universalmedialibrary.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import com.universalmedialibrary.R
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * Music Player Widget
 * Shows currently playing music with playback controls
 */
@AndroidEntryPoint
class MusicPlayerWidget : AppWidgetProvider() {

    @Inject
    lateinit var audioPlaybackManager: AudioPlaybackManager

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId, audioPlaybackManager)
        }
    }

    companion object {
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.MUSIC_PLAY_PAUSE"
        private const val ACTION_NEXT = "com.universalmedialibrary.MUSIC_NEXT"
        private const val ACTION_PREV = "com.universalmedialibrary.MUSIC_PREV"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
            audioPlaybackManager: AudioPlaybackManager? = null
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_music_player)

            // Get current playback state from AudioPlaybackManager
            val audioState = audioPlaybackManager?.state?.value
            views.setTextViewText(R.id.widget_track_title, audioState?.title ?: "No Track Playing")
            views.setTextViewText(R.id.widget_artist_name, audioState?.artist ?: "")
            views.setTextViewText(R.id.widget_album_name, audioState?.album ?: "")

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
            // Use unique request code per action to avoid PendingIntent reuse
            val requestCode = when (action) {
                ACTION_PLAY_PAUSE -> 1001
                ACTION_NEXT -> 1002
                ACTION_PREV -> 1003
                else -> 1000
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
                audioPlaybackManager.togglePlayPause()
                // Update widget after action
                val appWidgetManager = AppWidgetManager.getInstance(context)
                val ids = appWidgetManager.getAppWidgetIds(
                    android.content.ComponentName(context, MusicPlayerWidget::class.java)
                )
                onUpdate(context, appWidgetManager, ids)
            }
            ACTION_NEXT -> {
                audioPlaybackManager.skipToNext()
                // Update widget after action
                val appWidgetManager = AppWidgetManager.getInstance(context)
                val ids = appWidgetManager.getAppWidgetIds(
                    android.content.ComponentName(context, MusicPlayerWidget::class.java)
                )
                onUpdate(context, appWidgetManager, ids)
            }
            ACTION_PREV -> {
                audioPlaybackManager.skipToPrevious()
                // Update widget after action
                val appWidgetManager = AppWidgetManager.getInstance(context)
                val ids = appWidgetManager.getAppWidgetIds(
                    android.content.ComponentName(context, MusicPlayerWidget::class.java)
                )
                onUpdate(context, appWidgetManager, ids)
            }
        }
    }
}
