package com.universalmedialibrary.services.sync

import android.content.Context
import android.util.Log
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.universalmedialibrary.services.pipeline.JobContractType
import com.universalmedialibrary.services.pipeline.JobExecutionState
import com.universalmedialibrary.services.pipeline.JobStatusBus
import com.universalmedialibrary.services.pipeline.JobStatusEvent
import dagger.hilt.EntryPoint
import dagger.hilt.InstallIn
import dagger.hilt.android.EntryPointAccessors
import dagger.hilt.components.SingletonComponent

/**
 * Hilt EntryPoint for accessing CloudSyncEngine in SyncWorker.
 */
@EntryPoint
@InstallIn(SingletonComponent::class)
interface SyncWorkerEntryPoint {
    fun cloudSyncEngine(): CloudSyncEngine
}

/**
 * Background WorkManager SyncWorker using Hilt entry point to trigger CloudSyncEngine.
 */
class SyncWorker(
    context: Context,
    params: WorkerParameters
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        Log.d(TAG, "SyncWorker executing: periodic sync triggered at ${System.currentTimeMillis()}")
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.FEED_CATALOG_SYNC,
                state = JobExecutionState.RUNNING,
                jobId = id.toString(),
                message = "Feed/catalog sync started"
            )
        )
        return try {
            val entryPoint = EntryPointAccessors.fromApplication(
                applicationContext,
                SyncWorkerEntryPoint::class.java
            )
            val syncEngine = entryPoint.cloudSyncEngine()
            val result = syncEngine.syncNow()
            if (result.isSuccess) {
                Log.d(TAG, "SyncWorker completed successfully")
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.FEED_CATALOG_SYNC,
                        state = JobExecutionState.SUCCEEDED,
                        jobId = id.toString(),
                        message = "Feed/catalog sync completed"
                    )
                )
                Result.success()
            } else {
                val errorMessage = result.exceptionOrNull()?.message
                Log.w(TAG, "SyncWorker sync failed: $errorMessage")
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.FEED_CATALOG_SYNC,
                        state = JobExecutionState.FAILED,
                        jobId = id.toString(),
                        message = errorMessage ?: "Feed/catalog sync failed"
                    )
                )
                Result.retry()
            }
        } catch (e: Exception) {
            Log.e(TAG, "SyncWorker failed with exception: ${e.message}")
            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.FEED_CATALOG_SYNC,
                    state = JobExecutionState.FAILED,
                    jobId = id.toString(),
                    message = e.message ?: "Feed/catalog sync threw an exception"
                )
            )
            Result.retry()
        }
    }

    companion object {
        private const val TAG = "SyncWorker"
    }
}
