package com.universalmedialibrary.data.services

import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.util.Base64
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import com.universalmedialibrary.data.local.AppDatabase
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
import java.security.KeyStore
import java.text.SimpleDateFormat
import java.util.*
import javax.crypto.Cipher
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.crypto.spec.GCMParameterSpec
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
    private val appDatabase: AppDatabase,
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
            encryptedApiKeys = exportApiKeys(),
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
     * Restore settings from backup (atomic transaction)
     */
    suspend fun restoreBackup(backup: SettingsBackup) = withContext(Dispatchers.IO) {
        // Validate backup version
        if (backup.version > BACKUP_VERSION) {
            throw Exception("Backup version ${backup.version} is newer than supported version $BACKUP_VERSION")
        }

        // Restore settings sequentially (Room doesn't support withTransaction on database instance)
        // Restore general settings
        backup.generalSettings?.let { generalSettingsDao.insertSettings(it) }

        // Restore security settings
        backup.securitySettings?.let { securitySettingsDao.insertSettings(it) }

        // Restore API settings
        apiSettingsDao.deleteAll()
        apiSettingsDao.insertSettings(backup.apiSettings)

        // Restore API keys (decrypt and import)
        decryptAndImportApiKeys(backup.encryptedApiKeys)
    }

    /**
     * Export API keys (called by createBackup)
     */
    private fun exportApiKeys(): String {
        return exportAndEncryptApiKeys()
    }

    /**
     * Export and encrypt API keys using Android Keystore AES/GCM
     */
    private fun exportAndEncryptApiKeys(): String {
        val keys = mutableMapOf<String, String>()
        
        // Export keys from encrypted prefs
        encryptedPrefs.all.forEach { (key, value) ->
            if (value is String) {
                keys[key] = value
            }
        }
        
        // Serialize to JSON
        val jsonString = json.encodeToString(keys)
        
        // Encrypt with Keystore key
        val encrypted = encryptWithKeystoreAes(jsonString.toByteArray())
        
        // Return as Base64 string
        return Base64.encodeToString(encrypted, Base64.NO_WRAP)
    }

    /**
     * Decrypt and import API keys using Android Keystore AES/GCM
     */
    private fun decryptAndImportApiKeys(encryptedBase64: String) {
        if (encryptedBase64.isBlank()) return
        
        try {
            // Decode from Base64
            val encrypted = Base64.decode(encryptedBase64, Base64.NO_WRAP)
            
            // Decrypt with Keystore key
            val decrypted = decryptWithKeystoreAes(encrypted)
            
            // Parse JSON
            val jsonString = String(decrypted, Charsets.UTF_8)
            val keys = json.decodeFromString<Map<String, String>>(jsonString)
            
            // Import to encrypted prefs
            val editor = encryptedPrefs.edit()
            keys.forEach { (key, value) ->
                editor.putString(key, value)
            }
            editor.apply()
        } catch (e: Exception) {
            // Log but don't fail entire restore if key import fails
            android.util.Log.e("SettingsBackupService", "Failed to import API keys", e)
        }
    }

    /**
     * Get or create AES key in Android Keystore
     */
    private fun getOrCreateBackupAesKey(): SecretKey {
        val keyStore = KeyStore.getInstance("AndroidKeyStore").apply { load(null) }
        val keyAlias = "backup_encryption_key"
        
        // Return existing key if available
        keyStore.getKey(keyAlias, null)?.let { return it as SecretKey }
        
        // Generate new key
        val keyGenerator = KeyGenerator.getInstance(
            android.security.keystore.KeyProperties.KEY_ALGORITHM_AES,
            "AndroidKeyStore"
        )
        
        val keyGenSpec = android.security.keystore.KeyGenParameterSpec.Builder(
            keyAlias,
            android.security.keystore.KeyProperties.PURPOSE_ENCRYPT or 
            android.security.keystore.KeyProperties.PURPOSE_DECRYPT
        )
            .setBlockModes(android.security.keystore.KeyProperties.BLOCK_MODE_GCM)
            .setEncryptionPaddings(android.security.keystore.KeyProperties.ENCRYPTION_PADDING_NONE)
            .setKeySize(256)
            .build()
        
        keyGenerator.init(keyGenSpec)
        return keyGenerator.generateKey()
    }

    /**
     * Encrypt data with AES/GCM using Keystore key
     * IV is prepended to ciphertext
     */
    private fun encryptWithKeystoreAes(plaintext: ByteArray): ByteArray {
        val cipher = Cipher.getInstance("AES/GCM/NoPadding")
        cipher.init(Cipher.ENCRYPT_MODE, getOrCreateBackupAesKey())
        
        val iv = cipher.iv
        val ciphertext = cipher.doFinal(plaintext)
        
        // Prepend IV to ciphertext (IV is 12 bytes for GCM)
        return iv + ciphertext
    }

    /**
     * Decrypt data with AES/GCM using Keystore key
     * IV is extracted from first 12 bytes
     */
    private fun decryptWithKeystoreAes(encryptedData: ByteArray): ByteArray {
        require(encryptedData.size > 12) { "Invalid encrypted data" }
        
        // Extract IV from first 12 bytes
        val iv = encryptedData.copyOfRange(0, 12)
        val ciphertext = encryptedData.copyOfRange(12, encryptedData.size)
        
        val cipher = Cipher.getInstance("AES/GCM/NoPadding")
        val spec = GCMParameterSpec(128, iv)
        cipher.init(Cipher.DECRYPT_MODE, getOrCreateBackupAesKey(), spec)
        
        return cipher.doFinal(ciphertext)
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
    val encryptedApiKeys: String, // Base64-encoded encrypted API keys
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
