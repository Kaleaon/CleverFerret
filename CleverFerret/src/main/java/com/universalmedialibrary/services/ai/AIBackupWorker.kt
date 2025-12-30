package com.universalmedialibrary.services.ai

import android.content.Context
import androidx.hilt.work.HiltWorker
import androidx.work.*
import com.universalmedialibrary.utils.ErrorLogger
import dagger.assisted.Assisted
import dagger.assisted.AssistedInject
import kotlinx.coroutines.flow.first

/**
 * Background worker for automated AI data backup
 */
@HiltWorker
class AIBackupWorker @AssistedInject constructor(
    @Assisted context: Context,
    @Assisted workerParams: WorkerParameters,
    private val aiBackupAutomationService: AIBackupAutomationService
) : CoroutineWorker(context, workerParams) {

    override suspend fun doWork(): Result {
        return try {
            ErrorLogger.logInfo("AIBackupWorker", "Starting automated AI backup")
            
            // Check if backup is enabled
            if (!aiBackupAutomationService.isBackupEnabled()) {
                ErrorLogger.logInfo("AIBackupWorker", "Backup is disabled, skipping")
                return Result.success()
            }
            
            // Perform backup
            val backupResult = aiBackupAutomationService.performBackup()
            
            if (backupResult.success) {
                ErrorLogger.logInfo(
                    "AIBackupWorker", 
                    "Backup completed successfully: ${backupResult.backupFile?.name}"
                )
                Result.success()
            } else {
                ErrorLogger.logError(
                    "AIBackupWorker", 
                    "Backup failed: ${backupResult.error}"
                )
                Result.retry()
            }
            
        } catch (e: Exception) {
            ErrorLogger.logError("AIBackupWorker", "Backup worker failed", e)
            Result.failure()
        }
    }
}

/**
 * Background worker for AI data restore
 */
@HiltWorker
class AIRestoreWorker @AssistedInject constructor(
    @Assisted context: Context,
    @Assisted workerParams: WorkerParameters,
    private val aiBackupAutomationService: AIBackupAutomationService
) : CoroutineWorker(context, workerParams) {

    override suspend fun doWork(): Result {
        return try {
            val backupFilePath = inputData.getString("backup_file_path")
                ?: return Result.failure()
            
            val backupFile = java.io.File(backupFilePath)
            if (!backupFile.exists()) {
                ErrorLogger.logError("AIRestoreWorker", "Backup file not found: $backupFilePath")
                return Result.failure()
            }
            
            ErrorLogger.logInfo("AIRestoreWorker", "Starting AI restore from: ${backupFile.name}")
            
            val restoreResult = aiBackupAutomationService.performRestore(backupFile)
            
            if (restoreResult.success) {
                ErrorLogger.logInfo(
                    "AIRestoreWorker", 
                    "Restore completed: ${restoreResult.charactersRestored} characters, ${restoreResult.memoriesRestored} memories"
                )
                Result.success()
            } else {
                ErrorLogger.logError(
                    "AIRestoreWorker", 
                    "Restore failed: ${restoreResult.error}"
                )
                Result.failure()
            }
            
        } catch (e: Exception) {
            ErrorLogger.logError("AIRestoreWorker", "Restore worker failed", e)
            Result.failure()
        }
    }
}