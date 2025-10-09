package com.universalmedialibrary

import android.app.Application
import com.universalmedialibrary.core.FeatureFlags
import dagger.hilt.android.HiltAndroidApp

@HiltAndroidApp
class CleverFerretApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        // Initialize runtime-configurable feature flags
        FeatureFlags.init(this)
    }
}
