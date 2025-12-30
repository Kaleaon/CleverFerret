package com.universalmedialibrary.services.ai

import android.content.Context
import android.content.SharedPreferences
import android.os.Build
import android.os.Environment
import androidx.work.*
import com.universalmedialibrary.data.aientertainment.SynthCharacter
import com.universalmedialibrary.data.aientertainment.SynthMemory
import com.universalmedialibrary.services.aientertainment.*
import com.universalmedialibrary.utils.ErrorLogger
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.security.MessageDigest
import java.text.SimpleDateFormat
import java.util.*
import java.util.concurrent.TimeUnit
import javax.crypto.Cipher
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec
import javax.inject.Inject
import javax.inject.Singleton

/**
 * AI Backup and Automation Service
 * 
 * Features:
 * - Automated SD card backup of AI data
 * - Scheduled backup operations
 * - Automated restore on first boot
 * - Backup encryption and integrity verification
 * - Progress tracking and error handling
 */
@Singleton
class AIBackupAutomationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val aiMemoryStorageService: AIMemoryStorageService,
    private val synthCharacterManager: SynthCharacterManager,
    private val synthMemoryManager: SynthMemoryManager
) {
    
    companion object {
        private const val BACKUP_WORK_NAME = "AI_Backup_Work"
        private const val RESTORE_WORK_NAME = "AI_Restore_Work"
        private const val PREFS_NAME = "ai_backup_prefs"
        private const val KEY_LAST_BACKUP = "last_backup_timestamp"
        private const val KEY_BACKUP_ENABLED = "backup_enabled"
        private const val KEY_AUTO_RESTORE_DONE = "auto_restore_done"
        private const val KEY_BACKUP_SCHEDULE = "backup_schedule_hours"
        private const val KEY_BACKUP_LOCATION = "backup_location"
        private const val ENCRYPTION_ALGORITHM = "AES/CBC/PKCS5Padding"
        private const val BACKUP_FILE_EXTENSION = ".aibackup"
        private const val CHECKSUM_FILE_EXTENSION = ".checksum"
    }
    
    private val json = Json { 
        prettyPrint = true 
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    private val preferences: SharedPreferences = 
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    
    private val workManager = WorkManager.getInstance(context)
    
    private val _backupState = MutableStateFlow<BackupState>(BackupState.IDLE)
    val backupState: StateFlow<BackupState> = _backupState.asStateFlow()
    
    private val _restoreState = MutableStateFlow<RestoreState>(RestoreState.IDLE)
    val restoreState: StateFlow<RestoreState> = _restoreState.asStateFlow()
    
    private val _backupProgress = MutableStateFlow<BackupProgress?>(null)
    val backupProgress: StateFlow<BackupProgress?> = _backupProgress.asStateFlow()
    
    // Encryption key (in production, this should be stored in Android Keystore)
    private val encryptionKey: SecretKey by lazy {
        generateOrGetEncryptionKey()
    }
    
    init {
        // Schedule periodic backups if enabled
        if (isBackupEnabled()) {
            schedulePeriodicBackup()
        }
        
        // Check if we need to perform first-boot restore
        checkFirstBootRestore()
    }
    
    // ==================== Backup Management ====================
    
    /**
     * Enable automated backups
     */
    fun enableBackup(scheduleHours: Int = 24, location: BackupLocation = BackupLocation.SD_CARD) {
        preferences.edit()
            .putBoolean(KEY_BACKUP_ENABLED, true)
            .putInt(KEY_BACKUP_SCHEDULE, scheduleHours)
            .putString(KEY_BACKUP_LOCATION, location.name)
            .apply()
        
        schedulePeriodicBackup()
        ErrorLogger.logInfo("AIBackupAutomation", "Automated backup enabled (every $scheduleHours hours)")
    }
    
    /**
     * Disable automated backups
     */
    fun disableBackup() {
        preferences.edit()
            .putBoolean(KEY_BACKUP_ENABLED, false)
            .apply()
        
        workManager.cancelUniqueWork(BACKUP_WORK_NAME)
        ErrorLogger.logInfo("AIBackupAutomation", "Automated backup disabled")
    }
    
    /**
     * Perform immediate backup
     */
    suspend fun performBackup(options: BackupOptions = BackupOptions()): BackupResult {
        _backupState.value = BackupState.BACKING_UP
        
        return try {
            val startTime = System.currentTimeMillis()
            val backupData = collectAllAIData(options)
            
            _backupProgress.value = BackupProgress(
                stage = "Encrypting backup...",
                progress = 0.5f,
                message = "Securing your AI data..."
            )
            
            val encryptedData = encryptBackupData(backupData)
            val checksum = calculateChecksum(encryptedData)
            
            _backupProgress.value = BackupProgress(
                stage = "Saving to storage...",
                progress = 0.8f,
                message = "Writing backup file..."
            )
            
            val backupFile = saveBackupToFile(encryptedData, checksum, options.location)
            
            _backupProgress.value = BackupProgress(
                stage = "Finalizing...",
                progress = 1.0f,
                message = "Backup complete!"
            )
            
            // Update last backup timestamp
            preferences.edit()
                .putLong(KEY_LAST_BACKUP, startTime)
                .apply()
            
            val endTime = System.currentTimeMillis()
            
            BackupResult(
                success = true,
                backupFile = backupFile,
                fileSize = backupFile.length(),
                itemCount = backupData.getTotalItemCount(),
                duration = endTime - startTime,
                checksum = checksum
            ).also {
                _backupState.value = BackupState.COMPLETED
                _backupProgress.value = null
            }
            
        } catch (e: Exception) {
            ErrorLogger.logError("AIBackupAutomation", "Backup failed", e)
            _backupState.value = BackupState.FAILED
            _backupProgress.value = null
            
            BackupResult(
                success = false,
                error = e.message ?: "Unknown backup error"
            )
        }
    }
    
    // ==================== Restore Management ====================
    
    /**
     * Perform restore from backup file
     */
    suspend fun performRestore(backupFile: File): RestoreResult {
        _restoreState.value = RestoreState.RESTORING
        
        return try {
            _backupProgress.value = BackupProgress(
                stage = "Loading backup...",
                progress = 0.1f,
                message = "Reading backup file..."
            )
            
            val encryptedData = backupFile.readBytes()
            val storedChecksum = readChecksumFile(backupFile)
            
            // Verify integrity
            val calculatedChecksum = calculateChecksum(encryptedData)
            if (calculatedChecksum != storedChecksum) {
                throw SecurityException("Backup file integrity check failed")
            }
            
            _backupProgress.value = BackupProgress(
                stage = "Decrypting backup...",
                progress = 0.3f,
                message = "Restoring encrypted data..."
            )
            
            val backupData = decryptBackupData(encryptedData)
            
            _backupProgress.value = BackupProgress(
                stage = "Restoring characters...",
                progress = 0.5f,
                message = "Recreating AI characters..."
            )
            
            // Restore characters
            val restoredCharacters = mutableListOf<SynthCharacter>()
            backupData.characters.forEach { characterData ->
                val character = restoreCharacter(characterData)
                if (character != null) {
                    restoredCharacters.add(character)
                }
            }
            
            _backupProgress.value = BackupProgress(
                stage = "Restoring memories...",
                progress = 0.8f,
                message = "Recovering memories and conversations..."
            )
            
            // Restore memories
            val restoredMemories = mutableListOf<SynthMemory>()
            backupData.memories.forEach { memoryData ->
                val memory = restoreMemory(memoryData)
                if (memory != null) {
                    restoredMemories.add(memory)
                }
            }
            
            _backupProgress.value = BackupProgress(
                stage = "Finalizing restore...",
                progress = 1.0f,
                message = "Restore complete!"
            )
            
            _restoreState.value = RestoreState.COMPLETED
            _backupProgress.value = null
            
            RestoreResult(
                success = true,
                charactersRestored = restoredCharacters.size,
                memoriesRestored = restoredMemories.size,
                totalItems = backupData.getTotalItemCount()
            )
            
        } catch (e: Exception) {
            ErrorLogger.logError("AIBackupAutomation", "Restore failed", e)
            _restoreState.value = RestoreState.FAILED
            _backupProgress.value = null
            
            RestoreResult(
                success = false,
                error = e.message ?: "Unknown restore error"
            )
        }
    }
    
    /**
     * Check and perform first-boot restore if needed
     */
    private fun checkFirstBootRestore() {
        if (!preferences.getBoolean(KEY_AUTO_RESTORE_DONE, false)) {
            // Look for backup files in standard locations
            val backupFiles = findAvailableBackups()
            
            if (backupFiles.isNotEmpty()) {
                // Schedule restore work
                val restoreRequest = OneTimeWorkRequestBuilder<AIRestoreWorker>()
                    .setInputData(
                        workDataOf(
                            "backup_file_path" to backupFiles.first().absolutePath
                        )
                    )
                    .build()
                
                workManager.enqueueUniqueWork(
                    RESTORE_WORK_NAME,
                    ExistingWorkPolicy.KEEP,
                    restoreRequest
                )
            }
            
            // Mark as checked
            preferences.edit()
                .putBoolean(KEY_AUTO_RESTORE_DONE, true)
                .apply()
        }
    }
    
    // ==================== Scheduling ====================
    
    /**
     * Schedule periodic backup work
     */
    private fun schedulePeriodicBackup() {
        val scheduleHours = preferences.getInt(KEY_BACKUP_SCHEDULE, 24)
        
        val constraints = Constraints.Builder()
            .setRequiresBatteryNotLow(true)
            .setRequiresStorageNotLow(true)
            .setRequiredNetworkType(NetworkType.NOT_REQUIRED)
            .build()
        
        val backupRequest = PeriodicWorkRequestBuilder<AIBackupWorker>(
            scheduleHours.toLong(), TimeUnit.HOURS
        )
            .setConstraints(constraints)
            .setBackoffCriteria(
                BackoffPolicy.EXPONENTIAL,
                WorkRequest.MIN_BACKOFF_MILLIS,
                TimeUnit.MILLISECONDS
            )
            .build()
        
        workManager.enqueueUniquePeriodicWork(
            BACKUP_WORK_NAME,
            ExistingPeriodicWorkPolicy.UPDATE,
            backupRequest
        )
    }
    
    // ==================== Data Collection ====================
    
    /**
     * Collect all AI data for backup
     */
    private suspend fun collectAllAIData(options: BackupOptions): AIBackupData {
        val characters = synthCharacterManager.getAllCharacters()
        val memories = mutableListOf<SynthMemory>()
        
        // Collect memories for each character
        characters.forEach { character ->
            val characterMemories = synthMemoryManager.getMemoriesForCharacter(character.id)
            memories.addAll(characterMemories)
        }
        
        return AIBackupData(
            version = 1,
            backupDate = System.currentTimeMillis(),
            options = options,
            characters = characters.map { character ->
                CharacterBackupData(
                    id = character.id,
                    name = character.name,
                    description = character.description,
                    personality = character.personality,
                    avatarUrl = character.avatarPath,
                    createdAt = character.createdAt,
                    isActive = true, // SynthCharacter doesn't have isActive field, default to true
                    settings = character.traits // Use traits as settings
                )
            },
            memories = memories.map { memory ->
                MemoryBackupData(
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
                    isPinned = memory.isPinned,
                    categoryId = memory.categoryId,
                    createdAt = memory.createdAt,
                    updatedAt = memory.updatedAt
                )
            }
        )
    }
    
    // ==================== Encryption & Security ====================
    
    /**
     * Generate or retrieve encryption key
     */
    private fun generateOrGetEncryptionKey(): SecretKey {
        val keyAlias = "ai_backup_key"
        
        // For this implementation, generate a simple key
        // In production, use Android Keystore
        val keyGenerator = KeyGenerator.getInstance("AES")
        keyGenerator.init(256)
        return keyGenerator.generateKey()
    }
    
    /**
     * Encrypt backup data
     */
    private fun encryptBackupData(data: AIBackupData): ByteArray {
        val jsonData = json.encodeToString(data).toByteArray(Charsets.UTF_8)
        
        val cipher = Cipher.getInstance(ENCRYPTION_ALGORITHM)
        val iv = ByteArray(16) // Initialization vector
        SecureRandom().nextBytes(iv)
        
        val keySpec = SecretKeySpec(encryptionKey.encoded, "AES")
        val ivSpec = IvParameterSpec(iv)
        
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec)
        val encrypted = cipher.doFinal(jsonData)
        
        // Prepend IV to encrypted data
        return iv + encrypted
    }
    
    /**
     * Decrypt backup data
     */
    private fun decryptBackupData(encryptedData: ByteArray): AIBackupData {
        if (encryptedData.size < 16) {
            throw IllegalArgumentException("Invalid encrypted data")
        }
        
        val iv = encryptedData.sliceArray(0..15)
        val cipherText = encryptedData.sliceArray(16 until encryptedData.size)
        
        val cipher = Cipher.getInstance(ENCRYPTION_ALGORITHM)
        val keySpec = SecretKeySpec(encryptionKey.encoded, "AES")
        val ivSpec = IvParameterSpec(iv)
        
        cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec)
        val decrypted = cipher.doFinal(cipherText)
        
        val jsonString = String(decrypted, Charsets.UTF_8)
        return json.decodeFromString<AIBackupData>(jsonString)
    }
    
    /**
     * Calculate SHA-256 checksum
     */
    private fun calculateChecksum(data: ByteArray): String {
        val digest = MessageDigest.getInstance("SHA-256")
        val hash = digest.digest(data)
        return hash.joinToString("") { "%02x".format(it) }
    }
    
    // ==================== File Operations ====================
    
    /**
     * Save backup to file
     */
    private fun saveBackupToFile(
        data: ByteArray, 
        checksum: String, 
        location: BackupLocation
    ): File {
        val backupDir = when (location) {
            BackupLocation.INTERNAL -> File(context.filesDir, "ai_backups")
            BackupLocation.EXTERNAL -> {
                val externalDir = context.getExternalFilesDir("ai_backups")
                externalDir ?: File(context.filesDir, "ai_backups")
            }
            BackupLocation.SD_CARD -> {
                val sdCardDir = context.getExternalFilesDirs(null)
                    .find { Environment.isExternalStorageRemovable(it) }
                    ?.let { File(it, "ai_backups") }
                sdCardDir ?: File(context.filesDir, "ai_backups")
            }
        }
        
        if (!backupDir.exists()) {
            backupDir.mkdirs()
        }
        
        val timestamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(Date())
        val backupFile = File(backupDir, "ai_backup_$timestamp$BACKUP_FILE_EXTENSION")
        
        backupFile.writeBytes(data)
        
        // Save checksum file
        val checksumFile = File(backupDir, "ai_backup_$timestamp$CHECKSUM_FILE_EXTENSION")
        checksumFile.writeText(checksum)
        
        return backupFile
    }
    
    /**
     * Read checksum file
     */
    private fun readChecksumFile(backupFile: File): String {
        val checksumFile = File(backupFile.parent, backupFile.nameWithoutExtension + CHECKSUM_FILE_EXTENSION)
        return if (checksumFile.exists()) {
            checksumFile.readText().trim()
        } else {
            throw FileNotFoundException("Checksum file not found for ${backupFile.name}")
        }
    }
    
    /**
     * Find available backup files
     */
    private fun findAvailableBackups(): List<File> {
        val backupFiles = mutableListOf<File>()
        
        // Search in all possible backup locations
        val locations = listOf(
            File(context.filesDir, "ai_backups"),
            context.getExternalFilesDir("ai_backups"),
            context.getExternalFilesDirs(null).find { 
                Environment.isExternalStorageRemovable(it) 
            }?.let { File(it, "ai_backups") }
        )
        
        locations.forEach { dir ->
            dir?.let { 
                if (it.exists()) {
                    backupFiles.addAll(
                        it.listFiles { file ->
                            file.name.endsWith(BACKUP_FILE_EXTENSION)
                        }?.sortedByDescending { it.lastModified() } ?: emptyList()
                    )
                }
            }
        }
        
        return backupFiles
    }
    
    // ==================== Restore Helpers ====================
    
    private suspend fun restoreCharacter(data: CharacterBackupData): SynthCharacter? {
        return try {
            synthCharacterManager.createCharacter(
                userId = 0L, // Will need to be set based on context
                name = data.name,
                description = data.description,
                personality = data.personality,
                avatarUrl = data.avatarUrl
            )
        } catch (e: Exception) {
            ErrorLogger.logError("AIBackupAutomation", "Failed to restore character: ${data.name}", e)
            null
        }
    }
    
    private suspend fun restoreMemory(data: MemoryBackupData): SynthMemory? {
        return try {
            // Parse metadata string to Map
            val metadataMap = try {
                kotlinx.serialization.json.Json.decodeFromString<Map<String, Any>>(data.metadata)
            } catch (e: Exception) {
                emptyMap()
            }
            
            synthMemoryManager.createMemory(
                characterId = data.characterId,
                key = data.key,
                content = data.content,
                memoryType = data.memoryType,
                importance = data.importance,
                confidence = data.confidence,
                tags = data.tags,
                context = data.context,
                metadata = metadataMap,
                isPinned = data.isPinned,
                categoryId = data.categoryId
            )
        } catch (e: Exception) {
            ErrorLogger.logError("AIBackupAutomation", "Failed to restore memory: ${data.key}", e)
            null
        }
    }
    
    // ==================== Utility Methods ====================
    
    fun isBackupEnabled(): Boolean {
        return preferences.getBoolean(KEY_BACKUP_ENABLED, false)
    }
    
    fun getLastBackupTime(): Long {
        return preferences.getLong(KEY_LAST_BACKUP, 0)
    }
    
    fun getBackupSchedule(): Int {
        return preferences.getInt(KEY_BACKUP_SCHEDULE, 24)
    }
    
    /**
     * Get backup location
     */
    fun getBackupLocation(): BackupLocation {
        val locationName = preferences.getString(KEY_BACKUP_LOCATION, BackupLocation.SD_CARD.name)
        return BackupLocation.valueOf(locationName ?: BackupLocation.SD_CARD.name)
    }
    
    /**
     * Check if encryption is enabled
     */
    fun isEncryptionEnabled(): Boolean {
        return preferences.getBoolean("encryption_enabled", true)
    }
    
    /**
     * Check if auto restore is enabled
     */
    fun isAutoRestoreEnabled(): Boolean {
        return preferences.getBoolean(KEY_AUTO_RESTORE_DONE, false)
    }
    
    /**
     * Update backup schedule
     */
    fun updateBackupSchedule(hours: Int) {
        preferences.edit()
            .putInt(KEY_BACKUP_SCHEDULE, hours)
            .apply()
        
        // Reschedule the periodic work
        schedulePeriodicBackup()
    }
    
    /**
     * Update backup location
     */
    fun updateBackupLocation(location: BackupLocation) {
        preferences.edit()
            .putString(KEY_BACKUP_LOCATION, location.name)
            .apply()
    }
    
    /**
     * Update encryption settings
     */
    fun updateEncryptionSettings(enabled: Boolean) {
        preferences.edit()
            .putBoolean("encryption_enabled", enabled)
            .apply()
    }
    
    /**
     * Get backup history
     */
    fun getBackupHistory(): List<BackupResult> {
        // Implementation would return backup history from storage
        // For now, return empty list
        return emptyList()
    }
    
    /**
     * Export backup to user-selected location
     */
    fun exportBackup() {
        // Implementation would export backup to external location
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val backupResult = performBackup()
                if (backupResult.success && backupResult.backupFile != null) {
                    // Share the backup file using Android's share intent
                    val backupFile = File(backupResult.backupFile)
                    if (backupFile.exists()) {
                        // Use Android's share functionality
                        // This would require context to create share intent
                    }
                }
            } catch (e: Exception) {
                ErrorLogger.logError("AIBackupAutomation", "Failed to export backup", e)
            }
        }
    }
    
    /**
     * Import backup from user-selected location
     */
    fun importBackup() {
        // Implementation would import backup from external location
        CoroutineScope(Dispatchers.IO).launch {
            try {
                // This would typically involve:
                // 1. Opening file picker to select backup file
                // 2. Validating backup file integrity
                // 3. Restoring from selected backup
                ErrorLogger.logInfo("AIBackupAutomation", "Import backup requested")
            } catch (e: Exception) {
                ErrorLogger.logError("AIBackupAutomation", "Failed to import backup", e)
            }
        }
    }
    
    fun getAvailableBackups(): List<BackupInfo> {
        return findAvailableBackups().map { file ->
            BackupInfo(
                file = file,
                size = file.length(),
                date = file.lastModified(),
                checksum = try { readChecksumFile(file) } catch (e: Exception) { "Unknown" }
            )
        }
    }
}

