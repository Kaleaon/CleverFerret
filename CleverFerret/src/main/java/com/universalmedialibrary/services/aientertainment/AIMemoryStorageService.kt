package com.universalmedialibrary.services.aientertainment

import android.content.Context
import android.net.Uri
import android.os.Environment
import android.os.StatFs
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.data.aientertainment.*
import com.universalmedialibrary.utils.ErrorLogger
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.io.FileOutputStream
import java.io.FileInputStream
import java.security.MessageDigest
import java.util.zip.GZIPOutputStream
import java.util.zip.GZIPInputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for organizing and managing AI memories on internal storage and SD card
 * 
 * Features:
 * - Create and manage memory storage locations
 * - Sync memories between database and external storage
 * - Import/export memory archives
 * - Monitor storage usage and availability
 */
@Singleton
class AIMemoryStorageService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val json = Json { 
        prettyPrint = true 
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    private val _storageStates = MutableStateFlow<List<StorageState>>(emptyList())
    val storageStates: StateFlow<List<StorageState>> = _storageStates.asStateFlow()
    
    private val _syncProgress = MutableStateFlow<SyncProgress?>(null)
    val syncProgress: StateFlow<SyncProgress?> = _syncProgress.asStateFlow()
    
    companion object {
        private const val MEMORY_DIR_NAME = "SynthChat_Memories"
        private const val MEMORY_FILE_EXTENSION = ".memory.json"
        private const val ARCHIVE_EXTENSION = ".memories.gz"
        private const val INDEX_FILE_NAME = "memory_index.json"
        private const val MAX_MEMORY_FILE_SIZE = 10 * 1024 * 1024 // 10MB per memory file
    }
    
    init {
        refreshStorageStates()
    }
    
    // ==================== Storage Discovery ====================
    
    /**
     * Refresh available storage locations
     */
    fun refreshStorageStates() {
        val states = mutableListOf<StorageState>()
        
        // Internal storage
        val internalDir = getInternalMemoryDir()
        if (internalDir.exists() || internalDir.mkdirs()) {
            val stat = StatFs(internalDir.path)
            states.add(StorageState(
                type = StorageType.INTERNAL,
                path = internalDir.absolutePath,
                totalBytes = stat.totalBytes,
                availableBytes = stat.availableBytes,
                isAvailable = true,
                displayName = "Internal Storage"
            ))
        }
        
        // External storage (SD card)
        val externalDirs = context.getExternalFilesDirs(null)
        externalDirs.forEachIndexed { index, dir ->
            if (dir != null && dir.exists()) {
                try {
                    val stat = StatFs(dir.path)
                    val isRemovable = Environment.isExternalStorageRemovable(dir)
                    val memoryDir = File(dir, MEMORY_DIR_NAME)
                    
                    states.add(StorageState(
                        type = if (isRemovable) StorageType.SD_CARD else StorageType.EXTERNAL,
                        path = memoryDir.absolutePath,
                        totalBytes = stat.totalBytes,
                        availableBytes = stat.availableBytes,
                        isAvailable = true,
                        displayName = if (isRemovable) "SD Card" else "External Storage ${index + 1}"
                    ))
                } catch (e: Exception) {
                    ErrorLogger.logWarning("AIMemoryStorage", "Failed to stat external storage: ${dir.path}", e)
                }
            }
        }
        
        _storageStates.value = states
    }
    
    /**
     * Get the internal app-specific directory for memories
     */
    private fun getInternalMemoryDir(): File {
        return File(context.filesDir, MEMORY_DIR_NAME)
    }
    
    /**
     * Get or create a character-specific memory directory
     */
    private fun getCharacterMemoryDir(basePath: String, characterId: Long): File {
        return File(basePath, "character_$characterId").also {
            if (!it.exists()) it.mkdirs()
        }
    }
    
    // ==================== Memory Store Management ====================
    
    /**
     * Create a memory store configuration for a storage location
     */
    suspend fun createMemoryStore(
        name: String,
        storageType: StorageType,
        customPath: String? = null
    ): SynthMemoryStore? = withContext(Dispatchers.IO) {
        try {
            val path = customPath ?: when (storageType) {
                StorageType.INTERNAL -> getInternalMemoryDir().absolutePath
                StorageType.EXTERNAL, StorageType.SD_CARD -> {
                    val externalDirs = context.getExternalFilesDirs(null)
                    val targetDir = if (storageType == StorageType.SD_CARD) {
                        externalDirs.find { dir -> 
                            dir != null && Environment.isExternalStorageRemovable(dir)
                        }
                    } else {
                        externalDirs.firstOrNull { it != null }
                    }
                    targetDir?.let { File(it, MEMORY_DIR_NAME).absolutePath }
                        ?: return@withContext null
                }
            }
            
            val dir = File(path)
            if (!dir.exists() && !dir.mkdirs()) {
                return@withContext null
            }
            
            val stat = StatFs(path)
            
            SynthMemoryStore(
                name = name,
                storagePath = path,
                storageType = storageType.name.lowercase(),
                totalSizeBytes = stat.totalBytes,
                usedSizeBytes = calculateUsedBytes(dir),
                isAvailable = true
            )
        } catch (e: Exception) {
            ErrorLogger.logError("AIMemoryStorage", "Failed to create memory store", e)
            null
        }
    }
    
