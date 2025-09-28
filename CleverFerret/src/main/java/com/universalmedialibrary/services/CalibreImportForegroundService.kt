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
import kotlinx.coroutines.*

/**
 * Foreground service for importing Calibre library databases
 * 
 * This service runs in the foreground to handle potentially long-running
 * import operations from Calibre library databases without being killed
 * by the system.
 */
@AndroidEntryPoint
class CalibreImportForegroundService : Service() {
    
    private var serviceJob: Job? = null
    private val serviceScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    
    companion object {
        private const val NOTIFICATION_ID = 1001
        private const val CHANNEL_ID = "calibre_import_channel"
        private const val CHANNEL_NAME = "Calibre Import"
        
        const val ACTION_START_IMPORT = "action_start_import"
        const val ACTION_STOP_IMPORT = "action_stop_import"
        
        const val EXTRA_LIBRARY_PATH = "extra_library_path"
        const val EXTRA_LIBRARY_NAME = "extra_library_name"
        
        /**
         * Start the Calibre import service
         */
        fun startImport(context: Context, libraryPath: String, libraryName: String) {
            val intent = Intent(context, CalibreImportForegroundService::class.java).apply {
                action = ACTION_START_IMPORT
                putExtra(EXTRA_LIBRARY_PATH, libraryPath)
                putExtra(EXTRA_LIBRARY_NAME, libraryName)
            }
            
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(intent)
            } else {
                context.startService(intent)
            }
        }
        
        /**
         * Stop the Calibre import service
         */
        fun stopImport(context: Context) {
            val intent = Intent(context, CalibreImportForegroundService::class.java).apply {
                action = ACTION_STOP_IMPORT
            }
            context.startService(intent)
        }
    }
    
    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
    }
    
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START_IMPORT -> {
                val libraryPath = intent.getStringExtra(EXTRA_LIBRARY_PATH) ?: ""
                val libraryName = intent.getStringExtra(EXTRA_LIBRARY_NAME) ?: "Unknown Library"
                startForegroundImport(libraryPath, libraryName)
            }
            ACTION_STOP_IMPORT -> {
                stopImport()
            }
        }
        
        return START_NOT_STICKY
    }
    
    override fun onBind(intent: Intent?): IBinder? = null
    
    private fun startForegroundImport(libraryPath: String, libraryName: String) {
        val notification = createNotification("Importing $libraryName...", false)
        startForeground(NOTIFICATION_ID, notification)
        
        serviceJob = serviceScope.launch {
            try {
                performImport(libraryPath, libraryName)
                updateNotification("Import completed successfully", true)
                
                // Auto-stop after showing completion for a few seconds
                delay(3000)
                stopSelf()
            } catch (e: Exception) {
                updateNotification("Import failed: ${e.message}", true)
                delay(5000)
                stopSelf()
            }
        }
    }
    
    private fun stopImport() {
        serviceJob?.cancel()
        stopForeground(STOP_FOREGROUND_REMOVE)
        stopSelf()
    }
    
    private suspend fun performImport(libraryPath: String, libraryName: String) {
        withContext(Dispatchers.IO) {
            // TODO: Implement actual Calibre database import logic
            // For now, simulate import process
            
            updateNotification("Scanning Calibre database...", false)
            delay(2000) // Simulate database scan
            
            updateNotification("Processing metadata...", false)
            delay(3000) // Simulate metadata processing
            
            updateNotification("Importing books...", false)
            delay(4000) // Simulate book import
            
            // Placeholder implementation - replace with actual import logic
            // This would typically:
            // 1. Read the Calibre metadata.db SQLite file
            // 2. Parse book records, authors, tags, etc.
            // 3. Import to CleverFerret's database
            // 4. Process cover images and file references
        }
    }
    
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                CHANNEL_NAME,
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Notifications for Calibre library import operations"
                setShowBadge(false)
            }
            
            val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }
    
    private fun createNotification(message: String, isComplete: Boolean): Notification {
        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Calibre Import")
            .setContentText(message)
            .setSmallIcon(R.drawable.ic_launcher_foreground)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setOngoing(!isComplete)
        
        if (!isComplete) {
            builder.setProgress(0, 0, true) // Indeterminate progress
        }
        
        return builder.build()
    }
    
    private fun updateNotification(message: String, isComplete: Boolean) {
        val notification = createNotification(message, isComplete)
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(NOTIFICATION_ID, notification)
    }
    
    override fun onDestroy() {
        serviceJob?.cancel()
        serviceScope.cancel()
        super.onDestroy()
    }
}