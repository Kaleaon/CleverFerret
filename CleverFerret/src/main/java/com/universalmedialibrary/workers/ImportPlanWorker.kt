package com.universalmedialibrary.workers

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.work.CoroutineWorker
import androidx.work.ForegroundInfo
import androidx.work.WorkerParameters
import androidx.work.workDataOf
import com.universalmedialibrary.utils.ErrorLogger
import com.universalmedialibrary.services.ImportPlan
import com.universalmedialibrary.services.ImportSortOptions
import com.universalmedialibrary.services.StorageAccessService
import dagger.hilt.android.EntryPointAccessors
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString
import java.io.File

/**
 * Background import worker (WorkManager).
 *
 * Uses a saved ImportPlan JSON file stored in app internal storage.
 */
class ImportPlanWorker(
    appContext: Context,
    params: WorkerParameters
) : CoroutineWorker(appContext, params) {

    companion object {
        const val KEY_PLAN_FILE = "plan_file"
        const val KEY_OPTIONS_JSON = "options_json"
        const val KEY_STATE_FILE = "state_file"

        private const val CHANNEL_ID = "import_sorter_channel"
        private const val NOTIFICATION_ID = 901
    }

    private val json = Json { ignoreUnknownKeys = true }

    override suspend fun doWork(): Result = withContext(Dispatchers.IO) {
        val planFileName = inputData.getString(KEY_PLAN_FILE) ?: return@withContext Result.failure()
        val optionsJson = inputData.getString(KEY_OPTIONS_JSON) ?: return@withContext Result.failure()
        val stateFileName = inputData.getString(KEY_STATE_FILE) ?: "import_state_${id}.txt"

        val planFile = File(File(applicationContext.filesDir, "import_plans"), planFileName)
        if (!planFile.exists()) return@withContext Result.failure()

        val plan = runCatching { json.decodeFromString<ImportPlan>(planFile.readText()) }.getOrNull()
            ?: return@withContext Result.failure()
        val options = runCatching { json.decodeFromString<ImportSortOptions>(optionsJson) }.getOrNull()
            ?: return@withContext Result.failure()

        val stateFile = File(File(applicationContext.filesDir, "import_plans"), stateFileName)
        val startIndex = runCatching { stateFile.readText().trim().toInt() }.getOrNull()?.coerceAtLeast(0) ?: 0

        setForeground(createForegroundInfo("Starting import…"))

        val storageService = EntryPointAccessors.fromApplication(
            applicationContext,
            ImportWorkerEntryPoint::class.java
        ).storageService()

        val result = storageService.executeImportPlanAdvanced(
            context = applicationContext,
            plan = plan,
            options = options,
            startIndex = startIndex,
            progressCallback = { msg ->
                setForegroundAsync(createForegroundInfo(msg))
            },
            checkpointCallback = { idx ->
                // Store next index to process (resume-friendly)
                runCatching {
                    stateFile.parentFile?.mkdirs()
                    stateFile.writeText((idx + 1).toString())
                }.onFailure { e ->
                    ErrorLogger.logWarning("ImportPlanWorker", "Checkpoint save failed at index $idx", e)
                }
                setProgressAsync(workDataOf("index" to idx, "total" to plan.items.size))
            }
        )

        // Cleanup state file after success
        if (result.errors == 0) runCatching { stateFile.delete() }

        when {
            result.errors == 0 -> Result.success()
            runAttemptCount < 3 -> Result.retry()
            else -> Result.failure(workDataOf("errors" to result.errors))
        }
    }

    private fun createForegroundInfo(contentText: String): ForegroundInfo {
        createNotificationChannel()
        val notification = NotificationCompat.Builder(applicationContext, CHANNEL_ID)
            .setContentTitle("Import Sorter")
            .setContentText(contentText)
            .setSmallIcon(android.R.drawable.stat_sys_download)
            .setOngoing(true)
            .build()
        return ForegroundInfo(NOTIFICATION_ID, notification)
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val manager = applicationContext.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val channel = NotificationChannel(
            CHANNEL_ID,
            "Import Sorter",
            NotificationManager.IMPORTANCE_LOW
        )
        manager.createNotificationChannel(channel)
    }
}

@dagger.hilt.EntryPoint
@dagger.hilt.InstallIn(dagger.hilt.components.SingletonComponent::class)
interface ImportWorkerEntryPoint {
    fun storageService(): StorageAccessService
}

