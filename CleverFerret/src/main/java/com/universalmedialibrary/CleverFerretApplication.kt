package com.universalmedialibrary

import android.app.Application
import android.util.Log
import cat.ereza.customactivityoncrash.config.CaocConfig
import com.universalmedialibrary.data.migration.AppUpgradeManager
import com.universalmedialibrary.data.migration.BackupRestorationManager
import com.universalmedialibrary.data.migration.UpgradeStatus
import com.universalmedialibrary.debug.DebugReportingService
import com.universalmedialibrary.services.ambient.ThemedCollections
import com.universalmedialibrary.utils.CrashReporter
import com.universalmedialibrary.utils.CrashActivity
import com.universalmedialibrary.utils.ErrorLogger
import dagger.hilt.android.HiltAndroidApp
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * CleverFerretApplication - Main application class
 * 
 * Manages critical app-wide initialization and lifecycle operations:
 * - Hilt dependency injection setup via [@HiltAndroidApp]
 * - App upgrade detection and automatic backup creation
 * - Database migration handling with data protection
 * - User library preservation across version updates
 * 
 * Safety Features:
 * - Automatic backups before any database migrations
 * - Upgrade status tracking and logging
 * - Restoration support in case of migration failures
 * - Never wipes user data during upgrades
 * 
 * @see AppUpgradeManager for upgrade handling logic
 * @see BackupRestorationManager for backup/restore operations
 */
@HiltAndroidApp
class CleverFerretApplication : Application() {

    @Inject
    lateinit var appUpgradeManager: AppUpgradeManager
    
    @Inject
    lateinit var backupRestorationManager: BackupRestorationManager
    
    @Inject
    lateinit var debugReportingService: DebugReportingService
    
    @Inject
    lateinit var crashReporter: CrashReporter

    private val applicationScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    override fun onCreate() {
        super.onCreate()
        
        Log.i(TAG, "Clever Ferret initializing...")
        
        // Initialize themed sound collections
        ThemedCollections.initialize()
        Log.d(TAG, "Ambient themed collections initialized")
        
        // Initialize crash handler
        initializeCrashHandler()
        
        // Initialize debug reporting (for debug builds)
        initializeDebugReporting()
        ErrorLogger.initialize(crashReporter)

        // CRITICAL: Check for app upgrades and protect user data
        applicationScope.launch {
            handleAppUpgrade()
        }
    }
    
    /**
     * Initialize debug reporting service for crash/error tracking
     * Only fully active in debug builds
     */
    private fun initializeDebugReporting() {
        if (BuildConfig.DEBUG_REPORTING_ENABLED) {
            debugReportingService.initialize()
            Log.d(TAG, "Debug reporting service initialized")
            
            // Log app startup
            debugReportingService.logInfo(TAG, "App started - ${BuildConfig.VERSION_NAME} (${BuildConfig.VERSION_CODE})")
            debugReportingService.logInfo(TAG, "Build time: ${BuildConfig.BUILD_TIME}")
            debugReportingService.logInfo(TAG, "Git commit: ${BuildConfig.GIT_COMMIT}")
        }
    }
    
    /**
     * Initialize custom crash handler for better error reporting
     */
    private fun initializeCrashHandler() {
        CaocConfig.Builder.create()
            .backgroundMode(CaocConfig.BACKGROUND_MODE_SHOW_CUSTOM)
            .enabled(true)
            .showErrorDetails(true)
            .showRestartButton(true)
            .trackActivities(true)
            .minTimeBetweenCrashesMs(2000)
            .errorActivity(CrashActivity::class.java)
            .apply()
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
