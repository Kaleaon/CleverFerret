package com.universalmedialibrary

import android.app.Application
import dagger.hilt.android.HiltAndroidApp

/**
 * The main Application class for the app.
 *
 * The `@HiltAndroidApp` annotation is essential for Hilt's dependency injection.
 * It triggers Hilt's code generation and creates a dependency container that is attached
 * to the application's lifecycle, making it the parent container for all other containers.
 */
@HiltAndroidApp
class MainApplication : Application()
