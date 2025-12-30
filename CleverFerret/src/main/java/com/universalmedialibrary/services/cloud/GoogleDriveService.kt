package com.universalmedialibrary.services.cloud

import android.content.Context
import android.content.Intent
import androidx.activity.result.ActivityResultLauncher
import com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAccountCredential
import com.google.api.client.http.FileContent
import com.google.api.client.http.javanet.NetHttpTransport
import com.google.api.client.json.gson.GsonFactory
import com.google.api.services.drive.Drive
import com.google.api.services.drive.DriveScopes
import com.google.api.services.drive.model.File
import com.google.api.services.drive.model.FileList
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.FileOutputStream
import java.io.IOException
import java.util.Collections
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Google Drive Integration Service for CleverFerret
 * 
 * Provides comprehensive Google Drive integration including:
 * - File/folder synchronization
 * - Media file upload/download
 * - Conflict resolution
 * - Background sync operations
 * - Offline caching support
 */
@Singleton
class GoogleDriveService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val cloudSyncManager: CloudSyncManager
) {
    
    private val jsonFactory = GsonFactory.getDefaultInstance()
    private val httpTransport = NetHttpTransport()
    
    private val _isAuthenticated = MutableStateFlow(false)
    val isAuthenticated: Flow<Boolean> = _isAuthenticated.asStateFlow()
    
    private val _syncProgress = MutableStateFlow(0f)
    val syncProgress: Flow<Float> = _syncProgress.asStateFlow()
    
    private val _lastSyncTime = MutableStateFlow(0L)
    val lastSyncTime: Flow<Long> = _lastSyncTime.asStateFlow()
    
    private var driveService: Drive? = null
    private var credential: GoogleAccountCredential? = null
    
    companion object {
        const val DRIVE_APP_FOLDER = "CleverFerret"
        const val REQUEST_CODE_SIGN_IN = 1001
        val SCOPES = listOf(DriveScopes.DRIVE_FILE, DriveScopes.DRIVE_APPDATA)
    }

    /**
     * Initialize Google Drive service
     */
    suspend fun initialize(): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                // Build credential
                credential = GoogleAccountCredential.usingOAuth2(
                    context, SCOPES
                ).setBackOff(com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAuthReceiver.Builder(context).build())
                
                // Check if already signed in
                val accounts = credential?.selectedAccountName
                if (accounts != null) {
                    buildDriveService()
                    _isAuthenticated.value = true
                    true
                } else {
                    false
                }
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * Sign in to Google Drive
     */
    fun signIn(launcher: ActivityResultLauncher<Intent>) {
        credential?.let { cred ->
            val signInIntent = cred.newChooseAccountIntent()
            launcher.launch(signInIntent)
        }
    }

    /**
     * Handle sign in result
     */
    suspend fun handleSignInResult(data: Intent?): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val accountName = data?.getStringExtra("accountName")
                if (accountName != null) {
                    credential?.selectedAccountName = accountName
                    buildDriveService()
                    _isAuthenticated.value = true
                    true
                } else {
                    false
                }
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * Sign out from Google Drive
     */
    fun signOut() {
        credential?.selectedAccountName = null
        driveService = null
        _isAuthenticated.value = false
    }

    /**
     * Get or create CleverFerret app folder
     */
    private suspend fun getAppFolder(): File? {
        return withContext(Dispatchers.IO) {
            try {
                val drive = driveService ?: return@withContext null
                
                // Search for existing app folder
                val result = drive.files().list()
                    .setQ("name='$DRIVE_APP_FOLDER' and mimeType='application/vnd.google-apps.folder' and trashed=false")
                    .setSpaces("drive")
                    .execute()
                
                if (result.files.isNotEmpty()) {
                    result.files[0]
                } else {
                    // Create new app folder
                    val metadata = File()
                        .setName(DRIVE_APP_FOLDER)
                        .setMimeType("application/vnd.google-apps.folder")
                    
                    drive.files().create(metadata)
                        .setFields("id, name")
                        .execute()
                }
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }

    /**
     * Upload file to Google Drive
     */
    suspend fun uploadFile(
        localPath: String,
        fileName: String,
        folderId: String? = null
    ): String? {
        return withContext(Dispatchers.IO) {
            try {
                val drive = driveService ?: return@withContext null
                val appFolder = folderId ?: getAppFolder()?.id ?: return@withContext null
                
                // Create file metadata
                val metadata = File()
                    .setName(fileName)
                    .setParents(Collections.singletonList(appFolder))
                
                // Create file content
                val filePath = java.io.File(localPath)
                val mediaContent = FileContent(getMimeType(fileName), filePath)
                
                // Upload file
                val uploadedFile = drive.files()
                    .create(metadata, mediaContent)
                    .setFields("id, name, size, createdTime")
                    .execute()
                
                uploadedFile.id
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }

    /**
     * Download file from Google Drive
     */
    suspend fun downloadFile(
        fileId: String,
        localPath: String
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val drive = driveService ?: return@withContext false
                
                val outputStream = FileOutputStream(localPath)
                drive.files().get(fileId)
                    .executeMediaAndDownloadTo(outputStream)
                outputStream.close()
                
                true
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * List files in app folder
     */
    suspend fun listFiles(folderId: String? = null): List<DriveFile> {
        return withContext(Dispatchers.IO) {
            try {
                val drive = driveService ?: return@withContext emptyList()
                val parentFolder = folderId ?: getAppFolder()?.id ?: return@withContext emptyList()
                
                val query = "'$parentFolder' in parents and trashed=false"
                val result = drive.files().list()
                    .setQ(query)
                    .setFields("files(id, name, mimeType, size, createdTime, modifiedTime)")
                    .execute()
                
                result.files.map { file ->
                    DriveFile(
                        id = file.id,
                        name = file.name,
                        mimeType = file.mimeType,
                        size = file.getSize(),
                        createdTime = file.createdTime.value,
                        modifiedTime = file.modifiedTime?.value ?: 0L,
                        isFolder = file.mimeType == "application/vnd.google-apps.folder"
                    )
                }
            } catch (e: Exception) {
                e.printStackTrace()
                emptyList()
            }
        }
    }

    /**
     * Delete file from Google Drive
     */
    suspend fun deleteFile(fileId: String): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val drive = driveService ?: return@withContext false
                drive.files().delete(fileId).execute()
                true
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }
        }
    }

    /**
     * Sync local media with Google Drive
     */
    suspend fun syncMedia(): SyncResult {
        return withContext(Dispatchers.IO) {
            val startTime = System.currentTimeMillis()
            _syncProgress.value = 0f
            
            try {
                val localFiles = cloudSyncManager.getLocalMediaFiles()
                val driveFiles = listFiles()
                
                var uploadedCount = 0
                var downloadedCount = 0
                var conflictCount = 0
                
                total@ for ((index, localFile) in localFiles.withIndex()) {
                    _syncProgress.value = index.toFloat() / localFiles.size.toFloat()
                    
                    val driveFile = driveFiles.find { it.name == localFile.name }
                    
                    when {
                        driveFile == null -> {
                            // Upload new file
                            if (uploadFile(localFile.path, localFile.name) != null) {
                                uploadedCount++
                            }
                        }
                        driveFile.modifiedTime < localFile.lastModified -> {
                            // Local file is newer, upload
                            if (uploadFile(localFile.path, localFile.name) != null) {
                                uploadedCount++
                            }
                        }
                        driveFile.modifiedTime > localFile.lastModified -> {
                            // Drive file is newer, download
                            val downloadPath = getDownloadPath(localFile.name)
                            if (downloadFile(driveFile.id, downloadPath)) {
                                downloadedCount++
                            } else {
                                conflictCount++
                            }
                        }
                    }
                }
                
                _syncProgress.value = 1f
                _lastSyncTime.value = System.currentTimeMillis()
                
                SyncResult(
                    success = true,
                    uploadedCount = uploadedCount,
                    downloadedCount = downloadedCount,
                    conflictCount = conflictCount,
                    duration = System.currentTimeMillis() - startTime
                )
            } catch (e: Exception) {
                e.printStackTrace()
                SyncResult(
                    success = false,
                    error = e.message ?: "Unknown error"
                )
            }
        }
    }

    /**
     * Get storage usage information
     */
    suspend fun getStorageUsage(): StorageUsage? {
        return withContext(Dispatchers.IO) {
            try {
                val drive = driveService ?: return@withContext null
                val about = drive.about().get()
                    .setFields("storageQuota")
                    .execute()
                
                val quota = about.storageQuota
                StorageUsage(
                    used = quota?.usage ?: 0L,
                    limit = quota?.limit ?: 0L,
                    usageInDrive = quota?.usageInDrive ?: 0L,
                    usageInDriveTrash = quota?.usageInDriveTrash ?: 0L
                )
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }

    private fun buildDriveService() {
        credential?.let { cred ->
            driveService = Drive.Builder(
                httpTransport, jsonFactory, cred
            ).setApplicationName("CleverFerret")
                .build()
        }
    }

    private fun getMimeType(fileName: String): String {
        return when {
            fileName.endsWith(".mp3") -> "audio/mpeg"
            fileName.endsWith(".mp4") -> "video/mp4"
            fileName.endsWith(".pdf") -> "application/pdf"
            fileName.endsWith(".epub") -> "application/epub+zip"
            fileName.endsWith(".cbz") -> "application/x-cbz"
            fileName.endsWith(".cbr") -> "application/x-cbr"
            else -> "application/octet-stream"
        }
    }

    private fun getDownloadPath(fileName: String): String {
        // Implementation would depend on your local storage structure
        return "${context.getExternalFilesDir(null)}/downloads/$fileName"
    }
}

/**
 * Data classes for Google Drive operations
 */
data class DriveFile(
    val id: String,
    val name: String,
    val mimeType: String,
    val size: Long?,
    val createdTime: Long,
    val modifiedTime: Long,
    val isFolder: Boolean
)

data class SyncResult(
    val success: Boolean,
    val uploadedCount: Int = 0,
    val downloadedCount: Int = 0,
    val conflictCount: Int = 0,
    val duration: Long = 0,
    val error: String? = null
)

data class StorageUsage(
    val used: Long,
    val limit: Long,
    val usageInDrive: Long,
    val usageInDriveTrash: Long
) {
    val usagePercentage: Float
        get() = if (limit > 0) (used.toFloat() / limit.toFloat()) * 100f else 0f
}