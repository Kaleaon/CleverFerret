package com.universalmedialibrary.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.widget.RemoteViews
import com.universalmedialibrary.R
import com.universalmedialibrary.MainActivity

/**
 * Text-to-Speech Widget
 * Shows current TTS playback with controls
 * Note: TTS state is managed by EnhancedEReaderViewModel and shared via preferences
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
        private const val PREFS_NAME = "TTSWidgetPrefs"
        private const val PREF_BOOK_TITLE = "book_title"
        private const val PREF_IS_PLAYING = "is_playing"
        private const val PREF_TTS_SPEED = "tts_speed"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_tts_player)

            // Get TTS state from SharedPreferences
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val bookTitle = prefs.getString(PREF_BOOK_TITLE, "No Book Loaded") ?: "No Book Loaded"
            val isPlaying = prefs.getBoolean(PREF_IS_PLAYING, false)
            val ttsSpeed = prefs.getFloat(PREF_TTS_SPEED, 1.0f)

            views.setTextViewText(R.id.widget_book_title, bookTitle)
            views.setTextViewText(R.id.widget_sentence_info, if (isPlaying) "Reading..." else "Paused")
            views.setTextViewText(R.id.widget_tts_speed, "${ttsSpeed}x")
            views.setProgressBar(R.id.widget_progress, 100, 0, false)

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
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        
        when (intent.action) {
            ACTION_PLAY_PAUSE -> {
                // Toggle TTS play/pause state
                val isPlaying = prefs.getBoolean(PREF_IS_PLAYING, false)
                prefs.edit().putBoolean(PREF_IS_PLAYING, !isPlaying).apply()
                
                // Broadcast intent to EnhancedEReaderViewModel to handle TTS (explicit broadcast for security)
                val ttsIntent = Intent("com.universalmedialibrary.TTS_CONTROL")
                    .setPackage(context.packageName)
                ttsIntent.putExtra("action", if (isPlaying) "pause" else "play")
                context.sendBroadcast(ttsIntent)
                
                updateAllWidgets(context)
            }
            ACTION_PREV_SENTENCE -> {
                // Broadcast to go to previous sentence/chapter (explicit broadcast for security)
                val ttsIntent = Intent("com.universalmedialibrary.TTS_CONTROL")
                    .setPackage(context.packageName)
                ttsIntent.putExtra("action", "previous")
                context.sendBroadcast(ttsIntent)
            }
            ACTION_NEXT_SENTENCE -> {
                // Broadcast to go to next sentence/chapter (explicit broadcast for security)
                val ttsIntent = Intent("com.universalmedialibrary.TTS_CONTROL")
                    .setPackage(context.packageName)
                ttsIntent.putExtra("action", "next")
                context.sendBroadcast(ttsIntent)
            }
            ACTION_SPEED -> {
                // Cycle TTS speed: 1.0x -> 1.25x -> 1.5x -> 2.0x -> 1.0x
                val currentSpeed = prefs.getFloat(PREF_TTS_SPEED, 1.0f)
                val newSpeed = when {
                    currentSpeed < 1.25f -> 1.25f
                    currentSpeed < 1.5f -> 1.5f
                    currentSpeed < 2.0f -> 2.0f
                    else -> 1.0f
                }
                prefs.edit().putFloat(PREF_TTS_SPEED, newSpeed).apply()
                
                // Broadcast speed change (explicit broadcast for security)
                val ttsIntent = Intent("com.universalmedialibrary.TTS_CONTROL")
                    .setPackage(context.packageName)
                ttsIntent.putExtra("action", "speed")
                ttsIntent.putExtra("speed", newSpeed)
                context.sendBroadcast(ttsIntent)
                
                updateAllWidgets(context)
            }
        }
    }

    private fun updateAllWidgets(context: Context) {
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val ids = appWidgetManager.getAppWidgetIds(
            android.content.ComponentName(context, TextToSpeechWidget::class.java)
        )
        ids.forEach { id ->
            updateAppWidget(context, appWidgetManager, id)
        }
    }
}
