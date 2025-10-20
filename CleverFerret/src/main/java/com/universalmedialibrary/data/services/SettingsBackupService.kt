package com.universalmedialibrary.data.services

import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import com.universalmedialibrary.data.local.dao.ApiSettingsDao
import com.universalmedialibrary.data.local.dao.GeneralSettingsDao
import com.universalmedialibrary.data.local.dao.SecuritySettingsDao
import com.universalmedialibrary.data.local.entity.ApiSettingsEntity
import com.universalmedialibrary.data.local.entity.GeneralSettingsEntity
import com.universalmedialibrary.data.local.entity.SecuritySettingsEntity
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.text.SimpleDateFormat
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Settings Backup & Restore Service
 * 
 * Handles backup and restoration of all app settings including:
 * - General settings (theme, language, playback)
 * - Security settings (biometric, lock timeout)
 * - API settings (providers, configuration)
 * - API keys (encrypted)
 */
@Singleton
class SettingsBackupService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val generalSettingsDao: GeneralSettingsDao,
    private val securitySettingsDao: SecuritySettingsDao,
    private val apiSettingsDao: ApiSettingsDao
) {

    private val json = Json {
        prettyPrint = true
        ignoreUnknownKeys = true
    }

    private val encryptedPrefs: SharedPreferences by lazy {
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()

        EncryptedSharedPreferences.create(
            context,
            "api_keys_encrypted",
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }

    /**
     * Create a complete backup of all settings
     */
    suspend fun createBackup(): SettingsBackup = withContext(Dispatchers.IO) {
        SettingsBackup(
            version = BACKUP_VERSION,
            timestamp = System.currentTimeMillis(),
            appVersion = getAppVersion(),
            generalSettings = generalSettingsDao.getSettings().first(),
            securitySettings = securitySettingsDao.getSettings().first(),
            apiSettings = apiSettingsDao.getAllSettings().first(),
            apiKeys = exportApiKeys(),
            metadata = BackupMetadata(
                deviceModel = android.os.Build.MODEL,
                androidVersion = android.os.Build.VERSION.SDK_INT,
                backupType = "full"
            )
        )
    }

    /**
     * Export backup to JSON file
     */
    suspend fun exportToFile(backup: SettingsBackup, outputUri: Uri): Result<String> = withContext(Dispatchers.IO) {
        try {
            val jsonString = json.encodeToString(backup)
            
            context.contentResolver.openOutputStream(outputUri)?.use { output ->
                output.write(jsonString.toByteArray())
            } ?: return@withContext Result.failure(Exception("Failed to open output stream"))
            
            Result.success("Backup exported successfully to ${outputUri.lastPathSegment}")
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Export backup to app storage
     */
    suspend fun exportToStorage(): Result<File> = withContext(Dispatchers.IO) {
        try {
            val backup = createBackup()
            val jsonString = json.encodeToString(backup)
            
            val backupDir = File(context.getExternalFilesDir(null), "backups")
            backupDir.mkdirs()
            
            val timestamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(Date())
            val backupFile = File(backupDir, "cleverferret_backup_$timestamp.json")
            
            backupFile.writeText(jsonString)
            
            Result.success(backupFile)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Import backup from JSON file
     */
    suspend fun importFromFile(inputUri: Uri): Result<String> = withContext(Dispatchers.IO) {
        try {
            val jsonString = context.contentResolver.openInputStream(inputUri)?.use { input ->
                input.readBytes().toString(Charsets.UTF_8)
            } ?: return@withContext Result.failure(Exception("Failed to read backup file"))
            
            val backup = json.decodeFromString<SettingsBackup>(jsonString)
            
            restoreBackup(backup)
            
            Result.success("Backup restored successfully")
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Restore settings from backup
     */
    suspend fun restoreBackup(backup: SettingsBackup) = withContext(Dispatchers.IO) {
        // Validate backup version
        if (backup.version > BACKUP_VERSION) {
            throw Exception("Backup version ${backup.version} is newer than supported version $BACKUP_VERSION")
        }

        // Restore general settings
        backup.generalSettings?.let { generalSettingsDao.insertSettings(it) }

        // Restore security settings
        backup.securitySettings?.let { securitySettingsDao.insertSettings(it) }

        // Restore API settings
        apiSettingsDao.deleteAll()
        apiSettingsDao.insertSettings(backup.apiSettings)

        // Restore API keys
        importApiKeys(backup.apiKeys)
    }

    /**
     * Export API keys from encrypted storage
     */
    private fun exportApiKeys(): Map<String, String> {
        val keys = mutableMapOf<String, String>()
        
        encryptedPrefs.all.forEach { (key, value) ->
            if (value is String) {
                keys[key] = value
            }
        }
        
        return keys
    }

    /**
     * Import API keys to encrypted storage
     */
    private fun importApiKeys(keys: Map<String, String>) {
        val editor = encryptedPrefs.edit()
        
        keys.forEach { (key, value) ->
            editor.putString(key, value)
        }
        
        editor.apply()
    }

    /**
     * Get list of available backups
     */
    suspend fun listBackups(): List<BackupInfo> = withContext(Dispatchers.IO) {
        val backupDir = File(context.getExternalFilesDir(null), "backups")
        if (!backupDir.exists()) return@withContext emptyList()
        
        backupDir.listFiles { file ->
            file.name.startsWith("cleverferret_backup_") && file.name.endsWith(".json")
        }?.map { file ->
            BackupInfo(
                fileName = file.name,
                filePath = file.absolutePath,
                size = file.length(),
                timestamp = file.lastModified()
            )
        }?.sortedByDescending { it.timestamp } ?: emptyList()
    }

    /**
     * Delete a backup file
     */
    suspend fun deleteBackup(fileName: String): Result<Unit> = withContext(Dispatchers.IO) {
        try {
            val backupDir = File(context.getExternalFilesDir(null), "backups")
            val file = File(backupDir, fileName)
            
            if (file.exists() && file.delete()) {
                Result.success(Unit)
            } else {
                Result.failure(Exception("Failed to delete backup"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    private fun getAppVersion(): String {
        return try {
            val packageInfo = context.packageManager.getPackageInfo(context.packageName, 0)
            packageInfo.versionName ?: "unknown"
        } catch (e: Exception) {
            "unknown"
        }
    }

    companion object {
        private const val BACKUP_VERSION = 1
    }
}

@Serializable
data class SettingsBackup(
    val version: Int,
    val timestamp: Long,
    val appVersion: String,
    val generalSettings: GeneralSettingsEntity?,
    val securitySettings: SecuritySettingsEntity?,
    val apiSettings: List<ApiSettingsEntity>,
    val apiKeys: Map<String, String>,
    val metadata: BackupMetadata
)

@Serializable
data class BackupMetadata(
    val deviceModel: String,
    val androidVersion: Int,
    val backupType: String
)

data class BackupInfo(
    val fileName: String,
    val filePath: String,
    val size: Long,
    val timestamp: Long
)