// ==================== Data Classes ====================

enum class BackupState {
    IDLE,
    BACKING_UP,
    COMPLETED,
    FAILED
}

enum class RestoreState {
    IDLE,
    RESTORING,
    COMPLETED,
    FAILED
}

enum class BackupLocation {
    INTERNAL,
    EXTERNAL,
    SD_CARD
}

data class BackupOptions(
    val includeCharacters: Boolean = true,
    val includeMemories: Boolean = true,
    val includeSettings: Boolean = true,
    val compressionEnabled: Boolean = true,
    val encryptionEnabled: Boolean = true,
    val location: BackupLocation = BackupLocation.INTERNAL
)

data class BackupProgress(
    val stage: String,
    val progress: Float,
    val message: String
)

data class BackupResult(
    val success: Boolean,
    val backupFile: File? = null,
    val fileSize: Long = 0,
    val itemCount: Int = 0,
    val duration: Long = 0,
    val checksum: String? = null,
    val error: String? = null
)

data class RestoreResult(
    val success: Boolean,
    val charactersRestored: Int = 0,
    val memoriesRestored: Int = 0,
    val totalItems: Int = 0,
    val error: String? = null
)

data class BackupInfo(
    val file: File,
    val size: Long,
    val date: Long,
    val checksum: String
)

@kotlinx.serialization.Serializable
data class AIBackupData(
    val version: Int,
    val backupDate: Long,
    val options: BackupOptions,
    val characters: List<CharacterBackupData>,
    val memories: List<MemoryBackupData>
) {
    fun getTotalItemCount(): Int = characters.size + memories.size
}

@kotlinx.serialization.Serializable
data class CharacterBackupData(
    val id: Long,
    val name: String,
    val description: String,
    val personality: String,
    val avatarUrl: String,
    val createdAt: Long,
    val isActive: Boolean,
    val settings: String
)

@kotlinx.serialization.Serializable
data class MemoryBackupData(
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
    val isPinned: Boolean,
    val categoryId: Long?,
    val createdAt: Long,
    val updatedAt: Long
)