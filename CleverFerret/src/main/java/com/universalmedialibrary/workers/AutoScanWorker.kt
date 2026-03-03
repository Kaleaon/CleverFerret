package com.universalmedialibrary.workers

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import androidx.work.CoroutineWorker
import androidx.work.ForegroundInfo
import androidx.work.WorkerParameters
import com.universalmedialibrary.R
import com.universalmedialibrary.jobs.JobContractType
import com.universalmedialibrary.jobs.JobExecutionState
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.JobStatusEvent
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
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.PERIODIC_METADATA_REFRESH,
                state = JobExecutionState.RUNNING,
                jobId = id.toString(),
                message = "Metadata refresh scan started"
            )
        )
        setForeground(createForegroundInfo("Scanning for media…"))
        val intent = Intent(applicationContext, MediaScannerService::class.java).apply {
            action = MediaScannerService.ACTION_SCAN_ALL
        }
        // Android 8.0+ requires foreground service start from background.
        ContextCompat.startForegroundService(applicationContext, intent)
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.PERIODIC_METADATA_REFRESH,
                state = JobExecutionState.SUCCEEDED,
                jobId = id.toString(),
                message = "Metadata refresh scan dispatched"
            )
        )
        return Result.success()
    }

    private fun createForegroundInfo(text: String): ForegroundInfo {
        val nm = applicationContext.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        val channel = NotificationChannel(
            CHANNEL_ID,
            "Auto Scan",
            NotificationManager.IMPORTANCE_LOW
        )
        nm.createNotificationChannel(channel)

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

