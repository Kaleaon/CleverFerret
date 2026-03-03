package com.universalmedialibrary.jobs

import android.content.Context
import androidx.work.Constraints
import androidx.work.Data
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.ExistingWorkPolicy
import androidx.work.NetworkType
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import com.universalmedialibrary.services.manga.updates.MangaUpdateWorker
import com.universalmedialibrary.services.sync.SyncWorker
import com.universalmedialibrary.workers.AutoScanWorker
import com.universalmedialibrary.workers.ImportPlanWorker
import java.util.concurrent.TimeUnit

object WorkScheduler {
    private const val IMPORT_WORK_NAME = "import_sorter"
    private const val CLOUD_SYNC_WORK_NAME = "cloud_sync"
    private const val MANGA_UPDATE_WORK_NAME = "manga_update_check"

    val importContract = JobContract(
        type = JobContractType.ONE_OFF_IMPORT,
        uniqueName = IMPORT_WORK_NAME,
        trigger = JobTrigger.ONE_OFF,
        tags = setOf("import_sorter")
    )

    fun scheduleOneOffImport(context: Context, inputData: Data) {
        val request = OneTimeWorkRequestBuilder<ImportPlanWorker>()
            .addTag("import_sorter")
            .setInputData(inputData)
            .build()

        WorkManager.getInstance(context).enqueueUniqueWork(
            importContract.uniqueName,
            ExistingWorkPolicy.REPLACE,
            request
        )

        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.ONE_OFF_IMPORT,
                state = JobExecutionState.QUEUED,
                jobId = request.id.toString(),
                message = "One-off import scheduled"
            )
        )
    }

    fun cancelOneOffImport(context: Context) {
        WorkManager.getInstance(context).cancelUniqueWork(importContract.uniqueName)
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.ONE_OFF_IMPORT,
                state = JobExecutionState.CANCELLED,
                jobId = importContract.uniqueName,
                message = "One-off import cancelled"
            )
        )
    }

    fun schedulePeriodicMetadataRefresh(context: Context, intervalHours: Long, wifiOnly: Boolean) {
        val constraints = Constraints.Builder()
            .setRequiredNetworkType(if (wifiOnly) NetworkType.UNMETERED else NetworkType.CONNECTED)
            .build()

        val request = PeriodicWorkRequestBuilder<AutoScanWorker>(intervalHours, TimeUnit.HOURS)
            .setConstraints(constraints)
            .build()

        WorkManager.getInstance(context).enqueueUniquePeriodicWork(
            AutoScanWorker.UNIQUE_WORK_NAME,
            ExistingPeriodicWorkPolicy.UPDATE,
            request
        )

        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.PERIODIC_METADATA_REFRESH,
                state = JobExecutionState.QUEUED,
                jobId = request.id.toString(),
                message = "Periodic metadata refresh scheduled"
            )
        )
    }

    fun cancelPeriodicMetadataRefresh(context: Context) {
        WorkManager.getInstance(context).cancelUniqueWork(AutoScanWorker.UNIQUE_WORK_NAME)
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.PERIODIC_METADATA_REFRESH,
                state = JobExecutionState.CANCELLED,
                jobId = AutoScanWorker.UNIQUE_WORK_NAME,
                message = "Periodic metadata refresh cancelled"
            )
        )
    }

    fun scheduleFeedCatalogSync(context: Context, intervalMinutes: Long, wifiOnly: Boolean) {
        val constraints = Constraints.Builder()
            .setRequiredNetworkType(if (wifiOnly) NetworkType.UNMETERED else NetworkType.CONNECTED)
            .build()

        val request = PeriodicWorkRequestBuilder<SyncWorker>(intervalMinutes, TimeUnit.MINUTES)
            .setConstraints(constraints)
            .build()

        WorkManager.getInstance(context).enqueueUniquePeriodicWork(
            CLOUD_SYNC_WORK_NAME,
            ExistingPeriodicWorkPolicy.REPLACE,
            request
        )

        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.FEED_CATALOG_SYNC,
                state = JobExecutionState.QUEUED,
                jobId = request.id.toString(),
                message = "Feed/catalog sync scheduled"
            )
        )
    }

    fun cancelFeedCatalogSync(context: Context) {
        WorkManager.getInstance(context).cancelUniqueWork(CLOUD_SYNC_WORK_NAME)
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.FEED_CATALOG_SYNC,
                state = JobExecutionState.CANCELLED,
                jobId = CLOUD_SYNC_WORK_NAME,
                message = "Feed/catalog sync cancelled"
            )
        )
    }

    fun scheduleWebFictionUpdateScan(context: Context, intervalHours: Long) {
        val request = PeriodicWorkRequestBuilder<MangaUpdateWorker>(intervalHours, TimeUnit.HOURS)
            .setConstraints(
                Constraints.Builder()
                    .setRequiredNetworkType(NetworkType.CONNECTED)
                    .build()
            )
            .build()

        WorkManager.getInstance(context).enqueueUniquePeriodicWork(
            MANGA_UPDATE_WORK_NAME,
            ExistingPeriodicWorkPolicy.UPDATE,
            request
        )

        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.WEB_FICTION_UPDATE_SCAN,
                state = JobExecutionState.QUEUED,
                jobId = request.id.toString(),
                message = "Web fiction update scan scheduled"
            )
        )
    }

    fun cancelWebFictionUpdateScan(context: Context) {
        WorkManager.getInstance(context).cancelUniqueWork(MANGA_UPDATE_WORK_NAME)
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.WEB_FICTION_UPDATE_SCAN,
                state = JobExecutionState.CANCELLED,
                jobId = MANGA_UPDATE_WORK_NAME,
                message = "Web fiction update scan cancelled"
            )
        )
    }

    fun queueThumbnailPreviewGeneration(jobId: String, message: String = "Queued thumbnail/preview generation") {
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.THUMBNAIL_PREVIEW_GENERATION,
                state = JobExecutionState.QUEUED,
                jobId = jobId,
                message = message
            )
        )
    }
}