    /**
     * Calculate used bytes in a directory
     */
    private fun calculateUsedBytes(dir: File): Long {
        return dir.walkTopDown()
            .filter { it.isFile }
            .sumOf { it.length() }
    }
    
    // ==================== Memory File Operations ====================
    
    /**
     * Write a memory to external storage
     */
    suspend fun writeMemoryToStorage(
        memory: SynthMemory,
        storePath: String,
        compress: Boolean = true
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            val characterDir = getCharacterMemoryDir(storePath, memory.characterId)
            val fileName = "memory_${memory.id}${if (compress) ".gz" else MEMORY_FILE_EXTENSION}"
            val file = File(characterDir, fileName)
            
            val memoryData = MemoryFileData(
                id = memory.id,
                characterId = memory.characterId,
                key = memory.key,
                content = memory.content,
                memoryType = memory.memoryType,
                importance = memory.importance,
                confidence = memory.confidence,
                tags = memory.getTagsList(),
                context = memory.context,
                metadata = memory.metadata,
                createdAt = memory.createdAt,
                updatedAt = memory.updatedAt
            )
            
            val jsonData = json.encodeToString(memoryData)
            
            if (compress) {
                GZIPOutputStream(FileOutputStream(file)).use { gzip ->
                    gzip.write(jsonData.toByteArray(Charsets.UTF_8))
                }
            } else {
                file.writeText(jsonData)
            }
            
            Result.success(file.absolutePath)
        } catch (e: Exception) {
            ErrorLogger.logError("AIMemoryStorage", "Failed to write memory to storage", e)
            Result.failure(e)
        }
    }
    
    /**
     * Read a memory from external storage
     */
    suspend fun readMemoryFromStorage(
        filePath: String
    ): Result<MemoryFileData> = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            if (!file.exists()) {
                return@withContext Result.failure(Exception("Memory file not found: $filePath"))
            }
            
            val jsonData = if (filePath.endsWith(".gz")) {
                GZIPInputStream(FileInputStream(file)).use { gzip ->
                    gzip.bufferedReader(Charsets.UTF_8).readText()
                }
            } else {
                file.readText()
            }
            
            val memoryData = json.decodeFromString<MemoryFileData>(jsonData)
            Result.success(memoryData)
        } catch (e: Exception) {
            ErrorLogger.logError("AIMemoryStorage", "Failed to read memory from storage", e)
            Result.failure(e)
        }
    }
    
    /**
     * Delete a memory file from external storage
     */
    suspend fun deleteMemoryFromStorage(filePath: String): Boolean = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            file.exists() && file.delete()
        } catch (e: Exception) {
            ErrorLogger.logError("AIMemoryStorage", "Failed to delete memory file", e)
            false
        }
    }
    
    // ==================== Batch Export/Import ====================
    
    /**
     * Export all memories for a character to an archive file
     */
    suspend fun exportMemoriesToArchive(
        memories: List<SynthMemory>,
        categories: List<SynthMemoryCategory>,
        characterName: String,
        destinationPath: String,
        options: MemoryExportOptions = MemoryExportOptions()
    ): Result<ExportResult> = withContext(Dispatchers.IO) {
        try {
            _syncProgress.value = SyncProgress(
                operation = "export",
                total = memories.size,
                current = 0,
                message = "Preparing export..."
            )
            
            val exportData = MemoryExportData(
                version = 1,
                exportedAt = System.currentTimeMillis(),
                characterName = characterName,
                memoryCount = memories.size,
                categoryCount = categories.size,
                categories = categories.map { cat ->
                    CategoryExportData(
                        name = cat.name,
                        description = cat.description,
                        icon = cat.icon,
                        color = cat.color,
                        isSystem = cat.isSystem
                    )
                },
                memories = memories.mapIndexed { index, memory ->
                    _syncProgress.value = SyncProgress(
                        operation = "export",
                        total = memories.size,
                        current = index + 1,
                        message = "Exporting memory ${index + 1}/${memories.size}"
                    )
                    
                    MemoryExportItem(
                        key = memory.key,
                        content = memory.content,
                        memoryType = memory.memoryType,
                        categoryName = categories.find { it.id == memory.categoryId }?.name,
                        importance = memory.importance,
                        confidence = memory.confidence,
                        tags = memory.getTagsList(),
                        context = memory.context,
                        metadata = if (options.includeMetadata) memory.metadata else "{}",
                        isPinned = memory.isPinned,
                        createdAt = memory.createdAt,
                        updatedAt = memory.updatedAt
                    )
                }
            )
            
            val timestamp = System.currentTimeMillis()
            val safeName = characterName.replace(Regex("[^a-zA-Z0-9_-]"), "_")
            val fileName = "${safeName}_memories_$timestamp$ARCHIVE_EXTENSION"
            val destDir = File(destinationPath)
            if (!destDir.exists()) destDir.mkdirs()
            
            val outputFile = File(destDir, fileName)
            val jsonData = json.encodeToString(exportData)
            
            if (options.compress) {
                GZIPOutputStream(FileOutputStream(outputFile)).use { gzip ->
                    gzip.write(jsonData.toByteArray(Charsets.UTF_8))
                }
            } else {
                outputFile.writeText(jsonData)
            }
            
            _syncProgress.value = null
            
            Result.success(ExportResult(
                filePath = outputFile.absolutePath,
                fileName = fileName,
                memoryCount = memories.size,
                categoryCount = categories.size,
                fileSizeBytes = outputFile.length()
            ))
        } catch (e: Exception) {
            _syncProgress.value = null
            ErrorLogger.logError("AIMemoryStorage", "Failed to export memories", e)
            Result.failure(e)
        }
    }
    
    /**
     * Import memories from an archive file
     */
    suspend fun importMemoriesFromArchive(
        archivePath: String,
        options: MemoryImportOptions = MemoryImportOptions()
    ): Result<ImportResult> = withContext(Dispatchers.IO) {
        try {
            val file = File(archivePath)
            if (!file.exists()) {
                return@withContext Result.failure(Exception("Archive file not found"))
            }
            
            _syncProgress.value = SyncProgress(
                operation = "import",
                total = 1,
                current = 0,
                message = "Reading archive..."
            )
            
            val jsonData = if (archivePath.endsWith(".gz")) {
                GZIPInputStream(FileInputStream(file)).use { gzip ->
                    gzip.bufferedReader(Charsets.UTF_8).readText()
                }
            } else {
                file.readText()
            }
            
            val exportData = json.decodeFromString<MemoryExportData>(jsonData)
            
            _syncProgress.value = SyncProgress(
                operation = "import",
                total = exportData.memories.size,
                current = 0,
                message = "Preparing import..."
            )
            
            _syncProgress.value = null
            
            Result.success(ImportResult(
                characterName = exportData.characterName,
                memoryCount = exportData.memoryCount,
                categoryCount = exportData.categoryCount,
                exportedAt = exportData.exportedAt,
                exportData = exportData
            ))
        } catch (e: Exception) {
            _syncProgress.value = null
            ErrorLogger.logError("AIMemoryStorage", "Failed to import memories", e)
            Result.failure(e)
        }
    }
    
    // ==================== Sync Operations ====================
    
    /**
     * Sync memories from database to external storage
     */
    suspend fun syncMemoriesToStorage(
        memories: List<SynthMemory>,
        storePath: String,
        compress: Boolean = true,
        progressCallback: (Int, Int) -> Unit = { _, _ -> }
    ): SyncResult = withContext(Dispatchers.IO) {
        var synced = 0
        var failed = 0
        var skipped = 0
        val errors = mutableListOf<String>()
        
        memories.forEachIndexed { index, memory ->
            progressCallback(index + 1, memories.size)
            
            try {
                val result = writeMemoryToStorage(memory, storePath, compress)
                if (result.isSuccess) {
                    synced++
                } else {
                    failed++
                    errors.add("Memory ${memory.id}: ${result.exceptionOrNull()?.message}")
                }
            } catch (e: Exception) {
                failed++
                errors.add("Memory ${memory.id}: ${e.message}")
            }
        }
        
        SyncResult(
            syncedCount = synced,
            failedCount = failed,
            skippedCount = skipped,
            errors = errors
        )
    }
    
    /**
     * Get storage information for a path
     */
    fun getStorageInfo(path: String): StorageInfo? {
        return try {
            val stat = StatFs(path)
            StorageInfo(
                totalBytes = stat.totalBytes,
                availableBytes = stat.availableBytes,
                usedBytes = stat.totalBytes - stat.availableBytes,
                blockSize = stat.blockSizeLong
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Calculate checksum for a memory file
     */
    suspend fun calculateChecksum(filePath: String): String? = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            if (!file.exists()) return@withContext null
            
            val digest = MessageDigest.getInstance("SHA-256")
            FileInputStream(file).use { fis ->
                val buffer = ByteArray(8192)
                var read: Int
                while (fis.read(buffer).also { read = it } != -1) {
                    digest.update(buffer, 0, read)
                }
            }
            
            digest.digest().joinToString("") { "%02x".format(it) }
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Clean up orphaned memory files (files without corresponding DB records)
     */
    suspend fun cleanupOrphanedFiles(
        storePath: String,
        validMemoryIds: Set<Long>
    ): Int = withContext(Dispatchers.IO) {
        var cleaned = 0
        val dir = File(storePath)
        
        if (!dir.exists()) return@withContext 0
        
        dir.walkTopDown()
            .filter { it.isFile && (it.name.contains("memory_") && (it.name.endsWith(".gz") || it.name.endsWith(MEMORY_FILE_EXTENSION))) }
            .forEach { file ->
                val idMatch = Regex("memory_(\\d+)").find(file.name)
                val memoryId = idMatch?.groupValues?.get(1)?.toLongOrNull()
                
                if (memoryId != null && memoryId !in validMemoryIds) {
                    if (file.delete()) {
                        cleaned++
                    }
                }
            }
        
        cleaned
    }
    
    /**
     * Get disk usage for a character's memories
     */
    suspend fun getCharacterMemoryDiskUsage(
        storePath: String,
        characterId: Long
    ): Long = withContext(Dispatchers.IO) {
        val characterDir = File(storePath, "character_$characterId")
        if (!characterDir.exists()) return@withContext 0L
        
        characterDir.walkTopDown()
            .filter { it.isFile }
            .sumOf { it.length() }
    }
}

// ==================== Data Classes ====================

enum class StorageType {
    INTERNAL,
    EXTERNAL,
    SD_CARD
}

data class StorageState(
    val type: StorageType,
    val path: String,
    val totalBytes: Long,
    val availableBytes: Long,
    val isAvailable: Boolean,
    val displayName: String
) {
    val usedBytes: Long get() = totalBytes - availableBytes
    val usagePercent: Float get() = if (totalBytes > 0) usedBytes.toFloat() / totalBytes else 0f
    val availableGb: Float get() = availableBytes / (1024f * 1024f * 1024f)
    val totalGb: Float get() = totalBytes / (1024f * 1024f * 1024f)
}

data class StorageInfo(
    val totalBytes: Long,
    val availableBytes: Long,
    val usedBytes: Long,
    val blockSize: Long
)

data class SyncProgress(
    val operation: String, // "export", "import", "sync"
    val total: Int,
    val current: Int,
    val message: String
) {
    val progress: Float get() = if (total > 0) current.toFloat() / total else 0f
}

data class SyncResult(
    val syncedCount: Int,
    val failedCount: Int,
    val skippedCount: Int,
    val errors: List<String>
)

data class ExportResult(
    val filePath: String,
    val fileName: String,
    val memoryCount: Int,
    val categoryCount: Int,
    val fileSizeBytes: Long
)

data class ImportResult(
    val characterName: String,
    val memoryCount: Int,
    val categoryCount: Int,
    val exportedAt: Long,
    val exportData: MemoryExportData
)

// ==================== Serializable File Formats ====================

@kotlinx.serialization.Serializable
data class MemoryFileData(
    val id: Long,
    val characterId: Long,
    val key: String,
    val content: String,
    val memoryType: String,
    val importance: Float,
    val confidence: Float,
    val tags: List<String>,
    val context: String,
    val metadata: String,
    val createdAt: Long,
    val updatedAt: Long
)

@kotlinx.serialization.Serializable
data class MemoryExportData(
    val version: Int = 1,
    val exportedAt: Long,
    val characterName: String,
    val memoryCount: Int,
    val categoryCount: Int,
    val categories: List<CategoryExportData>,
    val memories: List<MemoryExportItem>
)

@kotlinx.serialization.Serializable
data class CategoryExportData(
    val name: String,
    val description: String,
    val icon: String,
    val color: Int,
    val isSystem: Boolean
)

@kotlinx.serialization.Serializable
data class MemoryExportItem(
    val key: String,
    val content: String,
    val memoryType: String,
    val categoryName: String?,
    val importance: Float,
    val confidence: Float,
    val tags: List<String>,
    val context: String,
    val metadata: String,
    val isPinned: Boolean,
    val createdAt: Long,
    val updatedAt: Long
)
