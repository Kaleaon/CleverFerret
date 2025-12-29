package com.universalmedialibrary.services.ai

import android.content.Context
import android.net.Uri
import android.os.Environment
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.data.aientertainment.SynthCharacter
import com.universalmedialibrary.data.aientertainment.SynthMessage
import com.universalmedialibrary.data.preferences.AISettingsPreferencesStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing AI conversation logs storage.
 * Supports saving logs to internal storage, external storage, or SD card.
 */
@Singleton
class AILogStorageService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val aiSettings: AISettingsPreferencesStore
) {
    private val json = Json { 
        prettyPrint = true 
        ignoreUnknownKeys = true
    }
    
    companion object {
        const val LOG_FOLDER_NAME = "ai_logs"
        const val EXPORT_FOLDER_NAME = "CleverFerret/AI_Logs"
        
        // Storage location options
        const val STORAGE_INTERNAL = "internal"
        const val STORAGE_EXTERNAL = "external"
        const val STORAGE_SD_CARD = "sd_card"
        const val STORAGE_CUSTOM_SAF = "custom_saf"
    }
    
    /**
     * Get the base directory for AI logs based on current settings
     */
    suspend fun getLogDirectory(): File {
        val storageLocation = aiSettings.aiLogStorageLocation.first()
        
        return when (storageLocation) {
            STORAGE_EXTERNAL -> {
                val externalDir = context.getExternalFilesDir(null)
                    ?: File(context.filesDir, LOG_FOLDER_NAME)
                File(externalDir, LOG_FOLDER_NAME).also { it.mkdirs() }
            }
            STORAGE_SD_CARD -> {
                getSdCardLogDirectory() ?: File(context.filesDir, LOG_FOLDER_NAME).also { it.mkdirs() }
            }
            else -> {
                File(context.filesDir, LOG_FOLDER_NAME).also { it.mkdirs() }
            }
        }
    }
    
    /**
     * Get SD card directory for logs if available
     */
    private fun getSdCardLogDirectory(): File? {
        val externalDirs = context.getExternalFilesDirs(null)
        // Find SD card (not primary external storage)
        val sdCardDir = externalDirs.getOrNull(1)
        return sdCardDir?.let {
            File(it, LOG_FOLDER_NAME).also { dir -> dir.mkdirs() }
        }
    }
    
    /**
     * Check if SD card is available
     */
    fun isSdCardAvailable(): Boolean {
        val externalDirs = context.getExternalFilesDirs(null)
        return externalDirs.size > 1 && externalDirs[1] != null
    }
    
    /**
     * Save a conversation log for a character
     */
    suspend fun saveConversationLog(
        character: SynthCharacter,
        messages: List<SynthMessage>,
        sessionId: String? = null
    ): Result<File> = withContext(Dispatchers.IO) {
        try {
            val logDir = getLogDirectory()
            val characterDir = File(logDir, sanitizeFileName(character.name)).also { it.mkdirs() }
            
            val timestamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(Date())
            val fileName = "chat_${sessionId ?: timestamp}.json"
            val logFile = File(characterDir, fileName)
            
            val logEntry = ConversationLog(
                characterId = character.id,
                characterName = character.name,
                sessionId = sessionId ?: timestamp,
                timestamp = System.currentTimeMillis(),
                messages = messages.map { msg ->
                    LoggedMessage(
                        id = msg.id,
                        role = msg.role,
                        content = msg.content,
                        emotion = msg.emotion,
                        thoughtPattern = msg.thoughtPattern,
                        timestamp = msg.createdAt
                    )
                },
                metadata = LogMetadata(
                    characterPersonality = character.personality,
                    characterModel = character.model,
                    totalMessages = messages.size
                )
            )
            
            logFile.writeText(json.encodeToString(logEntry))
            Result.success(logFile)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Export all logs for a character to a readable format
     */
    suspend fun exportConversationLogs(
        character: SynthCharacter,
        format: ExportFormat = ExportFormat.JSON
    ): Result<File> = withContext(Dispatchers.IO) {
        try {
            val logDir = getLogDirectory()
            val characterDir = File(logDir, sanitizeFileName(character.name))
            
            if (!characterDir.exists() || !characterDir.isDirectory) {
                return@withContext Result.failure(Exception("No logs found for character"))
            }
            
            val exportDir = getExportDirectory()
            val timestamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(Date())
            
            val exportFile = when (format) {
                ExportFormat.JSON -> {
                    val file = File(exportDir, "${character.name}_logs_$timestamp.json")
                    val allLogs = characterDir.listFiles()?.filter { it.extension == "json" }
                        ?.mapNotNull { 
                            runCatching { json.decodeFromString<ConversationLog>(it.readText()) }.getOrNull()
                        } ?: emptyList()
                    file.writeText(json.encodeToString(allLogs))
                    file
                }
                ExportFormat.TEXT -> {
                    val file = File(exportDir, "${character.name}_logs_$timestamp.txt")
                    val allLogs = characterDir.listFiles()?.filter { it.extension == "json" }
                        ?.mapNotNull { 
                            runCatching { json.decodeFromString<ConversationLog>(it.readText()) }.getOrNull()
                        } ?: emptyList()
                    
                    val textContent = buildString {
                        appendLine("=".repeat(60))
                        appendLine("AI Conversation Logs - ${character.name}")
                        appendLine("Exported: ${SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(Date())}")
                        appendLine("=".repeat(60))
                        appendLine()
                        
                        allLogs.sortedBy { it.timestamp }.forEach { log ->
                            appendLine("-".repeat(40))
                            appendLine("Session: ${log.sessionId}")
                            appendLine("Date: ${SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(Date(log.timestamp))}")
                            appendLine("-".repeat(40))
                            appendLine()
                            
                            log.messages.forEach { msg ->
                                val sender = if (msg.role == "user") "You" else character.name
                                val time = SimpleDateFormat("HH:mm:ss", Locale.US).format(Date(msg.timestamp))
                                appendLine("[$time] $sender:")
                                appendLine(msg.content)
                                if (msg.emotion.isNotBlank() && msg.emotion != "neutral") {
                                    appendLine("(Emotion: ${msg.emotion})")
                                }
                                appendLine()
                            }
                            appendLine()
                        }
                    }
                    file.writeText(textContent)
                    file
                }
                ExportFormat.MARKDOWN -> {
                    val file = File(exportDir, "${character.name}_logs_$timestamp.md")
                    val allLogs = characterDir.listFiles()?.filter { it.extension == "json" }
                        ?.mapNotNull { 
                            runCatching { json.decodeFromString<ConversationLog>(it.readText()) }.getOrNull()
                        } ?: emptyList()
                    
                    val mdContent = buildString {
                        appendLine("# AI Conversation Logs - ${character.name}")
                        appendLine()
                        appendLine("*Exported: ${SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(Date())}*")
                        appendLine()
                        appendLine("---")
                        appendLine()
                        
                        allLogs.sortedBy { it.timestamp }.forEach { log ->
                            appendLine("## Session: ${log.sessionId}")
                            appendLine()
                            appendLine("*${SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(Date(log.timestamp))}*")
                            appendLine()
                            
                            log.messages.forEach { msg ->
                                val sender = if (msg.role == "user") "**You**" else "**${character.name}**"
                                val time = SimpleDateFormat("HH:mm:ss", Locale.US).format(Date(msg.timestamp))
                                appendLine("### $sender ($time)")
                                appendLine()
                                appendLine(msg.content)
                                if (msg.emotion.isNotBlank() && msg.emotion != "neutral") {
                                    appendLine()
                                    appendLine("*Emotion: ${msg.emotion}*")
                                }
                                appendLine()
                            }
                            appendLine("---")
                            appendLine()
                        }
                    }
                    file.writeText(mdContent)
                    file
                }
            }
            
            Result.success(exportFile)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Export logs to a custom SAF location
     */
    suspend fun exportToSafLocation(
        character: SynthCharacter,
        treeUri: Uri,
        format: ExportFormat = ExportFormat.JSON
    ): Result<Uri> = withContext(Dispatchers.IO) {
        try {
            val documentFile = DocumentFile.fromTreeUri(context, treeUri)
                ?: return@withContext Result.failure(Exception("Cannot access location"))
            
            val exportResult = exportConversationLogs(character, format)
            if (exportResult.isFailure) {
                return@withContext Result.failure(exportResult.exceptionOrNull() ?: Exception("Export failed"))
            }
            
            val tempFile = exportResult.getOrThrow()
            val mimeType = when (format) {
                ExportFormat.JSON -> "application/json"
                ExportFormat.TEXT -> "text/plain"
                ExportFormat.MARKDOWN -> "text/markdown"
            }
            
            val destFile = documentFile.createFile(mimeType, tempFile.name)
                ?: return@withContext Result.failure(Exception("Cannot create file"))
            
            context.contentResolver.openOutputStream(destFile.uri)?.use { output ->
                tempFile.inputStream().use { input ->
                    input.copyTo(output)
                }
            }
            
            // Clean up temp file
            tempFile.delete()
            
            Result.success(destFile.uri)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Load all conversation logs for a character
     */
    suspend fun loadConversationLogs(character: SynthCharacter): List<ConversationLog> = withContext(Dispatchers.IO) {
        try {
            val logDir = getLogDirectory()
            val characterDir = File(logDir, sanitizeFileName(character.name))
            
            if (!characterDir.exists() || !characterDir.isDirectory) {
                return@withContext emptyList()
            }
            
            characterDir.listFiles()?.filter { it.extension == "json" }
                ?.mapNotNull { 
                    runCatching { json.decodeFromString<ConversationLog>(it.readText()) }.getOrNull()
                }
                ?.sortedByDescending { it.timestamp }
                ?: emptyList()
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Delete old logs based on retention settings
     */
    suspend fun cleanupOldLogs(retentionDays: Int = 30) = withContext(Dispatchers.IO) {
        try {
            val logDir = getLogDirectory()
            val cutoffTime = System.currentTimeMillis() - (retentionDays * 24 * 60 * 60 * 1000L)
            
            logDir.listFiles()?.forEach { characterDir ->
                if (characterDir.isDirectory) {
                    characterDir.listFiles()?.forEach { logFile ->
                        if (logFile.lastModified() < cutoffTime) {
                            logFile.delete()
                        }
                    }
                    // Remove empty directories
                    if (characterDir.listFiles()?.isEmpty() == true) {
                        characterDir.delete()
                    }
                }
            }
        } catch (e: Exception) {
            // Log cleanup failed, ignore
        }
    }
    
    /**
     * Get total size of stored logs
     */
    suspend fun getLogStorageSize(): Long = withContext(Dispatchers.IO) {
        try {
            val logDir = getLogDirectory()
            calculateDirectorySize(logDir)
        } catch (e: Exception) {
            0L
        }
    }
    
    /**
     * Clear all logs for a character
     */
    suspend fun clearCharacterLogs(character: SynthCharacter) = withContext(Dispatchers.IO) {
        try {
            val logDir = getLogDirectory()
            val characterDir = File(logDir, sanitizeFileName(character.name))
            characterDir.deleteRecursively()
        } catch (e: Exception) {
            // Ignore
        }
    }
    
    /**
     * Clear all AI logs
     */
    suspend fun clearAllLogs() = withContext(Dispatchers.IO) {
        try {
            val logDir = getLogDirectory()
            logDir.deleteRecursively()
            logDir.mkdirs()
        } catch (e: Exception) {
            // Ignore
        }
    }
    
    private fun getExportDirectory(): File {
        val exportDir = if (Environment.getExternalStorageState() == Environment.MEDIA_MOUNTED) {
            File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS), EXPORT_FOLDER_NAME)
        } else {
            File(context.filesDir, "exports/$LOG_FOLDER_NAME")
        }
        exportDir.mkdirs()
        return exportDir
    }
    
    private fun sanitizeFileName(name: String): String {
        return name.replace(Regex("[^a-zA-Z0-9._-]"), "_").take(50)
    }
    
    private fun calculateDirectorySize(dir: File): Long {
        var size = 0L
        dir.listFiles()?.forEach { file ->
            size += if (file.isDirectory) calculateDirectorySize(file) else file.length()
        }
        return size
    }
}

@Serializable
data class ConversationLog(
    val characterId: Long,
    val characterName: String,
    val sessionId: String,
    val timestamp: Long,
    val messages: List<LoggedMessage>,
    val metadata: LogMetadata
)

@Serializable
data class LoggedMessage(
    val id: Long,
    val role: String,
    val content: String,
    val emotion: String,
    val thoughtPattern: String,
    val timestamp: Long
)

@Serializable
data class LogMetadata(
    val characterPersonality: String,
    val characterModel: String,
    val totalMessages: Int
)

enum class ExportFormat {
    JSON,
    TEXT,
    MARKDOWN
}
