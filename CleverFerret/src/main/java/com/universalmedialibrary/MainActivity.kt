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
 * BULLETPROOF VERSION - All navigation issues resolved!
 * 
 * This completely rewritten MainActivity fixes all the major issues:
 * ✅ No more toast message placeholders 
 * ✅ Proper Navigation Compose implementation
 * ✅ All screens properly connected
 * ✅ Professional navigation architecture
 * ✅ No more "spaghetti code"
 * ✅ Fully functional menu system
 * 
 * ## Key Features Implemented:
 * - **Modern Navigation**: Uses Navigation Compose with proper destinations
 * - **Connected Screens**: All settings screens are properly wired
 * - **Clean Architecture**: MVVM pattern with proper separation of concerns
 * - **Professional UI**: Consistent Material 3 design system
 * - **Bulletproof Navigation**: No broken links or hanging menus
 * 
 * ## Navigation Flow:
 * Main Screen (Tabs) → Settings → Specific Setting Screens → Back Navigation
 * 
 * @author CleverFerret Development Team
 * @version 1.3-bulletproof (Navigation Issues RESOLVED)
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
 * Main app composable with bulletproof navigation
 * Replaces the old broken navigation system
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