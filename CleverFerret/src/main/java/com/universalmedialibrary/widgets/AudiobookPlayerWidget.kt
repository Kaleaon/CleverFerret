package com.universalmedialibrary.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import com.universalmedialibrary.R
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.services.playback.UnifiedPlaybackQueueManager
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Audiobook Player Widget
 * Shows currently playing audiobook with controls
 */
@AndroidEntryPoint
class AudiobookPlayerWidget : AppWidgetProvider() {

    @Inject
    lateinit var queueManager: UnifiedPlaybackQueueManager

    private val widgetScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId, queueManager)
        }
    }

    companion object {
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.AUDIOBOOK_PLAY_PAUSE"
        private const val ACTION_REWIND = "com.universalmedialibrary.AUDIOBOOK_REWIND"
        private const val ACTION_FORWARD = "com.universalmedialibrary.AUDIOBOOK_FORWARD"
        private const val ACTION_SPEED = "com.universalmedialibrary.AUDIOBOOK_SPEED"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
            queueManager: UnifiedPlaybackQueueManager? = null
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_audiobook_player)

            // Get current playback state
            val currentItem = queueManager?.currentItem?.value
            val playbackState = queueManager?.playbackState?.value
            
            views.setTextViewText(R.id.widget_book_title, currentItem?.title ?: "No Audiobook Playing")
            views.setTextViewText(R.id.widget_author, currentItem?.artist ?: "")
            views.setTextViewText(R.id.widget_chapter, if (currentItem != null) "Playing" else "")
            views.setTextViewText(R.id.widget_playback_speed, "${playbackState?.playbackSpeed ?: 1.0f}x")
            
            val progress = if (playbackState != null && playbackState.duration > 0) {
                ((playbackState.currentPositionMs.toFloat() / playbackState.duration) * 100).toInt()
            } else 0
            views.setProgressBar(R.id.widget_progress, 100, progress, false)

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
                action = "OPEN_AUDIOBOOK_PLAYER"
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
            val intent = Intent(context, AudiobookPlayerWidget::class.java).apply {
                this.action = action
            }
            // Use unique request code per action to avoid PendingIntent reuse
            val requestCode = when (action) {
                ACTION_PLAY_PAUSE -> 2001
                ACTION_REWIND -> 2002
                ACTION_FORWARD -> 2003
                ACTION_SPEED -> 2004
                else -> 2000
            }
            return PendingIntent.getBroadcast(
                context, requestCode, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        widgetScope.launch {
            when (intent.action) {
                ACTION_PLAY_PAUSE -> {
                    val playbackState = queueManager.playbackState.value
                    if (playbackState.isPlaying) {
                        queueManager.pause()
                    } else {
                        queueManager.play()
                    }
                    updateAllWidgets(context)
                }
                ACTION_REWIND -> {
                    // Rewind 30 seconds
                    val currentPos = queueManager.playbackState.value.currentPositionMs
                    queueManager.seekTo(maxOf(0, currentPos - 30000))
                    updateAllWidgets(context)
                }
                ACTION_FORWARD -> {
                    // Forward 30 seconds
                    val currentPos = queueManager.playbackState.value.currentPositionMs
                    val duration = queueManager.playbackState.value.duration
                    queueManager.seekTo(minOf(duration, currentPos + 30000))
                    updateAllWidgets(context)
                }
                ACTION_SPEED -> {
                    // Cycle playback speed: 1.0x -> 1.25x -> 1.5x -> 2.0x -> 1.0x
                    val currentSpeed = queueManager.playbackState.value.playbackSpeed
                    val newSpeed = when {
                        currentSpeed < 1.25f -> 1.25f
                        currentSpeed < 1.5f -> 1.5f
                        currentSpeed < 2.0f -> 2.0f
                        else -> 1.0f
                    }
                    queueManager.setPlaybackSpeed(newSpeed)
                    updateAllWidgets(context)
                }
            }
        }
    }

    private fun updateAllWidgets(context: Context) {
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val ids = appWidgetManager.getAppWidgetIds(
            android.content.ComponentName(context, AudiobookPlayerWidget::class.java)
        )
        onUpdate(context, appWidgetManager, ids)
    }

    override fun onDisabled(context: Context) {
        super.onDisabled(context)
        // Cancel coroutine scope when all widgets removed to prevent leaks
        widgetScope.cancel()
    }
}
