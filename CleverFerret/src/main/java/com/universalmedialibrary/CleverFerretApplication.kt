package com.universalmedialibrary

import android.app.Application
import dagger.hilt.android.HiltAndroidApp

@HiltAndroidApp
class CleverFerretApplication : Application() {
    override fun onCreate() {
        super.onCreate()
    }
}
