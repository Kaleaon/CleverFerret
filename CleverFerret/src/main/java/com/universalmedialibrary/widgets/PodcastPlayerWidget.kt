package com.universalmedialibrary.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import com.universalmedialibrary.R
import com.universalmedialibrary.services.playback.UnifiedPlaybackQueueManager
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Podcast Player Widget
 * Shows currently playing podcast episode with controls
 */
@AndroidEntryPoint
class PodcastPlayerWidget : BaseWidgetProvider() {

    @Inject
    lateinit var queueManager: UnifiedPlaybackQueueManager

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
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.PODCAST_PLAY_PAUSE"
        private const val ACTION_REWIND = "com.universalmedialibrary.PODCAST_REWIND"
        private const val ACTION_FORWARD = "com.universalmedialibrary.PODCAST_FORWARD"
        private const val ACTION_SPEED = "com.universalmedialibrary.PODCAST_SPEED"

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
            queueManager: UnifiedPlaybackQueueManager? = null
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_podcast_player)

            // Get current playback state
            val currentItem = queueManager?.currentItem?.value
            val playbackState = queueManager?.playbackState?.value
            
            views.setTextViewText(R.id.widget_podcast_title, currentItem?.title ?: "No Podcast Playing")
            views.setTextViewText(R.id.widget_episode_title, currentItem?.artist ?: "")
            
            val durationText = formatDuration(
                playbackState?.currentPositionMs ?: 0L,
                playbackState?.duration ?: 0L
            )
            views.setTextViewText(R.id.widget_episode_duration, durationText)
            views.setTextViewText(R.id.widget_playback_speed, "${playbackState?.playbackSpeed ?: 1.0f}x")
            
            val progress = calculateProgressPercentage(
                playbackState?.currentPositionMs ?: 0L,
                playbackState?.duration ?: 0L
            )
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
            val pendingIntent = getActivityPendingIntent(context, "OPEN_PODCAST_PLAYER")
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun getPendingIntent(context: Context, action: String): PendingIntent {
            val requestCode = when (action) {
                ACTION_PLAY_PAUSE -> 3001
                ACTION_REWIND -> 3002
                ACTION_FORWARD -> 3003
                ACTION_SPEED -> 3004
                else -> 3000
            }
            return getBroadcastPendingIntent(context, PodcastPlayerWidget::class.java, action, requestCode)
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
                    // Rewind 10 seconds
                    val currentPos = queueManager.playbackState.value.currentPositionMs
                    queueManager.seekTo(maxOf(0, currentPos - 10000))
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
                    val newSpeed = getNextPlaybackSpeed(currentSpeed)
                    queueManager.setPlaybackSpeed(newSpeed)
                    updateAllWidgets(context)
                }
            }
        }
    }

    private fun updateAllWidgets(context: Context) {
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val ids = appWidgetManager.getAppWidgetIds(
            android.content.ComponentName(context, PodcastPlayerWidget::class.java)
        )
        onUpdate(context, appWidgetManager, ids)
    }
}
