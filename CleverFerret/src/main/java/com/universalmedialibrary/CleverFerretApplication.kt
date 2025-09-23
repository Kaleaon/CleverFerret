package com.universalmedialibrary

import android.app.Application
import dagger.hilt.android.HiltAndroidApp

/**
 * CleverFerret Universal Media Library Application Class
 */
@HiltAndroidApp
class CleverFerretApplication : Application() {
    
    override fun onCreate() {
        super.onCreate()
        // Application initialization
    }
}