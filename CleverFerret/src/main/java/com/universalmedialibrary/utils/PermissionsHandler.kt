package com.universalmedialibrary.utils

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Environment
import android.provider.Settings
import androidx.activity.compose.ManagedActivityResultLauncher
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.platform.LocalContext
import androidx.core.content.ContextCompat
import androidx.core.net.toUri
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver

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
                // Android 11-12L (API 30-32) - Legacy storage permission model.
                // NOTE: We do NOT require MANAGE_EXTERNAL_STORAGE to "enter the app" because that can
                // permanently deadlock the UI on Android 13+ and is a restricted permission.
                arrayOf(
                    Manifest.permission.READ_EXTERNAL_STORAGE
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
        // Check required runtime permissions for the current API level.
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
     * Check if storage permissions are granted for media files only
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
                // Android 11-12L - READ_EXTERNAL_STORAGE gate for MediaStore access.
                hasPermission(context, Manifest.permission.READ_EXTERNAL_STORAGE)
            }
            else -> {
                // Android 10 and below
                hasPermission(context, Manifest.permission.READ_EXTERNAL_STORAGE)
            }
        }
    }
    
    /**
     * Check if full storage access is granted (needed for documents/ebooks on Android 11+)
     * On Android 13+, READ_MEDIA_* permissions don't cover documents like epub, pdf, etc.
     * MANAGE_EXTERNAL_STORAGE is required for full file access including ebooks.
     */
    fun hasFullStorageAccess(context: Context): Boolean {
        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.R -> {
                // Android 11+ (restricted) "All files access" for full document scanning.
                Environment.isExternalStorageManager()
            }
            else -> {
                // Android 10 and below
                hasPermission(context, Manifest.permission.READ_EXTERNAL_STORAGE)
            }
        }
    }
    
    /**
     * Request full storage access permission (for documents/ebooks)
     * This opens system settings to grant MANAGE_EXTERNAL_STORAGE on Android 11+
     * 
     * Note: On Android versions below 11, this function does nothing as 
     * MANAGE_EXTERNAL_STORAGE permission doesn't exist.
     */
    fun requestFullStorageAccess(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            try {
                val intent = Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION)
                intent.data = android.net.Uri.parse("package:${context.packageName}")
                // Add FLAG_ACTIVITY_NEW_TASK if not called from an Activity context
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
            } catch (e: Exception) {
                // Fallback to general settings if app-specific intent is not available
                android.util.Log.w("PermissionsHandler", "App-specific settings not available, falling back", e)
                val intent = Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION)
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
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
                intent.data = "package:${context.packageName}".toUri()
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
    val lifecycleOwner = LocalLifecycleOwner.current
    var permissionsGranted by remember { mutableStateOf(PermissionsHandler.hasAllPermissions(context)) }
    var showRationale by remember { mutableStateOf(false) }
    var deniedPermissions by remember { mutableStateOf<List<String>>(emptyList()) }

    // If the user changes permissions from system settings, refresh on resume.
    DisposableEffect(lifecycleOwner, context) {
        val observer = LifecycleEventObserver { _, event ->
            if (event == Lifecycle.Event.ON_RESUME) {
                val nowGranted = PermissionsHandler.hasAllPermissions(context)
                permissionsGranted = nowGranted
                if (nowGranted) {
                    // Clear any stale rationale once we're good.
                    showRationale = false
                    deniedPermissions = emptyList()
                    onAllPermissionsGranted()
                }
            }
        }
        lifecycleOwner.lifecycle.addObserver(observer)
        onDispose { lifecycleOwner.lifecycle.removeObserver(observer) }
    }

    // Standard permissions launcher
    val permissionsLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestMultiplePermissions()
    ) { permissions ->
        val denied = permissions.filter { !it.value }.keys.toList()

        deniedPermissions = denied
        permissionsGranted = PermissionsHandler.hasAllPermissions(context)

        if (permissionsGranted) onAllPermissionsGranted()
        else {
            onPermissionsDenied(denied)
            showRationale = true
        }
    }

    return PermissionState(
        hasAllPermissions = permissionsGranted,
        showRationale = showRationale,
        deniedPermissions = deniedPermissions,
        requestPermissions = {
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
