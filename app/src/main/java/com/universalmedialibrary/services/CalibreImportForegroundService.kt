package com.universalmedialibrary.services

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat
import com.universalmedialibrary.R
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * A foreground service that manages the long-running process of importing a Calibre library.
 *
 * This service is responsible for running the [CalibreImportService] in a background coroutine
 * while displaying a persistent notification to the user. This ensures that the import process
 * is not terminated by the Android system. The service handles its own lifecycle, stopping itself
 * once the import is complete or if an error occurs.
 */
@AndroidEntryPoint
class CalibreImportForegroundService : Service() {
    /** Injected instance of the core import logic service. */
    @Inject
    lateinit var calibreImportService: CalibreImportService

    private val serviceScope = CoroutineScope(Dispatchers.IO)

    /**
     * Called when the service is started. This method initiates the import process.
     *
     * It retrieves the necessary paths and library ID from the start intent, promotes the service
     * to the foreground with an initial notification, and launches a coroutine to execute the import.
     *
     * @return [START_NOT_STICKY] to indicate that the service should not be recreated if it's killed by the system.
     */
    override fun onStartCommand(
        intent: Intent?,
        flags: Int,
        startId: Int,
    ): Int {
        val calibreDbPath = intent?.getStringExtra(EXTRA_DB_PATH) ?: return START_NOT_STICKY
        val libraryRootPath = intent?.getStringExtra(EXTRA_ROOT_PATH) ?: return START_NOT_STICKY
        val libraryId = intent.getLongExtra(EXTRA_LIBRARY_ID, -1)
        if (libraryId == -1L) return START_NOT_STICKY

        startForeground(NOTIFICATION_ID, createNotification("Importing Calibre library..."))

        serviceScope.launch {
            try {
                calibreImportService.importCalibreDatabase(calibreDbPath, libraryRootPath, libraryId)
                updateNotification("Import complete!", "Successfully imported your Calibre library.")
            } catch (e: Exception) {
                updateNotification("Import failed", e.message ?: "An unknown error occurred.")
            } finally {
                stopSelf()
            }
        }

        return START_NOT_STICKY
    }

    /**
     * Creates the initial notification to be displayed when the service starts.
     *
     * @param contentText The text to display in the notification body.
     * @return A configured [Notification] object.
     */
    private fun createNotification(contentText: String): Notification {
        createNotificationChannel()
        return NotificationCompat
            .Builder(this, CHANNEL_ID)
            .setContentTitle("Library Import")
            .setContentText(contentText)
            .setSmallIcon(android.R.drawable.stat_sys_download)
            .build()
    }

    /**
     * Updates the persistent notification with a new title and content text.
     * Used to show the final status of the import (success or failure).
     *
     * @param title The new title for the notification.
     * @param contentText The new content text for the notification.
     */
    private fun updateNotification(
        title: String,
        contentText: String,
    ) {
        val notification =
            NotificationCompat
                .Builder(this, CHANNEL_ID)
                .setContentTitle(title)
                .setContentText(contentText)
                .setSmallIcon(android.R.drawable.stat_sys_download_done)
                .build()
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(NOTIFICATION_ID, notification)
    }

    /**
     * Creates the notification channel required for displaying notifications on Android 8.0 (Oreo) and higher.
     * If the channel already exists, this method does nothing.
     */
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val serviceChannel =
                NotificationChannel(
                    CHANNEL_ID,
                    "Calibre Import Service Channel",
                    NotificationManager.IMPORTANCE_DEFAULT,
                )
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(serviceChannel)
        }
    }

    /**
     * This service does not support binding, so this method returns null.
     */
    override fun onBind(intent: Intent?): IBinder? = null

    companion object {
        /** Key for the extra containing the absolute path to the Calibre `metadata.db` file. */
        const val EXTRA_DB_PATH = "EXTRA_DB_PATH"
        /** Key for the extra containing the absolute path to the Calibre library's root directory. */
        const val EXTRA_ROOT_PATH = "EXTRA_ROOT_PATH"
        /** Key for the extra containing the ID of the library to import into. */
        const val EXTRA_LIBRARY_ID = "EXTRA_LIBRARY_ID"
        /** The ID of the notification channel used by this service. */
        const val CHANNEL_ID = "CalibreImportServiceChannel"
        /** The unique ID for the notification displayed by this service. */
        const val NOTIFICATION_ID = 1
    }
}
