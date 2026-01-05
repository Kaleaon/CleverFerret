package com.universalmedialibrary.services.manga.updates

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.work.Constraints
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.NetworkType
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import com.universalmedialibrary.R
import com.universalmedialibrary.services.manga.library.MangaLibraryRepository
import com.universalmedialibrary.services.manga.source.MangaChapter
import com.universalmedialibrary.services.manga.source.MangaSourceService
import com.universalmedialibrary.services.manga.source.MangaUpdate
import com.universalmedialibrary.services.manga.source.OnlineManga
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manga Update Service
 * 
 * Checks for new chapters and sends notifications
 * Inspired by Futon/Kotatsu update checking system
 * 
 * Features:
 * - Periodic update checking (configurable interval)
 * - Smart notifications (grouped by manga)
 * - Update feed with new chapters
 * - Read/unread chapter tracking
 * - Background update checking with WorkManager
 */
@Singleton
class MangaUpdateService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val sourceService: MangaSourceService,
    private val libraryRepository: MangaLibraryRepository,
    private val updateRepository: MangaUpdateRepository
) {
    
    companion object {
        private const val TAG = "MangaUpdateService"
        private const val WORK_NAME = "manga_update_check"
        private const val NOTIFICATION_CHANNEL_ID = "manga_updates"
        private const val NOTIFICATION_GROUP = "com.universalmedialibrary.MANGA_UPDATES"
    }
    
    private val _updates = MutableStateFlow<List<MangaUpdate>>(emptyList())
    val updates: StateFlow<List<MangaUpdate>> = _updates.asStateFlow()
    
    private val _isChecking = MutableStateFlow(false)
    val isChecking: StateFlow<Boolean> = _isChecking.asStateFlow()
    
    private val _lastCheckTime = MutableStateFlow(0L)
    val lastCheckTime: StateFlow<Long> = _lastCheckTime.asStateFlow()
    
    private val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) 
            as NotificationManager
    
    init {
        createNotificationChannel()
        loadCachedUpdates()
    }
    
    /**
     * Schedule periodic update checks
     */
    fun scheduleUpdateChecks(intervalHours: Long = 6) {
        val constraints = Constraints.Builder()
            .setRequiredNetworkType(NetworkType.CONNECTED)
            .build()
        
        val workRequest = PeriodicWorkRequestBuilder<MangaUpdateWorker>(
            intervalHours, TimeUnit.HOURS
        )
            .setConstraints(constraints)
            .build()
        
        WorkManager.getInstance(context).enqueueUniquePeriodicWork(
            WORK_NAME,
            ExistingPeriodicWorkPolicy.UPDATE,
            workRequest
        )
        
        Log.d(TAG, "Scheduled update checks every $intervalHours hours")
    }
    
    /**
     * Cancel scheduled update checks
     */
    fun cancelUpdateChecks() {
        WorkManager.getInstance(context).cancelUniqueWork(WORK_NAME)
    }
    
    /**
     * Check for updates now
     */
    suspend fun checkForUpdates(): List<MangaUpdate> = withContext(Dispatchers.IO) {
        if (_isChecking.value) return@withContext emptyList()
        
        _isChecking.value = true
        val allUpdates = mutableListOf<MangaUpdate>()
        
        try {
            val libraryManga = libraryRepository.getAllLibraryManga()
            
            for (manga in libraryManga) {
                try {
                    // Get current chapter list from library
                    val knownChapters = libraryRepository.getKnownChapterIds(manga.id)
                    
                    // Fetch latest chapters from source
                    val detailsResult = sourceService.getMangaDetails(manga.sourceId, manga.url)
                    
                    detailsResult.onSuccess { details ->
                        val newChapters = details.chapters?.filter { chapter ->
                            chapter.id !in knownChapters
                        } ?: emptyList()
                        
                        if (newChapters.isNotEmpty()) {
                            val update = MangaUpdate(
                                manga = details,
                                newChapters = newChapters
                            )
                            allUpdates.add(update)
                            
                            // Save new chapter IDs
                            libraryRepository.addKnownChapterIds(
                                manga.id,
                                newChapters.map { it.id }
                            )
                        }
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Failed to check updates for ${manga.title}", e)
                }
            }
            
            if (allUpdates.isNotEmpty()) {
                // Save updates
                updateRepository.saveUpdates(allUpdates)
                _updates.value = updateRepository.getAllUpdates()
                
                // Show notifications
                showUpdateNotifications(allUpdates)
            }
            
            _lastCheckTime.value = System.currentTimeMillis()
            
        } finally {
            _isChecking.value = false
        }
        
        allUpdates
    }
    
    /**
     * Get update feed
     */
    suspend fun getUpdateFeed(): List<MangaUpdate> = withContext(Dispatchers.IO) {
        updateRepository.getAllUpdates()
    }
    
    /**
     * Clear update feed
     */
    suspend fun clearUpdateFeed() {
        updateRepository.clearUpdates()
        _updates.value = emptyList()
    }
    
    /**
     * Mark chapters as seen
     */
    suspend fun markChaptersAsSeen(mangaId: Long, chapterIds: List<Long>) {
        updateRepository.markChaptersAsSeen(mangaId, chapterIds)
        _updates.value = updateRepository.getAllUpdates()
    }
    
    /**
     * Get unread update count
     */
    suspend fun getUnreadUpdateCount(): Int {
        return updateRepository.getUnseenUpdateCount()
    }
    
    // Private methods
    
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                NOTIFICATION_CHANNEL_ID,
                "Manga Updates",
                NotificationManager.IMPORTANCE_DEFAULT
            ).apply {
                description = "Notifications for new manga chapters"
                enableVibration(true)
            }
            notificationManager.createNotificationChannel(channel)
        }
    }
    
    private fun showUpdateNotifications(updates: List<MangaUpdate>) {
        if (updates.isEmpty()) return
        
        val totalNewChapters = updates.sumOf { it.newChapters.size }
        
        // Group notification (summary)
        val summaryNotification = NotificationCompat.Builder(context, NOTIFICATION_CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_ferret_blue)
            .setContentTitle("New Manga Chapters")
            .setContentText("$totalNewChapters new chapters in ${updates.size} manga")
            .setGroup(NOTIFICATION_GROUP)
            .setGroupSummary(true)
            .setAutoCancel(true)
            .build()
        
        notificationManager.notify(0, summaryNotification)
        
        // Individual notifications for each manga
        updates.forEachIndexed { index, update ->
            val chapterText = if (update.newChapters.size == 1) {
                update.newChapters.first().name
            } else {
                "${update.newChapters.size} new chapters"
            }
            
            val notification = NotificationCompat.Builder(context, NOTIFICATION_CHANNEL_ID)
                .setSmallIcon(R.drawable.ic_ferret_blue)
                .setContentTitle(update.manga.title)
                .setContentText(chapterText)
                .setGroup(NOTIFICATION_GROUP)
                .setAutoCancel(true)
                .build()
            
            notificationManager.notify(index + 1, notification)
        }
    }
    
    private fun loadCachedUpdates() {
        // Load updates from repository
        kotlinx.coroutines.GlobalScope.launch(Dispatchers.IO) {
            _updates.value = updateRepository.getAllUpdates()
        }
    }
    
    private fun kotlinx.coroutines.GlobalScope.launch(
        context: kotlinx.coroutines.CoroutineDispatcher, 
        block: suspend () -> Unit
    ) {
        kotlinx.coroutines.CoroutineScope(context).launch { block() }
    }
}
