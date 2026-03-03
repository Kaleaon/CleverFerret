package com.universalmedialibrary.workers

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.SystemClock
import androidx.core.app.NotificationCompat
import androidx.work.CoroutineWorker
import androidx.work.ForegroundInfo
import androidx.work.WorkerParameters
import androidx.work.workDataOf
import com.universalmedialibrary.jobs.JobContractType
import com.universalmedialibrary.jobs.JobExecutionState
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.JobStatusEvent
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

        val plansDir = File(applicationContext.filesDir, "import_plans")

        fun isSafeFileName(name: String): Boolean {
            val safe = Regex("^[A-Za-z0-9._-]+$")
            return safe.matches(name) && !name.contains("..")
        }

        if (!isSafeFileName(planFileName) || !isSafeFileName(stateFileName)) {
            ErrorLogger.logWarning("ImportPlanWorker", "Invalid plan/state file name", null)
            return@withContext Result.failure()
        }

        fun File.isUnder(dir: File): Boolean =
            runCatching {
                canonicalFile.path.startsWith(dir.canonicalFile.path + File.separator)
            }.getOrDefault(false)

        val planFile = File(plansDir, planFileName)
        val stateFile = File(plansDir, stateFileName)

        if (!planFile.isUnder(plansDir) || !stateFile.isUnder(plansDir)) {
            ErrorLogger.logWarning("ImportPlanWorker", "Invalid plan/state file path", null)
            return@withContext Result.failure()
        }
        if (!planFile.exists()) return@withContext Result.failure()

        val plan = runCatching { json.decodeFromString<ImportPlan>(planFile.readText()) }.getOrNull()
            ?: return@withContext Result.failure()
        val options = runCatching { json.decodeFromString<ImportSortOptions>(optionsJson) }.getOrNull()
            ?: return@withContext Result.failure()

        val startIndex = runCatching { stateFile.readText().trim().toInt() }.getOrNull()?.coerceAtLeast(0) ?: 0

        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.ONE_OFF_IMPORT,
                state = JobExecutionState.RUNNING,
                jobId = id.toString(),
                message = "Import execution started"
            )
        )

        setForeground(createForegroundInfo("Starting import…"))

        val storageService = EntryPointAccessors.fromApplication(
            applicationContext,
            ImportWorkerEntryPoint::class.java
        ).storageService()

        var lastForegroundUpdateMs = 0L
        var lastForegroundMsg: String? = null

        val result = storageService.executeImportPlanAdvanced(
            context = applicationContext,
            plan = plan,
            options = options,
            startIndex = startIndex,
            progressCallback = { msg ->
                val now = SystemClock.elapsedRealtime()
                if (msg != lastForegroundMsg && (now - lastForegroundUpdateMs) >= 400) {
                    lastForegroundMsg = msg
                    lastForegroundUpdateMs = now
                    JobStatusBus.publish(
                        JobStatusEvent(
                            contractType = JobContractType.ONE_OFF_IMPORT,
                            state = JobExecutionState.PROGRESS,
                            jobId = id.toString(),
                            message = msg
                        )
                    )
                    setForegroundAsync(createForegroundInfo(msg))
                }
            },
            checkpointCallback = { idx ->
                // Store next index to process (resume-friendly)
                runCatching {
                    stateFile.parentFile?.mkdirs()
                    stateFile.writeText((idx + 1).toString())
                }.onFailure { e ->
                    ErrorLogger.logWarning("ImportPlanWorker", "Checkpoint save failed at index $idx", e)
                }
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.ONE_OFF_IMPORT,
                        state = JobExecutionState.PROGRESS,
                        jobId = id.toString(),
                        message = "Import checkpoint",
                        progress = idx + 1,
                        total = plan.items.size
                    )
                )
                setProgressAsync(workDataOf("index" to idx, "total" to plan.items.size))
            }
        )

        // Cleanup state file after success
        if (result.errors == 0) runCatching { stateFile.delete() }

        when {
            result.errors == 0 -> {
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.ONE_OFF_IMPORT,
                        state = JobExecutionState.SUCCEEDED,
                        jobId = id.toString(),
                        message = "Import completed successfully"
                    )
                )
                Result.success()
            }
            runAttemptCount < 3 -> {
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.ONE_OFF_IMPORT,
                        state = JobExecutionState.FAILED,
                        jobId = id.toString(),
                        message = "Import failed, retrying"
                    )
                )
                Result.retry()
            }
            else -> {
                JobStatusBus.publish(
                    JobStatusEvent(
                        contractType = JobContractType.ONE_OFF_IMPORT,
                        state = JobExecutionState.FAILED,
                        jobId = id.toString(),
                        message = "Import failed permanently"
                    )
                )
                Result.failure(workDataOf("errors" to result.errors))
            }
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

