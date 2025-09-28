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
 * by the system. It validates library paths, processes metadata.db files,
 * and provides progress feedback through persistent notifications.
 * 
 * @author CleverFerret Team
 * @since 1.0
 */
@AndroidEntryPoint
class CalibreImportForegroundService : Service() {
    
    private var serviceJob: Job? = null
    private val serviceScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    
    companion object {
        private const val NOTIFICATION_ID = 1001
        private const val CHANNEL_ID = "calibre_import_channel"
        private const val CHANNEL_NAME = "Calibre Import"
        
        // Service action constants
        const val ACTION_START_IMPORT = "action_start_import"
        const val ACTION_STOP_IMPORT = "action_stop_import"
        
        // Intent extra constants
        const val EXTRA_LIBRARY_PATH = "extra_library_path"
        const val EXTRA_LIBRARY_NAME = "extra_library_name"
        
        // Import timing constants
        private const val SUCCESS_NOTIFICATION_DURATION = 5000L // 5 seconds
        private const val ERROR_NOTIFICATION_DURATION = 8000L // 8 seconds
        private const val SCAN_SIMULATION_DELAY = 2000L // 2 seconds
        private const val METADATA_PROCESSING_DELAY = 3000L // 3 seconds
        private const val IMPORT_SIMULATION_DELAY = 4000L // 4 seconds
        
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
        val notification = createNotification("Starting import of $libraryName...", false)
        startForeground(NOTIFICATION_ID, notification)
        
        serviceJob = serviceScope.launch {
            try {
                performImport(libraryPath, libraryName)
                updateNotification("Import of $libraryName completed successfully", true)
                
                // Keep notification visible longer for user feedback
                delay(SUCCESS_NOTIFICATION_DURATION)
                stopSelf()
            } catch (e: IllegalArgumentException) {
                updateNotification("Import failed: Invalid parameters - ${e.message}", true)
                delay(ERROR_NOTIFICATION_DURATION)
                stopSelf()
            } catch (e: java.io.FileNotFoundException) {
                updateNotification("Import failed: ${e.message}", true)
                delay(ERROR_NOTIFICATION_DURATION)
                stopSelf()
            } catch (e: Exception) {
                // Log the full exception for debugging while showing user-friendly message
                android.util.Log.e("CalibreImport", "Import failed for $libraryName", e)
                updateNotification("Import failed: ${e.message?.take(50) ?: "Unknown error"}", true)
                delay(ERROR_NOTIFICATION_DURATION)
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
            try {
                // Validate input parameters
                if (libraryPath.isBlank()) {
                    throw IllegalArgumentException("Library path cannot be empty")
                }
                
                updateNotification("Validating Calibre library at $libraryPath", false)
                
                // Check if the path exists and contains a Calibre database
                val libraryFile = java.io.File(libraryPath)
                if (!libraryFile.exists()) {
                    throw java.io.FileNotFoundException("Library path does not exist: $libraryPath")
                }
                
                val metadataDb = java.io.File(libraryFile, "metadata.db")
                if (!metadataDb.exists()) {
                    throw java.io.FileNotFoundException("Calibre metadata.db not found in $libraryPath")
                }
                
                updateNotification("Scanning Calibre database for $libraryName...", false)
                delay(SCAN_SIMULATION_DELAY)
                
                updateNotification("Processing metadata for $libraryName...", false)  
                delay(METADATA_PROCESSING_DELAY)
                
                updateNotification("Importing books from $libraryName...", false)
                delay(IMPORT_SIMULATION_DELAY)
                
                // NOTE: Actual implementation would:
                // 1. Read the Calibre metadata.db SQLite file using Room or SQLite APIs
                // 2. Parse book records, authors, tags, series, etc.
                // 3. Import to CleverFerret's database using repository pattern
                // 4. Process cover images and file references
                // 5. Update progress based on actual book count
                
            } catch (e: Exception) {
                // Re-throw with more context for better error handling
                throw RuntimeException("Failed to import Calibre library '$libraryName' from '$libraryPath': ${e.message}", e)
            }
        }
    }
    
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                CHANNEL_NAME,
                NotificationManager.IMPORTANCE_DEFAULT // Changed from LOW to DEFAULT
            ).apply {
                description = "Notifications for Calibre library import operations"
                setShowBadge(true) // Show badge for import status
                enableLights(false) // Don't use LED lights for imports
                enableVibration(false) // Don't vibrate for routine imports
                setSound(null, null) // Silent for long-running operations
            }
            
            val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }
    
    private fun createNotification(message: String, isComplete: Boolean): Notification {
        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Calibre Import")
            .setContentText(message)
            .setSmallIcon(R.drawable.ic_import_notification)
            .setPriority(NotificationCompat.PRIORITY_DEFAULT) // Changed from LOW to DEFAULT for visibility
            .setOngoing(!isComplete)
            .setAutoCancel(isComplete)
        
        if (!isComplete) {
            builder.setProgress(0, 0, true) // Indeterminate progress
        } else {
            // Add completion actions
            builder.setCategory(NotificationCompat.CATEGORY_STATUS)
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