package com.universalmedialibrary

import android.app.Application
import dagger.hilt.android.HiltAndroidApp

/**
 * The main application class for CleverFerret.
 *
 * This class is annotated with [@HiltAndroidApp] to enable Hilt dependency injection
 * throughout the application. It serves as the entry point for the dependency injection
 * framework and initializes the application-level components.
 */
@HiltAndroidApp
class MainApplication : Application()