package com.universalmedialibrary.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import com.universalmedialibrary.MainActivity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel

/**
 * Base Widget Provider
 * Abstract AppWidgetProvider managing coroutine scope lifecycle, PendingIntent creation,
 * and shared playback helper utilities.
 */
abstract class BaseWidgetProvider : AppWidgetProvider() {

    protected val widgetScope: CoroutineScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    override fun onDisabled(context: Context) {
        super.onDisabled(context)
        widgetScope.cancel()
    }

    companion object {
        fun getBroadcastPendingIntent(
            context: Context,
            targetClass: Class<*>,
            action: String,
            requestCode: Int = 0
        ): PendingIntent {
            val intent = Intent(context, targetClass).apply {
                this.action = action
            }
            return PendingIntent.getBroadcast(
                context,
                requestCode,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }

        fun getActivityPendingIntent(
            context: Context,
            action: String,
            requestCode: Int = 0,
            targetClass: Class<*> = MainActivity::class.java,
            flags: Int = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        ): PendingIntent {
            val intent = Intent(context, targetClass).apply {
                this.action = action
                this.flags = flags
            }
            return PendingIntent.getActivity(
                context,
                requestCode,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }

        fun formatTime(millis: Long): String {
            val totalSeconds = maxOf(0L, millis / 1000)
            val minutes = totalSeconds / 60
            val seconds = totalSeconds % 60
            return "%d:%02d".format(minutes, seconds)
        }

        fun formatDuration(currentPositionMs: Long, durationMs: Long): String {
            return if (durationMs > 0) {
                "${formatTime(currentPositionMs)} / ${formatTime(durationMs)}"
            } else {
                "--:-- / --:--"
            }
        }

        fun calculateProgressPercentage(currentPositionMs: Long, durationMs: Long): Int {
            return if (durationMs > 0) {
                ((currentPositionMs.toFloat() / durationMs) * 100).toInt().coerceIn(0, 100)
            } else {
                0
            }
        }

        fun getNextPlaybackSpeed(currentSpeed: Float): Float {
            return when {
                currentSpeed < 1.25f -> 1.25f
                currentSpeed < 1.5f -> 1.5f
                currentSpeed < 2.0f -> 2.0f
                else -> 1.0f
            }
        }
    }
}
