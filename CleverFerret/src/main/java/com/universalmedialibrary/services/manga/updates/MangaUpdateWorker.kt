package com.universalmedialibrary.services.manga.updates

import android.content.Context
import androidx.hilt.work.HiltWorker
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import dagger.assisted.Assisted
import dagger.assisted.AssistedInject

/**
 * Background worker for checking manga updates
 * Uses WorkManager for reliable background execution
 */
@HiltWorker
class MangaUpdateWorker @AssistedInject constructor(
    @Assisted context: Context,
    @Assisted params: WorkerParameters,
    private val updateService: MangaUpdateService
) : CoroutineWorker(context, params) {
    
    override suspend fun doWork(): Result {
        return try {
            val updates = updateService.checkForUpdates()
            
            if (updates.isNotEmpty()) {
                // Update service handles notifications
            }
            
            Result.success()
        } catch (e: Exception) {
            if (runAttemptCount < 3) {
                Result.retry()
            } else {
                Result.failure()
            }
        }
    }
}
