package com.universalmedialibrary.workers

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.work.CoroutineWorker
import androidx.work.ForegroundInfo
import androidx.work.WorkerParameters
import com.universalmedialibrary.R
import com.universalmedialibrary.services.MediaScannerService

/**
 * Periodic background worker that triggers a full media scan.
 *
 * This worker is scheduled from the Auto-Scan settings screen.
 */
class AutoScanWorker(
    appContext: Context,
    params: WorkerParameters
) : CoroutineWorker(appContext, params) {

    companion object {
        const val UNIQUE_WORK_NAME = "cleverferret_auto_scan"
        private const val CHANNEL_ID = "auto_scan_channel"
        private const val NOTIFICATION_ID = 902
    }

    override suspend fun doWork(): Result {
        setForeground(createForegroundInfo("Scanning for media…"))
        val intent = Intent(applicationContext, MediaScannerService::class.java).apply {
            action = MediaScannerService.ACTION_SCAN_ALL
        }
        // Foreground service start is safe across API levels when paired with foreground notification.
        applicationContext.startService(intent)
        return Result.success()
    }

    private fun createForegroundInfo(text: String): ForegroundInfo {
        val nm = applicationContext.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Auto Scan",
                NotificationManager.IMPORTANCE_LOW
            )
            nm.createNotificationChannel(channel)
        }

        val notification = NotificationCompat.Builder(applicationContext, CHANNEL_ID)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle("CleverFerret")
            .setContentText(text)
            .setOngoing(true)
            .setOnlyAlertOnce(true)
            .build()

        return ForegroundInfo(NOTIFICATION_ID, notification)
    }
}

