package com.universalmedialibrary

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.Composable
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.navigation.CleverFerretNavigation
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import dagger.hilt.android.AndroidEntryPoint

/**
 * CleverFerret Universal Media Library - Main Activity
 * 
 * This is the main entry point for the CleverFerret Universal Media Library application.
 * 
 * Current Implementation Status:
 * - Basic Navigation Compose setup
 * - Material 3 theming framework
 * - Hilt dependency injection configured
 * - Some UI screens implemented
 * 
 * Note: This application is currently in development. Many features are still being implemented
 * and the codebase contains prototype/stub implementations.
 * 
 * @author CleverFerret Development Team
 * @version 1.0-dev (In Development)
 * @since Android API 26 (Android 8.0)
 */
@AndroidEntryPoint
class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        setContent {
            CleverFerretApp()
        }
    }
}

/**
 * Main app composable with navigation framework
 * Sets up the basic navigation structure using Jetpack Compose
 */
@Composable
fun CleverFerretApp() {
    CleverFerretTheme {
        val navController = rememberNavController()
        
        CleverFerretNavigation(
            navController = navController
        )
    }
}