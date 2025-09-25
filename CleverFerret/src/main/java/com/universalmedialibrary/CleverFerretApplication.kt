package com.universalmedialibrary

import android.app.Application
import android.util.Log
import dagger.hilt.android.HiltAndroidApp

/**
 * CleverFerret Universal Media Library Application Class
 * Enhanced with error handling and proper initialization
 */
@HiltAndroidApp
class CleverFerretApplication : Application() {
    
    companion object {
        private const val TAG = "CleverFerretApp"
    }
    
    override fun onCreate() {
        try {
            super.onCreate()
            Log.d(TAG, "CleverFerret Application starting...")
            
            // Initialize application components
            initializeApp()
            
            Log.d(TAG, "CleverFerret Application initialized successfully")
        } catch (e: Exception) {
            Log.e(TAG, "Error initializing CleverFerret Application", e)
            // Don't crash, let the app continue with degraded functionality
        }
    }
    
    private fun initializeApp() {
        // Application initialization goes here
        // This is where we would initialize things like:
        // - Database initialization
        // - Preference managers
        // - Third-party SDKs
        Log.d(TAG, "App initialization complete")
    }
}