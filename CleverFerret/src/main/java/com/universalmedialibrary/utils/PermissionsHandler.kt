package com.universalmedialibrary.utils

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.Settings
import androidx.activity.compose.ManagedActivityResultLauncher
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.runtime.*
import androidx.compose.ui.platform.LocalContext
import androidx.core.content.ContextCompat

/**
 * Permissions handler for CleverFerret
 * 
 * Handles runtime permission requests for storage, media, and notifications
 * across different Android versions with proper fallbacks.
 */
object PermissionsHandler {

    /**
     * Get required permissions based on Android version
     */
    fun getRequiredPermissions(): Array<String> {
        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU -> {
                // Android 13+ (API 33+) - Granular media permissions
                arrayOf(
                    Manifest.permission.READ_MEDIA_IMAGES,
                    Manifest.permission.READ_MEDIA_VIDEO,
                    Manifest.permission.READ_MEDIA_AUDIO,
                    Manifest.permission.POST_NOTIFICATIONS
                )
            }
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.R -> {
                // Android 11+ (API 30+) - No READ_EXTERNAL_STORAGE needed with MANAGE_EXTERNAL_STORAGE
                arrayOf(
                    Manifest.permission.READ_EXTERNAL_STORAGE,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE
                )
            }
            else -> {
                // Android 10 and below
                arrayOf(
                    Manifest.permission.READ_EXTERNAL_STORAGE,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE
                )
            }
        }
    }

    /**
     * Check if all required permissions are granted
     */
    fun hasAllPermissions(context: Context): Boolean {
        // Check for MANAGE_EXTERNAL_STORAGE only on Android 11-12 (API 30-32)
        // Android 13+ uses granular READ_MEDIA_* permissions instead
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            if (!Environment.isExternalStorageManager()) {
                return false
            }
        }

        // Check standard permissions
        return getRequiredPermissions().all { permission ->
            ContextCompat.checkSelfPermission(context, permission) == PackageManager.PERMISSION_GRANTED
        }
    }

    /**
     * Check if specific permission is granted
     */
    fun hasPermission(context: Context, permission: String): Boolean {
        return ContextCompat.checkSelfPermission(context, permission) == PackageManager.PERMISSION_GRANTED
    }

    /**
     * Check if storage permissions are granted
     */
    fun hasStoragePermissions(context: Context): Boolean {
        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU -> {
                // Android 13+ - Check granular media permissions only
                hasPermission(context, Manifest.permission.READ_MEDIA_IMAGES) &&
                hasPermission(context, Manifest.permission.READ_MEDIA_VIDEO) &&
                hasPermission(context, Manifest.permission.READ_MEDIA_AUDIO)
            }
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.R -> {
                // Android 11-12 - Check MANAGE_EXTERNAL_STORAGE
                Environment.isExternalStorageManager()
            }
            else -> {
                // Android 10 and below
                hasPermission(context, Manifest.permission.READ_EXTERNAL_STORAGE)
            }
        }
    }

    /**
     * Check if notification permissions are granted
     */
    fun hasNotificationPermissions(context: Context): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            hasPermission(context, Manifest.permission.POST_NOTIFICATIONS)
        } else {
            true // No permission needed before Android 13
        }
    }

    /**
     * Launch storage permission request (for Android 11-12 only)
     * Android 13+ uses granular READ_MEDIA_* permissions instead
     */
    fun requestStorageManagement(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            try {
                val intent = Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION)
                intent.data = Uri.parse("package:${context.packageName}")
                context.startActivity(intent)
            } catch (e: Exception) {
                // Fallback to general settings
                val intent = Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION)
                context.startActivity(intent)
            }
        }
    }
}

/**
 * Composable function to handle permissions in Compose UI
 */
@Composable
fun rememberPermissionsHandler(
    onAllPermissionsGranted: () -> Unit = {},
    onPermissionsDenied: (List<String>) -> Unit = {}
): PermissionState {
    val context = LocalContext.current
    var permissionsGranted by remember { mutableStateOf(PermissionsHandler.hasAllPermissions(context)) }
    var showRationale by remember { mutableStateOf(false) }
    var deniedPermissions by remember { mutableStateOf<List<String>>(emptyList()) }

    // Standard permissions launcher
    val permissionsLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestMultiplePermissions()
    ) { permissions ->
        val allGranted = permissions.values.all { it }
        val denied = permissions.filter { !it.value }.keys.toList()
        
        permissionsGranted = allGranted
        deniedPermissions = denied
        
        if (allGranted) {
            // Still need to check for MANAGE_EXTERNAL_STORAGE on Android 11+
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
                if (!Environment.isExternalStorageManager()) {
                    PermissionsHandler.requestStorageManagement(context)
                } else {
                    onAllPermissionsGranted()
                }
            } else {
                onAllPermissionsGranted()
            }
        } else {
            onPermissionsDenied(denied)
            showRationale = true
        }
    }

    // Storage management launcher for Android 11+
    val storageManagementLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.StartActivityForResult()
    ) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            permissionsGranted = Environment.isExternalStorageManager() && 
                                 PermissionsHandler.hasAllPermissions(context)
            if (permissionsGranted) {
                onAllPermissionsGranted()
            }
        }
    }

    return PermissionState(
        hasAllPermissions = permissionsGranted,
        showRationale = showRationale,
        deniedPermissions = deniedPermissions,
        requestPermissions = {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                // Request MANAGE_EXTERNAL_STORAGE first on Android 11+
                try {
                    val intent = Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION)
                    intent.data = Uri.parse("package:${context.packageName}")
                    storageManagementLauncher.launch(intent)
                } catch (e: Exception) {
                    val intent = Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION)
                    storageManagementLauncher.launch(intent)
                }
            }
            // Request standard permissions
            permissionsLauncher.launch(PermissionsHandler.getRequiredPermissions())
        },
        dismissRationale = { showRationale = false }
    )
}

/**
 * State holder for permissions
 */
data class PermissionState(
    val hasAllPermissions: Boolean,
    val showRationale: Boolean,
    val deniedPermissions: List<String>,
    val requestPermissions: () -> Unit,
    val dismissRationale: () -> Unit
)
