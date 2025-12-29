package com.universalmedialibrary.services.cloud

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import com.google.android.gms.auth.api.signin.GoogleSignIn
import com.google.android.gms.auth.api.signin.GoogleSignInAccount
import com.google.android.gms.auth.api.signin.GoogleSignInClient
import com.google.android.gms.auth.api.signin.GoogleSignInOptions
import com.google.android.gms.common.api.Scope
import com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAccountCredential
import com.google.api.client.http.FileContent
import com.google.api.client.http.javanet.NetHttpTransport
import com.google.api.client.json.gson.GsonFactory
import com.google.api.services.drive.Drive
import com.google.api.services.drive.DriveScopes
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Google Drive OAuth Service
 * 
 * Provides OAuth-based Google Drive integration without requiring users to obtain API keys.
 * Users simply sign in with their Google account to access their Drive storage.
 */
@Singleton
class GoogleDriveOAuthService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        const val REQUEST_CODE_SIGN_IN = 1001
        private const val APP_NAME = "CleverFerret"
        private const val BACKUP_FOLDER_NAME = "CleverFerret Backups"
        private const val AI_LOGS_FOLDER_NAME = "AI Chat Logs"
    }
    
    private val _signInState = MutableStateFlow<GoogleSignInState>(GoogleSignInState.SignedOut)
    val signInState: StateFlow<GoogleSignInState> = _signInState.asStateFlow()
    
    private val _syncStatus = MutableStateFlow<SyncStatus>(SyncStatus.Idle)
    val syncStatus: StateFlow<SyncStatus> = _syncStatus.asStateFlow()
    
    private var driveService: Drive? = null
    private var googleSignInClient: GoogleSignInClient? = null
    private var backupFolderId: String? = null
    private var aiLogsFolderId: String? = null
    
    /**
     * Initialize the Google Sign-In client with Drive scopes
     */
    fun initialize() {
        val signInOptions = GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
            .requestEmail()
            .requestScopes(
                Scope(DriveScopes.DRIVE_FILE),
                Scope(DriveScopes.DRIVE_APPDATA)
            )
            .build()
        
        googleSignInClient = GoogleSignIn.getClient(context, signInOptions)
        
        // Check if already signed in
        val account = GoogleSignIn.getLastSignedInAccount(context)
        if (account != null && hasRequiredScopes(account)) {
            setupDriveService(account)
            _signInState.value = GoogleSignInState.SignedIn(
                email = account.email ?: "",
                displayName = account.displayName ?: "",
                photoUrl = account.photoUrl?.toString()
            )
        }
    }
    
    private fun hasRequiredScopes(account: GoogleSignInAccount): Boolean {
        return GoogleSignIn.hasPermissions(
            account,
            Scope(DriveScopes.DRIVE_FILE),
            Scope(DriveScopes.DRIVE_APPDATA)
        )
    }
    
    /**
     * Get sign-in intent to launch the Google Sign-In flow
     */
    fun getSignInIntent(): Intent? {
        return googleSignInClient?.signInIntent
    }
    
    /**
     * Handle sign-in result from activity
     */
    suspend fun handleSignInResult(data: Intent?): Result<GoogleSignInAccount> = withContext(Dispatchers.IO) {
        try {
            val task = GoogleSignIn.getSignedInAccountFromIntent(data)
            val account = task.result
            
            if (account != null) {
                setupDriveService(account)
                _signInState.value = GoogleSignInState.SignedIn(
                    email = account.email ?: "",
                    displayName = account.displayName ?: "",
                    photoUrl = account.photoUrl?.toString()
                )
                Result.success(account)
            } else {
                Result.failure(Exception("Sign-in failed: No account returned"))
            }
        } catch (e: Exception) {
            _signInState.value = GoogleSignInState.Error(e.message ?: "Sign-in failed")
            Result.failure(e)
        }
    }
    
    /**
     * Sign out from Google Drive
     */
    suspend fun signOut() = withContext(Dispatchers.IO) {
        try {
            googleSignInClient?.signOut()?.addOnCompleteListener {
                driveService = null
                backupFolderId = null
                aiLogsFolderId = null
                _signInState.value = GoogleSignInState.SignedOut
            }
        } catch (e: Exception) {
            _signInState.value = GoogleSignInState.Error(e.message ?: "Sign-out failed")
        }
    }
    
    private fun setupDriveService(account: GoogleSignInAccount) {
        val credential = GoogleAccountCredential.usingOAuth2(
            context,
            listOf(DriveScopes.DRIVE_FILE, DriveScopes.DRIVE_APPDATA)
        )
        credential.selectedAccount = account.account
        
        driveService = Drive.Builder(
            NetHttpTransport(),
            GsonFactory.getDefaultInstance(),
            credential
        )
            .setApplicationName(APP_NAME)
            .build()
    }
    
    /**
     * Ensure backup folders exist in Drive
     */
    suspend fun ensureBackupFolders(): Result<Unit> = withContext(Dispatchers.IO) {
        val drive = driveService ?: return@withContext Result.failure(Exception("Not signed in"))
        
        try {
            // Find or create main backup folder
            backupFolderId = findOrCreateFolder(drive, BACKUP_FOLDER_NAME, null)
            
            // Find or create AI logs folder inside backup folder
            aiLogsFolderId = findOrCreateFolder(drive, AI_LOGS_FOLDER_NAME, backupFolderId)
            
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    private fun findOrCreateFolder(drive: Drive, name: String, parentId: String?): String {
        // Search for existing folder
        val query = if (parentId != null) {
            "name = '$name' and mimeType = 'application/vnd.google-apps.folder' and '$parentId' in parents and trashed = false"
        } else {
            "name = '$name' and mimeType = 'application/vnd.google-apps.folder' and 'root' in parents and trashed = false"
        }
        
        val result = drive.files().list()
            .setQ(query)
            .setSpaces("drive")
            .setFields("files(id, name)")
            .execute()
        
        return if (result.files.isNotEmpty()) {
            result.files[0].id
        } else {
            // Create new folder
            val folderMetadata = com.google.api.services.drive.model.File().apply {
                this.name = name
                this.mimeType = "application/vnd.google-apps.folder"
                if (parentId != null) {
                    this.parents = listOf(parentId)
                }
            }
            
            val folder = drive.files().create(folderMetadata)
                .setFields("id")
                .execute()
            
            folder.id
        }
    }
    
    /**
     * Upload a file to Google Drive
     */
    suspend fun uploadFile(
        localFile: File,
        fileName: String,
        mimeType: String,
        folderId: String? = backupFolderId
    ): Result<String> = withContext(Dispatchers.IO) {
        val drive = driveService ?: return@withContext Result.failure(Exception("Not signed in"))
        
        try {
            _syncStatus.value = SyncStatus.Uploading(fileName)
            
            val fileMetadata = com.google.api.services.drive.model.File().apply {
                this.name = fileName
                if (folderId != null) {
                    this.parents = listOf(folderId)
                }
            }
            
            val mediaContent = FileContent(mimeType, localFile)
            
            val uploadedFile = drive.files().create(fileMetadata, mediaContent)
                .setFields("id, name, webViewLink")
                .execute()
            
            _syncStatus.value = SyncStatus.Idle
            Result.success(uploadedFile.id)
        } catch (e: Exception) {
            _syncStatus.value = SyncStatus.Error(e.message ?: "Upload failed")
            Result.failure(e)
        }
    }
    
    /**
     * Upload AI chat log to Drive
     */
    suspend fun uploadAILog(content: String, characterName: String): Result<String> = withContext(Dispatchers.IO) {
        val drive = driveService ?: return@withContext Result.failure(Exception("Not signed in"))
        
        try {
            ensureBackupFolders()
            
            val timestamp = java.text.SimpleDateFormat("yyyy-MM-dd_HH-mm-ss", java.util.Locale.getDefault())
                .format(java.util.Date())
            val fileName = "${characterName}_${timestamp}.md"
            
            // Create temp file
            val tempFile = File(context.cacheDir, fileName)
            tempFile.writeText(content)
            
            val result = uploadFile(tempFile, fileName, "text/markdown", aiLogsFolderId)
            
            tempFile.delete()
            
            result
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Download a file from Google Drive
     */
    suspend fun downloadFile(fileId: String, destinationFile: File): Result<File> = withContext(Dispatchers.IO) {
        val drive = driveService ?: return@withContext Result.failure(Exception("Not signed in"))
        
        try {
            _syncStatus.value = SyncStatus.Downloading(destinationFile.name)
            
            val outputStream = FileOutputStream(destinationFile)
            drive.files().get(fileId).executeMediaAndDownloadTo(outputStream)
            outputStream.close()
            
            _syncStatus.value = SyncStatus.Idle
            Result.success(destinationFile)
        } catch (e: Exception) {
            _syncStatus.value = SyncStatus.Error(e.message ?: "Download failed")
            Result.failure(e)
        }
    }
    
    /**
     * List files in a folder
     */
    suspend fun listFiles(folderId: String? = backupFolderId): Result<List<DriveFileInfo>> = withContext(Dispatchers.IO) {
        val drive = driveService ?: return@withContext Result.failure(Exception("Not signed in"))
        
        try {
            val query = if (folderId != null) {
                "'$folderId' in parents and trashed = false"
            } else {
                "'root' in parents and trashed = false"
            }
            
            val result = drive.files().list()
                .setQ(query)
                .setSpaces("drive")
                .setFields("files(id, name, mimeType, size, modifiedTime, webViewLink)")
                .setOrderBy("modifiedTime desc")
                .execute()
            
            val files = result.files.map { file ->
                DriveFileInfo(
                    id = file.id,
                    name = file.name,
                    mimeType = file.mimeType,
                    size = file.getSize() ?: 0,
                    modifiedTime = file.modifiedTime?.value ?: 0,
                    webViewLink = file.webViewLink
                )
            }
            
            Result.success(files)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Delete a file from Drive
     */
    suspend fun deleteFile(fileId: String): Result<Unit> = withContext(Dispatchers.IO) {
        val drive = driveService ?: return@withContext Result.failure(Exception("Not signed in"))
        
        try {
            drive.files().delete(fileId).execute()
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Get file content as string
     */
    suspend fun getFileContent(fileId: String): Result<String> = withContext(Dispatchers.IO) {
        val drive = driveService ?: return@withContext Result.failure(Exception("Not signed in"))
        
        try {
            val outputStream = ByteArrayOutputStream()
            drive.files().get(fileId).executeMediaAndDownloadTo(outputStream)
            Result.success(outputStream.toString("UTF-8"))
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    val isSignedIn: Boolean
        get() = _signInState.value is GoogleSignInState.SignedIn
}

/**
 * Google Sign-In state
 */
sealed class GoogleSignInState {
    object SignedOut : GoogleSignInState()
    data class SignedIn(
        val email: String,
        val displayName: String,
        val photoUrl: String?
    ) : GoogleSignInState()
    data class Error(val message: String) : GoogleSignInState()
}

/**
 * Sync status
 */
sealed class SyncStatus {
    object Idle : SyncStatus()
    data class Uploading(val fileName: String) : SyncStatus()
    data class Downloading(val fileName: String) : SyncStatus()
    data class Error(val message: String) : SyncStatus()
}

/**
 * Drive file info
 */
data class DriveFileInfo(
    val id: String,
    val name: String,
    val mimeType: String,
    val size: Long,
    val modifiedTime: Long,
    val webViewLink: String?
)
