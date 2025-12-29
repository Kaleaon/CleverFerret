package com.universalmedialibrary.services.backup

import android.content.Context
import android.os.Environment
import android.os.StatFs
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.zip.ZipEntry
import java.util.zip.ZipInputStream
import java.util.zip.ZipOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Local Backup Service
 * 
 * Handles backup of AI logs, documents, and settings to local storage or SD card.
 * Provides options for internal storage, external storage (SD card), or custom paths.
 */
@Singleton
class LocalBackupService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val BACKUP_FOLDER_NAME = "CleverFerret"
        private const val AI_LOGS_FOLDER = "AI_Logs"
        private const val DOCUMENTS_FOLDER = "Documents"
        private const val SETTINGS_FOLDER = "Settings"
        private const val MEDIA_CACHE_FOLDER = "MediaCache"
        private const val DATE_FORMAT = "yyyy-MM-dd_HH-mm-ss"
    }
    
    private val _backupStatus = MutableStateFlow<BackupStatus>(BackupStatus.Idle)
    val backupStatus: StateFlow<BackupStatus> = _backupStatus.asStateFlow()
    
    private val _storageInfo = MutableStateFlow<StorageInfo?>(null)
    val storageInfo: StateFlow<StorageInfo?> = _storageInfo.asStateFlow()
    
    /**
     * Get available storage locations
     */
    fun getAvailableStorageLocations(): List<StorageLocation> {
        val locations = mutableListOf<StorageLocation>()
        
        // Internal storage (always available)
        val internalDir = context.getExternalFilesDir(null)
        if (internalDir != null) {
            locations.add(
                StorageLocation(
                    id = "internal",
                    name = "Internal Storage",
                    path = File(internalDir, BACKUP_FOLDER_NAME).absolutePath,
                    type = StorageType.INTERNAL,
                    isAvailable = true,
                    freeSpace = getFreeSpace(internalDir),
                    totalSpace = getTotalSpace(internalDir)
                )
            )
        }
        
        // External storage directories (SD card, USB, etc.)
        val externalDirs = context.getExternalFilesDirs(null)
        externalDirs.forEachIndexed { index, dir ->
            if (dir != null && index > 0) { // Skip first one (internal)
                val isRemovable = Environment.isExternalStorageRemovable(dir)
                locations.add(
                    StorageLocation(
                        id = "external_$index",
                        name = if (isRemovable) "SD Card ${if (index > 1) index else ""}" else "External Storage $index",
                        path = File(dir, BACKUP_FOLDER_NAME).absolutePath,
                        type = if (isRemovable) StorageType.SD_CARD else StorageType.EXTERNAL,
                        isAvailable = true,
                        freeSpace = getFreeSpace(dir),
                        totalSpace = getTotalSpace(dir)
                    )
                )
            }
        }
        
        // App-specific internal storage (fallback, always writable)
        locations.add(
            StorageLocation(
                id = "app_internal",
                name = "App Storage",
                path = File(context.filesDir, BACKUP_FOLDER_NAME).absolutePath,
                type = StorageType.APP_INTERNAL,
                isAvailable = true,
                freeSpace = getFreeSpace(context.filesDir),
                totalSpace = getTotalSpace(context.filesDir)
            )
        )
        
        return locations
    }
    
    private fun getFreeSpace(file: File): Long {
        return try {
            val stat = StatFs(file.absolutePath)
            stat.availableBlocksLong * stat.blockSizeLong
        } catch (e: Exception) {
            0L
        }
    }
    
    private fun getTotalSpace(file: File): Long {
        return try {
            val stat = StatFs(file.absolutePath)
            stat.blockCountLong * stat.blockSizeLong
        } catch (e: Exception) {
            0L
        }
    }
    
    /**
     * Get or create backup directory
     */
    suspend fun getBackupDirectory(locationId: String = "internal"): File? = withContext(Dispatchers.IO) {
        val location = getAvailableStorageLocations().find { it.id == locationId }
        location?.let {
            val dir = File(it.path)
            if (!dir.exists()) {
                dir.mkdirs()
            }
            dir
        }
    }
    
    /**
     * Save AI chat log to local storage
     */
    suspend fun saveAILog(
        characterName: String,
        content: String,
        locationId: String = "internal"
    ): Result<File> = withContext(Dispatchers.IO) {
        try {
            _backupStatus.value = BackupStatus.Saving("AI log for $characterName")
            
            val backupDir = getBackupDirectory(locationId)
                ?: return@withContext Result.failure(Exception("Storage location not available"))
            
            val aiLogsDir = File(backupDir, AI_LOGS_FOLDER)
            if (!aiLogsDir.exists()) {
                aiLogsDir.mkdirs()
            }
            
            val timestamp = SimpleDateFormat(DATE_FORMAT, Locale.getDefault()).format(Date())
            val sanitizedName = characterName.replace(Regex("[^a-zA-Z0-9_-]"), "_")
            val fileName = "${sanitizedName}_$timestamp.md"
            
            val file = File(aiLogsDir, fileName)
            file.writeText(content)
            
            _backupStatus.value = BackupStatus.Idle
            Result.success(file)
        } catch (e: Exception) {
            _backupStatus.value = BackupStatus.Error(e.message ?: "Failed to save AI log")
            Result.failure(e)
        }
    }
    
    /**
     * Save document to local storage
     */
    suspend fun saveDocument(
        title: String,
        content: String,
        format: String = "md",
        locationId: String = "internal"
    ): Result<File> = withContext(Dispatchers.IO) {
        try {
            _backupStatus.value = BackupStatus.Saving(title)
            
            val backupDir = getBackupDirectory(locationId)
                ?: return@withContext Result.failure(Exception("Storage location not available"))
            
            val docsDir = File(backupDir, DOCUMENTS_FOLDER)
            if (!docsDir.exists()) {
                docsDir.mkdirs()
            }
            
            val sanitizedTitle = title.replace(Regex("[^a-zA-Z0-9_-]"), "_")
            val fileName = "$sanitizedTitle.$format"
            
            val file = File(docsDir, fileName)
            file.writeText(content)
            
            _backupStatus.value = BackupStatus.Idle
            Result.success(file)
        } catch (e: Exception) {
            _backupStatus.value = BackupStatus.Error(e.message ?: "Failed to save document")
            Result.failure(e)
        }
    }
    
    /**
     * List saved AI logs
     */
    suspend fun listAILogs(locationId: String = "internal"): List<BackupFile> = withContext(Dispatchers.IO) {
        val backupDir = getBackupDirectory(locationId) ?: return@withContext emptyList()
        val aiLogsDir = File(backupDir, AI_LOGS_FOLDER)
        
        if (!aiLogsDir.exists()) return@withContext emptyList()
        
        aiLogsDir.listFiles()?.map { file ->
            BackupFile(
                name = file.name,
                path = file.absolutePath,
                size = file.length(),
                lastModified = file.lastModified(),
                type = BackupFileType.AI_LOG
            )
        }?.sortedByDescending { it.lastModified } ?: emptyList()
    }
    
    /**
     * List saved documents
     */
    suspend fun listDocuments(locationId: String = "internal"): List<BackupFile> = withContext(Dispatchers.IO) {
        val backupDir = getBackupDirectory(locationId) ?: return@withContext emptyList()
        val docsDir = File(backupDir, DOCUMENTS_FOLDER)
        
        if (!docsDir.exists()) return@withContext emptyList()
        
        docsDir.listFiles()?.map { file ->
            BackupFile(
                name = file.name,
                path = file.absolutePath,
                size = file.length(),
                lastModified = file.lastModified(),
                type = BackupFileType.DOCUMENT
            )
        }?.sortedByDescending { it.lastModified } ?: emptyList()
    }
    
    /**
     * Read file content
     */
    suspend fun readFile(path: String): Result<String> = withContext(Dispatchers.IO) {
        try {
            val file = File(path)
            if (!file.exists()) {
                return@withContext Result.failure(Exception("File not found"))
            }
            Result.success(file.readText())
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Delete a backup file
     */
    suspend fun deleteFile(path: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val file = File(path)
            if (file.exists()) {
                file.delete()
            }
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Create a full backup of all AI logs and documents
     */
    suspend fun createFullBackup(locationId: String = "internal"): Result<File> = withContext(Dispatchers.IO) {
        try {
            _backupStatus.value = BackupStatus.CreatingBackup
            
            val backupDir = getBackupDirectory(locationId)
                ?: return@withContext Result.failure(Exception("Storage location not available"))
            
            val timestamp = SimpleDateFormat(DATE_FORMAT, Locale.getDefault()).format(Date())
            val backupFileName = "CleverFerret_Backup_$timestamp.zip"
            val backupFile = File(backupDir, backupFileName)
            
            ZipOutputStream(FileOutputStream(backupFile)).use { zipOut ->
                // Add AI logs
                val aiLogsDir = File(backupDir, AI_LOGS_FOLDER)
                if (aiLogsDir.exists()) {
                    addFolderToZip(zipOut, aiLogsDir, AI_LOGS_FOLDER)
                }
                
                // Add documents
                val docsDir = File(backupDir, DOCUMENTS_FOLDER)
                if (docsDir.exists()) {
                    addFolderToZip(zipOut, docsDir, DOCUMENTS_FOLDER)
                }
                
                // Add settings
                val settingsDir = File(backupDir, SETTINGS_FOLDER)
                if (settingsDir.exists()) {
                    addFolderToZip(zipOut, settingsDir, SETTINGS_FOLDER)
                }
            }
            
            _backupStatus.value = BackupStatus.Idle
            Result.success(backupFile)
        } catch (e: Exception) {
            _backupStatus.value = BackupStatus.Error(e.message ?: "Backup failed")
            Result.failure(e)
        }
    }
    
    private fun addFolderToZip(zipOut: ZipOutputStream, folder: File, basePath: String) {
        folder.listFiles()?.forEach { file ->
            val entryPath = "$basePath/${file.name}"
            if (file.isDirectory) {
                addFolderToZip(zipOut, file, entryPath)
            } else {
                zipOut.putNextEntry(ZipEntry(entryPath))
                FileInputStream(file).use { input ->
                    input.copyTo(zipOut)
                }
                zipOut.closeEntry()
            }
        }
    }
    
    /**
     * Restore from a backup file
     */
    suspend fun restoreFromBackup(backupFilePath: String, locationId: String = "internal"): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            _backupStatus.value = BackupStatus.Restoring
            
            val backupDir = getBackupDirectory(locationId)
                ?: return@withContext Result.failure(Exception("Storage location not available"))
            
            val backupFile = File(backupFilePath)
            if (!backupFile.exists()) {
                return@withContext Result.failure(Exception("Backup file not found"))
            }
            
            ZipInputStream(FileInputStream(backupFile)).use { zipIn ->
                var entry = zipIn.nextEntry
                while (entry != null) {
                    val destFile = File(backupDir, entry.name)
                    
                    if (entry.isDirectory) {
                        destFile.mkdirs()
                    } else {
                        destFile.parentFile?.mkdirs()
                        FileOutputStream(destFile).use { output ->
                            zipIn.copyTo(output)
                        }
                    }
                    
                    zipIn.closeEntry()
                    entry = zipIn.nextEntry
                }
            }
            
            _backupStatus.value = BackupStatus.Idle
            Result.success(Unit)
        } catch (e: Exception) {
            _backupStatus.value = BackupStatus.Error(e.message ?: "Restore failed")
            Result.failure(e)
        }
    }
    
    /**
     * Get storage statistics
     */
    suspend fun getStorageStats(locationId: String = "internal"): StorageStats = withContext(Dispatchers.IO) {
        val backupDir = getBackupDirectory(locationId)
        
        var aiLogsCount = 0
        var aiLogsSize = 0L
        var documentsCount = 0
        var documentsSize = 0L
        var backupsCount = 0
        var backupsSize = 0L
        
        if (backupDir != null && backupDir.exists()) {
            File(backupDir, AI_LOGS_FOLDER).listFiles()?.let { files ->
                aiLogsCount = files.size
                aiLogsSize = files.sumOf { it.length() }
            }
            
            File(backupDir, DOCUMENTS_FOLDER).listFiles()?.let { files ->
                documentsCount = files.size
                documentsSize = files.sumOf { it.length() }
            }
            
            backupDir.listFiles { file -> file.extension == "zip" }?.let { files ->
                backupsCount = files.size
                backupsSize = files.sumOf { it.length() }
            }
        }
        
        StorageStats(
            aiLogsCount = aiLogsCount,
            aiLogsSize = aiLogsSize,
            documentsCount = documentsCount,
            documentsSize = documentsSize,
            backupsCount = backupsCount,
            backupsSize = backupsSize,
            totalSize = aiLogsSize + documentsSize + backupsSize
        )
    }
    
    /**
     * Export conversation to file
     */
    suspend fun exportConversation(
        messages: List<ConversationMessage>,
        characterName: String,
        format: ExportFormat = ExportFormat.MARKDOWN,
        locationId: String = "internal"
    ): Result<File> = withContext(Dispatchers.IO) {
        try {
            val content = when (format) {
                ExportFormat.MARKDOWN -> formatAsMarkdown(messages, characterName)
                ExportFormat.JSON -> formatAsJson(messages, characterName)
                ExportFormat.PLAIN_TEXT -> formatAsPlainText(messages, characterName)
            }
            
            val extension = when (format) {
                ExportFormat.MARKDOWN -> "md"
                ExportFormat.JSON -> "json"
                ExportFormat.PLAIN_TEXT -> "txt"
            }
            
            saveDocument(
                title = "Chat_${characterName}_${System.currentTimeMillis()}",
                content = content,
                format = extension,
                locationId = locationId
            )
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    private fun formatAsMarkdown(messages: List<ConversationMessage>, characterName: String): String {
        val sb = StringBuilder()
        sb.appendLine("# Conversation with $characterName")
        sb.appendLine()
        sb.appendLine("*Exported on ${SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(Date())}*")
        sb.appendLine()
        sb.appendLine("---")
        sb.appendLine()
        
        messages.forEach { msg ->
            val sender = if (msg.isUser) "**You**" else "**$characterName**"
            sb.appendLine("$sender:")
            sb.appendLine()
            sb.appendLine(msg.content)
            sb.appendLine()
            sb.appendLine("---")
            sb.appendLine()
        }
        
        return sb.toString()
    }
    
    private fun formatAsJson(messages: List<ConversationMessage>, characterName: String): String {
        val messagesJson = messages.map { msg ->
            """{"role":"${if (msg.isUser) "user" else "assistant"}","content":"${msg.content.replace("\"", "\\\"")}","timestamp":${msg.timestamp}}"""
        }.joinToString(",\n  ")
        
        return """{
  "character": "$characterName",
  "exportedAt": ${System.currentTimeMillis()},
  "messages": [
  $messagesJson
  ]
}"""
    }
    
    private fun formatAsPlainText(messages: List<ConversationMessage>, characterName: String): String {
        val sb = StringBuilder()
        sb.appendLine("Conversation with $characterName")
        sb.appendLine("=" .repeat(50))
        sb.appendLine()
        
        messages.forEach { msg ->
            val sender = if (msg.isUser) "You" else characterName
            sb.appendLine("[$sender]")
            sb.appendLine(msg.content)
            sb.appendLine()
        }
        
        return sb.toString()
    }
}

/**
 * Storage location information
 */
data class StorageLocation(
    val id: String,
    val name: String,
    val path: String,
    val type: StorageType,
    val isAvailable: Boolean,
    val freeSpace: Long,
    val totalSpace: Long
) {
    val freeSpaceFormatted: String
        get() = formatSize(freeSpace)
    
    val totalSpaceFormatted: String
        get() = formatSize(totalSpace)
    
    val usedPercentage: Float
        get() = if (totalSpace > 0) ((totalSpace - freeSpace).toFloat() / totalSpace) else 0f
    
    private fun formatSize(bytes: Long): String {
        return when {
            bytes >= 1_000_000_000 -> String.format("%.1f GB", bytes / 1_000_000_000.0)
            bytes >= 1_000_000 -> String.format("%.1f MB", bytes / 1_000_000.0)
            bytes >= 1_000 -> String.format("%.1f KB", bytes / 1_000.0)
            else -> "$bytes B"
        }
    }
}

enum class StorageType {
    INTERNAL,
    EXTERNAL,
    SD_CARD,
    APP_INTERNAL
}

/**
 * Backup file information
 */
data class BackupFile(
    val name: String,
    val path: String,
    val size: Long,
    val lastModified: Long,
    val type: BackupFileType
) {
    val sizeFormatted: String
        get() = when {
            size >= 1_000_000 -> String.format("%.1f MB", size / 1_000_000.0)
            size >= 1_000 -> String.format("%.1f KB", size / 1_000.0)
            else -> "$size B"
        }
    
    val lastModifiedFormatted: String
        get() = SimpleDateFormat("MMM dd, yyyy HH:mm", Locale.getDefault()).format(Date(lastModified))
}

enum class BackupFileType {
    AI_LOG,
    DOCUMENT,
    SETTINGS,
    FULL_BACKUP
}

/**
 * Backup status
 */
sealed class BackupStatus {
    object Idle : BackupStatus()
    data class Saving(val item: String) : BackupStatus()
    object CreatingBackup : BackupStatus()
    object Restoring : BackupStatus()
    data class Error(val message: String) : BackupStatus()
}

/**
 * Storage statistics
 */
data class StorageStats(
    val aiLogsCount: Int,
    val aiLogsSize: Long,
    val documentsCount: Int,
    val documentsSize: Long,
    val backupsCount: Int,
    val backupsSize: Long,
    val totalSize: Long
) {
    val totalSizeFormatted: String
        get() = when {
            totalSize >= 1_000_000_000 -> String.format("%.1f GB", totalSize / 1_000_000_000.0)
            totalSize >= 1_000_000 -> String.format("%.1f MB", totalSize / 1_000_000.0)
            totalSize >= 1_000 -> String.format("%.1f KB", totalSize / 1_000.0)
            else -> "$totalSize B"
        }
}

/**
 * Storage info
 */
data class StorageInfo(
    val location: StorageLocation,
    val stats: StorageStats
)

/**
 * Export format options
 */
enum class ExportFormat {
    MARKDOWN,
    JSON,
    PLAIN_TEXT
}

/**
 * Simple conversation message for export
 */
data class ConversationMessage(
    val content: String,
    val isUser: Boolean,
    val timestamp: Long = System.currentTimeMillis()
)
