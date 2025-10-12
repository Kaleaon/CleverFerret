package com.universalmedialibrary

import android.app.Application
import android.util.Log
import com.universalmedialibrary.data.migration.AppUpgradeManager
import com.universalmedialibrary.data.migration.BackupRestorationManager
import com.universalmedialibrary.data.migration.UpgradeStatus
import dagger.hilt.android.HiltAndroidApp
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Clever Ferret Application
 * 
 * Main application class with critical initialization:
 * - Hilt dependency injection
 * - App upgrade detection and backup
 * - Database migration handling
 * - User data protection
 * 
 * This ensures user library NEVER gets wiped during upgrades!
 */
@HiltAndroidApp
class CleverFerretApplication : Application() {

    @Inject
    lateinit var appUpgradeManager: AppUpgradeManager
    
    @Inject
    lateinit var backupRestorationManager: BackupRestorationManager

    private val applicationScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    override fun onCreate() {
        super.onCreate()
        
        Log.i(TAG, "Clever Ferret initializing...")

        // CRITICAL: Check for app upgrades and protect user data
        applicationScope.launch {
            handleAppUpgrade()
        }
    }

    /**
     * Handle app upgrades safely
     * Creates backups before any changes to prevent data loss
     */
    private suspend fun handleAppUpgrade() {
        try {
            when (val status = appUpgradeManager.checkAndHandleUpgrade()) {
                is UpgradeStatus.FirstInstall -> {
                    Log.i(TAG, "🎉 First install - version ${status.version}")
                    Log.i(TAG, "Welcome to Clever Ferret!")
                }
                
                is UpgradeStatus.Upgraded -> {
                    Log.i(TAG, "✅ App upgraded: ${status.fromVersion} → ${status.toVersion}")
                    if (status.backupPath != null) {
                        Log.i(TAG, "📦 Backup saved: ${status.backupPath}")
                    }
                    Log.i(TAG, "User library preserved successfully!")
                }
                
                is UpgradeStatus.NoChange -> {
                    Log.d(TAG, "App version unchanged: ${status.version}")
                }
                
                is UpgradeStatus.MigrationFailed -> {
                    Log.e(TAG, "❌ Migration failed: ${status.error}")
                    Log.e(TAG, "📦 Backup available at: ${status.backupPath}")
                    Log.e(TAG, "User data is safe - can restore from backup!")
                    
                    // Request backup restoration dialog to be shown in MainActivity
                    backupRestorationManager.requestRestoration(
                        backupPath = status.backupPath,
                        errorMessage = status.error ?: "Unknown upgrade error"
                    )
                }
                
                is UpgradeStatus.Downgrade -> {
                    Log.w(TAG, "⚠️ App downgrade: ${status.fromVersion} → ${status.toVersion}")
                }
                
                is UpgradeStatus.Error -> {
                    Log.e(TAG, "❌ Upgrade check failed: ${status.message}")
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Critical error in upgrade handling: ${e.message}", e)
        }
    }

    companion object {
        private const val TAG = "CleverFerret"
    }
}
