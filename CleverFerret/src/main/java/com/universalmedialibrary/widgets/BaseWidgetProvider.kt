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
        private const val MILLIS_PER_SECOND = 1000L
        private const val SECONDS_PER_MINUTE = 60L
        private const val PERCENTAGE_MULTIPLIER = 100
        private const val SPEED_1_0 = 1.0f
        private const val SPEED_1_25 = 1.25f
        private const val SPEED_1_5 = 1.5f
        private const val SPEED_2_0 = 2.0f

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
            val totalSeconds = maxOf(0L, millis / MILLIS_PER_SECOND)
            val minutes = totalSeconds / SECONDS_PER_MINUTE
            val seconds = totalSeconds % SECONDS_PER_MINUTE
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
                ((currentPositionMs.toFloat() / durationMs) * PERCENTAGE_MULTIPLIER).toInt().coerceIn(0, PERCENTAGE_MULTIPLIER)
            } else {
                0
            }
        }

        fun getNextPlaybackSpeed(currentSpeed: Float): Float {
            return when {
                currentSpeed < SPEED_1_25 -> SPEED_1_25
                currentSpeed < SPEED_1_5 -> SPEED_1_5
                currentSpeed < SPEED_2_0 -> SPEED_2_0
                else -> SPEED_1_0
            }
        }
    }
}
