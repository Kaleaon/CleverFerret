package com.universalmedialibrary.services.manga.updates

import android.content.Context
import androidx.hilt.work.HiltWorker
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.universalmedialibrary.jobs.JobContractType
import com.universalmedialibrary.jobs.JobExecutionState
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.JobStatusEvent
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
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.WEB_FICTION_UPDATE_SCAN,
                state = JobExecutionState.RUNNING,
                jobId = id.toString(),
                message = "Web fiction update scan started"
            )
        )
        return try {
            val updates = updateService.checkForUpdates()

            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.WEB_FICTION_UPDATE_SCAN,
                    state = JobExecutionState.SUCCEEDED,
                    jobId = id.toString(),
                    message = "Web fiction update scan completed",
                    progress = updates.size
                )
            )

            Result.success()
        } catch (e: Exception) {
            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.WEB_FICTION_UPDATE_SCAN,
                    state = JobExecutionState.FAILED,
                    jobId = id.toString(),
                    message = e.message ?: "Web fiction update scan failed"
                )
            )
            if (runAttemptCount < 3) {
                Result.retry()
            } else {
                Result.failure()
            }
        }
    }
}
