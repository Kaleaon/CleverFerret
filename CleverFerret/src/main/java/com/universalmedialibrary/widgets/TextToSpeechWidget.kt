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
 * Text-to-Speech Widget
 * Shows current TTS playback with controls
 */
class TextToSpeechWidget : AppWidgetProvider() {

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
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.TTS_PLAY_PAUSE"
        private const val ACTION_PREV_SENTENCE = "com.universalmedialibrary.TTS_PREV"
        private const val ACTION_NEXT_SENTENCE = "com.universalmedialibrary.TTS_NEXT"
        private const val ACTION_SPEED = "com.universalmedialibrary.TTS_SPEED"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_tts_player)

            // Sample data
            views.setTextViewText(R.id.widget_book_title, "Book Title")
            views.setTextViewText(R.id.widget_sentence_info, "Sentence 42 of 150")
            views.setTextViewText(R.id.widget_tts_speed, "1.0x")
            views.setProgressBar(R.id.widget_progress, 100, 28, false)

            // Set up button intents
            views.setOnClickPendingIntent(
                R.id.widget_play_pause_btn,
                getPendingIntent(context, ACTION_PLAY_PAUSE)
            )
            views.setOnClickPendingIntent(
                R.id.widget_prev_btn,
                getPendingIntent(context, ACTION_PREV_SENTENCE)
            )
            views.setOnClickPendingIntent(
                R.id.widget_next_btn,
                getPendingIntent(context, ACTION_NEXT_SENTENCE)
            )
            views.setOnClickPendingIntent(
                R.id.widget_speed_btn,
                getPendingIntent(context, ACTION_SPEED)
            )

            // Click to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_TTS_READER"
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
            val intent = Intent(context, TextToSpeechWidget::class.java).apply {
                this.action = action
            }
            // Use unique request code per action to avoid PendingIntent reuse
            val requestCode = when (action) {
                ACTION_PLAY_PAUSE -> 5001
                ACTION_PREV_SENTENCE -> 5002
                ACTION_NEXT_SENTENCE -> 5003
                else -> 5000
            }
            return PendingIntent.getBroadcast(
                context, requestCode, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        
        // Get AudioPlaybackManager from Hilt for TTS audio
        val audioPlaybackManager = try {
            dagger.hilt.android.EntryPointAccessors
                .fromApplication(
                    context.applicationContext,
                    com.universalmedialibrary.widgets.WidgetEntryPoint::class.java
                ).audioPlaybackManager()
        } catch (e: Exception) {
            null
        }
        
        when (intent.action) {
            ACTION_PLAY_PAUSE -> {
                audioPlaybackManager?.togglePlayPause()
            }
            ACTION_PREV_SENTENCE -> {
                // Rewind to previous sentence (approximate 5 seconds)
                audioPlaybackManager?.let { manager ->
                    val currentPosition = manager.exoPlayer.currentPosition
                    val newPosition = (currentPosition - 5000).coerceAtLeast(0)
                    manager.seekTo(newPosition)
                }
            }
            ACTION_NEXT_SENTENCE -> {
                // Forward to next sentence (approximate 5 seconds)
                audioPlaybackManager?.let { manager ->
                    val currentPosition = manager.exoPlayer.currentPosition
                    val duration = manager.exoPlayer.duration
                    val newPosition = if (duration > 0) {
                        (currentPosition + 5000).coerceAtMost(duration)
                    } else {
                        currentPosition + 5000
                    }
                    manager.seekTo(newPosition)
                }
            }
            ACTION_SPEED -> {
                // Cycle TTS speed: 0.75x -> 1.0x -> 1.25x -> 1.5x -> 0.75x
                audioPlaybackManager?.let { manager ->
                    val currentSpeed = manager.exoPlayer.playbackParameters.speed
                    val newSpeed = when {
                        currentSpeed < 0.9f -> 1.0f
                        currentSpeed < 1.2f -> 1.25f
                        currentSpeed < 1.4f -> 1.5f
                        else -> 0.75f
                    }
                    manager.exoPlayer.setPlaybackSpeed(newSpeed)
                }
            }
        }
        
        // Update widget after action
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val widgetIds = appWidgetManager.getAppWidgetIds(
            android.content.ComponentName(context, TextToSpeechWidget::class.java)
        )
        for (widgetId in widgetIds) {
            updateAppWidget(context, appWidgetManager, widgetId)
        }
    }
}
